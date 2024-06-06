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

select * from Customers;

	-- Query to retrieve all customers whose names start with 'J'
SELECT * FROM Customers WHERE Name LIKE 'J%';

-- Query to count the total number of customers
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- Query to update a customer's email
UPDATE Customers SET Email = 'newemail@example.com' WHERE CustomerID = 1;

-- Query to find customers who have placed orders
SELECT c.* FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;
