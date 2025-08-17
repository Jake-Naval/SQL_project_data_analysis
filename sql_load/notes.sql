/* this is multi line comments:
 this is absoulutely my first SQL experience
*/

/* And this is how you should write commands in order 
SELECT column1, column2,...
FROM/JOIN table_name
WHERE condition filters rows by condition
GROUP BY column used to group rows properly to use aggregate function
HAVING condition filters groups by aggregation 
SELECT
DISTINCT removes duplicated rows from result set
ORDER BY column1 [ASC\DESC] ...
LMIT/OFFSET numbers often use for pagination
*/
/* Use with WHERE
You can also use WHERE NOT
You can use <> to remove the specific data that you type 
use BETWEEN number AND number to search the number between them but
you can also use like this >= number AND <= number
I note the IN function below that you can search more data with IN
job_title_short IN ('Data Analyst', 'Data Engineer', 'Data Scientist')
*/
/*
_ <-- this represents one single character
%blahblah% means you can search that data by using % with LIKE after WHERE and it will result anything that
include blahblah
you can also search %blahblah to find start
% means zero or more
_ means one or zero
*/
SELECT -- rows and columns select
job_title_short,
	salary_year_avg,
    job_via
FROM -- input file name after from
	job_postings_fact
WHERE -- You can find specifically by using this
	job_title_short IN ('Data Analyst', 'Data Engineer', 'Data Scientist') AND -- use AND to use two filters and you can also use OR which will excecute if one is true
    salary_year_avg > 500000 -- you need to use single quote only
ORDER BY
	salary_year_avg DESC -- you can also use ASC for accending

LIMIT 7; -- this limit columns

SELECT job_title_short AS job_title, -- AS is used to change column name
job_location AS location
FROM job_postings_fact AS jpc;


SELECT
    '2023-02-09'::DATE,
    '12345'::INTEGER,  -- ::use to change the data type 
    'True'::BOOLEAN;

SELECT
    column_name AT TIME ZONE 'UTC' AT TIME ZONE 'EST' -- this change the timezone of selected column from UTC to EST
FROM
    table_name;

SELECT
    EXTRACT(MONTH FROM column_name) AS column_name -- this only extract month from column you can also use year
FROM
    table_name;

-- January jobs
CREATE TABLE january_jobs AS --this funtion copy whole january and add all tables that that connected with January
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February jobs
CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March jobs
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT*
FROM january_jobs;

