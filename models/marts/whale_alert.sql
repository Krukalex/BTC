WITH WHALES as(

    select
        output_address,
        sum(output_value) as total_sent,
        count(*) as tx_count
    from {{ ref('stg_btc_transactions') }} t

    where output_value > 10

    group by output_address
    order by total_sent desc
),
select
    w.total_sent,
    w.output_address,
    w.tx_count,
    {{ convert_to_usd('w.total_sent') }} as total_sent_usd
from 
    WHALES w
order by total_sent desc