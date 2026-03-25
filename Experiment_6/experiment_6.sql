CREATE TABLE staff (
    staff_id NUMBER PRIMARY KEY,
    staff_name VARCHAR2(50),
    staff_salary NUMBER
);

INSERT INTO staff VALUES (201, 'Rahul', 28000);
INSERT INTO staff VALUES (202, 'Sneha', 47000);
INSERT INTO staff VALUES (203, 'Vikram', 26000);
INSERT INTO staff VALUES (204, 'Pooja', 52000);
INSERT INTO staff VALUES (205, 'Ankit', 36000);

COMMIT;

DECLARE
    v_staff_id staff.staff_id%TYPE := 202;
    v_updated_salary staff.staff_salary%TYPE := 30000;
BEGIN
    UPDATE staff
    SET staff_salary = v_updated_salary
    WHERE staff_id = v_staff_id;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Salary updated');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Record not found');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Rows affected: ' || SQL%ROWCOUNT);
END;
/

DECLARE
    CURSOR staff_cursor IS
        SELECT staff_id, staff_name, staff_salary FROM staff;

    s_id staff.staff_id%TYPE;
    s_name staff.staff_name%TYPE;
    s_salary staff.staff_salary%TYPE;
BEGIN
    OPEN staff_cursor;

    LOOP
        FETCH staff_cursor INTO s_id, s_name, s_salary;
        EXIT WHEN staff_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('ID: ' || s_id ||
                             ' Name: ' || s_name ||
                             ' Salary: ' || s_salary);

        IF s_salary > 42000 THEN
            DBMS_OUTPUT.PUT_LINE('Category: High');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Category: Normal');
        END IF;

    END LOOP;

    CLOSE staff_cursor;
END;
/
    
