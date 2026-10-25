{{ config(materialized='table') }}

-- Domain-Dimension: eine Zeile je Search-Console-Property (Gegenstück zur Entität "website" im Semantic Layer)
select
    domain,
    any_value(site_url) as site_url,
    min(date) as first_date,
    max(date) as last_date
from {{ ref('fact_gsc_performance_date') }}
group by domain
