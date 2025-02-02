create database netflix_db;
use netflix_db;
drop table netflix;
CREATE TABLE netflix
(
 show_id  varchar(6),
 type	  varchar(10),
 title	  varchar(150),
 director varchar(210),
 casts	  varchar(1000),
 country	varchar(150),
 date_added	varchar(50),
 release_year	int,
 rating	varchar(10),
 duration	varchar(15),
 listed_in	varchar(100),
 description varchar(250)
)
select * from netflix; 
select count(*) as total_count from netflix;

-- 10 Business Problems to solve
select * from netflix;

-- 1. Count the number of Movies vs TV Shows
select type , count(*) as total_count from netflix group by type;

-- 2. List all the movies realeased in a specific year (e.g. 2020)
select * from netflix 
where type ="Movie" and release_year = 2020;

-- 3. Find the longest movie
select * from netflix
where type = "Movie" and 
duration =(select max(duration) from netflix);

-- 4. Find the content added in the last four years
SELECT * FROM netflix 
WHERE DATEDIFF(CURDATE(), STR_TO_DATE(date_added, '%M %d, %Y')) <= 1460;

-- 5. Find all the movies/ TV show directed by Masahiko Murata
SELECT * FROM netflix
where director like '%Masahiko Murata%';

-- 6. Find all TV show with more than 4 seasons  
SELECT * FROM netflix 
WHERE type = 'TV Show' AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 4;

-- 7. Find the number of content from India 

select count(*) as total_content from netflix
where country = "India";

-- 8. Find all the movies that are documentaries

select * from netflix 
where listed_in like "%documentaries%";

-- 9. Find all the content without a director

select * from netflix where director is null;

-- 10. Find the number movies/Tv Shows between 2000 to 2020

select count(*) as total_no from netflix
where release_year between 2000 and 2020;



 



