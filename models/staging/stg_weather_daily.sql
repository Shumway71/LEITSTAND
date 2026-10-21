{{ config(materialized='view') }}

with source as (
    select
        data,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_batched_at,
        _sdc_sequence
    from {{ source('raw', 'weather_daily') }}
),

flattened as (
    select
        json_extract_scalar(data, '$.date') as date_str,
        parse_date('%Y-%m-%d', json_extract_scalar(data, '$.date')) as date,
        json_extract_scalar(data, '$.location_name') as location_name,
        safe_cast(json_extract_scalar(data, '$.temperature_2m_max') as float64) as temp_max_celsius,
        safe_cast(json_extract_scalar(data, '$.temperature_2m_min') as float64) as temp_min_celsius,
        safe_cast(json_extract_scalar(data, '$.precipitation_sum') as float64) as precipitation_mm,
        safe_cast(json_extract_scalar(data, '$.weather_code') as int64) as weather_code,
        safe_cast(json_extract_scalar(data, '$.wind_speed_10m_max') as float64) as wind_speed_max_kmh,
        _sdc_extracted_at as extracted_at,
        _sdc_received_at as received_at,
        _sdc_batched_at as batched_at,
        _sdc_sequence as sequence_num
    from source
),

deduped as (
    select
        *,
        row_number() over (partition by date, location_name order by sequence_num desc, received_at desc) as rn
    from flattened
    where date is not null
)

select
    date_str,
    date,
    location_name,
    temp_max_celsius,
    temp_min_celsius,
    precipitation_mm,
    weather_code,
    wind_speed_max_kmh,
    extracted_at,
    received_at,
    batched_at,
    sequence_num
from deduped
where rn = 1