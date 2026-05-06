select
    order_id,
    order_date,
    delivered_at
from {{ ref('fct_orders') }}
where delivered_at < order_date        -- Pedidos que se entregaron antes de ser comprados