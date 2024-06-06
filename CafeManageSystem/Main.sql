create database CafeManageSystem;

use cafeManageSystem;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(20)
);

INSERT INTO Customers (Name, Email, Phone)
VALUES 
    ('John Doe', 'johndoe@example.com', '123-456-7890'),
    ('Alice Smith', 'alicesmith@example.com', '987-654-3210'),
    ('Bob Johnson', 'bjohnson@example.com', '456-789-0123');

CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO MenuItems (Name, Price)
VALUES 
    ('Cappuccino', 3.50),
    ('Latte', 4.00),
    ('Espresso', 2.50);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CustomerID INT,
    OrderDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (CustomerID, OrderDate)
VALUES 
    (1, '2023-02-15 10:00:00'),
    (2, '2023-02-16 11:00:00'),
    (3, '2023-02-17 12:00:00');


CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    OrderID INT,
    MenuItemID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

INSERT INTO OrderItems (OrderID, MenuItemID, Quantity)
VALUES 
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3);


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Payments (OrderID, PaymentMethod, Amount)
VALUES 
    (1, 'Cash', 10.00),
    (2, 'Credit Card', 15.00),
    (3, 'Cash', 20.00);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name VARCHAR(50),
    Role VARCHAR(50)
);

INSERT INTO Employees (Name, Role)
VALUES 
    ('Jane Smith', 'Barista'),
    ('Michael Johnson', 'Manager'),
    ('Emily Davis', 'Barista');


CREATE TABLE Shifts (
    ShiftID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    EmployeeID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


INSERT INTO Shifts (EmployeeID, StartDate, EndDate)
VALUES 
    (1, '2023-02-15 08:00:00', '2023-02-15 16:00:00'),
    (2, '2023-02-16 09:00:00', '2023-02-16 17:00:00'),
    (3, '2023-02-17 10:00:00', '2023-02-17 18:00:00');

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name VARCHAR(50),
    ContactName VARCHAR(50)
);


INSERT INTO Suppliers (Name, ContactName)
VALUES 
    ('Coffee Bean Co.', 'John Smith'),
    ('Tea Emporium', 'Emily Johnson'),
    ('Milk Distributors Inc.', 'David Brown');


CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    MenuItemID INT,
    SupplierID INT,
    Quantity INT,
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Inventory (MenuItemID, SupplierID, Quantity)
VALUES 
    (1, 1, 100),
    (2, 2, 50),
    (3, 3, 75);

	CREATE TABLE EmployeeRoles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL,
    Description VARCHAR(255)
);
INSERT INTO EmployeeRoles (RoleID, RoleName, Description) VALUES 
(1, 'Manager', 'Responsible for overseeing cafe operations and staff management'),
(2, 'Barista', 'Prepares and serves coffee and other beverages'),
(3, 'Chef', 'Responsible for food preparation and cooking');

select * from EmployeeRoles where RoleID = 3;

	-- Query to retrieve all customers whose names start with 'J'
SELECT * FROM Customers WHERE Name LIKE 'J%';

-- Query to count the total number of customers
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- Query to update a customer's email
UPDATE Customers SET Email = 'newemail@example.com' WHERE CustomerID = 1;

-- Query to find customers who have placed orders
SELECT c.* FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;


-- Query to retrieve menu items priced less than $5
SELECT * FROM MenuItems WHERE Price < 5.00;

-- Query to calculate the total price of all menu items
SELECT SUM(Price) AS TotalPrice FROM MenuItems;

-- Query to update the price of a menu item
UPDATE MenuItems SET Price = 4.00 WHERE MenuItemID = 1;

-- Query to delete a menu item
DELETE FROM MenuItems WHERE MenuItemID = 1;

-- Query to find the most expensive menu item
SELECT * FROM MenuItems WHERE Price = (SELECT MAX(Price) FROM MenuItems);


-- Query to retrieve orders placed on a specific date
SELECT * FROM Orders WHERE OrderDate = '2023-02-15';

-- Query to count the total number of orders
SELECT COUNT(*) AS TotalOrders FROM Orders;

-- Query to update the order date of an order
UPDATE Orders SET OrderDate = '2023-02-16 09:00:00' WHERE OrderID = 1;


-- Query to find orders placed by a specific customer
SELECT * FROM Orders WHERE CustomerID = 1;


-- Query to retrieve order items with quantity greater than 1
SELECT * FROM OrderItems WHERE Quantity > 1;

-- Query to calculate the total quantity of a specific menu item ordered
SELECT MenuItemID, SUM(Quantity) AS TotalQuantity FROM OrderItems GROUP BY MenuItemID;

-- Query to update the quantity of an order item
UPDATE OrderItems SET Quantity = 3 WHERE OrderItemID = 1;



-- Query to find orders with their respective items and quantities
SELECT o.OrderID, oi.MenuItemID, oi.Quantity FROM Orders o
INNER JOIN OrderItems oi ON o.OrderID = oi.OrderID;


