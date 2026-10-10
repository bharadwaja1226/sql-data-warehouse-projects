
1. gold.dim_products

• Purpose: Stores comprehensive and current product descriptive details compiled across 
the CRM and ERP systems. All historical product alterations are filtered out to keep only current 
catalog assets active .
_______________________________________________________________________________________________________________________________________________
Column Name	    Data Type	                 Description
_______________________________________________________________________________________________________________________________________________
product_key   	INT	                          System-generated unique Surrogate Key utilized as the Primary Key to link with the fact table.
-----------------------------------------------------------------------------------------------------------------------------------------------
product_id	    INT	                          The natural source system identifier for the product.
-----------------------------------------------------------------------------------------------------------------------------------------------
product_number  NVARCHAR(50)	                Friendly alphanumeric system identity matching the business's product code string.
-----------------------------------------------------------------------------------------------------------------------------------------------
product_name	  NVARCHAR(50)	                The clear, descriptive name of the product (32:14).
-----------------------------------------------------------------------------------------------------------------------------------------------
category_id	    NVARCHAR(50)    	            Unique relational identifier referencing the parent product category.
-----------------------------------------------------------------------------------------------------------------------------------------------
category	      NVARCHAR(50)	                High-level categorization label mapping the product family group (e.g., 'Bikes', 'Clothing').
-----------------------------------------------------------------------------------------------------------------------------------------------
subcategory	    NVARCHAR(50)	                Secondary narrow classification partitioning categories into targeted slices.
-----------------------------------------------------------------------------------------------------------------------------------------------
maintenance    	NVARCHAR(50)	                Service and support structural code conditions tagged to the specific product.
-----------------------------------------------------------------------------------------------------------------------------------------------
cost	          INT	                          Financial base baseline manufacturing or acquisition value tracking production costs.
-----------------------------------------------------------------------------------------------------------------------------------------------
product_line  	NVARCHAR(50)	                Strategic segment categorizing which business branch line it targets .
-----------------------------------------------------------------------------------------------------------------------------------------------
start_date	    DATE	Timestamp               indicating exactly when this specific current record became effective.
_______________________________________________________________________________________________________________________________________________


2.gold.dim_customers 

• Purpose: Stores comprehensive and current customers descriptive details compiled across 
the CRM and ERP systems. All historical product alterations are filtered out to keep only current 
catalog assets active

_____________________________________________________________________________________________________________________________________________________________________
column name       data type                 Description
____________________________________________________________________________________________________________________________________________________________________
customer_key     bigint                     System-generated unique Surrogate Key utilized as the Primary Key to link with the fact table
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
customer_id      int                        The natural source system identifier for the customers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
customer_number  nvarchar (50)              Friendly alphanumeric and integers system identity matching the business's  customer_number code string.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
firstname        nvarchar (50)              Friendly alphanumeric system identity matching the business's firstname code string
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
lastname         nvarchar (50)              Friendly alphanumeric system identity matching the business's lastname code string
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
country          nvarchar (50)              Friendly alphanumeric system identity matching the business's country code string
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
marital_status   nvarchar (50)              Friendly alphanumeric system identity matching the business's marital_status is 'u/n' and 'maried','single' code string
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
gendar           nvarchar (50)              Friendly alphanumeric system identity matching the business's gendar 'u/n' and 'male','female' code string
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
birthday         date                       date customers birthday it's include 'u/n' and dates 'dd-MM-yyyy' like '04-12-2004'
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
create_date      date                       date of customer use is like a 'u/n' and dates 'dd-MM-yyyy' like '01-12-2022'
__________________________________________________________________________________________________________________________________________________________________



3. gold.fact_sales


• Purpose: Acts as the central transaction repository containing commercial order logs, dates, financial measures, 
and surrogate lookups connecting dimensions.
______________________________________________________________________________________________________________________________________________________________________
Column Name	        Data Type                  Description
______________________________________________________________________________________________________________________________________________________________________
order_number	      NVARCHAR(50)	             Clean business identifier corresponding to the customer's transaction checkout code.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
product_key	        INT	                       Foreign Key lookup resolving directly into the system-generated index inside gold.dim_products.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
customer_key	      INT	                       Foreign Key lookup resolving directly into the system-generated index inside gold.dim_customers.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
order_date        	DATE	                     The definitive operational timestamp tracking when the transaction occurred.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
shipping_date	      DATE	                     Operational timestamp tracking when order contents cleared warehouses for fulfillment.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
due_date	          DATE	                     Financial target timestamp indicating terms payment expiration deadlines.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
sales_amount	      INT	                       Aggregated aggregate value calculated by multiplying unit quantities against prices.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
quantity          	INT                      	 Integer count representing the aggregate units requested during checkout processes.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
price	              INT	                       Standardized per-unit catalog item tag configured at the exact time of order logging.
_______________________________________________________________________________________________________________________________________________________________________












