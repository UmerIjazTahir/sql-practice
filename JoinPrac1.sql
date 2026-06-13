Create Database JoinPrac;
Use JoinPrac;

Create table Students (
    student_id int primary key,
    student_name varchar(50)
);
Create table Courses (
    course_id int primary key,
    course_name varchar(50),
    student_id int,
    foreign key (student_id) references Students(student_id)
);
Insert into Students values (100, 'Ayesha');
Insert into Students values (200, 'Zain');
Insert into Students values (300, 'Hamza');

Insert into Courses values (301, 'Programming', 100);
Insert into Courses values (302, 'Database', 200);
Insert into Courses values (303, 'AI', 400);
Insert into Courses values (304, 'Networking', 200);

Select Students.student_name, Courses.course_name
From Students Full join Courses
On Students.student_id = Courses.student_id;