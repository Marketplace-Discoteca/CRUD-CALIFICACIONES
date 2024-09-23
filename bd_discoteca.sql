CREATE DATABASE sistemaDiscoteca;
USE sistemaDiscoteca;

CREATE TABLE discoteca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL
);

CREATE TABLE servicio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE calificacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    discoteca_id INT,
    servicio_id INT,
    puntuacion INT CHECK(puntuacion >= 1 AND puntuacion <= 5),
    comentario TEXT,
    FOREIGN KEY (discoteca_id) REFERENCES discoteca(id) ON DELETE CASCADE,
    FOREIGN KEY (servicio_id) REFERENCES servicio(id) ON DELETE CASCADE
);


INSERT INTO discotecas_discoteca (nombre, ubicacion) VALUES
('Club Nocturno Eclipse', 'Av. La Marina 500'),
('Fantasía Disco', 'Calle Real 100'),
('Ritmo y Sabor', 'Jr. Las Rosas 45'),
('Electro Nights', 'Av. Larco 300'),
('La Noche Bohemia', 'Calle Principal 123');

INSERT INTO discotecas_servicio (nombre) VALUES
('Bebida'),
('Atención'),
('Comida'),
('Música'),
('Seguridad'),
('Ambiente'),
('Higiene');

INSERT INTO calificacion (discoteca_id, servicio_id, puntuacion, comentario) VALUES
(1, 1, 5, 'Las bebidas fueron excelentes, especialmente los cócteles.');

INSERT INTO calificacion (discoteca_id, servicio_id, puntuacion, comentario) VALUES
(1, 2, 4, 'El servicio fue rápido, pero podrían mejorar la amabilidad.');

INSERT INTO calificacion (discoteca_id, servicio_id, puntuacion, comentario) VALUES
(1, 3, 4, 'Buena variedad de comida, aunque un poco cara.');

INSERT INTO calificacion (discoteca_id, servicio_id, puntuacion, comentario) VALUES
(1, 4, 5, 'La música estuvo increíble, el DJ fue excelente.');

INSERT INTO calificacion (discoteca_id, servicio_id, puntuacion, comentario) VALUES
(1, 5, 4, 'Seguridad adecuada, aunque podrían mejorar en la entrada.');

INSERT INTO calificacion (discoteca_id, servicio_id, puntuacion, comentario) VALUES
(1, 6, 5, 'El ambiente fue espectacular, buena iluminación y decoración.');

INSERT INTO calificacion (discoteca_id, servicio_id, puntuacion, comentario) VALUES
(1, 7, 3, 'Los baños podrían estar más limpios.');