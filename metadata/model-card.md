# Model Card

# Vienna Demographic Population Forecasting Model

## Model Overview

This project develops machine learning workflows for forecasting demographic population changes in Vienna using aggregated statistical data.

The forecasting workflow uses historical demographic observations grouped by:

- district
- sex
- age group
- nationality category
- year

The project supports FAIR data stewardship, metadata interoperability, and reproducible ML workflows.

---

# Model Details

| Attribute | Value |
|---|---|
| Model type | Random Forest Regressor |
| ML framework | scikit-learn |
| Prediction task | Population forecasting |
| Target variable | population_count |
| Task category | Regression |
| Geographic scope | Vienna, Austria |
| Temporal coverage | 2002–2024 |
| Dataset source | Statistik Austria |

---

# Input Features

| Feature | Description |
|---|---|
| REF_YEAR | Reference year |
| DISTRICT_CODE | Vienna district identifier |
| SUB_DISTRICT_CODE | Sub-district identifier |
| SEX | Sex category |
| AGE5 | 5-year age group |
| nationality_group | Nationality category |

---

# Target Variable

```text
population_count