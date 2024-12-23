#!/bin/bash

cd ../LogicKor

# generate inference
echo "Generating inference result for $1 on generated/$2"
python generator.py --model $1 --gpu_devices 0 --model_len 4200
# evaluate with openai
echo "Evaluating with gpt-4-1106-preview for $1 on evaluated/$2"
python evaluator.py -o ./generated/$2 -k sk-... -t 30 -j gpt-4-1106-preview
# check result
echo "Checking result for $1"
python score.py -p ./evaluated/$2/default.jsonl