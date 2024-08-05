
/*

Las bases de datos son sistemas organizados para almacenar y recuperar información de manera eficiente. Una base
de datos relacional como SQL Server es un sistema de gestión de bases de datos (DBMS) que utiliza tablas para
almacenar y organizar los datos. El lenguaje SQL (Structured Query Language) es utilizado para realizar operaciones 
en estas bases de datos, incluyendo la creación, manipulación y consulta de datos.

En el script proporcionado, se muestra la creación de una base de datos llamada "AGENDA_MIS_CONTACTOS_v2024_V3". 
Luego, se definen varias tablas utilizando la instrucción CREATE TABLE. La primera tabla es "CATEGORIA_CONTACTOS" 
que almacena las categorías de los contactos. La segunda es "GENERO" que almacena los géneros de los contactos. 
Finalmente, la tabla "CONTACTOS" almacena la información detallada de los contactos, relacionando las categorías 
y los géneros a través de claves foráneas.

Se insertan datos en las tablas "CATEGORIA_CONTACTOS" y "GENERO" utilizando la instrucción INSERT INTO. Luego, se
insertan datos en la tabla "CONTACTOS" con la misma instrucción.

Se realizan consultas (SELECT) para recuperar datos de las tablas, filtrando por diversos criterios como identificador 
de contacto, nombre, género, etc.

Además, se muestran operaciones de actualización (UPDATE) para modificar registros existentes en la tabla "CONTACTOS",
y operaciones de eliminación (DELETE) para eliminar registros de la misma tabla. También se utilizan los comandos 
TRUNCATE TABLE y DROP TABLE para vaciar y eliminar la tabla "CONTACTOS" respectivamente.

Se crean vistas (CREATE VIEW) para proporcionar una manera predefinida de consultar los datos. Las vistas se utilizan 
para simplificar las consultas recurrentes.

También se definen procedimientos almacenados (CREATE PROCEDURE) para realizar operaciones como obtener contactos 
por fecha o validar la existencia de un contacto antes de realizar una inserción o actualización.

Finalmente, se crean desencadenadores (TRIGGER) que se activan cuando se realizan ciertas operaciones en la tabla
"CONTACTOS", como inserción o actualización, para realizar acciones específicas como mostrar mensajes de alerta.

*/

--CREAREMOS UNA NUEVA BASE DE DATOS LLAMADA AGENDA_MIS_CONTACTOSCREATE
CREATE DATABASE AGENDA_MIS_CONTACTOS_v2024_V3;

--USAREMOS ESA BASE DE DATO 

USE AGENDA_MIS_CONTACTOS_v2024_V3;
GO

--CREAMOS UNA TABLA DE CATEGORÍA:

CREATE TABLE CATEGORIA_CONTACTOS (
    id_categoria int primary key identity (1,1), -- Identificador único de la categoría
    nombre_Categoria varchar(120) -- Nombre de la categoría
);
go

--CREAR UNA TABLA LLAMADA GÉNERO:

CREATE TABLE GENERO (
    id_genero int primary key, -- Identificador único del género
    genero varchar(15) -- Nombre del género
);
go

--VAMOS A CREAR LA TABLA CONTACTOS LA CUAL CONTIENE TODOS LOS DATOS:

CREATE TABLE CONTACTOS(
    id_contacto int primary key identity(1,1) not null, -- Identificador único del contacto
    nombre_contacto varchar(30) not null, -- Nombre del contacto
    apellido_contacto varchar(30) not null, -- Apellido del contacto
    fecha_nacimiento date not null, -- Fecha de nacimiento del contacto
    id_genero int not null, -- Clave externa para el género del contacto
    telefono varchar(15) not null, -- Número de teléfono del contacto
    email varchar(30) not null, -- Correo electrónico del contacto
    direccion varchar(100) not null, -- Dirección del contacto
    id_categoria int not null, -- Clave externa para la categoría del contacto
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA_CONTACTOS (id_categoria), -- Relación con la tabla de categorías
    FOREIGN KEY (id_genero) REFERENCES genero (id_genero) -- Relación con la tabla de géneros
);


--SELECCIONAMOS LAS TABLAS CON LA INSTRUCCION SIGUIENTE:

-- Consulta para mostrar todos los registros de la tabla CONTACTOS
SELECT * FROM CONTACTOS;

-- Consulta para mostrar todos los registros de la tabla CATEGORIA_CONTACTOS
SELECT * FROM CATEGORIA_CONTACTOS;

-- Consulta para mostrar todos los registros de la tabla GENERO
SELECT * FROM GENERO;


--HACEMOS INSERCIÓN DE LOS DATOS EN LA TABLA CATEGORIA_CONTACTOS:

-- Insertar valores en la tabla CATEGORIA_CONTACTOS para representar diferentes categorías de contactos
INSERT INTO CATEGORIA_CONTACTOS VALUES ('Mis mejores Amigos'); -- Categoría para los mejores amigos
INSERT INTO CATEGORIA_CONTACTOS VALUES ('MI Familia'); -- Categoría para la familia
INSERT INTO CATEGORIA_CONTACTOS VALUES ('Compañeros de Estudio'); -- Categoría para compañeros de estudio
INSERT INTO CATEGORIA_CONTACTOS VALUES ('Compañeros de Trabajo'); -- Categoría para compañeros de trabajo
INSERT INTO CATEGORIA_CONTACTOS VALUES ('Mis Estudiantes'); -- Categoría para estudiantes (posiblemente un profesor)
INSERT INTO CATEGORIA_CONTACTOS VALUES ('Amigos de Redes Sociales'); -- Categoría para amigos de redes sociales


--HACEMOS UN SELECT PARA LOS GÉNEROS:

SELECT * FROM CATEGORIA_CONTACTOS


--insertaremos datos en la tabla genero

