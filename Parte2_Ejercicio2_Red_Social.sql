create database red_social;
use red_social;
create table usuarios(
	id int auto_increment primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int not null,
    ciudad varchar(50) not null,
    seguidores int not null,
    fotosPublicadas int not null
);
create table fotos(
	id int auto_increment primary key,
    usuario_id int not null,
    constraint fk_usuario_id foreign key (usuario_id) references usuarios(id) on delete cascade,
    descripcion varchar(255),
    fecha datetime,
    meGusta int not null
);
create table comentarios(
	id int auto_increment primary key,
    usuario_id int not null,
    constraint fk_usuarios_id  foreign key (usuario_id) references usuarios(id) on delete cascade,
    foto_id int not null,
    constraint fk_foto_id foreign key (foto_id) references fotos(id) on delete cascade,
    comentario text not null,
    fecha datetime not null
);
select * from comentarios;
-- Agregar datos a la tabla usuraios
insert into usuarios (nombre, apellido, edad, ciudad, seguidores, fotosPublicadas) values
('Juan', 'Pérez', 25, 'Ambato', 200, 3),
('Erick', 'Nuñez', 20, 'Cuenca', 350, 5),
('Adrian', 'Caiza', 20, 'Quito', 150, 2),
('Jhonny', 'Villanueva', 25, 'Quito', 400, 4);
-- Agregar datos a la tabla fotos
insert into fotos (usuario_id, descripcion, fecha, meGusta) values
(1, 'Foto en la playa', '2024-11-01 10:00:00', 120),
(1, 'Atardecer en la ciudad', '2024-11-02 18:00:00', 90),
(2, 'Caminata en las montañas', '2024-11-03 09:30:00', 250),
(2, 'Foto familiar', '2024-11-04 14:00:00', 180),
(3, 'Evento deportivo', '2024-11-05 16:00:00', 75),
(4, 'Celebración de cumpleaños', '2024-11-06 20:00:00', 300);
-- Agregar datos a la tabla comentarios
insert into comentarios (usuario_id, foto_id, comentario, fecha) values
(1, 3, 'Hermosa vista, me encanta.', '2024-11-07 10:30:00'),
(2, 1, 'Qué envidia, se ve increíble.', '2024-11-07 11:00:00'),
(3, 2, 'Wow, qué bonito lugar.', '2024-11-07 12:15:00'),
(4, 4, '¡Felicidades, que lo pases bien!', '2024-11-07 13:45:00'),
(1, 5, '¡Gran partido, emocionante!', '2024-11-07 14:30:00'),
(2, 6, 'Espero la hayas pasado genial.', '2024-11-07 15:00:00'),
(3, 1, 'Qué foto más relajante.', '2024-11-07 15:30:00'),
(4, 2, 'El atardecer es precioso.', '2024-11-07 16:00:00'),
(1, 3, 'La naturaleza es increíble.', '2024-11-07 16:30:00'),
(2, 4, '¡Se ve una familia muy unida!', '2024-11-07 17:00:00'),
(3, 5, 'Qué energía en ese evento.', '2024-11-07 17:30:00'),
(4, 6, 'Un cumpleaños inolvidable.', '2024-11-07 18:00:00'),
(1, 2, 'El lugar parece muy tranquilo.', '2024-11-07 18:30:00'),
(2, 1, 'Quiero visitar ese sitio.', '2024-11-07 19:00:00');
-- Consultas de Seleccion Basica
-- a)	Selecciona todos los datos de los usuarios en la red social.
select * from usuarios;
-- b)	Muestra solo los nombres y apellidos de todos los usuarios.
select nombre, apellido from usuarios;
-- c)	Muestra los datos de los usuarios que tienen más de 100 seguidores.
select * from usuarios
where seguidores >= 100;
-- d)	Encuentra los usuarios que viven en la ciudad "Quito".
select nombre, apellido from usuarios
where ciudad in ("Quito");
-- Filtros con WHERE, IN, BETWEEN, LIKE
-- a)	Encuentra todos los usuarios cuya edad esté entre 20 y 30 años.
select * from usuarios
where edad between 20 and 30;
-- b)	Muestra los usuarios cuya ciudad esté entre "Madrid", "Quito" y "Barcelona".
select nombre, apellido, ciudad from usuarios
where ciudad in ("Madrid", "Quito","Barcelona");
-- c)	Encuentra todos los usuarios cuyo nombre comience con "A".
select * from usuarios
where nombre like "A%";
-- d)	Selecciona los usuarios que tengan más de 50 fotos publicadas.
select * from usuarios
where fotosPublicadas >= 50; -- Erick Nuñez
insert into usuarios (nombre, apellido, edad, ciudad, seguidores, fotosPublicadas) values
('Carlos', 'Ramírez', 32, 'Bogotá', 1500, 520),
('Sofía', 'López', 29, 'Lima', 1200, 530),
('Miguel', 'Hernández', 35, 'Quito', 800, 550),
('Laura', 'Torres', 27, 'Santiago', 1100, 510),
('Valeria', 'Castro', 40, 'Buenos Aires', 900, 600);
insert into fotos (usuario_id, descripcion, fecha, meGusta) values
(5, NULL, '2024-11-15 10:00:00', 150),
(6, 'Fiesta en la playa', '2024-11-15 12:00:00', 200),
(7, 'Vista desde la montaña', '2024-11-16 08:30:00', 300),
(8, 'Reunión familiar', '2024-11-16 14:00:00', 250),
(9, 'Evento cultural', '2024-11-16 18:00:00', 400);
insert into comentarios (usuario_id, foto_id, comentario, fecha) values
(1, 1, '¡Me encanta esta foto! Qué buen momento capturado.', '2024-11-15 11:00:00'),
(2, 2, 'Increíble vista, me gustaría visitar algún día.', '2024-11-15 13:00:00'),
(3, 3, 'Muy inspirador, excelente toma.', '2024-11-16 09:00:00'),
(4, 4, 'Qué bonito evento, se ve que fue muy divertido.', '2024-11-16 15:00:00'),
(5, 5, 'Gran foto, transmite mucho.', '2024-11-16 19:00:00'),
(1, 2, 'Las fotos de la playa siempre son hermosas.', '2024-11-15 14:00:00'),
(2, 3, 'Esa montaña se ve espectacular, buena foto.', '2024-11-16 09:30:00'),
(3, 4, 'La familia siempre es lo mejor. Buena captura.', '2024-11-16 16:00:00'),
(4, 5, 'Qué bonito evento cultural, me gustaría asistir.', '2024-11-16 20:00:00'),
(5, 1, 'Gracias por compartir esta hermosa imagen.', '2024-11-15 12:00:00');
select * from usuarios
where fotosPublicadas >= 50;
-- e)	Muestra los usuarios que hayan publicado una foto en el último mes.
select * from fotos
where fecha between '2024-11-01 10:00:00' and '2024-11-17 10:00:00';
-- f)	Encuentra las fotos que contienen la palabra "vacaciones" en su descripción.
select * from fotos
where descripcion like ('%vacaciones%');
select * from fotos
where descripcion like ('%familiar%');
-- Uso de JOIN para Combinar Tablas
-- a)	Lista todos los grupos y sus moderadores en la red social.
-- Creamos una tabla grupos junto a sus moderadores
create table grupos(
    id int auto_increment primary key,
    nombre varchar(50) not null,
    moderador_id int not null,
    constraint fk_moderador foreign key (moderador_id) references usuarios(id)
);
insert into grupos (nombre, moderador_id) values
('Grupo de Tecnología', 1),  
('Grupo de Fotografía', 2),  
('Grupo de Música', 3),      
('Grupo de Viajes', 4),      
('Grupo de Cine', 6),       
('Grupo de Cocina', 3),    
('Grupo de Deportes', 9),   
('Grupo de Literatura', 1),  
('Grupo de Animación', 7);   
select g.nombre as grupo, concat(u.nombre, '  ', u.apellido) as moderador
from grupos as g
join usuarios as u on g.moderador_id = u.id;
-- b)	Encuentra todos los comentarios realizados por un usuario específico.
select c.comentario, c.fecha, f.descripcion as foto, concat(u.nombre, ' ', u.apellido) as usuario
from comentarios as c
join fotos as f on c.foto_id = f.id
join usuarios as u on c.usuario_id = u.id
where c.usuario_id = 4;
-- c)	Muestra los nombres de los usuarios junto con las fotos que han publicado.
select concat(u.nombre, ' ', u.apellido) as usuario, f.descripcion as foto, f.fecha
from fotos f
join usuarios u on f.usuario_id = u.id;
select * from fotos;
-- Agrupación y Agregación con GROUP BY y HAVING
-- a)	Lista el total de fotos publicadas por cada usuario en la red social.
select concat(u.nombre, ' ', u.apellido) as usuario, count(f.id) as total_fotos
from usuarios as u
join fotos as f on u.id = f.usuario_id
group by u.id;
-- b)	Muestra la cantidad de comentarios por foto en la red social.
select f.descripcion as foto, count(c.id) as total_comentarios
from fotos f
join comentarios c on f.id = c.foto_id
group by f.id;
-- c)	Encuentra los usuarios que tienen más de 100 "me gusta" en total.
select concat(u.nombre, ' ', u.apellido) as usuario, sum(f.meGusta) as total_me_gusta
from usuarios u
join fotos f on u.id = f.usuario_id
group by u.id
having sum(f.meGusta) > 100;
-- d)	Muestra el número total de fotos publicadas por cada grupo en la red social.
select g.nombre as grupo, count(f.id) as total_fotos
from grupos g
join usuarios u on g.moderador_id = u.id
join fotos f on u.id = f.usuario_id
group by g.id;
-- Ordenamiento de Resultados con ORDER BY
-- a)	Encuentra las fotos en la red social, ordenadas por la cantidad de "me gusta" de forma descendente.
select f.id, f.descripcion, f.meGusta
from fotos f
order by f.meGusta desc;
-- b)	Ordena los usuarios por el número de seguidores de mayor a menor.
select concat(u.nombre, ' ', u.apellido) as usuario, u.seguidores
from usuarios u
order by u.seguidores desc;
-- Subconsultas para Consultas Más Complejas
-- a)	Encuentra los usuarios de la red social que han comentado en más de 5 fotos.
select u.nombre, u.apellido
from usuarios u
where u.id in (
    select c.usuario_id
    from comentarios c
    group by c.usuario_id
    having count(distinct c.foto_id) > 2
);
-- b)	Muestra las fotos que tienen más de 10 "me gusta".
select f.id, f.descripcion, f.meGusta, 
       (select concat(u.nombre, ' ', u.apellido) 
        from usuarios as u 
        where u.id = f.usuario_id) as nombre_usuario
