/*
Question: What are the top paying Data Analyst jobs?
*/
SELECT
    job_title_short,
    job_location,
    salary_year_avg,
    name AS company_name

FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

SELECT*
FROM
    skills_dim

SELECT*
FROM
    job_postings_fact
LIMIT 50

SELECT*
FROM
    skills_job_dim
LIMIT 50