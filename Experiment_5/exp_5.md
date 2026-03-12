# Practical Experiment Documentation: SQL Table Management and Conditional Logic

## 1. Aim of the Session
To demonstrate the creation of a database schema, population of records, and the use of the **CASE Expression** to perform conditional analysis on numerical data (specifically a parity check on salary values).

---

## 2. Objective of the Session
* To learn how to manage table lifecycles using `DROP` and `CREATE`.
* To understand the application of the modulo operator (`%`) in SQL.
* To gain proficiency in creating virtual columns using `CASE-WHEN-THEN-ELSE` logic.
* To practice basic **Data Manipulation Language (DML)** and **Data Query Language (DQL)** operations.

---

## 3. Practical / Experiment Steps
The experiment consists of the following logic:

* **Table Setup:** Ensure a clean environment by removing any existing `employee` table and creating a new one with specific constraints (Primary Key).
* **Data Population:** Insert six distinct records representing employee IDs, names, and salaries.
* **Conditional Querying:** Execute a `SELECT` statement that calculates the remainder of the salary divided by 2 using `salary % 2`.
* **Classification:** If the remainder is 0, classify as 'Even Salary'; otherwise, classify as 'Odd Salary' using a `CASE` statement.

---

## 4. Procedure of the Practical
1.  **Start your SQL environment:** Log in to your computer and open your SQL tool (MySQL, PostgreSQL, Oracle, etc.).
2.  **Open a new Query Editor window:** Prepare a space for script execution.
3.  **Create or select the required database schema.**
4.  **Write the Setup Commands:** Type the `DROP TABLE IF EXISTS` and `CREATE TABLE` commands to define the structure.
5.  **Execute the INSERT commands:** Populate the table with the provided dataset.
6.  **Write the Logical Query:** Incorporate the `CASE` expression for salary classification.
7.  **Execute and Verify:** Run the script and verify that the `salary_type` column correctly reflects the parity of the salary.
8.  **Record Results:** Note down the findings and take a screenshot of the execution results.

---

## 5. I/O Analysis (Input / Output Analysis)

### Input: Employee Table Data
| emp_id | emp_name | salary |
| :--- | :--- | :--- |
| 101 | alice | 50024 |
| 102 | akash | 25001 |
| 103 | bimlesh | 45120 |
| 104 | charlie | 48203 |
| 105 | david | 68103 |
| 106 | kelly | 79536 |

---

### Output: Query Results
| emp_id | emp_name | salary | salary_type |
| :--- | :--- | :--- | :--- |
| 101 | alice | 50024 | **Even Salary** |
| 102 | akash | 25001 | **Odd Salary** |
| 103 | bimlesh | 45120 | **Even Salary** |
| 104 | charlie | 48203 | **Odd Salary** |
| 105 | david | 68103 | **Odd Salary** |
| 106 | kelly | 79536 | **Even Salary** |

---

## 6. Learning Outcome
Through this practical session, I have achieved the following:

* **Concepts Understood:** Mastered the `CASE` statement syntax, which allows for "if-then-else" logic directly within a SQL result set.
* **Skills Developed:** Gained the ability to categorize data dynamically without altering the physical storage of the table.
* **Practical Exposure:** Learned how to handle table resets (`DROP`/`CREATE`) and perform mathematical operations like modulo within a query to derive meaningful business insights.