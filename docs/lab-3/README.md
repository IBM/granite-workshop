---
title: Granite Workshop Lab 3
description: Energy Demand Forecasting with Granite Timeseries (TTM)
logo: images/ibm-blue-background.png
---

# Energy Demand Forecasting with Granite Timeseries (TTM)

[Forecasting](https://www.ibm.com/think/topics/forecasting) in time series analysis allows data scientists to identify patterns by using machine learning and then generate forecasts about the future. [TinyTimeMixers (TTMs)](https://arxiv.org/abs/2401.03955) are compact pre-trained models for Multivariate Time-Series Forecasting.

The goal of this lab is to show how you can predict future trends on historical data using the [IBM Granite Time Series](https://www.ibm.com/granite/docs/models/time-series/) models.

## Pre-requisite

This lab is a [Jupyter notebook](https://jupyter.org/). Please follow the instructions in [pre-work](../pre-work/README.md) to run the lab.

## Lab

[![Energy Demand Forecasting with Granite Timeseries (TTM) notebook](https://badgen.net/badge/icon/github?icon=github&label=View%20on "View on GitHub")]({{ config.repo_url }}/blob/{{ git.commit }}/notebooks/Time_Series_Getting_Started.ipynb){:target="_blank"}
[![Energy Demand Forecasting with Granite Timeseries (TTM) notebook](https://colab.research.google.com/assets/colab-badge.svg "Open In Colab")]({{ extra.colab_url }}/blob/{{ git.commit }}/notebooks/Time_Series_Getting_Started.ipynb){:target="_blank"}

To run the notebook from your command line in Jupyter using the active virtual environment from the [pre-work](../pre-work/README.md#install-jupyter), run:

```shell
jupyter notebook notebooks/Time_Series_Getting_Started.ipynb
```

The path of the notebook file above is relative to the `granite-workshop` folder from the git clone in the [pre-work](../pre-work/README.md#clone-the-granite-workshop-repository).

## Credits

This notebook is a modified version of the IBM Granite Community [Energy Demand Forecasting with Granite Timeseries (TTM)](https://github.com/ibm-granite-community/granite-timeseries-cookbook/blob/main/recipes/Time_Series/Time_Series_Getting_Started.ipynb) notebook. Refer to the [IBM Granite Community](https://github.com/ibm-granite-community) for the official notebooks.
