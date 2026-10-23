#!/bin/bash
#
# gpu-with-apptainer.sbatch
# A GPU job (e.g. PyTorch training) run inside an Apptainer container.
# Use for: deep learning, CUDA code, anything that needs the A100.
#
# The CSE a100 nodes each have 1x A100 (80GB), 56 cores, and 252GB RAM.
# Ask for CPU cores too: data loaders starve the GPU without them.

#SBATCH --job-name=gpu_train
#SBATCH --output=/home/%u/%x-%u-%j.out
#SBATCH --partition=a100                 # which hardware
#SBATCH --gres=gpu:1                     # GPUs per node (max 1 on a100)
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8                # for DataLoader workers, preprocessing
#SBATCH --mem=64G
#SBATCH --time=12:00:00

set -euo pipefail

# PyTorch container, built from example_apptainer_definitions/pytorch.def
CONTAINER=/home/$USER/containers/pytorch.sif

# Record which GPU you got, useful when debugging
nvidia-smi

# Make sure the checkpoint directory exists before the program writes to it
CHECKPOINT_DIR=/home/$USER/checkpoints/$SLURM_JOB_ID
mkdir -p "$CHECKPOINT_DIR"

# --nv  : expose the GPU and NVIDIA driver libraries inside the container
# -B    : bind extra host paths (only /home/$USER, /tmp and the current
#         directory are bound by default)
srun apptainer exec --nv \
    -B /scratch:/scratch \
    "$CONTAINER" \
    python3 train.py \
        --data /scratch/$USER/dataset \
        --workers $SLURM_CPUS_PER_TASK \
        --checkpoint-dir "$CHECKPOINT_DIR"
