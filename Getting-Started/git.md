# WSU CSE's Git Crash Course: How to 'git' good

~Christian Peters

## What is git?

Something that is all too common with us nerds who work with computers is that we make mistakes. _A LOT_. In fact, it wouldn't be too far off to define working with software "a constant evolving problem that never goes away". However, it's because of these problems that we are able to get better, and ultimately solve them for good.

But when you're working with code that is also constantly evolving and changing, it's important to keep track of your work. Everyone has been in the situation of working on a coding project, added a function, and then had everything break (I know I've been there). When something like this happens, it's always good to revert to an earlier version of the project that works so you can identify what's wrong. What if there was a system that kept track of your progress and enabled you to jump to any point in your development at any time? Enter git.

As we have referenced a lot in this guide, let's see what Dr. Wikipedia has to say:

> Git is software for tracking changes in any set of files, usually used for coordinating work among programmers collaboratively developing source code. ([Wikipedia](https://en.wikipedia.org/wiki/Git))

Basically, to boil down the boiled down version of git, it's a version-control system that keeps track of changes to files. You then can use this to coordinate and collaborate between multiple people in multiple workflows.

## Breaking it down

Fun fact: the guy who invented Linux also invented git. Yeah, mega nerd. Anyways, since he so kindly blessed us with git _and_ Linux, git works remarkably well through the Linux command line. To be honest, there are only a few core git commands that we use on a day to day basis. The rest is just Google and insert.

Before I get into some git commands, I would highly recommend having a [git cheat sheet](https://www.reddit.com/r/git/comments/5m5fdz/git_cheat_sheet/) on hand when working with git. I've been personally using git for a few weeks and I _still_ have to use a cheat sheet because I have a goldfish memory and forget everything. Also you'll mess up git the first time you use it, trust me.

### Git Structure

The name for a git file system is a _repository_ or as us nerds call it: _a repo_. This repo can be local or remote, and is a storage container for all of your changes and modifications that you do to the git tree. The 'git structure' is divided into three subsections: the working tree, the staging area, and the history. This helped me a lot conceptually when I was first starting with git. Essentially, it works like this:

- Your working tree is your current batch of files you're working on and editing.
- You take that working tree, and add it to the staging area. This is when you can purposefully omit files you don't want to "track" or have snapshots of.
- You then commit that staging area to your commit history, meaning you have a saved snapshot of this version of the code to reference back to if needed. Take a look at this diagram if you're confused:

![image](images/git_structure.jpg)

### Branching

Git works like a tree, where everyone working on a project can be responsible for their own branch. Thing is, in this tree, you can merge your branches back into the theoretical "trunk" or main branch of the project. Basically, you can go and make changes to the code, but not interrupt the core, working version of the code. However, when your changes are secure and deemed stable, you can merge it back and the main version gets updated.

Useful commands:

- `git branch`: Shows a list of branches, and what branch you are currently on
- `git branch [name]`: Creates a new branch
- `git checkout [name]`: Switches your current working branch

Glance over this page about [a successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/) to see visually what I'm talking about here.

### Adding

Like referenced above, your first step in "taking a snapshot" of your code is adding your newly modified files to your staging area. You can accomplish this by the following command:

- `git add [files]`

NOTE: To add all files in a given directory, you can use `git add .`, which I like to use.

### Committing

Next up after you've added your files is committing. Committing is essentially taking a snapshot of your code and storing it in the code commit history (or log) for you to reference at any time.

Useful commands:

- `git commit -a -m "Description of commit"`

### Pushing

This gets into the real power of git. Git can be used locally as a personal version control system, but the real fun is when it is used remotely through clients like GitHub and GitKraken. Keep in mind, git and GitHub are NOT the same (yes, I thought they were once). Git is the version control system itself, and GitHub/GitKraken are remote websites that help with _remote management_, as well as offer a ton of other cool features to aid in collaboration and productivity. We'll touch more on GitHUb later, but just acknowledge that it exists.

Pushing your changes to a remote branch essentially means that you are proposing an update to a given branch based on the commits you have made locally through adding and staging your modifications. In order to push properly, you need to set a target remote branch. To do this, the command is:

- `git branch --set-upstream-to origin`

This command sets your current branch to "push" to origin, meaning that when you use the next command, it will update the remote branch as well. This push command is used like this:

- `git push origin`

You might have to also use this command to push to the HEAD, which is a pointer to the current remote branch.

- `git push origin HEAD`

By pushing your commits and changes to a remote branch, you are enabling other users who have access to your repo to view your changes and give feedback accordingly.

### Pulling

This is the opposite of pushing. When someone has made a change to a remote branch (or you have made a change to a branch on another system) you can simply update your _local_ repo by pulling in the changes from the remote branch. This can be done by

- `git pull`

BIG HUMONGUS NOTE: `git pull` and A PULL REQUEST are two different things! Yes, I made this mistake when I first started out so it's ok.

### A Pull Request

So you've been hard at work on a branch of code, and now you think that your version of the code should be worked into the main working branch. In this situation, you would open a Pull Request in GitHub. This essentially requests the owners of the master branch to "pull" your changes into the master branch and make the new master branch have your changes in it. In the pull request dialog box, state your changes and mention how your code is stable and should be worked into the main version.

Keep in mind if you open a PR, any commits after that point will update your PR, so you don't have to make multiple requests if you update your code after the initial opening.

### Other useful git Commands

While using git on a day to day basis, the previous commands will 'git' you started, but won't be everything you'll need. Here are some other commands that will help you develop and see your progress along the way:

- `git clone [URL TO CLONE FROM]`: Probably the most important out of all the "other" commands. This will copy the code on the specified branch from a remote repo, most of the time on GitHub.
- `git status`: Shows you what files have been modified in the current directory and what files have been added to the staging area.
- `git log`: A record of all of your git commits
- `git rm`: Remove a file from the git repo

## GitHub, GitKraken, what exactly do I Git here?

Like I mentioned earlier, git is merely the system that manages the commit history. GitHub and GitKraken add a ton more features and accessibility to the git skeleton. Like git itself, I would recommend having a [GitHub git cheat sheet](https://training.github.com/downloads/github-git-cheat-sheet/) on hand, as all of this stuff can be overwhelming.

### GitHub

Let's see what Dr. Wikipedia has to say for a definition, shall we?

> GitHub, Inc. is a provider of Internet hosting for software development and version control using Git. It offers the distributed version control and source code management (SCM) functionality of Git, plus its own features. It provides access control and several collaboration features such as bug tracking, feature requests, task management, continuous integration and wikis for every project. ([Wikipedia](https://en.wikipedia.org/wiki/GitHub))

GitHub is the largest host of source code on the globe. If it's open source, it's probably on GitHub.

### Ok, what makes it so special?

GitHub lets you track your changes and commits, and also lets you comment, complain and praise anything you want through the interface. You can highlight issues, bring up complaints, start checklists, organize to-do lists, and so much more. To avoid a 30 page discussion on GitHub, lets jump into what WE use it for.

### Managing Issues

So say you're reviewing you coworker's code and you see a problem. Something doesn't look right and you think there's a better way of writing a section of code. Instead of going to them in person or writing an email that will ultimately get lost, you open an issue, which is conviniently handled through GitHub.

In the "Issues" tab of GitHub, you can click the green "New Issues" button. You then will title your issue and write a brief description of what you think is wrong and how to fix it.

However, before you click "Submit new issue" keep a few things in mind:

- Make sure your issue covers one _specific_ thing. Even if that one thing is a general concept, keep your issue to one concept at a time.
  - Examples:
    - **Bad Issue:** "Main function isn't documented and toString() function doesn't work properly" (separate these into two issues)
    - **Good Issue:** "Main function doesn't have proper documentation"
- Provide enough details to give the author the tools to fix the issue to the best of their abilities. If it's a bug in the code, provide steps on how to reproduce the bug.

If you're stuck, GitHub provides issue [templates](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/about-issue-and-pull-request-templates) that you can use based on the specific issue. But if you just keep the above steps in mind, you should be golden.

### Assigning Teams

One of GitHub's fancy functions is to add members of a team to work on a project. You can assign people by simply clicking on the "Assignees" button in GH. You can assign people to projects, issues and more simply by clicking. In this job, you'll be working in a programming team on GitHub. You'll be able to see all of the team projects, and contribute to the ones you're assigned to.

### Commit History

You can view your commit history in a nice GUI on GitHub. You can view your commit history by clicking the "commits" button in the repo. Each commit is denoted by a series of letters and numbers, which you can specifically revert back to. Check out [this link](https://stackoverflow.com/questions/3639115/reverting-to-a-specific-commit-based-on-commit-id-with-git) on Stack Overflow for more information on how to do that.

![image](images/commitHistoryPic.png)

### Project Boards

Project boards on GitHub help you organize and prioritize your work. You can create project boards for specific feature work, comprehensive roadmaps, or even release checklists. With project boards, you have the flexibility to create customized workflows that suit your needs. Here is an example of a project board with some custom status sections:

![image](images/gitHub_projectboard.png)

## An Example Workflow

Say I just sat down to my desk in the morning and I want to start working on a project. Here's my normal process of commands that I enter to get set up:

- `git clone [URL TO CLONE FROM]`: This sets up a local version of the repo on my system, with "origin" automatically pointing remotely to GitHub (fact check?)
- Change directories to the repo
- `git pull`: Updates the repo to any more changes that may have been made

_Do a little work, get some lunch, whatever_

- `git status`: Seeing what files I modified and what I need to add to my staging area
- `git add [FILENAME]`: Adds the "untracked" files to my staging areas
- `git status`: Verifying that the files got added to the staging area
- `git commit -am "COMMENT ON CODE`: Stores my recent changes into a commit with that label

_Do more work, commits and stuff, and then after I have made my final commit of the day_

- `git push`: Pushes my changes to the remote branch, and I'm done for the day

A quick note: notice how I'm always typing `git status` to get the status of my current git project. This is VERY useful and should be a habit you should form whenever working with git. Whenever you type a `git status` you get not only the branch you're working on, but the files that you're modifying. This will help prevent against editing the wrong branches, and catching conflicting edits before they become too complex.

Again, this is just an example of what commands I would use when I'm starting work for the day. Obviously, you can change them around. However, what's important here is the concept of working in branches. A key idea of working here is that every piece of work should be looked over by another set of eyes before being approved and becoming the working copy. Even during the construction of this guide itself, it had to be looked at by another member of the team before it was pushed to public. Think of it as being a contributing writer to a newspaper - you're never the only person on a project.

## Some Closing Thoughts

You'll mess up git your first time, your second time and your third time. It's a hard process to get used to doing but after a while it becomes second nature. Git being a version control service, it's used practically everywhere in the software development world. Get used to git and your future programming self will thank you later.

If anything arises, don't be afraid to ask for help. Google can only go so far and your co-workers would be more than happy to give you guidance on how we specifically use git and GitHub. I had to ask for a lot of help when writing this, so it's nothing to be afraid of.

Other than that, happy git-ing!
