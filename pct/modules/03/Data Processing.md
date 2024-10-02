# Data Loading and Preprocessing

We performed a comprehensive analysis on various types of data, including monthly data for every year, month-to-month changes, and yearly trends, as well as data with 10-minute sensitivity to capture more granular patterns and calculate the CPS1 scores.

### Data

The raw data is stored in multiple CSV files, with each file containing data for a specific month in a specific year. The dataset spans from January 2016 to December 2023, and each file has a similar structure, which allows for consistent processing. So analysis for monthly trends requires little processing.

But for analysis of yearly trends and changing the data sensitivity to 10 minutes required some preprocessing.

The folder structure follows a pattern where files are named based on the year and month, for example:
fnew-2023-01.csv
f 2016 12.csv
This structure allows us to load files dynamically for any given year or month.

### Loading Data

To load the data, we loop over the filenames for each year and month. Here’s the code to load and concatenate files for 2023:

**Load data for 2023**
file_path23 = [f"Time series data/fnew-2023-{j+1}.csv" for j in range(12)]
df23 = [pd.read_csv(file) for file in file_path23]
df_2023 = pd.concat(df23).reset_index(drop=True)

The above code loads individual CSV files for each month in 2023, reads them into DataFrames, and then concatenates them into one large DataFrame for analysis. We follow a similar process for previous years.

### Data Preprocessing

**Handling Missing Data**
Real-world datasets often contain missing values. We need to ensure that missing or incomplete data does not bias our analysis. We use pandas methods to handle missing values:

_Drop rows with missing values_
df_2023 = df_2023.dropna()

_Alternatively, fill missing values with the mean of the column_
df_2023 = df_2023.fillna(df_2023.mean())

**Standardizing Column Names**
To make the data easier to work with, column names should be consistent across files:

df_2023.columns = df_2023.columns.str.strip().str.lower().str.replace(' ', '_')

**Merging Data Across Years**
We need to create a unified DataFrame that includes data for all years from 2016 to 2023. Once the data for each year is loaded, we concatenate them:

all_data = pd.concat([df_2023, df_2022, df_2021, df_2020], ignore_index=True)

This unified dataset is now ready for time series analysis.

**Data Sensitivity Conversion: From 1-Second to 10-Minute Intervals**
The original dataset was recorded at very high frequency, but for practical analysis, such as detecting long-term trends or patterns, and calculating other metrics, it’s often useful to reduce the sensitivity. Converting the data to 10-minute intervals helps in smoothing out short-term fluctuations and allows for more meaningful comparisons.

To convert the data from a 1-second interval to a 10-minute interval, we use aggregation techniques such as resampling. This is done by grouping the data into 10-minute chunks and taking the average of the recorded values within each chunk.

_Assuming the 'Timestamp' column contains the 1-second interval data_
_Convert Timestamp to datetime if necessary_
df_2023['Timestamp'] = pd.to_datetime(df_2023['Timestamp'])

_Resampling the data to 10-minute intervals_
df_2023_10min = df_2023.resample('10T', on='Timestamp').mean().reset_index()

_Display the first few rows of the resampled data_
print(df_2023_10min.head())

This code resamples the data from 1-second intervals to 10-minute intervals. It computes the mean value within each 10-minute window, ensuring that the data is more manageable for analysis.
The reduced sensitivity helps in calculating metrics like CPS1 scores, which are best evaluated over longer intervals.