-- Insertar valores en la tabla GENERO para representar diferentes géneros
INSERT INTO GENERO (id_genero, genero) VALUES (1, 'Femenino'); -- Género femenino
INSERT INTO GENERO (id_genero, genero) VALUES (2, 'Masculino'); -- Género masculino
INSERT INTO GENERO (id_genero, genero) VALUES (3, 'Binario'); -- Género binario
INSERT INTO GENERO (id_genero, genero) VALUES (4, 'No definido'); -- Género no definido

--HACEMOS UN SELECT PARA LOS GÉNEROS:

SELECT * FROM GENERO

--HACEMOS INSERCIÓN DE LOS DATOS EN LA TABLA CONTACTOS:
-- HACEMOS INSERCIÓN DE LOS DATOS EN LA TABLA CONTACTOS:

-- Insertar un nuevo contacto en la tabla CONTACTOS con la siguiente información:
-- Nombre: JUANCITO
-- Apellido: PEÑA
-- Fecha de nacimiento: 1988-09-14
-- Género: 2 (Masculino)
-- Teléfono: 809-111-0001
-- Correo electrónico: JUANCITO@EMAIL.COM
-- Dirección: C/SIEMPRE FELIZ, # 2021
-- Categoría: 1 (Mis mejores Amigos)

INSERT INTO CONTACTOS (nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('JUANCITO', 'PEÑA', '1988-09-14', '2', '809-111-0001', 'JUANCITO@EMAIL.COM', 'C/SIEMPRE FELIZ, # 2021', '1');

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('DARIEL','VAZQUEZ','2021-09-11','2','809-000-00000','DARIEL@EMAIL.COM','C/VIVO BIEN # 2021', '1'); 

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('DANIELA','HICHES','2016-08-24','1','849-222-0000','DANIELA@EMAIL.COM','C/PRINCESA # 2022', '1'); 

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('MARIA','VIZCAINO','1956-10-05','1','809-0101-0101','MARIA@EMAIL.COM','C/MADRE Y SEÑORA # 2021', '1'); 

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('ELIESER','G. P','2005-02-04','2','809-551-1001','BRAYAN@EMAIL.COM','C/JUEGOS Y MAS JUEGOS # 2021', '3'); 

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('VICENTE','MIGUEL','1985-05-20','2','849-558-8977','JUPITER@EMAIL.COM','C/UNIVERSO, Y GALAXIA # 2021', '4'); 

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('MARLENYS','PANIAGUA','1998-09-04','1','829-789-7894','MARLENYS@EMAIL.COM','C/NETFLIX TEMPORADA # 2', '3'); 

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('NOMBRE ACTUALIZAR','ACTUALIZAR','1995-05-13','2','809-895-5214','ACTUALIZAR@EMAIL.COM','AV. LA VIDA ES BELLA # 2021', '3'); 

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('NOMBRE A BORRAR','BORRAR','1999-01-14','1','829-789-7894','BORRAR@EMAIL.COM','C/BORRAR # 2', '4');

-- Agregar 5 registros más:

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('LORENA','HICHES','1990-03-20','2','809-123-4567','lorena.hiches@email.com','C/ALAMEDA #123', '1');

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('CARLOS','PEREZ','1980-07-15','1','809-987-6543','carlos.perez@email.com','C/PRINCIPAL #456', '2');

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('ANA','GARCIA','1975-11-25','2','809-456-7890','ana.garcia@email.com','C/OLIMPO #789', '3');

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('PEDRO','RODRIGUEZ','1988-04-30','1','809-333-5555','pedro.rodriguez@email.com','C/CASTILLO #101', '4');

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('FERNANDA','SANCHEZ','1995-12-10','2','809-876-5432','fernanda.sanchez@email.com','C/ROBLE #202', '1');

-- Insertar registros en la tabla CONTACTOS y relacionarlos con las últimas categorías y géneros
INSERT INTO CONTACTOS (nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES 
('Luisa', 'González', '1990-05-20', 1, '809-123-4567', 'luisa.gonzalez@email.com', 'C/ Principal #123', (SELECT MAX(id_categoria) FROM CATEGORIA_CONTACTOS)),
('Juan', 'Pérez', '1985-08-15', 2, '809-987-6543', 'juan.perez@email.com', 'C/ Secundaria #456', (SELECT MAX(id_categoria)-1 FROM CATEGORIA_CONTACTOS)),
('Ana', 'Martínez', '1978-11-25', 1, '809-456-7890', 'ana.martinez@email.com', 'C/ Terciaria #789', (SELECT MAX(id_categoria)-2 FROM CATEGORIA_CONTACTOS)),
('Pedro', 'Sánchez', '1988-04-30', 2, '809-333-5555', 'pedro.sanchez@email.com', 'C/ Cuaternaria #101', (SELECT MAX(id_categoria)-3 FROM CATEGORIA_CONTACTOS)),
('Fernando', 'López', '1995-12-10', 1, '809-876-5432', 'fernando.lopez@email.com', 'C/ Quinaria #202', (SELECT MAX(id_categoria)-4 FROM CATEGORIA_CONTACTOS));


--PODEMOS HACER SELECT CON FILTRO POR EJEMPLO EL QUE TRAIGA EL CONTACTO CÓDIGO # 4

select * from CONTACTOS where id_contacto='4'

--PODEMOS HACER SELECT CON FILTRO POR EJEMPLO EL QUE TRAIGA EL CONTACTO CUYO NOMBRE SEA IGUAL MARLENYS

select * from CONTACTOS where nombre_contacto='MARLENYS'

--MUESTRAME SOLO EL NOMBRE Y LOS APELLIDO DE LOS CONTACTOS:

select nombre_contacto, apellido_contacto from CONTACTOS

-- CUENTAME CUANTOS REGISTROS TENGO EN MI TABLA DE CONTACTOS;

SELECT COUNT(*) AS 'Total Contactos' FROM CONTACTOS


--CUANTOS CONTACTOS SON FEMENINOS - MUJER:

SELECT COUNT(*) AS 'Total Contactos Género Femenino' FROM CONTACTOS WHERE id_genero='1'

--MOSTRAR LOS CONTACTOS QUE SON FEMENINOS - MUJER:

SELECT nombre_contacto AS 'Total Contactos Género Femenino' FROM CONTACTOS WHERE id_genero='1'

--CUANTOS CONTACTOS SON MASCULINO - HOMBRE:

SELECT COUNT(*) AS 'Total Contactos Género Masculino' FROM CONTACTOS WHERE id_genero='2'

--MOSTRAR LOS CONTACTOS QUE SON FEMENINOS - HOMBRE:

SELECT nombre_contacto AS 'Total Contactos Género Masculino' FROM CONTACTOS WHERE id_genero='2'


--MOSTRAR LOS CONTACTOS CUYO NOMBRE CONTENGA LA LETRA N

select * from CONTACTOS where nombre_contacto like '%n%' 

--MOSTRAR LOS CONTACTOS CUYO NOMBRE CONTENGA LA LETRA MA

select * from CONTACTOS where nombre_contacto like 'DAR%';

--#-MOSTRAR EL NOMBRE, APELLIDO, TELÉFONO. EMAIL Y CUANTO AÑOS DE EDAD TIENEN LOS CONTACTOS:

select id_contacto, nombre_contacto, apellido_contacto,fecha_nacimiento, telefono, email, id_genero,id_categoria,
DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) as [Años de Edad]
From CONTACTOS
order by [Años de Edad] desc


select * from GENERO 

UPDATE  CONTACTOS SET id_genero= '2' where id_contacto ='2'

--VAMOS AHORA HACER USO DEL UPDATE, ES DECIR ACTUALIZAR UN CAMPO O REGISTRO DE UNA TABLA: COMO EJEMPLO EL ID 5

UPDATE  CONTACTOS SET fecha_nacimiento= '2001-09-11' where id_contacto ='2'

UPDATE  CONTACTOS SET fecha_nacimiento= '1993-02-04' where id_contacto ='5'

UPDATE  CONTACTOS SET nombre_contacto ='LORENA' where id_contacto ='8'

UPDATE  CONTACTOS SET apellido_contacto = 'HERNANDEZ' where id_contacto ='8'

--PODEMOS ACTUALIZAR TODOS SUS DATOS AGREGANDO ENTRE CADA DATO UNA COMA:

UPDATE  CONTACTOS SET nombre_contacto= 'LORENA', apellido_contacto= 'HERNANDEZ', id_genero='1', email = 'LORENA@EMIAL.COM' where id_contacto ='8'

--AHORA VAMOS A UTILIZAR POR ULTIMO EL ULTIMO COMANDO DELETE, EL CUAL BORRA EL REGISTRO INDICADO O TODOS LOS REGISTROS SINO ESPECIFICAMOS.

-- Eliminar el registro de la tabla CONTACTOS que tiene el identificador '9'
DELETE FROM CONTACTOS WHERE id_contacto='9';


-- HACEMOS UN SELECT A LA TABLA CONTACTOS:

select * from CONTACTOS 

-- VACIAR TODOS LOS CONTACTOS EN LA TABLA (DDL - TRUNCATE VACÍA LOS DATOS DE LA TABLA Y MANTIENE SU ESTRUCTURA)
-- NO SE UTILIZA WHERE NI FROM YA QUE TRUNCATE TABLE elimina todos los registros de la tabla sin condiciones.
-- LOS DATOS AL SER INSERTADOS NUEVAMENTE TOMARÁN LOS ÍNDICES INICIALES, ES DECIR, 1, 2, 3,... N SI SON INCREMENTALES.
TRUNCATE TABLE CONTACTOS;
GO

-- BORRAR LOS REGISTROS DE LOS CONTACTOS EN LA TABLA: (DML - DELETE BORRA LOS REGISTROS DE LA TABLA)
-- SE UTILIZA FROM Y WHERE PARA ESPECIFICAR QUÉ REGISTROS BORRAR.
-- LOS DATOS EN SUS ÍNDICES RETOMAN EL ÚLTIMO ID ALMACENADO, ES DECIR, SI EL REGISTRO BORRADO CON DELETE ERA 10, 
-- LOS DEMÁS QUE SE INSERTEN SERÁN 11, 12, ... N.
DELETE FROM CONTACTOS;
GO

-- VACIAR TODOS LOS CONTACTOS EN LA TABLA (DDL - DROP ELIMINA LA TABLA COMPLETA, INCLUYENDO SU ESTRUCTURA Y DATOS)
-- NO SE RECUPERARÁN LOS DATOS NI LA ESTRUCTURA DE LA TABLA UNA VEZ QUE SE EJECUTE EL COMANDO DROP.
DROP TABLE CONTACTOS;
GO

SELECT * FROM CONTACTOS;

--select id_contacto, nombre_contacto, apellido_contacto,fecha_nacimiento, telefono, email, id_genero,id_categoria, EDAD

select id_contacto, nombre_contacto, apellido_contacto,fecha_nacimiento, telefono, email, G.genero,CC.nombre_Categoria AS Categoria,
DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) as [Años de Edad]
From CONTACTOS C
JOIN GENERO G ON C.id_genero = G.id_genero
JOIN CATEGORIA_CONTACTOS CC ON C.id_categoria = CC.id_categoria
order by [Años de Edad] desc



