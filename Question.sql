use homework;

-- Question 1

select 
    t.fullname, count(t.id) as totalsub
from
    student t
        inner join
    student_subject st ON st.id_student = t.id
group by t.fullname
order by totalsub desc
limit 0 , 1
;
delete from subject;