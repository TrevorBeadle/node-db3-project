-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT 
    p.ProductName AS 'Product Name',
    c.CategoryName AS 'Category'
FROM Product AS p
JOIN Category AS c
    ON p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT 
    o.id AS 'Order ID',
    s.companyname AS 'Shipper'
FROM [Order] AS o
JOIN Shipper AS s
    ON o.ShipVia = s.id
WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT 
    o.id AS 'Order ID',
    p.ProductName AS 'Product Name',
    p.QuantityPerUnit AS 'Quantity'     
FROM OrderDetail AS od
JOIN Product AS p
    ON od.ProductId = p.id
JOIN [Order] AS 
    ON od.OrderId = o.id
WHERE od.OrderId = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT 
    o.id AS 'Order ID',
    c.CompanyName AS 'Customer Company Name',
    e.LastName AS 'Last Name'
FROM [Order] AS o
JOIN Customer AS c
    ON o.CustomerId = c.Id
JOIN Employee AS e
    ON o.EmployeeId = e.Id;