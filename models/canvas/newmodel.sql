WITH stg_customers AS (
  /* Customer data with basic cleaning and transformation applied, one row per customer. */
  SELECT
    *
  FROM {{ ref('jaffle_shop', 'stg_customers') }}
), stg_orders AS (
  /* Order data with basic cleaning and transformation applied, one row per order. */
  SELECT
    *
  FROM {{ ref('jaffle_shop', 'stg_orders') }}
), "join" AS (
  SELECT
    *
  FROM stg_customers
  LEFT JOIN stg_orders
    USING (CUSTOMER_ID)
), newmodel_sql AS (
  SELECT
    *
  FROM "join"
)
SELECT
  *
FROM newmodel_sql