{{
    config(
        materialized='incremental', 
        incremental_strategy='merge',
        unique_key='HASH_KEY',
        static_analysis = 'strict'
    )
}}

select
'{{invocation_id}}' as invocation_id,
*
from {{ source('btc', 'btc') }}

{% if is_incremental() %}

where block_timestamp > (select max(block_timestamp) from {{ this }})

{% endif %}