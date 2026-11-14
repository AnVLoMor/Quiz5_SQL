-- =====================================================
-- Consultas.sql - Consultas para MiAutoPuntoCom
-- Quiz #5 SQL - Algoritmos y Estructuras de Datos II
-- Ejecutar DESPUÉS de DDL.sql y DML.sql
-- =====================================================

USE MiAutoPuntoCom;

-- 1. Detalle completo de todas las ventas (JOIN de las 4 tablas)
SELECT v.id_venta,
       v.fecha_venta,
       CONCAT(c.nombre, ' ', c.apellido)            AS cliente,
       CONCAT(ve.nombre, ' ', ve.apellido)          AS vendedor,
       CONCAT(h.marca, ' ', h.modelo, ' ', h.anio)  AS vehiculo,
       v.precio_final,
       v.metodo_pago
FROM Ventas v
JOIN Clientes   c  ON v.id_cliente  = c.id_cliente
JOIN Vendedores ve ON v.id_vendedor = ve.id_vendedor
JOIN Vehiculos  h  ON v.id_vehiculo = h.id_vehiculo
ORDER BY v.fecha_venta DESC;

-- 2. Total vendido y comisión ganada por cada vendedor
SELECT ve.id_vendedor,
       CONCAT(ve.nombre, ' ', ve.apellido)            AS vendedor,
       COUNT(v.id_venta)                              AS cantidad_ventas,
       COALESCE(SUM(v.precio_final), 0)               AS total_vendido,
       COALESCE(SUM(v.precio_final * ve.comision / 100), 0) AS comision_total
FROM Vendedores ve
LEFT JOIN Ventas v ON ve.id_vendedor = v.id_vendedor
GROUP BY ve.id_vendedor, ve.nombre, ve.apellido
ORDER BY total_vendido DESC;

-- 3. Vehículos que todavía no se han vendido (disponibles)
SELECT h.*
FROM Vehiculos h
LEFT JOIN Ventas v ON h.id_vehiculo = v.id_vehiculo
WHERE v.id_venta IS NULL;

-- 4. Clientes que han comprado más de un vehículo
SELECT c.id_cliente,
       CONCAT(c.nombre, ' ', c.apellido) AS cliente,
       COUNT(*)                          AS compras,
       SUM(v.precio_final)               AS total_gastado
FROM Clientes c
JOIN Ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido
HAVING COUNT(*) > 1;

-- 5. Cantidad y monto de ventas por método de pago
SELECT metodo_pago,
       COUNT(*)          AS cantidad,
       SUM(precio_final) AS total
FROM Ventas
GROUP BY metodo_pago
ORDER BY total DESC;

-- 6. Ranking de marcas vendidas, de la más vendida a la menos vendida
SELECT h.marca,
       COUNT(*)            AS unidades_vendidas,
       SUM(v.precio_final) AS total_vendido
FROM Ventas v
JOIN Vehiculos h ON v.id_vehiculo = h.id_vehiculo
GROUP BY h.marca
ORDER BY unidades_vendidas DESC, total_vendido DESC;

-- 7. Ventas realizadas en un mes específico (septiembre 2026)
SELECT *
FROM Ventas
WHERE fecha_venta BETWEEN '2026-09-01' AND '2026-09-30';

-- 8. Vehículos con precio mayor al promedio (subconsulta)
SELECT marca, modelo, anio, precio
FROM Vehiculos
WHERE precio > (SELECT AVG(precio) FROM Vehiculos)
ORDER BY precio DESC;

-- 9. Descuento otorgado en cada venta (precio de lista vs. precio final)
SELECT v.id_venta,
       CONCAT(h.marca, ' ', h.modelo) AS vehiculo,
       h.precio                       AS precio_lista,
       v.precio_final,
       h.precio - v.precio_final      AS descuento
FROM Ventas v
JOIN Vehiculos h ON v.id_vehiculo = h.id_vehiculo
ORDER BY descuento DESC;

-- 10. Ingresos totales por mes
SELECT DATE_FORMAT(fecha_venta, '%Y-%m') AS mes,
       COUNT(*)                          AS ventas,
       SUM(precio_final)                 AS ingresos
FROM Ventas
GROUP BY DATE_FORMAT(fecha_venta, '%Y-%m')
ORDER BY mes;
