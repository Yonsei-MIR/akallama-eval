#!/bin/bash

echo "Running eval for model $1"
echo "Running eval for task $2"

cd ..

lm_eval --model hf \
    --model_args pretrained=$1,dtype="float16",trust_remote_code=True \
    --tasks $2 \
    --batch_size auto:4 \
    --output_path harness_output/$2 \
    --wandb_args project=harness-korean-eval \
    --log_samples