-- Query to retrieve payments made via a specific payment method
SELECT * FROM Payments WHERE PaymentMethod = 'Cash';

-- Query to calculate the total amount of payments received
SELECT SUM(Amount) AS TotalAmount FROM Payments;

-- Query to update the amount of a payment
UPDATE Payments SET Amount = 15.00 WHERE PaymentID = 1;

-- Query to delete a payment
DELETE FROM Payments WHERE PaymentID = 1;

-- Query to find payments made for orders placed on a specific date
SELECT p.* FROM Payments p
INNER JOIN Orders o ON p.OrderID = o.OrderID
WHERE o.OrderDate = '2023-02-15';


-- Query to retrieve employees who are baristas
SELECT * FROM Employees WHERE Role = 'Barista';

-- Query to count the total number of employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- Query to update the role of an employee
UPDATE Employees SET Role = 'Manager' WHERE EmployeeID = 1;



-- Query to find employees who have worked on a specific date
SELECT e.* FROM Employees e
INNER JOIN Shifts s ON e.EmployeeID = s.EmployeeID
WHERE StartDate >= '2023-02-15' AND EndDate <= '2023-02-15';


-- Query to retrieve shifts starting after a specific time
SELECT * FROM Shifts WHERE StartDate > '2023-02-15 12:00:00';

-- Query to calculate the total duration of all shifts
SELECT SUM(DATEDIFF(MINUTE, StartDate, EndDate)) AS TotalDurationInMinutes FROM Shifts;

-- Query to update the end time of a shift
UPDATE Shifts SET EndDate = '2023-02-15 17:00:00' WHERE ShiftID = 1;


-- Query to find employees who have not been assigned shifts
SELECT e.* FROM Employees e
LEFT JOIN Shifts s ON e.EmployeeID = s.EmployeeID
WHERE s.EmployeeID IS NULL;


-- Query to retrieve suppliers whose names contain 'Coffee'
SELECT * FROM Suppliers WHERE Name LIKE '%Coffee%';

-- Query to count the total number of suppliers
SELECT COUNT(*) AS TotalSuppliers FROM Suppliers;

-- Query to update the contact name of a supplier
UPDATE Suppliers SET ContactName = 'Jane Doe' WHERE SupplierID = 1;

-- Query to delete a supplier record
DELETE FROM Suppliers WHERE SupplierID = 1;

-- Query to find suppliers with their respective inventory items and quantities
SELECT s.*, i.MenuItemID, i.Quantity FROM Suppliers s
INNER JOIN Inventory i ON s.SupplierID = i.SupplierID;


-- Query to retrieve inventory items with quantity less than 50
SELECT * FROM Inventory WHERE Quantity < 50;

-- Query to calculate the total quantity of a specific menu item in inventory
SELECT MenuItemID, SUM(Quantity) AS TotalQuantity FROM Inventory GROUP BY MenuItemID;

-- Query to update the quantity of an inventory item
UPDATE Inventory SET Quantity = 150 WHERE InventoryID = 1;



-- Query to find inventory items supplied by a specific supplier
SELECT * FROM Inventory WHERE SupplierID = 1;

SELECT * FROM Orders WHERE OrderDate BETWEEN '2023-02-15' AND '2023-02-20';

SELECT AVG(Price) AS AveragePrice FROM MenuItems;

SELECT c.* FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;

SELECT c.CustomerID, c.Name, SUM(oi.Quantity * m.Price) AS TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN MenuItems m ON oi.MenuItemID = m.MenuItemID
GROUP BY c.CustomerID, c.Name;

SELECT e.*
FROM Employees e
INNER JOIN Shifts s ON e.EmployeeID = s.EmployeeID
WHERE DATEDIFF(HOUR, s.StartDate, s.EndDate) > 8;
SELECT m.MenuItemID, m.Name, COUNT(oi.OrderItemID) AS TotalOrders
FROM MenuItems m
JOIN OrderItems oi ON m.MenuItemID = oi.MenuItemID
GROUP BY m.MenuItemID, m.Name
ORDER BY TotalOrders DESC;
SELECT * FROM Payments WHERE PaymentMethod = 'Credit Card';

SELECT c.*
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentMethod = 'Credit Card';
SELECT * FROM Shifts WHERE EmployeeID = 1;

SELECT oi.MenuItemID, AVG(oi.Quantity) AS AverageQuantityOrdered
FROM OrderItems oi
GROUP BY oi.MenuItemID;

SELECT e.*
FROM Employees e
LEFT JOIN Shifts s ON e.EmployeeID = s.EmployeeID
WHERE s.StartDate < DATEADD(MONTH, -1, GETDATE()) OR s.StartDate IS NULL;

SELECT e.*
FROM Employees e
LEFT JOIN Shifts s ON e.EmployeeID = s.EmployeeID
WHERE s.StartDate < DATEADD(MONTH, -1, GETDATE()) OR s.StartDate IS NULL;



