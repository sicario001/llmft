#!/usr/bin/env bash

export PROJECT_DIR=/llmft
source $PROJECT_DIR/scripts/misc/setup.sh

# -----------------------------------------------------------------------------------------------------------------------
# run ICL experiments for MNLI
# -----------------------------------------------------------------------------------------------------------------------

export NCCL_DEBUG=INFO

# Run with RECORD_TRAIN_LABELS=True and RECORD_TRAIN_LABELS=False
export RECORD_TRAIN_LABELS=False

export MODEL_LOCAL_PATH=/logfiles/base_ft/facebook-opt-1.3b_mnli-32_0_0_2024-04-28-13-53-42/checkpoint-320 # Path to the model
bash $PROJECT_DIR/scripts/in_context/mnli/run_gpt3.sh mnli 32 facebook/opt-1.3b 1 60000 0

export MODEL_LOCAL_PATH=/logfiles/base_ft/facebook-opt-1.3b_mnli-32_1_0_2024-04-28-19-37-28/checkpoint-320 # Path to the model
bash $PROJECT_DIR/scripts/in_context/mnli/run_gpt3.sh mnli 32 facebook/opt-1.3b 1 60000 1

export MODEL_LOCAL_PATH=/logfiles/base_ft/facebook-opt-1.3b_mnli-32_2_0_2024-04-29-01-26-13/checkpoint-320 # Path to the model
bash $PROJECT_DIR/scripts/in_context/mnli/run_gpt3.sh mnli 32 facebook/opt-1.3b 1 60000 2

# Add for seed 3 and 4
export MODEL_LOCAL_PATH=/logfiles/base_ft/facebook-opt-1.3b_mnli-32_3_0_2024-04-30-00-46-43/checkpoint-320 # Path to the model
bash $PROJECT_DIR/scripts/in_context/mnli/run_gpt3.sh mnli 32 facebook/opt-1.3b 1 60000 3

export MODEL_LOCAL_PATH=/logfiles/base_ft/facebook-opt-1.3b_mnli-32_4_0_2024-04-30-06-28-30/checkpoint-320 # Path to the model
bash $PROJECT_DIR/scripts/in_context/mnli/run_gpt3.sh mnli 32 facebook/opt-1.3b 1 60000 4
