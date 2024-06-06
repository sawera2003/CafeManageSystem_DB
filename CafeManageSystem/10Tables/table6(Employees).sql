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

Select * from Employees;

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
