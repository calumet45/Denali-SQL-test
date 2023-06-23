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