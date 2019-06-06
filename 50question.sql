use ORG;

-- Q-1
select FIRST_NAME AS WORKER_NAME From Worker;

-- Q-2
select upper(FIRST_NAME) AS UPPERCASE_FIRSTNAME from Worker;

-- Q-3
select distinct DEPARTMENT from Worker;

-- Q-4
select left(FIRST_NAME,3) AS ThreeCharacters from Worker;
select substring(FIRST_NAME,1,3) from Worker;

-- Q-5
Select INSTR(FIRST_NAME, BINARY'A') from Worker where FIRST_NAME = 'Amitabh';

-- Q-6
select rtrim(FIRST_NAME) from Worker;

-- Q-7
select ltrim(DEPARTMENT) from Worker;

-- Q-8
select distinct length(DEPARTMENT) from Worker;

-- Q-9
select replace(FIRST_NAME, 'a', 'A') from Worker;

-- Q-10
select concat(FIRST_NAME, " ", LAST_NAME) AS COMPLETE_NAME from Worker;

-- Q-11
select * from Worker order by FIRST_NAME asc;

-- Q-12
select * from Worker order by FIRST_NAME asc,DEPARTMENT desc;

-- Q-13
select * from Worker 
where FIRST_NAME in ('Vipul', 'Satish');

-- Q-14
select * from Worker where FIRST_NAME not in ('Vipul', 'Satish');

-- Q-15
select * from Worker where DEPARTMENT like 'Admin%';

-- Q-16
select * from Worker where FIRST_NAME  like '%A%';

-- Q-17
select * from Worker where FIRST_NAME like '%A';

-- Q-18
select * from Worker where FIRST_NAME like '%h' and length(FIRST_NAME)=6;

-- Q-19
select * from Worker where SALARY between 100000 AND 500000;

-- Q-20
select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 02;

-- Q-21

select COUNT(*) from Worker where DEPARTMENT= 'Admin';

-- Q-22
select concat(FIRST_NAME," ",LAST_NAME) AS WorkerNames , Salary from Worker
 where WORKER_ID IN 
 (select WORKER_ID from Worker where SALARY between 50000 and 100000);
 
 -- Q-23
select DEPARTMENT , count(WORKER_ID) NO_OfWorker from Worker
group by DEPARTMENT
order by NO_OfWorker desc
;
-- Q-24
select distinct concat(W.FIRST_NAME,' ',W.LAST_NAME) WORKER_NAME, T.WORKER_TITLE
from Worker W 
inner join Title T on W.WORKER_ID = T.WORKER_REF_ID and T.WORKER_TITLE in ('Manager');

-- Q-25
SELECT DEPARTMENT, JOINING_DATE, COUNT(*)
FROM Worker group by DEPARTMENT , JOINING_DATE HAVING count(*)>1;

-- Q-26
select * from worker where mod(WORKER_ID,2) !=0;

-- Q-27
select * from worker where mod(WORKER_ID,2) =0;

-- Q-28
create table clone_Worker as
select WORKER_ID, FIRST_NAME, LAST_Name, Salary , JOINING_DATE, DEPARTMENT
from worker;

-- Q-29
select W.FIRST_NAME, W.SALARY,T.WORKER_TITLE from Worker W inner join Title T on W.WORKER_ID = T.WORKER_REF_ID;

-- Q-30
select W.WORKER_ID, W.FIRST_NAME, W.SALARY, T.WORKER_TITLE from Worker W 
left join Title T on W.WORKER_ID = T.WORKER_REF_ID;

-- Q-31

select now();

-- Q-32
select * from Worker order by SALARY desc limit 10;

-- Q-33
select * from Worker order by SALARY desc limit 4,1;

-- Q-34

-- Q-35
select  distinct W1.WORKER_ID, concat(W1.FIRST_NAME,' ',W1.LAST_NAME) AS WORKER_NAME,
W1.SALARY
FROM WORKER W1, WORKER W2
WHERE W1.SALARY = W2.SALARY AND W1.WORKER_ID != W2.WORKER_ID;

-- Q-36

select * from Worker order by SALARY desc limit 2,1;

select max(SALARY) from Worker where SALARY not in (select max(SALARY)from Worker)
;
-- Q-37

select WORKER_ID,DEPARTMENT From Worker where DEPARTMENT in ('HR')
union all
select W.WORKER_ID,W.DEPARTMENT From Worker W where W.DEPARTMENT in('HR');

-- Q-38

select  * from Worker
inter join clone_Worker; 

-- Q-39
select * from Worker where WORKER_ID <=(select count(WORKER_ID)/2 from Worker);

-- Q-40
select DEPARTMENT, count(WORKER_ID) as 'Number of Department' from Worker group by

DEPARTMENT  HAVING count(WORKER_ID)<5;








