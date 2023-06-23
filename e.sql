-- E Update the department of an employee with EmployeeID = 3 to "IT"

UPDATE Employees SET DepartmentID = 3 WHERE EmployeeID = 3;

-- E Update the salary of an employee with EmployeeID = 3 to a specific amount

UPDATE Salaries
SET SalaryAmount = 120000.21
WHERE
    EmployeeID = 3
    AND EffectiveDate = '2022-03-01';