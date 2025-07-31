# 🎓 EduLens: Uncovering Patterns Behind Student Performance

A complete SQL-based analytics project exploring academic performance data to extract actionable insights and drive equitable education strategies.

---

## 📌 Project Overview

This project analyzes student performance data using **MySQL**, focusing on how factors like gender, parental education, lunch type, and test preparation influence academic outcomes. Through structured SQL queries and Excel visualizations, we derive insights that can support educators in making informed, data-driven decisions.

---

## 🎯 Objectives

- Identify trends and gaps in student performance across demographics
- Highlight at-risk student groups using clear performance bands
- Provide data-backed recommendations for academic support planning

---

## 🛠 Tools Used

- **MySQL** – Core tool for writing and executing analytical SQL queries
- **Excel** – Used for calculations, pivot tables, and chart creation
- **PowerPoint** – Final insight reporting and presentation design

---

## 📊 Business Questions Explored

1. **Gender-wise Academic Performance**  
   _How does academic performance vary across genders?_

2. **Failure Rate in Math by Gender and Test Preparation**  
   _What is the failure rate in math based on gender and test prep status?_

3. **Academic Performance by Lunch Type**  
   _Is there a performance difference between students with standard lunch vs. free/reduced lunch?_

4. **Ranking Student Performance by Parental Education Level**  
   _How does parental education level influence student outcomes?_

5. **High-Achieving Students: 90+ in All Subjects**  
   _How many students scored above 90 in all three subjects?_

6. **Student Performance Bands Based on Percentile Ranking**  
   _What is the percentile rank distribution of students based on total scores?_

7. **Students at Risk of Failing (Scores Between 38–40)**  
   _How many students are on the edge of failing, and in which subjects?_

---

## 🧹 Data Audit & Cleaning

Before analysis, the dataset was prepared through the following steps:

- Verified row counts and column names  
- Checked for nulls and duplicates  
- Standardized categorical fields (e.g., parental education, lunch type)  
- Ensured score ranges were within acceptable bounds (0–100)  
- Flagged borderline and failing students using derived columns

---

## 🔍 Key Insights

- **Females** scored higher in reading/writing, while **males** slightly led in math.
- **Test preparation** had a clear positive impact on math scores across genders.
- Students with **standard lunch** consistently outperformed those with free/reduced lunch.
- **Parental education** strongly correlated with student performance, especially at advanced levels.
- Only a small percentage of students scored above 90 in all subjects — with a majority being female.
- Over half of students fell into **bottom performance bands**, indicating a wide performance gap.
- **Math** had the highest number of borderline failing students, requiring urgent attention.

---

## ✅ Recommendations

- Launch early support programs for students at risk of failing in math  
- Expand access to test preparation, especially for underserved groups  
- Provide nutritional support for students on free/reduced lunch  
- Design mentorship and learning interventions based on parental education levels  
- Recognize and reward top performers through scholarships and enrichment opportunities

---

## 📂 Deliverables

| File | Description |
|------|-------------|
| `student_performance_analysis.sql` | All SQL queries grouped by business question |
| `Student_performance_Analysis.pdf` | Complete project report with charts and insights |


---

## 👩‍💻 Author

**Likhitha Marrapu**  
📍 M.S. in Data Science | Kent State University  
🔗 [LinkedIn](https://www.linkedin.com/in/likhitha-marrapu-9964001b4) | 📧 likhithamarrapu@gmail.com

---

## ⭐ Final Note

This project is a reflection of how SQL can be used not just for querying data, but for uncovering patterns that drive real-world academic improvement. Feedback and collaboration are welcome!
