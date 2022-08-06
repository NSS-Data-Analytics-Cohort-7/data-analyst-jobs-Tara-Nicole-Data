/*Question 1
How many rows are in the data_analyst_jobs table?*/

SELECT COUNT (*) 
FROM data_analyst_jobs;

--Question 1 Answer: 1793

/*Question 2
Write a query to look at just the first 10 rows. 
What company is associated with the job posting on the 10th row?*/

SELECT *
FROM data_analyst_jobs
LIMIT 10; 

--Question 2 Answer: ExxonMobil

/*Question 3a
How many postings are in Tennessee?*/

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location = 'TN'

--Question 3a Answer: 21

/*Question 3b
How many are there in either Tennessee or Kentucky?*/

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

--Question 3b Answer: 27

/*Question 4
How many postings in Tennessee have a star rating above 4?*/

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating >= '4';

--Question 4 Answer: 4

/*Question 5
How many postings in the dataset have a review count between 500 and 1000?*/

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE review_content BETWEEN 500 AND 1000;

--Question 5 Answer: 151 

/*Question 6
Show the average star rating for companies in each state. 
The output should show the state as state and the average rating for the state as avg_rating. 
Which state shows the highest average rating?*/

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY state
ORDER BY avg_rating DESC;

--Question 6 Answer: Nebraska

/*Question 7
Select unique job titles from the data_analyst_jobs table. 
How many are there?*/

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs; 

--Question 7 Answer: 881

/*Question 8
How many unique job titles are there for California companies?*/

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--Question 8 Answer: 230

/*Question 9
Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
How many companies are there with more that 5000 reviews across all locations?*/

SELECT company, AVG (star_rating) AS avg_rating
FROM data_analyst_jobs 
WHERE review_content > '5000' AND company IS NOT NULL
GROUP BY company;

--Question 9 Answer: 40

/*Question 10
Add the code to order the query in #9 from highest to lowest average star rating. 
Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
What is that rating?*/

SELECT company, AVG (star_rating) AS avg_rating
FROM data_analyst_jobs 
WHERE review_content > '5000' AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC;

--Question 10 Answer: Unilever; 4.2

/*Question 11
Find all the job titles that contain the word ‘Analyst’. 
How many different job titles are there?*/

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

--Question 11 Answer: 754

/*Question 12a
How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?*/

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' OR title NOT LIKE '%Analytics%';  

--Question 12a Answer: 881

/*Question 12b
What word do these positions have in common?*/

SELECT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' AND title NOT LIKE '%Analytics%' 
AND title NOT LIKE '%analyst%' AND title NOT LIKE '%analytics%'
AND title NOT LIKE '%ANALYST%' AND title NOT LIKE '%analytics%';

--Question 12b Answer: Tableau