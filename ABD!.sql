CREATE DATABASE ABD1;
USE ABD1;

CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    Title VARCHAR(50),
    Dept VARCHAR(20),
    Available BIT
);

INSERT INTO Library VALUES
(1,'Programming 101','CS',1),
(2,'DB Basics','CS',1),
(3,'Networking Fundamentals','IT',0),
(4,'Electronics Intro','EE',1),
(5,'Advanced Programming','CS',0);

Select Title, Dept
From Library
Where Available = 1;

Select Title
From Library
Where Available = 0;

Select Count(*) As TotalCS
From Library
Where Dept = 'CS';

Select Max(BookID) As MaxBook
From Library;

Select Min(BookID) As MinBook
From Library;

Select Top 2 Title
From Library
Where Available = 1;

Select Title
From Library
Where Title Like 'P%';

Select Title
From Library
Where Dept = 'IT';

Select Sum(Cast(Available As Int)) As TotalAvailable
From Library;

Select Title As BookName, Dept As Department
From Library;
