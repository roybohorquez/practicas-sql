CREATE DATABASE colegio;
USE colegio;

CREATE TABLE alumnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO alumnos (nombre, apellido, edad) VALUES 
('Juan', 'Pérez', 15),
('María', 'Gómez', 16),
('Carlos', 'López', 14);

CREATE TABLE IF NOT EXISTS cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Insertar algunos cursos de prueba
INSERT INTO cursos (nombre_curso, descripcion) VALUES
('Matemáticas', 'Curso de álgebra y geometría'),
('Historia', 'Historia universal y contemporánea'),
('Bases de Datos', 'Diseño y consultas SQL');

CREATE TABLE IF NOT EXISTS inscripciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT NOT NULL,
    curso_id INT NOT NULL,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE
);

-- Insertar algunas inscripciones de prueba
INSERT INTO inscripciones (alumno_id, curso_id) VALUES
(1, 3), -- Juan se inscribe en Bases de Datos
(2, 1), -- María se inscribe en Matemáticas
(3, 3); -- Carlos se inscribe en Bases de Datos

-- Consulta avanzada para listar alumnos con sus respectivos cursos
SELECT 
    alumnos.nombre AS alumno_nombre,
    alumnos.apellido AS alumno_apellido,
    cursos.nombre_curso AS curso_asignado,
    inscripciones.fecha_inscripcion
FROM inscripciones
INNER JOIN alumnos ON inscripciones.alumno_id = alumnos.id
INNER JOIN cursos ON inscripciones.curso_id = cursos.id;

-- Crear tabla de calificaciones relacionada con las inscripciones
CREATE TABLE IF NOT EXISTS calificaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    inscripcion_id INT NOT NULL,
    nota_parcial DECIMAL(4,2) NOT NULL,
    nota_final DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (inscripcion_id) REFERENCES inscripciones(id) ON DELETE CASCADE
);

-- Insertar notas de prueba para los alumnos inscritos
INSERT INTO calificaciones (inscripcion_id, nota_parcial, nota_final) VALUES
(1, 15.5, 18.0), -- Notas para Juan en Bases de Datos
(2, 12.0, 14.5), -- Notas para María en Matemáticas
(3, 11.0, 13.0); -- Notas para Carlos en Bases de Datos