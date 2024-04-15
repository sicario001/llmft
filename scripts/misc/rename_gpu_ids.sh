#! /bin/bash

device_ids=""
# Get the number of GPUs from nvidia-smi
num_gpus=$(nvidia-smi --query-gpu=count --format=csv,noheader | wc -l)
echo "num_gpus: $num_gpus"

# Get the GPU IDs
for i in $(seq 0 $((num_gpus - 1))); do
    device_ids+="$i,"
done
device_ids=${device_ids::-1}
echo "device_ids: $device_ids"

export CUDA_VISIBLE_DEVICES=$device_ids
echo "now: CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES}"