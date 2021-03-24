# Python

~ [Ryan Slater](https://github.com/CodingPenguin1)

> Python is an interpreted, high-level and general-purpose programming language. Python's design philosophy emphasizes code readability with its notable use of _significant indentation_ (indentation matters). Python is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly, procedural), object-oriented and functional programming. Python is often described as a "batteries included" language due to its comprehensive standard library.
> Guido van Rossum began working on Python in the late 1980's, as a successor to the ABC programming language, and first released it in 1991 as Python 0.9.0. Python 2.0 was released in 2000 and introduced new features, such as list comprehensions and a garbage collection system using reference counting and was discontinued with version 2.7.18 in 2020. Python 3.0 was released in 2008 and was a major revision of the language that is not completely backward-compatible and much Python 2 code does not run unmodified on Python 3. ([Wikipedia](https://en.wikipedia.org/wiki/Python_%28programming_language%29))

## Getting started

There are a few ways you can get started with Python. Firstly, Python comes with most Linux distributions. If you do not run Linux, you can install Python from [the Python website.](https://www.python.org/downloads/)

However, it is generally recommended to use [Anaconda](https://www.anaconda.com/) instead.

> Anaconda is a distribution of the Python and R programming languages for scientific computing (data science, machine learning applications, large-scale data processing, predictive analytics, etc.), that aims to simplify package management and deployment. The distribution includes data-science packages suitable for Windows, Linux, and macOS. It is developed and maintained by Anaconda, Inc., which was founded by Peter Wang and Travis Oliphant in 2012. As an Anaconda, Inc. product, it is also known as Anaconda Distribution or Anaconda Individual Edition, while other products from the company are Anaconda Team Edition and Anaconda Enterprise Edition, both of which are not free.
> Package versions in Anaconda are managed by the package management system conda. This package manager was spun out as a separate open-source package as it ended up being useful on its own and for other things than Python. There is also a small, bootstrap version of Anaconda called Miniconda, which includes only conda, Python, the packages they depend on, and a small number of other packages. ([Wikipedia](<https://en.wikipedia.org/wiki/Anaconda_(Python_distribution)>))

You can install Anaconda for Linux, Windows, or MacOS from [their downloads page](https://www.anaconda.com/products/individual). Due to the complexity of the additional features Anaconda provides over Python, the Python version distributed with Anaconda tends to lag behind the latest Python version. Conda environments can help you get around this, which we will discuss later.

## But what _really_ is Python?

You've already read what Python is, but what does all that mumbo-jumbo mean? There are a few big things you should take away from reading that Wikipedia snippet:

Firstly, like every other programming language, Python is a tool used to achieve a goal or solve a problem. It is good at some things and bad at others. What makes Python special is that in most cases it's usually "good enough." C programmers will say it's too slow and Java programmers will hate how loosely defined everything is, but because of Python's modularity, it's basically the Swiss Army Knife of programming languages. Sure, you might rather have a drill instead of Python's flip-out screwdriver, but if you're changing a battery, a drill would be a little overkill.

This brings us to my second point: Python is _insanely_ modular. For any project you're working on, chances are high that someone has already done it. And if not, someone has definitely done something similar enough that you can base your project off of theirs. Python achieves this through modules, hosted on [PyPI](https://pypi.org/). PyPI is the Python Package Index. We'll go over this more later, but generally it's a place for people to host their Python code, wrapped up nicely so that other people can install it as a blackbox and get off to working on their own code. [This XKCD comic](https://xkcd.com/353/) explains it all nicely.

Finally, Python emphasizes readability and ease-of-use. Python is meant to read like a story, telling the programmer explicitly what the code does. Good Python code shouldn't need comments to be readable (this is _not_ an excuse not to comment though!). The Python community has developed a standard called [PEP 8](https://www.python.org/dev/peps/pep-0008/). It might not be perfect, and you will almost certainly disagree with at least one or more parts of it, but if you follow this code formatting guideline, everyone's code will look the same and be easily readable. I also recommend taking a look at the [Google-style Python Docstrings](https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html). Both of these pages have a _lot_ of information, so don't worry about reading them yet. Maybe give them a quick glance, but do come back to them once you've finished this tutorial. Overall, Python code (and concepts) should follow the [The Zen of Python](https://www.python.org/dev/peps/pep-0020/):

```text
Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!
```

## Pip/Conda

Remember that [PyPI](https://pypi.org/) thing I mentioned? You should. I just said it. If not, go read the previous section again. Like, actually read it. Don't just skim it because you "know what Python is" and don't want to read all those big scary words. Done? Cool, let's move on.

The core Python language is honestly pretty terrible. However, when you add modules, Python becomes one of the most powerful programming languages. Want to do something with machine learning? Just `import tensorflow`. Like game development? `import pygame`. MATLAB fan for some reason? `import matplotlib`. Name a project, and PyPI has community-made modules that will do a lot of the foundation, letting you get to the fun stuff faster. At the time of writing, PyPI has almost 300,000 projects available. All you need to do is install the module you want and import it in your code.

Python comes with a package manger called [pip](https://pip.pypa.io/en/stable/user_guide/). Anaconda adds the [conda package manager](https://docs.conda.io/projects/conda/en/4.6.0/_downloads/52a95608c49671267e40c689e0bc00ca/conda-cheatsheet.pdf) There are some differences, but both functionally do the same thing. If you're using Anaconda, you should try to use conda whenever possible to avoid collisions with environments (we'll get there). Both do a lot of things, but the most common things you'll be doing is installing and uninstalling modules.

To install:
`conda install MODULE_NAME`
or
`pip install MODULE_NAME`

To uninstall:
`conda uninstall MODULE_NAME`
or
`pip uninstall MODULE_NAME`

## Conda environments

The big reason to use Anaconda over plain old boring Python is how Anaconda handles environments. Environments are basically virtual machines, but for Python. They have some version of Python installed, and some specified set of modules. They are completely separate and independent from your core Python installation, meaning you can easily spin up different combinations of modules and versions without affecting your host OS. This is great for testing your code on old versions of modules, trying beta features, or for setting up a module that might break some other module you use. Below are a list of useful commands. Check out the [documentation](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-with-commands) for more information.

To create a new environment, installing named packages into it:
`conda create --name environment_name python=2.7 matplotlib`
`conda create --name environment_name python=3.9 numpy`
`conda create --name environment_name python=3.5 pygame`

List all environments:
`conda info --envs`

Load or unload an environment:
`conda activate|deactivate environment_name`

Delete an environment (remove all packages):
`conda remove --name environment_name --all`

Install packages into the current environment:
`conda install numpy`

List currently installed packages in current environment:
`conda list`

Note that the `base` environment refers to your overall Anaconda installation (hence "base") and is the default environment.

## Jupyter Notebook

> The Jupyter Notebook is an open-source web application that allows you to create and share documents that contain live code, equations, visualizations and narrative text. Uses include: data cleaning and transformation, numerical simulation, statistical modeling, data visualization, machine learning, and much more. ([jupyter.org](https://jupyter.org/))

While not specific to Python, Jupyter is a super cool and intuitive way to code. Some of the most notable features are in-line [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) support (basically makes the notebook into an interactive textbook), per-section running (you don't need to re-run the entire program if you just change one section), and a clean and easy to use web-based IDE. Note that it is web-based, not internet-based. Files are stored locally, the environment is run locally, and everything else is done locally. It just happens to run in a web browser.

Jupyter notebooks are great for code that isn't going to be a dependency for something else. For example, machine learning projects are almost always run in Jupyter notebooks since the data pre-processing stage only has to be run once, while the ML portion can be run as many times as the user wishes. I'll be using Jupyter Notebook to walk you through the basics of programming with Python.

Install Jupyter notebook with
`conda install -c conda-forge notebook`
or
`pip install notebook`

You can launch a Jupyter Notebook by cd'ing into a project directory and running `jupyter notebook`

## Let's Code!

Clone this repository (if you haven't already), `cd` to it, and run `jupyter notebook`. It should open a new tab in your browser.

Click `Python.ipynb`, and I'll see you in the notebook!
