from modelscope.hub.snapshot_download import snapshot_download

model_id = "iic/blsp"
cache_dir = "/home/jye/huggingface/pretrained_model"
model = snapshot_download(model_id=model_id, cache_dir=cache_dir)