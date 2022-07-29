show databases;
create database cats;
use cats;
CREATE TABLE cats (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 
  DESC cats;
  INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
show tables;
SELECT 
    *
FROM
    cats;
SELECT 
    name
FROM
    cats;
SELECT 
    age
FROM
    cats;
SELECT 
    breed
FROM
    cats;
SELECT 
    cat_id, age, name
FROM
    cats;
SELECT 
    *
FROM
    cats
WHERE
    age = 4;
SELECT 
    *
FROM
    cats
WHERE
    name = 'Egg';
SELECT 
    cat_id
FROM
    cats;
SELECT 
    name, breed
FROM
    cats;
SELECT 
    name, age
FROM
    cats
WHERE
    breed = 'Tabby';
SELECT 
    cat_id, age
FROM
    cats
WHERE
    cat_id = age;
SELECT 
    cat_id AS id, name
FROM
    cats;
UPDATE cats 
SET 
    breed = 'Shorthair'
WHERE
    breed = 'Tabby';
SELECT 
    *
FROM
    cats;
UPDATE cats 
SET 
    age = 14
WHERE
    name = 'Misty';
SELECT 
    *
FROM
    cats;
UPDATE cats 
SET 
    name = 'Jack'
WHERE
    name = 'Jackson';
SELECT 
    *
FROM
    cats;
UPDATE cats 
SET 
    breed = 'British Shorthair'
WHERE
    name = 'Ringo';
SELECT 
    *
FROM
    cats;
UPDATE cats 
SET 
    age = 12
WHERE
    breed = 'Maine Coon';
SELECT 
    *
FROM
    cats;
DELETE FROM cats 
WHERE
    name = 'Egg';
SELECT 
    *
FROM
    cats;
DELETE FROM cats 
WHERE
    age = 4;
SELECT 
    *
FROM
    cats;
DELETE FROM cats 
WHERE
    cat_id = age;
SELECT 
    *
FROM
    cats;
DELETE FROM cats;
SELECT 
    *
FROM
    cats;
drop database cats;
show databases;
create database shirts_db;
use shirts_db;
CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(100),
    color VARCHAR(100),
    shirt_size VARCHAR(100),
    last_worn INT,
    PRIMARY KEY (shirt_id)
);
desc shirts;
insert into shirts(article, color, shirt_size, last_worn) values ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
SELECT 
    *
FROM
    shirts;
insert into shirts(article, color, shirt_size, last_worn) value ('polo shirt','purple','M','50');
SELECT 
    *
FROM
    shirts;
SELECT 
    article, color
FROM
    shirts;
SELECT 
    article, color, shirt_size, last_worn
FROM
    shirts
WHERE
    shirt_size = 'M';
UPDATE shirts 
SET 
    shirt_size = 'L'
WHERE
    article = 'polo shirt';
SELECT 
    *
FROM
    shirts;
UPDATE shirts 
SET 
    last_worn = 0
WHERE
    last_worn = 15;
SELECT 
    *
FROM
    shirts;
UPDATE shirts 
SET 
    shirt_size = 'XS',
    color = 'off white'
WHERE
    color = 'white';
SELECT 
    *
FROM
    shirts;
DELETE FROM shirts 
WHERE
    last_worn = 200;
SELECT 
    *
FROM
    shirts;
DELETE FROM shirts 
WHERE
    article = 'tank top';
SELECT 
    *
FROM
    shirts;
DELETE FROM shirts;
SELECT 
    *
FROM
    shirts;
SELECT SUBSTRING('Hello World', 1, 4);
SELECT SUBSTRING('Hello World', - 4);
SELECT 
    SUBSTR(article, 1, 6) AS 'article_code'
FROM
    shirts;
SELECT 
    *
FROM
    shirts;
SELECT 
    CONCAT(SUBSTR(article, 1, 6), '...') AS short_article_name
FROM
    shirts;
SELECT REPLACE('Hello World', 'Hell', '@#$%');
SELECT REPLACE('Hello World', 'l', 'L');
SELECT REPLACE('Hello World', ' ', ' and bye ');
SELECT REVERSE('Hello Wolrd');
SELECT CHAR_LENGTH('Hello World');
SELECT UPPER('Hello World');
SELECT LOWER('Hello World');
select upper(reverse('Why does my cat look at me so hatered?'));

drop table shirts;
drop database shirts_db;
show databases;
