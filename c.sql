-- C Insert salary records for employees with their corresponding effective dates

INSERT INTO
    Salaries (
        EmployeeID,
        SalaryAmount,
        EffectiveDate
    )
VALUES (1, 50000, '2022-01-01'), (1, 55000, '2023-01-01'), (2, 60000, '2022-02-01'), (2, 65000, '2023-02-01'), (3, 70000, '2022-03-01'), (3, 75000, '2023-03-01'), (4, 80000, '2022-04-01'), (4, 85000, '2023-04-01'), (5, 90000, '2022-05-01'), (5, 95000, '2023-05-01');