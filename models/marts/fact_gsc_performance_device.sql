{{ config(
    materialized='incremental',
    unique_key='id',
    on_schema_change='append_new_columns'
) }}

with device_performance as (
    select *
    from {{ ref('stg_gsc__performance_report_device') }}
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
    device,
    clicks,
    impressions,
    ctr,
    position,
    domain
from device_performance