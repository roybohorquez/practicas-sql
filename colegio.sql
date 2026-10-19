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

CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Insertar algunos cursos de prueba
INSERT INTO cursos (nombre_curso, descripcion) VALUES
('Matemáticas', 'Curso de álgebra y geometría'),
('Historia', 'Historia universal y contemporánea'),
('Bases de Datos', 'Diseño y consultas SQL');
