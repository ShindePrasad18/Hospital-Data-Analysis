# DEMOGRAPHIC ANALYSIS
use Hospital
# 1. Calculate the average age of patients by gender.
select PatientGender, avg(PatientAge)
from Patients
group by PatientGender;

# 2. Find the distribution of patients across different states (count per state).
select Patients.State, count(distinct Patients.PatientID) as Total_Patients
from Patients
group by State;

# 3. Identify the top 5 cities with the most patients.
select Patients.City, count(Patients.PatientID) as Patient_Count
from Patients
group by City
order by Patient_Count desc
limit 5;

# AGE GROUP ANALYSIS
# 1. Categorize patients into age groups (e.g., 0-18, 19-35, 36-50, 51-65, 65+)
# and count the number of patients in each group.
with AgeGroup as (select Patients.FirstName,
                         Patients.LastName,
                         Patients.PatientAge,
                         case
                             when Patients.PatientAge between 0 and 18 then 'Young'
                             when Patients.PatientAge between 19 and 35 then 'Adult'
                             when Patients.PatientAge between 35 and 50 then 'More Adult'
                             when Patients.PatientAge between 50 and 65 then 'Old'
                             else 'Oldest'
                             end as Age_Criteria
                  from Hospital.Patients)
select Age_Criteria, count(*) as No_Patient_in_Group
from AgeGroup
group by Age_Criteria;


# Compare the gender distribution within each age group.
with AgeGroup as (select Patients.FirstName,
                         Patients.LastName,
                         Patients.PatientAge,
                         Patients.PatientGender,
                         case
                             when Patients.PatientAge between 0 and 18 then 'Young'
                             when Patients.PatientAge between 19 and 35 then 'Adult'
                             when Patients.PatientAge between 35 and 50 then 'More Adult'
                             when Patients.PatientAge between 50 and 65 then 'Old'
                             else 'Oldest'
                             end as Age_Criteria
                  from Hospital.Patients)
select Age_Criteria, PatientGender, count(PatientGender) as Total_count
from AgeGroup
group by Age_Criteria, PatientGender;


# EMAIL DOMAIN ANALYSIS
# 1. Extract the domain from the email addresses (e.g., datacourse.com) and count how many patients use each domain.
SELECT
    SUBSTRING_INDEX(Email, '@', -1) AS Domain,
    COUNT(*) AS PatientCount
FROM
    patients
GROUP BY
    Domain
ORDER BY
    PatientCount DESC;

# 2. Are there any invalid or unusual email domains?
-- 1. Find invalid email formats
SELECT PatientID, Email
FROM patients
WHERE Email NOT LIKE '%_@__%.__%'  -- Basic email pattern check
   OR Email IS NULL;

-- 2. Find unusual domains (appearing less than 5 times)
WITH DomainCounts AS (
    SELECT
        SUBSTRING_INDEX(Email, '@', -1) AS Domain,
        COUNT(*) AS DomainCount
    FROM patients
    GROUP BY Domain
)
SELECT
    p.PatientID,
    p.Email,
    SUBSTRING_INDEX(p.Email, '@', -1) AS Domain
FROM patients p
         JOIN DomainCounts d
              ON SUBSTRING_INDEX(p.Email, '@', -1) = d.Domain
WHERE d.DomainCount < 5
ORDER BY d.DomainCount;

# STATE AND CITY INSIGHTS
# 1. Which state has the highest number of patients?
select Patients.State, count(Patients.PatientID) as Total_Count
from Patients
group by Patients.State
order by Total_Count desc limit 5;

# 2. For the state with the most patients, what is the most common city?
select Patients.State, city, count(Patients.PatientID) as City_Patient_Count from Patients
where State = 'TX'
group by city
order by City_Patient_Count desc;

# DUPLICATE OR UNIQUE PATIENT ANALYSIS
# 1. Check if there are any duplicate PatientID or PatientNumber entries.
-- Find duplicate PatientIDs
SELECT
    PatientID,
    COUNT(*) AS duplicate_count
FROM
    patients
GROUP BY
    PatientID
HAVING
    COUNT(*) > 1;

-- Find duplicate PatientNumbers
SELECT
    PatientNumber,
    COUNT(*) AS duplicate_count
FROM
    patients
GROUP BY
    PatientNumber
HAVING
    COUNT(*) > 1;


# 2. * Are there patients with the same first and last name? If so, how many?
-- Find patients sharing first+last names
SELECT
    FirstName,
    LastName,
    COUNT(*) AS PatientCount
FROM
    patients
GROUP BY
    FirstName, LastName
HAVING
    COUNT(*) > 1
ORDER BY
    COUNT(*) DESC;

#See Duplicated records-
WITH DuplicateNames AS (
    SELECT
        FirstName,
        LastName
    FROM
        patients
    GROUP BY
        FirstName, LastName
    HAVING
        COUNT(*) > 1
)
SELECT
    p.*
FROM
    patients p
        JOIN
    DuplicateNames d ON p.FirstName = d.FirstName AND p.LastName = d.LastName
ORDER BY
    p.LastName, p.FirstName;


# AGE AND GENDER CORELATION ANALYSIS
# 1. Is there a correlation between age and gender in this dataset?
# (e.g., are females generally older than males?)
SELECT PatientGender, AVG(Patients.PatientAge) AS average_age, COUNT(*) AS gender_count
FROM patients
GROUP BY PatientGender;

# 2. How many patients are under 18 years old?
select count(*) as Patient_below_18
from Patients where PatientAge < 18;

# 3. How many patients are above 65 years old?
select count(*) as Patient_above_65
from Patients where PatientAge > 65;


# NAME ANALYSIS
# 1. What are the top 5 most common first names?
select distinct Patients.FirstName, count(Patients.FirstName) as count
from Patients
group by FirstName
order by count desc limit 5;

# 2. What are the top 5 most common last names?
select distinct Patients.LastName, count(Patients.LastName) as count
from Patients
group by LastName
order by count desc limit 5;