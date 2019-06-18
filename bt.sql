create database testMySQL;
use testMySQL;

CREATE TABLE student (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    birthday DATE,
    address VARCHAR(100),
    isDelete BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE class (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    classname VARCHAR(100),
    startyear YEAR,
    type VARCHAR(100),
    isDelete BOOLEAN NOT NULL DEFAULT 0
);
CREATE TABLE student_class (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    std_id INT NOT NULL,
    class_id INT NOT NULL,
    isDelete BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY (std_id)
        REFERENCES student (id)
        ON DELETE CASCADE,
    FOREIGN KEY (class_id)
        REFERENCES class (id)
        ON DELETE CASCADE
);
CREATE TABLE sub (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    sub_name VARCHAR(100) NOT NULL,
    note VARCHAR(100),
    isDelete BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE class_subject (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    class_id INT NOT NULL,
    sub_id INT NOT NULL,
    isDelete BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY (class_id)
        REFERENCES class (id)
        ON DELETE CASCADE,
    FOREIGN KEY (sub_id)
        REFERENCES sub (id)
        ON DELETE CASCADE
);

CREATE TABLE student_sub (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    std_id INT NOT NULL,
    sub_id INT NOT NULL,
    sub_point DOUBLE NOT NULL,
    test_no INT NOT NULL,
    isDelete BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY (std_id)
        REFERENCES student (id)
        ON DELETE CASCADE,
    FOREIGN KEY (sub_id)
        REFERENCES sub (id)
        ON DELETE CASCADE
);
-- alter table student change birhday birthday date;
-- alter table class change type class_type varchar(100);
insert into student (fullname, birthday,address,isDelete) values
('Tran Trong Thang','1996-11-10','03 Hai Ho',0),
('Vo Van Luc', '1996-08-31',null,0),
('Tran Van A', '1996-02-21',null,0),
('Nguyen Van B', '1996-04-21',null,0),
('Le Thi C', '1990-12-30',null,1),
('Thai Vu Ngoc D','1994-10-21',null, 0);
SELECT 
    *
FROM
    student;

insert into class (classname,startyear,class_type,isDelete) values
('AT11', 2014,'Su pham',0),
('AT12', 2015,'Cu nhan',0),
('AT13', 2011,'Ky su',0),
('AT14', 2001,'Cao hoc',1),
('AT15', 2012,'Tien si',0);
SELECT 
    *
FROM
    class;

insert into student_class(std_id,	class_id, isDelete) values
(1,1,0),(1,2,0),(1,3,0),(1,5,0),(2,2,0),(2,3,1),(2,5,0),(3,1,0),(3,4,1),(4,2,1),(4,3,0),(5,4,1),(6,1,1),(6,2,1),(6,4,0);
SELECT 
    *
FROM
    student_class;

insert into sub (sub_name, note, isDelete) values
('vat ly 1',null,0),
('vat ly 2',null,0),
('hoa hoc 1',null,0),
('hoa hoc 2',null,0),
('tieng anh chuyen nganh',null,0),
('lap trinh co ban',null,0),
('thi giac may tinh',null,0),
('lap trinh mang',null,0),
('lap trinh huong doi tuong',null,0),
('lap trinh .net',null,0),
('phap luat dai cuong',null,0),
('kinh te nganh',null,0),
('phan tich va thiet ke giai thuat',null,0),
('tri tue nhan tao',null,0),
('co so du lieu',null,0);
SELECT 
    *
FROM
    sub;

insert into student_sub(std_id,sub_id,sub_point,test_no,isDelete) values
(1,1,10,1,0),
(1,1,10,2,0),
(1,1,10,3,0),
(1,2,10,1,0),
(1,2,10,2,0),
(1,2,10,3,0),
(2,1,10,1,0),
(2,2,10,2,0),
(2,3,10,3,0),
(2,4,10,4,0),
(3,1,9,1,0),
(3,1,5,2,0),
(3,1,1,3,0);


insert into class_subject (class_id, sub_id,isDelete) values
(1,1,0),(1,2,1),(2,1,1),(2,2,1),(3,1,1),(4,1,1),(5,1,1);
-- QUESTION 1:

SELECT 
    *
FROM
    (SELECT 
        student.id AS std_ID,
            fullname,
            class_id,
            classname,
            startyear
    FROM
        student
    INNER JOIN (SELECT 
        student_class.std_id AS Sid,
            class.id AS class_id,
            classname,
            startyear
    FROM
        class
    INNER JOIN student_class ON class.id = student_class.class_id) AS A ON student.id = A.Sid) AS A
        INNER JOIN
    (SELECT 
        sub.id AS sub_id, sub_name, class_id
    FROM
        sub
    INNER JOIN class_subject ON sub.id = class_subject.sub_id) AS B ON A.class_id = B.class_id
ORDER BY sub_name;

-- cau 2
select fullname,sub_id,max(sub_point), test_no from student inner join student_sub on student.id = student_sub.std_id group by sub_id,test_no;


SELECT 
	ANY_VALUE(fullname)  fullname, sub_name, MAX(sub_point), test_no
FROM
    sub
        INNER JOIN
    (SELECT 
        fullname, sub_id, sub_point, test_no
    FROM
        student
    INNER JOIN student_sub ON student.id = student_sub.std_id) AS A 
    ON sub.id = A.sub_id
GROUP BY sub_name,test_no
;




SELECT 
    s.sub_name, MAX(ss.sub_point) AS point, ss.test_no
FROM
    sub s
        left JOIN
    student_sub ss ON s.id = ss.sub_id
        left JOIN
    student st ON st.id = ss.std_id
GROUP BY s.sub_name , ss.test_no;

