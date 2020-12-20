-- Table: public.roles

-- DROP TABLE public.roles;

CREATE TABLE public.roles
(
    roles_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    roles_name character varying COLLATE pg_catalog."default" NOT NULL,
    roles_permissions integer NOT NULL,
    CONSTRAINT roles_pkey PRIMARY KEY (roles_id),
    CONSTRAINT roles_name UNIQUE (roles_name)
)

TABLESPACE pg_default;

ALTER TABLE public.roles
    OWNER to postgres;

    