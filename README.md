# sql-data-warehouse-projects

## 👋 Welcome & About Me
Hi there! Welcome to my repository. 

I'm **Vadla Bharadwaja**, an aspiring Data Analyst. This is my first data warehousing project, where I demonstrate end-to-end database modeling, data cleaning, and analytical SQL querying on transactional data.

Feel free to explore the scripts, star schema design, and insights. If you have any feedback or suggestions, don't hesitate to connect!

---

## 📁 Repository Structure
## Project Overview
A concise 2–3 sentence summary of what this project solves. Explain the business domain (e.g., retail sales, e-commerce, banking) and the primary objective (e.g., consolidating transactional tables into an analytical star schema to evaluate sales performance).

## Architecture & Data Modeling
* **Data Source:** Raw CSV/transactional records detailing orders, customers, and products.
* **Schema Design:** Star schema / Snowflake schema.
  * **Fact Table:** `fact_sales` (metrics: order quantity, revenue, discount, profit).
  * **Dimension Tables:** `dim_customers`, `dim_products`, `dim_date`.

## Key Technical Skills Demonstrated
* **ETL & Data Cleaning:** Handling `NULL` values, deduplication, and datatype normalization.
* **Advanced SQL:**
  * Multi-table joins and aggregation (`GROUP BY`, `HAVING`).
  * Window functions (`ROW_NUMBER()`, `DENSE_RANK()`, moving averages via `SUM(...) OVER(...)`).
  * Common Table Expressions (CTEs) for multi-stage transformations.
* **Performance Optimization:** Primary/Foreign key constraints and index selection for faster analytical query execution.

## Business Questions Answered
1. **Revenue Growth:** Which product categories drove the highest month-over-month revenue?
2. **Customer Segmentation:** Who are the top 10% of customers by lifetime spend?
3. **Regional Trends:** Which geographic zones have declining repeat purchases?
   
## data architecher
Data Architecture Overview
The pipeline implements a Medallion Architecture using separate schemas (bronze, silver, gold) within SQL Server to process source data originating from CRM and ERP systems.

[ Sources: CRM & ERP CSV/Flat Files ]
                  │
                  ▼
┌────────────────────────────────────────────────────────┐
│  BRONZE LAYER (Raw Ingestion)                          │
│  • Schema: bronze                                      │
│  • Tables: bronze.crm_*, bronze.erp_*                  │
│  • Strategy: Direct bulk ingestion (BULK INSERT / TRUNCATE & LOAD)
│  • No schema enforcement, transforms, or deduplication │
└────────────────────────────────────────────────────────┘
                  │
                  ▼
┌────────────────────────────────────────────────────────┐
│  SILVER LAYER (Cleaned & Standardized)                 │
│  • Schema: silver                                      │
│  • Data Cleansing: Trimming strings, null handling     │
│  • Normalization: Type casting, date standardized      │
│  • Integration: CRM & ERP records matched & merged     │
│  • Data Quality: Deduplication via stored procedures   │
└────────────────────────────────────────────────────────┘
                  │
                  ▼
┌────────────────────────────────────────────────────────┐
│  GOLD LAYER (Analytical / Dimensional Modeling)        │
│  • Schema: gold                                        │
│  • Star Schema design optimized for reporting (Power BI)│
│  • Dimension Views: gold.dim_customers, gold.dim_products
│  • Fact Views: gold.fact_sales                         │
│  • Pre-aggregated metrics & business-level logic       │
└────────────────────────────────────────────────────────┘

## Repositary structure

