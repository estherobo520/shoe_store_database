DROP DATABASE onlineShoeStore;

CREATE DATABASE onlineShoeStore;

USE onlineShoeStore;

DROP TABLE IF EXISTS Transaction_Returns;
DROP TABLE IF EXISTS ShoppingCart_Shoes;
DROP TABLE IF EXISTS Transaction_Shoe;
DROP TABLE IF EXISTS Transaction;
DROP TABLE IF EXISTS Returns;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Shoe_Description;
DROP TABLE IF EXISTS CreditCard;
DROP TABLE IF EXISTS ShoppingCart;
DROP TABLE IF EXISTS Shoes;
DROP TABLE IF EXISTS Catagory;
DROP TABLE IF EXISTS BrandName;
DROP TABLE IF EXISTS Size;
DROP TABLE IF EXISTS Color;
DROP TABLE IF EXISTS Store;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Shoes (
shoe_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
product VARCHAR(255),
price INT UNSIGNED NOT NULL,
INDEX (product),
PRIMARY KEY (shoe_id)
) ENGINE = InnoDB;

CREATE TABLE Catagory (
catagory_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
description VARCHAR(255),
INDEX (description),
PRIMARY KEY (catagory_id)
) ENGINE = InnoDB;

CREATE TABLE BrandName (
brandName_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
description VARCHAR(255),
INDEX (description),
PRIMARY KEY (brandName_id)
) ENGINE = InnoDB;

