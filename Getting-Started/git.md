# PGG's Git Crash Course: How to 'git' good

## What is git?

Something that is all too common with us nerds who work with computers is that we make mistakes. _A LOT_. In fact, it wouldn't be too far off to define working with software "a constant evolving problem that never goes away". However, when you solve that problem, it is all the more sweet.

But when you're working with code that is also constantly evolving and changing, it is important to keep track of your work. Everyone has been working on a coding project, added a function and then had everything break. I know I've been there. When that happened, I would have killed to have something that would have kept track of my routine "backups" of my code. Enter git.

As we have referenced a lot in this guide, let's see what Dr. Wikipedia has to say:

> Git is software for tracking changes in any set of files, usually used for coordinating work among programmers collaboratively developing source code. (Wikipedia)

Basically, to boil down the boiled down version of git, it is a complex remote integrated system restore. If you've ever used Windows, you know that making a system restore point enables your computer to completely revert back to that certain point when something bad happened. You downloaded a virus from a Minecraft mod website, but never fear, Windows made a restore point to save your computer and act like that malicious software never existed. This is the same concept that is applied to git, but with code.

## Breaking it down

Fun fact: the guy who invented Linux also invented git. Yeah, mega nerd. Anyways, since he so kindly blessed us with git _and_ Linux, git works remarkably well through the command line. In our personal usage of git through our job, there really is only a handful of commands that we use on a daily basis. The rest is just Google and insert.

Let's quickly go over some of the core commands that we use on a daily basis. I would highly recommend having a [git cheat sheet](https://www.reddit.com/r/git/comments/5m5fdz/git_cheat_sheet/) on hand when working with git. I've been personally using git for a few weeks and I _still_ have to use a cheat sheet because I have a goldfish memory and forget everything.

### Git Structure

Before we jump head first into commands, lets cover the structure of git. The name for a git file system is a _repository_ or as us nerds call it: _a repo_. This repo can be local or remote, and is a storage container for all of your changes and modifications that you do to the git tree. The 'git structure' is divided into three subsections: the working tree, the staging area, and the history. This helped me a lot conceptually when I was first starting with git. Essentially, it works like this:

- Your working tree is your current batch of files you're working on and editing.
- You take that working tree, and add it to the staging area. This is when you can purposefully omit files you don't want to "track" or have snapshots of.
- You then commit that staging area to your commit history, meaning you have a saved snapshot of this version of the code to reference back to if needed.

### Adding

Like referenced above, your first step in "taking a snapshot" of your code is adding your newly modified files to your staging area. You can accomplish this by the following command:

- `git add [files]`

NOTE: To add all files in a given directory, you can use `git add .`, which I like to use.

### Committing

Next up after you've added your files is committing. Committing is essentially making a "System Restore point" for your code. It takes a snapshot of your code, and stores it in the code commit history for you to reference at any time.

Useful commands:

- `git commit -a -m "Description of commit"`

### Pushing

This gets into the real power of git. Git can be used locally as a personal version control system, but the real fun is when it is used remotely through clients like GitHub and GitKraken. Keep in mind, git and GitHub and GitKraken are NOT the same (yes, I thought they were once). Git is the version control software itself, and GitHub/GitKraken are remote websites that help with remote management, as well as offer a ton of other cool features to aid in collaboration and productivity. We'll touch more on GitHUb later, but just acknowledge that it exists.

Pushing your changes to a remote branch essentially means that you are proposing an update to a given branch based on the commits you have made locally through adding and staging your modifications. In order to push properly, you need to set a target remote branch. To do this, the command is:

- `git branch --set-upstream-to origin`

This command sets your current branch to "push" to origin, meaning that when you use the next command, it will update the remote branch as well. This push command is used like this:

- `git push origin`

You might have to also use this command to push to the HEAD, which is a pointer to the current remote branch (fact check)

- `git push origin HEAD`

By pushing your commits and changes to a remote branch, you are enabling other users who have access to your repo to view your changes and give feedback accordingly.

### Branching

Git works like a tree, where everyone working on a project can be responsible for their own branch. Thing is, in this tree, you can merge your branches back into the theoretical "trunk" or main branch of the project. Basically, you can go and make changes to the code, but not interrupt the core, working version of the code. However, when your changes are secure and deemed stable, you can merge it back and the main version gets updated.

Useful commands:

- `git branch` : Shows a list of branches, and what branch you are currently on
- `git branch [name]` : Creates a new branch
- `git checkout [name]` : Switches your current working branch

Glance over this page about [a successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/) to see visually what I'm talking about here.

[GitHub git cheat sheet](https://training.github.com/downloads/github-git-cheat-sheet/)

## Example workflows

- Clone a repo: `git clone [url]`
- Make some changes (after you have edited files or folders):
  - Stage every altered file for commit: `git add [path to changed/new files and folders]`
  - Create a commit: `git commit`
  - Push all local commits to the remote repository: `git push`
- Branching
  - Create a branch: `?`
  - Checkout/switch to a branch: `?`
  - Remote branching `remote origin` stuff

## [Issues](https://guides.github.com/features/issues/)

Use issues to track ideas, enhancements, tasks, or bugs for work on GitHub.

## Project Boards

Project boards on GitHub help you organize and prioritize your work. You can create project boards for specific feature work, comprehensive roadmaps, or even release checklists. With project boards, you have the flexibility to create customized workflows that suit your needs.
