# vienna-demographic-forecast

Data Stewardship Course – FAIR Data Science Part 3 Project

## Project title

Forecasting Demographic Changes in the Population in Vienna using Machine Learning

## Abstract

This project uses open demographic data to forecast population changes in Vienna. The input dataset contains yearly population counts from 2002 to 2025, grouped by district, sex, 5-year age group, and nationality group. The aim is to build a reproducible machine learning workflow that prepares the data, trains forecasting models, evaluates the results, and publishes the research artefacts according to FAIR principles.

## Repository structure

- `data/` — input datasets and processed datasets.
- `src/` — source code for preprocessing, feature engineering, model training, evaluation, and DBRepo API access.
- `outputs/` — generated outputs such as predictions, evaluation tables, figures, and trained model artefacts.
- `docs/` — documentation, metadata files, validation reports, model cards, DMP-related documentation, and standards analysis.

## File organisation

The repository follows a consistent naming convention for all files.

### Input datasets

Raw input datasets downloaded from official data portals are kept with their original source filenames to preserve provenance and make the source easier to trace.

The raw input dataset used in this project is named:

`vie-bez-pop-sex-age5-stk-nat-geo4-2002f.csv`

If additional raw input datasets are added later, their original source filenames will also be preserved and documented in this README.

### Processed datasets

Processed datasets are named using the pattern:

`processed_<description>_<version>.<extension>`

Example:

`processed_population_long_v1.csv`

### Output files

Output files are named using the pattern:

`output_<content>_<model-or-method>_<version>.<extension>`

Examples:

`output_predictions_random_forest_v1.csv`

`output_evaluation_metrics_random_forest_v1.csv`

`output_population_forecast_plot_v1.png`

### Model artefacts

Model artefacts are named using the pattern:

`model_<algorithm>_<target>_<version>.<extension>`

Example:

`model_random_forest_population_forecast_v1.pkl`

### Scripts

Scripts are named using the pattern:

`<step-number>_<task-description>.py`

Examples:

`01_preprocess_data.py`

`02_train_model.py`

`03_evaluate_model.py`

`04_load_to_dbrepo.py`

### Configuration files

Configuration files are named using the pattern:

`config_<purpose>.<extension>`

Example:

`config_model_training.yaml`

## Input data

The project uses the dataset `vie-bez-pop-sex-age5-stk-nat-geo4-2002f.csv`.

The dataset title is:

**Population by sex, 5-year age groups and nationality since 2002 - districts of Vienna**

The dataset contains yearly population counts from 2002 to 2025 by district, sex, age group, and nationality group. The nationality groups are represented by the columns `AUT`, `EEA`, `REU`, and `TCN`.

Source: data.gv.at / data.europa.eu  
Original data provider: Statistik Austria  
Input data licence: Creative Commons Attribution 4.0 International (CC BY 4.0)

## Raw dataset columns

| Column | Meaning |
|---|---|
| `NUTS` | NUTS region code. |
| `DISTRICT_CODE` | Vienna district code. |
| `SUB_DISTRICT_CODE` | Sub-district code. |
| `REF_YEAR` | Reference year. |
| `REF_DATE` | Reference date. |
| `SEX` | Encoded sex category. |
| `AGE5` | Encoded 5-year age group. |
| `AUT` | Population count for Austrian nationals. |
| `EEA` | Population count for EEA nationals. |
| `REU` | Population count for remaining European nationals. |
| `TCN` | Population count for third-country nationals. |

## Processed dataset

For the machine learning pipeline, the nationality columns `AUT`, `EEA`, `REU`, and `TCN` are transformed into long format.

The processed dataset contains:

| Column | Meaning |
|---|---|
| `NUTS` | NUTS region code. |
| `DISTRICT_CODE` | Vienna district code. |
| `SUB_DISTRICT_CODE` | Sub-district code. |
| `REF_YEAR` | Reference year. |
| `REF_DATE` | Reference date. |
| `SEX` | Sex category. |
| `AGE5` | 5-year age group category. |
| `nationality_group` | Nationality group: `AUT`, `EEA`, `REU`, or `TCN`. |
| `population_count` | Population count for the selected group. |

## Outputs

The project produces:

