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

Select * from Suppliers;

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