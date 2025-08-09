with

products as (

    select * from {{ ref('stg_products') }} WHERE 1=1

)

select * from products
