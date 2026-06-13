CREATE DATABASE PRACT2;

USE PRACT2;


CREATE TABLE Hospital (
    HospitalID INT PRIMARY KEY,
    HospitalName VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Medicine (
    MedicineID INT PRIMARY KEY,
    MedicineName VARCHAR(100)
);

CREATE TABLE Availability (
    AvailabilityID INT PRIMARY KEY,
    HospitalID INT,
    MedicineID INT,
    Status VARCHAR(30),
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID),
    FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID)
);
INSERT INTO Hospital VALUES
(1, 'Civil Hospital', 'Lahore'),
(2, 'Jinnah Hospital', 'Karachi'),
(3, 'PIMS', 'Islamabad');

INSERT INTO Medicine VALUES
(1, 'Paracetamol'),
(2, 'Ibuprofen'),
(3, 'Amoxicillin');

INSERT INTO Availability VALUES
(1, 1, 1, 'Available'),
(2, 1, 2, 'Out of Stock'),
(3, 2, 1, 'Available'),
(4, 2, 3, 'Out of Stock'),
(5, 3, 2, 'Available'),
(6, 3, 3, 'Available');

SELECT *
FROM Availability
WHERE Status = 'Available';

SELECT HospitalID, MedicineID
FROM Availability
WHERE Status = 'Out of Stock';

SELECT AvailabilityID, Status
FROM Availability
WHERE (HospitalID = 1 OR HospitalID = 3)
AND Status = 'Available';

UPDATE Availability
SET Status = 'Available'
WHERE MedicineID = 2 AND Status = 'Out of Stock';

UPDATE Availability
SET HospitalID = 3,
    MedicineID = 1
WHERE AvailabilityID = 4;
