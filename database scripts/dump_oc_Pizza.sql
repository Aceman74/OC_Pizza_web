--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2019-07-26 09:33:28

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

--
-- TOC entry 6 (class 2615 OID 32078)
-- Name: oc_pizza; Type: SCHEMA; Schema: -; Owner: ocPizza_admin
--

CREATE SCHEMA oc_pizza;


ALTER SCHEMA oc_pizza OWNER TO "ocPizza_admin";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 217 (class 1259 OID 32160)
-- Name: adresse; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.adresse (
    adresse_id integer NOT NULL,
    rue character varying(50) NOT NULL,
    complement_adresse character varying(50),
    code_postale numeric(5,0) NOT NULL,
    ville character varying(50) NOT NULL,
    telephone numeric(10,0) NOT NULL,
    email character varying(100) NOT NULL,
    adresse_livraison boolean NOT NULL,
    adresse_facturation boolean NOT NULL,
    nom_pizzeria_id character varying(50) NOT NULL,
    client_id integer
);


ALTER TABLE oc_pizza.adresse OWNER TO "ocPizza_admin";

--
-- TOC entry 216 (class 1259 OID 32158)
-- Name: adresse_adresse_id_seq; Type: SEQUENCE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE SEQUENCE oc_pizza.adresse_adresse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_pizza.adresse_adresse_id_seq OWNER TO "ocPizza_admin";

--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 216
-- Name: adresse_adresse_id_seq; Type: SEQUENCE OWNED BY; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER SEQUENCE oc_pizza.adresse_adresse_id_seq OWNED BY oc_pizza.adresse.adresse_id;


--
-- TOC entry 202 (class 1259 OID 32097)
-- Name: client; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.client (
    client_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    date_naissance date NOT NULL,
    identifiant_id integer NOT NULL
);


ALTER TABLE oc_pizza.client OWNER TO "ocPizza_admin";

--
-- TOC entry 201 (class 1259 OID 32095)
-- Name: client_client_id_seq; Type: SEQUENCE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE SEQUENCE oc_pizza.client_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_pizza.client_client_id_seq OWNER TO "ocPizza_admin";

--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 201
-- Name: client_client_id_seq; Type: SEQUENCE OWNED BY; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER SEQUENCE oc_pizza.client_client_id_seq OWNED BY oc_pizza.client.client_id;


--
-- TOC entry 214 (class 1259 OID 32147)
-- Name: commande; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.commande (
    numero_commande_id integer NOT NULL,
    type_paiement character varying(50) NOT NULL,
    date date NOT NULL,
    deja_payee boolean NOT NULL,
    statut_en_preparation boolean NOT NULL,
    statut_prete boolean NOT NULL,
    statut_livree boolean NOT NULL,
    heure_livree time without time zone,
    livreur_id integer,
    client_id integer NOT NULL
);


ALTER TABLE oc_pizza.commande OWNER TO "ocPizza_admin";

--
-- TOC entry 213 (class 1259 OID 32145)
-- Name: commande_numero_commande_seq; Type: SEQUENCE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE SEQUENCE oc_pizza.commande_numero_commande_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_pizza.commande_numero_commande_seq OWNER TO "ocPizza_admin";

--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 213
-- Name: commande_numero_commande_seq; Type: SEQUENCE OWNED BY; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER SEQUENCE oc_pizza.commande_numero_commande_seq OWNED BY oc_pizza.commande.numero_commande_id;


--
-- TOC entry 212 (class 1259 OID 32139)
-- Name: employe; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.employe (
    employe_id integer NOT NULL,
    nom_pizzeria_id character varying(50) NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    identifiant_id integer NOT NULL,
    type_employe_id integer NOT NULL
);


ALTER TABLE oc_pizza.employe OWNER TO "ocPizza_admin";

--
-- TOC entry 211 (class 1259 OID 32137)
-- Name: employe_employe_id_seq; Type: SEQUENCE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE SEQUENCE oc_pizza.employe_employe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_pizza.employe_employe_id_seq OWNER TO "ocPizza_admin";

--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 211
-- Name: employe_employe_id_seq; Type: SEQUENCE OWNED BY; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER SEQUENCE oc_pizza.employe_employe_id_seq OWNED BY oc_pizza.employe.employe_id;


