Create Database CP;
Use CP;

Create Table Departments
(
DeptID int Primary Key,
DeptName varchar(50)
);

Create Table Employees
(
EmpID int Primary Key,
Name varchar(50),
Salary int,
DeptID int
);

Insert Into Departments Values
(1,'HR'),
(2,'IT'),
(3,'Finance');

Insert Into Employees Values
(101,'Ali',50000,1),
(102,'Ahmed',60000,2),
(103,'Sara',55000,3),
(104,'Usman',65000,2);

Select * From Departments;
Select * From Employees;

Alter Table Employees
Add Age int;

Update Employees
Set Age = 25
Where EmpID = 101;

Update Employees
Set Age = 28
Where EmpID = 102;

Update Employees
Set Age = 30
Where EmpID = 103;

Update Employees
Set Age = 27
Where EmpID = 104;

Select * From Employees;

Alter Table Employees
Add Email varchar(100);

Update Employees
Set Email='ali@gmail.com'
Where EmpID=101;

Update Employees
Set Email='ahmed@gmail.com'
Where EmpID=102;

Update Employees
Set Email='sara@gmail.com'
Where EmpID=103;

Update Employees
Set Email='usman@gmail.com'
Where EmpID=104;

Select * From Employees;

Alter Table Employees
Drop Column Age;

Select * From Employees;

Exec sp_rename 'Employees','Staff';

Select * From Staff;

Delete From Staff
Where EmpID=104;

Select * From Staff;

Truncate Table Staff;

Select * From Staff;

Drop Table Staff;

Drop Table Departments;