- cleaned dataset;
- feature-engineered dataset;
- train, validation, and test splits;
- trained machine learning model artefacts;
- prediction files;
- evaluation metrics;
- visualisations such as plots and charts.

## Requirements and installation

The project uses Python 3.x.

Required packages:

- pandas
- numpy
- scikit-learn
- matplotlib
- requests

Install dependencies with:

```bash
pip install -r requirements.txt
```

## Reproduction instructions

1. Clone the repository:

```bash
git clone https://github.com/Muhammad123255/vienna-demographic-forecast.git
cd vienna-demographic-forecast
```

2. Install the required Python dependencies:

```bash
pip install -r requirements.txt
```

3. Place the raw input dataset in the `data/` folder with the filename:

```text
data/vie-bez-pop-sex-age5-stk-nat-geo4-2002f.csv
```

4. Run the preprocessing script:

```bash
python src/01_preprocess_data.py
```

5. Run the feature engineering script when available.

6. Train the machine learning model when the final training script is available.

7. Evaluate the model using the evaluation script.

8. Store predictions, evaluation metrics, figures, and model artefacts in the `outputs/` folder.

9. For the final experiment version, use the DBRepo API workflow instead of reading local CSV files.

## DBRepo API access

API base URL: TODO

Authentication method: TODO

Endpoints used:

| Purpose | Endpoint |
|---|---|
| Retrieve input data | TODO |
| Retrieve ML-ready view | TODO |
| Retrieve aggregated feature view | TODO |

The final experiment retrieves data from DBRepo through the REST API instead of reading local CSV files.

## Licences

This project distinguishes between three categories of artefacts: input data, software/code, and produced/output data.

### Input data licence

The input dataset **“Bevölkerung nach Nationalität seit 2002 - Bezirke Wien”** / **“Population by sex, 5-year age groups and nationality since 2002 - districts of Vienna”** is provided via data.gv.at / data.europa.eu and originates from Statistik Austria.

The source dataset is licensed under **Creative Commons Attribution 4.0 International (CC BY 4.0)**.

This licence permits reuse, sharing, and adaptation, including for research and publication, as long as appropriate attribution is given to the original source. The dataset is reused in this project with attribution to Statistik Austria and the original data portal. The CC BY 4.0 licence does not impose a ShareAlike requirement, so derived outputs do not have to use the same licence, but attribution must be preserved.

Source dataset file: `vie-bez-pop-sex-age5-stk-nat-geo4-2002f.csv`

### Software/code licence

The software and source code created for this project are licensed under the **MIT License**.

The MIT License is suitable because it is a permissive open-source licence that allows reuse, modification, and redistribution of the project code. It is compatible with the CC BY 4.0 input data licence because it applies only to the code, while the input dataset remains under its original CC BY 4.0 licence.

A `LICENSE` file containing the MIT License is included in the repository root.

### Produced/output data licence

Produced artefacts from this project, including cleaned datasets, feature-engineered datasets, prediction files, evaluation results, visualisations, and trained model artefacts, are licensed under **Creative Commons Attribution 4.0 International (CC BY 4.0)**.

This licence was selected because the outputs are derived from openly licensed input data and should remain openly reusable with attribution. Users of the produced data must cite this project and preserve attribution to the original data source, Statistik Austria.

## Contributors

- A — Bernhard Siegl — ORCID: TODO
- B — Muhammad Umer Raza — ORCID: TODO
- C — Jannatul Jahan Bonny — ORCID: TODO
- D — Usman Arif — ORCID: TODO

## Persistent identifiers

GitHub repository: https://github.com/Muhammad123255/vienna-demographic-forecast

GitHub release: https://github.com/Muhammad123255/vienna-demographic-forecast/releases/tag/v1.0

Zenodo DOI badge: TODO after Zenodo release.

DBRepo entry: TODO.

TU Wien Research Data Repository model deposit: TODO.

TU Wien Research Data Repository generated data deposit: TODO.

## Related documentation

- Unit mapping: `docs/unit-mapping.md`
- FAIR4ML metadata: `docs/fair4ml-metadata.json`
- Model card: `docs/model-card.md`
- RO-Crate metadata: `ro-crate-metadata.json`
- CodeMeta metadata: `codemeta.json`
- Croissant metadata: TODO


