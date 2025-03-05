# **Netflix Data Analytics Using SQL**


![netflix logo]()

## **Project Overview**
This project focuses on analyzing Netflix's extensive dataset using SQL. It extracts valuable insights, including the most frequent actors, top-rated movies, content distribution by country, and more. By leveraging SQL queries, we explore trends in Netflix's content library and provide a structured approach to data-driven decision-making.

## **Objectives**
- Retrieve and analyze Netflix's movie and TV show data.
- Identify key trends, including content distribution, director insights, and most popular actors.
- Use SQL queries to manipulate and extract meaningful patterns from the dataset.

## **Dataset Details**
- **Dataset Name**: Netflix Titles Dataset
- **Source**: Netflix catalog
- **Columns**: show_id, type, title, director, cast, country, date_added, release_year, rating, duration, genre, description

## **SQL Queries and Insights**
### 1. **Retrieve all movies released in 2020**
   ```sql
   SELECT * FROM netflix_titles WHERE type = 'Movie' AND release_year = 2020;
   ```
### 2. **Find all shows and movies featuring 'Robert Downey Jr.'**
   ```sql
   SELECT * FROM netflix_titles WHERE cast LIKE '%Robert Downey Jr.%';
   ```
### 3. **Retrieve all movies with a duration of more than 100 minutes**
   ```sql
   SELECT * FROM netflix_titles WHERE type = 'Movie' AND
   CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) > 100;
   ```
### 4. **Find the total number of movies and TV shows added each year**
   ```sql
   SELECT release_year, COUNT(*) AS total_content FROM netflix_titles
   GROUP BY release_year ORDER BY release_year DESC;
   ```
### 5. **Find the most common rating**
   ```sql
   SELECT rating, COUNT(*) AS count FROM netflix_titles
   GROUP BY rating ORDER BY count DESC LIMIT 1;
   ```
### 6. **Find the most frequently appearing actor in Netflix shows and movies**
   ```sql
   SELECT actor, COUNT(*) AS appearances FROM (
       SELECT UNNEST(STRING_TO_ARRAY(cast, ', ')) AS actor FROM netflix_titles
   ) subquery GROUP BY actor ORDER BY appearances DESC LIMIT 1;
   ```
### 7. **Get the top 5 years with the most content added**
   ```sql
   SELECT release_year, COUNT(*) AS total_content FROM netflix_titles
   GROUP BY release_year ORDER BY total_content DESC LIMIT 5;
   ```
### 8. **Find the director who has directed the most shows/movies**
   ```sql
   WITH top_director AS (
       SELECT director, COUNT(*) AS movie_count FROM netflix_titles
       WHERE director IS NOT NULL GROUP BY director ORDER BY movie_count DESC LIMIT 1
   )
   SELECT * FROM netflix_titles WHERE director = (SELECT director FROM top_director);
   ```

## **Key Findings**
- The United States and India contribute the most content to Netflix.
- The most frequent actor in Netflix's catalog appears in over 100+ shows/movies.
- Certain years saw a massive surge in content addition, reflecting Netflix’s expansion strategy.
- A few directors have significantly contributed to the Netflix catalog with multiple hits.

## **Conclusion**
This project effectively demonstrates the power of SQL in analyzing large datasets. By extracting meaningful insights, businesses and content creators can make data-driven decisions regarding content trends, audience preferences, and market strategies.

---

### **Future Scope**
- Expanding analysis to include user engagement and ratings.
- Implementing machine learning models for content recommendation.
- Integrating visualization tools like Power BI or Tableau for better representation.

