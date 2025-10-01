from sklearn import datasets, linear_model
import numpy as np

# Load the diabetes dataset
diabetes_X, diabetes_y = datasets.load_diabetes(return_X_y=True)


# Split data
X_train = diabetes_X[:-20]
X_test = diabetes_X[-20:]
y_train = diabetes_y[:-20]
y_test = diabetes_y[-20:]

# Train linear regression
regr = linear_model.LinearRegression()
regr.fit(X_train, y_train)

# Predict
y_pred = regr.predict(X_test)
print("Predictions:", y_pred)
