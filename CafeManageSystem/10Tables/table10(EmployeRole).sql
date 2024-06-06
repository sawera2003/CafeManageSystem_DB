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
