 CREATE DATABASE ERD_practice3;

 use ERD_practice3;

 CREATE TABLE Department( DeptID int Primary key, 
                          DeptName varchar(50) );

 CREATE TABLE Employee( EmpID int Primary key,
                        EmpName varchar(50),
                        DeptID int,
                        Foreign key(DeptID) References Department(DeptID) );

                        Select * From Department;
                        Select * From Employee;
