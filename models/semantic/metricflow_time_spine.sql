-- Zeitachse für MetricFlow: eine Zeile je Tag
select date_day
from unnest(generate_date_array('2020-01-01', '2030-12-31', interval 1 day)) as date_day