CREATE PROCEDURE conulta_fecha (@fechaInicial DATE, @fechaFinal DATE)
AS
BEGIN
select C.id_contacto as 'Codigo', C.nombre_contacto as 'Nombre de Contacto',
       C.apellido_contacto as 'Apellido de Contacto',  
       c.fecha_nacimiento, C.direccion as 'Direccion', C.telefono as [Telefono], 
       CT.nombre_Categoria as 'Categoria de Contacto', g.genero as Genero,
DATEDIFF(YEAR, C.fecha_nacimiento, GETDATE()) as [Edad]
from CONTACTOS C
join CATEGORIA_CONTACTOS CT
on C.id_categoria = CT.id_categoria
join genero g on g.id_genero=c.id_genero
   WHERE c.fecha_nacimiento BETWEEN @fechaInicial AND @fechaFinal
END

SELECT * FROM CONTACTOS ORDER BY fecha_nacimiento ASC

EXEC conulta_fecha @fechaInicial = '1956-10-05', @fechaFinal = '2016-08-24'


--MOSTRAR EL CODIGO, NOMBRE, TELEFONO Y CORREO DE LOS CONTACTOS:
SELECT id_contacto, nombre_contacto, telefono, email FROM CONTACTOS;

--Hacer UNA CONSULTA QUE ME TRAIGA EL CODIGO, NOMBRE, TELEFONO, CATEGORIA DE AMIGO CON EL NOMBRE, POR MEDIO DE UN JOIN.
SELECT C.id_contacto, C.nombre_contacto, C.telefono, CT.nombre_Categoria
FROM CONTACTOS C
JOIN CATEGORIA_CONTACTOS CT ON C.id_categoria = CT.id_categoria;

