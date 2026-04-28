CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    city VARCHAR(100)
);

INSERT INTO Suppliers (supplier_id, supplier_name, city) VALUES
(1, 'ABC Traders', 'Delhi'),
(2, 'XYZ Supplies', 'Mumbai'),
(3, 'Global Goods', 'Chandigarh');

CREATE PROCEDURE SwapSupplierCities
    @id1 INT,
    @id2 INT
AS
BEGIN
    DECLARE @city1 VARCHAR(100), @city2 VARCHAR(100);

    SELECT @city1 = city 
    FROM Suppliers 
    WHERE supplier_id = @id1;

    SELECT @city2 = city 
    FROM Suppliers 
    WHERE supplier_id = @id2;

    UPDATE Suppliers
    SET city = CASE 
                    WHEN supplier_id = @id1 THEN @city2
                    WHEN supplier_id = @id2 THEN @city1
               END
    WHERE supplier_id IN (@id1, @id2);
END;

EXEC SwapSupplierCities 1, 2;

SELECT * FROM Suppliers;