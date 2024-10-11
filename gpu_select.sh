set -v
num_gpus=2
#region select gpus
while true; do
    selected_gpus=$(python - <<END
import GPUtil

def get_free_gpus(num_gpus):
    try:
        available_gpus = GPUtil.getAvailable(order="memory", limit=num_gpus, maxLoad=0.1, maxMemory=0.1)
        if len(available_gpus) >= num_gpus:
            return available_gpus[:num_gpus]
        else:
            return None
    except Exception as e:
        print("Error while GPU selection:", str(e))
        return None

selected_gpus = get_free_gpus($num_gpus)  # Select the specified number of GPUs
if selected_gpus is not None:
    print(','.join(map(str, selected_gpus)))
else:
    print("Insufficient available GPUs.")
END
    )

    if [ ! -z "$selected_gpus" ] && [ "$selected_gpus" != "Insufficient available GPUs." ]; then
        export CUDA_VISIBLE_DEVICES=$selected_gpus
        echo "Setting GPU number to: $num_gpus"
        echo "Selected GPUs: $selected_gpus"
        break  # Break the loop if GPUs are available
    else
        echo "No available GPUs. Waiting for 1 minute..."
        sleep 60  # Wait for 1 minute before checking again
    fi
done
#endregion
