#!/bin/bash
#
# 01_basic_cpu.sbatch
# The simplest useful job: one task, one CPU core, a time limit, and a memory limit.
# Use for: serial programs, quick scripts, preprocessing.
#
# Submit:   sbatch 01_basic_cpu.sbatch
# Monitor:  squeue -u $USER
# Cancel:   scancel <jobid>

#SBATCH --job-name=basic_cpu
#SBATCH --output=/home/%u/%x-%u-%j.out   # %x=job name, %u=user, %j=job id
#SBATCH --error=/home/%u/%x-%u-%j.err    # keep stderr separate (optional)
#SBATCH --ntasks=1                       # one process
#SBATCH --cpus-per-task=1                # one core for that process
#SBATCH --mem=4G                         # total memory for the job
#SBATCH --time=00:30:00                  # HH:MM:SS; the job is killed when this runs out
# No --partition line: the job goes to the default (CPU) partition.

# Fail fast: stop on errors and on unset variables
set -euo pipefail

# Blank example container, built from cpu-example.def
CONTAINER=/home/$USER/containers/cpu-example.sif

echo "Job $SLURM_JOB_ID started on $(hostname) at $(date)"

srun apptainer exec "$CONTAINER" python3 my_script.py --input data.csv

echo "Finished at $(date)"