├── .github/
│   └── workflows/
│       └── sql-ci.yml                 # Optional automated linting / testing pipeline
├── datasets/                          # Source extract files (or sample CSVs)
│   ├── source_crm/
│   │   ├── cust_info.csv
│   │   ├── prd_info.csv
│   │   └── sales_details.csv
│   └── source_erp/
│       ├── cust_az12.csv
│       ├── loc_a101.csv
│       └── px_cat_g1v2.csv
├── docs/                              # Diagrams and data dictionary
│   ├── data_architecture.png
│   ├── data_dictionary.md
│   └── star_schema_diagram.png
├── scripts/
│   ├── 00_init_database.sql           # Creates database and bronze/silver/gold schemas
│   ├── bronze/
│   │   ├── ddl_bronze.sql             # DDL scripts for raw staging tables
│   │   └── proc_load_bronze.sql       # BULK INSERT / batch load stored procedure
│   ├── silver/
│   │   ├── ddl_silver.sql             # DDL scripts for cleaned tables
│   │   └── proc_load_silver.sql       # Transformation, cleansing, and merge procedures
│   └── gold/
│       ├── ddl_gold.sql               # Star schema views (dim_* and fact_*)
│       └── views/
│           ├── dim_customers.sql
│           ├── dim_products.sql
│           └── fact_sales.sql
├── tests/                             # Data validation and reconciliation scripts
│   ├── bronze_data_checks.sql         # Ingestion completeness & record counts
│   ├── silver_quality_checks.sql      # Null checks, duplicates, and invalid mappings
│   └── gold_reconciliation.sql        # Fact-to-dimension key integrity checks
├── .gitignore
├── LICENSE
└── README.md                          # Architecture overview, pipeline design & setup steps

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


Project OverviewThis project builds an end-to-end modern data warehouse in Microsoft SQL Server to consolidate disparate sales, customer, and product data from source CRM and ERP systems into a business-ready dimensional model.Designed under the Medallion Architecture (Bronze $\rightarrow$ Silver $\rightarrow$ Gold), the pipeline automates extraction, data cleaning, normalization, surrogate key generation, and fact/dimension modeling to enable self-service analytics and BI reporting.Source Files (CRM & ERP CSVs)
              │
              ▼
   [ Bronze: Raw Ingestion ]
   • BULK INSERT via T-SQL
   • 1:1 raw staging tables
              │
              ▼
   [ Silver: Clean & Conformed ]
   • Cleansing (TRIM, NULL handling, data standardizations)
   • CRM & ERP integration, deduping, and business logic
              │
              ▼
   [ Gold: Dimensional Modeling ]
   • Star Schema (dim_customers, dim_products, fact_sales)
   • Views optimized for Power BI & SQL reporting
Core Objectives & DeliverablesData Integration: Harmonize conflicting customer records and product categorization from CRM and ERP sources.Data Quality & Integrity: Automated procedures that log batch execution times, handle data type casting, validate foreign key integrity, and eliminate duplicates.Star Schema: Dimensional views in the presentation (gold) layer that provide high-performance query execution without unnecessary data redundancy.Analytical Readiness: A clean reporting semantic layer directly connectable to Power BI or SQL analytics queries.Key Technical Tools & Documentation LinksResource / ToolPurposeLink / ReferenceProject RepositoryReference codebase, schemas, DDLs, and ETL proceduresDataWithBaraa / sql-data-warehouse-projectYouTube Course ChannelEnd-to-end project walkthroughs and SQL design tutorialsData With Baraa (@DataWithBaraa)SQL Server ExpressFree lightweight database engine to host the data warehouse locallyMicrosoft SQL Server DownloadsSSMSGUI client to write queries, create stored procedures, and profile dataDownload SSMSDraw.ioArchitecture, data flow, and ER dimensional diagram designsdraw.io (diagrams.net)Power BI DesktopDashboard reporting connecting to Gold viewsPower BI Desktop DownloadProject Execution WorkflowDatabase Setup: Run 00_init_database.sql to instantiate the database and define the bronze, silver, and gold schemas.Bronze Ingestion: Execute EXEC bronze.load_bronze; to perform bulk inserts from the raw CRM and ERP CSV extracts into raw staging tables.Silver Cleansing: Execute EXEC silver.load_silver; to run transformation logic (string trimming, date corrections, categorical standardization, and CRM/ERP joins).Gold Modeling: Create the presentation views (gold.dim_customers, gold.dim_products, gold.fact_sales).Quality Tests: Run verification scripts (tests/gold_reconciliation.sql) to check row completeness and key integrity before dashboard publishing.

## Repository Structure

"Hi, I'm Vadla Bharadwaja. I'm a commerce graduate with a strong foundation in Computer Applications, specializing in data analytics and database management.

My core technical strengths revolve around SQL—including designing schemas, writing complex queries with CTEs and window functions, and query optimization—alongside Python and Power BI for data cleaning, analysis, and dashboarding.

Recently, I've been building end-to-end data warehousing and analytics projects where I take raw transactional datasets, model them into star schemas, and extract actionable business insights. I'm passionate about turning complex numbers into clear, strategic decisions, and I'm eager to contribute my analytical and database skills to an entry-level data team."
