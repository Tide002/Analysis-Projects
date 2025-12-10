create SCHEMA lita;
use lita;

select count(*) from litadataset;   

select * from litadataset;

-- retrieve the total sales for each product category.
select product, quantity * unitprice AS Total_sale from litadataset;

-- find the number of sales transactions in each region. 
select region, count(*) AS sale_transaction from litadataset 
group by region;

-- find the highest-selling product by total sales value.
select product, sum(Quantity*unitprice) Total_sale from litadataset
group by product order by Total_sale
desc limit 1;

-- calculate total revenue per product.
select product, sum(Quantity*unitprice) as revenue from litadataset
group by product;

-- calculate monthly sales totals per year.
SELECT Year(OrderDate) AS Year,
		month(OrderDate) AS month,
       SUM(Quantity * UnitPrice) AS MonthlySales
FROM litadataset
GROUP BY Year(OrderDate),
		month(OrderDate)
ORDER BY year,
		month;

select * from litadataset;

-- find the top 5 customers by total purchase amount. 
select CustomerId, sum(Quantity * Unitprice) as totalPurchase from litadataset
group by customerId order by totalPurchase desc limit 5;

-- calculate the percentage of total sales contributed by each region.
select region, 
(sum(quantity*Unitprice) / 
(select sum(quantity*Unitprice)FROM litadataset)) * 100
 AS percentage_of_total_sales
 from litadataset
group by region;

-- identify products with no sales in the last quarter.
select * from litadataset where quantity = 0 and quarter(OrderDate) = 4;
