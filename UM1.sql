Create Database CompanyDB1;
Use CompanyDB1;

Create Table Employee (
    EmpID Int Primary Key,
    Name Varchar(50),
    Department Varchar(20),
    City Varchar(50),
    Experience Int
);

Create Table Salary (
    EmpID Int,
    BasicSalary Int,
    Bonus Int,
    FOREIGN KEY(EmpID) REFERENCES Employee(EmpID)
);
Insert Into Employee Values
(1,'Ali','HR','Lahore',3),
(2,'Sara','IT','Karachi',5),
(3,'Ahmed','Finance',NULL,2),
(4,'Hina','IT','Lahore',4),
(5,'Salman','HR','Islamabad',6),
(6,'Adeel','Finance','Karachi',1),
(7,'Amna','IT','Lahore',3),
(8,'Sana','HR',NULL,5);

Insert Into Salary Values
(1,50000,5000),
(2,80000,8000),
(3,45000,2000),
(4,75000,7000),
(5,90000,10000),
(6,40000,1000),
(7,72000,6000),
(8,60000,4000);
Select Top 3 BasicSalary As TopSalary, EmpID
From Salary
Order By BasicSalary Desc;

Select Top 2 BasicSalary As LowestSalary, EmpID
From Salary
Order By BasicSalary Asc;

Select EmpID, BasicSalary + Bonus As TotalCompensation
From Salary
Where BasicSalary > 60000
Order By TotalCompensation Desc;

Select Avg(BasicSalary) As AverageSalary
From Salary;

Select Max(BasicSalary) As HighestSalary
From Salary;

Select Min(BasicSalary) As LowestSalary
From Salary;

Select Count(*) As EmployeesWithBonus
From Salary
Where Bonus > 5000;

Select EmployeeID, BasicSalary + Bonus As TotalPay
From Salary
Where Bonus Between 2000 And 8000;

Select * From Employee
Where Name Like 'A%' And Experience Between 2 And 5;

Select Count(*) As ITCount
From Employee
Where Department = 'IT' And City Is Not Null;
