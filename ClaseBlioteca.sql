CREATE DATABASE biblioteca;

-- Usar la base de datos
USE biblioteca;

-- Crear la tabla libros
-- Crear la base de datos biblioteca de acuerdo al siguiente esquema:

-- -------------    -------------------     -------------     
-- - libros    -    - prestamos       -     - socios    -    
-- -------------    -------------------     -------------     
-- - codigo PK -    - documento   PK FK -     - documento  PK -
-- - titulo    -    - codigo_libro PK FK -     - nombre    -
-- - autor     -    - fecha_prestamo   -       - domicilio -
-- -------------    - fecha_devolucion -     -------------
--                  -------------------                

-- Tabla de libros
CREATE TABLE libros (
    codigo int auto_increment primary key,
    titulo varchar (100) not null,
    autor varchar (100) not null
);

-- Tabla de socios
CREATE TABLE socios (
    documento char (8) PRIMARY KEY,
    nombre varchar(100) not null,
    domicilio varchar(100)
);

-- Tabla de préstamos
CREATE TABLE prestamos (
    documento char(8),
    codigo_libro int,
    fecha_prestamo date not null,
    fecha_devolucion date,
    primary key (documento, codigo_libro),
    foreign key (documento) references socios(documento), -- Clase 11 Referent contiene la ubicacion de un campo
    foreign key (codigo_libro) references libros(codigo)
);

-- insertar 15 registros en cada tabla

INSERT INTO libros (codigo, titulo, autor) values
(1,'Cien años de soledad', 'Gabriel García Márquez'),
(2,'La chica del tren', 'Paula Hawkins'),
(3,'Muerte en el nilo', 'Agatha Christie'),
(4,'El resplandor', 'Stephen King'),
(5,'Misery', 'Stephen King'),
(6,'Cien sonetos de amor', 'Pablo Neruda'),
(7,'El Aleph', 'Jorge Luis Borges'),
(8,'Martin Fierro', 'Jose Hernandez'),
(9,'El amor en los tiempos del cólera', 'Gabriel García Márquez'),
(10,'La casa de los espíritus', 'Isabel Allende'),
(11,'Doce cuentos peregrinos', 'Gabriel García Márquez'),
(12,'Caballo de fuego', 'Florencia Bonelli'),
(13,'Los cuatro acuerdos', 'Dr Miguel Ruiz'),
(14,'Los padecientes', 'Gabriel Rolón'),
(15,'Muchas vidas, muchos Mastros', 'Brian Weiss');


INSERT INTO socios (documento, nombre, domicilio) values
('23567892', 'Juan Pérez', 'Av Avellaneda 1245'),
('34789321', 'Ana Gimenez', 'Acasuzo 234'),
('23896762', 'Pablo Andres Caceres', 'Bogotá 2345'),
('29951327', 'Lucía Fernández', 'Santiago Compostella 23'),
('39876245', 'María Laura García', 'Caracas 5698'),
('55839282', 'Pedro Sánchez', 'México 234'),
('98765431', 'José Gómez', 'Lavalle 156'),
('23896763', 'Laura Torres', 'Montevideo 984'),
('32876349', 'Martín Morales', 'Asunción 2398'),
('37242468', 'Sofía Castillo', 'Segui 23'),
('29087534', 'Francisco Ortega', 'Av Corrientes 1488'),
('40873456', 'Carmen Rodríguez', 'Av Cordoba 3100'),
('32876493', 'Miguel Vargas', 'Sanchez de Loria 345'),
('14568976', 'Elena Ramírez', 'calle 34 3456'),
('23134456', 'Diego Méndez', 'esquina 4 321');



-- Insertar prestamos
INSERT INTO prestamos (documento, codigo_libro, fecha_prestamo, fecha_devolucion) values
('23567892', 1, '2024-11-25', null),
('34789321', 2, '2023-12-24', '2024-07-30'),
('23896762', 3, '2024-11-05', null),
('29951327', 4, '2024-11-05', '2024-11-15'),
('39876245', 5, '2024-11-27', null),
('55839282', 6, '2024-11-10', '2024-11-13'),
('98765431', 7, '2024-09-10', '2024-11-20'),
('23896763', 8, '2024-10-12', '2024-11-27'),
('32876349', 9, '2024-11-21', null),
('37242468', 10, '2024-10-17', '2024-11-21'),
('29087534', 11, '2024-11-17', '2024-11-27'),
('40873456', 12, '2024-08-17', '2024-11-22'),
('32876493', 13, '2023-12-27', '2024-10-02'),
('14568976', 14, '2023-12-17', '2024-03-27'),
('23134456', 15, '2022-01-17', null);

-- 1- qué libros (codigo, titulo, autor) se le prestaron a cada socio?
select 		s.nombre, l.*
from 		libros l 
join		prestamos p on l.codigo=codigo_libro
join		socios s on p.documento=s.documento;

-- 2- Listar los socios (documento, nombre, domicilio) a los que se les prestaron libros de Java
insert into libros (titulo, autor) values
('El codigo Java', 'Fulanito Cosme'),
('Primeros pasos en Java', 'francisco Acuña');

select * from libros;

insert into socios (documento, nombre, domicilio) values
('37456987', 'Paula Cisneros', 'Rosario 245'),
('34876123', 'Ariel Niz', 'Ameghino 21');

insert into prestamos values
('37456987', 16, '2024-11-27', null),
('34876123', 17, '2024-11-27', null);

select 	s.documento, s.nombre, s.domicilio
from 	socios s
join	prestamos p on s.documento=p.documento
join	libros l on p.codigo_libro=l.codigo
where 	l.titulo like '%Java%';


-- 3- Listar los libros (codigo,titulo,autor) que no fueron devueltos 
select 		l.codigo , l.titulo, l.autor
from 		libros l
join		prestamos p on l.codigo=p.codigo_libro
where		fecha_devolucion is null;

-- 4- Lista de socios (documento, nombre, domicilio) que tienen libros sin devolver
select		s.documento, s.nombre, s.domicilio
from		prestamos p
join		socios s on p.documento=s.documento
where		p.fecha_devolucion is null
group by	s.documento;

-- 5- Lista de socios (documento, nombre, domicilio) que tienen libros sin devolver y cuáles son esos libros
select		s.documento, s.nombre, s.domicilio, l.titulo
from		prestamos p
join		socios s 
on          p.documento=s.documento
join		libros l 
on          p.codigo_libro=l.codigo
where		p.fecha_devolucion is null;

-- 6- cantidad de libros sin devolver
select 	count(*) Libros_sin_Devolver
from	prestamos
where	fecha_devolucion is null;

-- 7. Lista de libros que fueron prestados el día de hoy.
select	l.codigo, l.titulo, l.autor
from 	libros l
join	prestamos p on l.codigo=p.codigo_libro
where 	p.fecha_prestamo = curdate();

-- 8- Cantidad de libros que se prestaron este mes
select	count(*) Pretados_en_Noviembre
from 	prestamos p 
where	p.fecha_prestamo 
between '2024-11-01' and '2024-11-30';


-- 9- Cantidad de socios que tomaron libros prestados este mes
select 	count(*) Cantidad_de_socios_que_retiraron_libros_en_Noviembre
from 	prestamos 
where 	month(fecha_prestamo) = month(curdate());