--
-- TOC entry 200 (class 1259 OID 32089)
-- Name: identifiant; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.identifiant (
    identifiant_id integer NOT NULL,
    login character varying(20) NOT NULL,
    mot_de_passe character varying(20) NOT NULL,
    est_employe boolean NOT NULL,
    est_client boolean NOT NULL
);


ALTER TABLE oc_pizza.identifiant OWNER TO "ocPizza_admin";

--
-- TOC entry 199 (class 1259 OID 32087)
-- Name: identifiant_identifiant_id_seq; Type: SEQUENCE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE SEQUENCE oc_pizza.identifiant_identifiant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_pizza.identifiant_identifiant_id_seq OWNER TO "ocPizza_admin";

--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 199
-- Name: identifiant_identifiant_id_seq; Type: SEQUENCE OWNED BY; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER SEQUENCE oc_pizza.identifiant_identifiant_id_seq OWNED BY oc_pizza.identifiant.identifiant_id;


--
-- TOC entry 209 (class 1259 OID 32127)
-- Name: ingredient_requis; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.ingredient_requis (
    stock_id integer NOT NULL,
    ingredient_requis character varying(50) NOT NULL,
    quantite_requise integer NOT NULL,
    nom_pizza_id character varying(50) NOT NULL
);


ALTER TABLE oc_pizza.ingredient_requis OWNER TO "ocPizza_admin";

--
-- TOC entry 215 (class 1259 OID 32153)
-- Name: ligne_commande; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.ligne_commande (
    numero_commande_id integer NOT NULL,
    date date NOT NULL,
    quantite integer NOT NULL,
    nom_pizza_id character varying(50) NOT NULL
);


ALTER TABLE oc_pizza.ligne_commande OWNER TO "ocPizza_admin";

--
-- TOC entry 208 (class 1259 OID 32121)
-- Name: pizza; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.pizza (
    nom_pizza_id character varying(50) NOT NULL,
    prix_unitaire_ht numeric(5,2) NOT NULL
);


ALTER TABLE oc_pizza.pizza OWNER TO "ocPizza_admin";

--
-- TOC entry 207 (class 1259 OID 32119)
-- Name: pizza_nom_pizza_id_seq; Type: SEQUENCE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE SEQUENCE oc_pizza.pizza_nom_pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_pizza.pizza_nom_pizza_id_seq OWNER TO "ocPizza_admin";

--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 207
-- Name: pizza_nom_pizza_id_seq; Type: SEQUENCE OWNED BY; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER SEQUENCE oc_pizza.pizza_nom_pizza_id_seq OWNED BY oc_pizza.pizza.nom_pizza_id;


--
-- TOC entry 204 (class 1259 OID 32105)
-- Name: pizzeria; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.pizzeria (
    nom_pizzeria_id character varying(50) NOT NULL,
    horaires character varying(100) NOT NULL,
    distance_livraison integer NOT NULL
);


ALTER TABLE oc_pizza.pizzeria OWNER TO "ocPizza_admin";

--
-- TOC entry 203 (class 1259 OID 32103)
-- Name: pizzeria_nom_pizzeria_id_seq; Type: SEQUENCE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE SEQUENCE oc_pizza.pizzeria_nom_pizzeria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_pizza.pizzeria_nom_pizzeria_id_seq OWNER TO "ocPizza_admin";

--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 203
-- Name: pizzeria_nom_pizzeria_id_seq; Type: SEQUENCE OWNED BY; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER SEQUENCE oc_pizza.pizzeria_nom_pizzeria_id_seq OWNED BY oc_pizza.pizzeria.nom_pizzeria_id;


