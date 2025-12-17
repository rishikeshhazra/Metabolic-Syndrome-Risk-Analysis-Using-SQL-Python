🧬 Metabolic Syndrome Risk Analysis Using SQL & Python
📌 Project Overview

This project focuses on the analysis of metabolic syndrome risk factors using a real-world healthcare dataset. The study combines SQL-based querying and Python-driven exploratory data analysis (EDA) to clean, analyze, visualize, and derive meaningful cardiometabolic risk insights.

A rule-based risk scoring system was developed using established clinical thresholds for obesity, dyslipidemia, glucose levels, and waist circumference to categorize individuals into different risk levels.

👤 Author

Rishikesh Hazra
Pharmacy graduate with interest in healthcare data analytics

📊 Dataset Details

Source: OpenDataBay (Healthcare Dataset)

Records: 2,401 rows

Features: 15 columns

Format: CSV

Description:
The dataset includes demographic variables (age, sex, race, marital status), anthropometric measures (BMI, waist circumference), biochemical markers (blood glucose, HDL, triglycerides, uric acid), and metabolic syndrome status.

Raw data contained missing values and duplicate records, which were handled during preprocessing.

🛠 Tools & Technologies

SQL: MySQL

Python: 3.12.10

Libraries Used:

Pandas

NumPy

Matplotlib

📁 Project Structure
├── Metabolic_Syndrome.csv
├── Metabolic_Syndrome_Cleaned.csv
├── Metabolic_Syndrome_RiskScores.csv
├── SQL_queries.sql
├── Analysis.ipynb

🔍 Data Cleaning & Preprocessing

Removed missing values using Pandas

Identified and handled duplicate records

Generated cleaned dataset for downstream analysis

Performed statistical summaries for numerical features

Detected and visualized BMI outliers using the IQR method

🧠 Exploratory Data Analysis (EDA)

The following analyses were conducted using Python and Matplotlib:

Distribution of BMI using histograms

Sex-wise comparison of metabolic syndrome prevalence

Race-wise distribution using pie charts

BMI and waist circumference outlier detection via box plots

Relationships between:

BMI and blood glucose

Triglycerides and HDL levels

Waist circumference and metabolic syndrome status

🧮 SQL Analysis

SQL was used to perform structured queries such as:

Filtering individuals based on age thresholds

Sorting patients by blood glucose levels

Counting metabolic syndrome cases

Grouping and aggregating data by sex, race, income, and marital status

Ranking individuals within demographic groups using window functions

Example SQL Query:

SELECT Sex, AVG(WaistCirc) AS Avg_WaistCirc
FROM metabolic_syndrome_cleaned
GROUP BY Sex;

⚠️ Risk Score Development

A cardiometabolic risk score was created using clinical cut-offs:

Risk Factor	Criteria
BMI	≥ 30
Blood Glucose	≥ 100 mg/dL
Triglycerides	≥ 150 mg/dL
HDL	< 40 (Male), < 50 (Female)
Waist Circumference	≥ 102 cm (Male), ≥ 88 cm (Female)

Each risk factor contributes 1 point to the total risk score.

Risk Level Classification
Risk Score	Category
0	No Risk
1–2	Low Risk
3–4	Moderate Risk
≥5	High Risk
📈 Key Outcomes

Cleaned and processed real-world healthcare data

Identified strong associations between obesity, glucose levels, and metabolic syndrome

Demonstrated combined use of SQL and Python for healthcare analytics

Built an interpretable rule-based cardiometabolic risk scoring model

Visualized risk distribution across demographic groups

🚀 Future Scope

Apply machine learning models for risk prediction

Add SQL views and stored procedures

Expand analysis with longitudinal data

Deploy insights using dashboards (Power BI / Tableau)
