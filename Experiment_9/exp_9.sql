CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    course VARCHAR(100)
);

CREATE OR REPLACE PROCEDURE add_student(
    p_name VARCHAR,
    p_age INT,
    p_course VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO students(name, age, course)
    VALUES (p_name, p_age, p_course);
END;
$$;

CALL add_student('Max', 20, 'BE');
SELECT * FROM students

CREATE OR REPLACE FUNCTION get_students()
RETURNS TABLE(
    id INT,
    name VARCHAR,
    age INT,
    course VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT * FROM students;
END;
$$;

SELECT * FROM get_students()

CREATE OR REPLACE PROCEDURE update_student(
    p_id INT,
    p_name VARCHAR,
    p_age INT,
    p_course VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE students
    SET name = p_name,
        age = p_age,
        course = p_course
    WHERE id = p_id;
END;
$$;

CALL update_student(1, 'Max', 22, 'MBA')
SELECT * FROM students

CREATE OR REPLACE PROCEDURE delete_student(
    p_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM students
    WHERE id = p_id;
END;
$$;


CALL delete_student(1)
SELECT * FROM students

CREATE OR REPLACE FUNCTION search_student(p_id INT)
RETURNS TABLE(student_id INT, name VARCHAR, age INT, course VARCHAR)
AS $$
BEGIN
    RETURN QUERY
    SELECT s.id, s.name, s.age, s.course
    FROM students s
    WHERE s.id = p_id;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM search_student(1);