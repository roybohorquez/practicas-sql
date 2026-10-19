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

