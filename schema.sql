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