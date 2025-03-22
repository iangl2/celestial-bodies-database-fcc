
drop database if exists universe;
create DATABASE universe;
\c universe;
create table galaxy();
create table star();
create table planet();
create table moon();
create table specie();

ALTER TABLE galaxy ADD COLUMN galaxy_id SERIAL NOT NULL PRIMARY KEY;
ALTER TABLE star ADD COLUMN star_id SERIAL NOT NULL PRIMARY KEY;
ALTER TABLE planet ADD COLUMN planet_id SERIAL  NOT NULL PRIMARY KEY;
ALTER TABLE moon ADD COLUMN moon_id SERIAL NOT NULL PRIMARY KEY;
ALTER TABLE specie ADD COLUMN specie_id SERIAL NOT NULL PRIMARY KEY;


ALTER TABLE moon ADD COLUMN name varchar(30) NOT NULL UNIQUE;
ALTER TABLE star ADD COLUMN name varchar(30) NOT NULL UNIQUE;
ALTER TABLE galaxy ADD COLUMN name varchar(30) NOT NULL UNIQUE;
ALTER TABLE planet ADD COLUMN name varchar(30) NOT NULL UNIQUE;
ALTER TABLE specie ADD COLUMN name varchar(30) NOT NULL UNIQUE;


ALTER TABLE planet  ADD COLUMN radius int;
ALTER TABLE moon  ADD COLUMN radius int;
ALTER TABLE galaxy ADD COLUMN lightyears_away_from_earth NUMERIC;
ALTER TABLE star  ADD COLUMN description TEXT;

ALTER TABLE moon ADD COLUMN habited BOOLEAN;
ALTER TABLE planet ADD COLUMN habited BOOLEAN;

ALTER TABLE star ADD COLUMN galaxy_id int REFERENCES galaxy(galaxy_id);
ALTER TABLE planet ADD COLUMN star_id int REFERENCES star(star_id);
ALTER TABLE moon ADD COLUMN planet_id int REFERENCES planet(planet_id);

ALTER TABLE galaxy 
ADD COLUMN type VARCHAR(50),  -- Tipo de galaxia (espiral, elíptica, etc.)
ADD COLUMN discovered_year INT;  -- Año de descubrimiento

ALTER TABLE star 
ADD COLUMN mass NUMERIC;  -- Masa de la estrella en masas solares

ALTER TABLE specie 
ADD COLUMN classification VARCHAR(50),  -- Mamífero, reptil, etc.
ADD COLUMN average_lifespan INT,  -- Promedio de vida en años
ADD COLUMN planet_id INT REFERENCES planet(planet_id);


INSERT INTO galaxy (name, lightyears_away_from_earth, type, discovered_year) VALUES
('Vía Láctea', 0, 'Espiral', NULL),
('Andrómeda', 2.537e6, 'Espiral', 964),
('Messier 87', 5.3e7, 'Elíptica', 1781),
('Triángulo', 2.73e6, 'Espiral', 1764),
('Sombrero', 2.9e7, 'Espiral', 1781),
('Ojo Negro', 1.7e7, 'Espiral', 1779);

INSERT INTO star (name, description, galaxy_id, mass) VALUES
('Sol', 'Estrella principal del sistema solar', 1, 1.0),
('Sirio', 'Estrella más brillante vista desde la Tierra', 1, 2.02),
('Betelgeuse', 'Gigante roja en la constelación de Orión', 1, 17.5),
('Proxima Centauri', 'La estrella más cercana al Sol', 1, 0.12),
('Vega', 'Brillante estrella de la constelación Lira', 1, 2.1),
('Antares', 'Supergigante roja en la constelación de Escorpio', 1, 12.4);

INSERT INTO planet (name, radius, habited, star_id) VALUES
('Mercurio', 2440, FALSE, 1),
('Venus', 6052, FALSE, 1),
('Tierra', 6371, TRUE, 1),
('Marte', 3389, FALSE, 1),
('Júpiter', 69911, FALSE, 1),
('Saturno', 58232, FALSE, 1),
('Urano', 25362, FALSE, 1),
('Neptuno', 24622, FALSE, 1),
('Plutón', 1188, FALSE, 1),
('Kepler-22b', 12700, FALSE, 4),
('Proxima b', 7151, FALSE, 4),
('Gliese 581g', 7500, FALSE, 4);

INSERT INTO moon (name, radius, habited, planet_id) VALUES
('Luna', 1737, FALSE, 3),
('Fobos', 11, FALSE, 4),
('Deimos', 6, FALSE, 4),
('Io', 1821, FALSE, 5),
('Europa', 1561, FALSE, 5),
('Ganimedes', 2634, FALSE, 5),
('Calisto', 2410, FALSE, 5),
('Titán', 2575, FALSE, 6),
('Encélado', 252, FALSE, 6),
('Mimas', 198, FALSE, 6),
('Rea', 764, FALSE, 6),
('Dione', 561, FALSE, 6),
('Tetis', 531, FALSE, 6),
('Oberón', 761, FALSE, 7),
('Titania', 788, FALSE, 7),
('Miranda', 235, FALSE, 7),
('Ariel', 578, FALSE, 7),
('Tritón', 1353, FALSE, 8),
('Charon', 606, FALSE, 9),
('Nereida', 170, FALSE, 8);

INSERT INTO specie (name, classification, average_lifespan, planet_id) VALUES
('Humano', 'Mamífero', 80, 1),
('Neandertal', 'Mamífero', 40, 1),
('Microorganismos de Marte', 'Bacteria', 5, 2);