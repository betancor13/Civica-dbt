with orders as (
    select * from {{ ref('stg_POSTGRES__ORDERS') }}
)
select * from orders