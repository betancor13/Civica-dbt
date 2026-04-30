{{ config(
    materialized='incremental',
    incremental_strategy='merge'
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

-- Bloque condicional de Jinja para las cargas incrementales
{% if is_incremental() %}

  -- Si la tabla ya existe, solo coge las filas cuya fecha de sincronización
  -- sea más reciente que la última que tenemos guardada.
  where _fivetran_synced > (select max(_fivetran_synced) from {{ this }})

{% endif %}