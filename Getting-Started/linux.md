# Linux or: How I Learned to Stop Worrying and Love the Vim

This file should cover the following:

choosing a distro (Elementary recommended)

Windows Subsystem for Linux (WSL)

Linux directory and file permissions

basic linux command line tools

- cd, ls, cat, rm, mkdir, touch
- vim
- grep
- sudo, su
- apt
- ssh
- .bashrc
- others?

According to Hostinger (the first result on google) these are the 35 linux commands one should know. Hopefully we don't cover everything, but let's start somewhere:

- pwd, cd, ls, cat, cp, mv, mkdir, rmdir, rm, touch, locate, find, grep, sudo, df, du, head, tail, diff, tar, chmod, chown, jobs, kill, ping, wget, uname, top, history, man, echo, zip, unzip, hostname, useradd, userdel, clear, TAB completion

My working draft:

# Linux: _THE_ Operating System

---

~ _Christian Peters_

## Definition

> "Linux is an operating system designed _by_ developers _for_ developers." - Dr. Doom

> Linux is a family of open-source Unix-like operating systems based on the Linux kernel, an operating system kernel first released on September 17, 1991, by Linus Torvalds. Linux is typically packaged in a Linux distribution.
> Popular Linux distributions include Debian, Fedora, and Ubuntu. Commercial distributions include Red Hat Enterprise Linux and SUSE Linux Enterprise Server. Desktop Linux distributions include a windowing system such as X11 or Wayland, and a desktop environment such as GNOME or KDE Plasma. Distributions intended for servers may omit graphics altogether, or include a solution stack such as LAMP. Because Linux is freely redistributable, anyone may create a distribution for any purpose. [Wikipedia](https://en.wikipedia.org/wiki/Linux)

## Getting Started

Let's break down that tech-jargon Wikipedia article. Linux is an open source operating system, meaning that anyone (including you) can look at the source code and even modify it to fulfil your wildest dreams (Yes, really. People go nuts with this stuff. If you're interested, I would highly recommend checking out r/unixporn on Reddit). Linux is separated into "distributions" which are essentially just different versions of the OS with the only major difference being the package manager (the thing that manages packages... duh). You can choose any linux distribution, **however for purposes of learning I would recommend installing Elementary OS**. Again, any Linux distribution can be downloaded and installed for free on any machine that you would like. However, you don't have to have a dedicated computer just to run Linux. There are many other ways to enjoy the OS even from the comfort of your native Windows environment!

### Linux for Windows? Say no more!

There are several ways to enjoy Linux, but if you're using Windows (which honestly, most of you are) there are two main ways to jump into the OS. You can either install the Windows Subsystem for Linux (WSL) or, spin up a virtual machine and play with it that way.

#### Windows Subsystem for Linux (WSL)

#### Spinning up a Linux Virtual Machine

### What if I'm on a Mac?

### What if I'm using Linux already?

Then you probably don't need this guide, nerd.

## Linux Commands

Now that you've got a Linux environment to play around in, it's time to get our hands dirty. Open up your terminal and let's get started.

#### pwd

This is a great first command. The `pwd` command will tell you where you are in the file system. If you opened up a terminal in your 'home' directory, your output should look something like this: `/home/cpeters`. This is the path to the current working directory, or folder in layman's terms (pwd stands for Present Working Directory). This output is also known as an absolute path, meaning that it starts with the root directory (/) and continues forward to your current position.

#### cd

As the name suggests, `cd` stands for "Change Directory" (this will be a large topic, encompassing file paths, . and .. ) Try changing directories to your Desktop directory by typing `cd Desktop`. Keep in mind the shell is case sensitive, so be sure to replicate capitalization.

#### But wait, I don't have to type the entire name?

No you don't. Type `cd ..` and then `cd Dow[and then press tab]`. This should complete your entry to `cd Downloads/`. Hit enter and you should be in your Downloads folder. Pretty powerful, right?

#### ls

So we've covered how to see where you're at in the file system, how do you see what's inside the folder you're currently in? Well, theres a command for that. Type `ls` and hit enter. The contents of whatever directory you're in (check it with `pwd`!) should be printed out to the screen. But, that's just the name of the files and folders, which is LAME. To print out all the cool nerdy stats, type `ls -l` (standing for ls long). This should print out a bunch of cool information about the files and folders that are in your current working directory. To see hidden files, type `ls -al`. Well, now you know what's inside a directory - how do we make files to populate it?
