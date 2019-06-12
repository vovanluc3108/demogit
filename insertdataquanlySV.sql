use testMySQL;

insert into student(fullname,birthday,address,isDelete) values
('Tran Trong Thang','1996-11-10','03 Hai Ho',0),
('Vo Van Luc', '1996-08-31',null,0),
('Tran Van B', '1996-02-21',null,0),
('Nguyen Van B', '1996-04-21',null,0),
('Le Thi C', '1990-12-30',null,1),
('Thai Vu Ngoc D','1994-10-21',null, 0);


insert into class (classname,startyear,class_type,isDelete) values
('AT11', 2014,'Su pham',0),
('AT12', 2015,'Cu nhan',0),
('AT13', 2011,'Ky su',0),
('AT14', 2001,'Cao hoc',1),
('AT15', 2012,'Tien si',0);

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