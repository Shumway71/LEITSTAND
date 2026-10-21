-- GSC page: Meltano laedt bei jedem Lauf die letzten Tage erneut (append).
-- Pro Domain + Datendatum (date) + page bleibt nur die Zeile aus dem juengsten Lauf.
with source as (
    select *
    from {{ source('DWH', 'performance_report_page') }}
),

latest as (
    select *
    from source
    qualify row_number() over (
        partition by domain, date, page
        order by _sdc_sync_started_at desc, _sdc_extracted_at desc, _sdc_sequence desc
    ) = 1
)

select
    {{ dbt_utils.generate_surrogate_key(['domain', 'date', 'page']) }} as id,
    _sdc_extracted_at,
    _sdc_received_at,
    _sdc_batched_at,
    _sdc_deleted_at,
    _sdc_sequence,
    _sdc_table_version,
    site_url,
    date,
    page,
    clicks,
    impressions,
    ctr,
    position,
    domain
from latest
