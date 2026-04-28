SELECT p.product_name, COUNT(o.order_id) AS total_orders
FROM Products p
LEFT JOIN Orders o 
    ON p.product_id = o.product_id
GROUP BY p.product_name;
