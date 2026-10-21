#!/bin/bash
#SBATCH --job-name=ollama-demo
#SBATCH --partition=p100
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=1:00:00
#SBATCH --output=output.txt

mkdir -p "$HOME/.ollama/models"

singularity run --fakeroot --nv -B "$HOME/.ollama/models:/root/.ollama" ollama.sif &
sleep 15 # Give ollama a second.

singularity exec --nv -B "$HOME/.ollama/models:/root/.ollama" ollama.sif ollama pull llama3
singularity exec --nv -B "$HOME/.ollama/models:/root/.ollama" ollama.sif ollama run llama3 "What is the answer to the Ultimate Question of Life, the Universe, and Everything, and why is it taking so long to calculate?"

# Otherwise you could run another hpc app that uses ollama's api for example. Connecting to it via the default hostname and port.
