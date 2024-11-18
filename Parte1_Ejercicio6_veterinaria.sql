CREATE DATABASE clinica_veterinaria;
USE clinica_veterinaria;

CREATE TABLE veterinario (
    id_veterinario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(15)
);

CREATE TABLE animal (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(50),
    raza VARCHAR(50),
    edad INT,
    dueno VARCHAR(100)
);

CREATE TABLE consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    motivo TEXT,
    diagnostico TEXT,
    id_veterinario INT NOT NULL,
    id_animal INT NOT NULL,
    FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario),
    FOREIGN KEY (id_animal) REFERENCES animal(id_animal)
);

CREATE TABLE tratamiento (
    id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    duracion INT COMMENT 'Duración en días'
);

CREATE TABLE medicamento (
    id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dosis VARCHAR(50),
    instrucciones TEXT
);

CREATE TABLE consulta_tratamiento (
    id_consulta INT NOT NULL,
    id_tratamiento INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    PRIMARY KEY (id_consulta, id_tratamiento),
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta),
    FOREIGN KEY (id_tratamiento) REFERENCES tratamiento(id_tratamiento)
);

CREATE TABLE tratamiento_medicamento (
    id_tratamiento INT NOT NULL,
    id_medicamento INT NOT NULL,
    dosis_especifica VARCHAR(50),
    PRIMARY KEY (id_tratamiento, id_medicamento),
    FOREIGN KEY (id_tratamiento) REFERENCES tratamiento(id_tratamiento),
    FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento)
);

INSERT INTO veterinario (nombre, especialidad, telefono) VALUES
('Adrian Caiza', 'Medicina General', '0987654321'),
('Jhonny Villanueva', 'Cirugía Veterinaria', '0981234567'),
('Erick Nuñez', 'Dermatología Veterinaria', '0976543210');

INSERT INTO animal (nombre, especie, raza, edad, dueno) VALUES
('Firulais', 'Perro', 'Labrador', 5, 'Juan Pérez'),
('Miau', 'Gato', 'Siames', 3, 'María Gómez'),
('Benny', 'Conejo', 'Rex', 2, 'Carlos Ruiz'),
('Chispa', 'Perro', 'Bulldog', 4, 'Juan Pérez'),
('Luna', 'Gato', 'Persa', 1, 'María Gómez');

INSERT INTO consulta (fecha, motivo, diagnostico, id_veterinario, id_animal) VALUES
('2024-11-10', 'Revisión general', 'Salud general estable', 1, 1),
('2024-11-11', 'Consulta por picaduras', 'Alergia leve', 2, 2),
('2024-11-12', 'Revisión general', 'Salud general excelente', 3, 3),
('2024-11-13', 'Problemas respiratorios', 'Resfriado', 1, 4),
('2024-11-14', 'Revisión general', 'Salud general estable', 2, 5);

INSERT INTO tratamiento (descripcion, duracion) VALUES
('Antibióticos para infección respiratoria', 7),
('Tratamiento para alergias en gatos', 5),
('Desparacitación', 1);

INSERT INTO medicamento (nombre, dosis, instrucciones) VALUES
('Amoxicilina', '500mg', 'Administrar cada 8 horas durante 7 días'),
('Prednisona', '10mg', 'Administrar una vez al día durante 5 días'),
('Fipronil', '1 dosis', 'Aplicar sobre la piel del animal');

INSERT INTO consulta_tratamiento (id_consulta, id_tratamiento, fecha_inicio, fecha_fin) VALUES
(1, 1, '2024-11-10', '2024-11-17'),
(2, 2, '2024-11-11', '2024-11-16'),
(3, 3, '2024-11-12', '2024-11-12'),
(4, 1, '2024-11-13', '2024-11-20'),
(5, 2, '2024-11-14', '2024-11-19');

INSERT INTO tratamiento_medicamento (id_tratamiento, id_medicamento, dosis_especifica) VALUES
(1, 1, '500mg cada 8 horas'),
(2, 2, '10mg una vez al día'),
(3, 3, '1 dosis mensual');