--HACER UNA CONSULTA QUE ME TRAIGA EL CODIGO, NOMBRE, TELEFONO, CATEGORIA Y GENERO DE AMIGO CON EL NOMBRE, POR MEDIO DE UN JOIN.
SELECT C.nombre_contacto, C.telefono, CT.nombre_Categoria, G.genero
FROM CONTACTOS C
JOIN CATEGORIA_CONTACTOS CT ON C.id_categoria = CT.id_categoria
JOIN genero G ON G.id_genero = C.id_genero;

--HACER UNA CONSULTA QUE ME TRAIGA EL CODIGO, NOMBRE, TELEFONO, CATEGORIA Y GENERO DE AMIGO Y QUE LA CATEGORIA SEA MEJORES AMIGOS, POR MEDIO DE UN JOIN.
SELECT C.nombre_contacto, C.telefono, CT.nombre_Categoria AS 'Categoria'
FROM CONTACTOS C
JOIN CATEGORIA_CONTACTOS CT ON C.id_categoria = CT.id_categoria
WHERE CT.nombre_Categoria = 'Mis mejores Amigos';


--MOSTRAR EL NOMBRE, APELLIDO, TELEGONO, EMAIL, Y DE LOS CONTACTOS QUE SEAN MENORES DE 30 AÑO.

-- Seleccionar el nombre, apellido, teléfono y correo electrónico de los contactos que tienen menos de 30 años de edad
SELECT nombre_contacto, apellido_contacto, telefono, email,
DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS [Años de Edad]
FROM CONTACTOS C
JOIN CATEGORIA_CONTACTOS CT ON C.id_categoria = CT.id_categoria
WHERE DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) <= 30
ORDER BY [Años de Edad] DESC;


--MOSTRAR EL NOMBRE, APELLIDO, TELEGONO, EMAIL, Y DE LOS CONTACTOS QUE SEAN MAYORES DE 30 AÑO.

-- Seleccionar el nombre, apellido, teléfono y correo electrónico de los contactos que tienen más de 30 años de edad
SELECT nombre_contacto, apellido_contacto, telefono, email,
DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS [Años de Edad]
FROM CONTACTOS C
JOIN CATEGORIA_CONTACTOS CT ON C.id_categoria = CT.id_categoria
WHERE DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) >= 30
ORDER BY [Años de Edad] DESC;


--VAMOS A CREAR UNA VISTA CON LOS DATOS EXTRAÍDOS:

-- Crear o alterar una vista llamada V_CONTACTOS con los datos extraídos
CREATE OR ALTER VIEW V_CONTACTOS
AS
SELECT 
    C.id_contacto AS 'Codigo', 
    C.nombre_contacto AS 'Nombre de Contacto',
    C.apellido_contacto AS 'Apellido de Contacto',
    C.fecha_nacimiento,
    C.direccion AS 'Direccion',
    C.telefono AS [Telefono],
    CT.nombre_Categoria AS 'Categoria de Contacto',
    g.genero AS Genero,
    DATEDIFF(YEAR, C.fecha_nacimiento, GETDATE()) AS [Edad]
FROM 
    CONTACTOS C
JOIN 
    CATEGORIA_CONTACTOS CT ON C.id_categoria = CT.id_categoria
JOIN 
    genero g ON g.id_genero = c.id_genero;


SELECT * FROM V_CONTACTOS



--VAMOS A CREAR UN PROCEDIMIENTO QUE VALIDE SI UN CONTACTO YA EXISTE EN LA TABLA Y DE UN MENSAJE DE ALERTA.

CREATE OR ALTER PROCEDURE sp_CrearContactoConValidacion
    @NombreContacto VARCHAR(30),
    @ApellidoContacto VARCHAR(30),
    @Telefono VARCHAR(15),
    @Email VARCHAR(30),
    @Direccion VARCHAR(100),
    @IdCategoria INT,
    @FechaNacimiento DATE,
    @IdGenero INT
