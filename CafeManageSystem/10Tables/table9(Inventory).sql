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

Select * from Inventory;

-- Query to retrieve inventory items with quantity less than 50
SELECT * FROM Inventory WHERE Quantity < 50;

-- Query to calculate the total quantity of a specific menu item in inventory
SELECT MenuItemID, SUM(Quantity) AS TotalQuantity FROM Inventory GROUP BY MenuItemID;

-- Query to update the quantity of an inventory item
UPDATE Inventory SET Quantity = 150 WHERE InventoryID = 1;



-- Query to find inventory items supplied by a specific supplier
SELECT * FROM Inventory WHERE SupplierID = 1;
