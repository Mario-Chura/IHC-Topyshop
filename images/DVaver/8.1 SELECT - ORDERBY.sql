-----------DML  (S ELECT   I NSERT    D ELETE/TRUNCATE    U PDATE     )
SELECT
   select_list
FROM
   table_name;
   
  SELECT first_name FROM customer;
  
 SELECT
   first_name,
   last_name,
   email
FROM
   customer;
   
  
SELECT * FROM customer;

SELECT 
   first_name || ' ' || last_name,
   email
FROM 
   customer;
  
  SELECT 5 * 3;

 -------------------ALIAS
 
 SELECT column_name AS alias_name
FROM table_name;
-- O
SELECT column_name alias_name
FROM table_name;


SELECT 
   first_name, 
   last_name AS surname
FROM customer;

SELECT
    first_name || ' ' || last_name AS full_name
FROM
    customer;
    
 -- nombres con espacios
 SELECT
    first_name || ' ' || last_name "full name"
FROM
    customer;

  ------------------ Con ordenamiento
   
   SELECT
	select_list
FROM
	table_name
ORDER BY
	sort_expression1 [ASC | DESC],
        ...
	sort_expressionN [ASC | DESC];


SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC;				-- 	first_name ;	

SELECT
       first_name,
       last_name
FROM
       customer
ORDER BY
       last_name DESC;
      
      
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC,
	last_name DESC;

SELECT 
	first_name,
	LENGTH(first_name) len
FROM
	customer
ORDER BY 
	len DESC;


----------PostgreSQL ORDER BY clause and NULL

ORDER BY sort_expresssion [ASC | DESC] [NULLS FIRST | NULLS LAST]

CREATE TABLE sort_demo(
	num INT
);

-- insert some data
INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null);

SELECT num
FROM sort_demo
ORDER BY num;

SELECT num
FROM sort_demo
ORDER BY num NULLS LAST;

SELECT num
FROM sort_demo
ORDER BY num NULLS FIRST;

SELECT num
FROM sort_demo
ORDER BY num DESC;

SELECT num
FROM sort_demo
ORDER BY num DESC NULLS LAST;

--------------------select distinct 

CREATE TABLE distinct_demo (
	id serial NOT NULL PRIMARY KEY,
	bcolor VARCHAR,
	fcolor VARCHAR
);
INSERT INTO distinct_demo (bcolor, fcolor)
VALUES
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue');
--select * from distinct_demo;
SELECT
	DISTINCT bcolor
FROM
	distinct_demo
ORDER BY
	bcolor;

SELECT
	DISTINCT bcolor,
	fcolor
FROM
	distinct_demo
ORDER BY
	bcolor,
	fcolor;

SELECT
	DISTINCT ON (bcolor) bcolor,
	fcolor
FROM
	distinct_demo 
ORDER BY
	bcolor,
	fcolor;

