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

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Repository Structure

"Hi, I'm Vadla Bharadwaja. I'm a commerce graduate with a strong foundation in Computer Applications, specializing in data analytics and database management.

My core technical strengths revolve around SQL—including designing schemas, writing complex queries with CTEs and window functions, and query optimization—alongside Python and Power BI for data cleaning, analysis, and dashboarding.

Recently, I've been building end-to-end data warehousing and analytics projects where I take raw transactional datasets, model them into star schemas, and extract actionable business insights. I'm passionate about turning complex numbers into clear, strategic decisions, and I'm eager to contribute my analytical and database skills to an entry-level data team."
