Welcome to the Hospital Data Analysis project! This data-driven exploration dives deep into a healthcare dataset to uncover patterns, trends, and insights about patients across various demographics and locations. 🧠📈

🔍 Problems Solved & Insights Gained

1. 🧓👩‍⚕️ Demographic Analysis
	•	🧮 Average Age by Gender: Calculated mean age grouped by gender to understand age distribution.
	•	🗺️ State-Wise Distribution: Visualized how patients are distributed across different states.
	•	🏙️ Top Cities: Identified top 5 cities with the most patient registrations.

2. 📊 Age Group Analysis
	•	📅 Categorized Age Groups: Grouped patients into bins like 0-18, 19-35, etc., to analyze population segments.
	•	⚖️ Gender Distribution by Age: Compared how gender varies within each age bracket.

3. 📧 Email Domain Analysis
	•	🔍 Domain Extraction: Pulled domains from emails (e.g., gmail.com, datacourse.com) and counted users.
	•	🚨 Invalid Domains: Detected any unusual or malformed email domains.

4. 🗃️ State and City Insights
	•	🥇 Top State: Found the state with the highest patient count.
	•	🏆 Top City in Leading State: Within the top state, identified the most frequent city.

5. 🔁 Duplicate or Unique Patients
	•	🆔 ID Checks: Checked for duplicates in PatientID or PatientNumber.
	•	👥 Name Clashes: Counted how many patients share the same first and last name.

6. ⚖️ Age and Gender Correlation
	•	👨‍🦳👩‍🦳 Gender vs. Age: Analyzed whether one gender tends to be older than the other on average.

7. 🚨 Outlier Detection
	•	📌 Suspicious Ages: Identified entries where age is suspiciously low or high (e.g., <1 or >100).
	•	👶 Underage Patients: Counted how many patients are younger than 18.

8. 🧬 Name Analysis
	•	🔝 Top First Names: Listed the 5 most common first names.
	•	🏷️ Top Last Names: Listed the 5 most common surnames.

9. ❗ Missing Data Check
	•	🚫 Missing Values: Flagged null/missing entries and highlighted the columns affected.

10. 🤖 Advanced: Patient Clustering
	•	📍 K-Means Clustering: Grouped patients based on age and geographic location (state/city) to identify similar patient groups.

⸻

📁 Dataset

Uploaded CSV file: patients.csv

📌 Tools Used
	•	🐍 Python (Pandas, NumPy)
	•	📈 Matplotlib, Seaborn
	•	📊 Scikit-learn (for clustering)
	•	🧹 Data Cleaning & Preprocessing

⸻

📎 Key Outcomes

✨ This project helped uncover patient distribution trends, detect data quality issues, explore relationships among age, gender, and geography, and apply clustering for patient segmentation.

⸻

Give this repo a ⭐ if you find the insights valuable or inspiring!
