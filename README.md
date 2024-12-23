# Akallama-eval
## Eval task
| task | description | link |
|---|------|------|
| csatqa | Tasks related to SAT and other standardized testing questions for academic assessment. |	|
| haerae | Tasks focused on assessing detailed factual and historical knowledge. | https://github.com/EleutherAI/lm-evaluation-harness/blob/main/lm_eval/tasks/haerae/README.md |
| kobest | A collection of tasks designed to evaluate understanding in Korean language.	|	https://github.com/EleutherAI/lm-evaluation-harness/blob/main/lm_eval/tasks/kobest/README.md |
| LogicKor | 한국어 언어모델 다분야 사고력 벤치마크 | https://github.com/instructkr/LogicKor |

## Result
[doc link](https://docs.google.com/spreadsheets/d/1OEK7lBX7c6KW8QdFfYUD5RkjL9FiUcK3iSoKLaSGHws/edit?gid=0#gid=0)

## How to
1. lm-evaluation-harness
- Install
```
git clone --depth 1 https://github.com/EleutherAI/lm-evaluation-harness
cd lm-evaluation-harness
pip install -e .
```
```
pip install lm_eval[wandb]
pip install wandb==0.18.0
```
- Evaluation
    - Model : checkpoint 24, 48, 72, meta-llama/Llama-3.2-3B-Instruct, Qwen/Qwen2.5-3B-Instruct, LGAI-EXAONE/EXAONE-3.5-2.4B-Instruct
    - csatqa, haerae, kobest (dropped - kmmlu : too big, kbl : legal, kormedmcqa : medical)
```
bash harness_all_eval.sh
```

2. LogicKor
- Install
```
git clone https://github.com/instructkr/LogicKor.git
pip install vllm openai
```
- Evaluation
    - Model : checkpoint 24, 48, 72, meta-llama/Llama-3.2-3B-Instruct, Qwen/Qwen2.5-3B-Instruct, LGAI-EXAONE/EXAONE-3.5-2.4B-Instruct
    - Before run, modify `evaluator.py`
    ```
    line 146 : output_file = output_dir / file_path.relative_to(Path(args.model_output_dir).parent.parent)
    line 173 : output_file_path = output_dir / file_path.relative_to(input_dir.parent.parent)
    ```

```
bash logic_all_eval.sh
```