# Why do Astronauts use Linux? Because you can't open Windows in space...

~ _Christian Peters_

## Definition

"Linux is an operating system designed _by_ developers _for_ developers." - [Dr. Travis Doom](https://people.wright.edu/travis.doom)

> Linux is a family of open-source Unix-like operating systems based on the Linux kernel, an operating system kernel first released on September 17, 1991, by Linus Torvalds. Linux is typically packaged in a Linux distribution.
> Popular Linux distributions include Debian, Fedora, and Ubuntu. Commercial distributions include Red Hat Enterprise Linux and SUSE Linux Enterprise Server. Desktop Linux distributions include a windowing system such as X11 or Wayland, and a desktop environment such as GNOME or KDE Plasma. Distributions intended for servers may omit graphics altogether, or include a solution stack such as LAMP. Because Linux is freely redistributable, anyone may create a distribution for any purpose. [Wikipedia](https://en.wikipedia.org/wiki/Linux)

Linux is made up of a linux kernel and a set of unique programs around it. Differences may include a graphical interface, package manager, and pre-installed software among other things.

## Getting Started

Let's break down that tech-jargon Wikipedia article. Linux is an OS that is based on the Linux kernel.

Linux is open source, meaning that anyone (including you) can look at the source code and even modify it to fulfill your wildest custom operating system dreams (check out r/unixporn on Reddit).

Linux is separated into "distributions" which are essentially just different OS versions with the only major difference being extra software that gets included along with it like a package manager and graphical interface. You can choose any Linux distribution, **however for purposes of learning, I would recommend installing Elementary OS,** which can be downloaded [here](https://elementary.io). Fair warning, this OS is a "pay what you want" meaning if you want it for free, enter $0 in the place to pay for the link.

Again, _most_ Linux distributions can be downloaded and installed for free on any machine (there are enterprise distributions that cost lots of money, but you probably won't be encountering those) that you would like. However, you don't have to have a dedicated computer just to run Linux. There are many other ways to enjoy the OS even from the comfort of your native Windows environment!

### But OK. Why Linux?

To be honest, I'm still grappling with that question myself. I have been a Windows/Mac user my whole life, why would I switch to something else? Well, the answer lies where most things lie in Linux: the command line.

If you haven't figured it out already, to use Linux fully, you generally use the command line every day. Generally, if you are a programmer or someone who works with the guts of computers, your job is interpreting and parsing text. Linux's job is the same: inputting text and outputting parsed text.

The amount of extremely powerful customization that you can do just from a simple command on the Linux command line towers over anything you could do in the Windows PowerShell. Want to find all the instances of the word "banana" in a 1,000,000,000 line text file? Linux can do it in the snap of a finger. Made a slight variable naming error in a large program? Done. Want to do large user modification in a few seconds? Say less. It's things like this, that may not be flashy or even remotely sexy that separates Linux from the pack. Trust me, this isn't exactly easy to justify. But, as you use it more and realize just how _much_ you can do with it, you will also realize why Linux has such a big market share and is the driving workhorse behind some of the world's most powerful systems. Linux is the primary operating sytem for large-scale computing. Albeit, Windows still dominates the desktop computer market, but Linux takes the cake when it comes to servers. Take a look at this diagram for server computers if you think I'm wrong:

![image](linux_market_share.png)

Fun fact: Windows is developed and compiled on Linux machines!

Ok great. Linux can do complex commands fast. I still don't see a reason why I should make the switch?

Well, one of the biggest reasons to use Linux is relating back to Dr. Doom's quote: Linux is an operating system designed by developers for developers. Linux is designed for development. You aren't going to write an Operating system on MacOS, simple as that.

In Linux, you can get to the nitty gritty stuff faster than in other more bloaty operating systems. You can control your development environment to such a fine degree that you can work with almost limitless different combinations of dependencies and modules. In Linux, things just _work_. You can set up a basic development environment on Linux in ten minutes. On Windows, good luck. Depending on the dependencies and other extraordinary circumstances, you could be working all day to do something that takes only a few keystrokes on Linux.

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
