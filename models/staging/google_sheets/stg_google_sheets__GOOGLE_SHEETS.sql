with 

source as (

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