AS
BEGIN
    -- Verificar si el contacto ya existe
    IF EXISTS (
        SELECT 1
        FROM CONTACTOS
        WHERE nombre_contacto = @NombreContacto
          AND apellido_contacto = @ApellidoContacto
          AND telefono = @Telefono
    )
    BEGIN
        -- El contacto ya existe, mostrar mensaje de alerta
        PRINT 'ALERTA: El contacto ya existe en la Base de Datos.';
    END
    ELSE
    BEGIN
        -- El contacto no existe, realizar la inserción
        INSERT INTO CONTACTOS (nombre_contacto, apellido_contacto, telefono, email, direccion, id_categoria, fecha_nacimiento, id_genero)
        VALUES (@NombreContacto, @ApellidoContacto, @Telefono, @Email, @Direccion, @IdCategoria, @FechaNacimiento, @IdGenero);
        
        -- Mostrar mensaje de confirmación
        PRINT 'Contacto creado correctamente.';
    END
END;



--LLAMAR EL PROCEDIMIENTO Y EJECUTARLO CON LOS DATOS DEL INSERT:

EXEC sp_CrearContactoConValidacion
    @NombreContacto = 'NOMBRE INSERTAR2',
    @ApellidoContacto = 'APELLIDO INSERTAR2',
    @Telefono = '809-895-5215',
    @Email = 'ACTUALIZAR5@EMIAL.COM',
    @Direccion = 'AV. LA VIDA ES BELLA # 20215',
    @IdCategoria = 3,
    @FechaNacimiento = '1995-05-13', 
    @IdGenero = 2; 


INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('NOMBRE INSERTAR1','APELLIDO INSERTAR1','1995-05-13','2','809-895-5214','ACTUALIZAR@EMAIL.COM','AV. LA VIDA ES BELLA # 2021', '3'); 

SELECT * FROM CONTACTOS



--VAMOS A CREAR UNA VISTA CON LOS DATOS EXTRAIDOS:

-- Crear una vista llamada V_CONTACTOS_VISTA_2 con los datos extraídos
CREATE VIEW V_CONTACTOS_VISTA_2
AS
SELECT 
    C.id_contacto AS 'Codigo', 
    C.nombre_contacto AS 'Nombre de Contacto',
    C.apellido_contacto AS 'Apellido de Contacto',
    C.fecha_nacimiento,
    C.telefono AS [Telefono],
    CT.nombre_Categoria AS 'Categoria de Contacto',
    g.genero AS Genero,
    DATEDIFF(YEAR, C.fecha_nacimiento, GETDATE()) AS [Edad]
FROM 
    CONTACTOS C
JOIN 
    CATEGORIA_CONTACTOS CT ON C.id_categoria = CT.id_categoria
JOIN 
    genero g ON g.id_genero = c.id_genero;

--Hacemos un select a esa vista:

SELECT * FROM V_CONTACTOS_VISTA_2


 --VAMOS A CREAR UNA VISTA CON LOS DATOS EXTRAÍDOS:

-- Crear o alterar una vista llamada V_CONTACTOS_1 con los datos extraídos
CREATE OR ALTER VIEW V_CONTACTOS_1
AS
SELECT 
    C.id_contacto AS 'Codigo', 
    C.nombre_contacto AS 'Nombre de Contacto',
    C.apellido_contacto AS 'Apellido de Contacto',
    C.fecha_nacimiento,
    C.direccion AS 'Direccion',
    C.telefono AS [Telefono],
    CT.nombre_Categoria AS 'Categoria de Contacto',
    g.genero AS Genero,
    DATEDIFF(YEAR, C.fecha_nacimiento, GETDATE()) AS [Edad]
FROM CONTACTOS C
JOIN CATEGORIA_CONTACTOS CT ON C.id_categoria = CT.id_categoria
JOIN genero g ON g.id_genero = c.id_genero;


SELECT * FROM V_CONTACTOS_1

--CREAMOS UN PROCEDIMIENTO ALMACENADO PARA CONSULTAR POR FECHAS LOS CONTACTOS:

CREATE OR ALTER PROCEDURE usp_ObtenerContactosPorFecha (@fechaInicial DATE, @fechaFinal DATE)
AS
BEGIN
    SELECT C.id_contacto AS 'Codigo', 
           C.nombre_contacto AS 'Nombre de Contacto',
           C.apellido_contacto AS 'Apellido de Contacto',  
           c.fecha_nacimiento, 
           C.direccion AS 'Direccion', 
           C.telefono AS 'Telefono', 
           CT.nombre_Categoria AS 'Categoria de Contacto', 
           G.genero AS Genero,
           DATEDIFF(YEAR, C.fecha_nacimiento, GETDATE()) AS 'Edad'
    FROM CONTACTOS C
    JOIN CATEGORIA_CONTACTOS CT ON C.id_categoria = CT.id_categoria
    JOIN genero G ON G.id_genero = C.id_genero
    WHERE C.fecha_nacimiento BETWEEN @fechaInicial AND @fechaFinal
END;

--Para ejecutar este procedimiento almacenado, puedes utilizar el siguiente comando:

EXEC usp_ObtenerContactosPorFecha @fechaInicial = '1988-09-14', @fechaFinal = '1999-01-14';



--VAMOS A CREAR UN PROCEDIMIENTO QUE VALIDE SI UN CONTACTO YA EXISTE EN LA TABLA Y DE UN MENSAJE DE ALERTA.

CREATE OR ALTER PROCEDURE sp_CrearContactoConValidacion
    @NombreContacto VARCHAR(30),
    @ApellidoContacto VARCHAR(30),
    @Telefono VARCHAR(15),
    @Email VARCHAR(30),
    @Direccion VARCHAR(100),
    @IdCategoria INT,
    @FechaNacimiento DATE,
    @IdGenero INT
