-- 1. Create two Databases Name :- Brands , and Products

Create Database Brand;

Create Database Products;

--2. Create two tables in SQL Server name as ITEMS_TABLE in Brands database and PRODUCT_TABLE in Products database.

Use Brand;
Create Table 
Items_table 
("Item_ID" int, "Item_Description" varchar(60),"Vendor_nos" int, "Vendor_name" varchar(60),"Bottle_size" int, "Bottle_Price" decimal );
Select * from Items_table; --for checking the Table is created correctly or not.

use Products;

Create table PRODUCT_TABLE
("Product Id" int, "Country" varchar(60), "Product" varchar(60), "Units Sold" Decimal,
"Manufacturing Price" int, "Sale Price" int, "Gross Sale" int, "Sales" int,
"COGS" int, "Profit" int, "Date" date, "Month_Number" int, "Month_Name" varchar(60), "Year" int);

Select * from PRODUCT_TABLE; -- for checking the table is created correctly or not

--3. After Creating both the tables Add records in that tables

use Brand;

insert into Items_table
values (1, 'Travis Hasse Apple pie', 305, 'MHW LTD', 750, 9.77);

select * from Items_table;

insert into Items_table
values (2, 'daristi Xtabentun', 391,'Anchor Distilling (preiss Imports', 750, 14.12);


insert into Items_table
values (3, 'Hiram Walker Peach Brandy', 370,'Permpd Richard USA/Austin Nichols', 1000, 6.5);


insert into Items_table
values (4, 'Oak Cross Whisky', 305,'Mhw Ltd', 750, 25.33);


insert into Items_table
values (5, 'Uv Red(Cherry) Vodka', 380,'Phillips Beverage Company', 200, 1.97);


insert into Items_table
values (6, 'Heven Hill Old Style White Label', 259,'Heven Hill Distilleries Inc.', 750, 6.37);


insert into Items_table
values (7, 'Hyde Herbal Liqueur', 194,'Fire Tail Brands Llc', 750, 5.06);


insert into Items_table
values (8, 'Dupont Calvados Fine Reserve', 403,'Robert Kacher Selections', 750, 23.61);\

Select * from Items_table;

use Products;

insert into PRODUCT_TABLE
Values (1, 'Canada', 'carretera', 1618.5, 3,20,32370,16185,16185, 1/1/2014,1,'January',2014);

INSERT INTO PRODUCT_TABLE
VALUES ( 1, 'Canada','carretera',1618.5, 3, 20, 32370,32370, 16185, 16185, '2014-01-01', 1, 'January', 2014);

select * from PRODUCT_TABLE;

insert into PRODUCT_TABLE
values (2,'Germany','carretera',1321,3,20,26420,26420,13210,13210,'2014-01-01',1,'January',2015);

insert into PRODUCT_TABLE values
(3,'FRANCE','CARRETERA',2178,3,15,32670,32670,21780,10890,'2014-01-06',6,'JUNE',2016);

INSERT INTO PRODUCT_TABLE VALUES
(4,'GERMANY','CARRETERA',888,3,15,13320,13320,8880,4440,'2014-01-06',6,'JUNE',2017);

INSERT INTO PRODUCT_TABLE VALUES
(5,'MEXICO','CARRETERA',2470,3,15,37050,37050,24700,12350,'2014-01-06',6,'JUNE',2018);

INSERT INTO PRODUCT_TABLE VALUES
(6,'GERMANY','CARRETERA',1513,3,350,529550,529550,393380,136170,'2014-12-01',12,'december',2019);

INSERT INTO PRODUCT_TABLE VALUES
(7,'Germany','Montana',921,5,15,13815,13815,9210,4605,'2014-03-01',3,'March',2020);

INSERT INTO PRODUCT_TABLE VALUES
(8,'Canada','Montana',2518,5,12,30216,30216,7554,22662,'2014-01-06',6,'JUNE',2018);

--4 Delete those product having the Units Sold 1618.5 , 888 and 2470.

SELECT * FROM PRODUCT_TABLE
WHERE [Units Sold] IN (1618.5, 888, 2470);  --first checked which rows have those values

delete from PRODUCT_TABLE
where [Units Sold] in (1618.5,888,2470);  -- deleted those products

-- 5 Select all records from the ITEMS_TABLE table.

use Brand;

select * from Items_table;


--6 Select the item_description and bottle_price for all items in the ITEMS_TABLE table.

select item_Description, Bottle_Price
from Items_table;

--7 Find the item_description and bottle_price of items where bottle_price is greater than 20.

SELECT item_description, bottle_price
FROM ITEMS_TABLE
WHERE bottle_price > 20;

--8 Select Unique Country from the product_sales table

use Products;

SELECT DISTINCT Country
FROM PRODUCT_TABLE;

--9 Count the number of Countries in the product_sales table

SELECT COUNT(DISTINCT country) AS Country_Count FROM PRODUCT_TABLE;

--10 How Many Countries are there which contain the sales price between 10 to 20

SELECT COUNT(Country) AS Country_Count
FROM PRODUCT_TABLE
WHERE [Sale Price] BETWEEN 10 AND 20;

--Intermediate Questions

-- 1. Find the Total Sale Price and Gross Sales

SELECT
    SUM([Units Sold] * [Sale Price]) AS Total_Sale_Price,
    SUM([Units Sold] * [Sale Price]) AS Gross_Sales
