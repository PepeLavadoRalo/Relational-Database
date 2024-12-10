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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('AD', 1, 14);
INSERT INTO public.users VALUES ('user_1733216887513', 2, 200);
INSERT INTO public.users VALUES ('user_1733216887514', 5, 156);
INSERT INTO public.users VALUES ('user_1733218150323', 2, 693);
INSERT INTO public.users VALUES ('user_1733217007396', 2, 751);
INSERT INTO public.users VALUES ('user_1733218150324', 5, 146);
INSERT INTO public.users VALUES ('user_1733217007397', 5, 66);
INSERT INTO public.users VALUES ('user_1733217087853', 2, 257);
INSERT INTO public.users VALUES ('Pepe', 3, 9);
INSERT INTO public.users VALUES ('user_1733218266101', 2, 658);
INSERT INTO public.users VALUES ('user_1733217087854', 5, 121);
INSERT INTO public.users VALUES ('user_1733218266102', 5, 313);
INSERT INTO public.users VALUES ('user_1733216503280', 2, 532);
INSERT INTO public.users VALUES ('user_1733217123554', 2, 192);
INSERT INTO public.users VALUES ('user_1733217123555', 5, 63);
INSERT INTO public.users VALUES ('user_1733216503281', 5, 452);
INSERT INTO public.users VALUES ('user_1733217197933', 2, 779);
INSERT INTO public.users VALUES ('user_1733218290728', 2, 253);
INSERT INTO public.users VALUES ('user_1733217197934', 5, 128);
INSERT INTO public.users VALUES ('user_1733216639197', 2, 415);
INSERT INTO public.users VALUES ('user_1733218290729', 5, 91);
INSERT INTO public.users VALUES ('user_1733217267833', 2, 102);
INSERT INTO public.users VALUES ('user_1733216639198', 5, 153);
INSERT INTO public.users VALUES ('user_1733217267834', 5, 7);
INSERT INTO public.users VALUES ('user_1733216712746', 2, 4);
INSERT INTO public.users VALUES ('user_1733217415195', 2, 927);
INSERT INTO public.users VALUES ('user_1733217415196', 5, 311);
INSERT INTO public.users VALUES ('user_1733216712747', 5, 70);
INSERT INTO public.users VALUES ('user_1733217683694', 2, 464);
INSERT INTO public.users VALUES ('user_1733217683695', 5, 65);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

