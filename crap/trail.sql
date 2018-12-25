/*Revision NOTES for MySQL (not intended for beginners)*/
/*author: Priyanshu Shrivastav*/
/*SQL is a language for databases. */
/*SQL is case insensitive | MySQL is a program that understands SQL*/
/*Primary key is a unique identifier for all rows, it is always UNIQUE and NOT NULL*/

/*basics*/
SELECT * FROM table_1;/*select all columns from table_1*/

SELECT column_name_1, column_name_2, column_name_3 FROM table_1;/*show multiple columns from the table*/

SELECT DISTINCT column_name_1 FROM table_1;/*show only distinct rows in column column_name_1 from the table_1*/

SELECT column_name_2 FROM table_1 LIMIT 5;/*Show first 5 entries in column_name_2 from the table_1*/

SELECT column_name_2 FROM table_1 LIMIT 5, 10;/*Show 10 entries skipping first 5 entries in column_name_2 from the table_1*/

/*sorting*/
SELECT column_name_1, column_name_2, column_name_3 FROM table_1 ORDER BY column_name_1, column_name_2;
/*show column_name_1, column_name_2, and column_name_3 from the table_1 by first ordering on basis of column_name_1 and in column_name_1 itself
on the basis of column_name_2*/6
/*proper naming is table_1.column_name_1 and table_1.column_name_2  but the other way 	also works fine*/

SELECT column_name_1, column_name_2, column_name_3 FROM table_1 ORDER BY column_name_1 DESC; /*for descending | ASC for ascending | default order is ASC*/

/*filtering*/
SELECT column_name_1 FROM table_1 ORDER BY column_name_1 WHERE column_name_2 = 'value-1'; /*shows column_name_1 from the table_1 only where
column_name_2 is value-1 and sorts it on the basis of column_name_1 */

SELECT column_name_1 FROM table_1 WHERE column_name_2 BETWEEN 22 AND 27;/*only whose value of column_name_2 is between 22 and 27, both inclusive*/

SELECT column_name_1 FROM table_1 WHERE column_name_2 <= 22; /*column_name_2's value is less than or equal to 22 | one can also use not equal to !=22*/

SELECT column_name_1 FROM table_1 WHERE column_name_3 = 'value-1' AND column_name_2 = 32;/*use of AND statement*/

SELECT column_name_1 FROM table_1 WHERE column_name_3 = 'value-1' OR column_name_3 = 'value-2';

SELECT column_name_1 FROM table_1 WHERE (column_name_3 = 'value-1' OR column_name_3 = 'value-12') AND (column_name_2 = 22); /*use parenthesis */

SELECT column_name_1 FROM table_1 WHERE column_name_3 IN ('value-1', 'value-2'); /*checks for column_name_3's value to be either of value-1, or value-2*/

SELECT column_name_1 FROM table_1 WHERE column_name_3 NOT IN ('value-1', 'value-2'); /*checks for column_name_3's value NOT to be either of value-1, or value-2*/

/*wildcards*/
SELECT column_name_1 FROM table_1 WHERE column_name_3 LIKE 'value-1%';/*outputs column_name_1 where column_name_2 starts with value-1*/
/*variants are LIKE '%value-1' | or for value-1 in middle of the string LIKE '%value-1%'*/
/*more on wildcards % (percent) can be replacement for a string (include blank) while _ (underscore) is a replacement for a single character*/

SELECT column_name_1 FROM table_1 WHERE column_name_3 LIKE '_value-1';/*only a extra single character is allowed in front of value-1*/

/*regular expressions*/
SELECT column_name_1 FROM table_1 WHERE column_name_3 REGEXP 'value-1'; /*similar to having %value-1% , shows column_name_1 if column_name_3 contains value-1 anyhwhere*/

SELECT column_name_2 FROM table_1 WHERE column_name_3 REGEXP '.value-1'; /* . (period) matches any character*/ /*period is a meta-character to use it otherwise you have to escape the character hence /. or you can use square braces [.]*/

SELECT column_name_1 FROM table_1 WHERE column_name_2 REGEXP '[12345]'; /*if column_name_2's value is between 1 to 5*/
/* This is a set -> []*/
/*negation can also be used ^ | REGEXP '[^1-5]'*/

SELECT column_name_1 FROM table_1 WHERE column_name_2 REGEXP '[1-5]'; /*alternate for previous | */

SELECT column_name_1 FROM table_1 WHERE column_name_3 REGEXP 'value-1 | value-2';/*OR operator in REGEX*/

SELECT column_name_1 FROM table_1 where column_name_3 REGEXP '[3-9]value-2';
/*custom columns - temporary columns*/
/*whichever column name you write after select will be shown and new columns can be shown by either calling functions or doing arithematic on the column names*/

