{{ config(
    materialized='incremental',
    unique_key='id',
    on_schema_change='append_new_columns'
) }}

with country_performance as (
    select *
    from {{ ref('stg_gsc__performance_report_country') }}
)

select
    cp.id,
    cp._sdc_extracted_at,
    cp._sdc_received_at,
    cp._sdc_batched_at,
    cp._sdc_deleted_at,
    cp._sdc_sequence,
    cp._sdc_table_version,
    cp.site_url,
    cp.date,
    cp.country,
    coalesce(dc.country_name, cp.country) as country_name,
    cp.clicks,
    cp.impressions,
    cp.ctr,
    cp.position,
    cp.domain
from country_performance cp
left join {{ ref('dim_country') }} dc
    on cp.country = dc.country_code