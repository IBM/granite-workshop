# Pre-work

This section will give you InstrucLab background as well as guide you through the neccessary prerequisites and installations

## Background

#### What is an LLM?
Large language models (LLMs) are a category of foundation models trained on immense amounts of data making them capable of
understanding and generating natural language and other types of content to perform a wide range of tasks.

##### Granite
Granite is a family of IBM
XXXXXXXXXXXXXXXXXXXXXXXXXX

#### What is InstructLab?

InstructLab is an open-source AI project that aims to make it easier for anyone to contribute to Large Language Models (LLMs).
It's a community-driven initiative that allows users to add "skills" or "knowledge" to existing LLMs in a way that's both accessible and effective.

#### Why InstructLab
There are many projects rapidly embracing and extending permissively licensed AI models, but they are faced with three main challenges:

* Contribution to LLMs is not possible directly. They show up as forks, which forces consumers to choose a “best-fit” model that isn’t easily extensible. Also, the forks are expensive for model creators to maintain.
* The ability to contribute ideas is limited by a lack of AI/ML expertise. One has to learn how to fork, train, and refine models to see their idea move forward. This is a high barrier to entry.
* There is no direct community governance or best practice around review, curation, and distribution of forked models.

**InstructLab is here to solve these problems.**

The project enables community contributors to add additional "skills" or "knowledge" to a particular model.

InstructLab's model-agnostic technology gives model upstreams with sufficient infrastructure resources the ability to create regular builds of their open source licensed models not by rebuilding and retraining the entire model but by composing new skills into it.

Take a look at "lab-enhanced" models on the [InstructLab Hugging Face page](https://huggingface.co/instructlab).

#### How does InstructLab work?
InstructLab leverages [synthetic data](https://www.ibm.com/topics/synthetic-data) generation to create datasets used to tune models.
This allows users to tune models for specific tasks and teach models new knowledge without needing large amounts of user data.
The user provided data is added to a [taxonomy](https://github.com/instructlab/taxonomy) tree in the form of YAML files and markdown documents as needed for knowledge.
The InstructLab training process then generates sythetic data from the files in the taxonomy true and samlples from the data using the Lab tuning process.
More details and specifics in this process can be found [here](https://arxiv.org/pdf/2403.01081), in the original paper detailing this process created by
IBM researchers.

## Visual Studio Code

#### Mac installation steps

Open up a terminal, and install [homebrew](https://brew.sh/), if you haven't already.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After the installation is complete, install [vscode](https://code.visualstudio.com/) via `brew`.

```bash
brew install --cask visual-studio-code
```

### Windows installation steps

Install Code via the website [here](https://code.visualstudio.com/Download).

## Python

Python is a whole programming language. There are multpile ways to install it, and
[here is the offical website](https://www.python.org). Please take a moment and if you can't run
the following command, reach out to a teaching assissant or instructor to help you
get resolved.

```bash
python --version
Python 3.12.4
```

Please confirm that your `python --version` is at least `3.11+` for the best experience.

With this you should have the knowledge and applications you need, so let's start the workshop!

