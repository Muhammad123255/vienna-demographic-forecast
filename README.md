# Vienna-Demographic-Forecast

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20120239.svg)](https://doi.org/10.5281/zenodo.20120239)

Data Stewardship Course — FAIR Data Science Part 3 Project

---

# Project Title

Forecasting Demographic Changes in the Population in Vienna using Machine Learning

---

# Abstract

This project uses open demographic data to forecast population changes in Vienna using machine learning and FAIR data stewardship principles.

The input dataset contains yearly population counts from 2002 to 2025 grouped by:

- district
- sex
- 5-year age group
- nationality group

The workflow combines:

- demographic data preprocessing
- normalized relational database design
- SQL analytical views
- metadata generation
- FAIR documentation
- DBRepo API integration
- machine learning pipeline preparation
- reproducible research workflows

The project follows FAIR principles:

- Findable
- Accessible
- Interoperable
- Reusable

---

# Repository Structure

```text
vienna-demographic-forecast/
│
├── data/                  # Input and processed demographic datasets
├── docs/                  # Documentation and schema files
├── metadata/              # FAIR metadata and model documentation
├── notebooks/             # Jupyter notebooks for DBRepo API testing
├── outputs/               # Generated outputs and results
├── sql/                   # SQL analytical views
├── src/                   # Python source code
├── tests/                 # Test files
│
├── CITATION.cff
├── LICENSE
├── README.md
├── codemeta.json
└── requirements.txt
```

---

# File Organisation

The repository follows a consistent naming convention for all files.

## Input Datasets

Raw input datasets downloaded from official data portals are kept with their original source filenames to preserve provenance and improve traceability.

The raw input dataset used in this project is:

```text
vie-bez-pop-sex-age5-stk-nat-geo4-2002f.csv
```

Additional raw datasets added later will also preserve their original filenames.

---

## Processed Datasets

Processed datasets follow the naming pattern:

```text
processed_<description>_<version>.<extension>
```

Example:

```text
processed_population_long_v1.csv
```

---

## Output Files

Output files follow the naming pattern:

```text
output_<content>_<model-or-method>_<version>.<extension>
```

Examples:

```text
output_predictions_random_forest_v1.csv
output_evaluation_metrics_random_forest_v1.csv
output_population_forecast_plot_v1.png
```

---

## Model Artefacts

Model artefacts follow the naming pattern:

```text
model_<algorithm>_<target>_<version>.<extension>
```

Example:

```text
model_random_forest_population_forecast_v1.pkl
```

---

## Scripts

Scripts follow the naming pattern:

```text
<step-number>_<task-description>.py
```

Examples:

```text
01_preprocess_data.py
02_train_model.py
03_evaluate_model.py
04_load_to_dbrepo.py
```

---

## Configuration Files

Configuration files follow the naming pattern:

```text
config_<purpose>.<extension>
```

Example:

```text
config_model_training.yaml
```

---

# Dataset Description

The project uses demographic population data from Statistik Austria.

## Dataset Title

Population by sex, 5-year age groups and nationality since 2002 - districts of Vienna

The dataset contains yearly population counts from 2002 to 2025 grouped by:

- district
- sex
- age group
- nationality group

Nationality groups are represented by the columns:

- AUT
- EEA
- REU
- TCN

---

## Sources

- data.gv.at
- data.europa.eu

Original provider:

- Statistik Austria

---

## Input Data Licence

Creative Commons Attribution 4.0 International (CC BY 4.0)

---

# Raw Dataset Columns

| Column | Meaning |
|---|---|
| NUTS | NUTS region code |
| DISTRICT_CODE | Vienna district code |
| SUB_DISTRICT_CODE | Sub-district code |
| REF_YEAR | Reference year |
| REF_DATE | Reference date |
| SEX | Encoded sex category |
| AGE5 | Encoded 5-year age group |
| AUT | Population count for Austrian nationals |
| EEA | Population count for EEA nationals |
| REU | Population count for remaining European nationals |
| TCN | Population count for third-country nationals |

---

# Processed Dataset

For the machine learning workflow, the nationality columns AUT, EEA, REU, and TCN are transformed into long format.

The processed dataset contains:

| Column | Meaning |
|---|---|
| NUTS | NUTS region code |
| DISTRICT_CODE | Vienna district code |
| SUB_DISTRICT_CODE | Sub-district code |
| REF_YEAR | Reference year |
| REF_DATE | Reference date |
| SEX | Sex category |
| AGE5 | 5-year age group category |
| nationality_group | Nationality group (AUT, EEA, REU, TCN) |
| population_count | Population count for selected group |

---

# Database Schema

Database schema documentation is available in:

```text
docs/database-schema.md
```

The project uses a normalized relational database schema (3NF) implemented in DBRepo.

Main relational tables:

- Population_statistics
- District
- Time_dimension
- Sex
- Age_group
- Nationality_group

The normalized schema improves:

- FAIR interoperability
- metadata consistency
- DBRepo compatibility
- reproducible analytical workflows

---

# SQL Views

The project contains DBRepo-compatible SQL views inside:

```text
sql/views.sql
```

The SQL views are implemented using the normalized relational schema stored in DBRepo.

The views support:

- demographic filtering
- district-level demographic access
- nationality analysis
- population pyramid preparation
- machine learning preprocessing

Due to DBRepo SQL limitations, the views use simplified SQL operations such as:

- projections
- joins
- filtering
- ordering

Complex aggregations and unsupported SQL constructs are avoided.

---

## Complete List of Views

| View Name | Purpose |
|---|---|
| population_by_district | Population records by district and year |
| population_by_nationality | Population grouped by nationality category |
| population_pyramid_base | Age-sex demographic structure for visualization and ML preparation |

---

# Data Preprocessing

Main preprocessing script:

```text
src/01_preprocess_data.py
```

The preprocessing workflow includes:

- cleaning demographic records
- handling missing values
- feature preparation
- dataset transformation
- export preparation for machine learning workflows

---

# DBRepo API Integration

The project includes DBRepo API integration for FAIR repository workflows.

## Python API Loader

```text
src/dbrepo_api_loader.py
```

## Notebook for Testing

```text
notebooks/dbrepo_api_test.ipynb
```

The notebook demonstrates:

- retrieval of demographic data exclusively from DBRepo REST API
- access to SQL VIEW endpoints
- dataframe loading using pandas
- reproducible FAIR workflows

The notebook currently tests the following DBRepo-compatible views:

- population_by_district
- population_by_nationality
- population_pyramid_base

---

# API Information

## API Base URL

```text
https://test.dbrepo.tuwien.ac.at/api
```

## Dataset ID

```text
38707917-e942-45c3-a3dd-d2bfc1c106af
```

## Authentication Method

```text
None (public dataset)
```

---

# Metadata Files

| Metadata Type | File |
|---|---|
| Croissant Metadata | metadata/croissant.json |
| FAIR4ML Metadata | metadata/fair4ml-metadata.json |
| Model Card | metadata/model-card.md |
| CodeMeta | codemeta.json |
| Citation Metadata | CITATION.cff |

---

# Machine Learning Workflow

Planned machine learning workflow:

- demographic data preprocessing
- feature engineering
- training dataset creation
- model training
- prediction generation
- evaluation and visualization

Machine learning models:

- Random Forest
- Linear Regression

---

# Installation

Clone the repository:

```bash
git clone https://github.com/Muhammad123255/vienna-demographic-forecast.git
cd vienna-demographic-forecast
```

Install dependencies:

```bash
pip install -r requirements.txt
```

---

# Reproduction Instructions

## Step 1: Preprocess the Data

```bash
python src/01_preprocess_data.py
```

## Step 2: Test DBRepo API Connection

```bash
jupyter notebook notebooks/dbrepo_api_test.ipynb
```

## Step 3: Run SQL Views

Execute the views in `sql/views.sql`.

## Step 4: Train Models

```bash
python src/02_train_model.py
```

## Step 5: Evaluate Results

```bash
python src/03_evaluate_model.py
```

---

# Requirements

Main Python libraries:

- pandas
- numpy
- scikit-learn
- matplotlib
- requests
- jupyter
- joblib

Full list with versions: `requirements.txt`

---

# Outputs

The project produces:

- cleaned datasets
- feature-engineered datasets
- train/validation/test splits
- trained machine learning models
- prediction files
- evaluation metrics
- plots and visualisations
- DBRepo-compatible analytical outputs

---

# Licensing

## Input Dataset License

Creative Commons Attribution 4.0 International (CC BY 4.0)

Source dataset:

```text
https://www.statistik.at/
```

---

## Software License

This repository uses the MIT License.

License file:

```text
LICENSE
```

---

## Produced Data License

Produced artefacts including:

- cleaned datasets
- ML-ready datasets
- predictions
- evaluation results
- visualisations
- trained models

---

# Contributors

| Role | Name | ORCID |
|---|---|---|
| A | Bernhard Siegl | https://orcid.org/0009-0008-7401-6845 |
| B | Muhammad Umer Raza | https://orcid.org/0009-0003-6708-7518 |
| C | Jannatul Jahan Bonny | https://orcid.org/0009-0004-6244-3437 |
| D | Usman Arif | https://orcid.org/0009-0004-1313-6270 |

---

# Persistent Identifiers

| Artefact | Identifier |
|---|---|
| GitHub Repository | https://github.com/Muhammad123255/vienna-demographic-forecast |
| GitHub Release | https://github.com/Muhammad123255/vienna-demographic-forecast/releases/tag/v1.0 |
| Zenodo DOI | https://doi.org/10.5281/zenodo.20120239 |
| DBRepo Entry | https://test.dbrepo.tuwien.ac.at/database/38707917-e942-45c3-a3dd-d2bfc1c106af |
| TUWRD Model Deposit DOI | TODO |
| TUWRD Generated Data Deposit DOI | TODO |

---

# Related Documentation

- docs/unit-mapping.md
- docs/database-schema.md
- docs/semantic-mapping.md
- metadata/fair4ml-metadata.json
- metadata/model-card.md
- metadata/croissant.json
- codemeta.json
- CITATION.cff

---
