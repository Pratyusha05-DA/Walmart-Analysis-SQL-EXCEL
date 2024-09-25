# Walmart Sales Analysis and Excel Dashboard
### Overview
This project involves a comprehensive analysis of Walmart sales data across three branches located in Mandalay, Yangon, and Naypyitaw in Myanmar (Burma). The primary objective is to extract valuable insights from the sales data, including product performance, sales trends, customer behavior, and revenue patterns. The analysis is executed using SQL, with the results visualized in a dynamic and interactive Excel dashboard.

### Purpose of the Project
The project aims to provide actionable insights that can help optimize sales strategies, improve customer targeting, and enhance overall profitability. Additionally, this project serves as a demonstration of SQL proficiency in handling real-world data scenarios, focusing on single-table analysis.

### Data Description
The dataset comprises sales transactions from three different Walmart branches - Mandalay, Yangon and Naypyitaw capturing a wide range of metrics crucial for analyzing the business's performance. The dataset includes 17 columns and 1,000 rows, with details such as invoice ID, branch location, customer type, product line, unit price, quantity sold, VAT, total cost, and other relevant metrics.

### Key Columns:
* Branch: Indicates the branch where the sale was made.
* City: Location of the branch.
* Customer Type: Type of the customer (e.g., Member or Normal).
* Product Line: Category of products sold.
* Unit Price: Price of each product sold.
* Quantity: Number of units sold.
* VAT: Tax applied to the transaction.
* Total: Final cost including VAT.
* Gross Income: Income generated from the sale.
* Rating: Customer rating for the transaction.

### Approach
**Data Preparation**

The project began with data wrangling to ensure the dataset was clean and ready for analysis. This involved checking for NULL values, performing feature engineering, and creating new columns to enhance the depth of the analysis. Specific transformations included:
* Time of Day - Categorizing transactions into Morning, Afternoon, and Evening to identify peak sales periods.
* Day Name - Extracting the day of the week for each transaction to understand weekly sales trends.
* Month Name - Extracting the month to identify seasonal patterns in sales and profitability.

### Analytical Breakdown
This section details the analysis conducted to gain insights into various aspects of Walmart’s sales data, structured around key business questions:

* Product Analysis - Analyzed unique product lines and identified the most selling product line to assess product performance and market preferences.
* Sales Analysis - Examined branch performance to determine which branches sold more products than the average, providing insights into branch effectiveness and sales strategies.
* Revenue Analysis - Evaluated total revenue by month to understand revenue trends and seasonal variations.
* Payment Analysis - Assessed the impact of different payment methods on sales and customer satisfaction.
* Customer Demographics - Analyzed customer types and their impact on sales to understand customer behavior and preferences.
* Rating Analysis - Investigated customer ratings to evaluate satisfaction levels and identify potential areas for improvement.

### Excel Dashboard
The insights generated from SQL were visualized in an Excel dashboard, which serves as an interactive tool for stakeholders. The dashboard includes:
* Product Performance: Visualizations highlighting the best and worst-performing product lines.
* Sales Trends: Charts depicting sales trends over time, broken down by branch and customer type.
* Customer Insights: Analysis of customer demographics, including gender distribution and customer type profitability.
* Payment Methods: Insights into the most common and most profitable payment methods.

![Description of Image](https://drive.google.com/uc?export=view&id=1Yd5Hjc3eFaI5iTZrleBJEoJyZe7ljww4)

### Tools and Technologies
**SQL**         
Used for querying, data transformation, and analysis.

**Excel**     
Utilized for building the dashboard, including data visualization, pivot tables, and slicers to create an interactive user experience.

### Conclusion
The Walmart Sales Analysis project provides a comprehensive view of sales performance across multiple dimensions, including product lines, customer behavior, and sales trends. The insights derived from this analysis can guide strategic decisions to improve sales, customer satisfaction, and profitability. The use of SQL for data manipulation, combined with an Excel dashboard for visualization, demonstrates the effectiveness of using data-driven approaches to solve real-world business problems.


