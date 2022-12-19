-- 

CREATE DATABASE TESTBD;
select * from pg_catalog.pg_database pd ;
drop database template1;
SELECT * FROM pg_stat_activity WHERE datname='MiDatabase';
SELECT * FROM pg_stat_activity WHERE datname='RecursosH';
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP 
);

CREATE TABLE roles(
   role_id serial PRIMARY KEY,
   role_name VARCHAR (255) UNIQUE NOT NULL
);

CREATE TABLE account_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  grant_date TIMESTAMP,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (role_id)
      REFERENCES roles (role_id),
  FOREIGN KEY (user_id)
      REFERENCES accounts (user_id)
);
-- viernes

-- SERIAL

CREATE TABLE fruits(
   id SERIAL PRIMARY KEY,
   name VARCHAR NOT NULL
);

select * from fruits

--Ver listado de restricciones
select * from pg_catalog.pg_constraint pc ;

INSERT INTO fruits(name) 
VALUES('Orange');

INSERT INTO fruits(id,name) 
VALUES(DEFAULT,'Apple');

SELECT * FROM fruits;
SELECT currval(pg_get_serial_sequence('fruits', 'id'));

INSERT INTO fruits(name) 
VALUES('Banana')
RETURNING id;

INSERT INTO fruits(id,name) 
VALUES(6,'Pera');

INSERT INTO fruits(name) 
VALUES('Naranja')
RETURNING id;

INSERT INTO fruits(name) 
VALUES('Fresa')
RETURNING id;

INSERT INTO fruits(name) 
VALUES('Tomate')
RETURNING id;
--- PostgreSQL Sequences

1) Creaci�n de un ejemplo de secuencia ascendente
secuencia ascendente comenzando desde 100 con un incremento de 5:

CREATE SEQUENCE mysequence
INCREMENT 5
START 100;

Para obtener el siguiente valor de la secuencia, use la nextval()funci�n:
SELECT nextval('mysequence');

2) Creaci�n de un ejemplo de secuencia descendente
secuencia descendente de 3 a 1 con la opci�n de ciclo:

CREATE SEQUENCE three
INCREMENT -1
MINVALUE 1 
MAXVALUE 3
START 3
CYCLE;

Cuando ejecute la siguiente declaraci�n varias veces, ver� el n�mero comenzando por 3, 2, 1 y regresando a 3, 2, 1 y as� sucesivamente:
SELECT nextval('three');

3) Crear una secuencia asociada a una columna de la tabla

--Primero, cree una nueva tabla llamada order_details:
CREATE TABLE order_details(
    order_id SERIAL,
    item_id INT NOT NULL,
    item_text VARCHAR NOT NULL,
    price DEC(10,2) NOT NULL,
    PRIMARY KEY(order_id, item_id)
);
--En segundo lugar, cree una nueva secuencia asociada con la item_idcolumna de la order_detailstabla:
CREATE SEQUENCE order_item_id
START 10
INCREMENT 10
MINVALUE 10
OWNED BY order_details.item_id;

--En tercer lugar, inserte tres l�neas de pedido de pedido en la order_detailstabla:
INSERT INTO 
    order_details(order_id, item_id, item_text, price)
VALUES
    (100, nextval('order_item_id'),'DVD Player',100),
    (100, nextval('order_item_id'),'Android TV',550),
    (100, nextval('order_item_id'),'Speaker',250);
   
   select * from order_details

--En esta declaraci�n, usamos la nextval()funci�n para obtener el valor de identificaci�n del art�culo de la order_item_idsecuencia.

--Cuarto, consulta los datos de la order_detailstabla:
select     order_id,     item_id,     item_text,     price from     order_details;        


--Listado de todas las secuencias en una base de datos
--Consultar las secuencias
select     relname sequence_name FROM     pg_class WHERE     relkind = 'S';

--Eliminar secuencias
DROP TABLE order_details;



---- Identity Column

A) GENERATED ALWAYSejemplo

CREATE TABLE color (
    color_id INT GENERATED ALWAYS AS IDENTITY,
    color_name VARCHAR NOT NULL
);

En segundo lugar, inserte una nueva fila en la colortabla:
INSERT INTO color(color_name)
VALUES ('Red');

SELECT * FROM color;

INSERT INTO color (color_id, color_name)
VALUES (2, 'Green');

[Err] ERROR:  cannot insert into column "color_id"
DETAIL:  Column "color_id" is an identity column defined as GENERATED ALWAYS.
HINT:  Use OVERRIDING SYSTEM VALUE to override.

Para corregir el error, puede utilizar la OVERRIDING SYSTEM VALUEcl�usula de la siguiente manera:
INSERT INTO color (color_id, color_name)
OVERRIDING SYSTEM VALUE 
VALUES(2, 'Green');

B) GENERATED BY DEFAULT AS identity ejemplo

DROP TABLE color;

CREATE TABLE color (
    color_id INT GENERATED BY DEFAULT AS IDENTITY,
    color_name VARCHAR NOT NULL
);
INSERT INTO color (color_name)
VALUES ('White');

-- inserte otra fila con un valor para la color_idcolumna:

INSERT INTO color (color_id, color_name)
VALUES (2, 'Yellow');
--A diferencia del ejemplo anterior que usa la GENERATED ALWAYS AS identity restricci�n, la declaraci�n anterior funciona perfectamente bien.







--Puede agregar columnas de identidad a una tabla existente mediante el siguiente formulario de la ALTER TABLEdeclaraci�n:

CREATE TABLE shape (
    shape_id INT NOT NULL,
    shape_name VARCHAR NOT NULL
);

select * from shape 
En segundo lugar, cambie la shape_idcolumna a la columna de identidad:

ALTER TABLE shape 
ALTER COLUMN shape_id ADD GENERATED ALWAYS AS IDENTITY;

Tenga en cuenta que shape_iddebe tener la NOT NULLrestricci�n para que se pueda cambiar a una columna de identidad. De lo contrario, obtendr� un error de la siguiente manera:

--ERROR:  column "shape_id" of relation "shape" must be declared NOT NULL before identity can be added
--SQL state: 55000