AS
BEGIN
    -- Verificar si el contacto ya existe
    IF EXISTS (
        SELECT 1
        FROM CONTACTOS
        WHERE nombre_contacto = @NombreContacto
          AND apellido_contacto = @ApellidoContacto
          AND telefono = @Telefono
    )
    BEGIN
        -- El contacto ya existe, mostrar mensaje de alerta
        PRINT 'ALERTA: El contacto ya existe en la Base de Datos.';
    END
    ELSE
    BEGIN
        -- Verificar si la fecha de nacimiento no es NULL
        IF @FechaNacimiento IS NOT NULL
        BEGIN
            -- El contacto no existe y la fecha de nacimiento es válida, realizar la inserción
            INSERT INTO CONTACTOS (nombre_contacto, apellido_contacto, telefono, email, direccion, id_categoria, fecha_nacimiento, id_genero)
            VALUES (@NombreContacto, @ApellidoContacto, @Telefono, @Email, @Direccion, @IdCategoria, @FechaNacimiento, @IdGenero);
            
            -- Mostrar mensaje de confirmación
            PRINT 'Contacto creado correctamente.';
        END
        ELSE
        BEGIN
            -- La fecha de nacimiento es NULL, mostrar mensaje de error
            PRINT 'ERROR: La fecha de nacimiento no puede ser NULL.';
        END
    END
END;


--LLAMAR EL PROCEDIMIENTO Y EJECUTARLO CON LOS DATOS DEL INSERT:

EXEC sp_CrearContactoConValidacion
    @NombreContacto = 'NOMBRE INSERTAR5',
    @ApellidoContacto = 'APELLIDO INSERTAR5',
    @Telefono = '809-895-5214',
    @Email = 'ACTUALIZAR5@EMIAL.COM',
    @Direccion = 'AV. LA VIDA ES BELLA # 20215',
    @IdCategoria = 3,
    @FechaNacimiento = '1995-05-13', 
    @IdGenero = 2; 


select * from CONTACTOS



--VAMOS A CREAR UN PROCEDIMIENTO QUE VALIDE SI UN CONTACTO YA EXISTE EN LA TABLA Y DE UN MENSAJE DE ALERTA.

CREATE OR ALTER PROCEDURE sp_CrearContactoConValidacion
    @NombreContacto VARCHAR(30),
    @ApellidoContacto VARCHAR(30),
    @Telefono VARCHAR(15),
    @Email VARCHAR(30),
    @Direccion VARCHAR(100),
    @IdCategoria INT,
    @FechaNacimiento DATE,
    @IdGenero INT
AS
BEGIN
    -- Verificar si el contacto ya existe
    IF EXISTS (
        SELECT 1
        FROM CONTACTOS
        WHERE nombre_contacto = @NombreContacto
          AND apellido_contacto = @ApellidoContacto
          AND telefono = @Telefono
    )
    BEGIN
        -- El contacto ya existe, mostrar mensaje de alerta
        PRINT 'ALERTA: El contacto ya existe en la Base de Datos.';
    END
    ELSE
    BEGIN
        -- El contacto no existe, realizar la inserción
        INSERT INTO CONTACTOS (nombre_contacto, apellido_contacto, telefono, email, direccion, id_categoria, fecha_nacimiento, id_genero)
        VALUES (@NombreContacto, @ApellidoContacto, @Telefono, @Email, @Direccion, @IdCategoria, @FechaNacimiento, @IdGenero);
        
        -- Mostrar mensaje de confirmación
        PRINT 'Contacto creado correctamente.';
    END
END;


--LLAMAR EL PROCEDIMIENTO Y EJECUTARLO CON LOS DATOS DEL INSERT:

EXEC sp_CrearContactoConValidacion
    @NombreContacto = 'NOMBRE INSERTAR',
    @ApellidoContacto = 'APELLIDO INSERTAR',
    @Telefono = '809-895-5214',
    @Email = 'ACTUALIZAR5@EMAIL.COM',
    @Direccion = 'AV. LA VIDA ES BELLA # 20215',
    @IdCategoria = 3,
    @FechaNacimiento = '1995-05-13', 
    @IdGenero = 2; 

-- Verificar los datos insertados
SELECT * FROM CONTACTOS;


--AHORA VAMOS A CREAR UN PROCEDIMIENTO QUE VALIDE SI UN CONTACTO YA FUE ACTUALIZADO EN LA TABLA Y DE UN MENSAJE DE ALERTA Y CONCATENE EL NOMBRE Y APELLIDO:

CREATE OR ALTER PROCEDURE sp_ActualizarContactoConValidacion
    @NombreContacto varchar(30),
    @ApellidoContacto varchar(30),
    @Telefono varchar(15),
    @Email varchar(30),
    @Direccion varchar(100),
    @IdCategoria int,
    @FechaNacimiento DATE, -- Agrega el campo de fecha de nacimiento
    @IdGenero int -- Agrega el campo de género
AS
BEGIN
    DECLARE @NombreCompleto varchar(60) = @NombreContacto + ' ' + @ApellidoContacto;

    -- Verificar si el contacto ya existe
    IF NOT EXISTS (
        SELECT 1
        FROM CONTACTOS
        WHERE nombre_contacto = @NombreContacto
          AND apellido_contacto = @ApellidoContacto
          AND telefono = @Telefono
    )
    BEGIN
        -- El contacto no existe, mostrar mensaje de alerta
        PRINT 'ALERTA: El contacto "' + @NombreCompleto + '" no existe en la Base de Datos. No se ha realizado la actualización.';
    END
    ELSE
    BEGIN
        -- El contacto existe, realizar la actualización
        UPDATE CONTACTOS
        SET email = @Email,
            direccion = @Direccion,
            id_categoria = @IdCategoria,
            fecha_nacimiento = @FechaNacimiento,
            id_genero = @IdGenero
        WHERE nombre_contacto = @NombreContacto
          AND apellido_contacto = @ApellidoContacto
          AND telefono = @Telefono;

        -- Mostrar mensaje de confirmación
        PRINT 'Contacto "' + @NombreCompleto + '" actualizado correctamente. Fecha de Nacimiento: ' + CONVERT(varchar(10), @FechaNacimiento) + ', Género: ' + CAST(@IdGenero AS varchar(10));
    END
