clear
export HF_ENDPOINT=https://hf-mirror.com
# export HF_HUB_ENABLE_HF_TRANSFER=1

model_name=openai/whisper-medium
dir=/home/jye/huggingface/pretrained_model
cache_dir=/home/jye/.cache/huggingface/pretrained_model/

python download_model.py -m ${model_name} --dir ${dir} --cache_dir ${cache_dir}