CREATE TABLE Size (
size_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
description VARCHAR(255),
INDEX (description),
PRIMARY KEY (size_id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Color;
CREATE TABLE Color (
color_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
description VARCHAR(255),
INDEX (description),
PRIMARY KEY (color_id)
) ENGINE = InnoDB;

CREATE TABLE ShoppingCart (
shoppingCart_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
quantity INT UNSIGNED NOT NULL,
customer_id INT UNSIGNED NOT NULL,
totalItems INT UNSIGNED NOT NULL,
PRIMARY KEY (shoppingCart_id)
) ENGINE = InnoDB;

CREATE TABLE ShoppingCart_Shoes (
shoe_id INT UNSIGNED NOT NULL,
shoppingCart_id INT UNSIGNED NOT NULL,
UNIQUE INDEX (shoe_id, shoppingCart_id)
) ENGINE = InnoDB;

CREATE TABLE Store (
store_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(255),
address VARCHAR(255),
city VARCHAR(255),
state VARCHAR(255),
INDEX (name, city),
PRIMARY KEY (store_id)
) ENGINE = InnoDB;

CREATE TABLE Customer (
customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(255),
shippingAddress VARCHAR(255),
creditCard VARCHAR(255),
phoneNumber INT UNSIGNED,
INDEX(name),
PRIMARY KEY (customer_id)
) ENGINE = InnoDB;

CREATE TABLE CreditCard (
card_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
customer_id INT UNSIGNED NOT NULL,
creditCardName VARCHAR(255),
PRIMARY KEY (card_id)
) ENGINE = InnoDB;

CREATE TABLE Shoe_Description (
description_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
shoe_id INT UNSIGNED NOT NULL,
catagory_id INT UNSIGNED NOT NULL,
color_id INT UNSIGNED NOT NULL,
size_id INT UNSIGNED NOT NULL,
brandName_id INT UNSIGNED NOT NULL,
PRIMARY KEY (description_id)
) ENGINE = InnoDB;

CREATE TABLE Transaction (
transaction_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
saleDate Date,
transactionTotal INT UNSIGNED NOT NULL,
totalItems INT UNSIGNED NOT NULL,
customer_id INT UNSIGNED NOT NULL,
PRIMARY KEY (transaction_id)
) ENGINE = InnoDB;

CREATE TABLE Transaction_Shoe (
transaction_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
shoe_id INT UNSIGNED NOT NULL,
UNIQUE INDEX (transaction_id, shoe_id)
) ENGINE = InnoDB;

CREATE TABLE Inventory (
shoe_id INT UNSIGNED NOT NULL,
numberInStock INT UNSIGNED NOT NULL,
numberSold INT UNSIGNED NOT NULL,
numberReturned INT UNSIGNED NOT NULL,
UNIQUE INDEX (shoe_id)
) ENGINE = InnoDB;

CREATE TABLE Returns (
return_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
returnDate Date,
PRIMARY KEY (return_id)
) ENGINE = InnoDB;

CREATE TABLE Transaction_Returns (
transaction_id INT UNSIGNED NOT NULL,
shoe_id INT UNSIGNED NOT NULL,
return_id INT UNSIGNED NOT NULL,
UNIQUE INDEX (transaction_id, shoe_id, return_id)
) ENGINE = InnoDB;


ALTER TABLE ShoppingCart_Shoes ADD FOREIGN KEY (shoe_id)
REFERENCES Shoes (shoe_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ShoppingCart_Shoes ADD FOREIGN KEY (shoppingCart_id)
REFERENCES ShoppingCart (shoppingCart_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ShoppingCart ADD FOREIGN KEY (customer_id)
REFERENCES Customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE CreditCard ADD FOREIGN KEY (customer_id)
REFERENCES Customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Transaction ADD FOREIGN KEY (customer_id)
REFERENCES Customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Transaction_Shoe ADD FOREIGN KEY (shoe_id)
REFERENCES Shoes (shoe_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Transaction_Shoe ADD FOREIGN KEY (transaction_id)
REFERENCES Transaction (transaction_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Inventory ADD FOREIGN KEY (shoe_id)
REFERENCES Shoes (shoe_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Transaction_Returns ADD FOREIGN KEY (return_id)
REFERENCES Returns (return_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Transaction_Returns ADD FOREIGN KEY (transaction_id)
REFERENCES Transaction (transaction_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Transaction_Returns ADD FOREIGN KEY (shoe_id)
REFERENCES Shoes (shoe_id) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO Customer (name)
VALUES ('Brian Julien'),
('Amanda Orange');

INSERT INTO  Store (address, city, state)
VALUES ('12354 Peterson Ave',	'Chicago',	'IL'),
('96817 Broadway Ave',	'Portland',	'OR'),
('54281 Houston St',	'New York', 'NY');



INSERT INTO Color (description)
VALUES ('Blue'), ('Black'), ('Brown'), ('Tan'), ('Red'), ('Green'), ('Burgundy');

INSERT INTO Size (description)
VALUES ('6'), ('6.5'), ('7'), ('7.5'), ('8'), ('8.5'), ('9'),
('9.5'), ('10'), ('10.5'), ('11'), ('11.5'), ('12'), ('13'), ('15');


INSERT INTO BrandName (brandName_id, description)
VALUES (1, 'SOREL'),
(2, 'LINEA Paolo'),
(3, 'J/Slides'),
(4, 'Sesto Meucci'),
(5, 'Dolce Vita'),
(6, 'Michael Kors'),
(7, 'Steve Madden'),
(8, 'Keen'),
(9, 'Keen Utility');


INSERT INTO Shoes (shoe_id, product, price, brandName_id)
VALUES (1, "Out 'N About™ Puffy Lace", 139.95),
(2, "Out 'N About™ Puffy", 139.95),
(3, 'Foxie', 129.95),
(4, 'Pegah', 298.95),
(5, 'Trudie', 146.95),
(6, 'Keeley Trainer', 87.94),
(7, 'Philosophy Sneaker', 81.95),
(8, '"The Rocker" II Foxie', 129.95),
(9, 'Elena Mid', 129.95),
(10, '"The Slater" II', 169.95),
(11, 'Seattle Romeo Aluminum Toe', 139.95),
(12, 'Terradora Ankle Waterproof', 97.99),
(13, 'Terradora Lace Boot Waterproof', 119.99);


INSERT INTO Shoe_Description (brandName_id, shoe_id)
VALUES (1, 2), (8, 8), (8, 12), (8, 9), (7, 7), (8, 9);


INSERT INTO Inventory (shoe_id, numberSold, numberInStock, numberReturned)
VALUES (2, 1, 55, 0), (8, 1, 80, 0), (12, 1, 14, 0), (9, 2, 41, 0), (7, 1, 47, 1);

INSERT INTO Returns (return_id, returnDate)
VALUES (1, '11-05-2019');

INSERT INTO Transaction (transaction_id, saleDate, transactionTotal, totalItems, customer_id)
VALUES (1, '11-01-2019', 367.89, 3, 1), (2, '11-02-2019', 129.95, 1, 1), (3, '11-05-2019', 211.90, 2, 2);

INSERT INTO Transaction_Shoe (transaction_id, shoe_id)
VALUES (1, 2), (1, 8), (1, 12), (2, 9), (3, 7), (3, 9);

INSERT INTO Transaction_Returns (return_id, transaction_id, shoe_id)
VALUES (1, 1, 3);

--1
SELECT
ts.transaction_id,
ts.shoe_id, s.product AS Shoe_Name, tr.return_id
FROM
Transaction as t,
Transaction_Shoe as ts,
Shoes as s,
Returns as r,
Transaction_Returns as tr
WHERE
t.transaction_id = ts.transaction_id and ts.shoe_id = s.shoe_id
 and r.return_id = tr.return_id

--2
 SELECT b.brandName_id, b.description AS Brand_Name, s.shoe_id, s.product AS Shoe_Name
 FROM
 Shoes as s,
 BrandName as b,
 Shoe_Description as sd
 WHERE
 b.brandName_id = 1 and
 sd.shoe_id = s.shoe_id and sd.brandName_id = b.brandName_id

 --3

 SELECT t.transaction_id,
 s.shoe_id, s.product AS Shoe_Name
 FROM
 Transaction as t,
 Transaction_Shoe as ts,
 Shoes as s,
 Returns as r,
 Transaction_Returns as tr
 WHERE
 ts.transaction_id = ts.transaction_id and ts.shoe_id = s.shoe_id and
 tr.shoe_id != s.shoe_id
