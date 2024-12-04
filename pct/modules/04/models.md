# Models

## Approach
The project employs a machine learning model that provides **feature importance scores**. The model pipeline includes:

1. **Data Preprocessing**:
   - Handling missing values.
   - Encoding categorical features.
   - Scaling numerical features.

2. **Model Training**:
   - Likely candidates: Random Forest, Gradient Boosting Machines (GBM), or LightGBM.
   - Feature importance was extracted using intrinsic model properties.

3. **Performance Metrics**:
   - While the primary focus is on feature importance, accuracy and other metrics may also be evaluated.

## Optimization
- Feature engineering and selection techniques were applied to improve model performance.
- Insights from feature importance will guide resource allocation and future feature derivation.

Future work can include hyperparameter tuning or comparison with other model types.
