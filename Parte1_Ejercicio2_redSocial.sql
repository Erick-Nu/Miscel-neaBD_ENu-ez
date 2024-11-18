CREATE DATABASE redSocial;
USE redSocial;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    fecha_creacion DATE NOT NULL
);

CREATE TABLE foto (
    id_foto INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    fecha_subida DATE NOT NULL,
    descripcion TEXT,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE grupo (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_creacion DATE NOT NULL
);

CREATE TABLE comentario (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    contenido TEXT NOT NULL,
    fecha DATETIME NOT NULL,
    id_usuario INT NOT NULL,
    id_foto INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_foto) REFERENCES foto(id_foto) ON DELETE CASCADE
);

CREATE TABLE seguir (
    id_usuario_seguidor INT NOT NULL,
    id_usuario_seguido INT NOT NULL,
    fecha_seguimiento DATE NOT NULL,
    PRIMARY KEY (id_usuario_seguidor, id_usuario_seguido),
    FOREIGN KEY (id_usuario_seguidor) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario_seguido) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE usuario_grupo (
    id_usuario INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    PRIMARY KEY (id_usuario, id_grupo),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo) ON DELETE CASCADE
);

INSERT INTO usuario (nombre, correo, fecha_creacion) VALUES
('Adrian Caiza', 'caiza.adrian@email.com', '2023-01-15'),
('Jhonny Villanueva', 'villa.jhonny@email.com', '2022-11-20'),
('Erick Nuez', 'nuñez.erick@email.com', '2024-02-10'),
('Ana Sanchez', 'ana.sanchez@email.com', '2023-05-30'),
('David Rojas', 'david.rojas@email.com', '2021-07-22');

INSERT INTO foto (url, fecha_subida, descripcion, id_usuario) VALUES
('https://example.com/foto1.jpg', '2024-03-01', 'Atardecer en la playa de Montañita', 1),
('https://example.com/foto2.jpg', '2024-02-25', 'Vista de la ciudad de Quito desde el Teleférico', 2),
('https://example.com/foto3.jpg', '2024-01-10', 'Sendero en el Parque Nacional Cotopaxi', 3),
('https://example.com/foto4.jpg', '2024-03-15', 'Calle típica del centro histórico de Cuenca', 4),
('https://example.com/foto5.jpg', '2024-04-02', 'Mercado artesanal en Otavalo', 5);

INSERT INTO grupo (nombre, descripcion, fecha_creacion) VALUES
('Aventuras en Ecuador', 'Grupo para compartir experiencias y fotos de aventuras en Ecuador.', '2023-05-10'),
('Cultura y Tradición', 'Comunidad para discutir sobre cultura, música y tradiciones ecuatorianas.', '2022-08-05'),
('Fotografía Ecuatoriana', 'Grupo dedicado a la fotografía y lugares turísticos del Ecuador.', '2023-01-17');

INSERT INTO comentario (contenido, fecha, id_usuario, id_foto) VALUES
('¡Qué hermosa vista! Me encantaría visitar este lugar.', '2024-03-02 10:15:00', 2, 1),
('Un lugar increíble, espero poder ir pronto.', '2024-02-26 14:20:00', 3, 2),
('El Cotopaxi siempre impresiona. Muy buena foto.', '2024-01-12 16:45:00', 1, 3),
('Cuenca tiene un encanto único, excelente foto.', '2024-03-16 09:30:00', 5, 4),
('La cultura ecuatoriana es fascinante, me gustaría saber más.', '2024-04-03 18:05:00', 4, 5);

INSERT INTO seguir (id_usuario_seguidor, id_usuario_seguido, fecha_seguimiento) VALUES
(1, 2, '2023-02-10'),
(2, 1, '2023-03-12'),
(3, 4, '2024-01-05'),
(4, 3, '2023-06-25'),
(5, 1, '2024-02-20');

INSERT INTO usuario_grupo (id_usuario, id_grupo, fecha_ingreso) VALUES
(1, 1, '2023-05-15'),
(2, 2, '2023-08-10'),
(3, 3, '2023-01-20'),
(4, 1, '2023-06-05'),
(5, 2, '2023-09-14');
show tables;
