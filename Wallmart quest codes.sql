select*
from wallmartsales.sales;
#---------------Generic Question---------------

#Question 1 How many unique cities on date?

select distinct city
from sales;

#Question 2 In which city is each Branch?

select distinct city, Branch
from sales;

#Question 3 How many unique product line does the date have?

select distinct product_line
from sales;

#Question 4 WHat is most common payment mothod?

select Payment_method, count(Payment_method) As count
from sales
group by Payment_method
order by count desc
;

# Q5 What is the most selling product line?

select product_line, count(Product_line) As product_count
from sales
group by Product_line
order by product_count desc
;

#Q6 What is the total revenue by month?
select*
from sales;

select monthname(date),sum(total)
from sales
group by monthname(date)
order by sum(total)desc;

select month,
sum(total) As Total_revenue
from sales
group by month
order by Total_revenue Desc
;


#Q7 What month had the largest COGS?

select month, sum(cogs) as Lar_cogs
from sales
group by month
order by Lar_cogs desc;

#Q8 What product line had the largest revenue?

select Product_line, sum(total) as Lar_revenue
from sales
group by Product_line
order by Lar_revenue desc
;

#Q9 What is the city with the largest revenue?

select City, branch, sum(total) as Lar_revenue
from sales
group by City, branch
order by Lar_revenue desc
;

#10 What product line had the largest VAT?

select Product_line, Avg(vat) As Lar_Vat
from sales
group by Product_line
order by Lar_vat desc
;

#Q11 Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

select product_line
from Sales;


#Q12 Which branch sold more products than average product sold?

select branch, sum(Quantity) as Qty
from sales 
group by Branch
having sum(Quantity) > (select avg(quantity) from sales)
;

select branch, sum(Quantity) as Qty
from sales 
group by Branch
order by qty desc;

#Q13 What is the most common product line by gender?

select gender, Product_line, count(Gender) as Prod
from sales
group by gender, Product_line
order by prod desc;

#Q14 What is the average rating of each product line?

select Product_line, round(avg(rating),2) as Avg_rating
from sales
group by Product_line
order by Avg_rating ;

#--------Sales question--------

#Q15 Number of sales made in each time of the day per weekday

select Time_of_date, Day,
  count(Total) As total_sales
from Sales
where Day = "Tuesday"
group by Day, Time_of_date
order by total_sales
;

#16 Which of the customer types brings the most revenue?

select customer_type, round(sum(total)) As Total_revenue
from sales
group by customer_type
order by Total_revenue
;

#17Which city has the largest tax percent/ VAT (Value Added Tax)?

select city, round(avg(Vat),2) As VAT
from sales
group by city
order by VAT Desc
;

#Q18Which customer type pays the most in VAT?

select customer_type, round(avg(Vat),2) as Vat
from Sales
group by customer_type
order by vat desc
;

#---------------------------Customer-------------------

#19How many unique customer types does the data have?

select distinct Customer_type
from sales;

#20 How many unique payment methods does the data have?

select distinct Payment_method
from sales;

#21 What is the most common customer type?
#22 Which customer type buys the most?

select customer_type, count(*) As Customer_count
from sales
group by customer_type
order by Customer_count desc
;

#Q23 What is the gender of most of the customers?

select gender, count(*) as Customer_cnt 
from sales
group by gender
order by customer_cnt
;

#Q24 What is the gender distribution per branch?

select gender, count(*) as Gender_count
from sales
where branch = "A"
group by gender
order by Gender_count
;

#Q25 Which time of the day do customers give most ratings?

select Time_of_date, round(avg(Rating),2) as cust_rating
from sales
group by Time_of_date
order by cust_rating
;

#Q26 Which time of the day do customers give most ratings per branch?

select Time_of_date, round(avg(rating),2) as Cust_rating
from sales
where Branch = "A"
group by time_of_date
order by cust_rating
;

#Q27 Which day fo the week has the best avg ratings?

select Day, round(avg(Rating),2) as Rating
from sales
group by Day
order by Day
;

#Q28 Which day of the week has the best average ratings per branch?

select Day, round(avg(rating),2) as Rating
from sales
where branch = "A"
group by Day
order by Rating desc
;

