#!/bin/bash
#
# multicore-cpu.sbatch
# One process that uses many cores on a single node.
# Use for: Python multiprocessing, OpenMP, NumPy/MKL, make -j, etc.
#
# Key idea: ask for ONE task with MANY cpus-per-task, then tell your
# program how many cores it actually received. Don't hard-code core counts.
# CSE CPU nodes have 16 cores and 180GB RAM, so 16 is the ceiling here.

#SBATCH --job-name=multicore
#SBATCH --output=/home/%u/%x-%u-%j.out
#SBATCH --nodes=1                        # all cores must be on the same machine
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8                # cores for the single process
#SBATCH --mem=32G
#SBATCH --time=02:00:00

set -euo pipefail

# Small Python container, built from example_apptainer_definitions/cpu-example.def
CONTAINER=/home/$USER/containers/cpu-example.sif

# Make threaded libraries respect the allocation instead of grabbing every core.
# Apptainer passes host environment variables into the container by default.
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export MKL_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OPENBLAS_NUM_THREADS=$SLURM_CPUS_PER_TASK

echo "Running with $SLURM_CPUS_PER_TASK cores on $(hostname)"

# In Python, read the count with: int(os.environ["SLURM_CPUS_PER_TASK"])
# e.g. multiprocessing.Pool(processes=int(os.environ["SLURM_CPUS_PER_TASK"]))
srun apptainer exec "$CONTAINER" python3 parallel_script.py
