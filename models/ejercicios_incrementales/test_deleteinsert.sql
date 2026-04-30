{{ config(
    materialized='incremental',
    unique_key='month',
    incremental_strategy='delete+insert'
) }}

with source as (
    select * from {{ source('google_sheets', 'GOOGLE_SHEETS') }}
),

renamed as (
    select
        _row,
        quantity,
        month,
        product_id,
        _fivetran_synced
    from source
)

select * from renamed

{% if is_incremental() %}

  -- Traemos solo los datos de la capa Bronze que sean nuevos
  where _fivetran_synced > (select max(_fivetran_synced) from {{ this }})

{% endif %}