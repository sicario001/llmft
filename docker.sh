#!/bin/bash
# --build the docker image
# --run the docker image

# Base path /home/rayyan/Projects/GaTech/CS7643/project/
# base_path="/home/anmol/gt/dl/project"
base_path="/home/user/dl"

# Build the docker image
if [[ $1 == "--build" ]]; then
    docker build -f ./docker/Dockerfile --build-arg USER_UID=$UID --build-arg USER_NAME=$(id -un) -t llmft:22.08-py3 .
fi

# Run the docker container
if [[ $1 == "--run" ]]; then
    docker run -it --rm --gpus=all --pid=host --ipc=host --user user --env-file ./docker/dev.env \
        -v $base_path/llmft:/llmft \
        -v $base_path/datasets:/datasets \
        -v $base_path/logfiles:/logfiles \
        -v $base_path/.cache:/cache \
        llmft:22.08-py3
fi

# Display help message if the arguments are invalid
if [[ $1 != "--build" ]] && [[ $1 != "--run" ]]; then
  echo "Invalid argument: $1"
  echo "Usage: ./docker.sh [build|run]"
  exit 1
fi