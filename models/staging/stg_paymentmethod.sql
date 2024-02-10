with source as (

    select * from {{ ref('raw_payments') }}

)

select distinct 
    case when payment_method = 'bank_transfer' then 1
    when payment_method = 'coupon' then 2
    when payment_method = 'credit_card' then 3
    when payment_method = 'gift_card' then 4
    else 99 end as payment_method_id,
    payment_method
from source