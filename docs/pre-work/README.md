---
title: Granite Workshop Pre-work
description: Preparation for the Granite Workshop
logo: images/ibm-blue-background.png
---

# Pre-work

The labs in the workshop are [Jupyter notebooks](https://jupyter.org/). The notebooks can be run on your computer or remotely on [Google Colab](https://colab.google/). Follow the instructions in the section that follow on how you would like to run the notebooks.

[Lab 1: Document Summarization](../lab-1/README.md), [Lab 2: Retrieval Augmented Generation (RAG) with Langchain](../lab-2/README.md) and [Lab 4: Generating Bash Code with Granite Code](../lab-4/README.md) require Granite models to be served by a AI model runtime so that the models can be inferred or called. The workshop uses [Ollama](https://github.com/ollama/ollama) to serve the models.

## Running the Granite Notebooks Locally

Running the lab notebooks locally on your computer requires the following steps:

- [Local Prerequisites](#local-prerequisites)
- [Clone the Granite Workshop Repository](#clone-the-granite-workshop-repository)
- [Running Ollama Locally](#running-ollama-locally)
- [Install Jupyter](#install-jupyter)

### Local Prerequisites

- Git
- Python 3.10 or 3.11

### Clone the Granite Workshop Repository

Clone the workshop repo and cd into the repo directory.

```shell
git clone https://github.com/IBM/granite-workshop.git
cd granite-workshop
```

### Running Ollama Locally

1. [Download and install Ollama](https://github.com/ollama/ollama?tab=readme-ov-file#ollama), if you haven't already.

    On macOS, you can use Homebrew to install with

    ```shell
    brew install ollama
    ```

1. Start the Ollama server.

    ```shell
    ollama serve
    ```

1. Pull down the Granite models you will want to use in the workshop. Larger models take more memory to run.

    ```shell
    ollama pull granite-code:3b
    ollama pull granite-code:8b
    ollama pull granite-code:20b
    ```

### Install Jupyter

!!! note "Use a virtual environment"
    Before installing dependencies and to avoid conflicts in your environment, it is advisable to use a [virtual environment (venv)](https://docs.python.org/3/library/venv.html).

1. Create virtual environment:

    ```shell
    python3 -m venv --upgrade-deps venv
    ```

1. Activate the virtual environment by running:

    ```shell
    source venv/bin/activate
    ```

1. Install Jupyter notebook in the virtual environment:

    ```shell
    python3 -m pip install notebook ipywidgets
    ```

    For more information, see the [Jupyter installation instructions](https://jupyter.org/install)

1. To open a notebook in Jupyter (in the active virtual environment), run:

    ```shell
    jupyter notebook <notebook-file-path>
    ```

## Running the Granite Notebooks Remotely (Colab)

Running the lab notebooks remotely using [Google Colab](https://colab.google/) require the following steps:

- [Colab Prerequisites](#colab-prerequisites)
- [Running Ollama in Colab](#running-ollama-in-colab)

### Colab Prerequisites

- [Google Colab](https://colab.google/) requires a Google account that you're logged into

### Running Ollama in Colab

!!! note "Limitations"
    Running the Ollama server in Colab will limit the size of Granite models you can use and be _significantly_ slower when calling the Granite models.

The Jupyter notebooks for [Lab 1: Document Summarization](../lab-1/README.md), [Lab 2: Retrieval Augmented Generation (RAG) with Langchain](../lab-2/README.md) and [Lab 4: Generating Bash Code with Granite Code](../lab-4/README.md) include cells for the following steps that  need to be run before proceeding with the remainder of the notebook.

1. Download and install Ollama in Colab

    ```shell
    !curl https://ollama.ai/install.sh | sh
    ```

1. Start the Ollama server as a background process in Colab using `nohup` and `&`

    ```python
    import os
    os.system("nohup ollama serve &")
    ```

1. Pull down the Granite models in Colab that you will use in the workshop. Larger models take more memory to run. The `granite-code:20b` model is too large for the Colab runtime environment.

    ```shell
    !ollama pull granite-code:3b
    !ollama pull granite-code:8b
    ```
