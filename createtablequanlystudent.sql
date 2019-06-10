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

