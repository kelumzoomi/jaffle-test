
-- metricflow_time_spine.sql
with 

days as (
    {{ dbt_date.get_base_dates(n_dateparts=365*10, datepart="day") }}
),

cast_to_date as (
    select 
        cast(date_day as date) as date_day,
        DATE_TRUNC(cast(date_day as date), QUARTER) as almost_fiscal_quarter
    from days
)

select * from cast_to_date
