{% macro convert_to_usd(column_name) %}

{{column_name}} * (
    select
        price
    from {{ref('btc_usd_max')}}
    where TO_DATE(replace(snapped_at, 'UTC', '')) = CURRENT_DATE()
)

{% endmacro%}