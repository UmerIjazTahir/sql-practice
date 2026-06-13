create database ERD_practice;

use ERD_practice;

CREATE TABLE Student ( StudentID int Primary key, Name varchar(50), Email varchar(50) );

CREATE TABLE Course ( CourseID int Primary key, CourseName varchar(50) );

CREATE TABLE Enrollment ( EnrollID int Primary key, 
                          StudentID int,
                          CourseID int,
                          Foreign key (StudentID) References Student(StudentID),
                          Foreign key (CourseID) References Course(CourseID) );

            Select * from Student