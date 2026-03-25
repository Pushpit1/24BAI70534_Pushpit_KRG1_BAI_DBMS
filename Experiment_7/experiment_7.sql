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