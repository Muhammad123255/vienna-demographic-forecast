CREATE VIEW yearly_population_summary AS
SELECT
    REF_YEAR,
    SUM(AUT + EEA + REU + TCN) AS total_population
FROM population_data
GROUP BY REF_YEAR;

CREATE VIEW district_population_summary AS
SELECT
    DISTRICT_CODE,
    REF_YEAR,
    SUM(AUT + EEA + REU + TCN) AS district_population
FROM population_data
GROUP BY DISTRICT_CODE, REF_YEAR;

CREATE VIEW nationality_population_summary AS
SELECT
    REF_YEAR,
    SUM(AUT) AS austrian_population,
    SUM(EEA) AS eea_population,
    SUM(REU) AS remaining_europe_population,
    SUM(TCN) AS third_country_population
FROM population_data
GROUP BY REF_YEAR;