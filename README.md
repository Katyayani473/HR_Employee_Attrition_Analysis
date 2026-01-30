# HR Employee Attrition Analysis

## Project Overview 
Employee attrition is a major challenge for HR departments across industries. High attrition increases hiring costs, slows productivity, and affects team stability.
To understand the root causes of employee attrition, an interactive Power BI dashboard was developed. This dashboard helps HR identify patterns, analyze different factors, and make data-driven decisions.
The company is facing increased employee turnover. However, HR lacks a consolidated system to analyze:
-	Which departments have high attrition
-	Whether salary, overtime, or hike percentage impacts employee exit
-	How gender and work conditions influence attrition
The goal is to build a dashboard that gives clear insights and helps management reduce attrition.

##  🎯 Business Problem
Employee attrition is a major challenge for organizations, leading to increased hiring costs,loss of productivity, and reduced team stability. The company is experiencing high employee
turnover but lacks a consolidated system to analyze the key factors driving attrition.
This project aims to identify patterns and root causes of employee attrition across departments,
salary levels, job roles, overtime, satisfaction levels, and work conditions, enabling HR teams
to take data-driven actions to improve employee retention.

---

## 🎯 Business Objectives
- Identify departments with high employee attrition
- Analyze the impact of salary, overtime, and salary hikes on attrition
- Understand how age, gender, and job roles influence attrition
- Study the relationship between satisfaction levels and employee exits
- Provide actionable insights to reduce attrition and improve retention

---

## 🗂 Dataset Summary
- **Rows:** 1,470  
- **Columns:** 35  

**Key Columns:**
Age, Attrition, BusinessTravel, Department, DistanceFromHome, EducationField,  
Gender, JobRole, MonthlyIncome, OverTime, PercentSalaryHike,  
EnvironmentSatisfaction, RelationshipSatisfaction, WorkLifeBalance,  
YearsAtCompany, YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager

---

## 🛠 Tools & Technologies Used
- **SQL** – Data analysis and querying  
- **Power BI** – Dashboard creation and visualization  
- **DAX** – KPI calculations and measures  

---

## 📌 Business Problems and SQL Analysis
### Table creation
```Sql
create table HR_Data(
Age int,
Attrition varchar(10),	
BusinessTravel	varchar(30),
DailyRate	int,
Department	varchar(50),
DistanceFromHome int,	
Education	int,
EducationField	varchar(70),
EmployeeCount	int,
EmployeeNumber	int,
EnvironmentSatisfaction int,
Gender 	varchar(10),
HourlyRate	int,
JobInvolvement int,
JobLevel int,
JobRole	varchar(50),
JobSatisfaction	int,
MaritalStatus	varchar(10),
MonthlyIncome	int,
MonthlyRate	int,
NumCompaniesWorked	 int,
Over18	varchar(10),
OverTime	varchar(10),
PercentSalaryHike	int,
PerformanceRating	int,
RelationshipSatisfaction int,
StandardHours	int,
StockOptionLevel	int,
TotalWorkingYears	int,
TrainingTimesLastYear int,
WorkLifeBalance	int,
YearsAtCompany	int,
YearsInCurrentRole	int,
YearsSinceLastPromotion int,
YearsWithCurrManager int
);
```
---
## Data Loading
```sql
LOAD DATA INFILE 'E:/DA/projects/p1/HR_Analytics/WA_Fn-UseC_-HR-Employee-Attrition.csv'
INTO TABLE HR_Data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
```
---

## 1.Total Employees
```sql
select count(*) from HR_Data
```
 
## 2.which age category has high attrition?
```sql
select 
count(case when Age Between 18 and 24 then 1  end)as Young,
count(case when Age Between 25 and 31 then 1  end)as Young_Adult,
count(case when Age Between 32 and 38 then 1  end)as Middle_Aged_Adult,
count(case when Age Between 39 and 45 then 1  end)as Old_Aged_Adult,
count(case when Age Between 46 and 52 then 1  end)as Senior,
count(case when Age Between 53 and 60 then 1  end)as Supersenior
from HR_Data where attrition='Yes'
```

### 3.Avg age of employee who are leaving the company
```sql
select avg(Age) as Avg_age from HR_Data where Attrition='Yes'
```
  
### 4.Total emp who are leaving
```sql
select count(*) as Total_emp from HR_Data where attrition='Yes'
```
   
