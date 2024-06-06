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

select * from Orders;

-- Query to retrieve orders placed on a specific date
SELECT * FROM Orders WHERE OrderDate = '2023-02-15';

-- Query to count the total number of orders
SELECT COUNT(*) AS TotalOrders FROM Orders;

-- Query to update the order date of an order
UPDATE Orders SET OrderDate = '2023-02-16 09:00:00' WHERE OrderID = 1;


-- Query to find orders placed by a specific customer
SELECT * FROM Orders WHERE CustomerID = 1;