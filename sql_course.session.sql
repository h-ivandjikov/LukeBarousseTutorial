SELECT union_table.job_id,
    skills_dim.skills,
    skills_dim.type,
    salary_year_avg
FROM (
        SELECT job_id,
            salary_year_avg
        FROM jobs_jan
        WHERE salary_year_avg > 70000
        UNION ALL
        SELECT job_id,
            salary_year_avg
        FROM jobs_feb
        WHERE salary_year_avg > 70000
        UNION ALL
        SELECT job_id,
            salary_year_avg
        FROM jobs_mar
        WHERE salary_year_avg > 70000
    ) AS union_table
    LEFT JOIN skills_job_dim ON union_table.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;