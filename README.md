
# Exam Score Factor Analysis Using SQL
This SQL project analyses factors that may influence students’ academic performance, with a focus on sleep quality, sleep duration, and internet access.

---

## Objectives:
- Analyse the impact of sleep and internet access on students' academic performance using SQL
-Demonstrate practical SQL skills, including joins, conditional logic, aggregation, and custom sorting

---

## Data Sources:
The data was originally sourced from Kaggle and cleaned using Excel.  
The dataset was split into two tables to demonstrate the use of JOIN operations in SQL.
- **Exam_score_prediction**
- **Sleep_quality**

---

## Data Preparation
- Removed duplicate data using Excel (none was found)
- Split the raw dataset into two CSV files
- Imported the cleaned data into a SQL database

---

## SQL Techniques Used
- `SELECT`, `WHERE`, `ORDER BY`
- `LEFT JOIN`
- `CASE WHEN` for data grouping
- Aggregate functions (`AVG`, `MAX`, `MIN`)
- `GROUP BY`
- Custom sorting using mapping tables
- SQL comments for documentation and interpretation

---

## Analysis Steps

### 1. Data Exploration
- Reviewed both tables to understand structure and values
- Identified the minimum and maximum sleep hours

### 2. Sleep Duration Grouping
Sleep hours were categorised into groups:
- 4–5 hours
- 6–7 hours
- 8 hours or more  

This allows clearer comparison between sleep duration and exam scores.

### 3. Sleep Quality Analysis
- Joined exam scores with sleep quality
- Calculated average exam scores by sleep quality and exam difficulty as to control for the potential impact of exam difficulty on scores
- Created sorting order mapping tables to ensure meaningful result ordering

### 4. Internet Access Analysis
- Compared average exam scores of students with and without internet access
- Grouped binary values into readable categories (Yes / No)

---

## Key Findings
- Students with **better sleep quality** tend to achieve **higher average exam scores**
- Longer sleep duration shows a positive association with academic performance
- **Internet access alone** does not appear to be a significant factor in exam performance, as average scores are similar

> Note: The analysis identifies associations, not cause-and-effect relationships.

---

## Future Improvements
- Visualise results using charts (e.g. line charts to see the trend)
- Include additional factors such as attendance or stress level
- Convert frequently used queries into SQL views
- Perform statistical testing to support findings

---

## Tools
- SQL Server Management Studio (SSMS)
- Microsoft Excel

