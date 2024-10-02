# Energy Demand Forecasting with Granite Timeseries (TTM)

TinyTimeMixers (TTMs) are compact pre-trained models for Multivariate Time-Series Forecasting, open-sourced by IBM Research. With less than 1 Million parameters, TTM introduces the notion of the first-ever "tiny" pre-trained models for Time-Series Forecasting. TTM outperforms several popular benchmarks demanding billions of parameters in zero-shot and few-shot forecasting and can easily be fine-tuned for multi-variate forecasts.

### Install the TSFM Library

The [granite-tsfm library](https://github.com/ibm-granite/granite-tsfm) provides utilities for working with Time Series Foundation Models (TSFM). Here the pinned version is retrieved and installed.

```python
# Install the tsfm library
! pip install "tsfm_public[notebooks] @ git+https://github.com/ibm-granite/granite-tsfm.git@v0.2.9" -U
```

### Import Packages

From `tsfm_public`, we use the TinyTimeMixer model, forecasting pipeline, and plotting function.

```python
import pandas as pd
import matplotlib.pyplot as plt

from tsfm_public import (
    TinyTimeMixerForPrediction,
    TimeSeriesForecastingPipeline,
)
from tsfm_public.toolkit.visualization import plot_predictions
```

### Download the data

We'll work with a dataset of hourly electrical demand, generation by type, prices, and weather in Spain.

1. Download the energy_data.csv.zip [dataset file from Kaggle here.](https://www.kaggle.com/datasets/nicholasjhana/energy-consumption-generation-prices-and-weather)
2. Edit the `DATA_FILE_PATH` below to point to the data file.

```python
DATA_FILE_PATH = "~/Downloads/energy_dataset.csv.zip"
```

### Specify time and output variables

We provide the names of the timestamp column and the target column to be predicted. The context length (in time steps) is set to match the pretrained model.

```python
timestamp_column = "time"
target_columns = ["total load actual"]
context_length = 512
```

### Read in the data

We parse the csv into a pandas dataframe, filling in any null values, and create a single window containing `context_length` time points. We ensure the timestamp column is a datetime.

```python
# Read in the data from the downloaded file.
input_df = pd.read_csv(
  DATA_FILE_PATH,
  parse_dates=[timestamp_column], # Parse the timestamp values as dates. 
)

# Fill NA/NaN values by propagating the last valid value.
input_df = input_df.ffill()

# Only use the last `context_length` rows for prediction.
input_df = input_df.iloc[-context_length:,]

# Show the last few rows of the dataset.
input_df.tail()
```

<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>time</th>
      <th>generation biomass</th>
      <th>generation fossil brown coal/lignite</th>
      <th>generation fossil coal-derived gas</th>
      <th>generation fossil gas</th>
      <th>generation fossil hard coal</th>
      <th>generation fossil oil</th>
      <th>generation fossil oil shale</th>
      <th>generation fossil peat</th>
      <th>generation geothermal</th>
      <th>...</th>
      <th>generation waste</th>
      <th>generation wind offshore</th>
      <th>generation wind onshore</th>
      <th>forecast solar day ahead</th>
      <th>forecast wind offshore day ahead</th>
      <th>forecast wind onshore day ahead</th>
      <th>total load forecast</th>
      <th>total load actual</th>
      <th>price day ahead</th>
      <th>price actual</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>35059</th>
      <td>2018-12-31 19:00:00+01:00</td>
      <td>297.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>7634.0</td>
      <td>2628.0</td>
      <td>178.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>277.0</td>
      <td>0.0</td>
      <td>3113.0</td>
      <td>96.0</td>
      <td>NaN</td>
      <td>3253.0</td>
      <td>30619.0</td>
      <td>30653.0</td>
      <td>68.85</td>
      <td>77.02</td>
    </tr>
    <tr>
      <th>35060</th>
      <td>2018-12-31 20:00:00+01:00</td>
      <td>296.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>7241.0</td>
      <td>2566.0</td>
      <td>174.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>280.0</td>
      <td>0.0</td>
      <td>3288.0</td>
      <td>51.0</td>
      <td>NaN</td>
      <td>3353.0</td>
      <td>29932.0</td>
      <td>29735.0</td>
      <td>68.40</td>
      <td>76.16</td>
    </tr>
    <tr>
      <th>35061</th>
      <td>2018-12-31 21:00:00+01:00</td>
      <td>292.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>7025.0</td>
      <td>2422.0</td>
      <td>168.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>286.0</td>
      <td>0.0</td>
      <td>3503.0</td>
      <td>36.0</td>
      <td>NaN</td>
      <td>3404.0</td>
      <td>27903.0</td>
      <td>28071.0</td>
      <td>66.88</td>
      <td>74.30</td>
    </tr>
    <tr>
      <th>35062</th>
      <td>2018-12-31 22:00:00+01:00</td>
      <td>293.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>6562.0</td>
      <td>2293.0</td>
      <td>163.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>287.0</td>
      <td>0.0</td>
      <td>3586.0</td>
      <td>29.0</td>
      <td>NaN</td>
      <td>3273.0</td>
      <td>25450.0</td>
      <td>25801.0</td>
      <td>63.93</td>
      <td>69.89</td>
    </tr>
    <tr>
      <th>35063</th>
      <td>2018-12-31 23:00:00+01:00</td>
      <td>290.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>6926.0</td>
      <td>2166.0</td>
      <td>163.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>...</td>
      <td>287.0</td>
      <td>0.0</td>
      <td>3651.0</td>
      <td>26.0</td>
      <td>NaN</td>
      <td>3117.0</td>
      <td>24424.0</td>
      <td>24455.0</td>
      <td>64.27</td>
      <td>69.88</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 29 columns</p>
</div>

### Plot the target series

Here we inspect a preview of the target time series column.

```python
fig, axs = plt.subplots(len(target_columns), 1, figsize=(10, 2 * len(target_columns)), squeeze=False)
for ax, target_column in zip(axs, target_columns):
    ax[0].plot(input_df[timestamp_column], input_df[target_column])
```

![png](Time_Series_Getting_Started_files/Time_Series_Getting_Started_12_0.png)

### Set up zero shot model

The TTM model is hosted on [HuggingFace](https://huggingface.co/ibm-granite/granite-timeseries-ttm-v1), and is retrieved by the wrapper, `TinyTimeMixerForPrediction`. We have one input channel in this example.

```python
# Instantiate the model.
zeroshot_model = TinyTimeMixerForPrediction.from_pretrained(
  "ibm-granite/granite-timeseries-ttm-v1", # Name of the model on HuggingFace.
  num_input_channels=len(target_columns) # tsp.num_input_channels,
)
```

### Create a forecasting pipeline

Set up the forecasting pipeline with the model, setting `frequency` given our knowledge of the sample frequency. In this example we set `explode_forecasts` to `True`, which will format the output for plotting the history and prediction period. We then make a forecast on the dataset.

```python
# Create a pipeline.
pipeline = TimeSeriesForecastingPipeline(
    zeroshot_model,
    timestamp_column=timestamp_column,
    id_columns=[],
    target_columns=target_columns,
    explode_forecasts=True,
    freq="h",
    device="cpu", # Specify your local GPU or CPU.
)

# Make a forecast on the target column given the input data.
zeroshot_forecast = pipeline(input_df)
zeroshot_forecast.tail()
```

<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>time</th>
      <th>total load actual_prediction</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>91</th>
      <td>2019-01-04 19:00:00+01:00</td>
      <td>31888.007812</td>
    </tr>
    <tr>
      <th>92</th>
      <td>2019-01-04 20:00:00+01:00</td>
      <td>31953.996094</td>
    </tr>
    <tr>
      <th>93</th>
      <td>2019-01-04 21:00:00+01:00</td>
      <td>31226.650391</td>
    </tr>
    <tr>
      <th>94</th>
      <td>2019-01-04 22:00:00+01:00</td>
      <td>29632.423828</td>
    </tr>
    <tr>
      <th>95</th>
      <td>2019-01-04 23:00:00+01:00</td>
      <td>27261.152344</td>
    </tr>
  </tbody>
</table>
</div>

### Plot predictions along with the historical data

The predicted series picks up where the historical data ends, and we can see that it predicts a continuation of the cyclical pattern and an upward trend.

```python
# Plot the historical data and predicted series.
plot_predictions(
    input_df=input_df,
    exploded_predictions_df=zeroshot_forecast,
    freq="h",
    timestamp_column=timestamp_column,
    channel=target_column,
    indices=[-1],
    num_plots=1,
)
```

![png](Time_Series_Getting_Started_files/Time_Series_Getting_Started_18_0.png)
