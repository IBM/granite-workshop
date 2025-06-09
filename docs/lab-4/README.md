---
title: Granite Workshop Lab 4
description: Entity Extraction from text using Granite
logo: images/ibm-blue-background.png
---

# Entity Extraction from text using Granite

[Large Language Models (LLMs)](https://en.wikipedia.org/wiki/Large_language_model) have demonstrated remarkable accuracy in the task of entity extraction. This cookbook focuses on extracting key entities from descriptions related to books.

The goal of this lab is to show how you can use [IBM Granite](https://www.ibm.com/granite/docs/models/granite/) models in order to extract entity information from a document and return it in a specific format.

## Prerequisites

This lab is a [Jupyter notebook](https://jupyter.org/). Please follow the instructions in [pre-work](../pre-work/README.md) to run the lab.

## Lab

[![Entity Extraction from text using Granite notebook](https://badgen.net/badge/icon/github?icon=github&label=View%20on "View on GitHub")]({{ config.repo_url }}/blob/{{ git.commit }}/notebooks/entity_extraction.ipynb){:target="_blank"}
[![Entity Extraction from text using Granite notebook](https://colab.research.google.com/assets/colab-badge.svg "Open In Colab")]({{ extra.colab_url }}/blob/{{ git.commit }}/notebooks/entity_extraction.ipynb){:target="_blank"}

To run the notebook from your command line in Jupyter using the active virtual environment from the [pre-work](../pre-work/README.md#install-jupyter), run:

```shell
jupyter notebook notebooks/entity_extraction.ipynb
```

The path of the notebook file above is relative to the `granite-workshop` folder from the git clone in the [pre-work](../pre-work/README.md#clone-the-granite-workshop-repository).

## Credits

This notebook is a modified version of the IBM Granite Community [Entity Extraction from text using Granite](https://github.com/ibm-granite-community/granite-snack-cookbook/blob/main/recipes/Entity-Extraction/entity_extraction.ipynb) notebook. Refer to the [IBM Granite Community](https://github.com/ibm-granite-community) for the official notebooks.
