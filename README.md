# Denali-SQL-test
Scenario:
You are working on a project to develop a database for a company's HR system. The database consists of three tables: "Employees," "Departments," and "Salaries."

Table: Employees
Columns: EmployeeID (Primary Key), FirstName, LastName, DepartmentID (Foreign Key referencing DepartmentID in the Departments table), HireDate

Table: Departments
Columns: DepartmentID (Primary Key), DepartmentName

Table: Salaries
Columns: EmployeeID (Foreign Key referencing EmployeeID in the Employees table), SalaryAmount, EffectiveDate

Instructions:

Create a git repository with the following assets. check it into github and provide us with a link. 
We should be able to run your scripts in order to evaluate the results.
Write a script to create the necessary tables, "Employees," "Departments," and "Salaries," with the appropriate columns and constraints.
Write SQL queries to perform the following tasks:
a. Insert three sample departments into the "Departments" table: Sales, Marketing, and IT.
b. Insert five sample employees into the "Employees" table, ensuring that each employee is associated with a department and has a hire date.
c. Insert salary records for employees with their corresponding effective dates in the "Salaries" table. Each employee should have at least two salary records with different effective dates.
d. Retrieve the latest salary for each employee, along with their full name, department name, and hire date.
e. Update the department of an employee with EmployeeID = 3 to "IT" and update their salary to a specific amount.
f. Delete all employees who were hired before a specific date and cascade the changes to associated salary records.

Feel free to use chatGPT but also use comments to note what task is being performed and why it might be important that we are asking it. 