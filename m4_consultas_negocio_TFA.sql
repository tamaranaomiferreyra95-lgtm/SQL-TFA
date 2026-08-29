CREATE DATABASE Ventas_Tech_DB;
DROP TABLE IF EXISTS FactVentas;
DROP TABLE IF EXISTS DimCliente;
DROP TABLE IF EXISTS DimTerritorio;
DROP TABLE IF EXISTS DimIndustria;
DROP TABLE IF EXISTS DimProducto;
CREATE TABLE DimProducto (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);
CREATE TABLE DimIndustria (
    id_industria INT PRIMARY KEY,
    nombre_industria VARCHAR(100) NOT NULL
);
CREATE TABLE DimTerritorio (
    id_territorio INT PRIMARY KEY,
    region VARCHAR(50) NOT NULL,
    zona VARCHAR(50)
);
CREATE TABLE DimCliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20),
    id_industria INT,
    id_territorio INT,

    FOREIGN KEY (id_industria) REFERENCES DimIndustria(id_industria),
    FOREIGN KEY (id_territorio) REFERENCES DimTerritorio(id_territorio)
);
CREATE TABLE FactVentas (
    id_venta INT NOT NULL,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    canal VARCHAR(50),

    PRIMARY KEY (id_venta, id_producto),

    FOREIGN KEY (id_cliente) REFERENCES DimCliente(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES DimProducto(id_producto)
);
INSERT INTO DimProducto (id_producto, nombre_producto, precio)
VALUES (10, 'Notebook', 500);

INSERT INTO DimProducto (id_producto, nombre_producto, precio)
VALUES (20, 'Mouse', 50);

INSERT INTO DimProducto (id_producto, nombre_producto, precio)
VALUES (30, 'Teclado', 80);

INSERT INTO DimProducto (id_producto, nombre_producto, precio)
VALUES (40, 'Monitor', 300);

INSERT INTO DimProducto (id_producto, nombre_producto, precio)
VALUES (50, 'Impresora', 250.00);

INSERT INTO DimProducto (id_producto, nombre_producto, precio)
VALUES (60, 'Webcam', 120.00);

SELECT * FROM DimProducto;

INSERT INTO DimIndustria (id_industria, nombre_industria)
VALUES (1, 'Automotriz');

INSERT INTO DimIndustria (id_industria, nombre_industria)
VALUES (2, 'Energía');

INSERT INTO DimIndustria (id_industria, nombre_industria)
VALUES (3, 'Salud');

INSERT INTO DimIndustria (id_industria, nombre_industria)
VALUES (4, 'Educación');


SELECT * FROM DimIndustria;

INSERT INTO DimTerritorio (id_territorio, region, zona)
VALUES (1, 'Norte', 'NOA');

INSERT INTO DimTerritorio (id_territorio, region, zona)
VALUES (2, 'Centro', 'Centro');

INSERT INTO DimTerritorio(id_territorio,region,zona)
VALUES (3,'Litoral','Litoral');

SELECT * FROM DimTerritorio;

INSERT INTO DimCliente (id_cliente, nombre, email, telefono, id_industria, id_territorio)
VALUES (1, 'Juan Pérez', 'juan@gmail.com', '11-5555-1111', 1, 1);

INSERT INTO DimCliente (id_cliente, nombre, email, telefono, id_industria, id_territorio)
VALUES (2, 'María Gómez', 'maria@gmail.com', '11-5555-2222', 2, 1);

INSERT INTO DimCliente (id_cliente, nombre, email, telefono, id_industria, id_territorio)
VALUES (3, 'Carlos Ruiz', 'carlos@gmail.com', '11-5555-3333', 3, 2);

SELECT * FROM DimCliente;

INSERT INTO FactVentas
(id_venta, fecha, id_cliente, id_producto, cantidad, precio, canal)
VALUES
(1, '2025-01-10', 1, 10, 2, 500.00, 'Online');

INSERT INTO FactVentas
(id_venta, fecha, id_cliente, id_producto, cantidad, precio, canal)
VALUES
(2, '2025-01-15', 2, 40, 3, 300.00, 'Tienda');

INSERT INTO FactVentas
(id_venta, fecha, id_cliente, id_producto, cantidad, precio, canal)
VALUES
(3, '2025-02-05', 3, 20, 10, 50.00, 'Online');

INSERT INTO FactVentas
(id_venta, fecha, id_cliente, id_producto, cantidad, precio, canal)
VALUES
(4, '2025-02-20', 1, 30, 5, 80.00, 'Tienda');

INSERT INTO FactVentas
(id_venta, fecha, id_cliente, id_producto, cantidad, precio, canal)
VALUES
(5, '2025-03-10', 2, 10, 1, 500.00, 'Online');

INSERT INTO FactVentas
(id_venta, fecha, id_cliente, id_producto, cantidad, precio, canal)
VALUES
(6, '2025-03-15', 3, 50, 2, 250.00, 'Tienda');

INSERT INTO FactVentas
(id_venta, fecha, id_cliente, id_producto, cantidad, precio, canal)
VALUES
(7, '2025-04-01', 1, 60, 4, 120.00, 'Online');

INSERT INTO FactVentas
(id_venta, fecha, id_cliente, id_producto, cantidad, precio, canal)
VALUES
(8, '2025-04-12', 2, 30, 6, 80.00, 'Tienda');

INSERT INTO FactVentas
(id_venta, fecha, id_cliente, id_producto, cantidad, precio, canal)
VALUES
(9, '2025-05-03', 3, 40, 2, 300.00, 'Online');

INSERT INTO FactVentas
(id_venta, fecha, id_cliente, id_producto, cantidad, precio, canal)
VALUES
(10, '2025-05-20', 1, 20, 15, 50.00, 'Tienda');


SELECT * FROM FactVentas;

SELECT 'DimIndustria' AS tabla, COUNT(*) AS cantidad
FROM DimIndustria

UNION ALL

SELECT 'DimTerritorio', COUNT(*)
FROM DimTerritorio

UNION ALL

SELECT 'DimCliente', COUNT(*)
FROM DimCliente

UNION ALL

SELECT 'DimProducto', COUNT(*)
FROM DimProducto

UNION ALL

SELECT 'FactVentas', COUNT(*)
FROM FactVentas;


----Resumen ejecutivo mensual----
SELECT
    -- Extraemos el número del mes de la fecha.
    -- Ejemplo: '2025-01-10' → 1
    MONTH(fecha) AS mes,

    -- Calculamos cuánto dinero se facturó en total
    -- en ese mes: cantidad × precio.
    SUM(cantidad * precio) AS total_facturado,

    -- Contamos cuántos pedidos/registros de venta
    -- hubo en ese mes.
    COUNT(*) AS cantidad_pedidos,

    -- Calculamos cuánto dinero generó, en promedio,
    -- cada pedido del mes.
    AVG(cantidad * precio) AS ticket_promedio

FROM FactVentas

-- Agrupamos las ventas por mes.
-- Calcula los totales de cada mes por separado.
GROUP BY MONTH(fecha)

-- Ordenamos los meses de menor a mayor.
ORDER BY mes;
-----------------------------------------------------------------

---Top 5 de cliente---
SELECT TOP 5
    -- Mostramos el ID del producto.
    id_producto,

    -- Sumamos todas las unidades vendidas
    -- de cada producto.
    SUM(cantidad) AS unidades_vendidas,

    -- Calculamos cuánto dinero generó cada producto
    -- multiplicando cantidad × precio y sumando todas sus ventas.
    SUM(cantidad * precio) AS total_facturado

FROM FactVentas

-- Agrupamos todas las ventas por producto.
-- Así podemos calcular el total de cada producto.
GROUP BY id_producto

-- Ordenamos de mayor a menor facturación.
-- DESC = descendente.
ORDER BY total_facturado DESC;
--------------------------------------------------

--Cliente recurrente---
SELECT
    -- Mostramos el ID del cliente.
    id_cliente,

    -- Contamos cuántos pedidos realizó cada cliente.
    COUNT(*) AS cantidad_pedidos,

    -- Sumamos cuánto dinero gastó cada cliente.
    SUM(cantidad * precio) AS total_gastado

FROM FactVentas

-- Agrupamos las ventas por cliente.
-- De esta manera podemos contar y sumar
-- las compras de cada cliente.
GROUP BY id_cliente

-- Nos quedamos solamente con los clientes
-- que realizaron más de un pedido.
HAVING COUNT(*) > 1

-- Ordenamos de mayor a menor cantidad de pedidos.
ORDER BY cantidad_pedidos DESC;

--------------------------------------------------
-----Meses por encima/por debajo del promedio -----
SELECT
    mes,
    total_facturado,

    -- Comparamos la facturación del mes con el promedio
    CASE
        WHEN total_facturado > promedio_mensual
            THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio

FROM (

    -- Primero calculamos la facturación de cada mes
    SELECT
        MONTH(fecha) AS mes,
        SUM(cantidad * precio) AS total_facturado,

        -- Calculamos el promedio de todos los meses
        AVG(SUM(cantidad * precio)) OVER () AS promedio_mensual

    FROM FactVentas

    -- Agrupamos las ventas por mes
    GROUP BY MONTH(fecha)

) AS resumen_mensual

ORDER BY mes;

-- =========================================================
-- HALLAZGOS
-- =========================================================

-- 1. Enero fue el mes con mayor facturación, con un total de $1.900,
--    superando el promedio mensual de $1.026.

-- 2. Los productos 10 y 40 fueron los que generaron mayor facturación,
--    con $1.500 cada uno.

-- 3. Mayo fue el segundo mes con mayor facturación, con $1.350,
--    también por encima del promedio mensual de $1.026.















