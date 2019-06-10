use homework;

create table student(
id	int not null primary key auto_increment,
fullname char(255),
birthday date,
address char(255),
isDelete boolean
);

create table class(
id int not null primary key auto_increment,
classname char(100),
startyear year,
type char(25),
isDelete boolean
);

create table subject(
id int not null primary key auto_increment,
subject_name char(25),
note char(255),
isDelete boolean
);

create table student_class(
id int not null primary key auto_increment,
id_student int,
foreign key (id_student) references student(id) on delete cascade,
id_class int,
foreign key(id_class) references class(id) on delete cascade,
isDelete boolean
);

create table student_subject(
id int not null primary key auto_increment,
id_student int,
foreign key (id_student)references student(id) on delete cascade,
subject_id int,
foreign key (subject_id) references subject(id) on delete cascade,
point int,
test_no int,
isDelete boolean
);

create table class_subject(
id  int not null primary key auto_increment,
id_class int,
foreign key (id_class) references class(id) on delete cascade,
subject_id int,
foreign key (subject_id) references subject(id) on delete cascade,
isDelete boolean
);
