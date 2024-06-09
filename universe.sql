--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET search_path TO public;

-- Create Galaxy Table
CREATE TABLE galaxy (
galaxy_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
distance_from_earth INT NOT NULL,
diameter INT NOT NULL,
type VARCHAR(50) NOT NULL,
num_of_stars NUMERIC NOT NULL
);

--Create Star Table
CREATE TABLE star(
star_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
temperature FLOAT NOT NULL,
distance_from_earth FLOAT NOT NULL,
galaxy_id INT NOT NULL,
FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

--Create Planets Table
CREATE TABLE planet(
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT NOT NULL,
  has_life BOOLEAN NOT NULL DEFAULT FALSE,
  number_of_moons NUMERIC NOT NULL,
  star_id INT NOT NULL,
  FOREIGN KEY (star_id) REFERENCES star(star_id)
);

--Create Moon Table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  diameter NUMERIC NOT NULL,
  is_spherical BOOLEAN NOT NULL DEFAULT TRUE,
  planet_id INT NOT NULL,
  FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

--Create Comet Table
CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    orbital_period NUMERIC NOT NULL,
    discovered_by VARCHAR(100) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

--insert data into galaxy table
INSERT INTO galaxy 
  (name, distance_from_earth, diameter, type, num_of_stars) 
VALUES
  ('Milky Way', 0, 100000, 'Spiral', 100000000000),
  ('Andromeda', 2537000, 220000, 'Spiral', 1000000000000),
  ('Triangulum', 3000000, 60000, 'Spiral', 40000000),
  ('Whirlpool', 23000000, 76000, 'Spiral', 300000000000),
  ('Sombrero', 29000000, 50000, 'Spiral', 80000000000),
  ('Pinwheel', 21000000, 170000, 'Spiral', 1000000000000);

-- Insert rows to star table
INSERT INTO star 
  (name, temperature, distance_from_earth, galaxy_id) 
  VALUES
    ('Sun', 5778, 0, 1),
    ('Alpha Centauri A', 5790, 4.37, 1),
    ('Alpha Centauri B', 5260, 4.37, 1),
    ('Betelgeuse', 3500, 642.5, 2),
    ('Sirius A', 9940, 8.6, 1),
    ('Proxima Centauri', 3042, 4.24, 1);

-- Insert rows to planet table
INSERT INTO planet 
  (name, description, has_life, number_of_moons, star_id) 
  VALUES
    ('Earth', 'Third planet from the Sun', TRUE, 1, 1),
    ('Mars', 'Fourth planet from the Sun', FALSE, 2, 1),
    ('Jupiter', 'Largest planet in the Solar System', FALSE, 79, 1),
    ('Saturn', 'Known for its extensive ring system', FALSE, 82, 1),
    ('Venus', 'Second planet from the Sun', FALSE, 0, 1),
    ('Mercury', 'Closest planet to the Sun', FALSE, 0, 1),
    ('Proxima b', 'Exoplanet orbiting Proxima Centauri', FALSE, 0, 6),
    ('Alpha Centauri Bb', 'Exoplanet orbiting Alpha Centauri B', FALSE, 0, 3),
    ('Kepler-442b', 'Potentially habitable exoplanet', FALSE, 0, 2),
    ('Kepler-22b', 'Exoplanet in the habitable zone', FALSE, 0, 2),
    ('HD 40307 g', 'Potentially habitable exoplanet', FALSE, 0, 5),
    ('Gliese 667 Cc', 'Exoplanet in the habitable zone', FALSE, 0, 5);

-- Insert rows to moon table
INSERT INTO moon 
  (name, diameter, is_spherical, planet_id) 
  VALUES
    ('Moon', 3474.2, TRUE, 1),
    ('Phobos', 22.4, TRUE, 2),
    ('Deimos', 12.4, TRUE, 2),
    ('Io', 3643.2, TRUE, 3),
    ('Europa', 3121.6, TRUE, 3),
    ('Ganymede', 5268.2, TRUE, 3),
    ('Callisto', 4820.6, TRUE, 3),
    ('Titan', 5151.8, TRUE, 4),
    ('Rhea', 1527.6, TRUE, 4),
    ('Iapetus', 1469.0, TRUE, 4),
    ('Dione', 1122.8, TRUE, 4),
    ('Tethys', 1062.2, TRUE, 4),
    ('Enceladus', 504.2, TRUE, 4),
    ('Mimas', 396.4, TRUE, 4),
    ('Oberon', 1522.8, TRUE, 3),
    ('Triton', 2706.8, TRUE, 4),
    ('Charon', 1212.0, TRUE, 4),
    ('Nereid', 340.0, TRUE, 4),
    ('Miranda', 471.6, TRUE, 4),
    ('Ariel', 1158.8, TRUE, 4);
-- Insert rows to comet table
INSERT INTO comet 
  (name, orbital_period, discovered_by, is_active) 
  VALUES
    ('Halley', 75.3, 'Edmond Halley', TRUE),
    ('Hale-Bopp', 2533, 'Alan Hale & Thomas Bopp', TRUE),
    ('Hyakutake', 11300, 'Yuji Hyakutake', TRUE);
--
-- PostgreSQL database dump complete
--

