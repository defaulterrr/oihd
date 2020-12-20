-- Table: public.status

-- DROP TABLE public.status;

CREATE TABLE public.status
(
    status_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    status_label character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT status_pkey PRIMARY KEY (status_id),
    CONSTRAINT label UNIQUE (status_label)
)

TABLESPACE pg_default;

ALTER TABLE public.status
    OWNER to postgres;

    