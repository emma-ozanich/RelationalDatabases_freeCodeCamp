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
    classification text NOT NULL,
    distance numeric,
    n_stars integer
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    orbit_hrs numeric,
    is_cheese boolean
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
    name character varying(30),
    has_atmosphere boolean NOT NULL,
    is_dwarf boolean NOT NULL,
    n_moons integer,
    n_rings integer NOT NULL,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    type text NOT NULL,
    mass numeric
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
-- Name: superclusters; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.superclusters (
    superclusters_id integer NOT NULL,
    name character varying(30) NOT NULL,
    belongsto character varying(30)
);


ALTER TABLE public.superclusters OWNER TO freecodecamp;

--
-- Name: superclusters_superclusters_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.superclusters_superclusters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.superclusters_superclusters_id_seq OWNER TO freecodecamp;

--
-- Name: superclusters_superclusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.superclusters_superclusters_id_seq OWNED BY public.superclusters.superclusters_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: superclusters superclusters_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superclusters ALTER COLUMN superclusters_id SET DEFAULT nextval('public.superclusters_superclusters_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 8.277, 43);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', 'great spiral', 46.56, 1000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'spiral', 18.74, 40);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic', 'dwarf', 9.6, 20);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic', 'dwarf', 5.78, 3);
INSERT INTO public.galaxy VALUES (6, 'SagDEG', 'elliptical loop-shaped', 3.07, NULL);
INSERT INTO public.galaxy VALUES (7, 'Canis Major', 'dwarf', 0.209, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 4, 8, NULL);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 30, NULL);
INSERT INTO public.moon VALUES (3, 'Moon', 3, 24, NULL);
INSERT INTO public.moon VALUES (4, 'Triton', 8, 141.05, NULL);
INSERT INTO public.moon VALUES (5, 'Thalassa', 8, 7.48, NULL);
INSERT INTO public.moon VALUES (6, 'Charon', 10, 153.6, NULL);
INSERT INTO public.moon VALUES (7, 'Nix', 10, 600, NULL);
INSERT INTO public.moon VALUES (8, 'Styx', 10, 480, NULL);
INSERT INTO public.moon VALUES (9, 'Kerberos', 10, 772, NULL);
INSERT INTO public.moon VALUES (10, 'Hydra', 10, 912, NULL);
INSERT INTO public.moon VALUES (11, 'Namaka', 11, 432, NULL);
INSERT INTO public.moon VALUES (12, 'Hiaka', 11, 1176, NULL);
INSERT INTO public.moon VALUES (13, 'MK2', 12, 288, NULL);
INSERT INTO public.moon VALUES (14, 'Dysnomia', 13, 384, NULL);
INSERT INTO public.moon VALUES (15, 'Titan', 6, 384, NULL);
INSERT INTO public.moon VALUES (16, 'Enceladus', 6, 32.9, NULL);
INSERT INTO public.moon VALUES (17, 'Europa', 5, 84, NULL);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 33.92, NULL);
INSERT INTO public.moon VALUES (19, 'Titania', 7, 208.94, NULL);
INSERT INTO public.moon VALUES (20, 'Oberon', 7, 323.04, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, false, 0, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', true, false, 0, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, false, 1, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, false, 2, 0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, false, 95, 4, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', true, false, 146, 7, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, false, 28, 13, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', true, true, 0, 0, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', true, true, 5, 0, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', true, true, 2, 1, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', true, true, 1, 0, 1);
INSERT INTO public.planet VALUES (13, 'Eris', true, true, 1, 0, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', true, false, 16, 9, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, 'binary', 3.63);
INSERT INTO public.star VALUES (3, 'Beta Trianguli', 3, 'binary', 3.5);
INSERT INTO public.star VALUES (4, 'WOH G64', 4, 'red supergiant', 25);
INSERT INTO public.star VALUES (5, 'NGC 346', 5, 'O-type', 91);
INSERT INTO public.star VALUES (6, 'M54', 6, 'globular cluster', 850);


--
-- Data for Name: superclusters; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.superclusters VALUES (1, 'Local Group', 'Virgo');
INSERT INTO public.superclusters VALUES (2, 'Virgo', 'Laniakea');
INSERT INTO public.superclusters VALUES (3, 'Laniakea', 'Pisces-Cetus');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: superclusters_superclusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.superclusters_superclusters_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy is_uniq_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT is_uniq_moon UNIQUE (name);


--
-- Name: planet is_uniq_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT is_uniq_name UNIQUE (name);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: superclusters superclusters_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superclusters
    ADD CONSTRAINT superclusters_name_key UNIQUE (name);


--
-- Name: superclusters superclusters_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superclusters
    ADD CONSTRAINT superclusters_pkey PRIMARY KEY (superclusters_id);


--
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon pk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT pk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

