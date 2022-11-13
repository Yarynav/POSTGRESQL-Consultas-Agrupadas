psql postgres; 
CREATE DATABASE desafio2_yaritza_navarrete_001;
\l 
\c desafio2_desafio2_yaritza_navarrete_001
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
\td
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

SELECT * FROM insritos;


-- 1- ¿CUANTOS REGISTRO HAY?
SELECT count(*) FROM inscritos;
-- 16


-- 2- ¿CUANTOS INSCRITOS HAY EN TOTAL?
SELECT sum(cantidad) FROM inscritos;
--774


-- 3- ¿CUALES SON LOS REGISTRO DE MAYOR ANTIGUEDAD?
SELECT * FROM inscritos WHERE fecha = (SELECT fecha FROM inscritos ORDER BY fecha ASC LIMIT 1);
--    44 | 2021-01-01 | Blog
--    56 | 2021-01-01 | Página


-- 4- ¿CUANTÓS INSCRITOS HAY  POR DÍA?
SELECT fecha, SUM(cantidad) AS cantidad_dia FROM inscritos  GROUP BY fecha;
--   fecha    | inscritos_dia 
--------------+---------------
-- 2021-01-08 |           182
-- 2021-01-04 |            93
-- 2021-01-02 |           120
-- 2021-01-07 |            58
-- 2021-01-03 |           103
-- 2021-01-05 |            88
-- 2021-01-01 |           100
-- 2021-01-06 |            30


-- 5- ¿CUANTOS INSCRITOS HAY POR FUENTES?
SELECT fuente, SUM(cantidad) AS total FROM inscritos GROUP BY fuente;
-- fuente | total
----------+-----
 -- Página | 441
 -- Blog   | 333


-- 6- ¿QUE DÍA SE INSCRIBIERON LA MAYOR CANTIDAD DE PERSONAS Y CUÁNTAS SE INSCRIBIERON ESE DÍA?
SELECT fecha, SUM(cantidad) FROM inscritos WHERE fecha=(SELECT fecha FROM inscritos ORDER BY cantidad DESC LIMIT 1) GROUP BY fecha;
--   fecha    | sum 
--------------+-----
--  2021-01-08 | 182


-- 7- ¿QUE DÍA SE INSCRIBIERON LA MAYOR CANTIDAD DE PERSONAS UTILIZANDO EL BLOG Y CUÁNTAS PERSONAS FUERON?
SELECT * FROM inscritos WHERE fuente='Blog' AND fecha=(SELECT fecha FROM inscritos ORDER BY cantidad DESC LIMIT 1);
-- cantidad |   fecha    | fuente 
------------+------------+--------
--       83 | 2021-01-08 | Blog


-- 8- ¿CUANTAS PERSONAS EN PROMEDIO SE INSCRIBEN POR DIA?
SELECT AVG(cantidad) AS promedio FROM (SELECT SUM(cantidad) AS cantidad FROM inscritos GROUP BY fecha) AS total;
--      promedio       
-------------------------
--  96.7500000000000000


-- 9- ¿QUE DÍA SE INSCRIBIERON MÁS DE 50 PERSONAS?
SELECT * FROM (SELECT SUM(cantidad), fecha AS cantidad FROM inscritos GROUP BY fecha) AS total WHERE sum > 50;
-- sum |  cantidad  
-------+------------
-- 182 | 2021-01-08
--  93 | 2021-01-04
-- 120 | 2021-01-02
--  58 | 2021-01-07
-- 103 | 2021-01-03
--  88 | 2021-01-05
-- 100 | 2021-01-01


-- 10- ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
SELECT AVG(cantidad) AS promedio FROM 
    (SELECT SUM(cantidad) AS cantidad FROM inscritos WHERE fecha >= '2021-01-03' GROUP BY fecha) AS total;
--      promedio       
-----------------------
-- 92.3333333333333333




