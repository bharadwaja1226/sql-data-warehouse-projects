/* 
__________________________________________________________________________________________________________
QUEALITY CHICK
__________________________________________________________________________________________________________

script Purpose:
This script performs quality checks to validate the 1
raty, consistency,
and accuracy of the Gold Layer. These checks ensure:
- Unaqueness. of surrogate keys/ in//dimension tables.
Referential integrity between fact and dimension tables.
- Va-ioationef relationshaps an the data model fon analytical purposes.
Usare Notes:
Runfithese checks/after data loadine silven Layer.
- Investigate and resolve any discrepancles found düring the checks.
*/

-------------------------------------------------------------------------
-- CREATE DIM TABLE = gold.dim_customers
-------------------------------------------------------------------------
IF OBJECT_ID ('gold.dim_customers','V') IS NOT NULL
DROP VIEW 	gold.dim_customers
GO

CREATE VIEW  gold.dim_customers AS

SELECT 
ROW_NUMBER () OVER (ORDER BY cst_id) as customer_key,
	ci.cst_id AS customer_id,
	ci.cst_key customer_number,
	ci.cst_firstname firstname,
	ci.cst_lastname lastname,
	lo.cntry as country,
	ci.cst_marital_status marital_status,
CASE WHEN ci.cst_gndr != 'U/N' THEN ci.cst_gndr
	ELSE COALESCE (er.gen,'U/N')
END gendar,
    er.bdate as birthday,
	ci.cst_create_date create_date
FROM  Silver.crm_cust_info as ci
LEFT JOIN Silver.erp_CUST_AZ12 as er
ON ci.cst_key = er.cid
LEFT JOIN Silver.erp_loc_a101 AS lo
ON ci.cst_key = lo.cid

-----------------------------------------------------------------------------------------------------------------
--CREATE DIM TABLE = gold.dim_products
-----------------------------------------------------------------------------------------------------------------

IF OBJECT_ID ('gold.dim_products','V') IS NOT NULL
DROP VIEW gold.dim_products
GO

CREATE VIEW gold.dim_products as 

SELECT 
    ROW_NUMBER () over (order by pr.prd_start, prd_key) as product_key,
    pr.prd_id product_id,
	pr.prd_key product_number,
	pr.prd_nm product_name,
	COALESCE (cat.id,'U/N')  as category_id,
	COALESCE (cat.cat,'U/N') as category,
	COALESCE (cat.subcat,'U.N') as  subcategory,
	COALESCE (cat.maintenance,'U/N') as maintenance,
	pr.prd_cost cost,
	pr.prd_line product_line,
	pr.prd_start as product_start
FROM Silver.crm_prd_infos as pr
LEFT JOIN Silver.erp_px_cat_g1v2 as cat
ON pr.cat_key = cat.id

------------------------------------------------------------------------------------------------------
-- CREATE FACT TABLE = gold.fact_sales
------------------------------------------------------------------------------------------------------

IF OBJECT_ID ('gold.fact_sales','v') IS NOT NULL
DROP VIEW gold.fact_sales 
GO

CREATE VIEW   gold.fact_sales as 

SELECT 
      sd.sls_cust_id as customer_id,
      pr.product_key,
      cu.customer_key,
      SD.sls_order_dt as order_date,
      SD.sls_ship_dt as shipping_date,
      SD.sls_due_dt as due_date,
      SD.sls_sales as sales_amount,
      SD.sls_quantity as quantity,
      SD.sls_price as price
FROM  silver.crm_sales_details as sd
LEFT JOIN Gold.dim_products as pr
ON sd.sls_prd_key = pr.product_number
LEFT JOIN Gold.dim_customers as cu
ON sd.sls_cust_id = cu.customer_id
