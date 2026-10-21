{{ config(
    materialized='incremental',
    unique_key='id',
    on_schema_change='append_new_columns'
) }}

with keys_performance as (
    select *
    from {{ ref('stg_gsc__performance_report_keys') }}
)

select
    id,
    _sdc_extracted_at,
    _sdc_received_at,
    _sdc_batched_at,
    _sdc_deleted_at,
    _sdc_sequence,
    _sdc_table_version,
    site_url,
    date,
    keys,
    clicks,
    impressions,
    ctr,
    position,
    domain
from keys_performance