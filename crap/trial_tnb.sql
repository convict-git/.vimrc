SELECT CONCAT(address, ', ', state) AS comp_add FROM customers WHERE state='NY' ORDER BY name;
SELECT COUNT(*) AS from_new_york FROM customers WHERE state='NY';
SELECT name, city FROM customers GROUP BY city HAVING COUNT(*) = 2;
SELECT name FROM customers WHERE city='BOSTON';
SELECT city FROM customers GROUP BY city HAVING COUNT(*) = 2;
SELECT name FROM customers WHERE city IN (
	SELECT city FROM customers GROUP BY city HAVING COUNT(*) = 2;
)
