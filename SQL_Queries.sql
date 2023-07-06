select * from pizza_sales

select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price)/count(distinct order_id) as Avg_Order_Value from pizza_sales

select sum(quantity) as Total_Pizza_Sold from pizza_sales

select count(distinct order_id) as Total_Orders from pizza_sales

select cast(cast(sum(quantity) as Decimal(10,2)) /
cast(count(distinct order_id) as Decimal(10,2)) as Decimal(10,2)) as Avg_Pizzas_Per_Order from pizza_sales

--Daily trend
select datename(DW, order_date) as Order_Day ,count(distinct order_id) as Total_Orders 
from pizza_sales
group by datename(DW, order_date)

--Hourly Trend
select datepart(hour,order_time) as order_hours, count(distinct order_id) as Total_Orders 
from pizza_sales
group by datepart(hour,order_time)
order by datepart(hour,order_time)

select pizza_category,sum(total_price) as Total_Sales, sum(total_price) * 100 /
(select sum(total_price) from pizza_sales where month(order_date) = 1) as PCT
from pizza_sales
where month(order_date) = 1
group by pizza_category

select pizza_size,cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price) * 100 /
(select sum(total_price) from pizza_sales where datepart(quarter,order_date) = 1) as decimal(10,2)) as PCT
from pizza_sales
where datepart(quarter,order_date) = 1
group by pizza_size
order by PCT desc

select pizza_category, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_category

select top 5 pizza_name,sum(quantity) as Total_Pizzas_Sold
from pizza_sales
where month(order_date)=8
group by pizza_name
order by sum(quantity) desc


