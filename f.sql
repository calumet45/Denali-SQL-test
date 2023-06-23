-- F Delete all employees who were hired before a specific date and cascade changes to associated salary records

DELETE FROM Employees WHERE HireDate < '2022-01-01' ;