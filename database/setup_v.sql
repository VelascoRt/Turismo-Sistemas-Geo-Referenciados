DROP TABLE lugares;
DROP TABLE zonas;

CREATE TABLE lugares (
	id SERIAL PRIMARY KEY,
	nombre TEXT,
	tipo TEXT,
	horario TEXT,
	costo TEXT,
	servicios TEXT,
	calificacion TEXT,
	geom GEOMETRY(POINT, 4326)
);

CREATE TABLE zonas (
	id SERIAL PRIMARY KEY,
	nombre TEXT,
	geom GEOMETRY(POLYGON, 4326)
);

-- Valores de prueba puntos 2
INSERT INTO lugares (nombre, tipo, horario, costo, servicios, calificacion, geom)
VALUES 
('Hotel Arroyo Seco Inn', 'Hotel', '06:00-24:00', 'No disponible', 'WiFi, Baños, Terraza', '3.9', 
ST_SetSRID(ST_Point(-99.69, 21.54 ), 4326)),
('Ruta 69: Gorditas & Quesadillas', 'Restaurante', '06:30-14:00', '1-100 por persona', 'Restaurante y terraza', '4.3', 
ST_SetSRID(ST_Point(-99.69204231811936, 21.545637370752512), 4326));

-- Valores de prueba poligonos. 1
INSERT INTO zonas (nombre, geom)
VALUES 
('Arroyo Seco', ST_GeomFromText(
'POLYGON((
  -99.68724246090382 21.540859991874218,
  -99.68529476733679 21.541499399417894,
  -99.68483648649747 21.550131125539348,
  -99.69085142251332 21.559135280194855,
  -99.69153884377226 21.549545036927896,
  -99.6984130563618 21.55007784485432,
  -99.68724246090382 21.540859991874218 
))', 4326));

-- Valores restantes puntos 28
INSERT INTO lugares (nombre, tipo, horario, costo, servicios, calificacion, geom)
VALUES 
('Casa Naomin', 'Hotel', '06:00-24:00', '500', 'Baños, Naturaleza', '5.0(6)', 
ST_SetSRID(ST_Point(-101.18847834025878, 21.144180019724985), 4326)),
('Cabañas Nabi', 'Hotel', '06:30-14:00', '350', 'Restaurante y terraza', '4.3', 
ST_SetSRID(ST_Point(-101.47709046446887, 21.47353888216783), 4326)),
('Fonda la Esperanza', 'Restaurante', '08:00-18:00', '1-100 por persona', 'Quesadillas, Pozole, Tacos', '4.6', 
ST_SetSRID(ST_Point(-101.47258984308911, 21.47695516152212), 4326)),
('El Cóporo Museo', 'Atracciones', '10:00-18:00', '39 por persona', 'Zona Arquitectonica', '4.7', 
ST_SetSRID(ST_Point(-101.47258984308911, 21.47695516152212), 4326)),

--- INSERTAR
('Los Huacales', 'Restaurante', '12:00-22:00', '100-200 por persona', 'Comida mexicana, ambiente familiar', '4.5', 
ST_SetSRID(ST_Point(-101.25498854784935, 21.01677009217739), 4326)),
('La Virgen de la Cueva', 'Restaurante', '13:00-23:00', '150-300 por persona', 'Cocina Mexicana, música en vivo', '4.7', 
ST_SetSRID(ST_Point(-101.27076866134333, 21.011192558048432), 4326)),
('MAEH Panadería', 'Restaurante', '07:00-19:00', '50-100 por persona', 'Panadería artesanal, café', '4.6', 
ST_SetSRID(ST_Point(-100.74680093250977, 20.913659087207233), 4326)),
('El Paisa 1', 'Restaurante', '08:00-20:00', '50-150 por persona', 'Tacos, antojitos mexicanos', '4.3', 
ST_SetSRID(ST_Point(-101.2584717325077, 21.018393980695688), 4326)),
('La Bohemia', 'Restaurante', '12:00-22:00', '100-250 por persona', 'Cocina internacional, terraza', '4.4', 
ST_SetSRID(ST_Point(-101.25579127483698, 21.017850200919636), 4326)),

