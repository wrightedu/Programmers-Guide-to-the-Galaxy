#!/bin/bash
#
# ollama.sbatch
# Start an Ollama LLM server on a GPU node, pull a model, and ask it a question.
# Use for: trying out local LLMs, or as a starting point for a job that talks
# to Ollama's HTTP API.
#
# Build the container first (see example_apptainer_definitions/ollama.def):
#   mkdir -p ~/containers
#   apptainer build --fakeroot ~/containers/ollama.sif ollama.def
#
# Submit:   sbatch ollama.sbatch

#SBATCH --job-name=ollama-demo
#SBATCH --output=/home/%u/%x-%u-%j.out
#SBATCH --partition=p100
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=1:00:00

set -euo pipefail

CONTAINER=/home/$USER/containers/ollama.sif
MODELS_DIR=$HOME/.ollama/models
MODEL=llama3

mkdir -p "$MODELS_DIR"

# Several jobs can share one GPU node, so don't use Ollama's fixed default port
# (11434). Pick a port from the job id instead so two jobs never collide.
PORT=$(( 20000 + SLURM_JOB_ID % 20000 ))
export APPTAINERENV_OLLAMA_HOST=127.0.0.1:$PORT
echo "Ollama will listen on $APPTAINERENV_OLLAMA_HOST"

# Start the server in the background and stop it when the job ends
apptainer run --nv -B "$MODELS_DIR:/root/.ollama" "$CONTAINER" &
SERVER_PID=$!
trap 'kill $SERVER_PID 2>/dev/null || true' EXIT

# Wait until the server answers (up to ~2 minutes) instead of a fixed sleep
for _ in $(seq 1 60); do
    if apptainer exec "$CONTAINER" ollama list >/dev/null 2>&1; then
        break
    fi
    sleep 2
done

ollama_cmd() {
    apptainer exec --nv -B "$MODELS_DIR:/root/.ollama" "$CONTAINER" ollama "$@"
}

ollama_cmd pull "$MODEL"
ollama_cmd run "$MODEL" "What is the answer to the Ultimate Question of Life, the Universe, and Everything, and why is it taking so long to calculate?"

# Instead of `ollama run`, you could start another program here that talks to
# Ollama's HTTP API at http://$APPTAINERENV_OLLAMA_HOST
