show databases;
create database university;
use university;
show tables;
CREATE TABLE instructor (
    ID INT,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);
CREATE TABLE department (
    dept_name VARCHAR(50),
    bulding INT,
    budget INT
);
CREATE TABLE course (
    course_id VARCHAR(10),
    title VARCHAR(50),
    dept_name VARCHAR(50),
    credits INT
);
alter table instructor rename column ID to instrctor_ID;
SELECT 
    *
FROM
    instructor;
desc instructor;
alter table instructor add primary key (instrctor_ID);
alter table instructor drop primary key;
alter table instructor add primary key (instrctor_ID);
desc department;
alter table department add primary key (dept_name);
desc department;
desc course;
alter table course add primary key (course_id);
desc course;
alter table department add constraint DptName check (dept_name in ('CCE', 'MME', 'CSE', 'ECE','PHY','BIO'));
alter table course add constraint cfkey foreign key (dept_name) references department(dept_name) on delete cascade;
alter table instructor add constraint ifkey foreign key (dept_name) references department(dept_name) on delete cascade;
alter table instructor add column email_id varchar(50);
alter table instructor add constraint Umail unique (email_id);
alter table instructor add column dob date;
alter table department alter budget set default 0;
alter table department add check(budget > 0);
show create table course;
desc instructor;
insert into department values('CSE',3,389724);
insert into department values('CCE',2,789324);
insert into department values('ECE',1,679023);
insert into department values('MME',6,293846);
insert into department values('PHY',5,238479);
insert into department values('BIO',4,789903);
SELECT 
    *
FROM
    department;
insert into instructor values(234,'Ansh','CSE',24895,'ssami-whitei@homitay.com','1995-04-06');
insert into instructor values(235,'Anshuman','CCE',73482,'0ahmed.dan@wheelingfoods.net','1997-06-05');
insert into instructor values(236,'Anshul','ECE',23566,'gmateuspereirap@gmailya.com', '1998-10-27');
insert into instructor values(237,'Anupama','MME',782359,'fajosamah_joharyo@gotcertify.com',' 1998-11-26');
insert into instructor values(238,'Anushruti','PHY',28934,'tcaza.dor13y@antawii.com', '1999-05-17');
insert into instructor values(239,'Anamika','BIO',92348,'zhip@piftir.com', '2002-08-23');
SELECT 
    *
FROM
    instructor;
insert into course values('DSA','Data Structure and Algorithm','CSE',5);
insert into course values('DSY','Digital Syatems','CCE',2);
insert into course values('ANEL','Analog Signals','ECE',1);
insert into course values('MEE','Metallurgy','MME',1);
insert into course values('UGPHYLAB','Physics Lab','PHY',7);
insert into course values('EEB','Environmmental Education','BIO',3);
SELECT 
    *
FROM
    course;
SELECT 
    name, email_id
FROM
    instructor;
UPDATE department 
SET 
    budget = 8000000
WHERE
    dept_name = 'CSE';
SELECT 
    *
FROM
    department;
alter table instructor modify column dob varchar(30);
desc instructor;
DELETE FROM department 
WHERE
    dept_name = 'BIO';
alter table department drop constraint DptName;
alter table department add constraint DptName check (dept_name in ('CCE', 'MME', 'CSE', 'ECE','PHY','BIO','CHE'));
alter table instructor drop foreign key ifkey;
alter table course drop foreign key cfkey;
alter table course add constraint cfkey foreign key (dept_name) references department(dept_name) on delete cascade on update cascade;
alter table instructor add constraint ifkey foreign key (dept_name) references department(dept_name) on delete cascade on update cascade;
UPDATE department 
SET 
    dept_name = 'CHE'
WHERE
    dept_name = 'PHY';
DELETE FROM course;