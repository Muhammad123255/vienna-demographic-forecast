# vienna-demographic-forecast

Data Stewardship Course – FAIR Data Science Part 3 Project

## Project title

Forecasting Demographic Changes in the Population in Vienna using Machine Learning

## Abstract

This project uses open demographic data to forecast population changes in Vienna. The input dataset contains yearly population counts from 2002 to 2025, grouped by district, sex, 5-year age group, and nationality group. The aim is to build a reproducible machine learning workflow that prepares the data, trains forecasting models, evaluates the results, and publishes the research artefacts according to FAIR principles.

---

# Repository structure

- `data/` — input datasets and processed datasets.
- `src/` — source code for preprocessing, feature engineering, SQL/API integration, model training, and evaluation.
- `outputs/` — generated outputs such as predictions, evaluation tables, figures, and trained model artefacts.
- `docs/` — documentation files, schema documentation, and FAIR-related reports.
- `metadata/` — machine-readable metadata files including FAIR4ML, Croissant, and model card metadata.
- `sql/` — SQL aggregation views used for DBRepo and ML-ready demographic summaries.
- `notebooks/` — Jupyter notebooks for DBRepo API testing and exploratory analysis.
- `tests/` — placeholder folder for future automated tests.

---

# File organisation

The repository follows a consistent naming convention for all files.

## Input datasets

Raw input datasets downloaded from official data portals are kept with their original source filenames to preserve provenance and make the source easier to trace.

The raw input dataset used in this project is named:

`vie-bez-pop-sex-age5-stk-nat-geo4-2002f.csv`

If additional raw input datasets are added later, their original source filenames will also be preserved and documented in this README.

---

## Processed datasets

Processed datasets are named using the pattern:

`processed_<description>_<version>.<extension>`

Example:

`processed_population_long_v1.csv`

---

## Output files

Output files are named using the pattern:

`output_<content>_<model-or-method>_<version>.<extension>`

Examples:

`output_predictions_random_forest_v1.csv`

`output_evaluation_metrics_random_forest_v1.csv`

`output_population_forecast_plot_v1.png`

---

## Model artefacts

Model artefacts are named using the pattern:

`model_<algorithm>_<target>_<version>.<extension>`

Example:

`model_random_forest_population_forecast_v1.pkl`

---

## Scripts

Scripts are named using the pattern:

`<step-number>_<task-description>.py`

Examples:

`01_preprocess_data.py`

`02_train_model.py`

`03_evaluate_model.py`

`04_load_to_dbrepo.py`

---

## Configuration files

Configuration files are named using the pattern:

`config_<purpose>.<extension>`

Example:

`config_model_training.yaml`

---

# Input data

The project uses the dataset:

`vie-bez-pop-sex-age5-stk-nat-geo4-2002f.csv`

Dataset title:

**Population by sex, 5-year age groups and nationality since 2002 - districts of Vienna**

The dataset contains yearly population counts from 2002 to 2025 by district, sex, age group, and nationality group.

The nationality groups are represented by the columns:

- `AUT`
- `EEA`
- `REU`
- `TCN`

Source:
- data.gv.at
- data.europa.eu

Original data provider:
- Statistik Austria

Input data licence:
- Creative Commons Attribution 4.0 International (CC BY 4.0)

---

# Raw dataset columns

| Column | Meaning |
|---|---|
| `NUTS` | NUTS region code |
| `DISTRICT_CODE` | Vienna district code |
| `SUB_DISTRICT_CODE` | Sub-district code |
| `REF_YEAR` | Reference year |
| `REF_DATE` | Reference date |
| `SEX` | Encoded sex category |
| `AGE5` | Encoded 5-year age group |
| `AUT` | Population count for Austrian nationals |
| `EEA` | Population count for EEA nationals |
| `REU` | Population count for remaining European nationals |
| `TCN` | Population count for third-country nationals |

---

# Processed dataset

For the machine learning pipeline, the nationality columns `AUT`, `EEA`, `REU`, and `TCN` are transformed into long format.

The processed dataset contains:

| Column | Meaning |
|---|---|
| `NUTS` | NUTS region code |
| `DISTRICT_CODE` | Vienna district code |
| `SUB_DISTRICT_CODE` | Sub-district code |
| `REF_YEAR` | Reference year |
| `REF_DATE` | Reference date |
| `SEX` | Sex category |
| `AGE5` | 5-year age group category |
| `nationality_group` | Nationality group (`AUT`, `EEA`, `REU`, `TCN`) |
| `population_count` | Population count for selected group |

---

# SQL Views

The repository contains SQL aggregation views in:

`sql/views.sql`

These views provide:

- yearly demographic summaries;
- district-level population aggregation;
- nationality-group statistics;
- ML-ready analytical tables;
- DBRepo-compatible SQL views for API access.

Example views include:

- `yearly_population_summary`
- `district_sex_summary`
- `nationality_group_summary`

---

# Outputs

The project produces:

- cleaned datasets;
- feature-engineered datasets;
- train/validation/test splits;
- trained machine learning models;
- prediction files;
- evaluation metrics;
- plots and visualisations;
- DBRepo-compatible demographic summaries.

---

# Requirements and installation

The project uses Python 3.10+.

Required packages:

- pandas
- numpy
- scikit-learn
- matplotlib
- requests

Install dependencies with:

```bash
pip install -r requirements.txt
