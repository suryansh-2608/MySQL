create database movies;
use movies;
create table movie(mID int , title varchar(50) not null,year year not null,director varchar(50), primary key (mID));
create table reviewer(rID int,name varchar(50) not null,primary key(rID));
create table rating(rID int not null,mID int not null, stars int not null, ratingDate date not null,check(stars<=5 and stars>=1),foreign key(rID) references reviewer(rID) on delete cascade,foreign key(mID) references movie(mID) on delete cascade,primary key(rID,mID));
insert into movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into movie values(105, 'Titanic', 1997, 'James Cameron');
insert into movie values(106, 'Snow White', 1937, 'Americano');
insert into movie values(107, 'Avatar', 2009, 'James Cameron');
insert into movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');
insert into movie values(109, 'Windows on the World', 2019,'Michael D. Olmos');
insert into reviewer values(201, 'Sarah Martinez');
insert into reviewer values(202, 'Daniel Lewis');
insert into reviewer values(203, 'Brittany Harris');
insert into reviewer values(204, 'Mike Anderson');
insert into reviewer values(205, 'Chris Jackson');
insert into reviewer values(206, 'Elizabeth Thomas');
insert into reviewer values(207, 'James Cameron');
insert into reviewer values(208, 'Ashley White');
insert into reviewer values(209, 'Evan Otto');
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
insert into rating values(208, 104, 3, '2011-01-02');

-- Problem 1
select title from movie where title like 'W%';

-- Problem 2
select name from reviewer where name like '%o'; 

-- Problem 3
select title ,year from movie order by year asc; 

-- Problem 4 --
select title from movie where mID in (select * from(select mID from rating group by mID order by max(stars) desc limit 10) as t1)order by title;

-- Problem 5 --
select title from movie,rating where director='Americano' and rating.mID=movie.mID and stars>4;

-- Problem 6
select movie.mID,title from movie left outer join rating on rating.mID=movie.mID where rID is null;

-- Problem 7
select name from rating right outer join reviewer on rating.rID=reviewer.rID where stars is null; 

-- Problem 8
select director from movie group by director having count(director)>1; 

-- Problem 9
select title,times_watched from movie,(select mID,count(mID) from rating group by mID having count(mID)>1) as tb2(mID,times_watched) where tb2.mID=movie.mID; 

-- Problem 10
select count(stars) as movies,stars from rating group by stars having stars in(4,5);

-- Problem 11
select title,stars from movie,(select mID,max(stars) from rating group by mID) as tb2(mID,stars) where movie.mID=tb2.mID order by title;

-- Problem 12
select title,rating_spread from movie,(select mID,max(stars)-min(stars) from rating group by mID) as tb2(mID,rating_spread) where movie.mID=tb2.mID order by rating_spread desc,title;

-- Problem 13
select title from rating,movie where stars in (select max(stars) from rating) and rating.mID=movie.mID;

-- Problem 14 --
select distinct title from rating,movie where stars >= (select max(stars) from rating where rID=205) and rating.mID=movie.mID;

-- Problem 15
select movie.mid,title from movie,(select mID,count(mID) from rating group by mID having count(mID)>0) as tb2(mID,times_watched) where tb2.mID=movie.mID and times_watched in (select max(times_watched) from (select mID,count(mID) from rating group by mID having count(mID)>0) as tb2(mID,times_watched)); 

drop database movies;