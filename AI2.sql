CREATE DATABASE ENROLLMENT;
USE ENROLLMENT;
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Department VARCHAR(20)
);

CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    Marks INT,
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Course(CourseID)
);
INSERT INTO Course VALUES
(101,'Programming','CS'),
(102,'Database','CS'),
(103,'Networking','IT'),
(104,'Electronics','EE');

INSERT INTO Enrollment VALUES
(1,101,85),
(2,103,72),
(3,104,90),
(4,101,60),
(5,103,88),
(6,104,45),
(7,102,95),
(8,103,55),
(9,101,78),
(10,104,66);

Select StudentID, Sum(Marks) As TotalMarks
From Enrollment
Group By StudentID;

Select CourseID, Avg(Marks) As AverageMarks
From Enrollment
Group By CourseID;

Select CourseID, Max(Marks) As MaxMarks
From Enrollment
Group By CourseID;

Select CourseID, Min(Marks) As MinMarks
From Enrollment
Group By CourseID;

Select Count(*) As TotalCS
From Enrollment
Where CourseID In (101,102);

Select StudentID, Marks
From Enrollment
Where Marks > 80
Order By Marks Desc;

Select StudentID, Marks
From Enrollment
Where Marks Between 60 And 90;

Select Top 2 StudentID, Marks
From Enrollment
Where CourseID = 101
Order By Marks Desc;

Select StudentID, Marks
From Enrollment
Where StudentID Like '1%';

Select Avg(Marks) As ITAverage
From Enrollment
Where CourseID In (103);
