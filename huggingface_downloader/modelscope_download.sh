# git clone https://www.modelscope.cn/xtuner/llava-llama-3-8b-v1_1.git

models=(
    "LLM-Research/Llama-3.2-3B-Instruct"
    "LLM-Research/Llama-3.2-1B-Instruct"
    "LLM-Research/Mistral-7B-Instruct-v0.3"
)

for model_name in "${models[@]}"
do
    python modelscope_downloader.py -m "${model_name}"
done
