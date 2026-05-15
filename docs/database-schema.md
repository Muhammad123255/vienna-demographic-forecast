# Database Schema Documentation

## Overview

This document describes the normalized relational database schema used for the Vienna demographic forecasting project.

The schema supports:

- demographic population storage
- FAIR data stewardship
- DBRepo integration
- SQL analytical views
- machine learning preprocessing
- reproducible demographic analytics

The schema follows a normalized relational design (3NF) implemented inside DBRepo.

The original Statistik Austria dataset was transformed into relational lookup tables and a central fact table to improve interoperability, consistency, and FAIR compliance.

---

# Database Schema Design

The schema contains one central fact table and multiple lookup dimension tables.

## Main Fact Table

### Population_statistics

This table stores yearly demographic population observations.

| Column | Data Type | Description |
|---|---|---|
| population_id | INTEGER | Primary key |
| district_code | INTEGER | Foreign key to District |
| year | INTEGER | Foreign key to Time_dimension |
| sex_id | INTEGER | Foreign key to Sex |
| age_group_id | INTEGER | Foreign key to Age_group |
| nationality_code | VARCHAR | Foreign key to Nationality_group |
| population_count | INTEGER | Population count |

---

# Dimension Tables

## District

Administrative districts of Vienna.

| Column | Data Type | Description |
|---|---|---|
| district_code | INTEGER | Primary key |
| district_name | VARCHAR | District name |
| nuts_code | VARCHAR | NUTS regional code |

---

## Time_dimension

Temporal lookup table.

| Column | Data Type | Description |
|---|---|---|
| year | INTEGER | Primary key |
| ref_date | DATE | Reference date |

---

## Sex

Lookup table for demographic sex categories.

| Column | Data Type | Description |
|---|---|---|
| sex_id | INTEGER | Primary key |
| sex_label | VARCHAR | Male / Female |

---

## Age_group

Lookup table for demographic age categories.

| Column | Data Type | Description |
|---|---|---|
| age_group_id | INTEGER | Primary key |
| age_range | VARCHAR | 5-year age interval |

---

## Nationality_group

Lookup table for grouped nationality categories.

| Column | Data Type | Description |
|---|---|---|
| nationality_code | VARCHAR | Primary key |
| nationality_label | VARCHAR | Nationality group description |

---

# Age Group Mapping

| AGE5 Code | Age Range |
|---|---|
| 1 | 0-4 years |
| 2 | 5-9 years |
| 3 | 10-14 years |
| 4 | 15-19 years |
| 5 | 20-24 years |
| 6 | 25-29 years |
| 7 | 30-34 years |
| 8 | 35-39 years |
| 9 | 40-44 years |
| 10 | 45-49 years |
| 11 | 50-54 years |
| 12 | 55-59 years |
| 13 | 60-64 years |
| 14 | 65-69 years |
| 15 | 70-74 years |
| 16 | 75-79 years |
| 17 | 80+ years |

---

# Sex Mapping

| SEX Code | Meaning |
|---|---|
| 1 | Male |
| 2 | Female |

---

# Nationality Group Mapping

| Code | Meaning |
|---|---|
| AUT | Austrian nationals |
| EEA | European Economic Area nationals |
| REU | Remaining European nationals |
| TCN | Third-country nationals |

---

# Schema Relationships

The schema uses relational foreign-key relationships.

## Relationship Structure

```text
Population_statistics
 ├── District
 ├── Time_dimension
 ├── Sex
 ├── Age_group
 └── Nationality_group
