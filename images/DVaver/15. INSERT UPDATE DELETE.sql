-- DML
-- select   Insert   Delete update
-- INSERT

drop table if exists agenda;

 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );
--Informacion de la metadata
--Consulta de las columnas de la tabla agenda
 select table_name,column_name,udt_name,character_maximum_length 
  from information_schema.columns 
  where table_name = 'agenda';
 
INSERT INTO Nombre_tabla 
[(nombre_columna1, nombre_columna1,nombre_columna n..)]
VALUES (expr1, expr2, expr n...)

--Insercion (tener en cuenta orden y las restricciones)
 insert into agenda (apellido, nombre, domicilio, telefono)
  values ('Moreno','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre, domicilio, telefono)
  values ('Torres','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
   values('Alvarez','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre,domicilio,telefono)
   values('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
   values('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
   values('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
   values('Salas','Susana','Gral. Paz 1234','4123456');
  
select * from agenda a ;
-- ELIMINAR OBJETO  (tablas, vistas, bases de datos... etc)
 drop table agenda;

select * from agenda;

-- DELETE     -- cuidado

DELETE FROM Nombre_Tabla
[WHERE { condici�n }]

 delete from agenda     -- eliminas registros  
 where nombre='Juan';

 delete from agenda
 where telefono='4545454';

 select * from agenda;

 delete from agenda;

 select * from agenda;
 
-- UPDATE

UPDATE Nombre_tabla
SET nombre_columna1 = expr1, nombre_columna2 = expr2,..
[WHERE { condici�n }]

select * from agenda;

 update agenda
 set  telefono='9995566', nombre='Patrick Jose'
  where nombre='Alberto';

 select * from agenda;

 update agenda set telefono='4445566'
  where telefono='4545454';

 select * from agenda;

 update agenda set nombre='Juan Jose'
  where nombre='Juan';

 select * from agenda

 -------------------- INSERT - UPDATE CON SELECT 
