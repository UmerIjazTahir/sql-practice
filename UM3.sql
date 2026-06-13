Create Database ForCustomer1;

Use ForCustomer1;

Create Table Customer (
    CustomerID Int Primary Key,
    Name Varchar(50),
    City Varchar(50)
);

Create Table Transactions (
    TransactionID Int Primary Key,
    CustomerID Int,
    Amount Int,
    TransactionDate Date,
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);
Insert Into Customer Values
(1,'Ali','Lahore'),
(2,'Sara','Karachi'),
(3,'Ahmed','Islamabad'),
(4,'Hina','Lahore'),
(5,'Salman',NULL),
(6,'Adeel','Karachi'),
(7,'Amna','Islamabad');

Insert Into Transactions Values
(1,1,5000,'2026-02-01'),
(2,2,7000,'2026-02-05'),
(3,3,3000,'2026-02-03'),
(4,4,9000,'2026-02-10'),
(5,5,1000,'2026-02-12'),
(6,6,4500,'2026-02-15'),
(7,7,8000,'2026-02-18');
Select Top 3 Amount As TopTransaction, CustomerID
From Transactions
Order By Amount Desc;

Select Top 1 Amount As LowestTransaction, CustomerID
From Transactions
Order By Amount Asc;

Select CustomerID, Sum(Amount) As TotalSpent
From Transactions
Group By CustomerID;

Select Avg(Amount) As AverageTransaction
From Transactions;

Select Max(Amount) As HighestTransaction
From Transactions;

Select Min(Amount) As LowestTransaction
From Transactions;

Select Count(*) As CustomersWithHighAmount
From Transactions
Where Amount > 5000;

Select * From Customer
Where Name Like 'A%' And City Is Not Null;

Select TransactionID, Amount
From Transactions
Where Amount Between 3000 And 8000
Order By Amount Desc;

Select Sum(Amount) As TotalSales
From Transactions
Where TransactionDate Between '2026-02-01' And '2026-02-15';
