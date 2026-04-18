Experiment 9

Name: Trimann Kaur	

UID: 24BAI70511

Branch: B.E. CSE (AIML)	

Section: 24AIT_KRG-G1

Semester: 4	

Date of Performance: 17.04.2026

Subject Name: Database Management System	

Subject Code: 24CSH-298


AIM: To create and implement PL/SQL packages by developing a package specification and package body containing procedures and shared cursors, in order to achieve modular, reusable, and efficient database programming.


OBJECTIVES: 

•	To design and implement a PL/SQL package that includes procedures and shared cursors for structured and modular program development. 


SOFTWARE REQUIREMENTS: 

•	Database Management System:

o	Oracle

•	Database Administration Tool:

o	Oracle SQL Developer


PRACTICAL/EXPERIMENT STEPS: 
1.	An employees table was created to store employee details such as ID, name, salary, and department. 
2.	Sample records were inserted into the employees table for testing purposes. 
3.	A PL/SQL package specification was created to declare procedures related to employee data. 
4.	A package body was developed to implement the logic of the declared procedures. 
5.	A shared cursor was defined inside the package to retrieve employee records efficiently. 
6.	A procedure display_all_employees was implemented to display all employee details using the cursor. 
7.	A procedure display_employee was created to fetch details of a specific employee using employee ID. 
8.	The package procedures were executed to verify correct functionality and output.


PROCEDURE: 
1.	Oracle SQL environment (SQL Developer / FreeSQL) was opened and the required database was selected. 
2.	The employees table was created using the CREATE TABLE command. 
3.	Sample data was inserted into the table using INSERT statements. 
4.	A package specification was created using CREATE OR REPLACE PACKAGE to declare procedures. 
5.	A package body was created using CREATE OR REPLACE PACKAGE BODY to define procedures and a shared cursor. 
6.	Procedures were written to display all employees and to retrieve a specific employee by ID. 
7.	The package procedures were executed using BEGIN ... END; blocks. 
8.	The output was displayed using DBMS_OUTPUT.PUT_LINE and verified for correctness.

CODE:
-- Create table
CREATE TABLE learners (
    learner_id SERIAL PRIMARY KEY,
    full_name VARCHAR(120),
    learner_age INT,
    program VARCHAR(120)
);

-- Insert Procedure
CREATE OR REPLACE PROCEDURE insert_learner(
    l_name VARCHAR,
    l_age INT,
    l_program VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO learners(full_name, learner_age, program)
    VALUES (l_name, l_age, l_program);
END;
$$;

-- Call insert
CALL insert_learner('Alex', 21, 'BTech');
SELECT * FROM learners;


-- Fetch Function
CREATE OR REPLACE FUNCTION fetch_learners()
RETURNS TABLE(
    learner_id INT,
    full_name VARCHAR,
    learner_age INT,
    program VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT * FROM learners;
END;
$$;

-- Call fetch
SELECT * FROM fetch_learners();


-- Update Procedure
CREATE OR REPLACE PROCEDURE modify_learner(
    l_id INT,
    l_name VARCHAR,
    l_age INT,
    l_program VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE learners
    SET full_name = l_name,
        learner_age = l_age,
        program = l_program
    WHERE learner_id = l_id;
END;
$$;

-- Call update
CALL modify_learner(1, 'Alex', 23, 'MBA');
SELECT * FROM learners;


-- Delete Procedure
CREATE OR REPLACE PROCEDURE remove_learner(
    l_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM learners
    WHERE learner_id = l_id;
END;
$$;

-- Call delete
CALL remove_learner(1);
SELECT * FROM learners;


-- Search Function
CREATE OR REPLACE FUNCTION find_learner(l_id INT)
RETURNS TABLE(
    learner_id INT,
    full_name VARCHAR,
    learner_age INT,
    program VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT l.learner_id, l.full_name, l.learner_age, l.program
    FROM learners l
    WHERE l.learner_id = l_id;
END;
$$;

-- Call search
SELECT * FROM find_learner(1);I/O ANALYSIS: 
1.	Create a table 
The students table is successfully created with fields such as id, name, age, and course. The id is defined as a primary key with auto-increment, ensuring unique student records.

 <img src="1.png" width="223" height="53">

 
2.	Creating a Procedure (INSERT)
The stored procedure add_student is created successfully. It accepts parameters (name, age, course) and inserts a new record into the table. A new record is inserted into the students table successfully. 
 <img src="2.png" width="266" height="60">
 <img src="3.png" width="232" height="52">

 
3.	Creating a Function (READ)
The function get_students is created to fetch all records from the table. Displays all student records present in the table.
 <img src="4.png" width="374" height="73">

 
4.	UPDATE Operation
The stored procedure update_student is created to update existing student details using ID. The record with id = 1 is successfully updated with new values.
 <img src="5.png" width="374" height="73">

 
5.	DELETE Operation
The stored procedure delete_student is created to delete a student record based on ID. The record with id = 1 is removed from the table.
 <img src="6.png" width="320" height="89">

 
6.	SEARCH Operation
The function search_student is created to search records using id. It displays records with the given id.
  <img src="7.png" width="317" height="87">



LEARNING OUTCOMES: 
1.	Gained understanding of stored procedures and functions in PostgreSQL for efficient database operations. 
2.	Learned to implement CRUD operations (Create, Read, Update, Delete) using parameterized procedures and functions. 
3.	Developed the ability to improve data handling, reusability, and security in database applications using PL/pgSQL.
