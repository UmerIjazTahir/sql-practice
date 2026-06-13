Create Database Product1;

Use Product1;

Create Table Product (
    ProductID Int Primary Key,
    ProductName Varchar(50),
    Category Varchar(20),
    Price Int
);

Create Table Orders (
    OrderID Int Primary Key,
    ProductID Int,
    Quantity Int,
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);
Insert Into Product Values
(101,'Laptop','Electronics',80000),
(102,'Keyboard','Electronics',2000),
(103,'Chair','Furniture',5000),
(104,'Table','Furniture',10000),
(105,'Monitor','Electronics',15000);

Insert Into Orders Values
(1,101,2),
(2,102,5),
(3,103,10),
(4,104,3),
(5,105,4),
(6,101,1),
(7,104,2),
(8,102,3);
Select Top 3 Price As TopPrice, ProductName
From Product
Order By Price Desc;

Select Top 1 Price As LowestPrice, ProductName
From Product
Order By Price Asc;

Select ProductID, Price * Quantity As TotalAmount
From Orders o
Join Product p On o.ProductID = p.ProductID
Where Quantity > 2;

Select Sum(Price * Quantity) As TotalSales
From Orders o
Join Product p On o.ProductID = p.ProductID;

Select Avg(Price) As AveragePrice
From Product
Where Category = 'Electronics';

Select Max(Price) As MaxPrice
From Product;

Select Min(Price) As MinPrice
From Product;

Select Count(*) As FurnitureCount
From Product
Where Category = 'Furniture';

Select ProductName
From Product
Where ProductName Like 'L%';

Select Top 2 ProductName, Price
From Product
Where Price Between 2000 And 15000
Order By Price Desc;
