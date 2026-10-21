{{ config(
    materialized='table',
    partition_by={
        'field': 'date',
        'data_type': 'date',
        'granularity': 'day'
    },
    cluster_by=['domain']
) }}

with daily_base as (
    select
        domain,
        date,
        clicks,
        impressions,
        ctr,
        position
    from {{ ref('fact_gsc_performance_unified') }}
    where dimension_type = 'date'
),

country_counts as (
    select
        domain,
        date,
        count(distinct dimension_value) as country_count
    from {{ ref('fact_gsc_performance_unified') }}
    where dimension_type = 'country'
        and clicks > 0
    group by domain, date
),

query_counts as (
    select
        domain,
        date,
        count(distinct dimension_value) as query_count
    from {{ ref('fact_gsc_performance_unified') }}
    where dimension_type = 'query'
        and clicks > 0
    group by domain, date
)

select
    db.domain,
    db.date,
    sum(db.clicks) as total_clicks,
    sum(db.impressions) as total_impressions,
    safe_divide(sum(db.clicks), sum(db.impressions)) as avg_ctr,
    avg(db.position) as avg_position,
    coalesce(max(cc.country_count), 0) as country_count,
    coalesce(max(qc.query_count), 0) as query_count
from daily_base db
left join country_counts cc
    on db.domain = cc.domain and db.date = cc.date
left join query_counts qc
    on db.domain = qc.domain and db.date = qc.date
group by db.domain, db.date