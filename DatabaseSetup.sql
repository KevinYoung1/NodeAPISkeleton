-- Role: todoListOwner

-- DROP ROLE "todoListOwner";

CREATE ROLE "todoListOwner" LOGIN
  SUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION;

-- Database: todo

-- DROP DATABASE todo;

CREATE DATABASE todo
-- Add a postgres owner to database
  WITH OWNER = "todoListOwner"
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       CONNECTION LIMIT = -1;


-- Table: public.items

-- DROP TABLE public.items;

CREATE TABLE public.items
(
  id integer NOT NULL DEFAULT nextval('items_id_seq'::regclass),
  text character varying(40) NOT NULL,
  complete boolean,
  CONSTRAINT items_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.items
-- Add your owner to the items table
  OWNER TO "todoListOwner";