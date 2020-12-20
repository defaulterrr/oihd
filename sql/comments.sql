-- Table: public.comments

-- DROP TABLE public.comments;

CREATE TABLE public.comments
(
    comments_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    comments_news_id integer NOT NULL,
    comments_created_at date NOT NULL,
    comments_created_by integer NOT NULL,
    content text COLLATE pg_catalog."default",
    CONSTRAINT comments_pkey PRIMARY KEY (comments_id),
    CONSTRAINT createdby FOREIGN KEY (comments_created_by)
        REFERENCES public.users (users_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT news_id FOREIGN KEY (comments_id)
        REFERENCES public.news (news_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public.comments
    OWNER to postgres;


    