-- =====================================================
-- Vienna Demographic Forecasting Project
-- DBRepo-Compatible SQL Views
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