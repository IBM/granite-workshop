---
title: Granite Workshop Pre-work
description: Preparation for the Granite Workshop
logo: images/ibm-blue-background.png
---

# Pre-work

The labs in the workshop are [Jupyter notebooks](https://jupyter.org/). The notebooks can be run on your computer or remotely on the [Google Colab](https://colab.research.google.com) service. Check out [Running the Granite Notebooks](#running-the-granite-notebooks) section on how to setup the way you want to run the notebooks.

## Running the Granite Notebooks

The notebooks can be run:

- [Locally on your computer](#running-the-granite-notebooks-locally) OR
- [Remotely on the Google Colab service](#running-the-granite-notebooks-remotely-colab)

Follow the instructions in one of the sections that follow on how you would like to run the notebooks.

## Running the Granite Notebooks Locally

It is recommended if you want to run the lab notebooks locally on your computer that you have:

- A computer or laptop
- Knowledge of [Git](https://git-scm.com/) and [Python](https://www.python.org/)

If not, then it recommended to go to the [Running the Granite Notebooks Remotely (Colab)](#running-the-granite-notebooks-remotely-colab) section instead.

Running the lab notebooks locally on your computer requires the following steps:

- [Local Prerequisites](#local-prerequisites)
- [Clone the Granite Workshop Repository](#clone-the-granite-workshop-repository)
- [Serving the Granite AI Models](#serving-the-granite-ai-models)
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

### Serving the Granite AI Models

[Lab 1: Document Summarization with Granite](../lab-1/README.md), [Lab 2: Retrieval Augmented Generation (RAG) with Langchain](../lab-2/README.md) and [Lab 4: Generating Bash Code with Granite Code](../lab-4/README.md) require Granite models to be served by an AI model runtime so that the models can be invoked or called. There are 2 options to serve the models as follows:

- [Running Ollama Locally](#running-ollama-locally) OR
- [Replicate AI Cloud Platform](#replicate-ai-cloud-platform)

#### Running Ollama Locally

It is recommended if you want to run [Ollama](https://ollama.com/) locally on your computer to serve models that you have a computer with:

- GPU processor
- At least 32GB RAM

!!! note "Tested system"
    This was tested on a Macbook with an M1 processor and 32GB RAM. It maybe possible to serve models with a CPU and less memory.

If you computer is unable to serve the models, then it is recommended to go to the [Replicate AI Cloud Platform](#replicate-ai-cloud-platform) section instead.

Running Ollama locally on your computer requires the following steps:

1. [Download and install Ollama](https://github.com/ollama/ollama?tab=readme-ov-file#ollama), if you haven't already. **Ollama v0.3.14+ is required.**

    On macOS, you can use Homebrew to install with

    ```shell
    brew install ollama
    ```

1. Start the Ollama server.

    ```shell
    ollama serve
    ```

1. In another terminal window, pull down the Granite models you will want to use in the workshop. Larger models take more memory to run.

    ```shell
    ollama pull granite-code:3b
    ollama pull granite-code:8b
    ollama pull granite-code:20b
    ollama pull granite3-dense:2b
    ollama pull granite3-dense:8b
    ```

#### Replicate AI Cloud Platform

[Replicate](https://replicate.com/) is a cloud platform that will host and serve AI models for you. It is recommended if you do not have the hardware to serve models.

1. Create a [Replicate](https://replicate.com/) account. You will need a [GitHub](https://github.com/) account to do this.

1. Add credit to your Replicate Account (optional). To remove a barrier to entry to try the Granite models on the Replicate platform, use [this link](https://replicate.com/invites/a8717bfe-2f3d-4a52-88ed-1356231cdf03) to add a small amount of credit to your Replicate account.

1. Create a Replicate [API Token](https://replicate.com/account/api-tokens).

1. Set your Replicate API Token as an environment variable in your terminal where you will run the notebook:

    ```shell
    export REPLICATE_API_TOKEN=<your_replicate_api_token>
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
    python3 -m pip install --require-virtualenv notebook ipywidgets
    ```

    For more information, see the [Jupyter installation instructions](https://jupyter.org/install)

1. To open a notebook in Jupyter (in the active virtual environment), run:

    ```shell
    jupyter notebook <notebook-file-path>
    ```

## Running the Granite Notebooks Remotely (Colab)

Running the lab notebooks remotely using [Google Colab](https://colab.research.google.com) requires the following steps:

- [Colab Prerequisites](#colab-prerequisites)
- [Serving the Granite AI Models for Colab](#serving-the-granite-ai-models-for-colab)

### Colab Prerequisites

- [Google Colab](https://colab.research.google.com) requires a Google account that you're logged into

### Serving the Granite AI Models for Colab

[Lab 1: Document Summarization with Granite](../lab-1/README.md), [Lab 2: Retrieval Augmented Generation (RAG) with Langchain](../lab-2/README.md) and [Lab 4: Generating Bash Code with Granite Code](../lab-4/README.md) require Granite models to be served by an AI model runtime so that the models can be invoked or called. There are 2 options to serve the models when using Colab as follows:

- [Ollama running in Colab](#ollama-running-in-colab) OR
- [Replicate AI Cloud Platform for Colab](#replicate-ai-cloud-platform-for-colab)

#### Ollama running in Colab

!!! note "Limitations"
    Running the Ollama server in Colab will limit the size of Granite models you can use and be _significantly_ slower when calling the Granite models. It is therefore recommended to use [Replicate AI Cloud Platform for Colab](#replicate-ai-cloud-platform-for-colab) instead.

!!! attention "GPU Hardware Accelerator"
    Once each notebook has been opened in Colab, you can modify the notebook's runtime type to select a GPU hardware accelerator.
    Using the "Runtime->Change runtime type" menu item, select "T4 GPU" instead of "CPU" and save.
    This will improve the performance of the Ollama server.
    There are limitations on using a GPU hardware accelerator especially on the free tier. Check out documentation for more details.

The Jupyter notebooks for [Lab 1: Document Summarization with Granite](../lab-1/README.md), [Lab 2: Retrieval Augmented Generation (RAG) with Langchain](../lab-2/README.md) and [Lab 4: Generating Bash Code with Granite Code](../lab-4/README.md) include cells for the steps that need to be executed to run Ollama in Colab. Run the relevant cells when you are running the notebook.

#### Replicate AI Cloud Platform for Colab

[Replicate](https://replicate.com/) is a cloud platform that will host and serve AI models for you. It is recommended if you do not have the hardware to serve models.

1. Create a [Replicate](https://replicate.com/) account. You will need a [GitHub](https://github.com/) account to do this.

1. Add credit to your Replicate Account (optional). To remove a barrier to entry to try the Granite Code models on the Replicate platform, use [this link](https://replicate.com/invites/a8717bfe-2f3d-4a52-88ed-1356231cdf03) to add a small amount of credit to your Replicate account.

1. Create a Replicate [API Token](https://replicate.com/account/api-tokens).

1. Add your Replicate API Token to the Colab Secrets manager to securely store it. Open [Google Colab](https://colab.research.google.com) and click on the 🔑 Secrets tab in the left panel. Click "New Secret" and enter `REPLICATE_API_TOKEN` as the key, and paste your token into the value field. Toggle the button on the left to allow notebook access to the secret.
