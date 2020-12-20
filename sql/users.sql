-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    users_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    users_name character varying COLLATE pg_catalog."default" NOT NULL,
    users_role integer NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (users_id),
    CONSTRAINT proles FOREIGN KEY (users_role)
        REFERENCES public.roles (roles_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to postgres;

    