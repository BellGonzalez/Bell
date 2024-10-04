
use cursobd;
-- +++++++++++++++++++++
--   PRIMERA PARTE   --
-- +++++++++++++++++++++

-- Basándose en la tabla articulos, realizar los siguientes puntos:
-- 1) Agregar a la tabla articulos, los campos stockMinimo y stockMaximo.
alter table articulos add stockMinimo int unsigned not null, add stockMaximo int unsigned not null;
select * from articulos;

-- 2) Completar en los registros los valores de los campos stockMinimo y stockMaximo
-- 	teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
-- Desactiva el modo de actualización segura
SET SQL_SAFE_UPDATES = 0;

-- Ejecuta tu consulta de actualización
UPDATE articulos
SET stockMinimo = 10,
    stockMaximo = 100
WHERE stockMinimo >= stockMaximo;

-- Vuelve a activar el modo de actualización segura (opcional)
SET SQL_SAFE_UPDATES = 1;

describe articulos;
SHOW WARNINGS; ---- ver el error


-- 3) Listar los articulos que se deben reponer y qué cantidad se debe reponer de cada artículo.
--	Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad
--	de articulos a reponer es stockMaximo - stock.
SELECT(stockMaximo - stock) Cantidad_a_Reponer
FROM articulos
WHERE stock < stockMinimo;

-- 4) Calcular el valor de venta de toda la mercaderia que hay en stock.
select * from articulos;
select max(precio) from articulos;

-- 5) Calcular el valor de venta + IVA de toda la mercaderia que hay en stock.

SELECT SUM(stock * precio * 1.21)  valor_Con_IVA FROM articulos;

-- +++++++++++++++++++++
--   SEGUNDA PARTE   --
-- +++++++++++++++++++++

-- 1. Crear la tabla 'autos' dentro de la base de datos 'intro' con el siguiente detalle:

-- 	codigo	INTEGER y PK
-- 	marca	VARCHAR(255)
-- 	modelo	VARCHAR(255)
-- 	color	VARCHAR(255)
-- 	anio	INTEGER
-- 	precio	DOUBLE
create table autos(
	codigo integer,
    marca varchar(255),
    modelo varchar(255),
    color varchar(255),
    anio integer,
    precio double,
    primary key (codigo)
    );


-- 2. Cargar la tabla con 20 autos
INSERT INTO autos(codigo, marca, modelo, color,anio, precio) VALUES
(1, 'Toyota', 'Corolla', 'Blanco', '2018', 15000000),
(2, 'Ford', 'ka', 'Rojo', 2017, 13500000),
(3,'Honda', 'Civic', 'azul', 2024, 25000000),
(4,'Chevrolet', 'Cruze', 'Azul', 2020, 18000000),
(5,'Volkswagen', 'Golf', 'Gris', 2021, 17330000),
(6,'Nissan', 'Sentra', 'Plata', 2019, 16000000),
(7,'BMW', 'Serie 3', 'Blanco', 2021, 35000000),
(8,'Audi', 'A4', 'Negro', 2022, 37000000),
(9,'Ford', 'Territory', 'negro', 2022, 40000000),
(10,'Hyundai', 'Elantra', 'Azul', 2019, 15500000),
(11,'Kia', 'Rio', 'Gris', 2018, 14000000),
(12,'Peugeot', '308', 'Rojo', 2020, 19000000),
(13,'Peugeot', '208', 'Blanco', 2020, 17000000),
(14,'Renault', 'Clio', 'Azul', 2016, 12000000),
(15,'Fiat', 'Argo', 'Gris', 2019, 13000700),
(16,'Subaru', 'Impreza', 'Negro', 2010, 7000000),
(17,'Tesla', 'Model 3', 'Blanco', 2021, 45000000),
(18,'Mitsubishi', 'Lancer', 'Plata', 2017, 16000000),
(19,'Volvo', 'S60', 'Azul', 2020, 38000000),
(20,'Jeep', 'Wrangler', 'Verde', 2022, 42000000);


-- 3. Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
select max(precio) from autos;

-- 	b. obtener el precio mínimo.
select min(precio) from autos;

-- 	c. obtener el precio mínimo entre los años 2010 y 2020.
select min(precio) from autos where anio between 2010 and 2020;

-- 	d. obtener el precio promedio.

select avg(precio) from autos;

-- 	e. obtener el precio promedio del año 2024.
select avg(precio) from autos where anio = 2024;

-- 	f. obtener la cantidad de autos.
select count(*) from autos;

-- 	g. obtener la cantidad de autos que tienen un precio entre $30.500.000 y $40.000.000

select count(*) cantidad_de_autos from autos where precio between 30500000 and  40000000;

-- 	h. obtener la cantidad de autos que hay en cada año.
select anio, count(*) cantidad from autos group by anio order by anio;


-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
select count(*) cantidad_de_autos, round(avg(precio),2) precio_promedio from autos group by anio;


-- 	j. obtener la suma de precios y el promedio de precios según marca.
select SUM(precio) suma_de_precios, round(avg(precio),2) precio_promedio from autos having marca;


--  	k. informar los autos con el menor precio.
select * from autos where precio = (select min(precio) from autos);

--  	l. informar los autos con el menor precio entre los años 2014 y 2023
select * from autos where precio = (select min(precio) from autos where anio between 2014 and 2023);

--  	m. listar los autos ordenados ascendentemente por marca,modelo, y el año en forma descendente.
select * from autos order by marca, modelo, anio desc;

--  	n. contar cuantos autos hay de cada marca.
select  marca, count(*) cantidad_de_autos from autos group by marca;


--  	o. borrar los autos del siglo pasado.
delete from autos where anio < 2000 ;