END;



--PROBAMOS ACTUALIZAR UN DATO QUE NO EXISTE EN LA TABLA:

EXEC sp_ActualizarContactoConValidacion
    @NombreContacto = 'NOMBRE A ACTUALIZAR',
    @ApellidoContacto = 'APELLIDO A ACTUALIZAR',
    @Telefono = '809-895-5214',
    @Email = 'ACTUALIZADO@EMAIL.COM',
    @Direccion = 'NUEVA DIRECCIÓN',
    @IdCategoria = 3,
    @FechaNacimiento = '1995-05-13',
    @IdGenero = 2;


	
EXEC sp_CrearContactoConValidacion
    @NombreContacto = 'NOMBRE A ACTUALIZAR',
    @ApellidoContacto = 'APELLIDO A ACTUALIZAR',
    @Telefono = '809-895-5214',
    @Email = 'ACTUALIZAR5@EMAIL.COM',
    @Direccion = 'AV. LA VIDA ES BELLA # 20215',
    @IdCategoria = 3,
    @FechaNacimiento = '1995-05-13', 
    @IdGenero = 2; 



--VAMOS A CREAMOS UN PROCEDIMIENTO QUE BORRE LOS REGISTROS SI EXISTEN CON SU MENSAJE:

CREATE OR ALTER PROCEDURE sp_EliminarContactoConValidacion
    @NombreContacto varchar(30),
    @ApellidoContacto varchar(30),
    @Telefono varchar(15)
AS
BEGIN
    -- Verificar si el contacto existe
    IF NOT EXISTS (
        SELECT 1
        FROM CONTACTOS
        WHERE nombre_contacto = @NombreContacto
          AND apellido_contacto = @ApellidoContacto
          AND telefono = @Telefono
    )
    BEGIN
        -- El contacto no existe, mostrar mensaje de alerta
        PRINT 'ALERTA: El contacto "' + @NombreContacto + ' ' + @ApellidoContacto + '" con teléfono ' + @Telefono + ' no existe en la Base de Datos. No se ha realizado la eliminación.';
    END
    ELSE
    BEGIN
        -- El contacto existe, realizar la eliminación
        DELETE FROM CONTACTOS
        WHERE nombre_contacto = @NombreContacto
          AND apellido_contacto = @ApellidoContacto
          AND telefono = @Telefono;
        
        -- Mostrar mensaje de confirmación
        PRINT 'Contacto "' + @NombreContacto + ' ' + @ApellidoContacto + '" con teléfono ' + @Telefono + ' eliminado correctamente.';
    END
END;



--PROBAMOS CON UN DATO QUE NO EXISTE:

EXEC sp_EliminarContactoConValidacion
    @NombreContacto = 'CONTACTO_INEXISTENTE',
    @ApellidoContacto = 'INEXISTENTE',
    @Telefono = '123-456-7890';



EXEC sp_EliminarContactoConValidacion
    @NombreContacto = 'NOMBRE INSERTAR5',
    @ApellidoContacto = 'APELLIDO INSERTAR5',
    @Telefono = '809-895-5214';



--Puedes crear 3 triggers en SQL Server para ejecutar un mensaje cuando se realice una acción de inserción, 
--actualización o eliminación en la tabla CONTACTOS. Aquí están los 3 triggers:

-- Trigger para inserción

CREATE OR ALTER TRIGGER tr_Insertar_Contactos
ON CONTACTOS
AFTER INSERT
AS
BEGIN
DECLARE @usuario varchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Contacto se Ha Realizado por el usuario: ' + @usuario;
END;


INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('PRUEEBA','TRIGGER','1995-12-10','2','809-876-5432','PRUEBA.TRIGGERS@email.com','C/ROBLE #202', '1');





--Puedes crear 3 triggers en SQL Server para ejecutar un mensaje cuando se realice una acción de inserción, 
--actualización o eliminación en la tabla CONTACTOS. Aquí están los 3 triggers:

-- Trigger para inserción

CREATE TRIGGER tr_Insertar_Contactos1
ON CONTACTOS
AFTER INSERT
AS
BEGIN
DECLARE @usuario varchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Contacto se Ha Realizado por el usuario: ' + @usuario;
END;







-- Trigger para inserción capta la el usuario, fecha y la hora:
-- Trigger para inserción
CREATE TRIGGER tr_Insertar_Contactos_fechaHora
ON CONTACTOS
AFTER INSERT
AS
BEGIN
    DECLARE @usuario VARCHAR(30);
    DECLARE @fechaHora VARCHAR(19);
    SET @usuario = SUSER_SNAME();
    SET @fechaHora = CONVERT(VARCHAR(19), GETDATE(), 120); -- Obtiene la fecha y hora actual en formato ISO (YYYY-MM-DD HH:MI:SS)
    PRINT 'Un Nuevo Contacto se Ha Realizado por el usuario: ' + @usuario + ' el ' + @fechaHora;
END;

--tr_Insertar_Contactos_fechaHora

INSERT INTO CONTACTOS(nombre_contacto, apellido_contacto, fecha_nacimiento, id_genero, telefono, email, direccion, id_categoria)
VALUES ('PRUEEBA_FECHA','TRIGGER_HORA','1995-12-10','2','809-876-5432','PRUEBA.TRIGGERS@email.com','C/ROBLE #202', '1');




-- Trigger para actualización
CREATE TRIGGER tr_Actualizar_Contactos
ON CONTACTOS
AFTER UPDATE
AS
BEGIN
DECLARE @usuario varchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Contacto se Ha Actualizado por el usuario: ' + @usuario;
END;



