 Create Database HospitalM;

 Use HospitalM;

 Create Table Patient(PaID Int Primary Key, 
                      PaName varchar(30),
                      PaDise varchar(30));
 Insert into Patient(PaID, PaName, PaDise) values
 (1,'Ali', 'Flu'),
 (2,'Ahmad','Headache'),
 (3,'Rehan', 'cardic Arest');

 

 Select * from Patient where PaID = 1;
 Select * from Patient where PaID > 1;
 Select *  from Patient where PaDise = 'Flu';
 Select distinct PaID from Patient;
 Select distinct PaName from Patient;

 Select * from Patient;
 

