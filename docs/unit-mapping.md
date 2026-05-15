# Unit Mapping Documentation

## Overview

This document describes the unit mappings used in the Vienna demographic forecasting project.

The mappings support:

- FAIR data interoperability
- machine-readable metadata
- semantic consistency
- DBRepo integration
- reproducible demographic analytics

The project aligns quantitative values with established unit and measurement standards.

---

# Standards Used

| Standard | Purpose |
|---|---|
| QUDT | Quantitative units and dimensions |
| SDMX | Statistical classifications |
| OWL-Time | Temporal references |

---

# Database Schema Context

The mappings correspond to the normalized relational schema implemented in DBRepo.

Main tables:

- Population_statistics
- District
- Time_dimension
- Sex
- Age_group
- Nationality_group

---

# Population Count Mapping

## population_count

| Property | Value |
|---|---|
| Semantic Meaning | Number of persons |
| Unit Type | Count |
| Standard | QUDT |
| QUDT URI | http://qudt.org/vocab/unit/NUM |

The `population_count` field stores aggregated counts of persons belonging to a demographic category.

---

# Temporal Mapping

## year

| Property | Value |
|---|---|
| Semantic Meaning | Calendar year |
| Standard | OWL-Time |
| Data Type | Integer |

The `year` field represents the reference year for demographic observations.

---

## ref_date

| Property | Value |
|---|---|
| Semantic Meaning | Reference date |
| Standard | OWL-Time |
| Data Type | Date |

The `ref_date` field stores the temporal observation reference.

---

# Geographic Mapping

## district_code

| Property | Value |
|---|---|
| Semantic Meaning | Administrative district identifier |
| Standard | SDMX |
| Data Type | Integer |

District codes identify Vienna administrative regions.

---

# Demographic Classification Mapping

## sex_id

| Property | Value |
|---|---|
| Semantic Meaning | Demographic sex classification |
| Standard | SDMX |
| Data Type | Integer |

Sex categories:

| Value | Meaning |
|---|---|
| 1 | Male |
| 2 | Female |

---

## age_group_id

| Property | Value |
|---|---|
| Semantic Meaning | Age category classification |
| Standard | SDMX |
| Data Type | Integer |

Age groups represent 5-year demographic intervals.

---

## nationality_code

| Property | Value |
|---|---|
| Semantic Meaning | Nationality classification |
| Standard | SDMX |
| Data Type | String |

Nationality groups:

| Code | Meaning |
|---|---|
| AUT | Austrian nationals |
| EEA | European Economic Area nationals |
| REU | Remaining European nationals |
| TCN | Third-country nationals |

---

# SQL Views

The mappings also apply to the DBRepo-compatible SQL views.

Implemented views:

| View Name | Purpose |
|---|---|
| population_by_district | District-level demographic records |
| population_by_nationality | Nationality-based demographic records |
| population_pyramid_base | Age-sex demographic structure |

---

# FAIR Interoperability Goals

The mappings improve:

- semantic consistency
- metadata interoperability
- machine readability
- reproducibility
- FAIR compliance

The mappings support integration with:

- Croissant metadata
- FAIR4ML metadata
- DBRepo APIs
- machine learning workflows

---

# Repository

GitHub repository:

```text id="n6w1p4"
https://github.com/Muhammad123255/vienna-demographic-forecast