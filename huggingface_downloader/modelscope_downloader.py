#region version 1 default save path
# from modelscope import snapshot_download
# model_ids=[]
# for model_id in model_ids:
#     model_dir = snapshot_download(model_id)
#endregion

#region version 2
from modelscope import snapshot_download
import argparse
import os
# LLM-Research/Llama-3.2-3B-Instruct
# LLM-Research/Llama-3.2-1B-Instruct
# LLM-Research/Mistral-7B-Instruct-v0.3

parser = argparse.ArgumentParser(description="Download a transformers model from modelscope.")
parser.add_argument("--model_id", "-m", type=str, default="LLM-Research/Mistral-7B-Instruct-v0.3", required=True)
parser.add_argument("--dir", type=str, default="/home/lxiang/.cache/modelscope/hub/", help="Local dir to save the model")
args = parser.parse_args()

if args.dir is not None:
    args.dir = os.path.join(args.dir, args.model_id)
os.makedirs(args.dir, exist_ok=True)

model = snapshot_download(model_id=args.model_id, cache_dir=args.dir)
#endregion
