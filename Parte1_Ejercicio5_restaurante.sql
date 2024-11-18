CREATE DATABASE restaurante;
USE restaurante;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE mesa (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL UNIQUE,
    capacidad INT NOT NULL
);

CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    estado VARCHAR(20) NOT NULL,
    id_cliente INT NOT NULL,
    id_mesa INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa)
);

CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_hora_pago DATETIME NOT NULL,
    metodo_pago VARCHAR(20) NOT NULL,
    id_reserva INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
);

INSERT INTO cliente (nombre, apellido, telefono, email) VALUES
('Adrian', 'Caiza', '0998765432', 'adrian.caiza@gmail.com'),
('Jhonny', 'Villanueva', '0987654321', 'jhonny.villanueva@yahoo.com'),
('Erick', 'Nuez', '0976543210', 'erick.nuñez@hotmail.com'),
('Ana', 'Ramírez', '0965432109', 'ana.ramirez@outlook.com');

INSERT INTO mesa (numero, capacidad) VALUES
(1, 4),
(2, 2),
(3, 6),
(4, 8);

INSERT INTO reserva (fecha_hora, estado, id_cliente, id_mesa) VALUES
('2024-11-18 13:00:00', 'Confirmada', 1, 1),
('2024-11-18 14:00:00', 'Pendiente', 2, 2),
('2024-11-19 19:30:00', 'Cancelada', 3, 3),
('2024-11-19 20:00:00', 'Confirmada', 4, 4);

INSERT INTO pago (monto, fecha_hora_pago, metodo_pago, id_reserva) VALUES
(25.50, '2024-11-18 13:30:00', 'Efectivo', 1),
(30.00, '2024-11-18 14:10:00', 'Tarjeta', 2),
(0.00, '2024-11-19 20:10:00', 'N/A', 3), 
(50.75, '2024-11-19 20:30:00', 'Transferencia', 4);

