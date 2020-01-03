--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-01-03 11:35:17 CET

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
-- TOC entry 209 (class 1259 OID 16672)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    cid integer NOT NULL,
    comment character varying(255),
    author character varying,
    user_id integer,
    post_id integer,
    date_created timestamp without time zone
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16670)
-- Name: comments_cid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_cid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_cid_seq OWNER TO postgres;

--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 208
-- Name: comments_cid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_cid_seq OWNED BY public.comments.cid;


--
-- TOC entry 203 (class 1259 OID 16625)
-- Name: movies_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies_ratings (
    id integer NOT NULL,
    title character varying(255),
    poster_path character varying(300),
    rating integer DEFAULT 1,
    overview character varying(485)
);


ALTER TABLE public.movies_ratings OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16623)
-- Name: movies_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_ratings_id_seq OWNER TO postgres;

--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 202
-- Name: movies_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_ratings_id_seq OWNED BY public.movies_ratings.id;


--
-- TOC entry 207 (class 1259 OID 16650)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    pid integer NOT NULL,
    title character varying(255),
    body character varying,
    user_id integer,
    author character varying,
    date_created timestamp without time zone,
    likes integer DEFAULT 0
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16648)
-- Name: posts_pid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_pid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_pid_seq OWNER TO postgres;

--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 206
-- Name: posts_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_pid_seq OWNED BY public.posts.pid;


--
-- TOC entry 205 (class 1259 OID 16637)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    uid integer NOT NULL,
    username character varying(255),
    email character varying(255),
    email_verified boolean,
    date_created date,
    last_login date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16635)
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_uid_seq OWNER TO postgres;

--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_uid_seq OWNED BY public.users.uid;


--
-- TOC entry 3032 (class 2604 OID 16675)
-- Name: comments cid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN cid SET DEFAULT nextval('public.comments_cid_seq'::regclass);


--
-- TOC entry 3027 (class 2604 OID 16628)
-- Name: movies_ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_ratings ALTER COLUMN id SET DEFAULT nextval('public.movies_ratings_id_seq'::regclass);


--
-- TOC entry 3030 (class 2604 OID 16653)
-- Name: posts pid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN pid SET DEFAULT nextval('public.posts_pid_seq'::regclass);


--
-- TOC entry 3029 (class 2604 OID 16640)
-- Name: users uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN uid SET DEFAULT nextval('public.users_uid_seq'::regclass);


