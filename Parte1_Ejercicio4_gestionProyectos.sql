CREATE DATABASE gestion_proyectos;
USE gestion_proyectos;

CREATE TABLE proyecto (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cargo VARCHAR(50)
);

CREATE TABLE tarea (
    id_tarea INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_entrega DATE,
    estado VARCHAR(20) DEFAULT 'pendiente',
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto)
);

CREATE TABLE asignacion_proyecto (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE asignacion_tarea (
    id_asignacion_tarea INT AUTO_INCREMENT PRIMARY KEY,
    id_tarea INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_asignacion DATE NOT NULL,
    horas_trabajadas INT DEFAULT 0,
    FOREIGN KEY (id_tarea) REFERENCES tarea(id_tarea),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

INSERT INTO proyecto (nombre, descripcion, fecha_inicio, fecha_fin) VALUES
('Desarrollo de Software', 'Desarrollo de un nuevo sistema de gestión de clientes.', '2024-01-01', '2024-06-30'),
('Construcción de Infraestructura', 'Construcción de una nueva planta de producción en Guayaquil.', '2024-03-01', '2025-02-28'),
('Investigación de Mercado', 'Estudio de mercado para nuevos productos en la región Sierra.', '2024-02-15', '2024-12-15');

INSERT INTO empleado (nombre, apellido, cargo) VALUES
('Adrian', 'Caiza', 'Desarrollador de Software'),
('Jhonny', 'Villanueva', 'Arquitecto'),
('Erick', 'Nuñez', 'Gerente de Proyectos'),
('Ana', 'Lozano', 'Analista de Mercado'),
('Carlos', 'Díaz', 'Ingeniero Civil'),
('Sofía', 'Mendoza', 'Desarrolladora de Software');

INSERT INTO tarea (id_proyecto, descripcion, fecha_entrega, estado) VALUES
(1, 'Diseño de la base de datos', '2024-03-15', 'pendiente'),
(1, 'Desarrollo de la interfaz de usuario', '2024-05-30', 'pendiente'),
(2, 'Planificación del proyecto', '2024-03-30', 'en progreso'),
(2, 'Construcción de cimientos', '2024-07-01', 'pendiente'),
(3, 'Encuestas a clientes', '2024-05-01', 'en progreso'),
(3, 'Análisis de datos', '2024-10-15', 'pendiente');

INSERT INTO asignacion_proyecto (id_proyecto, id_empleado, fecha_asignacion) VALUES
(1, 1, '2024-01-05'),
(1, 6, '2024-01-10'),
(2, 2, '2024-03-05'),
(2, 3, '2024-03-15'),
(3, 4, '2024-02-20'),
(3, 5, '2024-02-25');

INSERT INTO asignacion_tarea (id_tarea, id_empleado, fecha_asignacion, horas_trabajadas) VALUES
(1, 1, '2024-01-05', 20),
(2, 6, '2024-02-01', 15),
(3, 2, '2024-03-10', 10),
(4, 3, '2024-04-10', 25),
(5, 4, '2024-03-15', 30),
(6, 5, '2024-04-01', 40);
show tables;

