create database Property_Deal;
use Property_Deal;

-- Users
CREATE TABLE Users (
    email VARCHAR(50) PRIMARY KEY,
    fullName VARCHAR(50) NOT NULL CHECK (fullName REGEXP '^[a-zA-Z ]+$'),
    phone VARCHAR(13) CHECK (phone IS NULL
        OR phone REGEXP '^00937[0-9]{8}$'),
    city VARCHAR(100) NOT NULL,
    district VARCHAR(100),
    street VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX (fullName)
);

-- Categories
CREATE TABLE Categories (
    name VARCHAR(100) PRIMARY KEY,
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Properties
CREATE TABLE Properties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50) NOT NULL,
    owner VARCHAR(100) NOT NULL,
    price DECIMAL(10 , 2 ) NOT NULL CHECK (price >= 0),
    imageURL TEXT NOT NULL,
    FOREIGN KEY (category)
        REFERENCES Categories (name),
    FOREIGN KEY (owner)
        REFERENCES Users (email),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Offers
CREATE TABLE Offers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    property INT NOT NULL,
    user VARCHAR(100) NOT NULL,
    amount DECIMAL(10 , 2 ) NOT NULL CHECK (amount >= 0),
    FOREIGN KEY (property)
        REFERENCES Properties (id),
    FOREIGN KEY (user)
        REFERENCES Users (email),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Deals
CREATE TABLE Deals (
    property INT PRIMARY KEY,
    date DATE NOT NULL,
    amount DECIMAL(10 , 2 ) CHECK (amount >= 10),
    FOREIGN KEY (property)
        REFERENCES Properties (id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Payments
CREATE TABLE Payments (
    deal INT PRIMARY KEY,
    amount DECIMAL(10 , 2 ) NOT NULL,
    FOREIGN KEY (deal)
        REFERENCES Deals (property),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Trigger for Calculating Amount of Payment After each Deal
DELIMITER $$
CREATE TRIGGER set_payment_amount
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    DECLARE deal_amount DECIMAL(10,2);
    SELECT amount INTO deal_amount FROM Deals WHERE property = NEW.deal;
    IF deal_amount * 0.10 < 10 THEN
        SET NEW.amount = 10;
    ELSE
        SET NEW.amount = deal_amount * 0.10;
    END IF;
END$$
DELIMITER ;
