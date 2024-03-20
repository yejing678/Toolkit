from modelscope import snapshot_download

model_id = "iic/blsp_lslm_7b"
cache_dir = "/home/jye/huggingface/pretrained_model"
model = snapshot_download(model_id=model_id, cache_dir=cache_dir)