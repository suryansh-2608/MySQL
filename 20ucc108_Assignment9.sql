create database lab_tables;
use lab_tables;
CREATE TABLE t1 (
    id INT,
    Name VARCHAR(5),
    PRIMARY KEY (ID)
);
CREATE TABLE t2 (
    id INT,
    Name VARCHAR(5)
);
CREATE TABLE log (
    id INT,
    Name VARCHAR(5),
    event VARCHAR(9)
);

delimiter //
-- TASK 01
CREATE TRIGGER dupe BEFORE INSERT ON t1 FOR EACH ROW 
BEGIN
insert into t2 values(NEW.id,NEW.name);
insert into t2 values(NEW.id,NEW.name);
END;//

-- TASK 02
CREATE TRIGGER dil AFTER DELETE ON t1 FOR EACH ROW 
BEGIN
delete from t2 where id=old.id;
END;//

-- TASK 03
CREATE TRIGGER logs_insert 
BEFORE INSERT ON t1 
FOR EACH ROW 
BEGIN
insert into log values(NEW.id,NEW.name,'INSERT');
END;//

CREATE TRIGGER logs_delete 
AFTER DELETE ON t1 
FOR EACH ROW 
BEGIN
insert into log values(old.id,old.name,'DELETE');
END;//

CREATE TRIGGER logs_update 
BEFORE UPDATE ON t1 
FOR EACH ROW 
BEGIN
insert into log values(old.id,old.name,'OUPDATE');
insert into log values(NEW.id,NEW.name,'UPDATE');
END;//
delimiter ;

insert into t1 values(1,'hem');
insert into t1 values(11,'mem');
insert into t1 values(67,'REM');

SELECT 
    *
FROM
    t1;
SELECT 
    *
FROM
    t2;

DELETE FROM t1 
WHERE
    id = 1;

SELECT 
    *
FROM
    t1;
SELECT 
    *
FROM
    t2;

UPDATE t1 
SET 
    name = 'TAMAT'
WHERE
    id = 11;
SELECT 
    *
FROM
    t1;
SELECT 
    *
FROM
    t2;
SELECT 
    *
FROM
    log;

drop database lab_tables;