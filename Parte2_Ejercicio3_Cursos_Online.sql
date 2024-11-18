CREATE DATABASE Cursos_Online;
USE Cursos_Online;

CREATE TABLE instructores (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(100)
);

CREATE TABLE estudiantes (
    EstudianteID INT AUTO_INCREMENT PRIMARY KEY,
    NombreEstudiante VARCHAR(100) NOT NULL,
    FechaInscripcion DATE
);

CREATE TABLE cursos (
    CursoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreCurso VARCHAR(100) NOT NULL,
    FechaInscripcion DATE,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES instructores(InstructorID)
);

CREATE TABLE inscripciones (
    InscripcionID INT AUTO_INCREMENT PRIMARY KEY,
    EstudianteID INT,
    CursoID INT,
    FOREIGN KEY (EstudianteID) REFERENCES estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES cursos(CursoID)
);

CREATE TABLE leccionescompletadas (
    LeccionID INT AUTO_INCREMENT PRIMARY KEY,
    EstudianteID INT,
    CursoID INT,
    LeccionesCompletadas INT,
    FOREIGN KEY (EstudianteID) REFERENCES estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES cursos(CursoID)
);

INSERT INTO instructores (Nombre, Especialidad) VALUES
('Lorena Chulde', 'Bases de datos'),
('Juan Zaldumbide', 'Programación'),
('Yadira Franco', 'Diseño de interfaces'),
('Monica Rhor', 'Redes de computadores'),
('Invonne Mandonado', 'Gestion de protectos');

INSERT INTO estudiantes (NombreEstudiante, FechaInscripcion) VALUES
('Adrin Caiza', '2024-01-15'),
('Jhonny Villanueva', '2024-01-20'),
('Erick Nuñez', '2024-01-25'),
('Pedro Sánchez', '2024-02-01'),
('Carla Andrade', '2024-02-05'),
('Mario Montalvo', '2024-02-10'),
('Rosa Cueva', '2024-02-15'),
('Miguel Chávez', '2024-02-20');

INSERT INTO cursos (NombreCurso, FechaInscripcion, InstructorID) VALUES
('Introducción a MySQL', '2024-01-10', 1),
('Java: clases y objetos', '2024-01-15', 2),
('Introducion a HTML y CSS', '2024-01-20', 3),
('Desarrollo Web', '2024-01-25', 4), 
('Historias de usuario', '2024-02-01', 5);

INSERT INTO cursos (NombreCurso, FechaInscripcion, InstructorID) VALUES
('Aguas y saneamento', '2024-02-02', 1);

INSERT INTO inscripciones (EstudianteID, CursoID) VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 1), 
(5, 4), 
(6, 5), 
(7, 2), 
(8, 3); 

INSERT INTO inscripciones (EstudianteID, CursoID) VALUES
(1, 2),
(2, 1),
(3, 4);

INSERT INTO leccionescompletadas (EstudianteID, CursoID, LeccionesCompletadas) VALUES
(1, 1, 5), 
(2, 2, 8), 
(3, 3, 6), 
(4, 1, 2), 
(5, 4, 12), 
(6, 5, 10), 
(7, 2, 4), 
(8, 3, 3); 

-- 1. Consultas de seleccion basica
-- a)	Selecciona todos los datos de los estudiantes en la plataforma de cursos online.
select * from estudiantes;

-- b)	Muestra solo los nombres de los cursos y sus fechas de inscripción.
select NombreCurso, FechaInscripcion from cursos;

-- c)	Encuentra los cursos que están siendo impartidos por más de un instructor.
select c.CursoID, c.NombreCurso, COUNT(distinct c.InstructorID) as NumInstructores
from cursos as c
group by c.CursoID, c.NombreCurso
having COUNT(distinct c.InstructorID) > 1;

-- d)	Muestra todos los cursos que empiezan con la palabra "Java".
select NombreCurso from cursos
where NombreCurso like 'Java%';

-- Filtros con WHERE, IN, BETWEEN, LIKE
-- a)	Encuentra todos los cursos cuyo título contenga la palabra "Java".
select * from cursos
where NombreCurso like '%Java%';

-- b)	Selecciona los estudiantes que están inscritos en los cursos "'Introducción a MySQL'" y "Introduccion a HTML y CSS".
select e.EstudianteID, e.NombreEstudiante from estudiantes as e
join inscripciones as i on e.EstudianteID = i.EstudianteID
join cursos as c on c.CursoID = i.CursoID
where c.NombreCurso in ('Introducción a MySQL','Introducion a HTML y CSS');

