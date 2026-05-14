# Database Schema Documentation

## Overview

This document describes the relational database schema used for the Vienna demographic forecasting project.

The schema was designed to support:

- demographic data storage
- SQL aggregation views
- machine learning preprocessing
- FAIR metadata integration
- DBRepo API access
- reproducible demographic analytics

The schema is based on the **processed dataset** (`processed_population_long_v1.csv`), which is a denormalized, long-format transformation of the original Statistik Austria data. This structure is optimized for the 9 SQL views and the machine learning pipeline.

---

# Main Table

## population_data

This table stores yearly demographic population statistics for Vienna districts in long format.

| Column | Data Type | Description |
|--------|-----------|-------------|
| NUTS | VARCHAR | NUTS region code for Vienna (AT13) |
| DISTRICT_CODE | INTEGER | Vienna district code (90100 to 92300) |
| SUB_DISTRICT_CODE | INTEGER | Sub-district code (same as district code) |
| REF_YEAR | INTEGER | Reference year (2002-2025) |
| REF_DATE | DATE | Reference observation date (January 1st) |
| SEX | INTEGER | Sex category (1 = Male, 2 = Female) |
| AGE5 | INTEGER | 5-year age group code (1 to 17) |
| AUT | INTEGER | Population count for Austrian nationals |
| EEA | INTEGER | Population count for other EEA nationals |
| REU | INTEGER | Population count for Rest of Europe nationals |
| TCN | INTEGER | Population count for Third-Country Nationals |

---

# Age Group Mapping

| AGE5 Code | Age Range |
|-----------|-----------|
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
|----------|---------|
| 1 | Male |
| 2 | Female |

---

# Primary Key Strategy

The dataset does not contain a single natural primary key.

A composite key can be formed using:

- DISTRICT_CODE
- SUB_DISTRICT_CODE
- REF_YEAR
- SEX
- AGE5

This combination uniquely identifies demographic records for a specific population segment.

---

# Data Relationships

The schema structure supports:

- yearly demographic aggregation
- district-level demographic analysis
- nationality-group analysis (AUT, EEA, REU, TCN)
- machine learning feature extraction
- SQL analytical views
- forecasting-ready demographic preprocessing
- TCN share analysis over time
- population pyramid generation
- age dependency ratio calculations
- sex ratio analysis

---

# SQL Views

The database includes analytical SQL views defined in:

```text
sql/views.sql