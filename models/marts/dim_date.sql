{{ config(materialized='table') }}

with date_spine as (
    select
        date,
        extract(year from date) as year,
        extract(month from date) as month,
        extract(day from date) as day,
        extract(dayofweek from date) as day_of_week,
        extract(dayofyear from date) as day_of_year,
        extract(week from date) as week_of_year,
        extract(quarter from date) as quarter,
        format_date('%Y-%m', date) as year_month,
        format_date('%Y-W%V', date) as year_week,
        format_date('%A', date) as day_name,
        format_date('%B', date) as month_name,
        case
            when extract(month from date) in (12, 1, 2) then 'Winter'
            when extract(month from date) in (3, 4, 5) then 'Frühling'
            when extract(month from date) in (6, 7, 8) then 'Sommer'
            else 'Herbst'
        end as season
    from unnest(generate_date_array('2024-01-01', '2030-12-31', interval 1 day)) as date
)

select * from date_spine