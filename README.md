# **Netflix Data Analytics Using SQL**

## **Project Description**
This project analyzes Netflix’s dataset using SQL to extract valuable insights, including:
- Most frequently appearing actors
- Movies and TV shows distribution by country
- Most common content ratings
- Longest movies and TV shows
- Year-wise content addition trends

## **Dataset**
- **Source**: Netflix Titles Dataset
- **Columns**: show_id, type, title, director, cast, country, date_added, release_year, rating, duration, genre, description

## **Technologies Used**
- SQL (PostgreSQL / MySQL)
- Data Cleaning & Transformation
- Aggregate Functions & Joins

## **Key SQL Queries**
- **Movies released in 2020**
  ```sql
  SELECT * FROM netflix_titles WHERE type = 'Movie' AND release_year = 2020;
  ```
- **Top 5 years with the most content added**
  ```sql
  SELECT release_year, COUNT(*) AS total_content FROM netflix_titles
  GROUP BY release_year ORDER BY total_content DESC LIMIT 5;
  ```

## **How to Use the Project**
1. Download the Netflix dataset.
2. Import it into an SQL database (PostgreSQL, MySQL, etc.).
3. Run the provided queries to analyze the data.

## **How to Share on LinkedIn**
1. **Write a Post**
   - Briefly introduce the project and its insights.
   - Mention the SQL queries used.
   - Share your learnings from the project.
2. **Attach Files**
   - Upload the `project.sql` file containing the SQL queries.
   - Attach key result screenshots if possible.
3. **Use Hashtags**
   - #SQL #DataAnalytics #NetflixAnalysis #DataScience #PostgreSQL #MySQL
4. **Tag People**
   - Tag mentors, peers, or professionals who might find it interesting.

## **Future Enhancements**
- Adding data visualization using Tableau or Power BI.
- Performing sentiment analysis on Netflix reviews.
- Building a recommendation system for Netflix content.

### **Author**
**[Kashif]** - Data Analyst Enthusiast