FROM
    PRODUCT_TABLE;

	use Products;
Select * from PRODUCT_TABLE;

-- 2. In which year we have got the highest sales

SELECT
    Year,
    SUM ([Gross Sale]) AS Total_Gross_Sales
FROM
    PRODUCT_TABLE
GROUP BY
    Year
ORDER BY
    Total_Gross_Sales DESC;

--3. Which Product having the sales of $ 37,050.00

SELECT
    PRODUCT,
    ([Units Sold] * [Sale Price]) AS Total_Sale_Price
FROM
    PRODUCT_TABLE
WHERE
    ([Units Sold] * [Sale Price]) = 37050;

-- As their are no Item where sales of $37050.00 is happend so it show No Results.

--4. Which Countries lies between profit of $ 4,605 to $ 22,662.00

SELECT
    DISTINCT Country,
    Profit
FROM
    PRODUCT_TABLE
WHERE
    Profit BETWEEN 4605 AND 22662;

-- 5. Which Product Id having the sales of $ 24,700.00

SELECT
    PRODUCT,
    ([Units Sold] * [Sale Price]) AS Total_Sale_Price
FROM
    PRODUCT_TABLE
WHERE
    ([Units Sold] * [Sale Price]) = 24700.00;

-- their are no product with Sales of 24700.

-- 6. Find the total Units Sold for each Country.

SELECT
    Country,
    SUM([Units Sold]) AS Total_Units_Sold
FROM
    PRODUCT_TABLE
GROUP BY
    Country;

--7. Find the average sales for each country
SELECT
    Country,
    AVG([Gross Sale]) AS Average_Sales
FROM
    PRODUCT_TABLE
GROUP BY
    Country;

-- 8. Retrieve all products sold in 2014

SELECT
    DISTINCT Product
FROM
    PRODUCT_TABLE
WHERE
    Year = 2014;

--	Find the maximum Profit in the product_sales table.

Select 
MAX(Profit) as Maximum_Profit
from PRODUCT_TABLE;

-- 10 Retrieve the records from product_sales where Profit is greater than the average Profit of all records.

Select * from PRODUCT_TABLE;

Select * from PRODUCT_TABLE
where profit > ( select AVG(profit) from PRODUCT_TABLE);

--11 - Find the item_description having the bottle size of 750

use Brand;

select * from Items_table;


select Item_Description
from Items_table
where Bottle_size = 750;

-- 12. Find the vendor Name having the vendor_nos 305 , 380 ,391

SELECT Vendor_Name
FROM Items_table
WHERE Vendor_nos in (305, 380, 391);

-- 13. What is total Bottle_price

Select Sum(Bottle_Price) as Total_Bottle_Price
from Items_table;

-- 14. Make Primary Key to Item_id

ALTER TABLE Items_table
ALTER COLUMN Item_id INT NOT NULL;  

Alter table Items_table Add primary key (Item_ID);

-- 15 Which item id having the bottle_price of $ 5.06

Select * from Items_table;

SELECT Item_id
FROM Items_table
WHERE Bottle_price = 5.06;

-- Their are no items with Bottle_price = 5.06.

-- Advance Questions:-

--1. Apply INNER , FULL OUTER , LEFT JOIN types on both the table

--Inner join

SELECT Item_ID
from brand.dbo.Items_table
INNER JOIN PRODUCTs.dbo.Product_table 
ON Items_table.Item_ID = PRODUCT_TABLE.[Product Id];

-- Full Outer join

Select Item_ID
From brand.dbo.Items_table
FULL OUTER JOIN PRODUCTs.dbo.Product_table 
ON Items_table.Item_ID = PRODUCT_TABLE.[Product Id];

--Left Join

Select Item_ID
from Brand.dbo.Items_table
Left join Products.dbo.PRODUCT_TABLE
on Items_table.Item_ID = PRODUCT_TABLE.[Product Id];


--2. Find the item_description and Product having the gross sales of 13,320.00

Select 
i.Item_ID,
i.Item_Description,
p.Product
From brand.dbo.Items_table as i
FULL outer JOIN PRODUCTs.dbo.Product_table as p
ON i.Item_ID = p.[Product Id]
where p.[Gross Sale]=13320;

Select
i.Item_ID,
i.Item_Description,
p.Product
From Brand.dbo.Items_table as i
inner join Products.dbo.PRODUCT_TABLE as p
ON i.Item_ID = p.[Product Id]
WHERE p.[Gross Sale] = 12320;

use Products;
Select * from PRODUCT_TABLE;
use Brand;
select * from Items_table;


--3. Split the Item_description Column into Columns Item_desc1 and Item_desc2
substring
charindex
--4. Find the top 3 most expensive items in the ITEMS_TABLE table.
--5. Find the total Gross Sales and Profit for each Product in each Country.
--6. Find the vendor_name and item_description of items with a bottle_size of 750 and bottle_price less than 10.
--7. Find the Product with the highest Profit in 2019.
--8. Retrieve the Product_Id and Country of all records where the Profit is at least twice the COGS.
--9. Find the Country that had the highest total Gross Sales in 2018 
--10. Calculate the total Sales for each Month Name across all years.
--11. List the item_description and vendor_name for items whose vendor_nos exists more than once in the ITEMS_TABLE table.
--12. Find the average Manufacturing Price for Product in each Country and only include those Country and Product combinations where the average is above 3

