-- SQL-Driven Analysis of Student Performance: Insights from Academic Trends & Risk Factors

-- -- Description: This SQL script contains all business questions and queries used to extract insights from the student performance dataset.
USE student_database;

CREATE TABLE student_performance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    gender VARCHAR(10),
    race_ethnicity VARCHAR(20),
    parental_education VARCHAR(50),
    lunch VARCHAR(20),
    test_preparation_course VARCHAR(20),
    math_score INT,
    reading_score INT,
    writing_score INT
);
-- Data Cleaning & Audit
-- 1.Total Row Count
SELECT COUNT(*) AS total_rows FROM student_performance;
-- 2.Check for NULLS in any of the column
SELECT 
  SUM(gender IS NULL) AS gender_nulls,
  SUM(race_ethnicity IS NULL) AS race_nulls,
  SUM(parental_education IS NULL) AS parental_edu_nulls,
  SUM(lunch IS NULL) AS lunch_nulls,
  SUM(test_preparation_course IS NULL) AS test_prep_nulls,
  SUM(math_score IS NULL) AS math_nulls,
  SUM(reading_score IS NULL) AS reading_nulls,
  SUM(writing_score IS NULL) AS writing_nulls
FROM student_performance;
-- 3.Check for any duplicate records
SELECT 
    gender, race_ethnicity, parental_education, lunch,
    test_preparation_course, math_score, reading_score, writing_score,
    COUNT(*) AS count
FROM student_performance
GROUP BY 
    gender, race_ethnicity, parental_education, lunch,
    test_preparation_course, math_score, reading_score, writing_score
HAVING COUNT(*) > 1;

-- 4.Score range validation

SELECT 
  MIN(math_score) AS min_math, MAX(math_score) AS max_math,
  MIN(reading_score) AS min_reading, MAX(reading_score) AS max_reading,
  MIN(writing_score) AS min_writing, MAX(writing_score) AS max_writing
FROM student_performance;

-- 5. Categorical Value Review

SELECT DISTINCT gender FROM student_performance;
SELECT DISTINCT race_ethnicity FROM student_performance;
SELECT DISTINCT parental_education FROM student_performance;
SELECT DISTINCT lunch FROM student_performance;
SELECT DISTINCT test_preparation_course FROM student_performance;
-- 6.Find any zero scores(potential outliers)
SELECT * 
FROM student_performance
WHERE math_score = 0 OR reading_score = 0 OR writing_score = 0;


-- Business Problems:

-- 1.Gender-wise Academic Performance
SELECT 
    gender,
    ROUND(AVG(math_score), 2) AS avg_math_score,
    ROUND(AVG(reading_score), 2) AS avg_reading_score,
    ROUND(AVG(writing_score), 2) AS avg_writing_score
FROM 
    student_performance
GROUP BY 
    gender;
    

    
          
-- 2.Failure Rate in Math by Gender and Test Preparation

SELECT 
    gender,
    test_preparation_course,
    COUNT(*) AS total_students,
    SUM(CASE WHEN math_score < 40 THEN 1 ELSE 0 END) AS num_failed,
    ROUND(
        SUM(CASE WHEN math_score < 40 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS failure_percentage
FROM 
    student_performance
GROUP BY 
    gender, test_preparation_course
ORDER BY 
    failure_percentage DESC;
    
-- 3.Academic Performance by Lunch Type

SELECT 
    lunch,
    COUNT(*) AS total_students,
    ROUND(AVG(math_score), 2) AS avg_math,
    ROUND(AVG(reading_score), 2) AS avg_reading,
    ROUND(AVG(writing_score), 2) AS avg_writing
FROM 
    student_performance
GROUP BY 
    lunch
ORDER BY 
    lunch;
    
-- 4.Ranking Student Performance by Parental Education Level

SELECT 
    parental_education,
    ROUND(AVG(math_score + reading_score + writing_score), 2) AS avg_total_score,
    RANK() OVER (
        ORDER BY AVG(math_score + reading_score + writing_score) DESC
    ) AS education_rank
FROM 
    student_performance
GROUP BY 
    parental_education
ORDER BY 
    education_rank;
    
-- 5.High-Achieving Students: 90+ in All Subjects

SELECT 
    gender,
    COUNT(*) AS top_performers
FROM 
    student_performance
WHERE 
    math_score > 90 
    AND reading_score > 90 
    AND writing_score > 90
GROUP BY gender;

-- 6.Student Performance Bands Based on Percentile Ranking

WITH scored_students AS (
    SELECT gender,parental_education,(math_score + reading_score + writing_score) AS total_score,
        PERCENT_RANK() OVER (ORDER BY (math_score + reading_score + writing_score)) AS percentile_rank
    FROM student_performance
)
SELECT 
    CASE 
        WHEN percentile_rank >= 0.9 THEN 'Top 10%'
        WHEN percentile_rank >= 0.75 THEN 'Top 25%'
        WHEN percentile_rank >= 0.5 THEN 'Top 50%'
        WHEN percentile_rank >= 0.25 THEN 'Bottom 50%'
        ELSE 'Bottom 25%'
    END AS performance_band,
    COUNT(*) AS num_students
FROM scored_students GROUP BY performance_band ORDER BY 
FIELD(performance_band, 'Top 10%', 'Top 25%', 'Top 50%', 'Bottom 50%', 'Bottom 25%');

-- 7.Students at Risk of Failing (Score: 38–40)

SELECT 
    'Math' AS subject,
    COUNT(*) AS borderline_students
FROM student_performance
WHERE math_score BETWEEN 38 AND 40

UNION ALL

SELECT 
    'Reading',
    COUNT(*) 
FROM student_performance
WHERE reading_score BETWEEN 38 AND 40

UNION ALL

SELECT 
    'Writing',
    COUNT(*) 
FROM student_performance
WHERE writing_score BETWEEN 38 AND 40;

