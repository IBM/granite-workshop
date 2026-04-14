---
title: Pre-work
description: Preparation for the Granite Workshop
logo: images/ibm-blue-background.png
---

# Pre-work

The labs in the workshop are [Jupyter notebooks](https://jupyter.org/). The notebooks can be run on your computer or remotely on the [Google Colab](https://colab.research.google.com) service.

# Running the Notebooks

Follow the instructions corresponding to how you want to run the notebooks:

- [Locally on your computer](#running-the-notebooks-locally) OR
- [Remotely on the Google Colab service](#running-the-notebooks-remotely-colab)

## Running the Notebooks Locally

It is recommended if you want to run the lab notebooks locally on your computer that you have:

- A computer or laptop
- Knowledge of [Git](https://git-scm.com/) and [Python](https://www.python.org/)

If not, then it recommended to go to the [Running the Notebooks Remotely (Colab)](#running-the-notebooks-remotely-colab) section instead.

Running the lab notebooks locally on your computer requires the following steps:

- [Local Prerequisites](#local-prerequisites)
- [Serving the Granite AI Models for locally run Notebooks](#serving-the-granite-ai-models-for-locally-run-notebooks)
- [Clone the Workshop Repository](#clone-the-workshop-repository)
- [Install Jupyter](#install-jupyter)

### Local Prerequisites

- Git
- Python 3.11, 3.12, or 3.13

/// tip | Installing Python

If you don't have Python installed, or the installed version is not one of the versions supported by this workshop, you should consider installing and using the [`uv` tool](https://docs.astral.sh/uv/getting-started/installation/) to assist in installing the proper Python version.
`uv` works on macOS, Linux, and Windows.
Once `uv` is installed, you can install Python 3.13 with

```shell
uv python install --default 3.13
```

You can then update the shell configurations files to add the Python commands to the PATH.

```shell
uv python update-shell
```

///

### Clone the Workshop Repository

Clone the workshop repo and cd into the repo directory.

```shell
git clone https://github.com/IBM/granite-workshop.git
cd granite-workshop
```

### Serving the Granite AI Models for locally run Notebooks

The labs require Granite models to be served by an AI model runtime so that the models can be invoked or called. The following sections provide instructions to either run the models in the cloud using [Replicate](https://replicate.com/) or locally using [Ollama](https://ollama.com/).

/// note | Requires Replicate
[Lab 5. Multimodal RAG using Granite and Docling](../lab-5/README.md) requires Replicate.
///

#### Replicate AI Cloud Platform

[Replicate](https://replicate.com/) is a cloud platform that will host and serve AI models for you.

1. Create a [Replicate](https://replicate.com/) account. You will need a [GitHub](https://github.com/) account to do this.

1. Add credit to your Replicate Account (optional). To remove a barrier to entry to try the models on the Replicate platform, use [this link](https://replicate.fyi/ibm) to add a small amount of credit to your Replicate account.

1. Create a Replicate [API Token](https://replicate.com/account/api-tokens).

1. Set your Replicate API Token as an environment variable in your terminal where you will run the notebook:

    ```shell
    export REPLICATE_API_TOKEN=<your_replicate_api_token>
    ```

#### Local Model Inference with Ollama

If you want to run the AI models locally on your computer, you can use [Ollama](https://ollama.com/).

Ollama is a lightweight tool for running LLMs locally from the command line.

You will need to have a computer with:

- GPU processor
- At least 32GB RAM, preferably more

/// note | Tested system
This was tested on a MacBook with an M1 processor and 32GB RAM. It maybe possible to serve models with a CPU and less memory.
///

/// tip | Apple Silicon
If you have a Mac with Apple Silicon (M1/M2/M3), Ollama can leverage the Metal GPU for accelerated inference.
///

If you computer is unable to serve the models, then it is recommended to go to the [Replicate AI Cloud Platform](#replicate-ai-cloud-platform) section instead.

Running Ollama locally on your computer requires the following steps:

1. Download and install [Ollama](https://ollama.com/download) for your platform.

2. Pull the Granite model:

    ```shell
    ollama pull ibm/granite4:micro
    ```

3. Ollama runs automatically and exposes an OpenAI-compatible API at <http://localhost:11434>

### Install Jupyter

/// note | Use a virtual environment
Before installing dependencies and to avoid conflicts in your environment, it is advisable to use a [virtual environment (venv)](https://docs.python.org/3/library/venv.html).
///

1. Create virtual environment:

    /// tab | uv

    ```shell
    uv venv --clear --seed --python 3.13 venv
    ```

    ///

    /// tab | venv

    ```shell
    python3 -m venv --upgrade-deps --clear venv
    ```

    ///

1. Activate the virtual environment by running:

    ```shell
    source venv/bin/activate
    ```

1. Install Jupyter notebook in the virtual environment:

    /// tab | uv

    ```shell
    uv pip install notebook ipywidgets
    ```

    ///

    /// tab | venv

    ```shell
    python3 -m pip install --require-virtualenv notebook ipywidgets
    ```

    ///

    For more information, see the [Jupyter installation instructions](https://jupyter.org/install)

1. To open a notebook in Jupyter (in the active virtual environment), run:

    ```shell
    jupyter notebook <notebook-file-path>
    ```

## Running the Notebooks Remotely (Colab)

Running the lab notebooks remotely using [Google Colab](https://colab.research.google.com) requires the following steps:

- [Colab Prerequisites](#colab-prerequisites)
- [Serving the Granite AI Models for Colab](#serving-the-granite-ai-models-for-colab)

/// note | Notebook execution speed tip
The default execution runtime in Colab uses a CPU. Consider using a different Colab runtime to increase execution speed, especially in situations where you may have other constraints such as a slow network connection. From the navigation bar, select `Runtime->Change runtime type`, then select either GPU- or TPU-based hardware acceleration.
///

### Colab Prerequisites

- [Google Colab](https://colab.research.google.com) requires a Google account that you're logged into.

### Serving the Granite AI Models for Colab

The labs require Granite models to be served by an AI model runtime so that the models can be invoked or called.

#### Replicate AI Cloud Platform for Colab

[Replicate](https://replicate.com/) is a cloud platform that will host and serve AI models for you.

1. Create a [Replicate](https://replicate.com/) account. You will need a [GitHub](https://github.com/) account to do this.

1. Add credit to your Replicate Account (optional). To remove a barrier to entry to try the Granite models on the Replicate platform, use [this link](https://replicate.fyi/ibm) to add a small amount of credit to your Replicate account.

1. Create a Replicate [API Token](https://replicate.com/account/api-tokens).

1. Add your Replicate API Token to the Colab Secrets manager to securely store it. Open [Google Colab](https://colab.research.google.com) and click on the 🔑 Secrets tab in the left panel. Click "New Secret" and enter `REPLICATE_API_TOKEN` as the key, and paste your token into the value field. Toggle the button on the left to allow notebook access to the secret.
