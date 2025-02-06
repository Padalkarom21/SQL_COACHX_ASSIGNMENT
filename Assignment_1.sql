Create database customers_orders_products;

use customers_orders_products;

create table Customers
(
CustomerID int primary key,
Name varchar(50),
Email varchar(100)
);

insert into Customers(CustomerID,Name,Email) values
(1, 'John Doe', 'johndoe@example.com'),
(2, 'Jane Smith', 'janesmith@example.com'),
(3, 'Robert Johnson', 'robertjohnson@example.com'),
(4, 'Emily Brown', 'emilybrown@example.com'),
(5, 'Michael Davis', 'michaeldavis@example.com'),
(6, 'Sarah Wilson', 'sarahwilson@example.com'),
(7, 'David Thompson', 'davidthompson@example.com'),
(8, 'Jessica Lee', 'jessicalee@example.com'),
(9, 'William Turner', 'williamturner@example.com'),
(10, 'Olivia Martinez', 'oliviamartinez@example.com'),
(11, 'James Anderson', 'jamesanderson@example.com'),
(12, 'Kelly Clarkson', 'kellyclarkson@example.com');

Select * from customers

Create table Orders
(
OrderID int primary key,
CustomerID int,
ProductName varchar(50),
OrderDate date,
Quantity int,
Foreign key(CustomerID) references Customers(CustomerID)
);

insert into Orders (OrderID,CustomerID,ProductName,OrderDate,Quantity) values

(1, 1, 'Product A', '2023-07-01', 5),
(2, 2, 'Product B', '2023-07-02', 3),
(3, 3, 'Product C', '2023-07-03', 2),
(4, 4, 'Product A', '2023-07-04', 1),
(5, 5, 'Product B', '2023-07-05', 4),
(6, 6, 'Product C', '2023-07-06', 2),
(7, 7, 'Product A', '2023-07-07', 3),
(8, 8, 'Product B', '2023-07-08', 2),
(9, 9, 'Product C', '2023-07-09', 5),
(10, 10, 'Product A', '2023-07-10', 1),
(11, 11, 'Product D', '2023-07-10', 3),
(12, 12, 'Product E', '2023-07-11', 6),
(13, 5, 'Product G', '2023-07-12', 2),
(14, 4, 'Product H', '2023-07-13', 4),
(15, 6, 'Product I', '2023-07-14', 3);

select * from Orders

Create table Products
(
ProductID int primary key,
ProductName varchar(50),
Price Decimal(10,2)
);

Insert into Products(ProductID,ProductName,Price) values
(1, 'Product A', 10.99),
(2, 'Product B', 8.99),
(3, 'Product C', 5.99),
(4, 'Product D', 12.99),
(5, 'Product E', 7.99),
(6, 'Product F', 6.99),
(7, 'Product G', 9.99),
(8, 'Product H', 11.99),
(9, 'Product I', 14.99),
(10, 'Product J', 4.99),
(11, 'Product K', 3.99),
(12, 'Product L', 15.99);

Select * from Products;


//Task1//


--1. Write a query to retrieve all records from the Customers table..
Select* from Customers

--2. Write a query to retrieve the names and email addresses of customers whose names start with 'J'.
select * from customers
where Name like 'J%'

--3. Write a query to retrieve the order details (OrderID, ProductName,Quantity) for all orders..
Select OrderID,ProductName,Quantity from Orders

--4.Write a query to calculate the total quantity of products ordered.
Select sum(Quantity) as Total_Quantity from Orders

--5. Write a query to retrieve the names of customers who have placed an order.
Select * from orders
select * from customers
Select * from Products
Select c.Name
from Orders o join Customers c
on o.CustomerID =c.CustomerID
group by c.Name

--6. Write a query to retrieve the products with a price greater than $10.00.
Select ProductName from Products
where Price>10.00

--7. Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.
select c.Name,o.OrderDate
from Customers c join orders o
on c.CustomerID=o.CustomerID
where o.OrderDate>'2023-07-05'

--8. Write a query to calculate the average price of all products.
select avg(Price)as Average_Price,ProductName from Products
group by ProductName

