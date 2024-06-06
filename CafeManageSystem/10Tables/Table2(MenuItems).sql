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

select * from MenuItems;

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

