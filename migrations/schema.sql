--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: items; Type: TABLE; Schema: public; Owner: ray
--

CREATE TABLE items (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    term character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE items OWNER TO ray;

--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: ray
--

CREATE TABLE schema_migration (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migration OWNER TO ray;

--
-- Name: users; Type: TABLE; Schema: public; Owner: ray
--

CREATE TABLE users (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    bio character varying(255),
    website character varying(255),
    phone character varying(255),
    password character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO ray;

--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: ray
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ray
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: version_idx; Type: INDEX; Schema: public; Owner: ray
--

CREATE UNIQUE INDEX version_idx ON schema_migration USING btree (version);


--
-- PostgreSQL database dump complete
--

