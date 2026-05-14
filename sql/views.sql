
-- ============================================================
-- T2.4 – SQL VIEW definitions for Vienna Population Data
-- Use case: TCN share over time + population pyramid analysis
-- Author: Owner D
-- Based on processed dataset: processed_population_long_v1.csv
-- ============================================================

-- ============================================================
-- SECTION 1: Basic aggregations
-- ============================================================

-- View 1: Total population per year (2004-2024)
CREATE VIEW yearly_population_summary AS
SELECT
    REF_YEAR,
    SUM(AUT + EEA + REU + TCN) AS total_population
FROM population_data
GROUP BY REF_YEAR
ORDER BY REF_YEAR;

-- View 2: Population per district per year
CREATE VIEW district_population_summary AS
SELECT
    DISTRICT_CODE,
    REF_YEAR,
    SUM(AUT + EEA + REU + TCN) AS district_population
FROM population_data
GROUP BY DISTRICT_CODE, REF_YEAR
ORDER BY REF_YEAR, DISTRICT_CODE;

-- View 3: Population breakdown by nationality per year
CREATE VIEW nationality_population_summary AS
SELECT
    REF_YEAR,
    SUM(AUT) AS austrian_population,
    SUM(EEA) AS eea_population,
    SUM(REU) AS remaining_europe_population,
    SUM(TCN) AS third_country_population
FROM population_data
GROUP BY REF_YEAR
ORDER BY REF_YEAR;

-- ============================================================
-- SECTION 2: TCN share analysis
-- ============================================================

-- View 4: TCN percentage over time (2004-2024: 1% → 10%)
CREATE VIEW v_tcn_share_by_year AS
SELECT 
    REF_YEAR,
    SUM(TCN) AS total_tcn,
    SUM(AUT + EEA + REU + TCN) AS total_population,
    ROUND(100.0 * SUM(TCN) / SUM(AUT + EEA + REU + TCN), 2) AS tcn_share_percent
FROM population_data
GROUP BY REF_YEAR
ORDER BY REF_YEAR;

-- View 5: TCN percentage by age group
CREATE VIEW v_tcn_share_by_age AS
SELECT 
    REF_YEAR,
    AGE5,
    SUM(TCN) AS tcn_population,
    SUM(AUT + EEA + REU + TCN) AS total_population,
    ROUND(100.0 * SUM(TCN) / SUM(AUT + EEA + REU + TCN), 2) AS tcn_share_percent
FROM population_data
GROUP BY REF_YEAR, AGE5
ORDER BY REF_YEAR, AGE5;

-- ============================================================
-- SECTION 3: Population pyramid (denormalised for plotting)
-- ============================================================

-- View 6: Age-sex structure with human-readable labels
CREATE VIEW v_population_pyramid AS
SELECT 
    REF_YEAR,
    AGE5,
    CASE 
        WHEN AGE5 = 1 THEN '0-4'
        WHEN AGE5 = 2 THEN '5-9'
        WHEN AGE5 = 3 THEN '10-14'
        WHEN AGE5 = 4 THEN '15-19'
        WHEN AGE5 = 5 THEN '20-24'
        WHEN AGE5 = 6 THEN '25-29'
        WHEN AGE5 = 7 THEN '30-34'
        WHEN AGE5 = 8 THEN '35-39'
        WHEN AGE5 = 9 THEN '40-44'
        WHEN AGE5 = 10 THEN '45-49'
        WHEN AGE5 = 11 THEN '50-54'
        WHEN AGE5 = 12 THEN '55-59'
        WHEN AGE5 = 13 THEN '60-64'
        WHEN AGE5 = 14 THEN '65-69'
        WHEN AGE5 = 15 THEN '70-74'
        WHEN AGE5 = 16 THEN '75-79'
        WHEN AGE5 = 17 THEN '80+'
    END AS age_group_label,
    SEX,
    SUM(AUT + EEA + REU + TCN) AS population
FROM population_data
GROUP BY REF_YEAR, AGE5, SEX
ORDER BY REF_YEAR, AGE5, SEX;

-- ============================================================
-- SECTION 4: ML training sample (class-balanced)
-- ============================================================

-- View 7: Balanced sample for machine learning training
-- Note: Uses RANDOM() – results may vary between executions
CREATE VIEW v_ml_training_sample AS
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY REF_YEAR, 
                CASE WHEN TCN > 0 THEN 'TCN_PRESENT' ELSE 'TCN_ABSENT' END
            ORDER BY RANDOM()
        ) AS rn
    FROM population_data
) AS sampled
WHERE rn <= 1000;

-- ============================================================
-- SECTION 5: Demographic ratios (for ML feature engineering)
-- ============================================================

-- View 8: Age dependency ratios (youth, old-age, total)
CREATE VIEW v_age_dependency_ratios AS
WITH age_groups AS (
    SELECT 
        REF_YEAR,
        DISTRICT_CODE,
        SUM(CASE WHEN AGE5 <= 4 THEN (AUT + EEA + REU + TCN) ELSE 0 END) AS youth_0_19,
        SUM(CASE WHEN AGE5 BETWEEN 5 AND 12 THEN (AUT + EEA + REU + TCN) ELSE 0 END) AS working_age_20_64,
        SUM(CASE WHEN AGE5 >= 13 THEN (AUT + EEA + REU + TCN) ELSE 0 END) AS elderly_65plus
    FROM population_data
    GROUP BY REF_YEAR, DISTRICT_CODE
)
SELECT 
    REF_YEAR,
    DISTRICT_CODE,
    youth_0_19,
    working_age_20_64,
    elderly_65plus,
    ROUND(100.0 * (youth_0_19 + elderly_65plus) / NULLIF(working_age_20_64, 0), 2) AS total_dependency_ratio,
    ROUND(100.0 * youth_0_19 / NULLIF(working_age_20_64, 0), 2) AS youth_dependency_ratio,
    ROUND(100.0 * elderly_65plus / NULLIF(working_age_20_64, 0), 2) AS old_age_dependency_ratio
FROM age_groups
ORDER BY REF_YEAR, DISTRICT_CODE;

-- View 9: Sex ratio (males per 100 females) by age group
CREATE VIEW v_sex_ratio_by_age AS
SELECT 
    REF_YEAR,
    AGE5,
    SUM(CASE WHEN SEX = 1 THEN (AUT + EEA + REU + TCN) ELSE 0 END) AS male_pop,
    SUM(CASE WHEN SEX = 2 THEN (AUT + EEA + REU + TCN) ELSE 0 END) AS female_pop,
    ROUND(100.0 * 
        SUM(CASE WHEN SEX = 1 THEN (AUT + EEA + REU + TCN) ELSE 0 END) / 
        NULLIF(SUM(CASE WHEN SEX = 2 THEN (AUT + EEA + REU + TCN) ELSE 0 END), 0), 
        2
    ) AS males_per_100_females
FROM population_data
GROUP BY REF_YEAR, AGE5
ORDER BY REF_YEAR, AGE5;

-- ============================================================
-- END OF SQL VIEW DEFINITIONS
-- ============================================================