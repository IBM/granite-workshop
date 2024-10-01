# Pre-work

This section will give you InstrucLab background as well as guide you through the neccessary prerequisites and installations

## Background

#### What is an LLM?
Large language models (LLMs) are a category of foundation models trained on immense amounts of data making them capable of
understanding and generating natural language and other types of content to perform a wide range of tasks.

##### Granite
Granite is a family of IBM artificial intelligence (AI) models built for business, to help drive trust and scalability in AI-driven applications.

#### Why should you use Granite?
XXXXXXXXXXXXXXXXXXXXXXXXXX

## Running the Granite Notebooks Locally
How to run the Granite Jupyter notebooks on your computer.

## Clone the Granite Workshop Repository

Clone the repo and cd into the repo directory.


```python
git clone git@github.com:IBM/granite-workshop.git

cd granite-workshop
```

## Create and Activate a Virtual Environment

Use a [python virtual environment](https://docs.python.org/3/library/venv.html) for installed libraries. Open a terminal, and from the command line, run:


```python
python -m venv .venv
```

Activate the virtual environment in the by running:


```python
source ./.venv/bin/activate
```

## Install and Run Jupyter

For more detail, see the installation Instructions at [Jupyter.org](https://jupyter.org/install)

Install jupyter notebook with pip in the virtual environment:


```python
pip install notebook
```

## Open a Recipe in Jupyter Notebook

To open a recipe notebook in jupyter, from the virtual environment, run:

```jupyter notebook <recipe-notebook-file-path>```

To run the "Text to Shell" recipe from the repository root, for example:


```python
jupyter notebook ./notebooks/Text_to_Shell/Text_to_Shell.ipynb
```

You should see the notebook in your browser now!

## Extra: Jupyter Lab

[Jupyter Lab](https://jupyter.org/try-jupyter/lab/) provides a web-based notebook IDE, for interactive development of Jupyter notebooks.


```python

##### Download via the Ollama website

[Download Ollama](https://ollama.com/download/Ollama-darwin.zip) via the website.

Unzip the folder, and move the Ollama app to your applications folder.

##### Terminal Installation

Open up a terminal, and install [homebrew](https://brew.sh/).

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After the installation is complete, install [ollama](https://ollama.com) via `brew`.

```bash
brew install ollama
```

Next, start up ollama from a terminal window:
```bash
ollama serve
```
And leave that terminal window running for the rest of the labs.

### Windows installation steps

Install ollama via the website [here](https://ollama.com/download/windows).


With this you should have the knowledge and applications you need, so let's start the workshop!

