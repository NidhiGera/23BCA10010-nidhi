CREATE TABLE Customer (
Customer_ID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(15) NOT NULL,
Address VARCHAR(255) NOT NULL
);

CREATE TABLE Restaurant (
Restaurant_ID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Type VARCHAR(50) NOT NULL,
Location VARCHAR(150) NOT NULL
);

CREATE TABLE Food_Item (
 Item_ID INT PRIMARY KEY,
 Name VARCHAR(100) NOT NULL,
 Price DECIMAL(6,2) NOT NULL,
 Restaurant_ID INT,
 FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

CREATE TABLE Order_Table (
 Order_ID INT PRIMARY KEY,
 Customer_ID INT,
 Restaurant_ID INT,
 Order_Date DATE NOT NULL,
 Status VARCHAR(50) DEFAULT 'Pending',
 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
 FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

CREATE TABLE Order_Details (
 OrderDetail_ID INT PRIMARY KEY,
 Order_ID INT,
 Item_ID INT,
 Quantity INT NOT NULL,
 Total_Price DECIMAL(8,2) NOT NULL,
 FOREIGN KEY (Order_ID) REFERENCES Order_Table(Order_ID),
 FOREIGN KEY (Item_ID) REFERENCES Food_Item(Item_ID)
);

CREATE TABLE Payment (
 Payment_ID INT PRIMARY KEY,
 Order_ID INT,
 Customer_ID INT,
 Amount DECIMAL(8,2) NOT NULL,
 Payment_Method VARCHAR(50) NOT NULL,
 Payment_Status VARCHAR(50) DEFAULT 'Paid',
 Payment_Date DATE NOT NULL,
 FOREIGN KEY (Order_ID) REFERENCES Order_Table(Order_ID),
 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

INSERT INTO Customer VALUES (101, 'Anjali Sharma', 'anjali@gmail.com', 
'9876543210', 'Delhi');

INSERT INTO Restaurant VALUES (1, 'Pizza Palace', 'Italian', 'Mumbai');

INSERT INTO Food_Item VALUES (301, 'Margherita Pizza', 299.00, 1);

INSERT INTO Order_Table VALUES (501, 101, 1, '2025-04-10', 'Pending');

INSERT INTO Order_Details VALUES (701, 501, 301, 2, 598.00);

INSERT INTO Payment VALUES (901, 501, 101, 598.00, 'UPI', 'Paid', '2025-04-10');

SELECT * FROM Customer;

SELECT Order_ID, Order_Date, Status FROM Order_Table
WHERE Customer_ID = 101;

SELECT F.Name, F.Price FROM Food_Item F
JOIN Restaurant R ON F.Restaurant_ID = R.Restaurant_ID
WHERE R.Name = 'Pizza Palace';

UPDATE Order_Table SET Status = 'Delivered' WHERE Order_ID = 501;

DELETE FROM Food_Item WHERE Item_ID = 301;
SELECT C.Name, O.Order_ID, O.Order_Date, P.Amount
FROM Customer C
JOIN Order_Table O ON C.Customer_ID = O.Customer_ID
JOIN Payment P ON O.Order_ID = P.Order_ID;

SELECT C.Name, FI.Name AS Food_Item, OD.Quantity
FROM Order_Details OD

JOIN Food_Item FI ON OD.Item_ID = FI.Item_ID
JOIN Order_Table O ON OD.Order_ID = O.Order_ID
JOIN Customer C ON O.Customer_ID = C.Customer_ID;

SELECT SUM(Amount) AS Total_Sales FROM Payment;

SELECT C.Name, COUNT(O.Order_ID) AS Total_Orders
FROM Customer C
JOIN Order_Table O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Name;