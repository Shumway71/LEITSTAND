{{ config(
    materialized='incremental',
    unique_key=['id', 'dimension_type'],
    on_schema_change='append_new_columns'
) }}

with country as (
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
        'country' as dimension_type,
        country as dimension_value,
        clicks,
        impressions,
        ctr,
        position,
        domain
    from {{ ref('fact_gsc_performance_country') }}
),
date_perf as (
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
        'date' as dimension_type,
        cast(date as string) as dimension_value,
        clicks,
        impressions,
        ctr,
        position,
        domain
    from {{ ref('fact_gsc_performance_date') }}
),
device as (
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
        'device' as dimension_type,
        device as dimension_value,
        clicks,
        impressions,
        ctr,
        position,
        domain
    from {{ ref('fact_gsc_performance_device') }}
),
keys as (
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
        'keys' as dimension_type,
        array_to_string(keys, ', ') as dimension_value,
        clicks,
        impressions,
        ctr,
        position,
        domain
    from {{ ref('fact_gsc_performance_keys') }}
),
page as (
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
        'page' as dimension_type,
        page as dimension_value,
        clicks,
        impressions,
        ctr,
        position,
        domain
    from {{ ref('fact_gsc_performance_page') }}
),
query as (
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
        'query' as dimension_type,
        query as dimension_value,
        clicks,
        impressions,
        ctr,
        position,
        domain
    from {{ ref('fact_gsc_performance_query') }}
)

select * from country
union all select * from date_perf
union all select * from device
union all select * from keys
union all select * from page
union all select * from query