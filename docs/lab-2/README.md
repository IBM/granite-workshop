---
title: Granite Workshop Lab 2
description: Retrieval Augmented Generation (RAG) with Langchain
logo: images/ibm-blue-background.png
---

# Retrieval Augmented Generation (RAG) with Langchain

[Retrieval Augmented Generation (RAG)](https://research.ibm.com/blog/retrieval-augmented-generation-RAG) is an architectural pattern that can be used to augment the performance of language models by recalling factual information from a knowledge base, and adding that information to the model query.

The goal of this lab is to show how you can use RAG with an [IBM Granite](https://www.ibm.com/granite) model to augment the model query answer using a publicly available document.

## Pre-requisite

This lab is a [Jupyter notebook](https://jupyter.org/). Please follow the instructions in [pre-work](../pre-work/README.md) to run the lab.

## Lab

[![Retrieval Augmented Generation (RAG) with Langchain notebook](https://badgen.net/badge/icon/github?icon=github&label=View%20on "View on GitHub")]({{ config.repo_url }}/blob/{{ git.commit }}/notebooks/RAG_with_Langchain.ipynb){:target="_blank"}
[![Retrieval Augmented Generation (RAG) with Langchain notebook](https://colab.research.google.com/assets/colab-badge.svg "Open In Colab")]({{ extra.colab_url }}/blob/{{ git.commit }}/notebooks/RAG_with_Langchain.ipynb){:target="_blank"}

To run the notebook from your command line in Jupyter using the active virtual environment from the [pre-work](../pre-work/README.md#install-jupyter), run:

```shell
jupyter notebook notebooks/RAG_with_Langchain.ipynb
```

The path of the notebook file above is relative to the `granite-workshop` folder from the git clone in the [pre-work](../pre-work/README.md#clone-the-granite-workshop-repository).

## Credits

This notebook is a modified version of the IBM Granite Community [Retrieval Augmented Generation (RAG) with Langchain](https://github.com/ibm-granite-community/granite-snack-cookbook/blob/main/recipes/RAG/RAG_with_Langchain.ipynb) notebook. Refer to the [IBM Granite Community](https://github.com/ibm-granite-community) for the official notebooks.
