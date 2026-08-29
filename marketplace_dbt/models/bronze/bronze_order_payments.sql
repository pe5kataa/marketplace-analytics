SELECT *
FROM {{ source('raw', 'order_payments')}}