
# Data analytics and visualization in Python
## Overview: Time Series Data Analysis 

### Objective

The goal is to perform an in-depth analysis of historic time series data of the power grid system of Great Britain over a span of multiple years, from 2016 to 2023. By leveraging tools like pandas, matplotlib, and seaborn, it aims to uncover trends, patterns, and insights across different time periods.

Source of data: https://www.neso.energy/industry-information/balancing-services/frequency-response-services/historic-frequency-data

### Key Components

1.	**Data Loading**: Data is loaded from CSV files for each year and organized by month.
2.	**Data Preprocessing**: The data is cleaned and combined for ease of analysis.
3.	**Time Series Analysis**: Various metrics are computed, and monthly trends across different years along with yearly trends are compared.
4.	**Data Visualization**: Graphs and visual representations are generated to communicate key insights.

## Overview: Forecasting Solar-Energy Output
### Objective
The primary objective is to build and evaluate a predictive model, with a focus on understanding the relative importance of different features in making predictions. The model deals with structured data and aims to optimize prediction accuracy while providing explainability.  
We use historical time-series data from a specified region in Mississippi from 2006 to analyze and forecast solar-energy output.

### Key Components
1. Data Preparation: Importing, cleaning, and preprocessing data for modeling.
2. Model Development: Training machine learning models.
   - ARIMA model
   - Prophet model
   - LightGBM model
3. Feature Importance Analysis: Evaluating which features contribute the most to predictions.
3. Visualization: Graphically representing feature importance for interpretability.



