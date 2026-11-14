-- Seleccionar la base de datos
USE MiAutoPuntoCom;

-- 10 vehículos de prueba
INSERT INTO Vehiculos
(marca, modelo, anio, color, precio, vin, tipo, estado)
VALUES
('Toyota', 'Corolla', 2022, 'Blanco', 12500000.00,
'JTDBR32E720054321', 'Sedan', 'Usado'),

('Hyundai', 'Tucson', 2024, 'Gris', 18900000.00,
'KMHDU46D09U123456', 'SUV', 'Usado'),

('Honda', 'Civic', 2020, 'Negro', 10500000.00,
'1HGFA16526L123456', 'Sedan', 'Usado'),

('Nissan', 'Sentra', 2023, 'Rojo', 14200000.00,
'3N1AB7AP4KY123456', 'Sedan', 'Usado'),

('Kia', 'Sportage', 2025, 'Azul', 22500000.00,
'KNAFX4A68F5123456', 'SUV', 'Nuevo'),

('Suzuki', 'Vitara', 2021, 'Blanco', 11500000.00,
'JS2YC5A31D6123456', 'SUV', 'Usado'),

('Ford', 'Ranger', 2024, 'Gris', 24500000.00,
'1FMCU0GD9HUA12345', 'Pick-up', 'Usado'),

('Mazda', 'Mazda 3', 2022, 'Rojo', 13800000.00,
'JM1BL1SG8A1123456', 'Sedan', 'Usado'),

('Volkswagen', 'Jetta', 2026, 'Negro', 19500000.00,
'3VWFE21C04M123456', 'Sedan', 'Nuevo'),

('Chevrolet', 'Tracker', 2026, 'Plata', 21000000.00,
'3G1BE6SM8HS123456', 'SUV', 'Nuevo');


-- 6 clientes de prueba
INSERT INTO Clientes
(nombre, apellido, cedula, telefono, email, direccion)
VALUES
('Carlos', 'Rodriguez', '101230456', '88881111',
'carlos.rodriguez@example.com', 'San Jose, Costa Rica'),

('Maria', 'Fernandez', '205670890', '88882222',
'maria.fernandez@example.com', 'Cartago, Costa Rica'),

('Jose', 'Vargas', '304560789', '88883333',
'jose.vargas@example.com', 'Alajuela, Costa Rica'),

('Ana', 'Mora', '109870654', '88884444',
'ana.mora@example.com', 'Heredia, Costa Rica'),

('Luis', 'Jimenez', '402340567', '88885555',
'luis.jimenez@example.com', 'San Carlos, Costa Rica'),

('Sofia', 'Castro', '506780123', '88886666',
'sofia.castro@example.com', 'Limon, Costa Rica');


-- 4 vendedores de prueba
INSERT INTO Vendedores
(nombre, apellido, cedula, fecha_nacimiento,
fecha_contratacion, comision)
VALUES
('Daniel', 'Solano', '101110222', '1988-05-15',
'2018-07-10', 8.50),

('Valeria', 'Campos', '202220333', '1990-09-22',
'2020-03-01', 10.00),

('Andres', 'Rojas', '303330444', '1994-02-10',
'2021-06-15', 12.50),

('Gabriela', 'Perez', '404440555', '1997-11-30',
'2023-01-09', 7.00);


-- 8 ventas de prueba
INSERT INTO Ventas
(id_vehiculo, id_cliente, id_vendedor,
fecha_venta, precio_final, metodo_pago)
VALUES
(1, 1, 1, '2026-08-15', 12300000.00, 'Efectivo'),

(2, 2, 2, '2026-09-03', 18500000.00, 'Financiamiento'),

(3, 3, 1, '2026-09-18', 10100000.00, 'Tarjeta'),

(4, 4, 3, '2026-10-10', 13900000.00, 'Efectivo'),

(5, 5, 2, '2026-10-25', 21900000.00, 'Financiamiento'),

(6, 6, 4, '2026-11-02', 11200000.00, 'Tarjeta'),

(7, 1, 3, '2026-11-07', 23900000.00, 'Financiamiento'),

(8, 2, 1, '2026-11-10', 13500000.00, 'Efectivo');
