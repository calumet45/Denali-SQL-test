-- This is writen for MSSQL if needed I make the adjustments for a different database like MYSQL SQLlite Postgresql etc.

-- Create the SCHEMA

CREATE TABLE
    Departments (
        DepartmentID INT IDENTITY(1, 1) PRIMARY KEY,
        DepartmentName NVARCHAR(255) NOT NULL
    );

-- Create the Employees table

CREATE TABLE
    Employees (
        EmployeeID INT IDENTITY(1, 1) PRIMARY KEY,
        FirstName NVARCHAR(255) NOT NULL,
        LastName NVARCHAR(255) NOT NULL,
        DepartmentID INT NOT NULL,
        HireDate DATE NOT NULL,
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    );

-- Create the Salaries table

-- make sure to cascade on DELETE for the employees salaries

CREATE TABLE
    Salaries (
        EmployeeID INT NOT NULL,
        SalaryAmount FLOAT NOT NULL,
        EffectiveDate DATE NOT NULL,
        FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
    );

-- Adding Data to tables

-- A Insert three sample departments into the Departments table

INSERT INTO
    Departments (DepartmentName)
VALUES ('Sales'), ('Marketing'), ('IT');

-- B Insert five sample employees into the Employees table

INSERT INTO
    Employees (
        FirstName,
        LastName,
        DepartmentID,
        HireDate
    )
VALUES ('John', 'Doe', 1, '2022-01-01'), ('Jane', 'Doe', 2, '2022-02-01'), ('Bob', 'Smith', 3, '2022-03-01'), (
        'Alice',
        'Johnson',
        1,
        '2022-04-01'
    ), (
        'Charlie',
        'Brown',
        2,
        '2022-05-01'
    );

-- C Insert salary records for employees with their corresponding effective dates

INSERT INTO
    Salaries (
        EmployeeID,
        SalaryAmount,
        EffectiveDate
    )
VALUES (1, 50000, '2022-01-01'), (1, 55000, '2023-01-01'), (2, 60000, '2022-02-01'), (2, 65000, '2023-02-01'), (3, 70000, '2022-03-01'), (3, 75000, '2023-03-01'), (4, 80000, '2022-04-01'), (4, 85000, '2023-04-01'), (5, 90000, '2022-05-01'), (5, 95000, '2023-05-01');

-- D Retrieve the latest salary for each employee

WITH LatestSalary AS (
        SELECT
            EmployeeID,
            MAX(EffectiveDate) AS LatestDate
        FROM Salaries
        GROUP BY EmployeeID
    )
SELECT
    CONCAT(e.FirstName, ' ', e.LastName) AS FullName,
    d.DepartmentName,
    e.HireDate,
    s.SalaryAmount AS LatestSalary
FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    JOIN Salaries s ON e.EmployeeID = s.EmployeeID
    JOIN LatestSalary ls ON s.EmployeeID = ls.EmployeeID AND s.EffectiveDate = ls.LatestDate;

-- E Update the department of an employee with EmployeeID = 3 to "IT"

UPDATE Employees SET DepartmentID = 3 WHERE EmployeeID = 3;

-- E Update the salary of an employee with EmployeeID = 3 to a specific amount

UPDATE Salaries
SET SalaryAmount = 120000.21
WHERE
    EmployeeID = 3
    AND EffectiveDate = '2022-03-01';

-- F Delete all employees who were hired before a specific date and cascade changes to associated salary records

DELETE FROM Employees WHERE HireDate < '2022-01-01' ;