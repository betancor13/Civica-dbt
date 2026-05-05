WITH date_spine AS (
    -- Llamamos a la macro date_spine indicando: 1. Granularidad (día), 2. Fecha inicio fija 3. Fecha fin dinámica (hoy)
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="to_date('2015-01-01', 'yyyy-mm-dd')",
        end_date="current_date()"
    ) }}
)

SELECT date_day FROM date_spine