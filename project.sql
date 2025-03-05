--Basic Queries

  -- 1. List all the unique types of content available on Netflix.
  SELECT DISTINCT 
  TYPES
  from netflix;
   -- 2.Find the total number of TV shows and movies.
   SELECT TYPES ,count(*)
   FROM netflix
   GROUP BY TYPES;
    --3.Retrieve all movies released in the year 2020.
	SELECT TYPES,title,release_year 
	FROM netflix 
	WHERE "types" = 'Movie' 
	AND release_year = 2020;
    --4.Find all shows and movies featuring "Robert Downey Jr." in their cast.
  SELECT *
  FROM netflix
  WHERE casts
  ILike '%Robert Downey Jr.%'
   
   
   --5.Get all the records where the title starts with 'The'.
   SELECT*
   FROM netflix 
   WHERE title 
   Ilike 'The%'
    --6.Find the count of records available in the dataset.
	SELECT COUNT(*) 
	AS count_of_record
	FROM netflix;
    --7.Find all records where the description contains the word 'thriller'.
	SELECT * 
	FROM netflix 
	WHERE description 
	Ilike '%thriller%';
    --8.Retrieve all movies that have a duration of more than 100 minutes.
     SELECT * 
     FROM netflix
     WHERE types = 'Movie' 
     AND duration IS NOT NULL
     AND CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) > 100;
    --9.Find all TV shows with more than 3 seasons.
      
	  SELECT title, duration  
      FROM netflix  
      WHERE types = 'TV Show'  
      AND duration IS NOT NULL  
      AND CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) > 3;

	  
--Aggregations & Grouping

    --10.Find the total number of movies and TV shows added each year.
	select release_year,
	count (*) as total_count
	from netflix 
	group by release_year
	order by release_year desc;
    --11.Count the number of unique directors in the dataset.
	select distinct count(distinct director)
	from netflix
	where director is not null;
    --12.Find the average duration of movies.
	select 
	avg(cast(split_part(duration,' ',1)as integer))as avg_duration
	from netflix
	where types = 'Movie'and 
	duration is not null;
    --13.Find the most common rating in the dataset.
	SELECT rating, COUNT(*) AS count
    FROM netflix
    WHERE rating IS NOT NULL
    GROUP BY rating
    ORDER BY count DESC
    LIMIT 1;

    --14.Get the top 5 years with the most content added.
	
	select release_year, count(*) as Total_count
	from netflix
	where release_year is not null
	group by release_year 
	order by total_count desc
	limit 5;

	

	
    --15.Find the number of movies and TV shows by country.
	select country,types, count(*) as total_count
	from netflix
	where country is not null
	group by country ,types
	order by total_count;
	

--Joins & Subqueries

    --16.Get the latest movie added on Netflix.
	select *
	from netflix
	where types = 'Movie'
	order by date_added desc
	limit 1;
	
    --17.Find the TOP five most frequently appearing actor in Netflix shows and movies.
	

	SELECT actor, COUNT(*) AS appearance_count
    FROM (
    SELECT UNNEST(STRING_TO_ARRAY(casts, ', ')) AS actor
    FROM netflix
    WHERE casts IS NOT NULL
     ) AS actor_list
    GROUP BY actor
    ORDER BY appearance_count DESC
    LIMIT 5;
	
	
    --18.Find all content directed by the director who has directed the most shows/movies.
	with top_director as ( 
	select "director", count(*) as movie_count
	from netflix
	where "director" is not null
	group by "director"
	order by movie_count desc
	limit 1)
    select*
	from netflix
	where "director" = (select "director" from top_director );
	
	
	
	
    --19.List the countries that have produced more than 50 shows/movies.
	SELECT "country", COUNT(*) AS total_content
    FROM netflix
    WHERE "country" IS NOT NULL
    GROUP BY "country"
    HAVING COUNT(*) > 50
    ORDER BY total_content DESC;

	
    --20.Retrieve the longest movie and the longest TV show by duration.
	SELECT * 
    FROM netflix_titles
    WHERE "type" = 'Movie'
    AND "duration" IS NOT NULL
    ORDER BY CAST(SPLIT_PART("duration", ' ', 1) AS INTEGER) DESC
    LIMIT 1;