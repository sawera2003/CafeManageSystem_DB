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

Select * from Shifts;

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