-- c)	Muestra los cursos en los que no hay estudiantes inscritos.
select c.CursoID, c.NombreCurso from cursos as c
left join inscripciones as i on c.CursoID = i.CursoID
where i.EstudianteID is null;

-- d)	Encuentra los estudiantes que están inscritos en el curso "Desarrollo Web" y tienen más de 10 lecciones completadas.
select e.NombreEstudiante, c.NombreCurso, lc.LeccionesCompletadas
from estudiantes as e
join inscripciones as i on e.EstudianteID = i.EstudianteID
join cursos as c on i.CursoID = c.CursoID
join leccionescompletadas as lc on e.EstudianteID = lc.EstudianteID and c.CursoID = lc.CursoID
where c.NombreCurso = 'Desarrollo Web' and lc.LeccionesCompletadas > 10;

-- Agrupación y Agregación con GROUP BY y HAVING
-- a)	Muestra la cantidad de cursos que cada instructor imparte en la plataforma de cursos online.
select i.InstructorID, i.Nombre, COUNT(c.CursoID) as CantidadCursos
from instructores as i
left join cursos as c on i.InstructorID = c.InstructorID
group by i.InstructorID, i.Nombre
order by CantidadCursos desc;

-- b)	Encuentra la cantidad de estudiantes inscritos por curso.
select c.CursoID, c.NombreCurso, COUNT(i.EstudianteID) as CantidadEstudiantes
from cursos as c
left join inscripciones as i on c.CursoID = i.CursoID
group by c.CursoID, c.NombreCurso
order by CantidadEstudiantes desc;

-- c)	Muestra la cantidad total de lecciones completadas por cada estudiante.
select e.EstudianteID, e.NombreEstudiante, 
SUM(lc.LeccionesCompletadas) as TotalLeccionesCompletadas
from estudiantes as e
left join leccionescompletadas as lc on e.EstudianteID = lc.EstudianteID
group by e.EstudianteID, e.NombreEstudiante
order by TotalLeccionesCompletadas desc;

-- Ordenamiento de Resultados con ORDER BY
-- a)	 Lista los cursos en los que se ha registrado algún estudiante, ordenados por fecha de inscripción más reciente.
select distinct c.nombrecurso, c.fechainscripcion
from cursos as c
join inscripciones as i on c.cursoid = i.cursoid
order by c.fechainscripcion desc;

-- b)	Ordena los estudiantes por la fecha de inscripción, de la más reciente a la más antigua.
select nombreestudiante, fechainscripcion
from estudiantes
order by fechainscripcion desc;

-- Subconsultas para Consultas Más Complejas
-- a)	Encuentra los estudiantes que están inscritos en dos o más cursos diferentes.
SELECT e.EstudianteID, e.NombreEstudiante
FROM estudiantes as e
WHERE 
    (SELECT COUNT(DISTINCT i.CursoID)
     FROM inscripciones i
     WHERE i.EstudianteID = e.EstudianteID) >= 2;

-- b)	Muestra los cursos que tienen más de 20 estudiantes inscritos.
SELECT c.CursoID, c.NombreCurso
FROM cursos as c
WHERE 
    (SELECT COUNT(*) 
     FROM inscripciones i 
     WHERE i.CursoID = c.CursoID) > 20;
     
-- Cláusulas de Condición Avanzadas con EXISTS y UNION
-- a)	Encuentra a los estudiantes que están inscritos en dos o más cursos diferentes.
SELECT e.EstudianteID, e.NombreEstudiante
FROM estudiantes as e
WHERE EXISTS (
    SELECT 1
    FROM inscripciones as i1
    WHERE i1.EstudianteID = e.EstudianteID
    GROUP BY i1.EstudianteID
    HAVING COUNT(DISTINCT i1.CursoID) >= 2
);

-- Uso de Funciones de Agregación
-- a)	Calcula el número promedio de lecciones completadas por cada estudiante en la plataforma de cursos online.
SELECT e.EstudianteID, e.NombreEstudiante,
AVG(lc.LeccionesCompletadas) AS PromedioLeccionesCompletadas
FROM estudiantes as e
JOIN leccionescompletadas as lc ON e.EstudianteID = lc.EstudianteID
GROUP BY e.EstudianteID, e.NombreEstudiante;

-- b)	Muestra el número total de lecciones completadas en todos los cursos.
SELECT SUM(lc.LeccionesCompletadas) AS TotalLeccionesCompletadas
FROM leccionescompletadas lc;










