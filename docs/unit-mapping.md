# Unit Mapping

This document describes the unit mappings for numeric attributes in the Vienna demographic forecasting dataset.

The raw dataset contains demographic population counts by year, district, sex, age group, and nationality group. The main measured quantity is the number of persons in each demographic group.

| Attribute | Numeric? | Measurement meaning | Unit / concept URI | Comment |
|---|---:|---|---|---|
| `DISTRICT_CODE` | Yes | Administrative identifier | Not applicable | This is an identifier, not a measured quantity. |
| `SUB_DISTRICT_CODE` | Yes | Administrative identifier | Not applicable | This is an identifier, not a measured quantity. |
| `REF_YEAR` | Yes | Calendar year | `http://qudt.org/vocab/unit/YR` | The value represents the reference year of the observation. |
| `REF_DATE` | Yes | Calendar date | Not applicable | The value is encoded as `YYYYMMDD`; it should be treated as a date, not as a measured numeric quantity. |
| `SEX` | Yes | Encoded category | Not applicable | This is a categorical code, not a measured quantity. |
| `AGE5` | Yes | Encoded 5-year age group | `http://qudt.org/vocab/unit/YR` | The category represents age intervals measured in years. |
| `AUT` | Yes | Count of Austrian nationals | `http://qudt.org/vocab/unit/NUM` | Population count is a number of persons. |
| `EEA` | Yes | Count of EEA nationals | `http://qudt.org/vocab/unit/NUM` | Population count is a number of persons. |
| `REU` | Yes | Count of remaining European nationals | `http://qudt.org/vocab/unit/NUM` | Population count is a number of persons. |
| `TCN` | Yes | Count of third-country nationals | `http://qudt.org/vocab/unit/NUM` | Population count is a number of persons. |
| `population_count` | Yes | Count of persons after reshaping the dataset | `http://qudt.org/vocab/unit/NUM` | This is the target variable used for forecasting. |

## Justification

Most numeric fields in the dataset are not physical measurements. Some are identifiers or encoded categories. For population counts, a dimensionless number unit is used because the values represent counts of persons. For age-related information, year is used because the age groups represent intervals in years.
