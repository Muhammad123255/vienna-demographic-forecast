# Vienna-Demographic-Forecast

Data Stewardship Course — FAIR Data Science Part 3 Project

---

# Project Title

Forecasting Demographic Changes in the Population in Vienna using Machine Learning

---

# Project Overview

This project focuses on forecasting demographic changes in Vienna using machine learning and FAIR data stewardship principles.

The workflow includes:

* demographic data preprocessing
* SQL aggregation views
* metadata generation
* FAIR documentation
* DBRepo API preparation
* machine learning pipeline preparation
* reproducible research workflows

The project follows FAIR principles:

* Findable
* Accessible
* Interoperable
* Reusable

---

# Dataset Description

The project uses demographic population data from Statistik Austria.

The dataset contains demographic indicators such as:

* district
* year
* sex
* nationality group
* population totals
* age-related statistics

The processed dataset is stored in the `data/` directory.

---

# Repository Structure

```text
vienna-demographic-forecast/
│
├── data/                  # Processed demographic datasets
├── docs/                  # Documentation and schema files
├── metadata/              # FAIR metadata and model documentation
├── notebooks/             # Jupyter notebooks
├── outputs/               # Generated outputs and results
├── sql/                   # SQL aggregation views
├── src/                   # Python source code
├── tests/                 # Test files
│
├── CITATION.cff
├── LICENSE
├── README.md
└── requirements.txt
```

---

# Database Schema

Database schema documentation is available in:

```text
docs/database-schema.md
```

The schema was adapted to match the real demographic dataset structure instead of the initially simplified structure.

---

# SQL Views

The project contains demographic SQL aggregation views inside:

```text
sql/views.sql
```

The SQL views generate:

* yearly population summaries
* district-level aggregations
* nationality summaries
* demographic feature views

Example views:

* yearly_population_summary
* district_population_summary
* nationality_population_summary

---

# Data Preprocessing

Main preprocessing script:

```text
src/01_preprocess_data.py
```

The preprocessing workflow includes:

* cleaning demographic records
* handling missing values
* feature preparation
* dataset transformation
* export preparation for ML workflows

---

# DBRepo API Integration

The project includes DBRepo API preparation for FAIR repository integration.

Python API loader:

```text
src/dbrepo_api_loader.py
```

Notebook for testing:

```text
notebooks/dbrepo_api_test.ipynb
```

The DBRepo workflow is prepared for:

* REST API testing
* demographic SQL view retrieval
* dataframe loading
* metadata integration

---

# Metadata Files

The repository includes multiple FAIR metadata standards.

## Croissant Metadata

```text
metadata/croissant.json
```

## FAIR4ML Metadata

```text
metadata/fair4ml-metadata.json
```

## Model Card

```text
metadata/model-card.md
```

## Citation Metadata

```text
CITATION.cff
```

---

# Machine Learning Workflow

Planned ML workflow:

1. demographic data preprocessing
2. feature engineering
3. training dataset creation
4. model training
5. prediction generation
6. evaluation and visualization

Potential ML models:

* Random Forest
* XGBoost
* Linear Regression
* Time-series forecasting models

---

# Reproducibility

To reproduce the environment:

```bash
pip install -r requirements.txt
```

Run preprocessing:

```bash
python src/01_preprocess_data.py
```

Run DBRepo API loader:

```bash
python src/dbrepo_api_loader.py
```

---

# Requirements

Main Python libraries:

* pandas
* numpy
* scikit-learn
* matplotlib
* requests
* jupyter

---

# Licensing

## Input Dataset License

The demographic dataset from Statistik Austria is provided under:

```text
Creative Commons Attribution 4.0 International (CC BY 4.0)
```

Source dataset:

```text
https://www.statistik.at/
```

## Software License

This repository uses the MIT License.

The license file is included in:

```text
LICENSE
```

---

# Contributors

* A — Bernhard Siegl — ORCID: TODO
* B — Muhammad Umer Raza — ORCID: TODO
* C — Jannatul Jahan Bonny — ORCID: TODO
* D — Usman Arif — ORCID: [https://orcid.org/0009-0004-1313-6270](https://orcid.org/0009-0004-1313-6270)

---

# Persistent Identifiers

GitHub repository:

```text
https://github.com/Muhammad123255/vienna-demographic-forecast
```

GitHub release:

```text
https://github.com/Muhammad123255/vienna-demographic-forecast/releases/tag/v1.0
```

Zenodo DOI badge:

```text
TODO after Zenodo release
```

DBRepo entry:

```text
TODO
```

TU Wien Research Data Repository deposit:

```text
TODO
```

---

# Related Documentation

* Unit mapping: `docs/unit-mapping.md`
* FAIR4ML metadata: `metadata/fair4ml-metadata.json`
* Model card: `metadata/model-card.md`
* CodeMeta metadata: `codemeta.json`
* Croissant metadata: `metadata/croissant.json`

---

# Citation

Please cite this repository using the metadata provided in:

```text
CITATION.cff
```

---

# FAIR Principles Compliance

This project supports FAIR data stewardship practices through:

* metadata documentation
* persistent identifiers
* reusable licensing
* interoperable data formats
* reproducible workflows
* repository integration preparation

---

# Status

Current project progress includes:

* demographic preprocessing
* SQL aggregation views
* FAIR metadata preparation
* ORCID integration
* DBRepo API preparation
* repository documentation
* citation metadata

Machine learning forecasting implementation is currently in progress.
