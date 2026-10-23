#!/bin/bash
#
# array.sbatch
# Run the same program many times with different inputs, as ONE submission.
# Use for: parameter sweeps, processing many files, repeated random seeds.
#
# Each array element is an independent job with its own SLURM_ARRAY_TASK_ID.
# Submit once with sbatch; Slurm schedules each element on its own.

#SBATCH --job-name=sweep
#SBATCH --output=/home/%u/%x-%A_%a.out   # %A=array job id, %a=element index (one log each)
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --time=00:20:00
#SBATCH --array=0-7%4                    # elements 0..7, at most 4 running at once

set -euo pipefail

# Small Python container, built from example_apptainer_definitions/cpu-example.def
CONTAINER=/home/$USER/containers/cpu-example.sif

# --- Pattern A: list of parameter values -----------------------------------
# Bash arrays are 0-indexed, so the array range starts at 0 to match.
ARGS=(0.05 0.25 0.5 1 2 5 100 1000)
VALUE=${ARGS[$SLURM_ARRAY_TASK_ID]}

echo "Element $SLURM_ARRAY_TASK_ID of job $SLURM_ARRAY_JOB_ID using value $VALUE"
srun apptainer exec "$CONTAINER" python3 my_program.py "$VALUE"

# --- Pattern B: one input file per element (use instead of Pattern A) ------
# Put one filename per line in inputs.txt, then set --array=1-<number of lines>.
# INPUT=$(sed -n "${SLURM_ARRAY_TASK_ID}p" inputs.txt)
# srun apptainer exec "$CONTAINER" python3 process.py "$INPUT"
