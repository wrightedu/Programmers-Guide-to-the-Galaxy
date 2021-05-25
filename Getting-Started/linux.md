# Why do Astronauts use Linux? Because you can't open Windows in space...

~ _Christian Peters_

## Definition

"Linux is a system designed _by_ developers _for_ developers." - [Dr. Travis Doom](https://people.wright.edu/travis.doom)

> Linux is a family of open-source Unix-like operating systems based on the Linux kernel, an operating system kernel first released on September 17, 1991, by Linus Torvalds. Linux is typically packaged in a Linux distribution.
> Popular Linux distributions include Debian, Fedora, and Ubuntu. Commercial distributions include Red Hat Enterprise Linux and SUSE Linux Enterprise Server. Desktop Linux distributions include a windowing system such as X11 or Wayland, and a desktop environment such as GNOME or KDE Plasma. Distributions intended for servers may omit graphics altogether, or include a solution stack such as LAMP. Because Linux is freely redistributable, anyone may create a distribution for any purpose. [Wikipedia](https://en.wikipedia.org/wiki/Linux)

## Getting Started

Let's break down that tech-jargon Wikipedia article. Linux is actually NOT an OS. Linux is the kernel. Linux distributions are OSes. There's a famous copypasta about this:

> What you’re referring to as Linux, is in fact, GNU/Linux, or as I’ve recently taken to calling it, GNU plus Linux. Linux is not an operating system unto itself, but rather another free component of a fully functioning GNU system made useful by the GNU corelibs, shell utilities and vital system components comprising a full OS as defined by POSIX.

> Many computer users run a modified version of the GNU system every day, without realizing it. Through a peculiar turn of events, the version of GNU which is widely used today is often called “Linux”, and many of its users are not aware that it is basically the GNU system, developed by the GNU Project. There really is a Linux, and these people are using it, but it is just a part of the system they use.

> Linux is the kernel: the program in the system that allocates the machine’s resources to the other programs that you run. The kernel is an essential part of an operating system, but useless by itself; it can only function in the context of a complete operating system. Linux is normally used in combination with the GNU operating system: the whole system is basically GNU with Linux added, or GNU/Linux. All the so-called “Linux” distributions are really distributions of GNU/Linux.

Linux is open source, meaning that anyone (including you) can look at the source code and even modify it to fulfil your wildest dreams (Yes, really. People go nuts with this stuff. If you're interested, I would highly recommend checking out r/unixporn on Reddit). Linux is separated into "distributions" which are essentially just different OS versions with the only major difference being the package manager (the thing that manages packages... duh). Again, Linux distros aren't _technically_ Linux, however it's the norm just to call it that to make it easier. You can choose any Linux distribution, **however for purposes of learning, I would recommend installing Elementary OS,** which can be downloaded [here](https://elementary.io). Fair warning, this OS is a "pay what you want" meaning if you want it for free, enter $0 in the place to pay for the link.

Again, any Linux distribution can be downloaded and installed for free on any machine that you would like. However, you don't have to have a dedicated computer just to run Linux. There are many other ways to enjoy the OS even from the comfort of your native Windows environment!

### Linux for Windows? Say no more!

There are several ways to enjoy Linux, but if you're using Windows (which honestly, most of you are) there are two main ways to jump into the OS. You can either install the Windows Subsystem for Linux (WSL) or, spin up a virtual machine and play with it that way.

#### Windows Subsystem for Linux (WSL)

Believe it or not, Windows has a feature that lets you use Linux INSIDE of Windows! Crazy right? Dr Wikipedia explains it like this:

> Windows Subsystem for Linux (WSL) is a compatibility layer for running Linux binary executables (in ELF format) natively on Windows 10 and Windows Server 2019. ... Since June 2019, WSL 2 is available to Windows 10 customers through the Windows Insider program, including the Home edition. [Wikipedia](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux)

It essentially gives you the ability to play around with Linux commands in your own Windows environment. If you just want to dip your toes in the theoretical Linux lake, take a look at [this guide](https://www.wikihow.com/Enable-the-Windows-Subsystem-for-Linux) to enable WSL for your local Windows machine.

#### Spinning up a Linux Virtual Machine

So you've gotten more familiar with Linux, but don't want to wipe your Windows machine and start over just yet. At this point, a Virtual Machine, or VM, would be good for you. This is essentially, a machine inside of a machine. There are many programs that will run virtual machines, but VirtualBox is my personal favorite. Go to [this website](https://www.wikihow.com/Install-VirtualBox) and take a look on how to install VirtualBox (link is applicable to Windows as well as Mac).

Once you have VirtualBox installed, you are now ready to download a VM and get started. Take a look at [this guide](https://medium.com/analytics-vidhya/installing-elementaryos-5-1-on-oracle-virtualbox-6cd3b02e480d) to learn how to install Elementary OS on your newly installed VirtualBox software.

### What if I'm on a Mac?

Fun fact: MacOS is _Unix-based_. No, this isn't some term from the Matrix, this means that MacOS is built off of the core operating system family called Unix. Linux is also built off of Unix, meaning that most Linux commands work on a Mac system because they are _Unix-like_ meaning that any Unix-based OS should be able to run any other Unix-based OS commands. Ever opened up a terminal on your Mac? Chances are, you haven't. Well, change that. Do a spotlight search and open up a terminal. Test out some of the commands in the guide linked above and observe what they do. NOTE: You are working in your actual native file system and can actually mess up real files if you make the wrong commands (for example, I wouldn't run `rm -r *` in a directory because it deletes the entirety of it). Keep in mind that Mac is NOT Linux, but some of the commands have the same effect. If you want to mess with Linux more, I would recommend installing a VM through VirtualBox.

### What if I'm using Linux already?

Then you probably don't need this guide, nerd.

## Linux Commands

Now that you've got a Linux environment to play around in, it's time to get your hands dirty and work with some commands. For most instances, you will only have to know a core group of commands, as well as have the ability to look up unfamiliar ones by either using the terminal, or your preferred web browser.

The web has thousands of Linux guides that can teach you everything you need to know. Right now, let's focus on the basics. Walk through [this command overview](https://www.hostinger.com/tutorials/Linux-commands) or one you find on Google on a local terminal. Again, this is not meant to be complicated. We just want you to get familiar with the _core group_ of commands. Practice a few times and learn to recognize the outputs of each command. It can be a bit daunting if you've never worked with a terminal environment before, but remember: _the man page is your friend_. Once you feel comfortable with the majority of the commands, move on to the next portion of this guide.

## File and Directory Permissions

In Linux, _it's all about the permissions_. Files, directories, you name it, they all have permissions on who can read, write or execute a given entity. For a given file, there are three groups that have a varying configuration of these permission levels: owner, group and all users.

This means that only if you have the given permissions, will you then be able to manipulate a file or directory.

Here's an example of an `ls -l` on an example directory:

```
drwxr-xr-x 2 cpeters cpeters 4096 May 25 12:54 dir1
-rw-r-x--- 1 cpeters cpeters    0 May 25 12:40 file1
-rwxr--r-- 1 cpeters cpeters    0 May 25 12:40 file2
-rw-r--rwx 1 cpeters cpeters    0 May 25 12:40 file3
```

Notice here that there are three groups of 'rwx' meaning the first is the user, second is the group and the third is the other portions of the user base. Notice also that file1 can be read and written by the user, but only members of a specific group can execute th file. See also that the directory has a 'd' in front of the permissions to signifiy it is a directory.

To learn more about file and directory permissions, click [this link](https://www.linux.com/training-tutorials/understanding-linux-file-permissions/) to go to the official Linux description on the topic.

## Further Configuration

### VSCode

VSCode is awesome. Simply put, it is the best IDE (Integrated Development Environment) around. If you've taken any sort of coding class in the past, you might have messed around with programs like Eclipse or NetBeans. Throw those out the window. Once you go to VSCode, you'll never go back.

On your Linux machine, go to the terminal and type `sudo apt install code` which will install VSCode on your system.

To launch VSCode, simply switch to a directory with a project and type `code .` which will launch VSCode in the current directory.

Once you open up VSCode, take a look at it for a minute. It looks just like Notepad, so why are you installing this? Well, the real power of VSCode is in the extensions. Bring up the Extensions tab by clicking the icon in the left bar of the program. You can search for extensions and download them here in this menu.

You can work wonders with extensions. For example, the extension TabNine will autocomplete lines of code based on machine learning. There are also a multitude of extensions that will truncate and optimize your code _without you having to do anything_. On top of that, there are extensions that will color up your code and make it look pretty. I would recommend browsing the extensions page and installing some that look interesting.

To install an extension, simply click 'install' on the extension page.
