-- =====================================================
-- Vienna Demographic Forecasting Project
-- SQL Views
-- =====================================================

-- =====================================================
-- View 1: Population by District
-- =====================================================

CREATE OR REPLACE VIEW population_by_district AS
SELECT
    ps.population_id,
    d.district_code,
    d.district_name,
    td.year,
    ng.nationality_code,
    ps.population_count,
    s.sex_label
FROM Population_statistics ps
JOIN District d
    ON ps.district_code = d.district_code
JOIN Time_dimension td
    ON ps.year = td.year
JOIN Nationality_group ng
    ON ps.nationality_code = ng.nationality_code
JOIN Sex s
    ON ps.sex_id = s.sex_id
ORDER BY td.year;

-- =====================================================
-- View 2: Population by Nationality
-- =====================================================

CREATE OR REPLACE VIEW population_by_nationality AS
SELECT
    td.year,
    ng.nationality_code,
    ng.nationality_label,
    ps.population_count
FROM Population_statistics ps
JOIN Time_dimension td
    ON ps.year = td.year
JOIN Nationality_group ng
    ON ps.nationality_code = ng.nationality_code
ORDER BY td.year;

-- =====================================================
-- View 3: Population Pyramid Base
-- =====================================================

CREATE OR REPLACE VIEW population_pyramid_base AS
SELECT
    td.year,
    ag.age_group_id,
    ag.age_range,
    s.sex_label,
    ps.population_count
FROM Population_statistics ps
JOIN Age_group ag
    ON ps.age_group_id = ag.age_group_id
JOIN Sex s
    ON ps.sex_id = s.sex_id
JOIN Time_dimension td
    ON ps.year = td.year
ORDER BY ag.age_group_id;

-- =====================================================
-- View 4: Population by Age Group
-- =====================================================

CREATE OR REPLACE VIEW population_by_age_group AS
SELECT
    td.year,
    ag.age_group_id,
    ag.age_range,
    ps.population_count
FROM Population_statistics ps
JOIN Age_group ag
    ON ps.age_group_id = ag.age_group_id
JOIN Time_dimension td
    ON ps.year = td.year
ORDER BY td.year;

-- =====================================================
-- View 5: Population by Sex
-- =====================================================

CREATE OR REPLACE VIEW population_by_sex AS
SELECT
    td.year,
    s.sex_label,
    ps.population_count
FROM Population_statistics ps
JOIN Sex s
    ON ps.sex_id = s.sex_id
JOIN Time_dimension td
    ON ps.year = td.year
ORDER BY td.year;

-- =====================================================
-- View 6: District and Nationality Mapping
-- =====================================================

CREATE OR REPLACE VIEW district_nationality_mapping AS
SELECT
    d.district_name,
    ng.nationality_label,
    td.year,
    ps.population_count
FROM Population_statistics ps
JOIN District d
    ON ps.district_code = d.district_code
JOIN Nationality_group ng
    ON ps.nationality_code = ng.nationality_code
JOIN Time_dimension td
    ON ps.year = td.year
ORDER BY d.district_name;

-- =====================================================
-- View 7: Age and Sex Distribution
-- =====================================================

CREATE OR REPLACE VIEW age_sex_distribution AS
SELECT
    ag.age_range,
    s.sex_label,
    td.year,
    ps.population_count
FROM Population_statistics ps
JOIN Age_group ag
    ON ps.age_group_id = ag.age_group_id
JOIN Sex s
    ON ps.sex_id = s.sex_id
JOIN Time_dimension td
    ON ps.year = td.year
ORDER BY ag.age_group_id;

-- =====================================================
-- View 8: Population Observation Details
-- =====================================================

CREATE OR REPLACE VIEW population_observation_details AS
SELECT
    ps.population_id,
    d.district_name,
    td.year,
    ag.age_range,
    s.sex_label,
    ng.nationality_label,
    ps.population_count
FROM Population_statistics ps
JOIN District d
    ON ps.district_code = d.district_code
JOIN Time_dimension td
    ON ps.year = td.year
JOIN Age_group ag
    ON ps.age_group_id = ag.age_group_id
JOIN Sex s
    ON ps.sex_id = s.sex_id
JOIN Nationality_group ng
    ON ps.nationality_code = ng.nationality_code
ORDER BY td.year;

-- =====================================================
-- View 9: Simple ML Input View
-- =====================================================

CREATE OR REPLACE VIEW ml_input_view AS
SELECT
    td.year,
    d.district_code,
    s.sex_id,
    ag.age_group_id,
    ng.nationality_code,
    ps.population_count
FROM Population_statistics ps
JOIN District d
    ON ps.district_code = d.district_code
JOIN Time_dimension td
    ON ps.year = td.year
JOIN Sex s
    ON ps.sex_id = s.sex_id
JOIN Age_group ag
    ON ps.age_group_id = ag.age_group_id
JOIN Nationality_group ng
    ON ps.nationality_code = ng.nationality_code
ORDER BY td.year;