from fotos as f
where f.meGusta > 10;
-- c)	Encuentra los usuarios que han publicado más de 5 fotos en los últimos 30 días.
select u.nombre, u.apellido
from usuarios u
where u.id in (
    select f.usuario_id
    from fotos f
    where f.fecha between '2024-11-01 10:00:00' and '2024-11-17 10:00:00'
    group by f.usuario_id
    having count(f.id) > 5
);
-- Cláusulas de Condición Avanzadas con EXISTS y UNION
-- a)	Muestra los usuarios de la red social que han publicado fotos o comentarios en al menos un grupo.
select distinct u.nombre, u.apellido
from usuarios u
where exists (
    select 1
    from fotos as f
    join grupos as g ON f.usuario_id = u.id
    where f.usuario_id = u.id
    limit 1
)
or exists (
    select 1
    from comentarios c
    join fotos as f ON c.foto_id = f.id
    join grupos as g ON f.usuario_id = u.id
    where c.usuario_id = u.id
    limit 1
);
-- b)	Encuentra los usuarios que han publicado fotos en más de 3 grupos.
select u.nombre, u.apellido
from usuarios u
where exists (
    select 1
    from fotos as f
    join grupos as g ON f.usuario_id = u.id  
    where f.usuario_id = u.id
    group by g.id
    having COUNT(g.id) > 1
);
-- Uso de Funciones de Agregación
-- b)	Muestra el máximo y el mínimo de "me gusta" recibidos en una foto de la red social.
select MAX(f.meGusta) AS max_meGusta, MIN(f.meGusta) AS min_meGusta
from fotos as f;
-- c)	Calcula el promedio de "me gusta" recibido por cada usuario.
select u.nombre, u.apellido,
avg(f.meGusta) as promedio_meGusta
from usuarios as u
join fotos as f on u.id = f.usuario_id
group by u.id;


