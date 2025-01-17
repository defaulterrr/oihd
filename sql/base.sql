toc.dat                                                                                             0000600 0004000 0002000 00000031236 13767433602 0014457 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           x            oihd3    12.2    12.2 ,    H           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         I           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         J           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         K           1262    128931    oihd3    DATABASE     �   CREATE DATABASE oihd3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE oihd3;
                postgres    false         �            1259    128974 
   categories    TABLE     s   CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false         �            1259    128972    categories_cat_id_seq    SEQUENCE     �   ALTER TABLE public.categories ALTER COLUMN category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_cat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207         �            1259    129028    comments    TABLE     �   CREATE TABLE public.comments (
    comments_id integer NOT NULL,
    comments_news_id integer NOT NULL,
    comments_created_at date NOT NULL,
    comments_created_by integer NOT NULL,
    content text
);
    DROP TABLE public.comments;
       public         heap    postgres    false         �            1259    129116    comments_comments_id_seq    SEQUENCE     �   ALTER TABLE public.comments ALTER COLUMN comments_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comments_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212         �            1259    128994    news    TABLE     9  CREATE TABLE public.news (
    news_id integer NOT NULL,
    news_title character varying NOT NULL,
    news_category integer NOT NULL,
    news_createdby integer NOT NULL,
    news_createdat date NOT NULL,
    news_status integer NOT NULL,
    news_permission integer NOT NULL,
    news_content text NOT NULL
);
    DROP TABLE public.news;
       public         heap    postgres    false         �            1259    128992    news_news_id_seq    SEQUENCE     �   ALTER TABLE public.news ALTER COLUMN news_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.news_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211         �            1259    128955    roles    TABLE     �   CREATE TABLE public.roles (
    roles_id integer NOT NULL,
    roles_name character varying NOT NULL,
    roles_permissions integer NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false         �            1259    128970    roles_role_id_seq    SEQUENCE     �   ALTER TABLE public.roles ALTER COLUMN roles_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203         �            1259    128984    status    TABLE     l   CREATE TABLE public.status (
    status_id integer NOT NULL,
    status_label character varying NOT NULL
);
    DROP TABLE public.status;
       public         heap    postgres    false         �            1259    128982    status_status_id_seq    SEQUENCE     �   ALTER TABLE public.status ALTER COLUMN status_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.status_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209         �            1259    128947    users    TABLE     �   CREATE TABLE public.users (
    users_id integer NOT NULL,
    users_name character varying NOT NULL,
    users_role integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    128968    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN users_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202         ?          0    128974 
   categories 
   TABLE DATA           @   COPY public.categories (category_id, category_name) FROM stdin;
    public          postgres    false    207       2879.dat D          0    129028    comments 
   TABLE DATA           t   COPY public.comments (comments_id, comments_news_id, comments_created_at, comments_created_by, content) FROM stdin;
    public          postgres    false    212       2884.dat C          0    128994    news 
   TABLE DATA           �   COPY public.news (news_id, news_title, news_category, news_createdby, news_createdat, news_status, news_permission, news_content) FROM stdin;
    public          postgres    false    211       2883.dat ;          0    128955    roles 
   TABLE DATA           H   COPY public.roles (roles_id, roles_name, roles_permissions) FROM stdin;
    public          postgres    false    203       2875.dat A          0    128984    status 
   TABLE DATA           9   COPY public.status (status_id, status_label) FROM stdin;
    public          postgres    false    209       2881.dat :          0    128947    users 
   TABLE DATA           A   COPY public.users (users_id, users_name, users_role) FROM stdin;
    public          postgres    false    202       2874.dat L           0    0    categories_cat_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.categories_cat_id_seq', 5, true);
          public          postgres    false    206         M           0    0    comments_comments_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.comments_comments_id_seq', 3, true);
          public          postgres    false    213         N           0    0    news_news_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.news_news_id_seq', 3, true);
          public          postgres    false    210         O           0    0    roles_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.roles_role_id_seq', 3, true);
          public          postgres    false    205         P           0    0    status_status_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.status_status_id_seq', 2, true);
          public          postgres    false    208         Q           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    204         �
           2606    128981    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    207         �
           2606    129032    comments comments_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comments_id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    212         �
           2606    129023    status label 
   CONSTRAINT     O   ALTER TABLE ONLY public.status
    ADD CONSTRAINT label UNIQUE (status_label);
 6   ALTER TABLE ONLY public.status DROP CONSTRAINT label;
       public            postgres    false    209         �
           2606    129025    categories name 
   CONSTRAINT     S   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT name UNIQUE (category_name);
 9   ALTER TABLE ONLY public.categories DROP CONSTRAINT name;
       public            postgres    false    207         �
           2606    129001    news news_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (news_id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    211         �
           2606    129027    roles roles_name 
   CONSTRAINT     Q   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name UNIQUE (roles_name);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_name;
       public            postgres    false    203         �
           2606    128962    roles roles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roles_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    203         �
           2606    128991    status status_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (status_id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    209         �
           2606    128954    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (users_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    202         �
           2606    129038    comments createdby    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT createdby FOREIGN KEY (comments_created_by) REFERENCES public.users(users_id) ON UPDATE CASCADE ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.comments DROP CONSTRAINT createdby;
       public          postgres    false    2724    212    202         �
           2606    129033    comments news_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT news_id FOREIGN KEY (comments_id) REFERENCES public.news(news_id) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.comments DROP CONSTRAINT news_id;
       public          postgres    false    212    2738    211         �
           2606    129108    users proles    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT proles FOREIGN KEY (users_role) REFERENCES public.roles(roles_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 6   ALTER TABLE ONLY public.users DROP CONSTRAINT proles;
       public          postgres    false    2728    202    203         �
           2606    129088    news qcategory    FK CONSTRAINT     �   ALTER TABLE ONLY public.news
    ADD CONSTRAINT qcategory FOREIGN KEY (news_category) REFERENCES public.categories(category_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT qcategory;
       public          postgres    false    2730    207    211         �
           2606    129093    news qcreated_by    FK CONSTRAINT     �   ALTER TABLE ONLY public.news
    ADD CONSTRAINT qcreated_by FOREIGN KEY (news_createdby) REFERENCES public.users(users_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 :   ALTER TABLE ONLY public.news DROP CONSTRAINT qcreated_by;
       public          postgres    false    2724    211    202         �
           2606    129103    news qpermission    FK CONSTRAINT     �   ALTER TABLE ONLY public.news
    ADD CONSTRAINT qpermission FOREIGN KEY (news_permission) REFERENCES public.roles(roles_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 :   ALTER TABLE ONLY public.news DROP CONSTRAINT qpermission;
       public          postgres    false    211    2728    203         �
           2606    129098    news qstatus    FK CONSTRAINT     �   ALTER TABLE ONLY public.news
    ADD CONSTRAINT qstatus FOREIGN KEY (news_status) REFERENCES public.status(status_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 6   ALTER TABLE ONLY public.news DROP CONSTRAINT qstatus;
       public          postgres    false    211    209    2736                                                                                                                                                                                                                                                                                                                                                                          2879.dat                                                                                            0000600 0004000 0002000 00000000017 13767433602 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	hell wo
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 2884.dat                                                                                            0000600 0004000 0002000 00000000051 13767433602 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	3	2020-12-19	2	conneennenenenenne
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       2883.dat                                                                                            0000600 0004000 0002000 00000000132 13767433602 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	hue hue	3	2	2020-12-19	2	3	fake news
3	some contet	3	2	2020-12-19	2	3	fakssssssews
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                      2875.dat                                                                                            0000600 0004000 0002000 00000000044 13767433602 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	simp sanya	1
1	simp sanya2	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            2881.dat                                                                                            0000600 0004000 0002000 00000000024 13767433602 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	hello status
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            2874.dat                                                                                            0000600 0004000 0002000 00000000020 13767433602 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Arthur	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                restore.sql                                                                                         0000600 0004000 0002000 00000025030 13767433602 0015377 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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

DROP DATABASE oihd3;
--
-- Name: oihd3; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE oihd3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE oihd3 OWNER TO postgres;

\connect oihd3

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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_cat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_cat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    comments_id integer NOT NULL,
    comments_news_id integer NOT NULL,
    comments_created_at date NOT NULL,
    comments_created_by integer NOT NULL,
    content text
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.comments ALTER COLUMN comments_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comments_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    news_id integer NOT NULL,
    news_title character varying NOT NULL,
    news_category integer NOT NULL,
    news_createdby integer NOT NULL,
    news_createdat date NOT NULL,
    news_status integer NOT NULL,
    news_permission integer NOT NULL,
    news_content text NOT NULL
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.news ALTER COLUMN news_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.news_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    roles_id integer NOT NULL,
    roles_name character varying NOT NULL,
    roles_permissions integer NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN roles_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    status_id integer NOT NULL,
    status_label character varying NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.status ALTER COLUMN status_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.status_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    users_id integer NOT NULL,
    users_name character varying NOT NULL,
    users_role integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN users_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
\.
COPY public.categories (category_id, category_name) FROM '$$PATH$$/2879.dat';

--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (comments_id, comments_news_id, comments_created_at, comments_created_by, content) FROM stdin;
\.
COPY public.comments (comments_id, comments_news_id, comments_created_at, comments_created_by, content) FROM '$$PATH$$/2884.dat';

--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (news_id, news_title, news_category, news_createdby, news_createdat, news_status, news_permission, news_content) FROM stdin;
\.
COPY public.news (news_id, news_title, news_category, news_createdby, news_createdat, news_status, news_permission, news_content) FROM '$$PATH$$/2883.dat';

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (roles_id, roles_name, roles_permissions) FROM stdin;
\.
COPY public.roles (roles_id, roles_name, roles_permissions) FROM '$$PATH$$/2875.dat';

--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (status_id, status_label) FROM stdin;
\.
COPY public.status (status_id, status_label) FROM '$$PATH$$/2881.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (users_id, users_name, users_role) FROM stdin;
\.
COPY public.users (users_id, users_name, users_role) FROM '$$PATH$$/2874.dat';

--
-- Name: categories_cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_cat_id_seq', 5, true);


--
-- Name: comments_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_comments_id_seq', 3, true);


--
-- Name: news_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_news_id_seq', 3, true);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 3, true);


--
-- Name: status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_status_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comments_id);


--
-- Name: status label; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT label UNIQUE (status_label);


--
-- Name: categories name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT name UNIQUE (category_name);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (news_id);


--
-- Name: roles roles_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name UNIQUE (roles_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roles_id);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (status_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (users_id);


--
-- Name: comments createdby; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT createdby FOREIGN KEY (comments_created_by) REFERENCES public.users(users_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments news_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT news_id FOREIGN KEY (comments_id) REFERENCES public.news(news_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users proles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT proles FOREIGN KEY (users_role) REFERENCES public.roles(roles_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: news qcategory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT qcategory FOREIGN KEY (news_category) REFERENCES public.categories(category_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: news qcreated_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT qcreated_by FOREIGN KEY (news_createdby) REFERENCES public.users(users_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: news qpermission; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT qpermission FOREIGN KEY (news_permission) REFERENCES public.roles(roles_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: news qstatus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT qstatus FOREIGN KEY (news_status) REFERENCES public.status(status_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        