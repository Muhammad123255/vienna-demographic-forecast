# Semantic Mapping

| Dataset Attribute | Semantic Concept | Ontology | URI |
|---|---|---|---|
| district | Administrative territorial unit | GeoNames Ontology | http://www.geonames.org/ontology#Feature |
| year | Temporal position | OWL-Time | http://www.w3.org/2006/time#TemporalPosition |
| sex | Sex of individual | SDMX Demographic Concepts | https://purl.org/linked-data/sdmx/2009/concept#sex |
| age_group | Age classification | SDMX Demographic Concepts | https://purl.org/linked-data/sdmx/2009/concept#age |
| nationality | Nationality or citizenship | SDMX Demographic Concepts | https://purl.org/linked-data/sdmx/2009/concept#refArea |
| population_count | Quantity value | QUDT | http://qudt.org/schema/qudt/QuantityValue |

## Ontology Selection Justification

We selected SDMX, GeoNames, OWL-Time, and QUDT because they are widely used and well-maintained ontologies suitable for demographic, geographic, temporal, and quantitative data representation. SDMX is specifically designed for statistical and demographic datasets, while GeoNames provides semantic descriptions for administrative regions. QUDT enables standardized representation of measurable quantities such as population counts, and OWL-Time supports interoperable temporal descriptions.
