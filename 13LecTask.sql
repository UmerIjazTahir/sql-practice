Create Database CompanyPrac1;
Use CompanyPrac1;

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

Insert Into Departments Values 
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing'),
(5,'Sales');

Insert Into Employees Values 
(101,'Ali',50000,2000,1,'2023-01-10'),
(102,'Ahmed',60000,NULL,2,'2022-05-14'),
(103,'Sara',45000,1500,3,'2021-03-22'),
(104,'Usman',70000,NULL,1,'2020-11-01'),
(105,'Hina',52000,1000,4,'2023-02-18'),
(106,'Bilal',48000,NULL,5,'2021-07-09'),
(107,'Ayesha',65000,2500,1,'2019-09-12'),
(108,'Zain',55000,NULL,3,'2022-12-30'),
(109,'Fatima',47000,1200,2,'2023-04-16'),
(110,'Hamza',72000,NULL,4,'2020-06-25');

Select * From Employees;

Select * From Departments;

Select * From Trainees;

Insert Into Trainees
Select EmpID, Name, Salary, Bonus, DeptID, JoinDate
From Employees
Where Salary >= 50000;

Insert Into Trainees
Select EmpID, Name, Salary, Bonus, DeptID, JoinDate
From Employees
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
When Bonus IS NULL Then 'No Bonus'
Else 'Bonus'
End As HaveBonus
From Employees;

Select Name, Salary,
Case 
When Salary < 50000 Then Salary + 50000
Else Salary + 20000
End As UpdatedSalary
From Employees;

Select Name, Salary, ISNULL(Bonus,0) As Bonus
From Employees;

Select Name, Salary + ISNULL(Bonus,0) As TotalIncome
From Employees;

Select Name, COALESCE(Bonus,0) As Bonus
From Employees;

Select Name, NULLIF(Bonus,0) As Bonus
From Employees;

Create Procedure ShowEmployees
As
Begin
    Select * From Employees;
End;

Exec ShowEmployees;

Create Procedure HighSalaryEmployees
As
Begin
    Select * From Employees
    Where Salary > 60000;
End;

Exec HighSalaryEmployees;

Create Procedure AddEmployees
@EmpID int,
@Name varchar(50),
@Salary int,
@Bonus int,
@DeptID int,
@JoinDate date
As
Begin
    Insert Into Employees
    Values (@EmpID, @Name, @Salary, @Bonus, @DeptID, @JoinDate);
End;

Exec AddEmployees 111,'Hassan',55000,4500,2,'2023-02-12';

Create Procedure GetEmployeesByDept
@DeptID int
As
Begin
    Select *
    From Employees
    Where DeptID = @DeptID
End;

Exec GetEmployeesByDept 1;

Alter Procedure ShowEmployees
As
Begin
    Select Name, Salary
    From Employees
End;

Drop Procedure ShowEmployees;

Create Procedure ShowTrainers
As
Begin
Select * from Trainees;
End;

Exec ShowTrainers;


Create Procedure SalaryGreaterThen60000
As 
Begin
Select * from Employees
Where Salary > 60000;

End;

Exec SalaryGreaterThen60000;

Create Procedure EmployeesByDeptID
@DeptID int
As
Begin
Select * from Employees
Where DeptID = @DeptID;

End;

Exec EmployeesByDeptID 1;



Create Function GetBonus(@Salary int)
Returns int
As
Begin
    Return (@Salary * 10 / 100)
End;

Select Name, Salary, dbo.GetBonus(Salary) As Bonus
From Employees;


Create Function SalaryCategory(@Salary int)
Returns varchar(20)
As
Begin
    Declare @Result varchar(20)

    If @Salary >= 60000
        Set @Result = 'High'
    Else If @Salary >= 50000
        Set @Result = 'Medium'
    Else
        Set @Result = 'Low'

    Return @Result
End;

Select Name, Salary, dbo.SalaryCategory(Salary) As Category
From Employees;

Create Function GetNetSalary(@Salary int, @Bonus int)
Returns int
As
Begin
    Return (@Salary + ISNULL(@Bonus,0))
End;

Select Name, Salary, Bonus, dbo.GetNetSalary(Salary, Bonus) As NetSalary
From Employees;

Create Function BonusStatus(@Bonus int)
Returns varchar(20)
As
Begin
    Declare @Result varchar(20)

    If @Bonus Is Null
        Set @Result = 'No Bonus'
    Else
        Set @Result = 'Bonus Available'

    Return @Result
End;

Select Name, Bonus, dbo.BonusStatus(Bonus) As Status
From Employees;

Create Function GetDeptName(@DeptID int)
Returns varchar(20)
As
Begin
    Declare @Dept varchar(20)

    If @DeptID = 1
        Set @Dept = 'IT'
    Else If @DeptID = 2
        Set @Dept = 'HR'
    Else If @DeptID = 3
        Set @Dept = 'Finance'
    Else
        Set @Dept = 'Other'

    Return @Dept
End;

Select Name, DeptID, dbo.GetDeptName(DeptID) As Department
From Employees;


Create Function SalaryAfterIncrement(@Salary int)
Returns int
As
Begin
    Return (@Salary + 5000)
End;

Select Name, Salary, dbo.SalaryAfterIncrement(Salary) As UpdatedSalary
From Employees;


Create Trigger BackupEmployee
On Employees
After Insert
As
Begin
    Insert Into EmployeeBackup
    Select * From Inserted
End;

Insert Into Employees
Values (11,'Bilal',48000,NULL,2,'2024-02-12');

Select * From EmployeeBackup;
