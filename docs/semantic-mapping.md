# Semantic Mapping Documentation

## Overview

This document describes the semantic mappings used in the Vienna demographic forecasting project.

The project applies semantic interoperability principles to support:

- FAIR data stewardship
- metadata interoperability
- machine-readable documentation
- DBRepo integration
- reproducible machine learning workflows

The mappings align the normalized relational database schema with established semantic vocabularies and ontology standards.

---

# Semantic Standards Used

| Standard | Purpose |
|---|---|
| SDMX | Statistical and demographic concepts |
| QUDT | Units and quantitative values |
| OWL-Time | Temporal concepts |
| GeoNames | Geographic identifiers |
| Schema.org | General metadata interoperability |

---

# Database Schema Mapping

The semantic mappings correspond to the normalized DBRepo schema.

Main relational tables:

- Population_statistics
- District
- Time_dimension
- Sex
- Age_group
- Nationality_group

---

# Table-Level Semantic Mapping

## Population_statistics

| Column | Semantic Concept | Standard |
|---|---|---|
| population_count | Statistical population observation | SDMX |
| nationality_code | Nationality classification | SDMX |
| year | Temporal reference | OWL-Time |
| district_code | Geographic identifier | GeoNames |

---

## District

| Column | Semantic Concept | Standard |
|---|---|---|
| district_code | Administrative region identifier | GeoNames |
| district_name | Geographic place name | GeoNames |
| nuts_code | European regional classification | SDMX |

---

## Time_dimension

| Column | Semantic Concept | Standard |
|---|---|---|
| year | Calendar year | OWL-Time |
| ref_date | Temporal instant | OWL-Time |

---

## Sex

| Column | Semantic Concept | Standard |
|---|---|---|
| sex_id | Demographic sex classification | SDMX |
| sex_label | Human-readable category label | Schema.org |

---

## Age_group

| Column | Semantic Concept | Standard |
|---|---|---|
| age_group_id | Demographic age classification | SDMX |
| age_range | Age interval category | SDMX |

---

## Nationality_group

| Column | Semantic Concept | Standard |
|---|---|---|
| nationality_code | Nationality category | SDMX |
| nationality_label | Human-readable nationality description | Schema.org |

---

# SQL Views

The semantic layer also applies to the DBRepo-compatible SQL views.

Implemented views:

| View Name | Purpose |
|---|---|
| population_by_district | District-level demographic access |
| population_by_nationality | Nationality-based demographic access |
| population_pyramid_base | Age-sex demographic structure |

---

# FAIR Interoperability Goals

The semantic mappings improve:

- interoperability
- metadata harmonization
- machine readability
- reproducibility
- FAIR compliance

The mappings support integration with:

- Croissant metadata
- FAIR4ML metadata
- DBRepo APIs
- CodeMeta
- machine learning workflows

---

# Repository

GitHub repository:

```text id="t2v9w4"
https://github.com/Muhammad123255/vienna-demographic-forecast