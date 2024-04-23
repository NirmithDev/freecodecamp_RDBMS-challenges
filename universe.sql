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

DROP DATABASE universe;
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    numberofplanets integer,
    distance_from_earth numeric(4,4),
    description text,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_moons integer,
    distance_from_earth numeric(10,4),
    description text,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_moons integer,
    distance_from_earth numeric(7,4),
    description text,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: sample; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sample (
    sample_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.sample OWNER TO freecodecamp;

--
-- Name: sample_sample_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sample_sample_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_sample_id_seq OWNER TO freecodecamp;

--
-- Name: sample_sample_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sample_sample_id_seq OWNED BY public.sample.sample_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_number integer,
    distance_from_earth numeric(4,4),
    description text,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: sample sample_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sample ALTER COLUMN sample_id SET DEFAULT nextval('public.sample_sample_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy Name', 10, 0.1234, 'Description of the galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 200, 0.5678, 'A spiral galaxy approximately 2.537 million light-years from Earth.', true);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 8, -0.7890, 'The galaxy containing our Solar System.', true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 5000, 0.3000, 'A small spiral galaxy located near the Andromeda and Milky Way galaxies.', true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 2000, 0.3100, 'A spiral galaxy known for its distinctive spiral structure and visible companion galaxy NGC 5195.', true);
INSERT INTO public.galaxy VALUES (7, 'Sombrero', 30, 0.2900, 'A spiral galaxy located approximately 29 million light-years from Earth, known for its prominent bulge of stars resembling a sombrero hat.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymede', 79, 628300.0000, 'The largest moon of Jupiter and the largest moon in the Solar System.', true, 5);
INSERT INTO public.moon VALUES (2, 'Titan', 82, 125760.0000, 'The largest moon of Saturn and the second-largest moon in the Solar System.', true, 6);
INSERT INTO public.moon VALUES (3, 'Callisto', 79, 73900.0000, 'The second-largest moon of Jupiter and the third-largest moon in the Solar System.', true, 5);
INSERT INTO public.moon VALUES (4, 'Io', 79, 42170.0000, 'The innermost moon of Jupiter and the fourth-largest moon in the Solar System.', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 79, 67110.0000, 'The smallest of the four Galilean moons of Jupiter.', true, 5);
INSERT INTO public.moon VALUES (6, 'Triton', 79, 354759.0000, 'The largest moon of Neptune and the seventh-largest moon in the Solar System.', true, 8);
INSERT INTO public.moon VALUES (7, 'Titania', 82, 43910.0000, 'The largest moon of Uranus and the eighth-largest moon in the Solar System.', true, 7);
INSERT INTO public.moon VALUES (8, 'Rhea', 82, 52740.0000, 'The second-largest moon of Saturn and the ninth-largest moon in the Solar System.', true, 6);
INSERT INTO public.moon VALUES (9, 'Iapetus', 79, 35640.0000, 'The third-largest moon of Saturn and the eleventh-largest moon in the Solar System.', true, 6);
INSERT INTO public.moon VALUES (10, 'Charon', 5, 19591.0000, 'The largest moon of Pluto and the only one known to be massive enough to have collapsed into a spheroid.', true, 9);
INSERT INTO public.moon VALUES (39, 'Umbriel', 27, 26600.0000, 'A moon of Uranus, discovered in 1851 by William Lassell.', true, 7);
INSERT INTO public.moon VALUES (40, 'Dione', 82, 37736.0000, 'A moon of Saturn, discovered in 1684 by Giovanni Domenico Cassini.', true, 6);
INSERT INTO public.moon VALUES (41, 'Tethys', 82, 29419.0000, 'A moon of Saturn, discovered by Giovanni Domenico Cassini in 1684.', true, 6);
INSERT INTO public.moon VALUES (42, 'Enceladus', 82, 28037.0000, 'An icy moon of Saturn discovered by William Herschel in 1789.', true, 6);
INSERT INTO public.moon VALUES (43, 'Ariel', 27, 19102.0000, 'A moon of Uranus discovered by William Lassell in 1851.', true, 7);
INSERT INTO public.moon VALUES (49, 'Callisto2', 79, 10700.0000, 'The largest moon in the Solar System and a moon of Jupiter.', true, 5);
INSERT INTO public.moon VALUES (50, 'Oberon1', 82, 12570.0000, 'The largest moon of Saturn and the second-largest moon in the Solar System.', true, 6);
INSERT INTO public.moon VALUES (51, 'Phoebe12', 82, 28037.0000, 'An icy moon of Saturn known for its geysers of water vapor erupting from its surface.', true, 6);
INSERT INTO public.moon VALUES (52, 'Callisto22', 79, 10700.0000, 'The largest moon in the Solar System and a moon of Jupiter.', true, 5);
INSERT INTO public.moon VALUES (53, 'Oberon11', 82, 12570.0000, 'The largest moon of Saturn and the second-largest moon in the Solar System.', true, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 0.3900, 'The smallest and innermost planet in the Solar System, characterized by its rocky surface and extreme temperatures.', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 2, 1.5200, 'The fourth planet from the Sun, often called the Red Planet due to its reddish appearance, and considered a possible location for future human colonization.', true, 1);
INSERT INTO public.planet VALUES (3, 'Neptune', 14, 30.0700, 'The eighth and farthest-known Solar planet from the Sun, characterized by its blue color and turbulent atmosphere.', true, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 0, 0.7200, 'The second planet from the Sun, often called Earth’s “twin” due to its similar size and composition, but characterized by its dense atmosphere and extreme greenhouse effect.', true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 5.2000, 'The largest planet in the Solar System, known for its massive size and swirling gas storms, including the Great Red Spot.', true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 82, 9.5800, 'The sixth planet from the Sun, known for its distinctive rings made of ice and rock particles, which encircle the planet.', true, 1);
INSERT INTO public.planet VALUES (7, 'Earth', 1, 1.0000, 'The third planet from the Sun and the only known planet to support life, characterized by its diverse ecosystems, abundant water, and unique features such as continents and oceans.', true, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 27, 19.2200, 'The seventh planet from the Sun, characterized by its unique axial tilt of almost 90 degrees and its icy composition.', true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 39.4800, 'A dwarf planet located in the Kuiper Belt beyond Neptune, known for its rocky-icy composition and once considered the ninth planet in the Solar System.', true, 1);
INSERT INTO public.planet VALUES (11, 'GJ 1132 b', 0, 39.0000, 'An exoplanet orbiting the red dwarf star GJ 1132, classified as a sub-Neptune exoplanet and a potential target for atmospheric studies.', true, 2);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 0, 140.0000, 'An exoplanet orbiting the G-type star Kepler-452, classified as a super-Earth exoplanet and a potential candidate for habitability studies.', true, 3);
INSERT INTO public.planet VALUES (13, 'HD 209458 b', 1, 153.0000, 'An exoplanet orbiting the star HD 209458, classified as a hot Jupiter exoplanet and a significant target for exoplanet studies, including atmospheric observations via spectroscopy.', true, 4);


--
-- Data for Name: sample; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sample VALUES (1, 'Sample1', 'Description for Sample1');
INSERT INTO public.sample VALUES (2, 'Sample2', 'Description for Sample2');
INSERT INTO public.sample VALUES (3, 'Sample3', 'Description for Sample3');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0.0050, 'The star at the center of our Solar System.', true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3, 0.3000, 'A red dwarf star located in the Alpha Centauri star system.', true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 4, -0.1234, 'The brightest star in the night sky.', true, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 5, 0.6430, 'A red supergiant star in the constellation Orion.', true, 1);
INSERT INTO public.star VALUES (5, 'Vega', 6, 0.2500, 'One of the brightest stars in the northern sky, located relatively close to Earth.', true, 1);
INSERT INTO public.star VALUES (6, 'Arcturus', 7, 0.3670, 'A bright orange giant star in the constellation Bootes.', true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 53, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: sample_sample_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sample_sample_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: sample sample_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sample
    ADD CONSTRAINT sample_pkey PRIMARY KEY (sample_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star unique_name2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name2 UNIQUE (name);


--
-- Name: planet unique_name3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name3 UNIQUE (name);


--
-- Name: moon unique_name4; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name4 UNIQUE (name);


--
-- Name: sample unique_sample; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sample
    ADD CONSTRAINT unique_sample UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

