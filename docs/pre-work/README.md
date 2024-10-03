# Pre-work

The labs in the workshop are [Jupyter notebooks](https://jupyter.org/). The notebooks can be run on your computer or remotely on [Google Colab](https://colab.google/). Follow the instructions in the section that follow on how you would like to run the notebooks.

## Running the Granite Notebooks Locally

Running the lab notebooks locally on your computer require the following setup:

- [Pre-requisite](#pre-requisite)
- [Clone the Granite Workshop Repository](#clone-the-granite-workshop-repository)
- [Running Granite model on Ollama](#running-granite-model-on-ollama)

### Pre-requisite

- Pip
- Python 3.10

### Clone the Granite Workshop Repository

Clone the repo and cd into the repo directory.

```shell
git clone git@github.com:IBM/granite-workshop.git
cd granite-workshop
```

### Running Granite model on Ollama

[Lab 1: Generating Bash Code with Granite Code and Ollama](lab-1/README.md)and [Lab 2: Retrieval Augmented Generation (RAG) with Langchain](lab-2/README.md) require Granite models to be served by a AI model runtime so that the models can be inferred or called. The workshop uses [Ollama](https://github.com/ollama/ollama) to serve the models. The subsection that follows shows how to setup Ollama on your computer.

#### Running Ollama Locally (Linux, MacOS, Windows)

1. [Download and install Ollama](https://github.com/ollama/ollama?tab=readme-ov-file#ollama), if you haven't already.
1. Start the Ollama server: `ollama serve`
1. Pull down Granite models:

```shell
ollama pull granite-code:3b
ollama pull granite-code:8b
ollama pull granite-code:20b
```

### Install Jupyter

> **Note: Before installing dependencies and to avoid conflicts in your environment, it is advisable to use a [virtual environment(venv)](https://docs.python.org/3/library/venv.html).**
>
> Create virutal environment:
>
> ```shell
> python -m venv .venv
>```
>
>Activate the virtual environment in the by running:
>
>```shell
> source ./.venv/bin/activate
>```

Install Jupyter notebook with pip in the virtual environment:

```shell
pip install notebook
```

For more detail, see the installation Instructions at [Jupyter.org](https://jupyter.org/install)

> **Note:** To open a notebook in Jupyter (from the virtual environment), run:
>
> ```shell
> jupyter notebook <notebook-file-path>
> ```

## Running the Granite Notebooks Remotely (Colab)

Running the lab notebooks remotely using [Google Colab](https://colab.google/) require the following setup:

- [Pre-requisite](#pre-requisite-1)
- [Running Granite model on Ollama](#running-granite-model-on-ollama-1)

### Pre-requisite

- [Google Colab](https://colab.google/) requires a Google account that you're logged into

### Running Granite model on Ollama

[Lab 1: Generating Bash Code with Granite Code and Ollama](lab-1/README.md)and [Lab 2: Retrieval Augmented Generation (RAG) with Langchain](lab-2/README.md) require Granite models to be served by a AI model runtime so that the models can be inferred or called. The workshop uses [Ollama](https://github.com/ollama/ollama) to serve the models. The subsection that follows shows how to setup Ollama in notebook on Colab.

#### Running Ollama in Notebook

> **Note:** The steps that follow need to be run in separate cells in the Jupyter notebooks of [Lab 1: Generating Bash Code with Granite Code and Ollama](lab-1/README.md)and [Lab 2: Retrieval Augmented Generation (RAG) with Langchain](lab-2/README.md), before starting the labs.

1. Download and install Ollama, if you haven't already:

```shell
!curl https://ollama.ai/install.sh | sh
```

1. Start the Ollama server using `nohup` and `&` will run the server in the background:

```python
import os
os.system("nohup ollama serve &")
```

1. Pull down Granite models:

```shell
!ollama pull granite-code:3b
!ollama pull granite-code:8b
!ollama pull granite-code:20b
```
