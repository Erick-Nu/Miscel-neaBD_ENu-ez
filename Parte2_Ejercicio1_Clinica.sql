CREATE DATABASE clinica;
USE clinica;

CREATE TABLE pacientes (
    paciente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    ciudad VARCHAR(50),
    direccion VARCHAR(100)
);

CREATE TABLE doctores (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    especialidad VARCHAR(50)
);

CREATE TABLE medicamentos (
    medicamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion VARCHAR(100)
);

CREATE TABLE consultas (
    consulta_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    doctor_id INT,
    fecha DATE,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
    FOREIGN KEY (doctor_id) REFERENCES doctores(doctor_id)
);

CREATE TABLE recetas (
    receta_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    medicamento_id INT,
    doctor_id INT,
    fecha DATE,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos(medicamento_id),
    FOREIGN KEY (doctor_id) REFERENCES doctores(doctor_id)
);

INSERT INTO pacientes (nombre, apellido, edad, ciudad, direccion) VALUES
('Adrian', 'Caiza', 25, 'Quito', 'Av. Amazonas S6-319'),
('María', 'González', 25, 'Guayaquil', 'Calle 10 de Agosto'),
('Luis', 'Ramírez', 40, 'Cuenca', 'Av. Loja 456'),
('Erick', 'Nuñez', 20, 'Ambato', 'Calle Bolívar 789'),
('Carlos', 'Sánchez', 50, 'Loja', 'Av. Universitaria 101'),
('Sofía', 'Vargas', 28, 'Quito', 'Calle Colón 202'),
('Diego', 'Torres', 22, 'Guayaquil', 'Av. Malecón 303'),
('Lucía', 'Rojas', 33, 'Cuenca', 'Calle Gran Colombia 404'),
('Andrés', 'Castro', 45, 'Ambato', 'Av. Cevallos 505'),
('Laura', 'Mendoza', 29, 'Loja', 'Calle Mercadillo 606');

INSERT INTO doctores (nombre, apellido, especialidad) VALUES
('Carlos', 'Andrade', 'Cardiología'),
('María', 'Fernández', 'Pediatría'),
('Luis', 'Suárez', 'Gastroenterología'),
('Ana', 'López', 'Dermatología'),
('Pedro', 'Martínez', 'Neurología'),
('Rosa', 'Santos', 'Medicina General'),
('Jorge', 'Velasco', 'Ortopedia'),
('Elena', 'Vásquez', 'Oftalmología'),
('Daniel', 'Ruiz', 'Urología'),
('Marta', 'Chávez', 'Endocrinología'),
('Grace', 'Montoya', 'Dermatología'),
('Alexandra', 'Aldaz', 'Neurología'),
('Mario', 'Sanchéz', 'Pediatría');

INSERT INTO medicamentos (nombre, descripcion) VALUES
('Paracetamol', 'Analgésico y antipirético'),
('Ibuprofeno', 'Antiinflamatorio no esteroideo'),
('Amoxicilina', 'Antibiótico de amplio espectro'),
('Lorazepam', 'Ansiolítico y sedante'),
('Omeprazol', 'Protector gástrico'),
('Metformina', 'Medicamento para la diabetes'),
('Losartán', 'Antihipertensivo'),
('Salbutamol', 'Broncodilatador'),
('Dexametasona', 'Corticosteroide'),
('Diclofenaco', 'Antiinflamatorio y analgésico');

INSERT INTO consultas (paciente_id, doctor_id, fecha) VALUES
(1, 1, '2023-02-17'),
(1, 1, '2023-04-13'),
(1, 1, '2023-05-24'),
(1, 1, '2023-08-14'),
(1, 1, '2024-04-28'),
(1, 1, '2024-01-10'),
(2, 2, '2024-01-15'),
(3, 3, '2024-01-20'),
(4, 4, '2024-02-05'),
(5, 5, '2024-02-10'),
(6, 6, '2024-02-15'),
(7, 7, '2024-03-01'),
(8, 8, '2024-03-05'),
(9, 9, '2024-03-10'),
(10, 10, '2024-03-15'),
(5, 5, '2023-11-10'),
(6, 6, '2023-12-15');

