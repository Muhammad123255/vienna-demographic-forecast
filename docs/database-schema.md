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

The schema follows Third Normal Form (3NF) principles to reduce redundancy and improve data consistency.

---

# Database Design Overview

The database schema is designed to support:

- demographic analytics
- SQL aggregation workflows
- machine learning preprocessing
- FAIR metadata generation
- semantic interoperability
- DBRepo integration

The schema stores yearly demographic population observations for Vienna districts.

---

# Main Table

## population_data

This table stores yearly demographic population statistics for Vienna districts.

| Column | Data Type | Description |
|---|---|---|
| NUTS | VARCHAR | NUTS region identifier |
| DISTRICT_CODE | INTEGER | Vienna district code |
| SUB_DISTRICT_CODE | INTEGER | Sub-district code |
| REF_YEAR | INTEGER | Reference year |
| REF_DATE | DATE | Reference observation date |
| SEX | VARCHAR | Sex category |
| AGE5 | VARCHAR | 5-year age group |
| AUT | INTEGER | Austrian nationals population |
| EEA | INTEGER | EEA nationals population |
| REU | INTEGER | Remaining European nationals population |
| TCN | INTEGER | Third-country nationals population |

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
- nationality-group analysis
- machine learning feature extraction
- SQL analytical views
- forecasting-ready demographic preprocessing

---

# SQL Views

The database includes analytical SQL views defined in:

```text
sql/views.sql