--
-- TOC entry 3181 (class 0 OID 16672)
-- Dependencies: 209
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (cid, comment, author, user_id, post_id, date_created) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 16625)
-- Dependencies: 203
-- Data for Name: movies_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies_ratings (id, title, poster_path, rating, overview) FROM stdin;
3	Jumanji: The Next Level	/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg	3	As the gang return to Jumanji to rescue one of their own, they discover that nothing is as they expect. The players will have to brave parts unknown and unexplored in order to escape the world’s most dangerous game.
4	Frozen II	/pjeMs3yqRmFL3giJy4PMXWZTTPa.jpg	5	Elsa, Anna, Kristoff and Olaf head far into the forest to learn the truth about an ancient mystery of their kingdom.
5	Zombieland: Double Tap	/pIcV8XXIIvJCbtPoxF9qHMKdRr2.jpg	5	Columbus, Tallahassee, Wichita, and Little Rock move to the American heartland as they face off against evolved zombies, fellow survivors, and the growing pains of the snarky makeshift family.
6	6 Underground	/lnWkyG3LLgbbrIEeyl5mK5VRFe4.jpg	3	After faking his death, a tech billionaire recruits a team of international operatives for a bold and bloody mission to take down a brutal dictator.
7	Red Shoes and the Seven Dwarfs	/MBiKqTsouYqAACLYNDadsjhhC0.jpg	4	Princes who have been turned into Dwarfs seek the red shoes of a lady in order to break the spell, although it will not be easy.
9	Code 8	/84Xz2Jh60tC3ICO1CY27wc0zwgC.jpg	5	In Lincoln City, some inhabitants have extraordinary abilities. Most live below the poverty line, under the close surveillance of a heavily militarized police force. Connor, a construction worker with powers, involves with a criminal gang to help his ailing mother. (Based on the short film “Code 8,” 2016.)
10	Spies in Disguise	/30YacPAcxpNemhhwX0PVUl9pVA3.jpg	5	When the worlds best spy is turned into a pigeon, he must rely on his nerdy tech officer to save the world.
11	Rambo: Last Blood	/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg	3	After fighting his demons for decades, John Rambo now lives in peace on his family ranch in Arizona, but his rest is interrupted when Gabriela, the granddaughter of his housekeeper María, disappears after crossing the border into Mexico to meet her biological father. Rambo, who has become a true father figure for Gabriela over the years, undertakes a desperate and dangerous journey to find her.
12	One Piece: Stampede	/4E2lyUGLEr3yH4q6kJxPkQUhX7n.jpg	5	One Piece: Stampede is a stand-alone film that celebrates the animes 20th Anniversary and takes place outside the canon of the \\"One Piece\\" TV series. Monkey D. Luffy and his Straw Hat pirate crew are invited to a massive Pirate Festival that brings many of the most iconic characters from throughout the franchise to participate in competition with the Straw Hats to find Rogers treasure. It also pits the Straw Hats against a new enemy named Bullet, a former member of Rogers crew.
13	Cats	/9zvjgr1v8pwFYQNHZTtnKNQUWmw.jpg	5	A tribe of cats called the Jellicles must decide yearly which one will ascend to the Heaviside Layer and come back to a new Jellicle life.
18	Parasite	/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg	4	All unemployed, Ki-taeks family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.
8	Ip Man 4: The Finale	/2MwpeDrI7RbgD6bipT31kpMZe9u.jpg	3	Ip Man 4 is an upcoming Hong Kong biographical martial arts film directed by Wilson Yip and produced by Raymond Wong. It is the fourth in the Ip Man film series based on the life of the Wing Chun grandmaster of the same name and features Donnie Yen reprising the role. The film began production in April 2018 and ended in July the same year.
17	Marriage Story	/pZekG6xabTmZxjmYw10wN84Hp8d.jpg	5	A stage director and an actress struggle through a grueling, coast-to-coast divorce that pushes them to their personal extremes.
20	The Aeronauts	/kZHnblqmTBUBgzYBIxWIz9txsEi.jpg	4	In 1862, daredevil balloon pilot Amelia Wren teams up with pioneering meteorologist James Glaisher  to advance human knowledge of the weather and fly higher than anyone in history. While breaking records and advancing scientific discovery, their voyage to the very edge of existence helps the unlikely pair find their place in the world they have left far below them. But they face physical and emotional challenges in the thin air, as the ascent becomes a fight for survival.
14	Knives Out	/pThyQovXQrw2m0s9x82twj48Jq4.jpg	5	When renowned crime novelist Harlan Thrombey is found dead at his estate just after his 85th birthday, the inquisitive and debonair Detective Benoit Blanc is mysteriously enlisted to investigate. From Harlans dysfunctional family to his devoted staff, Blanc sifts through a web of red herrings and self-serving lies to uncover the truth behind Harlans untimely death.
16	The Irishman	/mbm8k3GFhXS0ROd9AD1gqYbIFbM.jpg	1	Pennsylvania, 1956. Frank Sheeran, a war veteran of Irish origin who works as a truck driver, accidentally meets mobster Russell Bufalino. Once Frank becomes his trusted man, Bufalino sends him to Chicago with the task of helping Jimmy Hoffa, a powerful union leader related to organized crime, with whom Frank will maintain a close friendship for nearly twenty years.
15	Angel Has Fallen	/fapXd3v9qTcNBTm39ZC4KUVQDNf.jpg	2	After a treacherous attack, Secret Service agent Mike Banning is charged with attempting to assassinate President Trumbull. Chased by his own colleagues and the FBI, Banning begins a race against the clock to clear his name.
19	The Lighthouse	/3nk9UoepYmv1G9oP18q6JJCeYwN.jpg	3	Two lighthouse keepers try to maintain their sanity while living on a remote and mysterious New England island in the 1890s.
2	Ad Astra	/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg	5	The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon menaces to destroy life on planet Earth, astronaut Roy McBride undertakes a mission across the immensity of space and its many perils to uncover the truth about a lost expedition that decades before boldly faced emptiness and silence in search of the unknown.
1	Star Wars: The Rise of Skywalker	/db32LaOibwEliAmSL2jjDF6oDdj.jpg	3	The surviving Resistance faces the First Order once again as the journey of Rey, Finn and Poe Dameron continues. With the power and knowledge of generations behind them, the final battle begins.
\.


--
-- TOC entry 3179 (class 0 OID 16650)
-- Dependencies: 207
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (pid, title, body, user_id, author, date_created, likes) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 16637)
-- Dependencies: 205
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (uid, username, email, email_verified, date_created, last_login) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 208
-- Name: comments_cid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_cid_seq', 1, false);


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 202
-- Name: movies_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_ratings_id_seq', 1, false);


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 206
-- Name: posts_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_pid_seq', 1, false);


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_uid_seq', 1, false);


--
-- TOC entry 3042 (class 2606 OID 16680)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (cid);


--
-- TOC entry 3034 (class 2606 OID 16634)
-- Name: movies_ratings movies_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_ratings
    ADD CONSTRAINT movies_ratings_pkey PRIMARY KEY (id);


--
-- TOC entry 3040 (class 2606 OID 16659)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (pid);


--
-- TOC entry 3036 (class 2606 OID 16645)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- TOC entry 3038 (class 2606 OID 16647)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3045 (class 2606 OID 16681)
-- Name: comments comments_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_author_fkey FOREIGN KEY (author) REFERENCES public.users(username);


--
-- TOC entry 3047 (class 2606 OID 16691)
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(pid);


--
-- TOC entry 3046 (class 2606 OID 16686)
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(uid);


--
-- TOC entry 3044 (class 2606 OID 16665)
-- Name: posts posts_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_fkey FOREIGN KEY (author) REFERENCES public.users(username);


--
-- TOC entry 3043 (class 2606 OID 16660)
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(uid);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE comments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.comments TO PUBLIC;
GRANT ALL ON TABLE public.comments TO "Admin";


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE movies_ratings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.movies_ratings TO PUBLIC;
GRANT ALL ON TABLE public.movies_ratings TO "Admin";


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE posts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.posts TO PUBLIC;
GRANT ALL ON TABLE public.posts TO "Admin";


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO PUBLIC;
GRANT ALL ON TABLE public.users TO "Admin";


--
-- TOC entry 1711 (class 826 OID 16622)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO "Admin";


-- Completed on 2020-01-03 11:35:17 CET

--
-- PostgreSQL database dump complete
--

