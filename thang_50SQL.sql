use testWorker;
SELECT 
    firstname AS worker_name
FROM
    worker;-- 1

SELECT 
    UPPER(firstname)
FROM
    worker;-- 2

SELECT DISTINCT
    (department)
FROM
    worker;-- 3

SELECT 
    LEFT(firstname, 3)
FROM
    worker;-- 4

SELECT 
    POSITION(BINARY 'A' IN firstname)
FROM
    worker
WHERE
    firstname = ‘Amitabh’;-- 5

SELECT 
    RTRIM(firstname)
FROM
    worker;-- 6
    
SELECT 
    LTRIM(firstname)
FROM
    worker;-- 7
    
SELECT DISTINCT
    (department), LENGTH(department)
FROM
    worker;-- 8
    
SELECT 
    REPLACE(firstname, 'a', 'A')
FROM
    worker;-- 9
    
SELECT 
    CONCAT(firstname, '  ', lastname) AS 'fullname'
FROM
    worker;-- 10
    
SELECT 
    *
FROM
    worker
ORDER BY firstname ASC;-- 11

SELECT 
    *
FROM
    worker
ORDER BY firstname ASC , department DESC;-- 12

SELECT 
    *
FROM
    worker
WHERE
    firstname IN ('Vipul' , 'Satish');-- 13
    
SELECT 
    *
FROM
    worker
WHERE
    NOT firstname IN ('Vipul' , 'Satish');-- 14
    
SELECT 
    *
FROM
    worker
WHERE
    department LIKE 'admin';-- 15
    
SELECT 
    *
FROM
    worker
WHERE
    firstname LIKE '%a%';-- 16
    
SELECT 
    *
FROM
    worker
WHERE
    firstname LIKE '%a';-- 17
    
SELECT 
    *
FROM
    worker
WHERE
    firstname LIKE '%h'
        AND LENGTH(firstname) = 6;-- 18
        
SELECT 
    *
FROM
    worker
WHERE
    salary BETWEEN 100000 AND 500000;-- 19
    
SELECT 
    *
FROM
    worker
WHERE
    YEAR(joining_date) = '2014'
        AND MONTH(joining_date) = '02';-- 20
        
SELECT 
    COUNT(firstname)
FROM
    worker
WHERE
    department LIKE 'admin';-- 21
    
SELECT 
    firstname
FROM
    worker
WHERE
    salary <= 100000 AND salary >= 50000;-- 22
    
SELECT 
    department, COUNT(firstname)
FROM
    worker
GROUP BY department;-- 23

SELECT 
    *
FROM
    worker
        LEFT JOIN
    title ON worker.worker_id = title.worker_ref_id
WHERE
    worker_title LIKE 'manager';-- 24
    
SELECT 
    worker_title, affected_from, COUNT(*)
FROM
    title
GROUP BY worker_title , affected_from
HAVING COUNT(*) > 1;-- 25

SELECT 
    *
FROM
    worker
WHERE
    MOD(worker_id, 2) = 1;-- 26
    
SELECT 
    *
FROM
    worker
WHERE
    MOD(worker_id, 2) = 0;-- 27
    
CREATE TABLE Q28 LIKE worker;-- 28

SELECT 
    *
FROM
    worker
        INNER JOIN
    title ON worker.worker_id = title.worker_ref_id;-- 29
    
SELECT 
    *
FROM
    worker
        LEFT JOIN
    Q28 ON worker.worker_id = Q28.worker_id
WHERE
    Q28.worker_id = NULL;-- 30
    
SELECT NOW();-- 31

SELECT 
    *
FROM
    worker
ORDER BY worker_id
LIMIT 10;-- 32

SELECT 
    *
FROM
    worker
ORDER BY salary DESC
LIMIT 1 OFFSET 4;-- 33

SELECT 
    salary
FROM
    worker w1
WHERE
    4 = (SELECT 
            COUNT(DISTINCT (w2.salary))
        FROM
            worker w2
        WHERE
            w2.salary >= w1.salary);-- 34

SELECT 
    *
FROM
    worker
        INNER JOIN
    (SELECT 
        salary
    FROM
        worker
    GROUP BY salary
    HAVING COUNT(salary) > 1) AS a ON worker.salary = a.salary;-- 35

SELECT DISTINCT
    (salary)
FROM
    worker
ORDER BY salary DESC
LIMIT 1 OFFSET 1;-- 36

SELECT 
    *
FROM
    worker 
UNION ALL SELECT 
    *
FROM
    worker;-- 37

SELECT 
    *
FROM
    worker
        INNER JOIN
    title ON worker.worker_id = title.worker_ref_id;-- 38

SELECT 
    *
FROM
    worker
WHERE
    worker_id <= (SELECT 
            COUNT(worker_id) / 2
        FROM
            worker);-- 39

SELECT 
    department, COUNT(department)
FROM
    worker
GROUP BY department
HAVING (COUNT(department) <= 5);-- 40

SELECT 
    department, COUNT(department)
FROM
    worker
GROUP BY department;-- 41


SELECT 
    *
FROM
    worker
ORDER BY worker_id DESC
LIMIT 1;-- 42


SELECT 
    *
FROM
    worker
LIMIT 1;-- 43


SELECT 
    *
FROM
    worker
ORDER BY worker_id DESC
LIMIT 5;-- 44


SELECT 
    firstname, salary
FROM
    (SELECT 
        MAX(salary) AS total, department
    FROM
        worker
    GROUP BY department) AS w1
        INNER JOIN
    worker AS w2 ON w1.department = w2.department
        AND w1.total = w2.salary;-- 45
        

SELECT DISTINCT
    (salary)
FROM
    worker
ORDER BY salary DESC
LIMIT 3;-- 46


SELECT DISTINCT
    (salary)
FROM
    worker
ORDER BY salary
LIMIT 3;-- 47


SELECT DISTINCT
    (salary)
FROM
    worker
ORDER BY salary
LIMIT 1 OFFSET 2;-- 48


SELECT 
    SUM(salary), department
FROM
    worker
GROUP BY department;-- 49


SELECT 
    firstname
FROM
    worker
ORDER BY salary DESC
LIMIT 1;-- 50
