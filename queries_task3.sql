
CREATE TABLE superstore_sales (
    `Order ID` VARCHAR(20),
    `Order Date` DATE,
    `Ship Date` DATE,
    `Customer Name` VARCHAR(100),
    Segment VARCHAR(50),
    Region VARCHAR(50),
    Category VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    Sales DECIMAL(10,2),
    Profit DECIMAL(10,2)
);

SELECT COUNT(*) FROM superstore_sales;
SELECT * FROM superstore_sales
LIMIT 10;

SELECT `Order ID`, Sales
FROM superstore_sales
WHERE Category = 'Technology'
ORDER BY Sales DESC;


-- below query identifies which product category genereates the highest revenue

select category, sum(Sales) as Total_Sales
from superstore_sales
group by category
order by total_Sales desc;

-- below query shows which region is most profitable

select Region, sum(Profit) as Total_Profit
from superstore_sales
group by Region
order by Total_Profit desc;

-- below query helps understand which customer segment places the most orders

select Segment, count(`Order ID`) as Total_Orders
from superstore_sales
group by Segment;


-- below query filters only high-performing categories

select Category, Sum(Sales) as Total_Sales
from superstore_sales
group by Category
having sum(Sales) > 100000 ;


-- below query identifies profitable regions vs loss-making ones.

select Region, sum(Profit) as Total_Profit
from superstore_sales
group by Region
having sum(Profit) > 0;

-- below query shows month-wise sales trend for 2016

select date_format(`Order Date`, '%y-%m') as Order_Month, sum(Sales) as Monthly_Sales
from superstore_sales
where `Order Date` between '2016-01-01' and '2016-12-31'
group by Order_Month
order by Order_Month;


-- below query is useful for customer-level analysis and search operations

select ` Order ID`, `Customer Name`, Sales
from superstore_sales
where `Customer Name` like 'A%';




