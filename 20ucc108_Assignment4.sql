create database cinema;
use cinema;
CREATE TABLE movie (
    mID INT,
    title VARCHAR(50) NOT NULL,
    year YEAR NOT NULL,
    director VARCHAR(50),
    PRIMARY KEY (mID)
);
CREATE TABLE reviewer (
    rID INT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (rID)
);
CREATE TABLE rating (
    rID INT NOT NULL,
    mID INT NOT NULL,
    stars INT NOT NULL,
    ratingDate DATE NOT NULL,
    CHECK (stars <= 5 AND stars >= 1),
    FOREIGN KEY (rID)
        REFERENCES reviewer (rID)
        ON DELETE CASCADE,
    FOREIGN KEY (mID)
        REFERENCES movie (mID)
        ON DELETE CASCADE,
    PRIMARY KEY (rID , mID)
);
insert into movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into movie values(105, 'Titanic', 1997, 'James Cameron');
insert into movie values(106, 'Snow White', 1937, null);
insert into movie values(107, 'Avatar', 2009, 'James Cameron');
insert into movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');
SELECT 
    *
FROM
    movie;
insert into reviewer values(201, 'Sarah Martinez');
insert into reviewer values(202, 'Daniel Lewis');
insert into reviewer values(203, 'Brittany Harris');
insert into reviewer values(204, 'Mike Anderson');
insert into reviewer values(205, 'Chris Jackson');
insert into reviewer values(206, 'Elizabeth Thomas');
insert into reviewer values(207, 'James Cameron');
insert into reviewer values(208, 'Ashley White');
SELECT 
    *
FROM
    reviewer;
insert into rating values(201, 101, 2, '2011-01-22');
insert into rating values(202, 106, 4, '2010-08-11');
insert into rating values(203, 103, 2, '2011-01-20');
insert into rating values(203, 108, 4, '2011-01-12');
insert into rating values(204, 101, 3, '2011-01-09');
insert into rating values(205, 103, 3, '2011-01-27');
insert into rating values(205, 104, 2, '2011-01-22');
insert into rating values(205, 108, 4, '2012-06-26');
insert into rating values(206, 107, 3, '2011-01-15');
insert into rating values(206, 106, 5, '2011-01-19');
insert into rating values(207, 107, 5, '2011-01-20');
insert into rating values(207, 101, 3, '2011-11-20');
insert into rating values(208, 104, 3, '2011-01-02');
SELECT 
    *
FROM
    rating;
-- Operation 1
insert into reviewer values(209,'Roger Ebert');
SELECT 
    *
FROM
    reviewer;
-- Operation 2
SELECT 
    title
FROM
    movie
WHERE
    director = 'Steven Spielberg';
-- Operation 3
SELECT DISTINCT
    mID
FROM
    rating
WHERE
    stars BETWEEN 3 AND 5;
-- Operation 4
SELECT DISTINCT
    mID
FROM
    rating
WHERE
    rID IN (203 , 208, 204, 207);
-- Operation 5
SELECT 
    mID, title
FROM
    movie
WHERE
    director IS NULL;
-- Operation 6 --
SELECT 
    rID, mID
FROM
    rating
WHERE
    ratingdate IS NOT NULL;
-- Operation 7
SELECT 
    mID, title
FROM
    movie
WHERE
    title LIKE 'T%';
 -- Operation 8
SELECT 
    mID, title
FROM
    movie
WHERE
    title NOT LIKE '%s%';
-- Operation 9
SELECT DISTINCT
    mID
FROM
    rating
WHERE
    stars IN (2 , 3, 4);
-- Operation 10
SELECT 
    title
FROM
    movie,
    rating
WHERE
    rID = 203 AND movie.mID = rating.mID;
-- Operation 11
SELECT 
    title
FROM
    movie
WHERE
    mID NOT IN (SELECT 
            mID
        FROM
            rating,
            reviewer
        WHERE
            name = 'Chris Jackson'
                AND rating.rID = reviewer.rID);
-- Operation 12
SELECT 
    name
FROM
    reviewer
WHERE
    rID IN (SELECT 
            rID
        FROM
            movie,
            rating
        WHERE
            title = 'Gone with the Wind'
                AND rating.mID = movie.mID);
-- Operation 13 --
SELECT DISTINCT
    name
FROM
    reviewer,
    rating
WHERE
    mID IN (SELECT 
            mID
        FROM
            rating
        WHERE
            rID IN (SELECT 
                    rID
                FROM
                    reviewer
                WHERE
                    name = 'Brittany Harris'))
        AND reviewer.rID = rating.rID
        AND name <> 'Brittany Harris';
-- Operation 14
SELECT 
    name
FROM
    rating AS A,
    rating AS B,
    reviewer
WHERE
    B.rID IN (SELECT 
            rID
        FROM
            reviewer
        WHERE
            name = 'Mike Anderson')
        AND A.mID = B.mID
        AND A.stars = B.stars
        AND A.rID = reviewer.rID
        AND A.rID <> B.rID;
-- Operation 15
SELECT 
    rating.mID, title, year, director
FROM
    movie,
    rating
WHERE
    rID = 205 AND rating.mID = movie.mID
        AND rating.mID NOT IN (SELECT 
            mID
        FROM
            rating
        WHERE
            rID = 203);
-- Operation 16
SELECT 
    rating.mID, title, year, director
FROM
    movie,
    rating
WHERE
    rID = 205 AND rating.mID = movie.mID
        AND rating.mID IN (SELECT 
            mID
        FROM
            rating
        WHERE
            rID = 203);
-- Operation 17
SELECT 
    title
FROM
    movie
WHERE
    mID IN (SELECT 
            mID
        FROM
            rating,
            reviewer
        WHERE
            name IN ('Chris Jackson' , 'James Cameron')
                AND rating.rID = reviewer.rID);
-- Operation 18
SELECT 
    title
FROM
    movie
WHERE
    mID IN (SELECT 
            mID
        FROM
            rating,
            reviewer
        WHERE
            name IN ('Sarah Martinez' , 'Mike Anderson')
                AND rating.rID = reviewer.rID
        GROUP BY mID
        HAVING COUNT(mID) > 1);
-- Operation 19
SELECT 
    mID, rID, stars
FROM
    rating
WHERE
    mID IN (SELECT 
            mID
        FROM
            rating
        GROUP BY mID
        HAVING COUNT(mID) = 2);
-- Operation 20
SELECT 
    title
FROM
    movie
WHERE
    mID NOT IN (SELECT 
            mID
        FROM
            rating
        GROUP BY mID); 
drop database university;