('Castillo Santa Cecilia', 'Hotel', '00:00-24:00', '1200 por noche', 'Piscina Restaurante, arquitectura medieval', '4.2', 
ST_SetSRID(ST_Point(-101.25832097483678, 21.030817851442695), 4326)),
('Hotel Mesón de San Antonio', 'Hotel', '00:00-24:00', '800 por noche', 'Wi-Fi, Desayuno incluido', '4.5', 
ST_SetSRID(ST_Point(-101.6043667190414, 19.514578919394868), 4326)),
('Hotel Boutique 1850', 'Hotel', '00:00-24:00', '2000 por noche', 'Spa, bar, gimnasio', '4.8', 
ST_SetSRID(ST_Point(-101.25256238833083, 21.01592937162009), 4326)),
('Museo Regional de Guanajuato Alhóndiga de Granaditas', 'Atracciones', '10:00-18:00', '70 por persona', 'Exposiciones históricas, visitas guiadas', '4.6', 
ST_SetSRID(ST_Point(-101.25784543250775, 21.018827125539502), 4326)),
('Cañada de la virgen', 'Atracciones', '10:00-18:00', '70 por adulto, $20 por niño', 'Recorridos guiados, transporte interno', '4.7', 
ST_SetSRID(ST_Point(-101.18899346479223, 21.146620657308684), 4326)),
('Peralta', 'Atracciones', '10:00-18:00', '65 por adulto, $20 por niño', 'Museo de sitio, visitas guiadas', '4.5', 
ST_SetSRID(ST_Point(-101.40807702647176, 20.472817644231547), 4326)),
('Arroyo Seco', 'Atracciones', '10:00-17:00', '55 por adulto, $12 por niño', 'Pinturas rupestres, recorridos guiados', '4.4', 
ST_SetSRID(ST_Point(-99.69567179880674, 21.55072487151497), 4326)),
('Plazuelas', 'Atracciones', '10:00-17:00', '39 por adulto, $12 por niño', 'Museo de sitio, artesanías', '4.6', 
ST_SetSRID(ST_Point(-101.82682313251925, 20.404536415002756), 4326)),

('EcoHotel Cañada', 'Hotel', '06:00-22:00', '500', 'Ecoturismo, naturaleza', '4.6', 
ST_SetSRID(ST_Point(-100.938745, 20.792435), 4326)),
('Hotel Posada del Carmen', 'Hotel', '24:00', '750', 'Desayuno, Wi-Fi', '4.4', 
ST_SetSRID(ST_Point(-101.261123, 20.978762), 4326)),
('Restaurante El Muralito', 'Restaurante', '09:00-20:00', '80-150 por persona', 'Comida regional, terraza', '4.5', 
ST_SetSRID(ST_Point(-101.292345, 20.980776), 4326)),
('Zona Arqueológica Plazuelas', 'Atracciones', '10:00-17:00', '39 por persona', 'Centro de visitantes, guías', '4.6', 
ST_SetSRID(ST_Point(-101.779632, 20.467374), 4326)),
('Zona Arqueológica Peralta', 'Atracciones', '09:00-18:00', '60 por persona', 'Visitas guiadas, Museo de sitio', '4.5', 
ST_SetSRID(ST_Point(-101.563888, 20.361982), 4326)),
('Fonda Mary', 'Restaurante', '07:00-16:00', '50-100 por persona', 'Tortillas hechas a mano, guisos', '4.3', 
ST_SetSRID(ST_Point(-101.784245, 20.470289), 4326)),
('Cabañas La Soledad', 'Hotel', '06:00-23:00', '600', 'Naturaleza, estacionamiento', '4.7', 
ST_SetSRID(ST_Point(-101.285214, 20.967428), 4326)),
('Museo Casa de Hidalgo', 'Atracciones', '09:00-18:00', '20 por persona', 'Museo histórico, exposiciones', '4.4', 
ST_SetSRID(ST_Point(-100.997008, 21.152389), 4326)),
('Hotel La Huerta', 'Hotel', '24:00', '850', 'Restaurante, jardín', '4.2', 
ST_SetSRID(ST_Point(-100.996980, 21.153011), 4326)),
('Zona Arqueológica Cañada de la Virgen', 'Atracciones', '10:00-17:00', '70 por persona', 'Transporte y guía incluidos', '4.8', 
ST_SetSRID(ST_Point(-100.941992, 20.794574), 4326)),
('Restaurante El Jaguar', 'Restaurante', '10:00-19:00', '100-180 por persona', 'Carnes, comida típica', '4.5', 
ST_SetSRID(ST_Point(-100.943001, 20.795111), 4326));