--9. Write a query to retrieve the customer names along with the total quantity of products they have ordered.

select c.name, count(o.Quantity) as Total_Quantity 
from Customers c join Orders o
on c.CustomerID=o.CustomerID
group by c.name

--10. Write a query to retrieve the products that have not been ordered.
select p.productID, p.productName from Products p
left join Orders o
on p.ProductName=o.ProductName
where o.ProductName is null;

--by using not exist
select productName,ProductID
from Products
where ProductName not in (select distinct ProductName from Orders)

--Name of customer who have not placed an order.
select name,CustomerID
from Customers
where CustomerID not in(select distinct CustomerID from Orders)

//Task 2//

--1.Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.

select top 5 c.name,sum(o.Quantity) as TotalQuantity from Customers c
join Orders o
on c.CustomerID=o.CustomerID
group by c.Name
order by TotalQuantity desc

use customers_orders_products
select * from Customers
select * from Orders
select * from Products

--2.Write a query to calculate the average price of products for each product category.
select p.ProductName,AVG(p.Price) as Average_Price
from Products p 
--left join Orders o
--on p.ProductID=o.CustomerID
group by p.ProductName
order by Average_Price desc


--3. Write a query to retrieve the customers who have not placed any orders.
select c.name,c.customerid
from Customers c
left join orders o
on c.CustomerID=o.CustomerID
where o.OrderID is null;

--by using not in
select c.name,c.customerid
from Customers c
left join orders o
on c.CustomerID=o.CustomerID
where c.CustomerID not in (select o.CustomerID from orders o)

--4.Retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M':
select c.Name,o.orderID,o.ProductName,o.Quantity
from Orders o
join Customers c
on o.CustomerID=c.CustomerID
where c.name like 'M%'

--5.Calculate the total revenue generated from all orders:
select sum(o.Quantity * p.Price) as Total_Revenue
from orders o
join products p
on o.customerID=p.productID

--6.Retrieve the customer names along with the total revenue generated from their orders:
select c.name,sum(o.Quantity * p.Price) as Total_Revenue
from Customers c
inner join orders o
on c.CustomerID=o.CustomerID
inner join Products p
on c.CustomerID=p.ProductID
group by c.Name

--7.Retrieve the customers who have placed at least one order for each product category:
select o.productName,c.name
from Orders o
inner join Customers c
on c.CustomerID=o.CustomerID

--8.Retrieve the customers who have placed orders on consecutive days:

WITH OrderHistory AS (
    SELECT 
        CustomerID, 
        OrderDate, 
        LAG(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS PrevOrderDate
    FROM Orders
)
SELECT DISTINCT o.CustomerID, c.Name
FROM OrderHistory o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE DATEDIFF(DAY,o.OrderDate, o.PrevOrderDate) = 1;

WITH OrderHis as (
     select
	 c.CustomerID,
	 o.OrderDAte,
	 lag(o.OrderDate) over(partition by c.CustomerID  order by o.OrderDate) as Previous_Date
	 from Customers c join Orders o
	 on c.CustomerID=o.CustomerID
)
Select distinct o.customerID,c.Name
from OrderHis o
join Customers c on o.customerID =c.CustomerID
Where DATEDIFF(DAY,o.OrderDate,o.Previous_Date)=2;
	

--9.Retrieve the top 3 products with the highest average quantity ordered:
Select top 3 p.ProductName,avg(o.Quantity) as Average_Quantity
from Products p
join Orders o
on p.ProductID=o.CustomerID
group by p.ProductName
order by Average_Quantity desc

--10.Calculate the percentage of orders that have a quantity greater than the average quantity:select      count(case when Quantity> (select avg(Quantity) from Orders )Then 1 end)* 100.0/count(*) as Greater_Average_Quantityfrom OrdersSelect Quantity from Orderswhere Quantity <(select MAX(Quantity) from orders)select top 2 Quantity from Ordersorder by Quantity descselect max(Quantity) as Second_Highest from Orderswhere Quantity< (select max(Quantity) from Orders)