INSERT INTO recetas (paciente_id, medicamento_id, doctor_id, fecha) VALUES
(1, 1, 1, '2024-01-11'),
(2, 2, 2, '2024-01-16'),
(3, 3, 3, '2024-01-21'),
(4, 4, 4, '2024-02-06'),
(5, 5, 5, '2024-02-11'),
(6, 6, 6, '2024-02-16'),
(7, 7, 7, '2024-03-02'),
(8, 8, 8, '2024-03-06'),
(9, 9, 9, '2024-03-11'),
(10, 10, 10, '2024-03-16');

# Consultas de Selección Básica
-- a)	Selecciona todos los datos de la tabla pacientes
SELECT * FROM pacientes;

-- b)	Muestra solo los nombres y apellidos de todos los pacientes.
SELECT nombre, apellido FROM pacientes;

-- c)	Selecciona los nombres de los pacientes mayores de 18 años.
SELECT nombre, edad FROM pacientes
WHERE edad > 18;

-- d)	Encuentra todos los pacientes que viven en la ciudad de "Quito".
SELECT * FROM pacientes
WHERE ciudad = 'Quito';

-- e)	Lista las especialidades de los doctores sin duplicados.
SELECT especialidad FROM doctores
GROUP BY especialidad;


# Filtros con WHERE, IN, BETWEEN, LIKE 
-- a)	Encuentra todos los pacientes cuya edad esté entre 20 y 30 años.
SELECT * FROM pacientes 
WHERE edad BETWEEN 20 AND 30;

-- b)	Selecciona a los pacientes cuya ciudad esté entre "Cuenca", "Guayaquil" y "Quito”.
SELECT * FROM pacientes
WHERE ciudad IN ("Cuenca", "Guayaquil", "Quito");

-- c)	Muestra los doctores cuyo apellido comienza con la letra "S".
SELECT * FROM doctores 
WHERE apellido LIKE 's%';

-- d)	Encuentra las consultas que se realizaron en el año 2023.
SELECT * FROM consultas
WHERE fecha LIKE '%2023%';

-- e)	Selecciona los pacientes cuya dirección contiene la palabra "calle".
SELECT * FROM pacientes
WHERE direccion  LIKE '%calle%';

# Uso de JOIN para Combinar Tablas

-- a)	Lista los nombres de los pacientes junto con las fechas de sus consultas.
SELECT p.paciente_id, p.nombre, p.apellido, c.fecha AS fecha_consulta 
FROM pacientes AS p
JOIN consultas AS c 
ON p.paciente_id = c.paciente_id;

-- b)	Muestra el nombre de cada paciente y el nombre de su doctor en cada consulta.
SELECT p.nombre, p.apellido, c.fecha AS fecha_consulta, CONCAT(d.nombre, ' ', d.apellido) AS doctor_asignado
FROM pacientes AS p
JOIN consultas AS c
ON p.paciente_id = c.paciente_id
JOIN doctores AS d
ON c.doctor_id = d.doctor_id;


-- c)	Encuentra los medicamentos prescritos a cada paciente, junto con el nombre del doctor que los recetó
SELECT * FROM recetas;
SELECT
	r.receta_id,
	CONCAT(d.nombre, ' ', d.apellido) AS doctor,
    CONCAT(p.nombre, ' ',p.apellido) AS nombre_paciente, 
    m.nombre AS medicamento_prescrito
FROM recetas AS r
JOIN medicamentos AS m ON r.medicamento_id = m.medicamento_id
JOIN doctores AS d ON r.doctor_id = d.doctor_id
JOIN pacientes AS p ON r.paciente_id = p.paciente_id;

