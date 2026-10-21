{{ config(materialized='view') }}

with source as (
    select
        data,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_batched_at,
        _sdc_sequence
    from {{ source('raw', 'weather_hourly') }}
),

flattened as (
    select
        json_extract_scalar(data, '$.time') as time_str,
        safe_cast(timestamp(concat(json_extract_scalar(data, '$.time'), ':00')) as timestamp) as timestamp_utc,
        timestamp_seconds(safe_cast(json_extract_scalar(data, '$.time_unix') as int64)) as timestamp_unix_utc,
        json_extract_scalar(data, '$.location_name') as location_name,
        safe_cast(json_extract_scalar(data, '$.temperature_2m') as float64) as temp_celsius,
        safe_cast(json_extract_scalar(data, '$.precipitation') as float64) as precipitation_mm,
        safe_cast(json_extract_scalar(data, '$.weather_code') as int64) as weather_code,
        safe_cast(json_extract_scalar(data, '$.wind_speed_10m') as float64) as wind_speed_kmh,
        safe_cast(json_extract_scalar(data, '$.relative_humidity_2m') as int64) as humidity_percent,
        _sdc_extracted_at as extracted_at,
        _sdc_received_at as received_at,
        _sdc_batched_at as batched_at,
        _sdc_sequence as sequence_num
    from source
),

deduped as (
    select
        *,
        -- Präferiere timestamp_utc, fallback auf timestamp_unix_utc
        coalesce(timestamp_utc, timestamp_unix_utc) as ts_final,
        row_number() over (
            partition by coalesce(timestamp_utc, timestamp_unix_utc), location_name
            order by sequence_num desc, received_at desc
        ) as rn
    from flattened
)

select
    time_str,
    timestamp_utc,
    timestamp_unix_utc,
    ts_final,
    location_name,
    temp_celsius,
    precipitation_mm,
    weather_code,
    wind_speed_kmh,
    humidity_percent,
    extracted_at,
    received_at,
    batched_at,
    sequence_num
from deduped
where rn = 1 and ts_final is not null