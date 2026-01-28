# Experiment 3

## Aim
To understand the basic structure of a PL/SQL program by creating and executing a simple PL/SQL block that includes declaration and execution sections, and to display output using built-in procedures.

---

## Objectives
* To create a simple PL/SQL program demonstrating Declaration Section and Execution Section.

---

## Practical/Experiment Steps
* Block Structuring: Designed a foundational PL/SQL block consisting of a Declaration section for memory allocation and an Execution section for logic processing.
* Variable Initialization: Defined and assigned static values to organizational variables, including Employee ID, Name, and Salary, to simulate a single-record data environment.
* Computational Logic: Integrated an arithmetic operation within the block to calculate the House Rent Allowance (HRA) at 40% of the base salary.
* Conditional Processing: Implemented a selection structure using an IF-ELSE statement to evaluate tax liability based on the defined salary threshold.
* Output Orchestration: Utilized the DBMS_OUTPUT.PUT_LINE procedure to format and display the processed information in the console.

---

## Procedure
1. Established a connection to the database environment.
2. Initiated the DECLARE section to reserve memory for numerical and character data types.
3. Mapped real-world data to the defined variables, such as setting the Employee Name to ‘JOSEPH’ and Salary to 35,000.
4. Constructed the BEGIN block to initiate the procedural execution of the code.
5. Coded a series of output commands to display the primary employee details and the computed HRA value.
6. Applied a conditional logic check to compare the employee's salary against the 40,000 threshold.
7. Defined the alternative output paths to inform the user of their tax status based on the boolean result of the salary check.
8. Concluded the block with the END; keyword and executed the script to trigger the PL/SQL engine.
9. Verified the console output against the manual calculations to ensure the logic and variables were handled correctly.

---

## I/O Analysis

**Input:**
```sql
DECLARE
EMP_ID NUMBER:=102;
EMP_NAME VARCHAR(30):='JOSEPH';
EMP_SALARY NUMBER:=35000;

BEGIN
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID: '||EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME: '||EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('SALARY: RS. '||EMP_SALARY);
    DBMS_OUTPUT.PUT_LINE('HOUSE RENT ALLOWANCE: RS. '||(0.40*EMP_SALARY));
    IF EMP_SALARY > 40000 THEN
    DBMS_OUTPUT.PUT_LINE('YOU NEED TO PAY TAX');
    ELSE
    DBMS_OUTPUT.PUT_LINE('YOU DO NOT HAVE TO PAY TAX'); 
    END IF;
END;
```

**Output:**


![Output of Commands](Exp3_Output.png)


---

## Learning Outcomes
* Understanding the fundamental organisation of PL/SQL declaration and execution sections.
* Learnt to declare, initialise, and use different data types within a procedural block.
* Implementing conditional branching and basic arithmetic operations to process data dynamically.
* Utilising built-in procedures to format and display calculated results to the user.

* Apply conditions on grouped data using HAVING.
* Sort query results using ORDER BY.