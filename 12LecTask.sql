Create Database QUERIES;
Use QUERIES;

Create Table Students (
    student_id int Primary Key,
    name varchar(50),
    dept_id int
);

Create Table Departments (
    dept_id int Primary Key,
    dept_name varchar(50)
);

Create Table Courses (
    course_id int Primary Key,
    dept_id int,
    course varchar(50)
);

Insert Into Students Values (1, 'Ali', 101);
Insert Into Students Values (2, 'Ahmed', 102);
Insert Into Students Values (3, 'Sara', 101);
Insert Into Students Values (4, 'Zain', 104);

Insert Into Departments Values (101, 'CS');
Insert Into Departments Values (102, 'IT');
Insert Into Departments Values (103, 'SE');

Insert Into Courses Values (1, 101, 'Database');
Insert Into Courses Values (2, 101, 'Programming');
Insert Into Courses Values (3, 102, 'Networking');
Insert Into Courses Values (4, 103, 'AI');

Select Students.name, Departments.dept_name
From Students
Inner Join Departments
On Students.dept_id = Departments.dept_id;

Select Students.name, Departments.dept_name
From Students
Left Join Departments
On Students.dept_id = Departments.dept_id;

Select Students.name, Departments.dept_name
From Students
Right Join Departments
On Students.dept_id = Departments.dept_id;

Select Students.name, Departments.dept_name
From Students
Full Join Departments
On Students.dept_id = Departments.dept_id;

Select Students.name, Departments.dept_name, Courses.course
From Students
Inner Join Departments
On Students.dept_id = Departments.dept_id
Inner Join Courses
On Departments.dept_id = Courses.dept_id;

Select name From Students
Union
Select dept_name From Departments;

Select name From Students
Union All
Select dept_name From Departments;

Select dept_id, Count(*) as total_students
From Students
Group By dept_id;

Select dept_id, Count(*) as total_students
From Students
Group By dept_id
Having Count(*) > 1;

Select name
From Students s
Where Exists (
    Select *
    From Departments d
    Where s.dept_id = d.dept_id
);

Select name
From Students
Where dept_id = Any (
    Select dept_id
    From Departments
);

Select name
From Students
Where dept_id > All (
    Select dept_id
    From Departments
    Where dept_id < 103
);