--VAMOS AHORA HACER USO DEL UPDATE, ES DECIR ACTUALIZAR UN CAMPO O REGISTRO DE UNA TABLA: COMO EJEMPLO EL ID 5

UPDATE  CONTACTOS SET fecha_nacimiento= '2001-09-11' where id_contacto ='2'

UPDATE  CONTACTOS SET fecha_nacimiento= '1993-02-04' where id_contacto ='5'



-- Trigger para actualización
CREATE TRIGGER tr_Actualizar_Contactos_Fecha_Hora_PC
ON CONTACTOS
AFTER UPDATE
AS
BEGIN
    DECLARE @usuario VARCHAR(30);
    DECLARE @fechaHoraEquipo VARCHAR(100);
    
    SET @usuario = SUSER_SNAME();
    SET @fechaHoraEquipo = 'Fecha y hora: ' + CONVERT(VARCHAR(19), GETDATE(), 120) + ', Equipo: ' + HOST_NAME();
    
    PRINT 'Un Contacto se Ha Actualizado por el usuario: ' + @usuario + '. ' + @fechaHoraEquipo;
END;




-- Trigger para eliminación
CREATE OR ALTER TRIGGER tr_Eliminar_Contactos
ON CONTACTOS
AFTER DELETE
AS
BEGIN
    DECLARE @usuario VARCHAR(30);
    DECLARE @fechaHoraEquipo VARCHAR(100);
    
    SET @usuario = SUSER_SNAME();
    SET @fechaHoraEquipo = 'Fecha y hora: ' + CONVERT(VARCHAR(19), GETDATE(), 120) + ', Equipo: ' + HOST_NAME();
    
    PRINT 'Un Contacto se Ha Eliminado por el usuario: ' + @usuario + '. ' + @fechaHoraEquipo;
END;


--VAMOS A VACIAR TODOS LOS CONTACTOS EN LA TABLA (DDL - TRUNCATE VACÍA LOS DATOS DE LA TABLA Y LA DEJA INTACTA SU ESTRUCTURA) NO USA WHERE NI FROM
--LOS DATOS AL INSERTARLOS NUEVAMENTE TOMAN EL ORDEN INICIAL, ES DECIR 1, 2, 3...N EN SUS ID SI SON INCREMENTALES.

TRUNCATE TABLE CONTACTOS;
GO

--VAMOS A BORRAR LOS REGISTROS DE LOS CONTACTOS EN LA TABLA: (DML - DELETE BORRA LOS REGISTROS DE LA TABLA), USA FROM Y WHERE, PERO LOS DATOS EN SU ÍNDICE
--RETOMAN EL ULTIMO ID ALMACENADO, ES DECIR SI EL REGISTRO BORRADO CON DELETE ERA 10, AHORA LOS DEMÁS QUE SE INSERTAN SERÁN 11,12,....N, ETC.

DELETE FROM CONTACTOS where id_contacto = '30'
GO

-- Insertar un nuevo contacto
EXEC sp_CrearContactoConValidacion
    @NombreContacto = 'María',
    @ApellidoContacto = 'López',
    @Telefono = '809-123-4567',
    @Email = 'maria.lopez@email.com',
    @Direccion = 'Calle Principal #123',
    @IdCategoria = 1,
    @FechaNacimiento = '1990-03-15', 
    @IdGenero = 1; 

-- Insertar otro nuevo contacto
EXEC sp_CrearContactoConValidacion
    @NombreContacto = 'Carlos',
    @ApellidoContacto = 'González',
    @Telefono = '809-234-5678',
    @Email = 'carlos.gonzalez@email.com',
    @Direccion = 'Avenida Secundaria #456',
    @IdCategoria = 2,
    @FechaNacimiento = '1985-07-20', 
    @IdGenero = 2; 

-- Insertar un tercer nuevo contacto
EXEC sp_CrearContactoConValidacion
    @NombreContacto = 'Ana',
    @ApellidoContacto = 'Martínez',
    @Telefono = '809-345-6789',
    @Email = 'ana.martinez@email.com',
    @Direccion = 'Calle Terciaria #789',
    @IdCategoria = 1,
    @FechaNacimiento = '1993-11-05', 
    @IdGenero = 1; 




--VAMOS A VACIAR TODOS LOS CONTACTOS EN LA TABLA (DDL - DROP ELIMINA LA TABLA O LA BASE DE DATOS COMPLETA INCLUYENDO SU ESTRUCTURA, PRIVILEGIOS, 
--ÍNDICES, RESTRICCIONES, TRIGGER, ETC.), NO SE RECUPERA.

select  * from CONTACTOS;
GO

-- Insertar contactos ficticios
EXEC sp_CrearContactoConValidacion
    @NombreContacto = 'Juan',
    @ApellidoContacto = 'Pérez',
    @Telefono = '809-123-4567',
    @Email = 'juan.perez@email.com',
    @Direccion = 'Calle Principal #123',
    @IdCategoria = 1,
    @FechaNacimiento = '1990-03-15', 
    @IdGenero = 1; 

EXEC sp_CrearContactoConValidacion
    @NombreContacto = 'María',
    @ApellidoContacto = 'González',
    @Telefono = '809-234-5678',
    @Email = 'maria.gonzalez@email.com',
    @Direccion = 'Avenida Secundaria #456',
    @IdCategoria = 2,
    @FechaNacimiento = '1985-07-20', 
    @IdGenero = 2; 

EXEC sp_CrearContactoConValidacion
    @NombreContacto = 'Ana',
    @ApellidoContacto = 'Martínez',
    @Telefono = '809-345-6789',
    @Email = 'ana.martinez@email.com',
    @Direccion = 'Calle Terciaria #789',
    @IdCategoria = 1,
    @FechaNacimiento = '1993-11-05', 
    @IdGenero = 1; 

-- Repite las instrucciones anteriores con datos diferentes según sea necesario
