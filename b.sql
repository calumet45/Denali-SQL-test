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