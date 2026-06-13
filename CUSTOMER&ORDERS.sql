CREATE DATABASE CO1;

use CO1;

CREATE TABLE Customer ( CustomerID int Primary key, Nam varchar(30), Phone varchar(11));

CREATE TABLE Orders (OrderID int Primary key, OrderDate DATE, 
                     CustomerID int,
                     Foreign key(CustomerID) References Customer(CustomerID));

                     insert into Customer(CustomerID, Nam, Phone) values(1,'Ali','1111111');
                     insert into Customer(CustomerID, Nam, Phone) values(2,'Ahmad', '22222222');
                     insert into Customer(CustomerID, Nam, Phone) values(3,'Afzal','333333333');
                     insert into Orders(OrderID) values(234);
                        Select * From Customer;
                        Select * From Orders;
                     
                     Select * from Customer where CustomerID = 1;
                     Select * from Customer where CustomerID > 1;
                     Select * from Customer where CustomerID <3;
                     Select distinct CustomerID from Customer;
                     Select * from Customer order by CustomerID asc;
                     Select * from Customer order by CustomerID desc;
                    
                     Select distinct CustomerID from Customer;
                     Select distinct OrderID from Orders;
                     