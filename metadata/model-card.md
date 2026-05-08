# Model Card

# Vienna Demographic Forecasting Model

## Model Overview

This project develops machine learning models for forecasting demographic population changes in Vienna districts using aggregated demographic indicators.

The forecasting workflow uses historical demographic data grouped by:

- district
- year
- sex
- age group
- nationality category

The project supports FAIR data stewardship principles and reproducible machine learning workflows.

---

# Intended Use

The model is intended for:

- demographic trend forecasting
- urban population analysis
- district-level population studies
- educational and research purposes
- FAIR ML workflow demonstrations

---

# Out-of-Scope Use

The model must NOT be used for:

- individual-level prediction
- legal or administrative decision-making
- surveillance
- discriminatory profiling
- migration enforcement
- automated policy decisions

---

# Dataset Description

## Raw Dataset

```text
data/vie-bez-pop-sex-age5-stk-nat-geo4-2002f.csv