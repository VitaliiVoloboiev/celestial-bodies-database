--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(50) NOT NULL,
    constellation character varying(30),
    type character varying(50) NOT NULL,
    stars_count_in_billions integer,
    year_if_discovery integer,
    distance_from_earth_in_kpc integer
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    numeral integer,
    mean_radius_km numeric(7,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_info (
    moon_info_id integer NOT NULL,
    moon_id integer NOT NULL,
    visited_by_humans boolean NOT NULL,
    is_round boolean,
    name_story text,
    name character varying(20)
);


ALTER TABLE public.moon_info OWNER TO freecodecamp;

--
-- Name: moon_info_moon_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_info_moon_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_info_moon_info_id_seq OWNER TO freecodecamp;

--
-- Name: moon_info_moon_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_info_moon_info_id_seq OWNED BY public.moon_info.moon_info_id;


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
    star_id integer,
    name character varying(20) NOT NULL,
    type character varying(30) NOT NULL,
    moon_count integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    mass_in_suns numeric(8,2),
    luminosity_in_suns numeric(8,2),
    temperature_in_k integer,
    chromaticity character varying(30) NOT NULL,
    distance_to_the_sun_in_pc numeric(8,2),
    size_in_1000km integer
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
-- Name: moon_info moon_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_info ALTER COLUMN moon_info_id SET DEFAULT nextval('public.moon_info_moon_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 'barred spiral', 250, 1610, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Nebula', 'Andromeda', 'barred spiral', 1000, 1612, 770);
INSERT INTO public.galaxy VALUES (3, 'Bode''s Galaxy', 'Ursa Major', 'grand design spiral', NULL, 1774, 3600);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 'Ursa Major', 'face-on spiral', 1000, 1781, 6400);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Canes Venatici', 'interacting grand design spiral', NULL, 1773, 9505);
INSERT INTO public.galaxy VALUES (6, 'Siamese Twins', 'Virgo', 'unbarred spiral', NULL, 1784, 18200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 1, 1738.0);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 1, 11267.0);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 2, 6.2);
INSERT INTO public.moon VALUES (4, 5, 'Io', 1, 1821.6);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 2, 1560.8);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 3, 2634.1);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 4, 2410.3);
INSERT INTO public.moon VALUES (8, 5, 'Amalthea', 5, 83.5);
INSERT INTO public.moon VALUES (9, 5, 'Himalia', 6, 69.8);
INSERT INTO public.moon VALUES (10, 5, 'Elara', 7, 43.0);
INSERT INTO public.moon VALUES (11, 6, 'Mimas', 1, 198.2);
INSERT INTO public.moon VALUES (12, 6, 'Enceladus', 2, 252.1);
INSERT INTO public.moon VALUES (13, 6, 'Tethys', 3, 533.1);
INSERT INTO public.moon VALUES (14, 6, 'Dione', 4, 561.4);
INSERT INTO public.moon VALUES (15, 6, 'Rhea', 5, 763.8);
INSERT INTO public.moon VALUES (16, 6, 'Titan', 6, 2574.7);
INSERT INTO public.moon VALUES (17, 6, 'Hyperion', 7, 135.0);
INSERT INTO public.moon VALUES (18, 7, 'Ariel', 1, 578.9);
INSERT INTO public.moon VALUES (19, 7, 'Umbriel', 2, 587.7);
INSERT INTO public.moon VALUES (20, 7, 'Titania', 3, 788.9);


--
-- Data for Name: moon_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_info VALUES (1, 2, false, true, 'greek god, son of Ares and Aphrodite', 'first');
INSERT INTO public.moon_info VALUES (2, 3, false, false, 'twin brother of Phobos', 'second');
INSERT INTO public.moon_info VALUES (3, 16, false, true, 'one of race of immortals in Greek mythology', 'third');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'terrestrial', 0);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'terrestrial', 0);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'terrestrial', 1);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'terrestrial', 2);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'gas giant', 79);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'gas giant', 82);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'ice giant', 27);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'ice giant', 14);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', 'dwarf', 5);
INSERT INTO public.planet VALUES (10, 4, 'Proxima Centauri b', 'super Earth', 0);
INSERT INTO public.planet VALUES (11, 4, 'Proxima Centauri c', 'super Earth', NULL);
INSERT INTO public.planet VALUES (12, 4, 'Proxima Centauri d', 'dwarf', 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1.00, 1.00, 5778, 'yellowish white', NULL, 696);
INSERT INTO public.star VALUES (2, 1, 'Alpha Centauri A', 1.10, 1.50, 5790, 'yellowish white', 1.34, 851);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri B', 0.90, 0.50, 5260, 'pale yellow orange', 1.34, 600);
INSERT INTO public.star VALUES (4, 1, 'Proxima Centauri', 0.13, 0.01, 3042, 'light orange red', 1.30, 107);
INSERT INTO public.star VALUES (5, 1, 'Sirius A', 2.05, 25.40, 9940, 'deep blue white', 2.67, 1190);
INSERT INTO public.star VALUES (6, 1, 'Sirius B', 1.02, 0.03, 24800, 'deep blue white', 2.64, 12);
INSERT INTO public.star VALUES (7, 1, 'Chi-1 Orionis', 0.15, 1.08, 5955, 'yellowish white', 8.66, 681);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_info_moon_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_info_moon_info_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon_info moon_info_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_info
    ADD CONSTRAINT moon_info_moon_id_key UNIQUE (moon_id);


--
-- Name: moon_info moon_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_info
    ADD CONSTRAINT moon_info_pkey PRIMARY KEY (moon_info_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_star_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon_info moon_info_moon_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_info
    ADD CONSTRAINT moon_info_moon_fk FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon planet_moon_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_moon_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_planet_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

