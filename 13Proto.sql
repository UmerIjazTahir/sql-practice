Create Database CompanyPrac;
Use CompanyPrac;

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
Bonus int Null,
DeptID int,
JoinDate date
);

Create Table EmployeeBackup
(
EmpID int,
Name varchar(50),
Salary int,
Bonus int,
DeptID int,
JoinDate date
);

Create Table Trainees
(
TrainerID int Primary Key,
Name varchar(50),
Salary int,
Bonus int Null,
DeptID int,
JoinDate date
);

Insert Into Departments Values (1,'IT');
Insert Into Departments Values (2,'HR');
Insert Into Departments Values (3,'Finance');
Insert Into Departments Values (4,'Marketing');
Insert Into Departments Values (5,'Sales');

Insert Into Employees Values (101,'Ali',50000,2000,1,'2023-01-10');
Insert Into Employees Values (102,'Ahmed',60000,NULL,2,'2022-05-14');
Insert Into Employees Values (103,'Sara',45000,1500,3,'2021-03-22');
Insert Into Employees Values (104,'Usman',70000,NULL,1,'2020-11-01');
Insert Into Employees Values (105,'Hina',52000,1000,4,'2023-02-18');
Insert Into Employees Values (106,'Bilal',48000,NULL,5,'2021-07-09');
Insert Into Employees Values (107,'Ayesha',65000,2500,1,'2019-09-12');
Insert Into Employees Values (108,'Zain',55000,NULL,3,'2022-12-30');
Insert Into Employees Values (109,'Fatima',47000,1200,2,'2023-04-16');
Insert Into Employees Values (110,'Hamza',72000,NULL,4,'2020-06-25');

Select * From Employees;

Delete From Employees; 

Select * From Departments;

Delete From Department;

Select * From Trainees;

Delete From Trainees;

Insert Into Trainees 
Select * from Employees 
Where Salary >= 50000;

Insert Into Trainees (TrainerID, Name, Salary, DeptID, JoinDate)
Select EmpID, Name, Salary, DeptID, JoinDate
From Employees;

Insert Into Trainees 
Select * From Employees
Where DeptID > 1;

Select Name, Salary, 
Case 
When Salary > 60000 Then 'High Salary'
When Salary > 50000 Then 'Medium Salary'
Else 'Low Salary'
End As SalaryLevel
From Employees;

Select Name, DeptID,
Case 
When Bonus is NUll Then 'No Bonus'
Else 'Bonus'
End As HaveBonus 
From EMployees;

Select Name, Salary,
Case 
When Salary < 50000 Then Salary + 50000
Else Salary + 20000

End As UpdateSalary
From Employees;


Select Name, Salary, ISNULL(Bonus,0) As Bonus
From Employees;

Select Name, Salary + ISNULL(Bonus,0) As TotalIncome
From Employees;

Select Name, Coalesce(Bonus, 0) As Bonus
From Employees;

Select Name, NULLIF(Bonus,0) As Bonus
From Employees;

Create Procedure ShowEmployees
As
Begin
    Select * From Employees
End;

Exec ShowEmployees;

Create Procedure HighSalaryEmployees
As
Begin
    Select *
    From Employees
    Where Salary > 60000
End;

Exec HighSalaryEmployees;


Create Procedure AddEmployees
@EmpID int,
@Name varchar(50),
@Salary int,
@Bonus int,
@DeptID int,
@JoinDate Date

As
Begin
    Insert Into Employees(Name, Salary, DeptID)
    Values(@Name, @Salary, @DeptID)
End;
Exec AddEmployees 1,'Hassan', 55000,4500, 2, '2023-02-12';