-- Valores de prueba poligonos. 8
INSERT INTO zonas (nombre, geom)
VALUES 
('Arroyo Seco', ST_GeomFromText(
'POLYGON((
  -101.18101549913867 21.140278201793016,
  -101.16831825428446 21.145401224510803, 
  -101.17579954094265 21.159064975945196,
  -101.19512619814297 21.150343578011455,
  -101.18101549913867 21.140278201793016
))', 4326)),
('El Cóporo Zona Arqueológica', ST_GeomFromText(
'POLYGON((
  -101.45067505884546 21.468619595898787,
  -101.44667665467536 21.47611166221136, 
  -101.44970247404733 21.481893865979043,
  -101.45748315243239 21.47857541189088,
  -101.45899606211837 21.47294392280613,
  -101.45067505884546 21.468619595898787
))', 4326)),

('Peralta', ST_GeomFromText(
'POLYGON((
  -101.41452746027198 20.4665919358886, 
  -101.40243606284221 20.466330594292984, 
  -101.40951232839667 20.481580976771404,
  -101.41921246441379 20.474715135425388,
  -101.41676946719467 20.46401188772199,
  -101.41452746027198 20.4665919358886
))', 4326)),

('Zona Arqueológica Plazuelas', ST_GeomFromText(
'POLYGON((
  -101.82742466942423 20.401225233060156,
  -101.81997493824468 20.401523062121278,
  -101.8205045399873 20.40910096338619,
  -101.83279130041616 20.40608970228549,
  -101.83144964266818 20.400431019415507,
  -101.82742466942423 20.401225233060156
))', 4326)),
('Tepapayeca', ST_GeomFromText(
'POLYGON((
  -98.52670739259634 18.65450856634408,
  -98.51685051164365 18.65162931048595, 
  -98.51630507159095 18.658421322932135,
  -98.52538275246832 18.65949177835606,
  -98.52670739259634 18.654434739880948,
  -98.52121403206542 18.65321659860272,
  -98.52670739259634 18.65450856634408
))', 4326)),
('Zona Arqueológica de Tehuacán Viejo', ST_GeomFromText(
'POLYGON((
  -97.34604923134842 18.451127267855146,
  -97.3450359668129 18.451085892695623,
  -97.34504267717405 18.452024788093027,
  -97.34579088244365 18.45205343227869,
  -97.34603916580666 18.451467816866487,
  -97.34604923134842 18.451127267855146
))', 4326)),
('Zona Arqueológica Yohualican', ST_GeomFromText(
'POLYGON((
  -97.50782797196273 20.05958670060059,
  -97.50393531006759 20.05739831398128,
  -97.50001315830961 20.065126783444587,
  -97.50222489802276 20.06631787570239,
  -97.50735613415723 20.06116564414348,
  -97.50782797196273 20.05958670060059
))', 4326)),
('La Manzanilla', ST_GeomFromText(
'POLYGON((
  -97.64087271803947 19.838675139886686,
  -97.64047589440234 19.839948654173522, 
  -97.64423404767166 19.840717149233125,
  -97.64201650381709 19.838675139886686,
  -97.64087271803947 19.838675139886686
))', 4326)),
('Zona Arqueológica Tamohi (El Consuelo)', ST_GeomFromText(
'POLYGON((
  -98.7506868045064 21.9493251706298, 
  -98.74370069004522 21.95664297113587,
  -98.74997800493206 21.96306899901574,
  -98.7618219952846 21.953457311126144,
  -98.75530780059073 21.947415346041133,
  -98.7506868045064 21.9493251706298
))', 4326)),
('Zona Arqueológica Tamtoc', ST_GeomFromText(
'POLYGON((
  -98.81277902367646 21.921363869258553, 
  -98.81165318737688 21.92400148608559,
  -98.81371404026426 21.92688687670809,
  -98.81821738546259 21.926939981508827,
  -98.81884709051151 21.924054591962786,
  -98.81529784387214 21.923576638354795,
  -98.81277902367646 21.921363869258553
))', 4326));

-- Valor para probar intersección
INSERT INTO zonas (nombre, geom)
VALUES 
('Tanque Viejo', ST_GeomFromText(
'POLYGON((
  -99.70002918243344 21.536148501274216, 
  -99.69153194427116 21.527605528717856,
  -99.67994480132262 21.54596830664069,
  -99.69522266387702 21.546766635597066,
  -99.70131664276104 21.539022659414094,
  -99.70002918243344 21.536148501274216 
))', 4326));


SELECT ST_AsGeoJSON(geom)::json FROM lugares;

SELECT nombre, ST_AsGeoJSON(geom)::json FROM zonas;

SELECT id, nombre, tipo, horario, 
      costo, servicios, calificacion, 
       ST_AsGeoJSON(geom)::json as geometry       
      FROM lugares