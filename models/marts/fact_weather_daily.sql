{{ config(
    materialized='incremental',
    unique_key=['date', 'location_name'],
    on_schema_change='fail'
) }}

with weather as (
    select * from {{ ref('stg_weather_daily') }}
)

select
    date,
    location_name,
    temp_max_celsius,
    temp_min_celsius,
    round((temp_max_celsius + temp_min_celsius) / 2, 1) as temp_avg_celsius,
    precipitation_mm,
    weather_code,
    wind_speed_max_kmh,
    case
        when weather_code in (0, 1) then 'Sonnig/Klar'
        when weather_code in (2, 3) then 'Bewölkt'
        when weather_code in (45, 48) then 'Nebel'
        when weather_code in (51, 53, 55, 56, 57) then 'Nieselregen'
        when weather_code in (61, 63, 65, 66, 67, 80, 81, 82) then 'Regen'
        when weather_code in (71, 73, 75, 77, 85, 86) then 'Schnee'
        when weather_code in (95, 96, 99) then 'Gewitter'
        else 'Sonstiges'
    end as weather_category,
    case
        when temp_max_celsius >= 30 then 'Heiß'
        when temp_max_celsius >= 25 then 'Warm'
        when temp_max_celsius >= 15 then 'Mild'
        when temp_max_celsius >= 5 then 'Kühl'
        else 'Kalt'
    end as temp_category,
    extracted_at,
    received_at,
    batched_at,
    sequence_num
from weather
{% if is_incremental() -%}
where date > (select coalesce(max(date), '1900-01-01') from {{ this }})
{% endif %}
order by date, location_name