# HPC resources at Wright State University

* [Overview and resources](README.md#overview-and-resources)
* [Access](README.md#access)
  * [VPN install quick link](http://www.wright.edu/information-technology/virtual-private-network-vpn#getting-started)
* [Scheduling a job (SLURM)](README.md#slurm)
* [Common #SBATCH options](README.md#common-sbatch-options)
* [Containers (Apptainer)](README.md#apptainer)
  * [Coming from Singularity?](README.md#coming-from-singularity)
  * [Installing Apptainer](README.md#installing-apptainer)
  * [Building a container](README.md#building-containers)
  * [Using containers in a Slurm job](README.md#using-containers-in-a-slurm-job)
  * [Using containers with GPU (the `--nv` option)](README.md#nvidia-gpu-support)

## Overview and resources

  The CSE HPC cluster can be accessed via SSH by all WSU engineering students, faculty, and staff using their campus accounts.  
  Usage and metrics are monitored but access to even the most advanced GPU is available to any student who has a need for such resources. 
  
  The CSE HPC cluster has the following nodes available:
  
  * 24x CPU compute nodes (16 CPU cores and 180GB RAM, no GPU)
  * 2x high memory nodes  (64 CPU cores, 1.5TB RAM per node, no GPU)
  * 1x NVIDIA P100 node (20 CPU cores, 250GB RAM, 8x NVIDIA p100 GPUs)
  * 2x NVIDIA A100 nodes (56 CPU cores, 252GB RAM, 1x NVIDIA a100 GPU per node)
  * 2x NVIDIA L40S nodes (64 CPU cores, 340GB RAM, 8x NVIDIA L40S GPUs per node)
  * 1x NVIDIA H200 node  (64 CPU cores, 340GB RAM, 4x NVIDIA H200 GPUs)

  Each node has access to a shared `/home` directory that is running on a high speed BeeGFS file system with 60TB of storage available.  They are connected to this storage and to each other with a 
  200 GB/s Omnipath network in addition to a 10GB/s ethernet network.

  GPU information:
  
  * The NVIDIA P100 has 3584 CUDA cores and 16GB vRAM [P100 datasheet](https://www.nvidia.com/content/dam/en-zz/Solutions/Data-Center/tesla-p100/pdf/nvidia-tesla-p100-PCIe-datasheet.pdf)
  * The NVIDIA A100 has 6912 CUDA cores and 80GB vRAM [A100 datasheet](https://www.nvidia.com/content/dam/en-zz/Solutions/Data-Center/a100/pdf/nvidia-a100-datasheet-us-nvidia-1758950-r4-web.pdf)
  * The NVIDIA L40S has 18176 CUDA cores and 48GB vRAM [L40S product page](https://www.nvidia.com/en-us/data-center/l40s/)
  * The NVIDIA H200 has 16896 CUDA cores and 141GB vRAM [H200 product page](https://www.nvidia.com/en-us/data-center/h200/)


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
  Another great resource is the [Slurm Quick Start User Guide](https://slurm.schedmd.com/quickstart.html) which has links to other good slurm documentation.


  Resource sharing on a High Performance Computer (HPC) system is typically organized by a piece of software called a resource manager or job scheduler.  Users submit jobs which are scheduled and allocated resources (CPU cores, GPU, RAM, time, etc.) by the resource manager.  **You cannot access any resources on this system without an active Slurm job.**

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
#SBATCH --gres=gpu:1          #how many GPU's needed on that node (only one available on each a100)

#SBATCH --output=/home/%u/%x-%u-%j.out  #specify output file in users home directory
#SBATCH --time=5:00           #amount of time requested (job will be killed if it runs longer than this)

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

More example job scripts are in [`example_sbatch_files/`](example_sbatch_files/).

## Apptainer

[Apptainer](https://apptainer.org/) is the container solution we use on the WSU HPC environment. It allows users to install and configure their own dev stack and transfer it between systems running Apptainer, greatly increasing portability and reducing the *"But it was just working on my computer"* factor. ;)

Full documentation: [Apptainer User Guide](https://apptainer.org/docs/user/main/)

#### Coming from Singularity?

Apptainer *is* Singularity: in 2021 the project moved to the Linux Foundation and was renamed. Most of what you already know carries over, but please update your habits and scripts:

| Singularity                     | Apptainer                        |
|---------------------------------|----------------------------------|
| `singularity build/exec/run/shell` | `apptainer build/exec/run/shell` |
| `SINGULARITY_*` env vars (e.g. `SINGULARITY_BIND`) | `APPTAINER_*` (e.g. `APPTAINER_BIND`) |
| `SINGULARITYENV_FOO=bar`        | `APPTAINERENV_FOO=bar`           |
| `$SINGULARITY_ROOTFS` (in `%setup`) | `$APPTAINER_ROOTFS`           |
| `~/.singularity/`               | `~/.apptainer/`                  |
| `/etc/singularity/singularity.conf` | `/etc/apptainer/apptainer.conf` |
| `.simg` images                  | `.sif` images (default format)   |
| `shub://` (Singularity Hub)     | Gone. Use `docker://` or `oras://` |

Things that keep working (but are deprecated, so don't rely on them):

* **Your existing containers.** `.sif` and `.simg` images built with Singularity run under Apptainer unchanged. No need to rebuild.
* **The `singularity` command.** Apptainer installs `singularity` as a symlink to `apptainer`, so old scripts still run, but new scripts and docs should say `apptainer`.
* **`SINGULARITY_*` environment variables** are still honored when the `APPTAINER_*` version isn't set, with a deprecation warning. If both are set, the `APPTAINER_*` value wins.
* **Your `~/.singularity` settings** (remotes, registry logins, keys) are migrated to `~/.apptainer` automatically the first time you run `apptainer`. The image cache is **not** migrated, so once you've switched you can delete `~/.singularity/cache` to free up space in your home directory.

#### Installing Apptainer

You need a Linux system (WSL works) to run Apptainer. On Ubuntu the easiest route is the official PPA:

```bash
sudo add-apt-repository -y ppa:apptainer/ppa
sudo apt update
sudo apt install -y apptainer
```

Other distributions and install-from-source instructions are in the [Apptainer installation guide](https://apptainer.org/docs/admin/main/installation.html), and the [Quick Start](https://apptainer.org/docs/user/main/quick_start.html) walks through your first containers.

Unlike older Singularity, Apptainer does **not** need root to run, and it can build most containers without root using `--fakeroot` (as long as your system has user namespaces enabled, which most modern distros do).

#### Building Containers

The `apptainer build` command is used to create containers.  With it you specify the output container image and a target input to build the container from.

```
apptainer build <OUTPUT-IMAGE> <INPUT-BUILDFILE>
```

The `OUTPUT-IMAGE` can produce containers in several different formats, the most common are:
* `my-container.sif` compressed, read-only SIF file suitable for production (default)
* `--sandbox /my/container/directory/` writable directory called a sandbox for interactive development (`--sandbox` option **GOOD**)

The `INPUT-BUILDFILE` is what specifies what will go into the container and can be one of the following:
* URI beginning with `docker://` to build from Docker Hub (or another registry, e.g. `docker://ghcr.io/...`)
* URI beginning with `oras://` to pull a SIF image stored in an OCI registry
* URI beginning with `docker-archive://` or `oci-archive://` to build from a saved Docker/OCI `.tar` archive
* path to an existing container file (`.sif` or legacy `.simg`)
* path to a directory of a sandbox container (an existing container built with `--sandbox`)
* path to an Apptainer definition file (`.def`, see [`example_apptainer_recipes/`](example_apptainer_recipes/))

Example `apptainer build` commands:
```bash
apptainer build --sandbox ~/ubuntu-container/ docker://ubuntu
## Builds a sandbox container directly from a dockerhub container (no root needed)

apptainer build ubuntu.sif ~/ubuntu-container/
## Converts a previously created sandbox container to a static .sif container

apptainer build --fakeroot pytorch.sif example_apptainer_recipes/pytorch.def
## Builds a container from a definition file without root
## (on older installs use `sudo apptainer build ...` instead)
```

#### Using and editing containers with `apptainer shell` 

`apptainer shell --fakeroot --writable /my/container/directory/` launches a shell inside a sandbox container from which we can continue our software installation and testing.  Note: `--writable` needs either `--fakeroot` or `sudo` if you want to install packages (e.g. with `apt`), and without `--writable` the container is read only (even though it is a `--sandbox` container).

Once you are finished installing and testing your software, do not forget to convert your `--sandbox` container back to a `.sif` with 
`apptainer build my-container.sif /my/container/directory/`

Sandboxes are for development; a sandbox is thousands of small files, which is hard on the shared BeeGFS `/home`. Please copy only the finished `.sif` to the cluster.

#### Using containers in a Slurm job

Put `apptainer exec` (run a command in the container) or `apptainer run` (run the container's `%runscript`) in your job script:

```bash
#!/bin/bash
#SBATCH --job-name=container-example
#SBATCH --partition=a100
#SBATCH --gres=gpu:1
#SBATCH --time=30:00
#SBATCH --output=/home/%u/%x-%u-%j.out

srun apptainer exec --nv ~/pytorch.sif python my_script.py
```

#### Advanced Apptainer topics

##### Binding with `-B`

By default Apptainer shares your home directory, the current working directory, and `/tmp` between the host and container.  Other users' home directories and other useful directories (like `/scratch`) are not accessible from within the container.
To remedy this you can specify bind paths with the `--bind` or `-B` option.  
The format for bind paths is as follows:

```
apptainer shell -B src:dest cuda.sif
```

Where `src` is a path on the host and `dest` is a path within the container.  If no `dest` path is provided it will use the same path as `src` inside the container.

You can also set binds for every command with an environment variable, for example in your `~/.bashrc` or job script:

```bash
export APPTAINER_BIND="/scratch,/data"
```

##### Passing environment variables into a container

Your host environment is passed into the container by default.  To set a variable only inside the container, prefix it with `APPTAINERENV_`:

```bash
APPTAINERENV_OMP_NUM_THREADS=8 apptainer exec my-container.sif ./my_program
```

##### Nvidia GPU support

Apptainer containers get direct access to the node's GPU only when given the `--nv` flag.

```
apptainer shell --nv cuda.sif
```

This does more than just allow access to the GPU, it also binds the host's NVIDIA driver and CUDA libraries into the container in the following directory (the name is unchanged from Singularity):

```
/.singularity.d/libs/
```

Apptainer adds this directory to `LD_LIBRARY_PATH` inside the container automatically, so you normally don't need to configure anything.  If a program inside the container still can't find the CUDA driver libraries, run `nvidia-smi` and `echo $LD_LIBRARY_PATH` inside the container and ping the devteam on Discord.
