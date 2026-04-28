with 

source as (

    select * from {{ source('POSTGRES', 'ADDRESSES') }}

),

renamed as (

    select

    from source

)

select * from renamed