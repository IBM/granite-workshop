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
- Python 3.10, 3.11, or 3.12

### Clone the Granite Workshop Repository

Clone the workshop repo and cd into the repo directory.

```shell
git clone https://github.com/IBM/granite-workshop.git
cd granite-workshop
```

### Serving the Granite AI Models

The labs require Granite models to be served by an AI model runtime so that the models can be invoked or called. There are 2 options to serve the models as follows:

- [Replicate AI Cloud Platform](#replicate-ai-cloud-platform) OR
- [Running Ollama Locally](#running-ollama-locally)

[Lab 5: Multimodal RAG using Granite and Docling](../lab-5/README.md) requires Replicate.

#### Replicate AI Cloud Platform

[Replicate](https://replicate.com/) is a cloud platform that will host and serve AI models for you.

1. Create a [Replicate](https://replicate.com/) account. You will need a [GitHub](https://github.com/) account to do this.

1. Add credit to your Replicate Account (optional). To remove a barrier to entry to try the Granite models on the Replicate platform, use [this link](https://replicate.com/invites/a8717bfe-2f3d-4a52-88ed-1356231cdf03) to add a small amount of credit to your Replicate account.

1. Create a Replicate [API Token](https://replicate.com/account/api-tokens).

1. Set your Replicate API Token as an environment variable in your terminal where you will run the notebook:

    ```shell
    export REPLICATE_API_TOKEN=<your_replicate_api_token>
    ```

#### Running Ollama Locally

If you want to run the AI models locally on your computer, you can use [Ollama](https://ollama.com/). You will need to have a computer with:

- GPU processor
- At least 32GB RAM, preferably more

!!! note "Tested system"
    This was tested on a Macbook with an M1 processor and 32GB RAM. It maybe possible to serve models with a CPU and less memory.

If you computer is unable to serve the models, then it is recommended to go to the [Replicate AI Cloud Platform](#replicate-ai-cloud-platform) section instead.

Running Ollama locally on your computer requires the following steps:

1. [Download and install Ollama](https://github.com/ollama/ollama?tab=readme-ov-file#ollama), if you haven't already. **Ollama v0.5.13+ is required, so please upgrade if on an earlier version.**

    On macOS, you can use Homebrew to install with

    ```shell
    brew install ollama
    ```

1. Start the Ollama server. You will leave this running during the workshop.

    ```shell
    ollama serve
    ```

1. In another terminal window, pull down the Granite models you will want to use in the workshop. Larger models take more memory to run but can give better results.

    ```shell
    ollama pull granite3.3:2b
    ollama pull granite3.3:8b
    ```

### Install Jupyter

!!! note "Use a virtual environment"
    Before installing dependencies and to avoid conflicts in your environment, it is advisable to use a [virtual environment (venv)](https://docs.python.org/3/library/venv.html).

1. Create virtual environment:

    ```shell
    python3 -m venv --upgrade-deps --clear venv
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

!!! note "Notebook execution speed tip" The default execution runtime in Colab uses a CPU. Consider using a different Colab runtime to increase execution speed, especially in situations where you may have other constraints such as a slow network connection. From the navigation bar, select `Runtime->Change runtime type`, then select either GPU- or TPU-based hardware acceleration.

### Colab Prerequisites

- [Google Colab](https://colab.research.google.com) requires a Google account that you're logged into

### Serving the Granite AI Models for Colab

The labs require Granite models to be served by an AI model runtime so that the models can be invoked or called.

#### Replicate AI Cloud Platform for Colab

[Replicate](https://replicate.com/) is a cloud platform that will host and serve AI models for you.

1. Create a [Replicate](https://replicate.com/) account. You will need a [GitHub](https://github.com/) account to do this.

1. Add credit to your Replicate Account (optional). To remove a barrier to entry to try the Granite models on the Replicate platform, use [this link](https://replicate.com/invites/a8717bfe-2f3d-4a52-88ed-1356231cdf03) to add a small amount of credit to your Replicate account.

1. Create a Replicate [API Token](https://replicate.com/account/api-tokens).

1. Add your Replicate API Token to the Colab Secrets manager to securely store it. Open [Google Colab](https://colab.research.google.com) and click on the 🔑 Secrets tab in the left panel. Click "New Secret" and enter `REPLICATE_API_TOKEN` as the key, and paste your token into the value field. Toggle the button on the left to allow notebook access to the secret.
