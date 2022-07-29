show databases;
create database book_shop;
use book_shop;
CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY (book_id)
);
desc books;
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
SELECT 
    *
FROM
    books;
SELECT 
    author_fname, author_lname
FROM
    books;
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS full_name
FROM
    books;
SELECT 
    author_fname AS first,
    author_lname AS last,
    CONCAT(author_fname, ' ', author_lname) AS full_name
FROM
    books;
SELECT 
    author_fname, author_lname
FROM
    books;
SELECT CONCAT('Hello', 'World');
 
SELECT CONCAT('Hello', '...', 'World');
 
SELECT 
    CONCAT(author_fname, ' ', author_lname)
FROM
    books;
 
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS 'full name'
FROM
    books;
 
SELECT 
    author_fname AS first,
    author_lname AS last,
    CONCAT(author_fname, ' ', author_lname) AS full
FROM
    books;
 
SELECT 
    author_fname AS first,
    author_lname AS last,
    CONCAT(author_fname, ', ', author_lname) AS full
FROM
    books;
 
SELECT 
    CONCAT(title,
            '-',
            author_fname,
            '-',
            author_lname)
FROM
    books;
 
SELECT 
    CONCAT_WS(' - ', title, author_fname, author_lname)
FROM
    books;
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
SELECT 
    *
FROM
    books;
SELECT DISTINCT
    author_lname
FROM
    books;
SELECT DISTINCT
    (CONCAT(author_fname, ' ', author_lname)) AS full_name
FROM
    books;
SELECT 
    *
FROM
    books
ORDER BY author_lname;
SELECT 
    *
FROM
    books
ORDER BY author_fname;
SELECT 
    *
FROM
    books
ORDER BY released_year;
SELECT 
    *
FROM
    books
ORDER BY stock_quantity;
SELECT 
    *
FROM
    books
ORDER BY pages;
SELECT 
    *
FROM
    books
ORDER BY title;
SELECT 
    *
FROM
    books
ORDER BY author_lname DESC;
SELECT 
    *
FROM
    books
ORDER BY author_fname DESC;
SELECT 
    *
FROM
    books
ORDER BY released_year DESC;
SELECT 
    *
FROM
    books
ORDER BY stock_quantity DESC;
SELECT 
    *
FROM
    books
ORDER BY pages DESC;
SELECT 
    *
FROM
    books
ORDER BY title DESC;
SELECT 
    title, author_fname, author_lname
FROM
    books
ORDER BY 2;
SELECT 
    author_fname, author_lname
FROM
    books
ORDER BY author_lname , author_fname;
SELECT 
    title, released_year
FROM
    books
ORDER BY released_year DESC
LIMIT 5;
SELECT 
    title, released_year
FROM
    books
ORDER BY released_year DESC
LIMIT 0 , 5;
SELECT 
    *
FROM
    books
LIMIT 3 , 5;
SELECT 
    *
FROM
    books
WHERE
    author_fname LIKE '%da%';
SELECT 
    *
FROM
    books
WHERE
    author_fname LIKE 'da%';
SELECT 
    *
FROM
    books
WHERE
    author_fname LIKE '%da';
SELECT 
    *
FROM
    books
WHERE
    stock_quantity LIKE '___'
ORDER BY stock_quantity;
SELECT 
    *
FROM
    books
WHERE
    title LIKE '%\%%';
SELECT 
    COUNT(*) AS Number_Of_Books
FROM
    books;
SELECT 
    COUNT(author_fname)
FROM
    books;
SELECT 
    COUNT(DISTINCT author_fname)
FROM
    books;
SELECT 
    COUNT(DISTINCT author_lname)
FROM
    books;
SELECT 
    COUNT(*)
FROM
    books
WHERE
    title LIKE '%the%';
SELECT 
    title, author_lname
FROM
    books;
SELECT 
    title, author_lname
FROM
    books
GROUP BY author_lname;
SELECT 
    title, author_lname, COUNT(*)
FROM
    books
GROUP BY author_lname;
SELECT 
    MIN(released_year)
FROM
    books;
SELECT 
    MAX(released_year)
FROM
    books;
SELECT 
    MAX(pages)
FROM
    books;
SELECT 
    AVG(pages)
FROM
    books;
SELECT 
    MAX(pages), title
FROM
    books;
SELECT 
    *
FROM
    books
WHERE
    pages = (SELECT 
            MIN(pages)
        FROM
            books);
SELECT 
    *
FROM
    books
ORDER BY pages ASC
LIMIT 1;
SELECT 
    author_fname, author_lname, MIN(released_year)
FROM
    books
GROUP BY author_fname , author_lname;
SELECT 
    author_fname, author_lname, MAX(pages)
FROM
    books
GROUP BY author_fname , author_lname;
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(pages) AS 'longest book'
FROM
    books
GROUP BY author_lname , author_fname;
SELECT 
    SUM(pages)
FROM
    books;
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS Author_Name,
    SUM(pages) AS Total_Pages_Written
FROM
    books
GROUP BY author_lname , author_fname
ORDER BY Total_Pages_Written ASC;
SELECT 
    AVG(released_year)
FROM
    books;
SELECT 
    AVG(stock_quantity)
FROM
    books
GROUP BY released_year;
SELECT 
    COUNT(*)
FROM
    books;
SELECT 
    COUNT(*)
FROM
    books
GROUP BY released_year;
SELECT 
    released_year, COUNT(*)
FROM
    books
GROUP BY released_year;
SELECT 
    SUM(stock_quantity)
FROM
    BOOKS;
