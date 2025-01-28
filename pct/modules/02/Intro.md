Time Series Data Analysis
Objective
The goal is to perform an in-depth analysis of historic time series data of the power grid system of Great Britain over a span of multiple years, from 2016 to 2023. By leveraging tools like pandas, matplotlib, and seaborn, it aims to uncover trends, patterns, and insights across different time periods.

Source of data: https://www.neso.energy/industry-information/balancing-services/frequency-response-services/historic-frequency-data

Purpose
Statistical Exploration
Compute key metrics like mean, standard deviation, skewness, and custom metrics (e.g., CPS1) to understand data behavior.
Identify patterns and anomalies over time.
Visualization:
Create time-series plots, histograms, kernel density plots, and boxplots to visually represent data trends and distributions.
Anomaly and Outlier Detection:
Detect and quantify deviations from expected values using threshold probabilities and outlier analysis based on the interquartile range (IQR).
Granular and Aggregated Analysis:
Analyze data for specific months (detailed analysis).
Compare data across multiple years and months (aggregated analysis).
User Interactivity:
Allow users to input a specific year and month for tailored analysis, making the notebook flexible and reusable for different datasets.





Forecasting Solar-Energy Output
Objective
The primary objective is to build and evaluate a predictive model, with a focus on understanding the relative importance of different features in making predictions. The model deals with structured data and aims to optimize prediction accuracy while providing explainability.
We use historical time-series data from a specified region in Mississippi from 2006 to analyze and forecast solar-energy output.

Purpose
To develop a machine learning pipeline.
To analyze feature importance for interpretability.
To improve predictive accuracy using feature engineering and optimization techniques.
