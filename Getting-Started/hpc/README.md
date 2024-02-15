# HPC resources at Wright State University

* Overview and resources
* [Access](README.md#access)
 * [VPN install quick link](http://www.wright.edu/information-technology/virtual-private-network-vpn#getting-started)
* [Scheduling a job (SLURM)](README.md#slurm)
* [Common #SBATCH options](README.md#common-sbatch-options)
* [Containers (Singularity)](README.md#singularity)
  * [Installing Singularity](README.md#installing-singularity)
  * [Quick install shortcut](https://docs.sylabs.io/guides/latest/user-guide/quick_start.html#quick-installation-steps)
  * [Building a container](README.md#building-containers)
  * [Using containers with GPU (the `-nv` option)](README.md#nvidia-gpu-support)

## Overview and resources

  The CSE HPC cluster has the following nodes available:
  
  * 24x CPU compute nodes (16 CPU cores and 180GB RAM, no GPU)
  * 1x NVIDIA P100 node (20 CPU cores, 250GB RAM, 8x NVIDIA p100 GPUs)
    * The NVIDIA P100 has 3584 cuda cores and 16GB vRAM [P100 datasheet](https://www.nvidia.com/content/dam/en-zz/Solutions/Data-Center/tesla-p100/pdf/nvidia-tesla-p100-PCIe-datasheet.pdf)
  * 2x NVIDIA A100 nodes (56 CPU cores, 252GB RAM, 1x NVIDIA a100 GPU per node)
    * The NVIDIA A100 has 6912 cuda cores and 80GB vRAM [A100 datasheet](https://www.nvidia.com/content/dam/en-zz/Solutions/Data-Center/a100/pdf/nvidia-a100-datasheet-us-nvidia-1758950-r4-web.pdf)

## Access

  All WSU engineering students can access this system via SSH at fry.cs.wright.edu.

  You can adapt the following in order to connect to this system using your campus credentials: 

  ```bash
  ssh w###abc@fry.cs.wright.edu
  ```

  Access to any compute node via SSH is blocked unless a user has an active SLURM job scheduled (see using SLURM below).

  Access from off campus requires use of the [campus VPN](http://www.wright.edu/information-technology/virtual-private-network-vpn#getting-started)

## SLURM

  This guide was [templated from here,](https://support.ceci-hpc.be/doc/_contents/QuickStart/SubmittingJobs/SlurmTutorial.html) which goes into more detail regarding many of these commands.
  Another greate resource is the [Slurm Quick Start User Guide](https://slurm.schedmd.com/quickstart.html) which has links to other good slurm documentation.

  Resource sharing on a High Performance Computer (HPC) system is typically organized by a piece of software called a resource manager / job scheduler.  Users submit jobs which are scheduled and allocated resources (CPU cores, GPU, RAM, time, etc.) by the resource manager.  **You cannot access any resources on this system without an active Slurm job.**

  [Slurm](https://slurm.schedmd.com/) is the scheduler that we are using here at Wright State.  In this document we will cover the basics of interacting with slurm in order to figure out what resources are available and to submit jobs for computation on a cluster.

  Slurm provides tools to schedule your computational jobs on this shared resource.  Here are the most important commands and their explanation, you can read more about them using each commands `man` page (example: `man sinfo`).

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

#### Common sbatch options

```bash
#SBATCH --job-name=<JOB_NAME>             #for tracking job name
#SBATCH --time=<AMOUNT>                   #amount of time requested (job will be killed if it runs longer than this)
  # Acceptable time formats include:
     # <minutes>
     # <minutes:seconds>
     # <hours:minutes:seconds>
     # <days-hours>
     # <days-hours:minutes>
     # <days-hours:minutes:seconds>
#SBATCH --partition=<PARTITION_NAME>      #Partitions determine what hardware you request
#SBATCH --gres=gpu:<COUNT>                #for requesting a GPU
#SBATCH --output=/home/%u/%x-%u-%j.out    #Send output to ~/
#SBATCH --array=<MIN-MAX>
  # reference with $SLURM_ARRAY_TASK_ID
```

I will add more as I find cool options used in jobs shared with me!

## Singularity

Singularity is the container solution we use on the WSU HPC environment. It allows users to install and configure their own dev stack and transfer it between systems running singularity, greatly increasing portability and reducing the *"But it was just working on my computer"* factor. ;)

#### Installing Singularity

Using your own linux system where you have root access, follow the guide here:  [Quick Installation steps](https://docs.sylabs.io/guides/latest/user-guide/quick_start.html#quick-installation-steps)

#### Building Containers

The `singularity build` command is used to create singularity containers.  With it you specfy the output container image and a target input to build the contianer from.

```
singularity build <OUTPUT-IMAGE> <INPUT-BUILDFILE>
```

The `OUTPUT-IMAGE` can produce containers in several different formats, the most common are:
* `my-container.simg` compressed, read-only, squashfs files system suitable for production (default)
* ` --sandbox /my/container/directory/` writable chroot directory called a sandbox for interactive development (`--sandbox` option **GOOD**)

The `INPUT-BUILDFILE` is what specifies what will go into the container and can be one of the following:
* URI beginning with `shub://` to build from Singularity Hub
* URI beginning with `docker://` to build from Docker Hub
* path to an existing container file (`.img`, `.simg`, or `.sif`)
* path to a directory of a sandbox container (an existing container built with `--sandbox`)
* path to an archive in `.tar` or `.tar.gz`
* path to a singularity recipe BUILDFILE

Example `singularity build` commands:
```bash
sudo singularity build --sandbox /home/mkijowski/ubuntu-container/ docker://ubuntu
## Builds a sandbox container directly from a dockerhub container

sudo singularity build ubuntu.sif /home/mkijowski/ubuntu-container/
## Converts a previoulsy created sandbox container to a static .sif containter
```
#### Using and editing containers with `singularity shell` 

The `sudo singularity shell --writable /my/container/directory/` launches a shell inside the container from which we can continue our software installation and testing.  Note: the `--writable` flag requires sudo privileges, without `--writable` the container would be read only (even though it is a `--sandbox` container.

Once you are finished installing and testing your software, do not forget to convert your `--sandbox` container back to a `.simg` with 
`sudo singularity build my-container.simg /my/container/directory/`

#### Advanced Singularity topics

##### [Singularity definition file](### Using and editing containers with `singularity shell` 
The `sudo singularity shell --writable /my/container/directory/` launches a shell inside the container from which we can continue our software installation and testing.  Note: the `--writable` flag requires sudo privileges, without `--writable` the container would be read only (even though it is a `--sandbox` container.

Once you are finished installing and testing your software, do not forget to convert your `--sandbox` container back to a `.simg` with 
`sudo singularity build my-container.simg /my/container/directory/`

##### Binding with `-B`

By default the only directory shared between the host and container is /home/$USER.  This means other user's home directories are not accessible from within the container (nor are other useful directories like /scratch).
To remedy this you can specify bind paths with the `--bind` or `-B` option.  
The format for bind paths is as follows:

```
singularity shell -B src:dest cuda.simg
```

Where `src` is a path on the host and `dest` is a path within the container.  If no `dest` path is provided it will use the same path as `src` inside the container.

##### Nvidia GPU support

Singularity containers support direct access to a local GPU only when given the `--nv` flag.

```
singularity shell --nv cuda.simg
```

This does more than just allow access to the GPU, it also binds a number of specified nvidia and cuda libraries into the container in the following directory:

```
/.singularity.d/lib/
```

Note: this path may need to be added to your default paths for cuda to work (in ubuntu you can copy the `singularity-nvidia.conf` file in this git repository to `/etc/ld.so.conf.d/singularity-nvidia.conf`.  You may need to reload the container for this to take effect.


