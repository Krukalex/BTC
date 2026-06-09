{{config(materialized = 'table', static_analysis = 'strict')}}

select
    *
from {{ ref('stg_btc_outputs') }}
WHERE
    is_coinbase = false