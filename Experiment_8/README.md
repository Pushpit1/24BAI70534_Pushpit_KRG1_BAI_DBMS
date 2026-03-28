Experiment 8

Name: Pushpit kumar gaur

UID: 24BAI70534

Branch: B.E. CSE (AIML)	

Section: 24AIT_KRG-G1

Semester: 4	

Date of Performance: 27.03.2026

Subject Name: Database Management System	

Subject Code: 24CSH-298

AIM: To design and implement a stored procedure in PostgreSQL that calculates the number of employees based on gender using input, output, and input-output parameters, and to understand the use of procedural logic in database management.


OBJECTIVES: 
•	To design and implement a stored procedure in PostgreSQL using PL/pgSQL that utilizes input, output, and input-output parameters to perform conditional data processing—specifically counting employees based on gender—and to understand how procedural constructs enhance modularity, reusability, and efficient database operations.


SOFTWARE REQUIREMENTS: 

•	Database Management System:
o	PostgreSQL Database

•	Database Administration Tool / Client Tool:
o	pgAdmin 

PRACTICAL/EXPERIMENT STEPS: 
1.	An employees table was created in the database to store employee details such as ID, name, gender, and salary. 
2.	Sample employee records were inserted into the table for testing the procedure. 
3.	A stored procedure get_Employee_Count_BY_Gender was created using PL/pgSQL with IN, OUT, and INOUT parameters. 
4.	The procedure logic was implemented to count employees based on a specified gender. 
5.	An anonymous DO block was written to call the procedure and pass required parameters.
6.	The result was displayed using RAISE NOTICE to verify the output and status.

PROCEDURE: 
1.	The pgAdmin (PostgreSQL) environment was opened to access the database. 
2.	The employees table was created with appropriate fields using SERIAL as PRIMARY KEY. 
3.	Sample data was inserted into the table using INSERT statements. 
4.	A stored procedure was created using CREATE OR REPLACE PROCEDURE with IN, OUT, and INOUT parameters. 
5.	The procedure body was defined to calculate the count of employees based on gender and update the status. 
6.	An anonymous block (DO statement) was written to call the procedure and store output values. 
7.	The output was displayed using RAISE NOTICE to observe the result and verify correctness.


CODE:


CREATE TABLE employees (
   
   emp_id SERIAL PRIMARY KEY,

   emp_name VARCHAR(50),

   gender VARCHAR(10),

   salary NUMERIC(10,2)
);

INSERT INTO employees (emp_name, gender, salary) VALUES

('Ramit', 'Male', 30000),

('Max', 'Female', 35000),

('Johny', 'Male', 28000),

('Karan', 'Female', 40000),

('Abhishek', 'Male', 32000);

CREATE OR REPLACE PROCEDURE  get_Employee_Count_BY_Gender (IN IN_GENDER VARCHAR(20), OUT OUT_COUNT INT, INOUT STATUS VARCHAR(20))

AS

$$

  BEGIN

SELECT COUNT(*) INTO OUT_COUNT  FROM employees  WHERE GENDER='Male';

   STATUS:='SUCCESS'; 
	
  END;

$$ LANGUAGE PLPGSQL;

DO

$$

DECLARE

GEN VARCHAR(20):='Female';

Count_of_Employee int;

STATUS VARCHAR:='Pending';

BEGIN

  CALL  get_Employee_Count_BY_Gender(GEN,Count_of_Employee,STATUS);

RAISE NOTICE 'COUNT OF % EMPLOYEES BY GENDER IS % AND STATUS IS %',GEN, Count_of_Employee,STATUS;

END;

$$


I/O ANALYSIS: 
1.	Table Data Input
Employee details such as name, gender, and salary are provided as input through INSERT statements into the employees table. 
 <img src="1.png" width="223" height="53">


2.	Procedure Input
The stored procedure takes gender as an input parameter along with a status variable, which is initially set before execution. 
<img src="2.png" width="266" height="60">

3.	Procedure Output
The procedure returns the count of employees based on the specified gender through the OUT parameter and updates the status to indicate execution success. 
 <img src="3.png" width="232" height="52">


4.	Execution Output
The final output is displayed using RAISE NOTICE, showing the employee count for the given gender along with the updated status message.
 <img src="4.png" width="374" height="73">


LEARNING OUTCOMES: 
1.	Understand how to create and use stored procedures in PostgreSQL using PL/pgSQL. 
2.	Gain knowledge of parameter types (IN, OUT, INOUT) and their practical usage. 
3.	Develop the ability to implement conditional and aggregate operations within procedures.
4.	Learn how to execute procedures and display results using anonymous blocks and RAISE NOTICE.