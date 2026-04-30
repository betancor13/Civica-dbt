{{ config(
    materialized='incremental',
    incremental_strategy='append' 
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

  -- Sigue siendo vital filtrar por fecha, de lo contrario
  -- insertaría TODA la tabla de nuevo cada vez que lo ejecutes.
  where _fivetran_synced > (select max(_fivetran_synced) from {{ this }})

{% endif %}