--
-- TOC entry 210 (class 1259 OID 32132)
-- Name: recette; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.recette (
    nom_pizza_id character varying(50) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE oc_pizza.recette OWNER TO "ocPizza_admin";

--
-- TOC entry 206 (class 1259 OID 32113)
-- Name: stock_ingredient; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.stock_ingredient (
    stock_id integer NOT NULL,
    nom_ingredient character varying(50) NOT NULL,
    quantite_totale integer NOT NULL,
    nom_pizzeria_id character varying(50) NOT NULL
);


ALTER TABLE oc_pizza.stock_ingredient OWNER TO "ocPizza_admin";

--
-- TOC entry 205 (class 1259 OID 32111)
-- Name: stock_ingredient_ingredient_id_seq; Type: SEQUENCE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE SEQUENCE oc_pizza.stock_ingredient_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_pizza.stock_ingredient_ingredient_id_seq OWNER TO "ocPizza_admin";

--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 205
-- Name: stock_ingredient_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER SEQUENCE oc_pizza.stock_ingredient_ingredient_id_seq OWNED BY oc_pizza.stock_ingredient.stock_id;


--
-- TOC entry 198 (class 1259 OID 32081)
-- Name: type_employe; Type: TABLE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE TABLE oc_pizza.type_employe (
    type_employe_id integer NOT NULL,
    livreur boolean NOT NULL,
    pizzaiolo boolean NOT NULL,
    receptionniste boolean NOT NULL
);


ALTER TABLE oc_pizza.type_employe OWNER TO "ocPizza_admin";

--
-- TOC entry 197 (class 1259 OID 32079)
-- Name: type_employe_employe_id_seq; Type: SEQUENCE; Schema: oc_pizza; Owner: ocPizza_admin
--

CREATE SEQUENCE oc_pizza.type_employe_employe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_pizza.type_employe_employe_id_seq OWNER TO "ocPizza_admin";

--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 197
-- Name: type_employe_employe_id_seq; Type: SEQUENCE OWNED BY; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER SEQUENCE oc_pizza.type_employe_employe_id_seq OWNED BY oc_pizza.type_employe.type_employe_id;


--
-- TOC entry 2754 (class 2604 OID 32163)
-- Name: adresse adresse_id; Type: DEFAULT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.adresse ALTER COLUMN adresse_id SET DEFAULT nextval('oc_pizza.adresse_adresse_id_seq'::regclass);


--
-- TOC entry 2748 (class 2604 OID 32100)
-- Name: client client_id; Type: DEFAULT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.client ALTER COLUMN client_id SET DEFAULT nextval('oc_pizza.client_client_id_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 32150)
-- Name: commande numero_commande_id; Type: DEFAULT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.commande ALTER COLUMN numero_commande_id SET DEFAULT nextval('oc_pizza.commande_numero_commande_seq'::regclass);


--
-- TOC entry 2752 (class 2604 OID 32142)
-- Name: employe employe_id; Type: DEFAULT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.employe ALTER COLUMN employe_id SET DEFAULT nextval('oc_pizza.employe_employe_id_seq'::regclass);


--
-- TOC entry 2747 (class 2604 OID 32092)
-- Name: identifiant identifiant_id; Type: DEFAULT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.identifiant ALTER COLUMN identifiant_id SET DEFAULT nextval('oc_pizza.identifiant_identifiant_id_seq'::regclass);


--
-- TOC entry 2751 (class 2604 OID 32124)
-- Name: pizza nom_pizza_id; Type: DEFAULT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.pizza ALTER COLUMN nom_pizza_id SET DEFAULT nextval('oc_pizza.pizza_nom_pizza_id_seq'::regclass);


--
-- TOC entry 2749 (class 2604 OID 32108)
-- Name: pizzeria nom_pizzeria_id; Type: DEFAULT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.pizzeria ALTER COLUMN nom_pizzeria_id SET DEFAULT nextval('oc_pizza.pizzeria_nom_pizzeria_id_seq'::regclass);


--
-- TOC entry 2750 (class 2604 OID 32116)
-- Name: stock_ingredient stock_id; Type: DEFAULT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.stock_ingredient ALTER COLUMN stock_id SET DEFAULT nextval('oc_pizza.stock_ingredient_ingredient_id_seq'::regclass);


--
-- TOC entry 2746 (class 2604 OID 32084)
-- Name: type_employe type_employe_id; Type: DEFAULT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.type_employe ALTER COLUMN type_employe_id SET DEFAULT nextval('oc_pizza.type_employe_employe_id_seq'::regclass);


--
-- TOC entry 2934 (class 0 OID 32160)
-- Dependencies: 217
-- Data for Name: adresse; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.adresse (adresse_id, rue, complement_adresse, code_postale, ville, telephone, email, adresse_livraison, adresse_facturation, nom_pizzeria_id, client_id) FROM stdin;
1	51 Route de Frize	\N	74140	Messery	630254436	OCpizzaLac@gmail.com	t	t	OCPizza du Lac	\N
2	51 Route de Paris	Sous tour Effeil	75000	Paris	675007500	OCpizzaParis@gmail.com	t	t	OCPizza Capital	\N
3	51 Route du Vieux Port	\N	13000	Marseille	613001300	OCpizzaMarseille@gmail.com	t	t	OCPizza du Port	\N
4	51 Route de Dieppe	Devant la piscine	76200	Dieppe	676207620	OCpizzaNormandie@gmail.com	t	t	OCPizza du Nord	\N
5	51 Route Albuquerque	\N	74140	Messery	630303030	BabyBlue@gmail.com	t	t	OCPizza du Lac	1
6	51 Route de Scranton	\N	75000	Paris	675757575	Dunder4Life@gmail.com	f	t	OCPizza Capital	2
7	108 Route de la Tour	\N	75000	Paris	601050408	DwightSchrute@gmail.com	t	f	OCPizza Capital	2
8	51 Route Inconnu	Deposer devant la porte 12	13000	Marseille	613111311	pickleRick@gmail.com	t	t	OCPizza du Port	3
9	51 Route du valhalla	Frapper fort	76200	Dieppe	676227622	northenLegend@gmail.com	t	t	OCPizza du Nord	4
\.


--
-- TOC entry 2919 (class 0 OID 32097)
-- Dependencies: 202
-- Data for Name: client; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.client (client_id, nom, prenom, date_naissance, identifiant_id) FROM stdin;
1	White	Walter	1959-09-07	9
2	Scott	Mickael	1964-05-15	10
3	Sanchez	Rick	1965-01-01	11
4	Lodbrok	Ragnar	0840-06-10	12
\.


--
-- TOC entry 2931 (class 0 OID 32147)
-- Dependencies: 214
-- Data for Name: commande; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.commande (numero_commande_id, type_paiement, date, deja_payee, statut_en_preparation, statut_prete, statut_livree, heure_livree, livreur_id, client_id) FROM stdin;
1	Paypal	2019-07-16	t	f	f	t	18:00:50	1	1
2	Espèce	2019-07-17	t	f	t	f	\N	2	2
3	CB comptoir	2019-07-17	f	t	f	f	\N	2	3
4	Espèce	2019-07-17	f	t	f	f	\N	2	4
\.


--
-- TOC entry 2929 (class 0 OID 32139)
-- Dependencies: 212
-- Data for Name: employe; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.employe (employe_id, nom_pizzeria_id, nom, prenom, identifiant_id, type_employe_id) FROM stdin;
1	OCPizza du Lac	Bond	James	1	1
2	OCPizza du Lac	Brosnan	Pierce	2	2
3	OCPizza Capital	Powers	Austin	3	3
4	OCPizza Capital	Myers	Mike	4	4
5	OCPizza du Port	Bonnisseur	Hubert	5	5
6	OCPizza du Port	Dujardin	Jean	6	6
7	OCPizza du Nord	English	Johnny	7	7
8	OCPizza du Nord	Atkinson	Rowan	8	8
\.


--
-- TOC entry 2917 (class 0 OID 32089)
-- Dependencies: 200
-- Data for Name: identifiant; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.identifiant (identifiant_id, login, mot_de_passe, est_employe, est_client) FROM stdin;
1	jamesBond	espion007	t	f
2	JePerce	BRO5nan	t	f
3	Mojo	YEAHbaby	t	f
4	mike	MMY69	t	f
5	Lucien	Bramart	t	f
6	JeanD	111111	t	f
7	Queen	ELIZABAIT2	t	f
8	Row	atkiki_	t	f
9	SayMyName	Heinsenberg	f	t
10	PrisonMike	DUNDERMIFFLIN	f	t
11	rick	morty	f	t
12	Yarl	Lagertha	f	t
\.


--
-- TOC entry 2926 (class 0 OID 32127)
-- Dependencies: 209
-- Data for Name: ingredient_requis; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.ingredient_requis (stock_id, ingredient_requis, quantite_requise, nom_pizza_id) FROM stdin;
1	Champignons	100	Reine
2	Chèvre	250	Reine
3	Sauce Tomate	300	Calzone
4	Jambon	200	Margherita
5	Gruyère	150	Reine
6	Olive	50	Margherita
7	Mozzarella	150	4 Fromages
8	Bleu	100	4 Fromages
\.


--
-- TOC entry 2932 (class 0 OID 32153)
-- Dependencies: 215
-- Data for Name: ligne_commande; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.ligne_commande (numero_commande_id, date, quantite, nom_pizza_id) FROM stdin;
1	2019-07-16	2	Reine
2	2019-07-17	1	4 Fromages
3	2019-07-17	1	Calzone
4	2019-07-17	1	Margherita
\.


--
-- TOC entry 2925 (class 0 OID 32121)
-- Dependencies: 208
-- Data for Name: pizza; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.pizza (nom_pizza_id, prix_unitaire_ht) FROM stdin;
Reine	10.25
4 Fromages	12.00
Calzone	10.50
Margherita	11.50
\.


--
-- TOC entry 2921 (class 0 OID 32105)
-- Dependencies: 204
-- Data for Name: pizzeria; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.pizzeria (nom_pizzeria_id, horaires, distance_livraison) FROM stdin;
OCPizza du Lac	Du Lundi au Samedi de 11h a 21h	20
OCPizza Capital	Du Lundi au Samedi de 12h a 22h	15
OCPizza du Port	Du Lundi au Samedi de 12h a 22h	15
OCPizza du Nord	Du Lundi au Samedi de 11h a 21h	20
\.


--
-- TOC entry 2927 (class 0 OID 32132)
-- Dependencies: 210
-- Data for Name: recette; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.recette (nom_pizza_id, description) FROM stdin;
Reine	200g Champignon de Paris, 200g Janbon, 300g Sauce tomate, Gruyere.
4 Fromages	200g Chevre, 200g Bleu, 200g Mozzarella, 200g Gruyère.
Calzone	200g Mozzarella, 200g Jambon, 100g Champignon, 4 Oeufs, 100g Olive.
Margherita	200g Jambon, 100g Gruyère, 150g Champignon, 200g Mozzarella
\.


--
-- TOC entry 2923 (class 0 OID 32113)
-- Dependencies: 206
-- Data for Name: stock_ingredient; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.stock_ingredient (stock_id, nom_ingredient, quantite_totale, nom_pizzeria_id) FROM stdin;
1	Champignons	2500	OCPizza du Lac
2	Chèvre	4100	OCPizza du Lac
3	Sauce Tomate	6200	OCPizza du Lac
4	Jambon	4200	OCPizza du Lac
5	Gruyère	4100	OCPizza du Lac
6	Olive	2500	OCPizza du Lac
7	Mozzarella	4000	OCPizza du Lac
8	Bleu	3800	OCPizza du Lac
9	Champignons	3100	OCPizza Capital
10	Chèvre	4500	OCPizza Capital
11	Sauce Tomate	6300	OCPizza Capital
12	Jambon	4250	OCPizza Capital
13	Gruyère	4300	OCPizza Capital
14	Olive	2150	OCPizza Capital
15	Mozzarella	4100	OCPizza Capital
16	Bleu	3100	OCPizza Capital
17	Champignons	3100	OCPizza du Port
18	Chèvre	4200	OCPizza du Port
19	Sauce Tomate	6200	OCPizza du Port
20	Jambon	4050	OCPizza du Port
21	Gruyère	4800	OCPizza du Port
22	Olive	2050	OCPizza du Port
23	Mozzarella	4400	OCPizza du Port
24	Bleu	3000	OCPizza du Port
25	Champignons	3200	OCPizza du Nord
26	Chèvre	3500	OCPizza du Nord
27	Sauce Tomate	6250	OCPizza du Nord
28	Jambon	3200	OCPizza du Nord
29	Gruyère	3500	OCPizza du Nord
30	Olive	2100	OCPizza du Nord
31	Mozzarella	2800	OCPizza du Nord
32	Bleu	3250	OCPizza du Nord
\.


--
-- TOC entry 2915 (class 0 OID 32081)
-- Dependencies: 198
-- Data for Name: type_employe; Type: TABLE DATA; Schema: oc_pizza; Owner: ocPizza_admin
--

COPY oc_pizza.type_employe (type_employe_id, livreur, pizzaiolo, receptionniste) FROM stdin;
1	t	f	f
2	f	t	t
3	f	t	f
4	t	f	f
5	f	t	t
6	t	f	f
7	f	t	f
8	t	f	t
\.


--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 216
-- Name: adresse_adresse_id_seq; Type: SEQUENCE SET; Schema: oc_pizza; Owner: ocPizza_admin
--

SELECT pg_catalog.setval('oc_pizza.adresse_adresse_id_seq', 9, true);


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 201
-- Name: client_client_id_seq; Type: SEQUENCE SET; Schema: oc_pizza; Owner: ocPizza_admin
--

SELECT pg_catalog.setval('oc_pizza.client_client_id_seq', 4, true);


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 213
-- Name: commande_numero_commande_seq; Type: SEQUENCE SET; Schema: oc_pizza; Owner: ocPizza_admin
--

SELECT pg_catalog.setval('oc_pizza.commande_numero_commande_seq', 4, true);


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 211
-- Name: employe_employe_id_seq; Type: SEQUENCE SET; Schema: oc_pizza; Owner: ocPizza_admin
--

SELECT pg_catalog.setval('oc_pizza.employe_employe_id_seq', 8, true);


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 199
-- Name: identifiant_identifiant_id_seq; Type: SEQUENCE SET; Schema: oc_pizza; Owner: ocPizza_admin
--

SELECT pg_catalog.setval('oc_pizza.identifiant_identifiant_id_seq', 1, false);


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 207
-- Name: pizza_nom_pizza_id_seq; Type: SEQUENCE SET; Schema: oc_pizza; Owner: ocPizza_admin
--

SELECT pg_catalog.setval('oc_pizza.pizza_nom_pizza_id_seq', 1, false);


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 203
-- Name: pizzeria_nom_pizzeria_id_seq; Type: SEQUENCE SET; Schema: oc_pizza; Owner: ocPizza_admin
--

SELECT pg_catalog.setval('oc_pizza.pizzeria_nom_pizzeria_id_seq', 1, false);


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 205
-- Name: stock_ingredient_ingredient_id_seq; Type: SEQUENCE SET; Schema: oc_pizza; Owner: ocPizza_admin
--

SELECT pg_catalog.setval('oc_pizza.stock_ingredient_ingredient_id_seq', 32, true);


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 197
-- Name: type_employe_employe_id_seq; Type: SEQUENCE SET; Schema: oc_pizza; Owner: ocPizza_admin
--

SELECT pg_catalog.setval('oc_pizza.type_employe_employe_id_seq', 1, false);


--
-- TOC entry 2778 (class 2606 OID 32165)
-- Name: adresse adresse_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.adresse
    ADD CONSTRAINT adresse_pk PRIMARY KEY (adresse_id);


--
-- TOC entry 2760 (class 2606 OID 32102)
-- Name: client client_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.client
    ADD CONSTRAINT client_pk PRIMARY KEY (client_id);


--
-- TOC entry 2774 (class 2606 OID 32152)
-- Name: commande commande_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (numero_commande_id);


--
-- TOC entry 2772 (class 2606 OID 32144)
-- Name: employe employe_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.employe
    ADD CONSTRAINT employe_pk PRIMARY KEY (employe_id);


--
-- TOC entry 2758 (class 2606 OID 32094)
-- Name: identifiant identifiant_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.identifiant
    ADD CONSTRAINT identifiant_pk PRIMARY KEY (identifiant_id);


--
-- TOC entry 2768 (class 2606 OID 32131)
-- Name: ingredient_requis ingredient_requis_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.ingredient_requis
    ADD CONSTRAINT ingredient_requis_pk PRIMARY KEY (stock_id);


--
-- TOC entry 2776 (class 2606 OID 32157)
-- Name: ligne_commande ligne_commande_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.ligne_commande
    ADD CONSTRAINT ligne_commande_pk PRIMARY KEY (numero_commande_id);


--
-- TOC entry 2766 (class 2606 OID 32126)
-- Name: pizza pizza_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.pizza
    ADD CONSTRAINT pizza_pk PRIMARY KEY (nom_pizza_id);


--
-- TOC entry 2762 (class 2606 OID 32110)
-- Name: pizzeria pizzeria_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.pizzeria
    ADD CONSTRAINT pizzeria_pk PRIMARY KEY (nom_pizzeria_id);


--
-- TOC entry 2770 (class 2606 OID 32136)
-- Name: recette recette_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.recette
    ADD CONSTRAINT recette_pk PRIMARY KEY (nom_pizza_id);


--
-- TOC entry 2764 (class 2606 OID 32118)
-- Name: stock_ingredient stock_ingredient_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.stock_ingredient
    ADD CONSTRAINT stock_ingredient_pk PRIMARY KEY (stock_id);


--
-- TOC entry 2756 (class 2606 OID 32086)
-- Name: type_employe type_employe_pk; Type: CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.type_employe
    ADD CONSTRAINT type_employe_pk PRIMARY KEY (type_employe_id);


--
-- TOC entry 2791 (class 2606 OID 32186)
-- Name: adresse client_adresse_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.adresse
    ADD CONSTRAINT client_adresse_fk FOREIGN KEY (client_id) REFERENCES oc_pizza.client(client_id);


--
-- TOC entry 2787 (class 2606 OID 32181)
-- Name: commande client_commande_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.commande
    ADD CONSTRAINT client_commande_fk FOREIGN KEY (client_id) REFERENCES oc_pizza.client(client_id);


--
-- TOC entry 2790 (class 2606 OID 32231)
-- Name: ligne_commande commande_lignecommande_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.ligne_commande
    ADD CONSTRAINT commande_lignecommande_fk FOREIGN KEY (numero_commande_id) REFERENCES oc_pizza.commande(numero_commande_id);


--
-- TOC entry 2788 (class 2606 OID 32226)
-- Name: commande employe_commande_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.commande
    ADD CONSTRAINT employe_commande_fk FOREIGN KEY (livreur_id) REFERENCES oc_pizza.employe(employe_id);


--
-- TOC entry 2779 (class 2606 OID 32176)
-- Name: client identifiant_client_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.client
    ADD CONSTRAINT identifiant_client_fk FOREIGN KEY (identifiant_id) REFERENCES oc_pizza.identifiant(identifiant_id);


--
-- TOC entry 2785 (class 2606 OID 32171)
-- Name: employe identifiant_employe_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.employe
    ADD CONSTRAINT identifiant_employe_fk FOREIGN KEY (identifiant_id) REFERENCES oc_pizza.identifiant(identifiant_id);


--
-- TOC entry 2782 (class 2606 OID 32216)
-- Name: ingredient_requis pizza_ingredient_requis_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.ingredient_requis
    ADD CONSTRAINT pizza_ingredient_requis_fk FOREIGN KEY (nom_pizza_id) REFERENCES oc_pizza.pizza(nom_pizza_id);


--
-- TOC entry 2789 (class 2606 OID 32221)
-- Name: ligne_commande pizza_ligne_commande_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.ligne_commande
    ADD CONSTRAINT pizza_ligne_commande_fk FOREIGN KEY (nom_pizza_id) REFERENCES oc_pizza.pizza(nom_pizza_id);


--
-- TOC entry 2783 (class 2606 OID 32211)
-- Name: recette pizza_recette_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.recette
    ADD CONSTRAINT pizza_recette_fk FOREIGN KEY (nom_pizza_id) REFERENCES oc_pizza.pizza(nom_pizza_id);


--
-- TOC entry 2792 (class 2606 OID 32196)
-- Name: adresse pizzeria_adresse_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.adresse
    ADD CONSTRAINT pizzeria_adresse_fk FOREIGN KEY (nom_pizzeria_id) REFERENCES oc_pizza.pizzeria(nom_pizzeria_id);


--
-- TOC entry 2786 (class 2606 OID 32191)
-- Name: employe pizzeria_employe_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.employe
    ADD CONSTRAINT pizzeria_employe_fk FOREIGN KEY (nom_pizzeria_id) REFERENCES oc_pizza.pizzeria(nom_pizzeria_id);


--
-- TOC entry 2780 (class 2606 OID 32201)
-- Name: stock_ingredient pizzeria_stock_ingredient_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.stock_ingredient
    ADD CONSTRAINT pizzeria_stock_ingredient_fk FOREIGN KEY (nom_pizzeria_id) REFERENCES oc_pizza.pizzeria(nom_pizzeria_id);


--
-- TOC entry 2781 (class 2606 OID 32206)
-- Name: ingredient_requis stock_ingredient_ingredient_requis_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.ingredient_requis
    ADD CONSTRAINT stock_ingredient_ingredient_requis_fk FOREIGN KEY (stock_id) REFERENCES oc_pizza.stock_ingredient(stock_id);


--
-- TOC entry 2784 (class 2606 OID 32166)
-- Name: employe type_employe_employe_fk; Type: FK CONSTRAINT; Schema: oc_pizza; Owner: ocPizza_admin
--

ALTER TABLE ONLY oc_pizza.employe
    ADD CONSTRAINT type_employe_employe_fk FOREIGN KEY (type_employe_id) REFERENCES oc_pizza.type_employe(type_employe_id);


-- Completed on 2019-07-26 09:33:29

--
-- PostgreSQL database dump complete
--

