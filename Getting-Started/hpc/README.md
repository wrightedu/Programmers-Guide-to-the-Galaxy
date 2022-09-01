# HPC resources at Wright State University

* Overview and resources
* Access
 * [VPN install quick link](http://www.wright.edu/information-technology/virtual-private-network-vpn#getting-started)
* Scheduling a job (SLURM)
* Containers (Singularity)

## Overview and resources

  The CSE HPC cluster has the following nodes available:
  
  * 24x CPU compute nodes (16 CPU cores and 180GB RAM, no GPU)
  * 1x NVIDIA P100 node (20 CPU cores, 250GB RAM, 8x NVIDIA p100 GPUs)
  * 2x NVIDIA A100 nodes (56 CPU cores, 252GB RAM, 1x NVIDIA a100 GPU per node)

  The NVIDIA P100 has 3584 cuda cores and 16GB vRAM [P100 datasheet](https://www.nvidia.com/content/dam/en-zz/Solutions/Data-Center/tesla-p100/pdf/nvidia-tesla-p100-PCIe-datasheet.pdf)
  The NVIDIA A100 has 6912 cuda cores and 80GB vRAM [A100 datasheet](https://www.nvidia.com/content/dam/en-zz/Solutions/Data-Center/a100/pdf/nvidia-a100-datasheet-us-nvidia-1758950-r4-web.pdf)

## Access

  All WSU engineering students can access this system via SSH at fry.cs.wright.edu.

  You can adapt the following in order to connect to this system using your campus credentials: 

  ```
  ssh w###abc@fry.cs.wright.edu
  ```

  Access to any compute node via SSH is blocked unless a user has an active SLURM job scheduled (see using SLURM below).

  Access from off campus requires use of the [campus VPN](http://www.wright.edu/information-technology/virtual-private-network-vpn#getting-started)

## Using SLURM

  This guide was [templated from here,](https://support.ceci-hpc.be/doc/_contents/QuickStart/SubmittingJobs/SlurmTutorial.html) which goes into more detail regarding many of these commands.
  Another greate resource is the [Slurm Quick Start User Guide](https://slurm.schedmd.com/quickstart.html) which has links to other good slurm documentation.

  Resource sharing on a High Performance Computer (HPC) system is typically organized by a pieve of software called a resource manager or job scheduler.  Users submit jobs which are scheduled and allocated resources (CPU cores, GPU, RAM, time, etc.) by the resource manager.

  [Slurm](https://slurm.schedmd.com/) is the scheduler that we are using here at Wright State.  In this document we will cover the basics of interacting with slurm in order to figure out what resources are available and to submit jobs for computation on a cluster.

  SLURM provides tools to schedule your computational jobs on this shared resource.  Here are the most important commands and their explanation, you can read more about them using each commands `man` page (example: `man sinfo`).

  * `sinfo` show basic information on the system resources
  * `sinfo -lN` show detailed information on all nodes
  * `squeue` show information on current jobs in the queue
  * `scancel <job ID>` cancel a specified job (job must belong to that user)
  * `salloc` request an immediate allocation, typically used to SSH into a system
  * `sbatch </path/to/jobscript>` allows a user to request a set of resources and automatically start their specified job once those resources are next available.
  * `srun <command>` immediately request a resource and run the specified command

#### Example GPU job

  Here is an example job submission script that can be submitted with `sbatch`:

```bash
#!/bin/bash

#SBATCH --job-name=example    #for tracking job name
#SBATCH --partition=a100      #what type of compute node you need
#SBATCH --gres=gpu:1          #how many GPU's needed on that node (only one availabe on each a100)

#SBATCH --output=/home/%u/%x-%u-%j.out  #specify output file in users home directory
#SBATCH --time=5:00           #ammount of time requested (job will be killed if it runs longer than this)

srun nvidia-smi

```

The above job when submitted will run `nvidia-smi` on one of the a100 nodes and store the output in a file named `example-username-jobid.out` in your home directory.

## Singularity
