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

Select * from OrderItems;

-- Query to retrieve order items with quantity greater than 1
SELECT * FROM OrderItems WHERE Quantity > 1;

-- Query to calculate the total quantity of a specific menu item ordered
SELECT MenuItemID, SUM(Quantity) AS TotalQuantity FROM OrderItems GROUP BY MenuItemID;

-- Query to update the quantity of an order item
UPDATE OrderItems SET Quantity = 3 WHERE OrderItemID = 1;



-- Query to find orders with their respective items and quantities
SELECT o.OrderID, oi.MenuItemID, oi.Quantity FROM Orders o
INNER JOIN OrderItems oi ON o.OrderID = oi.OrderID;