### 5.Does travelling effect attrition?
```sql
select BusinessTravel,count(Attrition) as Total 
from HR_Data where Attrition='yes' 
group by BusinessTravel order by Total desc;
```
 
## 6.which department has high attrition?
```sql
select Department,count(Attrition) as Total 
from HR_Data where Attrition='yes' 
group by department order by Total desc;
```
 
## 7.Does distance effect attrition?
```sql
select 
count(case when DistanceFromHome Between 1 and 5 then 1  end)as L0,
count(case when DistanceFromHome Between 6 and 10 then 1  end)as L1,
count(case when DistanceFromHome Between 11 and 15 then 1  end)as L2,
count(case when DistanceFromHome Between 16 and 20 then 1  end)as L3,
count(case when DistanceFromHome Between 21 and 25 then 1  end)as L4
count(case when DistanceFromHome Between 26 and 30 then 1  end)as L5
from HR_Data where attrition='Yes'
```

## 8.which background people are leaving?
```sql
SELECT EducationField, COUNT(*) as Total
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY EducationField;
```
 
## 9.Does Emp satisfy with environment?
```sql
SELECT EnvironmentSatisfaction, COUNT(*) as Total
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY EnvironmentSatisfaction order by total desc;
```
 
## 10.which gender is leaving more?
```sql
select Gender,count(*) as Total 
from HR_Data  where Attrition='yes'
group by Gender order by Total desc;
```
 
## 11.which JobRole are leaving?
```sql
select JobRole,count(Attrition) as Total 
from HR_Data where Attrition='yes' 
group by JobRole order by Total desc;
```

## 12.Does salary is affecting?
```sql
select 
count(case when Monthlyincome<5000 then 1  end)as L0,
count(case when Monthlyincome Between 5001 and 10000 then 1  end)as L1,
count(case when Monthlyincome Between 10001 and 15000 then 1  end)as L2,
from HR_Data where attrition='Yes';
```
 
## 13.PercentSalaryHike vs Attrition
```sql
select 
count(case when PercentSalaryHike<15 then 1  end)as L0,
count(case when PercentSalaryHike Between 15 and 20 then 1  end)as L1,
count(case when NumCompaniesWorked>20 then 1 end)as L2
from HR_Data where attrition='Yes';
```
 
## 14.relationshipSatisfaction vs Attrition
```sql
SELECT relationshipSatisfaction, COUNT(*) as Total
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY relationshipSatisfaction  order by total desc ;
```

 ## 7. Dashboard Components
KPI Cards
-	Total Employees
-	Attrition Count
-	Attrition Rate
Visuals Used
1.	Gender-wise Attrition (Pie Chart)
2.	Department-wise Attrition (Treemap)
3.	Salary Category-wise Attrition (Bar Chart)
4.	Hike Category Trend (Ribbon Chart)
5.	OverTime vs Attrition (Donut Chart)
6.	Environment Satisfaction (Bar Chart)
Slicers
-	Age_Category
-	Department
-	RelationshipStatus
## 8. Key Dashboard Insights
1. High Attrition in Sales Department
Research&Development has the highest number of employees leaving the company.
2. Salary is the major factor
Employees with Low Salary show the maximum attrition.
3. Overtime employees leave more
OverTime = "Yes" category shows significantly higher attrition.
4. Hike Category Trends
Employees with:
•	Less Hike → highest attrition
•	Normal Hike → moderate
•	High Hike → lowest attrition
5. Gender Insights	
Male employees show slightly higher attrition than female employees.
6. Environment Satisfaction Impact
Employees with low satisfaction scores have higher chances of leaving.

## 9. Conclusion
The HR Attrition Analysis Dashboard provides a clear understanding of employee turnover.
By analyzing salary, department, hike percentage, overtime, and satisfaction levels, management can take preventive measures to reduce attrition.
This dashboard can be updated regularly and used by HR teams for better workforce planning.

 
## 10.Recommendations
Revise salary bands, especially for low-salary employees, to reduce high attrition.
1.	Reduce overtime workload by optimizing staffing and balancing tasks.
2.	Provide better hike percentages for consistent and high performers.
3.	Focus on high-attrition departments like Sales and R&D with targeted retention strategies.
4.	Improve work environment satisfaction through engagement programs, flexible policies, and employee support initiatives.







