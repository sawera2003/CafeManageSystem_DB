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

Select * from Payments;

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
