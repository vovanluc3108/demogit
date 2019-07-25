-- Q1
select  demo1.Worker.FirstName WorkerName from demo1.Worker;
-- Q2
select ucase(demo1.Worker.FirstName) from demo1.Worker;
-- Q3
select distinct demo1.Worker.Department from demo1.Worker;
-- Q4
select demo1.Worker.FirstName from demo1.Worker limit 3;
-- Q5
select instr(FirstName, 'A') from demo1.Worker where demo1.Worker.FirstName like 'Anh';
-- Q6
select rtrim(FirstName) from demo1.Worker;
-- Q7
select ltrim(FirstName) from demo1.Worker;
-- Q8
select distinct length(Department) from demo1.Worker;
-- Q9
select replace(demo1.Worker.FirstName, 'A', 'A')  from demo1.Worker;
-- Q10
select concat_ws(' ', LastName, FirstName) FullName from demo1.Worker;
-- Q11
select * from demo1.Worker order by FirstName;
-- Q12
select * from demo1.Worker order by FirstName, Department desc;
-- Q13
select * from demo1.Worker where FirstName in ('Le', 'Phu');
-- Q14
select * from demo1.Worker where FirstName not in ('le','phu');
-- Q15
select * from demo1.Worker where Department like 'HR';
-- Q16
select * from demo1.Worker where FirstName like '%A%';
-- Q17
select * from demo1.Worker where FirstName like '%e';
-- Q18
select * from demo1.Worker where FirstName like '%H' and length(FirstName) = 6;
-- Q19
select * from demo1.Worker where Salary between 100000 and 300000;
-- Q20
select * from demo1.Worker where year(JoinDate) = 2012 and month(JoinDate)  = 3;
-- Q21
select count(WorkerId) from demo1.Worker where Department like 'HR';
-- Q22
select concat_ws(' ', LastName, FirstName) NameWorker, Salary from demo1.Worker where Salary between 120000 and 200000;
-- Q23
select count(WorkerId) as NoofWorker, Department from demo1.Worker group by Department order by Department desc;
-- Q24
select w.FirstName, t.Worker_Title from demo1.Worker w right join demo1.Title t on w.WorkerId = t.Worker_Ref_Id where Department like 'HR';
-- Q25
select FirstName, Department, count(*) from demo1.Worker group by FirstName, Department having count(*)>1;
-- Q26
select * from demo1.Worker where WorkerId %2 <> 0;
-- Q27
select * from demo1.Worker where WorkerId %2 = 0;
-- Q28
create table CloneTable like demo1.Worker;
insert CloneTable select * from demo1.Worker;
-- Q29
(select * from demo1.Worker)
union
(select * from demo1.CloneTable);
-- Q30
select w.* from demo1.Worker w left join demo1.Title t on w.WorkerId = t.Worker_Ref_Id where t.Worker_Ref_Id is null;
-- Q31
select curdate();
-- Q32
select * from demo1.Worker order by Salary desc limit 10;
-- Q33 
select Salary from demo1.Worker order by Salary desc LIMIT 4,1;
-- Q34 
select * from demo1.Worker W1 where 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM demo1.Worker W2
 WHERE W2.Salary >= W1.Salary
 );
 -- Q35
 select distinct w1.FirstName, w1.Salary from demo1.Worker w1, demo1.Worker w2 where w1.Salary = w2.Salary and w1.WorkerId != w2.WorkerId;
 -- Q36
select Salary , FirstName from demo1.Worker order by Salary desc limit 1, 1;
-- Q37










