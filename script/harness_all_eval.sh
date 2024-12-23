#!/bin/bash

for id in {24,48,72,meta-llama/Llama-3.2-3B-Instruct,Qwen/Qwen2.5-3B-Instruct,LGAI-EXAONE/EXAONE-3.5-2.4B-Instruct}
do
    ## if model is a number, then change it to correponding path
    if [[ $id =~ ^[0-9]+$ ]]
    then
        model="/scratch2/hard2251/workspace/llm-agent/models/pilot-3b/checkpoint-$id"
    else
        model=$id
    fi

    for task in {csatqa,haerae,kobest}
    do
        sbatch -q big_qos --gres=gpu:1 harness_eval.sh $id $model $task
    done
done