# Agrupación y Agregación con GROUP BY y HAVING
-- a)	Muestra la cantidad de consultas realizadas por cada doctor.
SELECT * FROM consultas;
SELECT CONCAT(d.nombre, ' ', d.apellido) AS nombre_doctor, COUNT(c.doctor_id) AS total_consultas
FROM consultas AS c
JOIN doctores AS d
ON c.doctor_id = d.doctor_id
GROUP BY nombre_doctor;

-- b)	Encuentra el número total de pacientes por cada especialidad médica.
SELECT * FROM doctores;
SELECT d.especialidad, COUNT(c.paciente_id) AS total_pacientes
FROM consultas AS c
JOIN doctores AS d ON c.doctor_id = d.doctor_id
GROUP BY d.especialidad;

# Ordenamiento de Resultados con ORDER BY
-- a)	Selecciona todos los pacientes, ordenándolos de mayor a menor edad.
SELECT * FROM pacientes
ORDER BY edad;

-- b)	Muestra todos los doctores, ordenándolos alfabéticamente por su especialidad.
SELECT * FROM doctores
ORDER BY especialidad; 


# Subconsultas para Consultas Más Complejas
-- a)	Encuentra los pacientes que han tenido más de 5 consultas médicas.
SELECT * FROM (
	SELECT 
		c.paciente_id, 
		CONCAT(p.nombre, ' ', p.apellido) AS nombre_paciente, 
        COUNT(c.paciente_id) AS total_consultas
	FROM consultas AS c
	JOIN pacientes AS p ON c.paciente_id = p.paciente_id
	GROUP BY c.paciente_id
) AS consultas_pacientes
WHERE total_consultas > 5;

-- b)	Lista los pacientes que han tenido una consulta con un médico especializado en "Cardiología".
SELECT * FROM consultas;
SELECT * FROM (
	SELECT 
		c.consulta_id, 
		c.paciente_id, 
		CONCAT(p.nombre,' ', p.apellido) AS nombre_paciente,
		d.especialidad
	FROM consultas AS c
	JOIN doctores AS d ON c.doctor_id = d.doctor_id
    JOIN pacientes AS p ON c.paciente_id = p.paciente_id
) AS consultas_especialidad
WHERE especialidad = 'Cardiología';

# Cláusulas de Condición Avanzadas con EXISTS y UNION
-- a)	Encuentra los pacientes que han realizado consultas médicas y tienen más de 5 registros.
SELECT p.paciente_id, p.nombre, p.apellido 
FROM pacientes AS p
WHERE EXISTS (
	SELECT 1
    FROM consultas AS c 
	WHERE c.paciente_id = p.paciente_id
	GROUP BY paciente_id
	HAVING COUNT(consulta_id) > 5
);

-- b)	Selecciona los doctores que también figuran en la lista de pacientes (si existe algún doctor registrado como paciente).
SELECT d.doctor_id, d.nombre, d.apellido, d.especialidad
FROM doctores AS d
WHERE EXISTS (
	SELECT 1 
	FROM pacientes AS p 
	WHERE d.nombre = p.nombre 
	AND d.apellido = p.apellido
);

# Uso de Funciones de Agregación
-- a)	Calcula el promedio de edad de los pacientes.
SELECT AVG(edad) AS promedio_edad_pacientes
FROM pacientes;

-- b)	Encuentra la cantidad total de medicamentos prescritos en el sistema.
SELECT * FROM recetas;
SELECT COUNT(*) AS total_medicamentos_prescritos
FROM recetas;

-- c) Encuentra el doctor que ha realizado la mayor cantidad de consultas
SELECT d.doctor_id, d.nombre, d.apellido, COUNT(c.consulta_id) AS cantidad_consultas
FROM doctores AS d
JOIN consultas AS c ON d.doctor_id = c.doctor_id
GROUP BY d.doctor_id
ORDER BY cantidad_consultas DESC
LIMIT 1;

