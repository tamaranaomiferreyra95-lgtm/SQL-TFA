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

















