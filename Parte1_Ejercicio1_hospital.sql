CREATE DATABASE hospital;
USE hospital;

CREATE TABLE especialidad (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre_especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(100) UNIQUE,
    id_especialidad INT,
    FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    telefono VARCHAR(15)
);

CREATE TABLE cita (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    observaciones TEXT,
    id_medico INT,
    id_paciente INT,
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

CREATE TABLE diagnostico (
    id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    id_paciente INT,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

INSERT INTO especialidad (nombre_especialidad) VALUES
('Cardiología'),
('Pediatría'),
('Dermatología'),
('Neurología');

INSERT INTO medico (nombre, apellido, telefono, correo, id_especialidad) VALUES
('Adrian', 'Caiza', '0987654321', 'acaiza@hospital.com', 1), 
('Jhonny', 'Villanueva', '0998765432', 'jvillanueva@hospital.com', 2), 
('Erick', 'Nuñez', '0986543210', 'cgarcia@hospital.com', 3), 
('Ana', 'Jimenez', '0999876543', 'ajimenez@hospital.com', 4); 

INSERT INTO paciente (nombre, apellido, fecha_nacimiento, telefono) VALUES
('Luis', 'Mora', '1985-03-15', '0981122334'),
('Sofia', 'Villamar', '1992-06-22', '0994455667'),
('Jorge', 'Quintero', '2001-08-05', '0987788990'),
('Valeria', 'Alvarado', '2010-12-19', '0995544332');

INSERT INTO cita (fecha, hora, observaciones, id_medico, id_paciente) VALUES
('2024-11-20', '10:00:00', 'Chequeo general', 1, 1), 
('2024-11-21', '15:30:00', 'Dolor de cabeza persistente', 4, 2), 
('2024-11-22', '09:45:00', 'Revisión dermatológica', 3, 3), 
('2024-11-23', '08:15:00', 'Vacuna de refuerzo', 2, 4); 

INSERT INTO diagnostico (descripcion, id_paciente) VALUES
('Hipertensión arterial', 1),
('Migraña crónica', 2),
('Alergia a productos químicos', 3),
('Estado de vacunación completo', 4);

show tables;