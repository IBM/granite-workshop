---
title: Granite Workshop Lab 5
description: Multimodal RAG using Granite and Docling
logo: images/ibm-blue-background.png
---

# Multimodal RAG using Granite and Docling

[Retrieval-augmented generation (RAG)](https://www.ibm.com/think/topics/retrieval-augmented-generation) is a technique used with large language models (LLMs) to connect the model with a knowledge base of information outside the data the LLM has been trained on without having to perform [fine-tuning](https://www.ibm.com/think/topics/rag-vs-fine-tuning). Traditional RAG is limited to text-based use cases such as text summarization and chatbots.

Multimodal RAG can use [multimodal](https://www.ibm.com/think/topics/multimodal-ai) LLMs (MLLM) to process information from multiple types of data to be included as part of the external knowledge base used in RAG. Multimodal data can include text, images, audio, video or other forms. Popular multimodal LLMs include Google’s Gemini, Meta’s Llama 3.2 and OpenAI’s GPT-4 and GPT-4o.

For this lab, you will use IBM Granite models capable of processing different modalities. You will create an AI system to answer real-time user queries from unstructured data in a PDF.

## Prerequisites

This lab is a [Jupyter notebook](https://jupyter.org/). Please follow the instructions in [pre-work](../pre-work/README.md) to run the lab.

## Lab

[![Multimodal RAG using Granite and Docling](https://badgen.net/badge/icon/github?icon=github&label=View%20on "View on GitHub")]({{ config.repo_url }}/blob/{{ git.commit }}/notebooks/Granite_Multimodal_RAG.ipynb){:target="_blank"}
[![Multimodal RAG using Granite and Docling](https://colab.research.google.com/assets/colab-badge.svg "Open In Colab")]({{ extra.colab_url }}/blob/{{ git.commit }}/notebooks/Granite_Multimodal_RAG.ipynb){:target="_blank"}

To run the notebook from your command line in Jupyter using the active virtual environment from the [pre-work](../pre-work/README.md#install-jupyter), run:

```shell
jupyter notebook notebooks/Granite_Multimodal_RAG.ipynb
```

The path of the notebook file above is relative to the `granite-workshop` folder from the git clone in the [pre-work](../pre-work/README.md#clone-the-granite-workshop-repository).

## Credits

This notebook is a modified version of the IBM Granite Community [Multimodal RAG using Granite and Docling](https://github.com/ibm-granite-community/granite-snack-cookbook/blob/main/recipes/RAG/Granite_Multimodal_RAG.ipynb) notebook. Refer to the [IBM Granite Community](https://github.com/ibm-granite-community) for the official notebooks.
