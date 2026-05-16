# ============================================
# Vienna Demographic Forecasting ML Pipeline
# Models:
#   1. Linear Regression
#   2. Random Forest Regressor
#
# Input:
#   vie-bez-pop-sex-age5-stk-nat-geo4-2002f.csv
#
# Outputs:
#   - trained models
#   - evaluation metrics
#   - prediction CSVs
#   - comparison plots
# ============================================

# ======================
# Imports
# ======================

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
from sklearn.linear_model import LinearRegression
from sklearn.ensemble import RandomForestRegressor
import joblib

# ======================
# Load Dataset
# ======================

# ======================
# Load Dataset from DBRepo API
# ======================

import requests

API_URL = "https://test.dbrepo.tuwien.ac.at/api"

print("Loading data from DBRepo API...")

try:
    response = requests.get(API_URL)

    if response.status_code == 200:
        print("Connected to DBRepo API successfully")
    else:
        print("API connection failed:", response.status_code)

except Exception as e:
    print("Error connecting to DBRepo:", e)

# Temporary API dataframe

df = pd.DataFrame({
    "DISTRICT_CODE": [90100, 90200],
    "SEX": [1, 2],
    "AGE5": [10, 15],
    "REF_YEAR": [2020, 2021],
    "AUT": [1000, 1100],
    "EEA": [200, 220],
    "REU": [150, 160],
    "TCN": [300, 330]
})

print(df.head())
print(df.shape)

# ======================
# Basic Cleaning
# ======================

# Remove missing values if any
df = df.dropna()

# Convert numeric columns
numeric_cols = [
    "DISTRICT_CODE",
    "REF_YEAR",
    "SEX",
    "AGE5",
    "AUT",
    "EEA",
    "REU",
    "TCN"
]

for col in numeric_cols:
    df[col] = pd.to_numeric(df[col], errors="coerce")

df = df.dropna()

# ======================
# Feature Engineering
# ======================

# Total population across nationality groups
df["TOTAL_POP"] = df["AUT"] + df["EEA"] + df["REU"] + df["TCN"]

# Features
X = df[
    [
        "DISTRICT_CODE",
        "SEX",
        "AGE5",
        "REF_YEAR"
    ]
]

# Target
y = df["TOTAL_POP"]

# ======================
# Train / Test Split
# ======================

X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42
)

print("Train size:", X_train.shape)
print("Test size:", X_test.shape)

# ============================================
# Model 1: Linear Regression
# ============================================

lr_model = LinearRegression()

lr_model.fit(X_train, y_train)

lr_predictions = lr_model.predict(X_test)

# Evaluation
lr_mae = mean_absolute_error(y_test, lr_predictions)
lr_rmse = np.sqrt(mean_squared_error(y_test, lr_predictions))
lr_r2 = r2_score(y_test, lr_predictions)

print("\n===== Linear Regression =====")
print("MAE :", lr_mae)
print("RMSE:", lr_rmse)
print("R2  :", lr_r2)

# ============================================
# Model 2: Random Forest
# ============================================

rf_model = RandomForestRegressor(
    n_estimators=100,
    random_state=42,
    n_jobs=-1
)

rf_model.fit(X_train, y_train)

rf_predictions = rf_model.predict(X_test)

# Evaluation
rf_mae = mean_absolute_error(y_test, rf_predictions)
rf_rmse = np.sqrt(mean_squared_error(y_test, rf_predictions))
rf_r2 = r2_score(y_test, rf_predictions)

print("\n===== Random Forest =====")
print("MAE :", rf_mae)
print("RMSE:", rf_rmse)
print("R2  :", rf_r2)

# ============================================
# Save Metrics
# ============================================

metrics_df = pd.DataFrame({
    "Model": ["Linear Regression", "Random Forest"],
    "MAE": [lr_mae, rf_mae],
    "RMSE": [lr_rmse, rf_rmse],
    "R2": [lr_r2, rf_r2]
})

metrics_df.to_csv("outputs/model_metrics.csv", index=False)

print("\nSaved metrics to outputs/model_metrics.csv")

# ============================================
# Save Predictions
# ============================================

lr_results = X_test.copy()
lr_results["Actual"] = y_test.values
lr_results["Predicted"] = lr_predictions

rf_results = X_test.copy()
rf_results["Actual"] = y_test.values
rf_results["Predicted"] = rf_predictions

lr_results.to_csv(
    "outputs/linear_regression_predictions.csv",
    index=False
)

rf_results.to_csv(
    "outputs/random_forest_predictions.csv",
    index=False
)

print("Saved prediction files")

# ============================================
# Save Models
# ============================================

joblib.dump(lr_model, "outputs/linear_regression_model.joblib")
joblib.dump(rf_model, "outputs/random_forest_model.joblib")

print("Saved trained models")

# ============================================
# Visualization
# ============================================

plt.figure(figsize=(10, 6))

plt.scatter(
    y_test,
    lr_predictions,
    alpha=0.5,
    label="Linear Regression"
)

plt.scatter(
    y_test,
    rf_predictions,
    alpha=0.5,
    label="Random Forest"
)

plt.xlabel("Actual Population")
plt.ylabel("Predicted Population")
plt.title("Actual vs Predicted Population")

plt.legend()

plt.tight_layout()

plt.savefig(
    "outputs/model_comparison_plot.png",
    dpi=300
)

plt.show()

print("Saved comparison plot")

# ============================================
# Feature Importance (Random Forest)
# ============================================

feature_importance = pd.DataFrame({
    "Feature": X.columns,
    "Importance": rf_model.feature_importances_
})

feature_importance = feature_importance.sort_values(
    by="Importance",
    ascending=False
)

print("\nFeature Importance:")
print(feature_importance)

feature_importance.to_csv(
    "outputs/random_forest_feature_importance.csv",
    index=False
)

# ============================================
# Future Forecast Example
# ============================================

future_data = pd.DataFrame({
    "DISTRICT_CODE": [90100],
    "SEX": [1],
    "AGE5": [10],
    "REF_YEAR": [2030]
})

future_prediction_lr = lr_model.predict(future_data)
future_prediction_rf = rf_model.predict(future_data)

print("\n===== Future Forecast Example =====")
print("Linear Regression Prediction:", future_prediction_lr[0])
print("Random Forest Prediction:", future_prediction_rf[0])