SELECT column_name_1, CONCAT (column_name_3, ',', column_name_2) AS column_name_4 FROM table_1; /*CONCAT(arg1, arg2, ... ) makes another column as column_name_4 and
concetanate column_name_3 , (comma) and column_name_2*/
/*UPPER (column_name_3), SQRT (column_name_2) These all give a whole new column, while AVG(column_name_2), or SUM (column_name_2) will give a single value*/
/*some useful functions COUNT (column_name_2) gives total number of rows*/

SELECT COUNT (*) FROM items; /*will tell the total number of rows in the table*/
 
SELECT COUNT (*) AS item_count FROM items WHERE seller_id = 2;/*count of all rows with seller_id == 2 */

SELECT seller_id, COUNT (*) AS item_count FROM items GROUP BY seller_id;/*Now seller_id are grouped that is single row for every unique seller_id*/

SELECT seller_id, COUNT (*) AS item_count FROM items GROUP BY seller_id HAVING COUNT (*) >= 3 ORDER BY item_count DESC; /*COUNT (*) as grouped for seller_id should be greater than or equal to 3*/

/*Difference between WHERE and HAVING clause 
IMP points: 
 -- Apart from SELECT queries, you can use WHERE clause with UPDATE and DELETE clause but HAVING clause can only be used with SELECT query
Read more: https://javarevisited.blogspot.com/2013/08/difference-between-where-vs-having-clause-SQL-databse-group-by-comparision.html#ixzz5KNEAFyCC
 */

 /*subqueries*/
SELECT AVG(cost) FROM items;/*gives the average of cost*/

SELECT name, cost FROM items WHERE cost > (
	SELECT AVG(cost) FROM items
) ORDER BY cost DESC;
/*gives the name and cost of items whose cost is greater than the average cost*/

SELECT seller_id FROM items WHERE name LIKE '%boxes of frogs'; /*returns a list of seller_id*/

SELECT name FROM items WHERE seller_id IN (
	SELECT seller_id FROM items WHERE name LIKE '%boxes of frogs' /*returns a list of seller_id used as a subquery*/
) AND name LIKE '%boxes of frogs' ORDER BY name;

SELECT name, cost FROM items WHERE seller_id IN (
	SELECT seller_id FROM items WHERE name LIKE '%boxes of frogs' 
	/*returns a list of seller_id*/
) AND name LIKE '%boxes of frogs' ORDER BY cost LIMIT 1;

/*OR*/

SELECT name, MIN(cost) AS min_cost FROM items WHERE name LIKE '%boxes of frogs'; 
/*the above one is WRONG, we were just lucky enough to get out somewhat safely | try the below commands*/

SELECT name, cost FROM items WHERE name LIKE '%women%';
SELECT name, MIN(cost) FROM items WHERE name LIKE '%women%';
/*rather than showing women hat 17.55 it shows women perfum 17.54999*/
/*READ THIS: https://www.periscopedata.com/blog/sql-query-order-of-operations */
SELECT name, cost FROM items WHERE name LIKE '%women%' ORDER BY cost ASC LIMIT 1;
/*above one is CORRECT*/

/*joining tables*/
SELECT items.seller_id, customers.name, items.name AS name_items, items.cost FROM items, customers WHERE customers.id=items.seller_id ORDER BY items.seller_id ASC, items.cost ASC; /*links two tables and customers.id and items.seller_id are matched*/
/*OR using join*/
SELECT items.seller_id, customers.name, items.name, items.cost
FROM items JOIN customers
WHERE items.seller_id=customers.id
ORDER BY items.seller_id ASC, items.cost ASC;

/*outer joins*/

SELECT items.seller_id, customers.name, items.name, items.cost
FROM customers LEFT OUTER JOIN items 
ON items.seller_id=customers.id
ORDER BY items.seller_id ASC, items.cost ASC;
/*LEFT outer joins means you force to show the left table i.e. customers independent of existence of it's link with the other table, here even if the seller wasn't selling anything it was shown with NULL values*/

/*Unions*/
/*gives union of two queries. Make sure the columns are same in both the tables*/
SELECT items.name, items.cost FROM items WHERE cost > (
	SELECT AVG(cost) FROM items
)
UNION ALL
SELECT items.name, items.cost FROM items WHERE items.seller_id > 20;
/*gives union of both the rows from the two queries (UNION ALL automatically removes duplicate entries)*/

/*full text searching*/
ALTER TABLE items ADD FULLTEXT(name);
/*enables fulltext searching on one column*/
SELECT name, cost FROM items WHERE Match(name) Against('baby');
SELECT name, cost FROM items WHERE Match(name) Against('+baby -coat' IN BOOLEAN MODE);
/*look at more such operators + - */

