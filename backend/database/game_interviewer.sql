--
-- PostgreSQL database dump
--

\restrict ofUsXLDoePPDLOqrdxDkMAyJkjBPnWs9I0krVKzitAaH7xGsar53jk5P61dwRk9

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-02 11:14:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 227 (class 1259 OID 24646)
-- Name: archetype_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archetype_stats (
    archetype_id integer,
    stat_id integer,
    base_value integer,
    scaling_factor double precision
);


ALTER TABLE public.archetype_stats OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24624)
-- Name: character_archetypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_archetypes (
    archetype_id integer NOT NULL,
    name character varying(50),
    role character varying(50),
    complexity_level character varying(20),
    genre_id integer
);


ALTER TABLE public.character_archetypes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24623)
-- Name: character_archetypes_archetype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_archetypes_archetype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.character_archetypes_archetype_id_seq OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 223
-- Name: character_archetypes_archetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_archetypes_archetype_id_seq OWNED BY public.character_archetypes.archetype_id;


--
-- TOC entry 220 (class 1259 OID 24601)
-- Name: game_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_genres (
    genre_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.game_genres OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24600)
-- Name: game_genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_genres_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.game_genres_genre_id_seq OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 219
-- Name: game_genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_genres_genre_id_seq OWNED BY public.game_genres.genre_id;


--
-- TOC entry 233 (class 1259 OID 24693)
-- Name: interview_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interview_questions (
    question_id integer NOT NULL,
    category character varying(50),
    difficulty character varying(20),
    experience_level character varying(20),
    question text
);


ALTER TABLE public.interview_questions OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 24692)
-- Name: interview_questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interview_questions_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.interview_questions_question_id_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 232
-- Name: interview_questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interview_questions_question_id_seq OWNED BY public.interview_questions.question_id;


--
-- TOC entry 222 (class 1259 OID 24614)
-- Name: platforms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.platforms (
    platform_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.platforms OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24613)
-- Name: platforms_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.platforms_platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.platforms_platform_id_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 221
-- Name: platforms_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.platforms_platform_id_seq OWNED BY public.platforms.platform_id;


--
-- TOC entry 231 (class 1259 OID 24675)
-- Name: production_constraints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_constraints (
    constraint_id integer NOT NULL,
    genre_id integer,
    platform_id integer,
    max_skills integer,
    animation_complexity character varying(20),
    memory_budget_mb integer
);


ALTER TABLE public.production_constraints OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24674)
-- Name: production_constraints_constraint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.production_constraints_constraint_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.production_constraints_constraint_id_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 230
-- Name: production_constraints_constraint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_constraints_constraint_id_seq OWNED BY public.production_constraints.constraint_id;


--
-- TOC entry 229 (class 1259 OID 24660)
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills (
    skill_id integer NOT NULL,
    archetype_id integer,
    name character varying(100),
    type character varying(30),
    cooldown integer,
    description text
);


ALTER TABLE public.skills OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24659)
-- Name: skills_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skills_skill_id_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 228
-- Name: skills_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_skill_id_seq OWNED BY public.skills.skill_id;


--
-- TOC entry 226 (class 1259 OID 24637)
-- Name: stat_definitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stat_definitions (
    stat_id integer NOT NULL,
    name character varying(50),
    description text
);


ALTER TABLE public.stat_definitions OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24636)
-- Name: stat_definitions_stat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stat_definitions_stat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stat_definitions_stat_id_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 225
-- Name: stat_definitions_stat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stat_definitions_stat_id_seq OWNED BY public.stat_definitions.stat_id;


