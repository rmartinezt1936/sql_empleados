-- Crear tabla de departamentos
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Crear tabla de empleados
CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    puesto VARCHAR(50),
    salario DECIMAL(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

-- Insertar datos en departamentos
INSERT INTO departamentos (id_departamento, nombre) VALUES
(1, 'Recursos Humanos'),
(2, 'Tecnologías de la Información'),
(3, 'Ventas');

-- Insertar datos en empleados
INSERT INTO empleados (id_empleado, nombre, puesto, salario, id_departamento) VALUES
(1, 'Luis Pérez', 'Analista de RH', 18500.00, 1),
(2, 'Ana Gómez', 'Desarrollador Jr.', 22000.00, 2),
(3, 'Carlos Ruiz', 'Soporte Técnico', 19500.00, 2),
(4, 'Laura Torres', 'Ejecutivo de ventas', 21000.00, 3);

-- Consulta 1: Ver todos los empleados con su departamento
SELECT e.nombre AS empleado, e.puesto, d.nombre AS departamento
FROM empleados e
JOIN departamentos d ON e.id_departamento = d.id_departamento;

-- Consulta 2: Empleados con salario mayor a 20,000
SELECT nombre, puesto, salario
FROM empleados
WHERE salario > 20000;

-- Consulta 3: Número total de empleados por departamento
SELECT d.nombre AS departamento, COUNT(*) AS total_empleados
FROM empleados e
JOIN departamentos d ON e.id_departamento = d.id_departamento
GROUP BY d.nombre;
