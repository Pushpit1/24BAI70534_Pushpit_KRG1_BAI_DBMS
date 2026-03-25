Experiment 7

Name: Pushpit kumar gaur

UID: 24BAI70534

Branch: B.E. CSE (AIML)	

Section: 24AIT_KRG-G1

Semester: 4	

Date of Performance: 13.03.2026

Subject Name: Database Management System	

Subject Code: 24CSH-298

AIM: To design and implement a materialized view and to compare and analyze execution time and performance differences between simple views, complex views, and materialized views, thereby understanding their impact on query optimization and system performance.


OBJECTIVES: 
•	To create simple views, complex views, and materialized views, and to evaluate their performance by comparing query execution time for each, highlighting the advantages of materialized views in enterprise-level applications.


SOFTWARE REQUIREMENTS: 
•	Database Management System:
        o	PostgreSQL Database
•	Database Administration Tool / Client Tool:
        o	pgAdmin 


PRACTICAL/EXPERIMENT STEPS: 
1.	Departments and employees tables were created in the database to store department details and employee information. 
2.	Sample records were inserted into both tables to provide data for testing views. 
3.	A simple view was created on the employees table using a salary filter to display high-paid employees. 
4.	A complex view was created using JOIN and aggregation functions to calculate department-wise employee count and average salary. 
5.	A materialized view was created to store the precomputed results of the complex query. 
6.	SELECT queries were executed on all three views to observe the output. 
7.	EXPLAIN ANALYZE was used to compare the execution time and performance of simple, complex, and materialized views.


PROCEDURE: 
1.	The pgAdmin (PostgreSQL) environment was opened to access the database. 
2.	Departments and employees tables were created with appropriate fields and relationships using PRIMARY KEY and FOREIGN KEY constraints. 
 <img src="01.png" width="259" height="55">


3.	Sample data was inserted into both tables using INSERT statements. 
 <img src="02.png" width="275" height="57">


4.	A simple view was created to display employee names and salaries above a specified threshold. 
 <img src="04.png" width="203" height="86">


5.	A complex view was created using JOIN and GROUP BY to calculate department-wise statistics. 
 <img src="05.png" width="320" height="89">


6.	A materialized view was created to store the results of the complex query for faster access. 
 <img src="06.png" width="317" height="87">

7.	Queries and EXPLAIN ANALYZE statements were executed to observe results and compare performance. 


CODE:
CREATE TABLE divisions( 
    div_id INT PRIMARY KEY, 
    div_name VARCHAR(20) 
); 
CREATE TABLE workers( 
    worker_id INT PRIMARY KEY, 
    worker_name VARCHAR(20), 
    div_id INT REFERENCES divisions(div_id), 
    pay NUMERIC 
); 
INSERT INTO divisions VALUES 
(10, 'Tech'), 
(20, 'Admin'), 
(30, 'Accounts'); 
INSERT INTO workers VALUES 
(201, 'Rahul', 10, 92000), 
(202, 'Sneha', 10, 78000), 
 
 
Apex Institute of Technology 
Computer Science & Engineering 
 
(203, 'Vikram', 20, 61000), 
(204, 'Pooja', 20, 67000), 
(205, 'Ankit', 30, 54000), 
(206, 'Kriti', 10, 86000); 
 
-- simple view 
CREATE VIEW view_basic AS 
SELECT worker_name, pay 
FROM workers 
WHERE pay > 75000; 
 
SELECT * FROM view_basic; 
 
-- complex view 
CREATE VIEW view_summary AS 
SELECT d.div_name, 
       COUNT(w.worker_id) AS total_workers, 
       AVG(w.pay) AS avg_pay 
FROM workers w 
JOIN divisions d 
ON w.div_id = d.div_id 
GROUP BY d.div_name; 
 
 
 
Apex Institute of Technology 
Computer Science & Engineering 
 
SELECT * FROM view_summary; 
 
-- materialized view 
CREATE MATERIALIZED VIEW view_store AS 
SELECT d.div_name, 
       COUNT(w.worker_id) AS total_workers, 
       AVG(w.pay) AS avg_pay 
FROM workers w 
JOIN divisions d 
ON w.div_id = d.div_id 
GROUP BY d.div_name; 
 
SELECT * FROM view_store; 
 
REFRESH MATERIALIZED VIEW view_store; 
 
EXPLAIN ANALYZE SELECT * FROM view_basic; 
EXPLAIN ANALYZE SELECT * FROM view_summary; 
EXPLAIN ANALYZE SELECT * FROM view_store


I/O ANALYSIS: 
1.	Simple View Output
Displays employee names and salaries where salary is greater than 70000.
 <img src="04.png" width="203" height="86">

2.	Complex View Output
Displays department-wise data including total employees and average salary.
 <img src="05.png" width="320" height="89">


3.	Materialized View Output
Displays the same aggregated results as the complex view but retrieved faster.
 <img src="06.png" width="317" height="87">


4.	Performance output
EXPLAIN ANALYZE shows execution time, where the materialized view executes faster than the complex view.
 <img src="08.png" width="454" height="136">

 <img src="09.png" width="503" height="311">

 <img src="10.png" width="477" height="106">

 
 
LEARNING OUTCOMES: 
1.	Understood the concept and working of materialized views in a database system.
2.	Differentiated between simple views, complex views, and materialized views.
3.	Created materialized views in PostgreSQL.
4.	Compared query execution time for different types of views.
5.	Analyzed performance benefits of materialized views in data-intensive applications.
6.	Applied materialized view concepts in real-world company scenarios.