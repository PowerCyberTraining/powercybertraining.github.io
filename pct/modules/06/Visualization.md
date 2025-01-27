# Data Visualization



**Importance of Visualization**

Visualizations are a powerful way to interpret and communicate the findings from time series data. The goal is to simplify complex data and reveal underlying patterns that might not be apparent from the raw numbers.

#### Types of Visualizations Used

**Time series plot**: The most common visualization for time series data, used to track trends over time.

**Frequency distribution histogram**: To highlight the general shape of the data and its deviation.

**Box plot**: Useful for visualization of skewness and outliers.

We used each of the following plots for one second frequency for each month, 10 min interval frequency for each month, and for the distribution of CPS score for each month.

##### Time series plot

We used the following code for our time series plots.

plt.figure(figsize=(18, 6))
plt.plot(df['f'])
plt.xticks(ticks=[i*86400 for i in range(31)], labels=[str(i) for i in range(1, 32)])
plt.title(f'Frequency Time Series of {month}/{year}')
plt.xlabel(f'Time in days of {month}/20{year}')
plt.ylabel('Frequency')

##### Frequency distribution histogram
We had our histogram also displaying information about the probability of the frequency being more or less than our desired values, following the code.

prob_49_9 = (df['f'] < 49.9).mean()
prob_50_1 = (df['f'] > 50.1).mean()
plt.figure(figsize=(10, 5))
sns.histplot(df['f'], kde=True, label='Histogram', color='blue')
sns.kdeplot(df['f'], color='blue', label='KDE')

plt.axvline(x=49.9, color='red', linestyle='--', label=f'P(f < 49.9) = {prob_49_9:.2%}')
plt.axvline(x=50.1, color='green', linestyle='--', label=f'P(f > 50.1) = {prob_50_1:.2%}')

plt.fill_between(df['f'], 0, 1, where=(df['f'] < 49.9), color='red', alpha=0.2)
plt.fill_between(df['f'], 0, 1, where=(df['f'] > 50.1), color='green', alpha=0.2)

plt.text(x=0.01, y=0.94, s=f'Mean:                        {mean_value:.10f}', transform=plt.gca().transAxes, fontsize=10)
plt.text(x=0.01, y=0.90, s=f'Standard Deviation:    {std_dev:.10f}', transform=plt.gca().transAxes, fontsize=10)
plt.text(x=0.01, y=0.86, s=f'Skewness:                   {skew_ness:.10f}', transform=plt.gca().transAxes, fontsize=10)

plt.title(f'Distribution of Frequencies of {month}/{year}')
plt.legend()
plt.tight_layout()
plt.show()

##### Box Plot

This was very important for us to see the skewness and the outliers of the data. The code is the folllowing:

Q1 = np.percentile(df['f'], 25)
Q3 = np.percentile(df['f'], 75)
IQR = Q3 - Q1
lower_whisker = Q1 - 1.5 * IQR
upper_whisker = Q3 + 1.5 * IQR
up_outliers = df[df['f'] > upper_whisker]
low_outliers = df[df['f'] < lower_whisker]
prob_up = len(up_outliers)/len(df)
prob_low = len(low_outliers)/len(df)

plt.figure(figsize=(15, 5))
sns.boxplot(x=df['f'])
plt.title(f'Boxplot of Frequencies of {month}/{year}')
plt.text(df['f'].min(),0.4, f'Probability of upper outliers {prob_up}', fontsize=10)
plt.text(df['f'].min(),0.45, f'Probability of lower outliers {prob_low}', fontsize=10)
plt.show()





