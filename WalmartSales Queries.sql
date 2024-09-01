create database project;

use project;

select * from data;

set sql_safe_updates=0;

select str_to_date(date,'%m/%d/%y');

select * from data
where coalesce (id, branch,city,customer_type,gender,product_line,unit_price,
	quantity,VAT,total,date,time,payment,COGS,gross_percent,gross_income,
    rating,time_of_day,day_name,month_name) is not null;

alter TABLE data
change `invoice id` ID VARCHAR(30);

alter TABLE data
change `unit price` unit_price double;

alter TABLE data
change `customer type` customer_type VARCHAR(30),
change `product line` product_line VARCHAR(30),
change `tax 5%` VAT DOUBLE,
change `GROSS MARGIN PERCENTAGE` graoss_percent double,
change `gross income` gross_income double;

alter TABLE data
change graoss_percent gross_percent double;

alter table data
ADD time_of_day TEXT;

update data
set time_of_day=case
	when HOUR(time) < 12 then 'Morning'
    when HOUR(time) < 18 then 'Afternoon'
    else 'Evening'
    end;

alter table data
add date_name text;
update data
set date_name=dayname(str_to_date(date,'%m/%d/%Y'));

alter table data
change date_name day_name text;

alter table data
ADD month_name TEXT;
update data
set month_name=monthname(str_to_date(date,'%m/%d/%Y'));

/* 1. How many unique cities does the data have? */
SELECT distinct city as unique_city FROM DATA;

/* 2. In which city is each branch? */
SELECT branch , city
FROM data
GROUP BY branch , city;


--/* PRODUCT */

/* 1. How many unique product lines does the data have? */
SELECT DISTINCT product_line AS unique_product_line
from data;

/* 2. What is the most common payment method? */
select max(payment) AS common_payment_method
from data;

/* 3. What is the most selling product line? */
SELECT product_line,sum(quantity) as total_sold
FROM data
group by product_line
order by sum(quantity) desc;

/* 4. What is the total revenue by month? */
select month_name,sum(total) as total_revenue
from data
group by month_name;

/* 5. What month had the largest COGS? */
select month_name,max(cogs) as largest_COGS
from data
group by month_name
order by max(cogs) desc;

/* 6. What product line had the largest revenue? */
select product_line,max(total) as largest_revenue
from data
group by product_line
order by max(total) DESC;

/* 7. What is the city with the largest revenue? */
select city,max(total) as largest_revenue
from data
group by city
order by max(total) DESC;

/* 8. What product line had the largest VAT? */
select product_line,max(VAT) from data
group by product_line
order by max(VAT) desc;

/* 9. Fetch each product line and add a column to those product line 
showing "Good","Bad" .Good if its greater than average sales */
select product_line, sum(Total) as total_sales,
case  
    when sum(total) > avg(total) then "Good"
    else "bad" 
    end "type"
    from data
group by product_line
order by total_sales desc;

/* 10. Which branch sold more products than average product sold? */
select branch,sum(quantity), avg(total) from data
group by branch
having sum(quantity) > (select avg(total) from data)
order by sum(quantity) desc;

/* 11. What is the most common product line by gender? */
select gender, max(product_line) as most_common_product from data
group by gender
order by most_common_product;

/* 12. What is the average rating of each product line? */
select product_line, avg(rating) from data
group by product_line
order by avg(rating) desc;


--/* SALES */

/* 1. Number of sales made in each time of the day per weekday */
SELECT day_name,time_of_day,branch,product_line,sum(quantity) as total_sales from data
group by day_name, time_of_day,branch,product_line
order by total_sales desc;

/* 2. Which of the customer types brings the most revenue? */
select customer_type,max(total) from data
group by customer_type
order by max(total) desc;

/* 3. Which city has the largest tax percent/ VAT (Value Added Tax)? */
select city, max(vat) as maximum_vat from data
group by city
order by max(vat) desc;

/* 4. Which customer type pays the most in VAT? */
select customer_type, max(vat) as maximum_vat from data
group by customer_type
order by max(vat) desc;


--/* CUSTOMER */ 

/* 1. How many unique customer types does the data have? */
SELECT distinct customer_type as unique_customers FROM DATA;

/* 2. How many unique payment methods does the data have? */
SELECT distinct payment as unique_payments FROM DATA;

/* 3. What is the most common customer type? */
SELECT customer_type,count(customer_type) as total_customers FROM DATA
group by customer_type
order by count(customer_type) desc;

/* 4. Which customer type buys the most? */
SELECT customer_type,sum(quantity) as purchases FROM DATA
group by customer_type
order by sum(quantity) desc;

/* 5. What is the gender of most of the customers? */
SELECT gender,count(gender) as total_customers FROM DATA
group by gender
order by count(gender) desc;

/* 6. What is the gender distribution per branch? */
SELECT branch, gender, count(gender) as total_customers FROM DATA
group by branch, gender
order by total_customers desc;

/* 7. Which time of the day do customers give most ratings? */
SELECT time_of_day,count(rating) as most_rated FROM DATA
group by time_of_day
order by count(rating) desc
limit 3;

/* 8. Which time of the day do customers give most ratings per branch? */
SELECT branch,time_of_day,count(rating) as most_rated FROM DATA
group by time_of_day,branch
order by count(rating) desc
limit 3;

/* 9. Which day of the week has the best avg ratings? */
SELECT day_name,avg(rating) as avg_rating FROM DATA
group by day_name
order by avg(rating) desc
limit 3;

/* 10. Which day of the week has the best average ratings per branch? */
SELECT day_name,avg(rating) as avg_rating FROM DATA
group by day_name
order by avg(rating) desc
limit 3;

/***************************************************************************************************************************
== My conclusion after looking into the result of the queries == 
1. According to sales, 
    -- Product like Electronic accessories are sold highest,
    -- A,B,C branches sold more than avg sales
    -- Yangon sold the highest product home and lifestyle
    -- January has highest sales on sports and travel
    -- sunday afternoon there are more sales in branch A 
    -- MEMBER customers and females purchase a lot
2. According to revenue,
    -- Fashion and accessories has highest revenue 1042.65
    -- Naypyitaw has highest revenue 1042.65
    -- JANUARY has highest revenue 116291.86
    -- MEMBER type of customer brings more revenue than NORMAL customers 
3. VAT - amount of tax on purchase,
    -- Highest VAT is on fashion and accessories
    -- Naypyitaw has highest VAT on its product_line
    -- MEMBER type of customers and females pay more VAT
4. Acoording to rating,
    -- During afternoon sports and travel is rated most w.r.t product_line 
    -- Monday has highest average 7.1 rating, w.r.t branch "B" has highest 7.3
    -- Fashion and accessiories are rated most w.r.t branch A
    -- On monday MEMBER type of customer has given highest rating 7.5
    -- Normal customer gave hight rating in branch c
5. In branch "A" and "B" males and more and in "C" female customers are more
    
***************************************************************************************************************************/




