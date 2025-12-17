CREATE DATABASE metabolic_syndrome;
USE metabolic_syndrome;
CREATE TABLE metabolic_syndrome_cleaned
		(
            seqn INT PRIMARY KEY,
            age INT,
            Sex VARCHAR (20),
            Marital VARCHAR (25),
            Income INT,
            Race VARCHAR (25),
            WaistCirc FLOAT,
            BMI FLOAT,
            Albuminuria INT,
            UrAlbCr FLOAT,
            UricAcid FLOAT,
            BloodGlucose INT,
            HDL INT,
            Triglycerides INT,
            MetabolicSyndrome INT
		);
SELECT * FROM metabolic_syndrome_cleaned;

-- Filter individuals with Age > 50
SELECT * FROM metabolic_syndrome_cleaned
WHERE age > 50;

-- Sort by BloodGlucose descending
SELECT * FROM metabolic_syndrome_cleaned
ORDER BY BloodGlucose DESC;

-- Count total cases with MetabolicSyndrome = 1
SELECT COUNT(*) 
FROM metabolic_syndrome_cleaned
WHERE MetabolicSyndrome = 1;

-- Average WaistCirc by Sex
SELECT Sex, AVG(WaistCirc) AS Avg_WaistCirc 
FROM metabolic_syndrome_cleaned
GROUP BY Sex;

-- Average BMI by Race
SELECT Race, AVG(BMI) AS Avg_BMI 
FROM metabolic_syndrome_cleaned
GROUP BY Race;

-- Compare BloodGlucose by Income group
SELECT 
    CASE
        WHEN Income <= 2000 THEN 'Low Income'
        WHEN Income BETWEEN 2001 AND 5000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS IncomeGroup,
    AVG(BloodGlucose) AS AvgBloodGlucose
FROM metabolic_syndrome_cleaned
GROUP BY IncomeGroup
ORDER BY 2 DESC;

-- Group by Race → Mean BMI
SELECT Race, AVG(BMI)
FROM metabolic_syndrome_cleaned
GROUP BY Race;

-- Group by Sex → Mean BloodGlucose according to their Race
SELECT Sex, Race, AVG(BloodGlucose) 
FROM metabolic_syndrome_cleaned
GROUP BY 1,2
ORDER BY 2;

-- Group by Marital → Count of MetabolicSyndrome
SELECT Marital,
       SUM(CASE WHEN MetabolicSyndrome = 1 THEN 1 ELSE 0 END) AS syndrome_count
FROM metabolic_syndrome_cleaned
GROUP BY Marital;

-- Rank individuals by BloodGlucose within each Race group
SELECT * FROM
(SELECT 
		Race,
        BloodGlucose,
        RANK() OVER(PARTITION BY Race ORDER BY BloodGlucose DESC) AS Glucose_Rank
FROM metabolic_syndrome_cleaned) Rank_Wise_Risk
WHERE Glucose_RANK <=5;

-- Find top 10 highest triglyceride values per Sex
SELECT * FROM
(SELECT
		Sex,
        Triglycerides,
        RANK() OVER(PARTITION BY Sex ORDER BY Triglycerides DESC) AS Triglyceride_Rank
FROM metabolic_syndrome_cleaned) Triglyceride_Risk
WHERE Triglyceride_Rank <= 10;