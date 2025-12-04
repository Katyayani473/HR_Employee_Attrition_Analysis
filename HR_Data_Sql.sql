create database p7;
use p7;
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
EnvironmentSatisfaction	 int,
Gender	varchar(10),
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
RelationshipSatisfaction	int,
StandardHours	int,
StockOptionLevel	int,
TotalWorkingYears	int,
TrainingTimesLastYear	int,
WorkLifeBalance	int,
YearsAtCompany	int,
YearsInCurrentRole	int,
YearsSinceLastPromotion int,
YearsWithCurrManager int
);
LOAD DATA INFILE 'E:/DA/projects/p1/HR_Analytics/WA_Fn-UseC_-HR-Employee-Attrition.csv'
INTO TABLE HR_Data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from HR_Data
1.Total Employees
select count(*) from HR_Data

2.which age category has high attrition?
select 
count(case when Age Between 18 and 24 then 1  end)as Young,
count(case when Age Between 25 and 31 then 1  end)as Young_Adult,
count(case when Age Between 32 and 38 then 1  end)as Middle_Aged_Adult,
count(case when Age Between 39 and 45 then 1  end)as Old_Aged_Adult,
count(case when Age Between 46 and 52 then 1  end)as Senior,
count(case when Age Between 53 and 60 then 1  end)as Supersenior
from HR_Data where attrition='Yes'


3.Avg age of employee who are leaving the company
select avg(Age) as Avg_age from HR_Data where Attrition='Yes'

4.Total emp who are leaving
select count(*) as Total_emp from HR_Data where attrition='Yes'

5.Does travelling effect attrition?
select BusinessTravel,count(Attrition) as Total 
from HR_Data where Attrition='yes' 
group by BusinessTravel order by Total desc

6.which department has high attrition?
select Department,count(Attrition) as Total 
from HR_Data where Attrition='yes' 
group by department order by Total desc

5.Does distance effect attrition?
select 
count(case when DistanceFromHome Between 1 and 5 then 1  end)as L0,
count(case when DistanceFromHome Between 6 and 10 then 1  end)as L1,
count(case when DistanceFromHome Between 11 and 15 then 1  end)as L2,
count(case when DistanceFromHome Between 16 and 20 then 1  end)as L3,
count(case when DistanceFromHome Between 21 and 25 then 1  end)as L4,
count(case when DistanceFromHome Between 26 and 30 then 1  end)as L5
from HR_Data where attrition='Yes'

6.which background people are leaving?
SELECT EducationField, COUNT(*) as Total
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY EducationField;

7.Does Emp satisfy with environment?
SELECT EnvironmentSatisfaction, COUNT(*) as Total
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY EnvironmentSatisfaction order by total desc;

8.which gender is leaving more?
select Gender,count(*) as Total 
from HR_Data  where Attrition='yes'
group by Gender order by Total desc

9.Does JobInvolvement is effecting?
SELECT JobInvolvement, COUNT(*) as Total
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY JobInvolvement order by total desc;

10.which JobRole are leaving?
select JobRole,count(Attrition) as Total 
from HR_Data where Attrition='yes' 
group by JobRole order by Total desc;



12.Does salary is affecting?
select 
count(case when Monthlyincome<5000 then 1  end)as L0,
count(case when Monthlyincome Between 5001 and 10000 then 1  end)as L1,
count(case when Monthlyincome Between 10001 and 15000 then 1  end)as L2
from HR_Data where attrition='Yes';

13.PercentSalaryHike vs Attrition
select 
count(case when PercentSalaryHike<15 then 1  end)as L0,
count(case when PercentSalaryHike Between 15 and 20 then 1  end)as L1,
count(case when NumCompaniesWorked>20 then 1 end)as L2
from HR_Data where attrition='Yes';

14.relationshipSatisfaction vs Attrition
SELECT relationshipSatisfaction, COUNT(*) as Total
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY relationshipSatisfaction  order by total desc ;

