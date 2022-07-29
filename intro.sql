show databases;
create database employees;
use employees;
CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INTEGER NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed'
);
desc employees;
insert into employees(first_name, last_name, age) VALUES ('Dora', 'Smith','58');
select * from employees;
drop table employees;
drop database employees;
show databases;
drop database university;
show databases;

