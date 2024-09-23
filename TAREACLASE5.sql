use cursobd;
select * from clientes;

--- - Ejercicios
---- 1- Insertar 8 clientes con definición de campos desordenado

insert into clientes (apellido, nombre, direccion, cuit) values
('Gimenez', 'Pablo', 'sancho Panza 333', 21344567890),
('Gonzalez', 'sebastian', 'mexico 2234', 27032347639),
('Colapinto', 'Gustavo', 'Lules 2345', 27328739812),
('Marconi', 'Jose Luis', 'Ruta 66', 22382783652),
('Fravega', 'Tomas', 'Av Rivadavia 12', 21327612340),
('Codini', 'Pablo', 'gaiza 2345', 20327651349),
('Maya', 'Claudia', 'Azteca 333', 20050813467),
('Sosa', 'Juana del carmen', 'Av Avellaneda 2342', 27237654121);

---- 2- Insertar 5 articulos sin definición de campos
select * from articulos;

insert into articulos values
(19, 'Tomate relleno', 9500, 20),
(20, 'Pastel de papas', 12000, 15),
(21, 'Ñoquis con Bolognesa', 11000, 15),
(22, 'Sushi', 2000, 100),
(23, 'ribs con batatas a la barbacoa', 15200, 11);


---- 3- Actualizar el nombre del cliente de codigo 10 a Jose
update clientes set nombre = 'Jose' where codigo=10;
select * from clientes;

---- 4- Actualizar el nombre, apellido y dni del cliente de codigo 3
---- a Pablo Fuentes 21053119875
update clientes set nombre='Pablo', apellido= 'Fuentes', cuit=21053119875 where codigo=3; 

---- 5- Actualizar la dirección del cliente de codigo 2 a vacío
update clientes set direccion='' where codigo=2;


--- 6- Actualizar las direcciones de los clientes de codigo 21, 23 y 26 a 
--- 'null'

insert into clientes  (nombre,apellido, cuit, direccion) values
('Malena', 'Quiroz', 21349874563, 'andrade 2345'),
('Lautaro', 'Manicomio', 21445761298, 'Inca 2345'),
('Claudio', 'Azteca', 27954326622, 'Local 23'),
('Sergio', 'Juanfer', 27435679832, 'Av de los Incas 3245'),
('Pablo', 'Sosa', 27239872453, 'Tomassin 32'),
('Belen', 'Quiroz', 21349874563, 'Julian Alvarez 3496'),
('Maria de los Angeles', 'Garcia', 27064329854, 'Acoyte 32');

update clientes set direccion= null where codigo in(21,23,26);
select * from clientes;

---- 7- Eliminar los clientes con apellido Perez
delete from clientes where apellido like Perez;

--- 8- Eliminar los clientes con cuit que termine en 0
delete from clientes where cuit like __________0;

--- 9- Eliminar los clientes cuyo nombre contenga un r y su apellido termine
--- con z
delete from clientes where nombre like '%r%' and apellido like 'z%';

--- 10- Aumentar un 20% los precios de los artículos que tengan precio
--- menor o igual a 500
update articulos set precio = precio * 1.2 where precio <=500;

--- 11- Aumentar un 15% los precios de los artículos con precio mayor a 500
update articulos set precio = precio * 1.15 where precio >500;

--- 12- Bajar un 5% los precios de los artículos con precio mayor a 2000 
--- pero menor a 100000
update articulos set precio = precio * 0.95 where precio >2001 and precio <999999;

--- 13- Bajar el 50% del precio de los artìculos que tengan precio entre
--- 2000 y 4000
update articulos set precio = precio * 0.50 where precio >=2000 and precio <=4000;

--- 14- Aumentar el stock a 200 a todos aquellos productos que tengan el 
--- stock mayor a 0 y hasta 150
update articulos set stock = +00 where stock >=0 and stock <150;

--- 15- Eliminar los articulos con stock menor a 0
delete from articulos where stock <o;

 
--- 16- Eliminar todos los articulos cuyo precio sea mayor a 50.000
delete from articulos where precio >50000;

select * from clientes;