SELECT 
    AVG(released_year)
FROM
    books
GROUP BY author_lname , author_fname;
SELECT 
    author_fname, author_lname, AVG(released_year)
FROM
    books
GROUP BY author_lname , author_fname;
SELECT 
    CONCAT(author_fname, ' ', author_lname)
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);
SELECT 
    CONCAT(author_fname, ' ', author_lname)
FROM
    books
ORDER BY pages DESC
LIMIT 1;
SELECT 
    pages, CONCAT(author_fname, ' ', author_lname)
FROM
    books
ORDER BY pages DESC;
SELECT 
    released_year AS year,
    COUNT(*) AS '# of books',
    AVG(pages) AS 'avg pages'
FROM
    books
GROUP BY released_year;
CREATE TABLE people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
SELECT 
    *
FROM
    people;
SELECT 
    name, birthdate
FROM
    people;
SELECT 
    name, DAY(birthdate)
FROM
    people;
SELECT 
    name, birthdate, DAY(birthdate)
FROM
    people;
SELECT 
    name, birthdate, DAYNAME(birthdate)
FROM
    people;
SELECT 
    name, birthdate, DAYOFWEEK(birthdate)
FROM
    people;
SELECT 
    name, birthdate, DAYOFYEAR(birthdate)
FROM
    people;
SELECT 
    name, birthtime, DAYOFYEAR(birthtime)
FROM
    people;
SELECT 
    name, birthdt, DAYOFYEAR(birthdt)
FROM
    people;
SELECT 
    name, birthdt, MONTH(birthdt)
FROM
    people;
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
SELECT 
    *
FROM
    people;
SELECT 
    DATEDIFF(NOW(), birthdate)
FROM
    people;
SELECT 
    name, birthdate, DATEDIFF(NOW(), birthdate)
FROM
    people;
SELECT 
    birthdt
FROM
    people;
SELECT 
    birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH)
FROM
    people;
SELECT 
    birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND)
FROM
    people;
SELECT 
    birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER)
FROM
    people;
SELECT 
    birthdt, birthdt + INTERVAL 1 MONTH
FROM
    people;
SELECT 
    birthdt, birthdt - INTERVAL 5 MONTH
FROM
    people;
SELECT 
    birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR
FROM
    people;
SELECT 
    name, birthdt, MONTHNAME(birthdt)
FROM
    people;
SELECT 
    name, birthtime, HOUR(birthtime)
FROM
    people;
SELECT 
    name, birthtime, MINUTE(birthtime)
FROM
    people;
SELECT 
    CONCAT(MONTHNAME(birthdate),
            ' ',
            DAY(birthdate),
            ' ',
            YEAR(birthdate))
FROM
    people;
SELECT 
    DATE_FORMAT(birthdt, 'Was born on a %W')
FROM
    people;
SELECT 
    DATE_FORMAT(birthdt, '%m/%d/%Y')
FROM
    people;
SELECT 
    DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i')
FROM
    people;
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW ()
);
INSERT INTO comments (content) VALUES('lol what a funny article');
INSERT INTO comments (content) VALUES('I found this offensive');
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
SELECT 
    *
FROM
    comments
ORDER BY created_at DESC;
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW () ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO comments2 (content) VALUES('dasdasdasd');
INSERT INTO comments2 (content) VALUES('lololololo');
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
UPDATE comments2 
SET 
    content = 'THIS IS NOT GIBBERISH'
WHERE
    content = 'dasdasdasd';
SELECT 
    *
FROM
    comments2;
SELECT 
    *
FROM
    comments2
ORDER BY changed_at;
CREATE TABLE comments3 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW () ON UPDATE NOW ()
);
SELECT 
    title
FROM
    books
WHERE
    released_year != 2017;
SELECT 
    *
FROM
    books;
SELECT 
    title
FROM
    books
WHERE
    title NOT LIKE 'W%';
SELECT 
    *
FROM
    books
WHERE
    released_year > 2000;
SELECT 99 > 1;
SELECT 
    *
FROM
    books
WHERE
    released_year < 2000;
SELECT 
    *
FROM
    books
WHERE
    author_lname = 'Eggers'
        AND released_year > 2010;
SELECT 
    *
FROM
    books
WHERE
    author_lname = 'Eggers'
        AND released_year > 2010
        AND title LIKE '%novel%';
SELECT 
    *
FROM
    books
WHERE
    author_lname = 'Eggers'
        && released_year > 2010;
SELECT 
    *
FROM
    books
WHERE
    author_lname = 'Eggers'
        || released_year > 2010;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year BETWEEN 2004 AND 2015;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year NOT BETWEEN 2004 AND 2015;
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname = 'Carver'
        OR author_lname = 'Lahiri'
        OR author_lname = 'Smith';
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname IN ('Carver' , 'Lahiri', 'Smith');
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year != 2000
        AND released_year != 2002
        AND released_year != 2004
        AND released_year != 2006
        AND released_year != 2008
        AND released_year != 2010
        AND released_year != 2012
        AND released_year != 2014
        AND released_year != 2016;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year NOT IN (2000 , 2002,
        2004,
        2006,
        2008,
        2010,
        2012,
        2014,
        2016);
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year >= 2000
        AND released_year NOT IN (2000 , 2002,
        2004,
        2006,
        2008,
        2010,
        2012,
        2014,
        2016);
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year >= 2000
        AND released_year % 2 != 0;
SELECT 
    title,
    released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS GENRE
FROM
    books;
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM
    books;
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM
    books;   
    drop database book_shop;
