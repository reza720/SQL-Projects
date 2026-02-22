create database Maternity_Hospital;
use Maternity_Hospital;

--====================
-- Staffs Table
--====================
CREATE TABLE Staffs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    role ENUM('Doctor', 'Nurse', 'Helper') NOT NULL,
    status ENUM('Active', 'Inactive', 'On Break') NOT NULL DEFAULT 'Active',
    INDEX idx_name (name)
);

--====================
-- Patients Table
--====================
CREATE TABLE Patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    address TEXT,
    phone VARCHAR(20) NOT NULL,
    INDEX idx_name (name)
);

--====================
-- Childbirths Table
--====================
CREATE TABLE Childbirths (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dateTime DATETIME NOT NULL,
    patient_id INT NOT NULL,
    status ENUM('Natural', 'Surgical') NOT NULL DEFAULT 'Natural',
    FOREIGN KEY (patient_id)
        REFERENCES Patients (id)
);

--====================
-- Childbirth_Staffs Table
--====================
CREATE TABLE Childbirth_Staffs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    childbirth_id INT NOT NULL,
    staff_id INT NOT NULL,
    FOREIGN KEY (childbirth_id)
        REFERENCES Childbirths (id),
    FOREIGN KEY (staff_id)
        REFERENCES Staffs (id)
);

--====================
-- Newborn_Babies Table
--====================
CREATE TABLE Newborn_Babies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    childbirth_id INT NOT NULL,
    status ENUM('Healthy', 'Sick', 'Deceased') NOT NULL DEFAULT 'Healthy',
    FOREIGN KEY (childbirth_id)
        REFERENCES Childbirths (id)
);

--====================
-- Prescriptions Table
--====================
CREATE TABLE Prescriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NULL,
    newborn_baby_id INT NULL,
    imageURL TEXT NOT NULL,
    FOREIGN KEY (patient_id)
        REFERENCES Patients (id),
    FOREIGN KEY (newborn_baby_id)
        REFERENCES Newborn_Babies (id)
);

--====================
-- Payments Table
--====================
CREATE TABLE Payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prescription_id INT NULL,
    childbirths_id INT NULL,
    amount DECIMAL(10 , 2 ) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (prescription_id)
        REFERENCES Prescriptions (id),
    FOREIGN KEY (childbirths_id)
        REFERENCES Childbirths (id)
);