-- Table: public.categories

-- DROP TABLE public.categories;

CREATE TABLE public.categories
(
    category_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    category_name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT categories_pkey PRIMARY KEY (category_id),
    CONSTRAINT name UNIQUE (category_name)
)

TABLESPACE pg_default;

ALTER TABLE public.categories
    OWNER to postgres;

    