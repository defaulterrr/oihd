-- Table: public.news

-- DROP TABLE public.news;

CREATE TABLE public.news
(
    news_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    news_title character varying COLLATE pg_catalog."default" NOT NULL,
    news_category integer NOT NULL,
    news_createdby integer NOT NULL,
    news_createdat date NOT NULL,
    news_status integer NOT NULL,
    news_permission integer NOT NULL,
    news_content text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT news_pkey PRIMARY KEY (news_id),
    CONSTRAINT qcategory FOREIGN KEY (news_category)
        REFERENCES public.categories (category_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID,
    CONSTRAINT qcreated_by FOREIGN KEY (news_createdby)
        REFERENCES public.users (users_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID,
    CONSTRAINT qpermission FOREIGN KEY (news_permission)
        REFERENCES public.roles (roles_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID,
    CONSTRAINT qstatus FOREIGN KEY (news_status)
        REFERENCES public.status (status_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.news
    OWNER to postgres;

    