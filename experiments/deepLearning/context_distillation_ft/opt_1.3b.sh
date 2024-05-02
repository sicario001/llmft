export PROJECT_DIR=/llmft
source $PROJECT_DIR/scripts/misc/setup.sh

export OUTPUT_DIR=$OUTPUT_DIR/context_distillation_ft

# args: task_name, max_train_samples, epochs, warmup_ratio, bsz, num_gpus, learning_rate, model_name_or_path, port
bash $PROJECT_DIR/scripts/pattern_verbalizer_ft/mnli/run.sh mnli 100 40 0.5 4 1 1e-5 facebook/opt-1.3b 60000 True $PROJECT_DIR/logfiles/in_context_eval_gpt3-ft-mfacebook-Train100-labels/opt-1.3b-c32-s3/predict_results_mnli.csv