-- Crear la base de datos
CREATE DATABASE turismo_zonas_arqueologicas;

-- Conectar a la base de datos
\c turismo_zonas_arqueologicas;

-- Crear la tabla de puntos
CREATE TABLE puntos_arqueologicos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    horarios VARCHAR(50),
    costo NUMERIC,
    servicios TEXT,
    calificacion NUMERIC,
    geom GEOGRAPHY(Point, 4326)
);

-- Crear la tabla de polígonos
CREATE TABLE zonas_interes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    geom GEOGRAPHY(Polygon, 4326)
);

-- Insertar datos de ejemplo
INSERT INTO puntos_arqueologicos (nombre, tipo, horarios, costo, servicios, calificacion, geom)
VALUES 
('Zona Arqueológica A', 'Zona Arqueológica', '9:00-17:00', 50, 'Guías, Accesibilidad', 4.5, ST_SetSRID(ST_MakePoint(-89.15, 21.16), 4326)),
('Museo B', 'Museo', '10:00-18:00', 30, 'Guías', 4.7, ST_SetSRID(ST_MakePoint(-89.20, 21.18), 4326));

-- Insertar polígonos de ejemplo
INSERT INTO zonas_interes (nombre, geom)
VALUES 
('Parque Arqueológico A', ST_SetSRID(ST_MakePolygon(ST_GeomFromText('LINESTRING(-89.14 21.15, -89.14 21.17, -89.12 21.17, -89.12 21.15, -89.14 21.15)')), 4326));