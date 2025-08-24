/*
Question: What are the optimal skills to learn? aka high demand & high paying job.
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.skill_id) AS job_demand,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.skill_id) > 10

ORDER BY
    salary DESC,
    job_demand DESC -- used two sorting to break tie
LIMIT 10;

SELECT
    *
FROM
skills_job_dim
LIMIT 10;