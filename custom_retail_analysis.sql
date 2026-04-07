create database retail_sales;
use retail_sales;
select*from custom_retail_data;


select
sum(sales) as total_sales,
sum(profit) as total_profit
from custom_retail_data;

select
region,sum(sales) as total_sales
from custom_retail_data
group by region 
order by total_sales desc 
limit 1 ;

select
full_name,sum(sales) as total_sales
from custom_retail_data
group by full_name
order by total_sales desc
limit 5;

select
category , sum(profit) as total_profit
from custom_retail_data
group by category 
order by total_profit desc
limit 1;

select
country, sum(profit) as total_profit
from custom_retail_data
group by country
order by total_profit desc
limit 1;


select
discount,
avg(profit) as avg_profit
from custom_retail_data
group by discount
order by discount;


select
category,
avg(sales)as avg_sales
from custom_retail_data
group by category
order by avg_sales desc;


select 
sub_category,
sum(sales) as total_sales,
sum(profit) as total_profit
from  custom_retail_data
group by sub_category
having total_profit > 0 
order by total_sales asc
limit 5 ;

select
category,
sum(quantity) as total_quantity_sold
from  custom_retail_data
group by category
order by total_quantity_sold
desc;


select 
order_id,
sales,
profit,
case 
when profit > 0 then 'profit'
when profit < 0 then ' No profit'
else 'no profit'
end as profit_status
from  custom_retail_data;

select *
from (select 
full_name,
sum(sales) as total_sales,
rank() over(order by sum(sales) desc) as rnk
from  custom_retail_data
group by full_name
) h
where rnk <=3
