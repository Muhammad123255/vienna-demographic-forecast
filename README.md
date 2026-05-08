# Vienna-Demographic-Forecast

Data Stewardship Course — FAIR Data Science Part 3 Project

---

# Project Title

Forecasting Demographic Changes in the Population in Vienna using Machine Learning

---

# Project Overview

This project focuses on forecasting demographic changes in Vienna using machine learning and FAIR data stewardship principles.

The workflow includes:

- demographic data preprocessing
- SQL aggregation views
- metadata generation
- FAIR documentation
- DBRepo API preparation
- machine learning pipeline preparation
- reproducible research workflows

The project follows FAIR principles:

- Findable
- Accessible
- Interoperable
- Reusable

---

# Dataset Description

The project uses demographic population data from Statistik Austria.

The dataset contains demographic indicators such as:

- district
- year
- sex
- nationality group
- population totals
- age-related statistics

The processed dataset is stored in the `data/` directory.

---

# Repository Structure

```text
vienna-demographic-forecast/
│
├── data/                  # Processed demographic datasets
├── docs/                  # Documentation and schema files
├── metadata/              # FAIR metadata and model documentation
├── notebooks/             # Jupyter notebooks for DBRepo API testing
├── outputs/               # Generated outputs and results
├── sql/                   # SQL aggregation views
├── src/                   # Python source code
├── tests/                 # Test files
│
├── CITATION.cff
├── LICENSE
├── README.md
├── codemeta.json
└── requirements.txt