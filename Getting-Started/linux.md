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

~ _Christian Peters_

## Definition

> "Linux is an operating system designed _by_ developers _for_ developers." - Dr. Doom

> Linux is a family of open-source Unix-like operating systems based on the Linux kernel, an operating system kernel first released on September 17, 1991, by Linus Torvalds. Linux is typically packaged in a Linux distribution.
> Popular Linux distributions include Debian, Fedora, and Ubuntu. Commercial distributions include Red Hat Enterprise Linux and SUSE Linux Enterprise Server. Desktop Linux distributions include a windowing system such as X11 or Wayland, and a desktop environment such as GNOME or KDE Plasma. Distributions intended for servers may omit graphics altogether, or include a solution stack such as LAMP. Because Linux is freely redistributable, anyone may create a distribution for any purpose. [Wikipedia](https://en.wikipedia.org/wiki/Linux)

## Getting Started

Let's break down that tech-jargon Wikipedia article. Linux is an open source operating system, meaning that anyone (including you) can look at the source code and even modify it to fulfil your wildest dreams (Yes, really. People go nuts with this stuff. If you're interested, I would highly recommend checking out r/unixporn on Reddit). Linux is separated into "distributions" which are essentially just different versions of the OS with the only major difference being the package manager (the thing that manages packages... duh). You can choose any linux distribution, **however for purposes of learning I would recommend installing Elementary OS**. (probably put in a download link?) Again, any Linux distribution can be downloaded and installed for free on any machine that you would like. However, you don't have to have a dedicated computer just to run Linux. There are many other ways to enjoy the OS even from the comfort of your native Windows environment!

### Linux for Windows? Say no more!

There are several ways to enjoy Linux, but if you're using Windows (which honestly, most of you are) there are two main ways to jump into the OS. You can either install the Windows Subsystem for Linux (WSL) or, spin up a virtual machine and play with it that way.

#### Windows Subsystem for Linux (WSL)

#### Spinning up a Linux Virtual Machine

So you've gotten more familiar with Linux, but don't want to wipe your Windows machine and start over just yet. At this point, a Virtual Machine, or VM, would be good for you. This is essentially, a machine inside of a machine. There are many programs that will run virtual machines, but VirtualBox is my personal favorite. Go to [this website](https://www.wikihow.com/Install-VirtualBox) and take a look on how to install VirtualBox (link is applicable to Windows as well as Mac).

Once you have VirtualBox installed, you are now ready to download a VM and get started. (do we want Elementary as an install or Ubuntu to start out with?)

### What if I'm on a Mac?

Fun fact: MacOS is _Unix-based_. No, this isn't some term from the Matrix, this means that MacOS is built off of the core operating system called Unix. Linux is also built off of Unix, meaning that most Linux commands work on a Mac system (**need a fact check here**). Ever opened up a terminal on your Mac? Chances are, you haven't. Well, change that. Do a spotlight search and open up a terminal

### What if I'm using Linux already?

Then you probably don't need this guide, nerd.

## Linux Commands

Now that you've got a Linux environment to play around in, it's time to get your hands dirty and work with some commands. For most instances, you will only have to know a core group of commands, as well as have the ability to look up unfamiliar ones by either using the terminal, or your preferred web browser.

The web has thousands of complicated linux guides teaching you everything you need to know. Right now, let's focus on the basics. Walk through [this command overview](https://www.hostinger.com/tutorials/linux-commands) or one you find on Google on a local terminal. Again, this is not meant to be complicated. We just want you to get familiar with the _core group_ of commands. Practice a few times and learn to recognize the outputs of each command. It can be a bit daunting if you've never worked with a terminal environment before, but remember: _the man page is your friend_. Once you feel comfortable with the majority of the commands, move on to the next portion of this guide.

## Further Configuration

### VSCode

### Anaconda

Which is... what?