--
-- TOC entry 4791 (class 2604 OID 24627)
-- Name: character_archetypes archetype_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_archetypes ALTER COLUMN archetype_id SET DEFAULT nextval('public.character_archetypes_archetype_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 24604)
-- Name: game_genres genre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_genres ALTER COLUMN genre_id SET DEFAULT nextval('public.game_genres_genre_id_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 24696)
-- Name: interview_questions question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interview_questions ALTER COLUMN question_id SET DEFAULT nextval('public.interview_questions_question_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 24617)
-- Name: platforms platform_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platforms ALTER COLUMN platform_id SET DEFAULT nextval('public.platforms_platform_id_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 24678)
-- Name: production_constraints constraint_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_constraints ALTER COLUMN constraint_id SET DEFAULT nextval('public.production_constraints_constraint_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 24663)
-- Name: skills skill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills ALTER COLUMN skill_id SET DEFAULT nextval('public.skills_skill_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 24640)
-- Name: stat_definitions stat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stat_definitions ALTER COLUMN stat_id SET DEFAULT nextval('public.stat_definitions_stat_id_seq'::regclass);


--
-- TOC entry 4975 (class 0 OID 24646)
-- Dependencies: 227
-- Data for Name: archetype_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archetype_stats (archetype_id, stat_id, base_value, scaling_factor) FROM stdin;
1	1	150	1.5
1	3	80	1.2
2	2	200	1.6
2	4	90	1.8
3	5	95	2
\.


--
-- TOC entry 4972 (class 0 OID 24624)
-- Dependencies: 224
-- Data for Name: character_archetypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.character_archetypes (archetype_id, name, role, complexity_level, genre_id) FROM stdin;
1	Warrior	Tank/DPS	Low	1
2	Mage	Ranged DPS	Medium	1
3	Rogue	Stealth DPS	High	1
4	Support	Healer/Buffer	Medium	3
\.


--
-- TOC entry 4968 (class 0 OID 24601)
-- Dependencies: 220
-- Data for Name: game_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_genres (genre_id, name, description) FROM stdin;
1	RPG	Progression-heavy role-playing games
2	Action RPG	Fast-paced RPGs
3	MOBA	Competitive multiplayer arena
4	Survival	Resource-based gameplay
\.


--
-- TOC entry 4981 (class 0 OID 24693)
-- Dependencies: 233
-- Data for Name: interview_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interview_questions (question_id, category, difficulty, experience_level, question) FROM stdin;
1	Character Design	Easy	Junior	What makes an archetype readable to players?
2	Game Balance	Medium	Mid	How would you balance high burst damage characters?
3	Production Constraints	Hard	Senior	How do memory and animation budgets affect character design?
\.


--
-- TOC entry 4970 (class 0 OID 24614)
-- Dependencies: 222
-- Data for Name: platforms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.platforms (platform_id, name) FROM stdin;
1	PC
2	Console
3	Mobile
\.


--
-- TOC entry 4979 (class 0 OID 24675)
-- Dependencies: 231
-- Data for Name: production_constraints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production_constraints (constraint_id, genre_id, platform_id, max_skills, animation_complexity, memory_budget_mb) FROM stdin;
1	1	3	4	Low	256
2	1	1	3	Medium	512
\.


--
-- TOC entry 4977 (class 0 OID 24660)
-- Dependencies: 229
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skills (skill_id, archetype_id, name, type, cooldown, description) FROM stdin;
1	2	Fireball	Active	5	Area damage spell
2	2	Teleport	Active	12	Short distance escape
3	3	Backstab	Passive	0	Bonus damage from behind
\.


--
-- TOC entry 4974 (class 0 OID 24637)
-- Dependencies: 226
-- Data for Name: stat_definitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stat_definitions (stat_id, name, description) FROM stdin;
1	Health	Total survivability
2	Mana	Ability resource
3	Strength	Physical power
4	Intelligence	Magic power
5	Agility	Speed and evasion
\.


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 223
-- Name: character_archetypes_archetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.character_archetypes_archetype_id_seq', 4, true);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 219
-- Name: game_genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_genres_genre_id_seq', 4, true);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 232
-- Name: interview_questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interview_questions_question_id_seq', 1, false);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 221
-- Name: platforms_platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.platforms_platform_id_seq', 3, true);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 230
-- Name: production_constraints_constraint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_constraints_constraint_id_seq', 1, false);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 228
-- Name: skills_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_skill_id_seq', 3, true);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 225
-- Name: stat_definitions_stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stat_definitions_stat_id_seq', 5, true);


--
-- TOC entry 4805 (class 2606 OID 24630)
-- Name: character_archetypes character_archetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_archetypes
    ADD CONSTRAINT character_archetypes_pkey PRIMARY KEY (archetype_id);


--
-- TOC entry 4797 (class 2606 OID 24612)
-- Name: game_genres game_genres_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_genres
    ADD CONSTRAINT game_genres_name_key UNIQUE (name);


--
-- TOC entry 4799 (class 2606 OID 24610)
-- Name: game_genres game_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_genres
    ADD CONSTRAINT game_genres_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 4813 (class 2606 OID 24701)
-- Name: interview_questions interview_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interview_questions
    ADD CONSTRAINT interview_questions_pkey PRIMARY KEY (question_id);


--
-- TOC entry 4801 (class 2606 OID 24622)
-- Name: platforms platforms_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_name_key UNIQUE (name);


--
-- TOC entry 4803 (class 2606 OID 24620)
-- Name: platforms platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (platform_id);


--
-- TOC entry 4811 (class 2606 OID 24681)
-- Name: production_constraints production_constraints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_constraints
    ADD CONSTRAINT production_constraints_pkey PRIMARY KEY (constraint_id);


--
-- TOC entry 4809 (class 2606 OID 24668)
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (skill_id);


--
-- TOC entry 4807 (class 2606 OID 24645)
-- Name: stat_definitions stat_definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stat_definitions
    ADD CONSTRAINT stat_definitions_pkey PRIMARY KEY (stat_id);


--
-- TOC entry 4815 (class 2606 OID 24649)
-- Name: archetype_stats archetype_stats_archetype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archetype_stats
    ADD CONSTRAINT archetype_stats_archetype_id_fkey FOREIGN KEY (archetype_id) REFERENCES public.character_archetypes(archetype_id);


--
-- TOC entry 4816 (class 2606 OID 24654)
-- Name: archetype_stats archetype_stats_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archetype_stats
    ADD CONSTRAINT archetype_stats_stat_id_fkey FOREIGN KEY (stat_id) REFERENCES public.stat_definitions(stat_id);


--
-- TOC entry 4814 (class 2606 OID 24631)
-- Name: character_archetypes character_archetypes_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_archetypes
    ADD CONSTRAINT character_archetypes_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.game_genres(genre_id);


--
-- TOC entry 4818 (class 2606 OID 24682)
-- Name: production_constraints production_constraints_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_constraints
    ADD CONSTRAINT production_constraints_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.game_genres(genre_id);


--
-- TOC entry 4819 (class 2606 OID 24687)
-- Name: production_constraints production_constraints_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_constraints
    ADD CONSTRAINT production_constraints_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platforms(platform_id);


--
-- TOC entry 4817 (class 2606 OID 24669)
-- Name: skills skills_archetype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_archetype_id_fkey FOREIGN KEY (archetype_id) REFERENCES public.character_archetypes(archetype_id);


-- Completed on 2026-01-02 11:14:13

--
-- PostgreSQL database dump complete
--

\unrestrict ofUsXLDoePPDLOqrdxDkMAyJkjBPnWs9I0krVKzitAaH7xGsar53jk5P61dwRk9

