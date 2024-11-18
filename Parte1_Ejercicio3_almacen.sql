CREATE DATABASE inventario_almacen;
USE inventario_almacen;

CREATE TABLE proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT UNIQUE NOT NULL,
    cantidad_disponible INT NOT NULL,
    fecha_ultima_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE suministro (
    id_proveedor INT NOT NULL,
    id_producto INT NOT NULL,
    costo_suministro DECIMAL(10, 2) NOT NULL,
    fecha_suministro DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_proveedor, id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

INSERT INTO proveedor (nombre, direccion, telefono, email) VALUES
('Proveedores S.A.', 'Av. Amazonas 1000, Quito', '0998765432', 'contacto@proveedores.ec'),
('Distribuciones El Sol', 'Calle Loja 200, Guayaquil', '0423456789', 'ventas@elsol.com.ec'),
('Comercial Pacífico', 'Calle Junín 50, Manta', '0523456789', 'info@comercialpacifico.ec');

INSERT INTO categoria (nombre, descripcion) VALUES
('Alimentos', 'Productos alimenticios como cereales, conservas, etc.'),
('Electrónica', 'Productos electrónicos como televisores, computadoras, etc.'),
('Ropa', 'Ropa y accesorios para todas las edades.');

INSERT INTO producto (nombre, descripcion, precio, id_categoria) VALUES
('Arroz Súper', 'Arroz de grano largo', 0.85, 1),
('Televisor 40"', 'Televisor LED de 40 pulgadas', 250.00, 2),
('Camiseta algodón', 'Camiseta de algodón para adultos', 12.50, 3),
('Lente de contacto', 'Lentes de contacto desechables', 25.00, 3),
('Atún en conserva', 'Atún en conserva de 200g', 1.25, 1);

INSERT INTO inventario (id_producto, cantidad_disponible, fecha_ultima_actualizacion) VALUES
(1, 500, '2024-11-17 08:00:00'),
(2, 100, '2024-11-17 08:00:00'),
(3, 150, '2024-11-17 08:00:00'),
(4, 200, '2024-11-17 08:00:00'),
(5, 300, '2024-11-17 08:00:00');

INSERT INTO suministro (id_proveedor, id_producto, costo_suministro, fecha_suministro) VALUES
(1, 1, 0.65, '2024-11-01 10:00:00'),
(1, 5, 0.95, '2024-11-02 11:00:00'),
(2, 2, 180.00, '2024-11-10 12:00:00'),
(2, 3, 8.50, '2024-11-11 14:00:00'),
(3, 4, 22.00, '2024-11-15 09:00:00');
show tables;


