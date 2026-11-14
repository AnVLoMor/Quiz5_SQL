CREATE DATABASE IF NOT EXISTS MiAutoPuntoCom;

USE MiAutoPuntoCom;

-- Tabla de vehículos
CREATE TABLE Vehiculos (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    color VARCHAR(30) NOT NULL,
    precio DECIMAL(12,2) NOT NULL,
    vin VARCHAR(17) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    estado VARCHAR(10) NOT NULL
);

-- Tabla de clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    cedula VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL
);

-- Tabla de vendedores
CREATE TABLE Vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    cedula VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_contratacion DATE NOT NULL,
    comision DECIMAL(5,2) NOT NULL
);

-- Tabla de ventas
CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_vehiculo INT NOT NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    fecha_venta DATE NOT NULL,
    precio_final DECIMAL(12,2) NOT NULL,
    metodo_pago VARCHAR(20) NOT NULL,

    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id_vendedor)
);


-- Restricciones UNIQUE

-- Evitar vehículos con el mismo VIN
ALTER TABLE Vehiculos
ADD CONSTRAINT uq_vehiculos_vin UNIQUE (vin);

-- Evitar clientes con la misma cédula
ALTER TABLE Clientes
ADD CONSTRAINT uq_clientes_cedula UNIQUE (cedula);

-- Evitar clientes con el mismo correo
ALTER TABLE Clientes
ADD CONSTRAINT uq_clientes_email UNIQUE (email);

-- Evitar vendedores con la misma cédula
ALTER TABLE Vendedores
ADD CONSTRAINT uq_vendedores_cedula UNIQUE (cedula);


-- Restricciones CHECK para Vehiculos

-- El año debe estar entre 1900 y 2026
ALTER TABLE Vehiculos
ADD CONSTRAINT chk_vehiculos_anio
CHECK (anio BETWEEN 1900 AND 2026);

-- El precio debe ser mayor que 0
ALTER TABLE Vehiculos
ADD CONSTRAINT chk_vehiculos_precio
CHECK (precio > 0);

-- El estado solo puede ser Nuevo o Usado
ALTER TABLE Vehiculos
ADD CONSTRAINT chk_vehiculos_estado
CHECK (estado IN ('Nuevo', 'Usado'));


-- Restricciones CHECK para Vendedores

-- La comisión debe estar entre 0% y 20%
ALTER TABLE Vendedores
ADD CONSTRAINT chk_vendedores_comision
CHECK (comision BETWEEN 0 AND 20);

-- El vendedor debe tener al menos 21 años
-- al momento de su contratación
ALTER TABLE Vendedores
ADD CONSTRAINT chk_vendedores_edad
CHECK (
    fecha_contratacion >=
    DATE_ADD(fecha_nacimiento, INTERVAL 21 YEAR)
);


-- Restricciones CHECK para Ventas

-- El precio final debe ser mayor que 0
ALTER TABLE Ventas
ADD CONSTRAINT chk_ventas_precio
CHECK (precio_final > 0);

-- Solo se permiten estos métodos de pago
ALTER TABLE Ventas
ADD CONSTRAINT chk_ventas_metodo_pago
CHECK (
    metodo_pago IN (
        'Efectivo',
        'Financiamiento',
        'Tarjeta'
    )
);
