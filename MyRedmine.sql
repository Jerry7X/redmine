--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.14

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.attachments (
    id integer NOT NULL,
    container_id integer,
    container_type character varying(30),
    filename character varying DEFAULT ''::character varying NOT NULL,
    disk_filename character varying DEFAULT ''::character varying NOT NULL,
    filesize bigint DEFAULT 0 NOT NULL,
    content_type character varying DEFAULT ''::character varying,
    digest character varying(64) DEFAULT ''::character varying NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    description character varying,
    disk_directory character varying
);


ALTER TABLE public.attachments OWNER TO redmine;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO redmine;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.auth_sources (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    host character varying(60),
    port integer,
    account character varying,
    account_password character varying DEFAULT ''::character varying,
    base_dn character varying(255),
    attr_login character varying(30),
    attr_firstname character varying(30),
    attr_lastname character varying(30),
    attr_mail character varying(30),
    onthefly_register boolean DEFAULT false NOT NULL,
    tls boolean DEFAULT false NOT NULL,
    filter text,
    timeout integer
);


ALTER TABLE public.auth_sources OWNER TO redmine;

--
-- Name: auth_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.auth_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_sources_id_seq OWNER TO redmine;

--
-- Name: auth_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.auth_sources_id_seq OWNED BY public.auth_sources.id;


--
-- Name: boards; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.boards (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying,
    "position" integer,
    topics_count integer DEFAULT 0 NOT NULL,
    messages_count integer DEFAULT 0 NOT NULL,
    last_message_id integer,
    parent_id integer
);


ALTER TABLE public.boards OWNER TO redmine;

--
-- Name: boards_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_id_seq OWNER TO redmine;

--
-- Name: boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.boards_id_seq OWNED BY public.boards.id;


--
-- Name: changes; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.changes (
    id integer NOT NULL,
    changeset_id integer NOT NULL,
    action character varying(1) DEFAULT ''::character varying NOT NULL,
    path text NOT NULL,
    from_path text,
    from_revision character varying,
    revision character varying,
    branch character varying
);


ALTER TABLE public.changes OWNER TO redmine;

--
-- Name: changes_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changes_id_seq OWNER TO redmine;

--
-- Name: changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.changes_id_seq OWNED BY public.changes.id;


--
-- Name: changeset_parents; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.changeset_parents (
    changeset_id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE public.changeset_parents OWNER TO redmine;

--
-- Name: changesets; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.changesets (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    revision character varying NOT NULL,
    committer character varying,
    committed_on timestamp without time zone NOT NULL,
    comments text,
    commit_date date,
    scmid character varying,
    user_id integer
);


ALTER TABLE public.changesets OWNER TO redmine;

--
-- Name: changesets_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.changesets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changesets_id_seq OWNER TO redmine;

--
-- Name: changesets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.changesets_id_seq OWNED BY public.changesets.id;


--
-- Name: changesets_issues; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.changesets_issues (
    changeset_id integer NOT NULL,
    issue_id integer NOT NULL
);


ALTER TABLE public.changesets_issues OWNER TO redmine;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    commented_type character varying(30) DEFAULT ''::character varying NOT NULL,
    commented_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    comments text,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO redmine;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO redmine;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: custom_field_enumerations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_field_enumerations (
    id integer NOT NULL,
    custom_field_id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "position" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.custom_field_enumerations OWNER TO redmine;

--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.custom_field_enumerations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_field_enumerations_id_seq OWNER TO redmine;

--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.custom_field_enumerations_id_seq OWNED BY public.custom_field_enumerations.id;


--
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_fields (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    field_format character varying(30) DEFAULT ''::character varying NOT NULL,
    possible_values text,
    regexp character varying DEFAULT ''::character varying,
    min_length integer,
    max_length integer,
    is_required boolean DEFAULT false NOT NULL,
    is_for_all boolean DEFAULT false NOT NULL,
    is_filter boolean DEFAULT false NOT NULL,
    "position" integer,
    searchable boolean DEFAULT false,
    default_value text,
    editable boolean DEFAULT true,
    visible boolean DEFAULT true NOT NULL,
    multiple boolean DEFAULT false,
    format_store text,
    description text
);


ALTER TABLE public.custom_fields OWNER TO redmine;

--
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_fields_id_seq OWNER TO redmine;

--
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.custom_fields_id_seq OWNED BY public.custom_fields.id;


--
-- Name: custom_fields_projects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_fields_projects (
    custom_field_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_projects OWNER TO redmine;

--
-- Name: custom_fields_roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_fields_roles (
    custom_field_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.custom_fields_roles OWNER TO redmine;

--
-- Name: custom_fields_trackers; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_fields_trackers (
    custom_field_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_trackers OWNER TO redmine;

--
-- Name: custom_values; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_values (
    id integer NOT NULL,
    customized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    customized_id integer DEFAULT 0 NOT NULL,
    custom_field_id integer DEFAULT 0 NOT NULL,
    value text
);


ALTER TABLE public.custom_values OWNER TO redmine;

--
-- Name: custom_values_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.custom_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_values_id_seq OWNER TO redmine;

--
-- Name: custom_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.custom_values_id_seq OWNED BY public.custom_values.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    description text,
    created_on timestamp without time zone
);


ALTER TABLE public.documents OWNER TO redmine;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO redmine;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: email_addresses; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.email_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address character varying NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    notify boolean DEFAULT true NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.email_addresses OWNER TO redmine;

--
-- Name: email_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.email_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_addresses_id_seq OWNER TO redmine;

--
-- Name: email_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.email_addresses_id_seq OWNED BY public.email_addresses.id;


--
-- Name: enabled_modules; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.enabled_modules (
    id integer NOT NULL,
    project_id integer,
    name character varying NOT NULL
);


ALTER TABLE public.enabled_modules OWNER TO redmine;

--
-- Name: enabled_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.enabled_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enabled_modules_id_seq OWNER TO redmine;

--
-- Name: enabled_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.enabled_modules_id_seq OWNED BY public.enabled_modules.id;


--
-- Name: enumerations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.enumerations (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    is_default boolean DEFAULT false NOT NULL,
    type character varying,
    active boolean DEFAULT true NOT NULL,
    project_id integer,
    parent_id integer,
    position_name character varying(30)
);


ALTER TABLE public.enumerations OWNER TO redmine;

--
-- Name: enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.enumerations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enumerations_id_seq OWNER TO redmine;

--
-- Name: enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.enumerations_id_seq OWNED BY public.enumerations.id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.groups_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.groups_users OWNER TO redmine;

--
-- Name: import_items; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.import_items (
    id integer NOT NULL,
    import_id integer NOT NULL,
    "position" integer NOT NULL,
    obj_id integer,
    message text
);


ALTER TABLE public.import_items OWNER TO redmine;

--
-- Name: import_items_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.import_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_items_id_seq OWNER TO redmine;

--
-- Name: import_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.import_items_id_seq OWNED BY public.import_items.id;


--
-- Name: imports; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.imports (
    id integer NOT NULL,
    type character varying,
    user_id integer NOT NULL,
    filename character varying,
    settings text,
    total_items integer,
    finished boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.imports OWNER TO redmine;

--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imports_id_seq OWNER TO redmine;

--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- Name: issue_categories; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.issue_categories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    assigned_to_id integer
);


ALTER TABLE public.issue_categories OWNER TO redmine;

--
-- Name: issue_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.issue_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_categories_id_seq OWNER TO redmine;

--
-- Name: issue_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.issue_categories_id_seq OWNED BY public.issue_categories.id;


--
-- Name: issue_relations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.issue_relations (
    id integer NOT NULL,
    issue_from_id integer NOT NULL,
    issue_to_id integer NOT NULL,
    relation_type character varying DEFAULT ''::character varying NOT NULL,
    delay integer
);


ALTER TABLE public.issue_relations OWNER TO redmine;

--
-- Name: issue_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.issue_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_relations_id_seq OWNER TO redmine;

--
-- Name: issue_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.issue_relations_id_seq OWNED BY public.issue_relations.id;


--
-- Name: issue_statuses; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.issue_statuses (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    "position" integer,
    default_done_ratio integer
);


ALTER TABLE public.issue_statuses OWNER TO redmine;

--
-- Name: issue_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.issue_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_statuses_id_seq OWNER TO redmine;

--
-- Name: issue_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.issue_statuses_id_seq OWNED BY public.issue_statuses.id;


--
-- Name: issues; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.issues (
    id integer NOT NULL,
    tracker_id integer NOT NULL,
    project_id integer NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    description text,
    due_date date,
    category_id integer,
    status_id integer NOT NULL,
    assigned_to_id integer,
    priority_id integer NOT NULL,
    fixed_version_id integer,
    author_id integer NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    start_date date,
    done_ratio integer DEFAULT 0 NOT NULL,
    estimated_hours double precision,
    parent_id integer,
    root_id integer,
    lft integer,
    rgt integer,
    is_private boolean DEFAULT false NOT NULL,
    closed_on timestamp without time zone
);


ALTER TABLE public.issues OWNER TO redmine;

--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issues_id_seq OWNER TO redmine;

--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.issues_id_seq OWNED BY public.issues.id;


--
-- Name: journal_details; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.journal_details (
    id integer NOT NULL,
    journal_id integer DEFAULT 0 NOT NULL,
    property character varying(30) DEFAULT ''::character varying NOT NULL,
    prop_key character varying(30) DEFAULT ''::character varying NOT NULL,
    old_value text,
    value text
);


ALTER TABLE public.journal_details OWNER TO redmine;

--
-- Name: journal_details_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.journal_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_details_id_seq OWNER TO redmine;

--
-- Name: journal_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.journal_details_id_seq OWNED BY public.journal_details.id;


--
-- Name: journals; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.journals (
    id integer NOT NULL,
    journalized_id integer DEFAULT 0 NOT NULL,
    journalized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notes text,
    created_on timestamp without time zone NOT NULL,
    private_notes boolean DEFAULT false NOT NULL
);


ALTER TABLE public.journals OWNER TO redmine;

--
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.journals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journals_id_seq OWNER TO redmine;

--
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.journals_id_seq OWNED BY public.journals.id;


--
-- Name: member_roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.member_roles (
    id integer NOT NULL,
    member_id integer NOT NULL,
    role_id integer NOT NULL,
    inherited_from integer
);


ALTER TABLE public.member_roles OWNER TO redmine;

--
-- Name: member_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.member_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_roles_id_seq OWNER TO redmine;

--
-- Name: member_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.member_roles_id_seq OWNED BY public.member_roles.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.members (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    mail_notification boolean DEFAULT false NOT NULL
);


ALTER TABLE public.members OWNER TO redmine;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO redmine;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    board_id integer NOT NULL,
    parent_id integer,
    subject character varying DEFAULT ''::character varying NOT NULL,
    content text,
    author_id integer,
    replies_count integer DEFAULT 0 NOT NULL,
    last_reply_id integer,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    locked boolean DEFAULT false,
    sticky integer DEFAULT 0
);


ALTER TABLE public.messages OWNER TO redmine;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO redmine;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.news (
    id integer NOT NULL,
    project_id integer,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    summary character varying(255) DEFAULT ''::character varying,
    description text,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    comments_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.news OWNER TO redmine;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO redmine;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: open_id_authentication_associations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.open_id_authentication_associations (
    id integer NOT NULL,
    issued integer,
    lifetime integer,
    handle character varying,
    assoc_type character varying,
    server_url bytea,
    secret bytea
);


ALTER TABLE public.open_id_authentication_associations OWNER TO redmine;

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.open_id_authentication_associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_associations_id_seq OWNER TO redmine;

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.open_id_authentication_associations_id_seq OWNED BY public.open_id_authentication_associations.id;


--
-- Name: open_id_authentication_nonces; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.open_id_authentication_nonces (
    id integer NOT NULL,
    "timestamp" integer NOT NULL,
    server_url character varying,
    salt character varying NOT NULL
);


ALTER TABLE public.open_id_authentication_nonces OWNER TO redmine;

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.open_id_authentication_nonces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_nonces_id_seq OWNER TO redmine;

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.open_id_authentication_nonces_id_seq OWNED BY public.open_id_authentication_nonces.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    homepage character varying DEFAULT ''::character varying,
    is_public boolean DEFAULT true NOT NULL,
    parent_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    identifier character varying,
    status integer DEFAULT 1 NOT NULL,
    lft integer,
    rgt integer,
    inherit_members boolean DEFAULT false NOT NULL,
    default_version_id integer,
    default_assigned_to_id integer
);


ALTER TABLE public.projects OWNER TO redmine;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO redmine;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_trackers; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.projects_trackers (
    project_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.projects_trackers OWNER TO redmine;

--
-- Name: queries; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.queries (
    id integer NOT NULL,
    project_id integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    filters text,
    user_id integer DEFAULT 0 NOT NULL,
    column_names text,
    sort_criteria text,
    group_by character varying,
    type character varying,
    visibility integer DEFAULT 0,
    options text
);


ALTER TABLE public.queries OWNER TO redmine;

--
-- Name: queries_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.queries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queries_id_seq OWNER TO redmine;

--
-- Name: queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.queries_id_seq OWNED BY public.queries.id;


--
-- Name: queries_roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.queries_roles (
    query_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.queries_roles OWNER TO redmine;

--
-- Name: repositories; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.repositories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    url character varying DEFAULT ''::character varying NOT NULL,
    login character varying(60) DEFAULT ''::character varying,
    password character varying DEFAULT ''::character varying,
    root_url character varying(255) DEFAULT ''::character varying,
    type character varying,
    path_encoding character varying(64),
    log_encoding character varying(64),
    extra_info text,
    identifier character varying,
    is_default boolean DEFAULT false,
    created_on timestamp without time zone
);


ALTER TABLE public.repositories OWNER TO redmine;

--
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.repositories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repositories_id_seq OWNER TO redmine;

--
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.repositories_id_seq OWNED BY public.repositories.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    assignable boolean DEFAULT true,
    builtin integer DEFAULT 0 NOT NULL,
    permissions text,
    issues_visibility character varying(30) DEFAULT 'default'::character varying NOT NULL,
    users_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    time_entries_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    all_roles_managed boolean DEFAULT true NOT NULL,
    settings text
);


ALTER TABLE public.roles OWNER TO redmine;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO redmine;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_managed_roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.roles_managed_roles (
    role_id integer NOT NULL,
    managed_role_id integer NOT NULL
);


ALTER TABLE public.roles_managed_roles OWNER TO redmine;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO redmine;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value text,
    updated_on timestamp without time zone
);


ALTER TABLE public.settings OWNER TO redmine;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO redmine;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: time_entries; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.time_entries (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    issue_id integer,
    hours double precision NOT NULL,
    comments character varying(1024),
    activity_id integer NOT NULL,
    spent_on date NOT NULL,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.time_entries OWNER TO redmine;

--
-- Name: time_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.time_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_entries_id_seq OWNER TO redmine;

--
-- Name: time_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.time_entries_id_seq OWNED BY public.time_entries.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    action character varying(30) DEFAULT ''::character varying NOT NULL,
    value character varying(40) DEFAULT ''::character varying NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone
);


ALTER TABLE public.tokens OWNER TO redmine;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO redmine;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: trackers; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.trackers (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_in_chlog boolean DEFAULT false NOT NULL,
    "position" integer,
    is_in_roadmap boolean DEFAULT true NOT NULL,
    fields_bits integer DEFAULT 0,
    default_status_id integer
);


ALTER TABLE public.trackers OWNER TO redmine;

--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trackers_id_seq OWNER TO redmine;

--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.trackers_id_seq OWNED BY public.trackers.id;


--
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.user_preferences (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    others text,
    hide_mail boolean DEFAULT true,
    time_zone character varying
);


ALTER TABLE public.user_preferences OWNER TO redmine;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_preferences_id_seq OWNER TO redmine;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.user_preferences_id_seq OWNED BY public.user_preferences.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying DEFAULT ''::character varying NOT NULL,
    hashed_password character varying(40) DEFAULT ''::character varying NOT NULL,
    firstname character varying(30) DEFAULT ''::character varying NOT NULL,
    lastname character varying(255) DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    last_login_on timestamp without time zone,
    language character varying(5) DEFAULT ''::character varying,
    auth_source_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    type character varying,
    identity_url character varying,
    mail_notification character varying DEFAULT ''::character varying NOT NULL,
    salt character varying(64),
    must_change_passwd boolean DEFAULT false NOT NULL,
    passwd_changed_on timestamp without time zone
);


ALTER TABLE public.users OWNER TO redmine;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO redmine;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.versions (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying,
    effective_date date,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    wiki_page_title character varying,
    status character varying DEFAULT 'open'::character varying,
    sharing character varying DEFAULT 'none'::character varying NOT NULL
);


ALTER TABLE public.versions OWNER TO redmine;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO redmine;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: watchers; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.watchers (
    id integer NOT NULL,
    watchable_type character varying DEFAULT ''::character varying NOT NULL,
    watchable_id integer DEFAULT 0 NOT NULL,
    user_id integer
);


ALTER TABLE public.watchers OWNER TO redmine;

--
-- Name: watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.watchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watchers_id_seq OWNER TO redmine;

--
-- Name: watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.watchers_id_seq OWNED BY public.watchers.id;


--
-- Name: wiki_content_versions; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.wiki_content_versions (
    id integer NOT NULL,
    wiki_content_id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    data bytea,
    compression character varying(6) DEFAULT ''::character varying,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_content_versions OWNER TO redmine;

--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.wiki_content_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_content_versions_id_seq OWNER TO redmine;

--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.wiki_content_versions_id_seq OWNED BY public.wiki_content_versions.id;


--
-- Name: wiki_contents; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.wiki_contents (
    id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    text text,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_contents OWNER TO redmine;

--
-- Name: wiki_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.wiki_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_contents_id_seq OWNER TO redmine;

--
-- Name: wiki_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.wiki_contents_id_seq OWNED BY public.wiki_contents.id;


--
-- Name: wiki_pages; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.wiki_pages (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    parent_id integer
);


ALTER TABLE public.wiki_pages OWNER TO redmine;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.wiki_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_pages_id_seq OWNER TO redmine;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.wiki_pages_id_seq OWNED BY public.wiki_pages.id;


--
-- Name: wiki_redirects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.wiki_redirects (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying,
    redirects_to character varying,
    created_on timestamp without time zone NOT NULL,
    redirects_to_wiki_id integer NOT NULL
);


ALTER TABLE public.wiki_redirects OWNER TO redmine;

--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.wiki_redirects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_redirects_id_seq OWNER TO redmine;

--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.wiki_redirects_id_seq OWNED BY public.wiki_redirects.id;


--
-- Name: wikis; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.wikis (
    id integer NOT NULL,
    project_id integer NOT NULL,
    start_page character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.wikis OWNER TO redmine;

--
-- Name: wikis_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.wikis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wikis_id_seq OWNER TO redmine;

--
-- Name: wikis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.wikis_id_seq OWNED BY public.wikis.id;


--
-- Name: workflows; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.workflows (
    id integer NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL,
    old_status_id integer DEFAULT 0 NOT NULL,
    new_status_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    assignee boolean DEFAULT false NOT NULL,
    author boolean DEFAULT false NOT NULL,
    type character varying(30),
    field_name character varying(30),
    rule character varying(30)
);


ALTER TABLE public.workflows OWNER TO redmine;

--
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.workflows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflows_id_seq OWNER TO redmine;

--
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.workflows_id_seq OWNED BY public.workflows.id;


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: auth_sources id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN id SET DEFAULT nextval('public.auth_sources_id_seq'::regclass);


--
-- Name: boards id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.boards ALTER COLUMN id SET DEFAULT nextval('public.boards_id_seq'::regclass);


--
-- Name: changes id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.changes ALTER COLUMN id SET DEFAULT nextval('public.changes_id_seq'::regclass);


--
-- Name: changesets id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.changesets ALTER COLUMN id SET DEFAULT nextval('public.changesets_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: custom_field_enumerations id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_field_enumerations ALTER COLUMN id SET DEFAULT nextval('public.custom_field_enumerations_id_seq'::regclass);


--
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_id_seq'::regclass);


--
-- Name: custom_values id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_values ALTER COLUMN id SET DEFAULT nextval('public.custom_values_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: email_addresses id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.email_addresses ALTER COLUMN id SET DEFAULT nextval('public.email_addresses_id_seq'::regclass);


--
-- Name: enabled_modules id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.enabled_modules ALTER COLUMN id SET DEFAULT nextval('public.enabled_modules_id_seq'::regclass);


--
-- Name: enumerations id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.enumerations ALTER COLUMN id SET DEFAULT nextval('public.enumerations_id_seq'::regclass);


--
-- Name: import_items id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.import_items ALTER COLUMN id SET DEFAULT nextval('public.import_items_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- Name: issue_categories id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_categories ALTER COLUMN id SET DEFAULT nextval('public.issue_categories_id_seq'::regclass);


--
-- Name: issue_relations id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_relations ALTER COLUMN id SET DEFAULT nextval('public.issue_relations_id_seq'::regclass);


--
-- Name: issue_statuses id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_statuses ALTER COLUMN id SET DEFAULT nextval('public.issue_statuses_id_seq'::regclass);


--
-- Name: issues id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issues ALTER COLUMN id SET DEFAULT nextval('public.issues_id_seq'::regclass);


--
-- Name: journal_details id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.journal_details ALTER COLUMN id SET DEFAULT nextval('public.journal_details_id_seq'::regclass);


--
-- Name: journals id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.journals ALTER COLUMN id SET DEFAULT nextval('public.journals_id_seq'::regclass);


--
-- Name: member_roles id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.member_roles ALTER COLUMN id SET DEFAULT nextval('public.member_roles_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: open_id_authentication_associations id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.open_id_authentication_associations ALTER COLUMN id SET DEFAULT nextval('public.open_id_authentication_associations_id_seq'::regclass);


--
-- Name: open_id_authentication_nonces id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.open_id_authentication_nonces ALTER COLUMN id SET DEFAULT nextval('public.open_id_authentication_nonces_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: queries id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.queries ALTER COLUMN id SET DEFAULT nextval('public.queries_id_seq'::regclass);


--
-- Name: repositories id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.repositories ALTER COLUMN id SET DEFAULT nextval('public.repositories_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: time_entries id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.time_entries ALTER COLUMN id SET DEFAULT nextval('public.time_entries_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: trackers id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.trackers ALTER COLUMN id SET DEFAULT nextval('public.trackers_id_seq'::regclass);


--
-- Name: user_preferences id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.user_preferences ALTER COLUMN id SET DEFAULT nextval('public.user_preferences_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: watchers id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.watchers ALTER COLUMN id SET DEFAULT nextval('public.watchers_id_seq'::regclass);


--
-- Name: wiki_content_versions id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_content_versions ALTER COLUMN id SET DEFAULT nextval('public.wiki_content_versions_id_seq'::regclass);


--
-- Name: wiki_contents id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_contents ALTER COLUMN id SET DEFAULT nextval('public.wiki_contents_id_seq'::regclass);


--
-- Name: wiki_pages id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_pages ALTER COLUMN id SET DEFAULT nextval('public.wiki_pages_id_seq'::regclass);


--
-- Name: wiki_redirects id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_redirects ALTER COLUMN id SET DEFAULT nextval('public.wiki_redirects_id_seq'::regclass);


--
-- Name: wikis id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wikis ALTER COLUMN id SET DEFAULT nextval('public.wikis_id_seq'::regclass);


--
-- Name: workflows id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.workflows ALTER COLUMN id SET DEFAULT nextval('public.workflows_id_seq'::regclass);


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) FROM stdin;
1	11	Issue	osd.47.pstack	170929121946_osd.47.pstack	148407	\N	5a9f3e046f998042ae31c5f312eea0501f97856c38ca3667f50186ae4c99190c	0	5	2017-09-29 12:19:46.336604	堆栈	2017/09
2	33	Issue	rgw.stack	171102091119_rgw.stack	2807701	\N	520f317042d1d6fd11977fa4adf9fa519618a1f702c143ea176cfb858e6995dc	0	5	2017-11-02 09:11:19.934841		2017/11
3	37	Issue	QQ图片20171114175259.png	171114152330_1f315197c9d4465c5b958cb0462d1a0c.png	23008	image/png	d038aaeebac45b00459581940c1321a7ff1ef6a65b25da5ad7e869cbd0c80eab	0	5	2017-11-14 15:23:30.366547	tag搜索结果	2017/11
4	88	Issue	pg分裂问题的严重性.png	180808064415_073c5bf409d0fcf3b676412361799c32.png	22141	image/png	79dc35c6c2fc8c6bf756aff05b4c5ca6df1bf8c1a7872e3b3bfa8e9d2bcc1eb3	0	5	2018-08-08 06:44:15.04468	性能长期无法恢复	2018/08
5	\N	\N	ss_lt.png	180827153251_ss_lt.png	220987	image/png	e0ae87196e55dcd0193ab75ddc84ce296b5779c0ef81fe0f1cfaa74ca37b9f7b	0	5	2018-08-27 15:32:51.693116	\N	2018/08
6	\N	\N	ss_lt.png	180827153251_ss_lt.png	220987	image/png	e0ae87196e55dcd0193ab75ddc84ce296b5779c0ef81fe0f1cfaa74ca37b9f7b	0	5	2018-08-27 15:32:51.762851	\N	2018/08
7	\N	\N	ss_lt.png	180827153251_ss_lt.png	220987	image/png	e0ae87196e55dcd0193ab75ddc84ce296b5779c0ef81fe0f1cfaa74ca37b9f7b	0	5	2018-08-27 15:33:50.443529	\N	2018/08
8	\N	\N	ss_lt.png	180827153251_ss_lt.png	220987	image/png	e0ae87196e55dcd0193ab75ddc84ce296b5779c0ef81fe0f1cfaa74ca37b9f7b	0	5	2018-08-27 15:33:50.482899	\N	2018/08
9	149	Issue	rgw架构.png	181107081000_c076975f63bdd70c0aede043fb006262.png	52652	image/png	12f27ba05035e86fd9fc11ed93d4d77a768603808f3b442c3ccd291687b0acb8	0	5	2018-11-07 08:10:00.476252		2018/11
10	170	Issue	data lake.jpg	181115181429_1140c0e36913a4f732cf6e18f2e51231.jpg	42300	image/jpeg	93ab5a83b01cadae9e3ae8c278782aabce056287f3504b4fa8be0c32ee23d782	0	5	2018-11-15 18:14:29.126916		2018/11
12	172	Issue	第四课复习卡.jpg	181128092923_347147790d1b4e0b488ac094e39fd7b1.jpg	264623	image/jpeg	4253107277504a005fbea231e419eae28c9f71c1b89a815a9f12cdcdc9edea65	0	6	2018-11-28 09:29:23.464968		2018/11
13	178	Issue	第五课复习卡.jpg	181128111532_16ef5bd9386509d2e81e3006b7c11766.jpg	203154	image/jpeg	f72374ffc033e9f475b2c667c6a8e5452839da2f0b96bccce89ed54fbe9504c6	0	6	2018-11-28 11:15:32.09912		2018/11
14	148	Issue	第一课复习卡.jpg	181128111607_10dfa814a58fd7686df2e244d6576be0.jpg	120739	image/jpeg	c0353340b832aad0fc72f5a7307a17ad357af59b8b3801a965e58af21795c6e1	0	6	2018-11-28 11:16:07.125992		2018/11
15	161	Issue	第二课复习卡.jpg	181128111644_37ffc8d44a09a68430b486913d0b3562.jpg	137260	image/jpeg	1c2662ed180f901a021e45fcf48117caec77395b126837cfb3a45eb4fabdf6a8	0	6	2018-11-28 11:16:44.734978		2018/11
16	162	Issue	第三课复习卡.jpg	181128113212_74d1b619b7764211f8c4093d39dbec7b.jpg	178739	image/jpeg	394dcbcc16caa12464764cc0ce07ce03bb3f38ca819dd48569f5a9ea42329ddc	0	6	2018-11-28 11:32:12.313156		2018/11
17	4	Issue	499_tcpdump.png	181218134712_499_tcpdump.png	84388	image/png	6da607ecbb24c6213d0d0496d310a40fa92ed35af330afa828a1aa19f17f4208	0	5	2018-12-18 13:47:12.847033		2018/12
18	4	Issue	tcpdump_not_accept.png	181218181946_tcpdump_not_accept.png	668836	image/png	4df7675d213b058324bdef4a4fd2668294570334da84536c4b4d6f916edbd27c	0	5	2018-12-18 18:19:46.551159	server不执行accept的tcpdump	2018/12
20	4	Issue	tcp_netstat_error.png	181224185604_tcp_netstat_error.png	115539	image/png	f72dd97be4348b8380e0fdef15f44d97e68250d014527e8d56593aaae502119d	0	5	2018-12-24 18:56:04.487052	netstat -st	2018/12
21	4	Issue	tcp_netstat_2.png	181224191731_tcp_netstat_2.png	114970	image/png	7758caf9ce1359bc44d7c1fe744006957ab9938e6cf6c050fe187e770235afc7	0	5	2018-12-24 19:17:31.41016		2018/12
22	4	Issue	hang_tcpdump.png	181225123807_hang_tcpdump.png	845211	image/png	40e9e95cba4625f8f3a6186350e5c093577cfc1f1d80064cb525929f03a8bead	0	5	2018-12-25 12:38:07.050542	hang住的socket交互过程	2018/12
23	4	Issue	normal_tcpdump.png	181225123837_normal_tcpdump.png	259007	image/png	a5176b7e3723cda0d29e9a738f9232b272b45f72b29dd6bac7d3917a51f05b38	0	5	2018-12-25 12:38:37.015244	正常的socket关闭	2018/12
24	\N	\N	Alphabet.png	190407202310_Alphabet.png	522525	image/png	5bc3d37271b9b5565aa4275461020e65ab18d9ff84a66cbaca047537d0452932	0	5	2019-04-07 20:23:10.381279	\N	2019/04
25	\N	\N	Alphabet.png	190407202310_Alphabet.png	522525	image/png	5bc3d37271b9b5565aa4275461020e65ab18d9ff84a66cbaca047537d0452932	0	5	2019-04-07 20:23:12.177162	\N	2019/04
26	\N	\N	Alphabet.png	190407202310_Alphabet.png	522525	image/png	5bc3d37271b9b5565aa4275461020e65ab18d9ff84a66cbaca047537d0452932	0	5	2019-04-07 20:23:34.150012	\N	2019/04
27	\N	\N	Alphabet.png	190407202310_Alphabet.png	522525	image/png	5bc3d37271b9b5565aa4275461020e65ab18d9ff84a66cbaca047537d0452932	0	5	2019-04-07 20:23:36.49403	\N	2019/04
28	\N	\N	Alphabet.png	190407202310_Alphabet.png	522525	image/png	5bc3d37271b9b5565aa4275461020e65ab18d9ff84a66cbaca047537d0452932	0	5	2019-04-07 20:24:45.131066	\N	2019/04
29	\N	\N	Alphabet.png	190407202310_Alphabet.png	522525	image/png	5bc3d37271b9b5565aa4275461020e65ab18d9ff84a66cbaca047537d0452932	0	5	2019-04-07 20:24:46.549683	\N	2019/04
30	2	Version	periodsync.png	190419131906_periodsync.png	150761	image/png	3d6203cb8e73c32ee62a1df993a9ebc71e6aa0936434af34878cc7aeabde9cef	0	5	2019-04-19 13:19:06.885295		2019/04
31	394	Issue	2019年5月12日母亲节感恩会.jpg	190514121842_bb33a2f9c21e18a84a72285485c1e2e0.jpg	76821	image/jpeg	72bd1ce7d041cf00d44e08297dd2f380d2a61db051241f14382ee7697a11fcf3	0	6	2019-05-14 12:18:42.046256		2019/05
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.attachments_id_seq', 31, true);


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.auth_sources (id, type, name, host, port, account, account_password, base_dn, attr_login, attr_firstname, attr_lastname, attr_mail, onthefly_register, tls, filter, timeout) FROM stdin;
\.


--
-- Name: auth_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.auth_sources_id_seq', 1, false);


--
-- Data for Name: boards; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.boards (id, project_id, name, description, "position", topics_count, messages_count, last_message_id, parent_id) FROM stdin;
\.


--
-- Name: boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.boards_id_seq', 1, false);


--
-- Data for Name: changes; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.changes (id, changeset_id, action, path, from_path, from_revision, revision, branch) FROM stdin;
\.


--
-- Name: changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.changes_id_seq', 1, false);


--
-- Data for Name: changeset_parents; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.changeset_parents (changeset_id, parent_id) FROM stdin;
\.


--
-- Data for Name: changesets; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.changesets (id, repository_id, revision, committer, committed_on, comments, commit_date, scmid, user_id) FROM stdin;
\.


--
-- Name: changesets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.changesets_id_seq', 1, false);


--
-- Data for Name: changesets_issues; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.changesets_issues (changeset_id, issue_id) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.comments (id, commented_type, commented_id, author_id, comments, created_on, updated_on) FROM stdin;
1	News	1	5	把头脑风暴组织化，制度化	2017-11-02 07:14:41.929281	2017-11-02 07:14:41.929281
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, true);


--
-- Data for Name: custom_field_enumerations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_field_enumerations (id, custom_field_id, name, active, "position") FROM stdin;
\.


--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.custom_field_enumerations_id_seq', 1, false);


--
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_fields (id, type, name, field_format, possible_values, regexp, min_length, max_length, is_required, is_for_all, is_filter, "position", searchable, default_value, editable, visible, multiple, format_store, description) FROM stdin;
1	IssueCustomField	发现版本	version	\N		\N	\N	f	t	t	1	f	\N	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nversion_status: []\nedit_tag_style: ''\n	xx
\.


--
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.custom_fields_id_seq', 1, true);


--
-- Data for Name: custom_fields_projects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_fields_projects (custom_field_id, project_id) FROM stdin;
\.


--
-- Data for Name: custom_fields_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_fields_roles (custom_field_id, role_id) FROM stdin;
\.


--
-- Data for Name: custom_fields_trackers; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_fields_trackers (custom_field_id, tracker_id) FROM stdin;
1	3
1	5
\.


--
-- Data for Name: custom_values; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_values (id, customized_type, customized_id, custom_field_id, value) FROM stdin;
1	Issue	67	1	
2	Issue	68	1	
3	Issue	4	1	
4	Issue	75	1	
5	Issue	76	1	
6	Issue	77	1	
7	Issue	78	1	
8	Issue	79	1	
9	Issue	80	1	
10	Issue	81	1	
11	Issue	82	1	
12	Issue	84	1	
13	Issue	85	1	
14	Issue	87	1	
15	Issue	89	1	
16	Issue	90	1	
17	Issue	91	1	
18	Issue	92	1	
19	Issue	94	1	
20	Issue	96	1	
21	Issue	97	1	
22	Issue	98	1	
23	Issue	99	1	
24	Issue	101	1	
25	Issue	111	1	
26	Issue	116	1	
27	Issue	120	1	
28	Issue	121	1	
29	Issue	123	1	
30	Issue	124	1	
31	Issue	125	1	
32	Issue	126	1	
33	Issue	127	1	
34	Issue	130	1	
35	Issue	134	1	
36	Issue	140	1	
37	Issue	150	1	
38	Issue	153	1	
39	Issue	154	1	
40	Issue	157	1	
41	Issue	171	1	
42	Issue	176	1	
43	Issue	183	1	
44	Issue	186	1	
45	Issue	206	1	
46	Issue	208	1	
47	Issue	209	1	
48	Issue	210	1	
49	Issue	211	1	
50	Issue	215	1	
51	Issue	230	1	
52	Issue	235	1	
53	Issue	248	1	
54	Issue	253	1	
55	Issue	256	1	
56	Issue	258	1	
57	Issue	260	1	
58	Issue	266	1	
59	Issue	324	1	
60	Issue	21	1	
61	Issue	477	1	
\.


--
-- Name: custom_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.custom_values_id_seq', 61, true);


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.documents (id, project_id, category_id, title, description, created_on) FROM stdin;
8	1	5	osd扩容引起的数据搬迁问题	使用多个pool是一种解决方案，据说xsky采用了这种方式。	2017-10-10 11:25:12.185413
2	1	6	ceph civetweb 工作原理分析	tcp keepalived:\r\nhttp://www.firefoxbug.com/index.php/archives/2805/\r\n\r\nSO_RCVTIMEO and SO_SNDTIMEO\r\n              Specify the receiving or sending timeouts until reporting an\r\n              error.  The argument is a struct timeval.  If an input or out‐\r\n              put function blocks for this period of time, and data has been\r\n              sent or received, the return value of that function will be\r\n              the amount of data transferred; if no data has been trans‐\r\n              ferred and the timeout has been reached, then -1 is returned\r\n              with errno set to EAGAIN or EWOULDBLOCK, or EINPROGRESS (for\r\n              connect(2)) just as if the socket was specified to be non‐\r\n              blocking.  If the timeout is set to zero (the default), then\r\n              the operation will never timeout.  Timeouts only have effect\r\n              for system calls that perform socket I/O (e.g., read(2),\r\n              recvmsg(2), send(2), sendmsg(2)); timeouts have no effect for\r\n              select(2), poll(2), epoll_wait(2), and so on.\r\n如果传输了一点数据，就返回传输长度，如果一点都没成功，并且超时了，返回超时错误。\r\n这个收发是否成功，应该是说tcp的超时，不是说应用层的超时。\r\n\r\n*阻塞模式下可以用setsockopt设置SO_RCVTIMEO（超时时间），即如果在超时时间内接收缓冲区都没有一点数据到来，那么返回-1，errno = EAGAIN | EWOULDBLOCK 错误。同理，还有SO_SNDTIMEO 选项，在超时时间内发送缓冲区都没有足够内存存放数据，也是返回-1，errno = EAGAIN | EWOULDBLOCK 错误。*\r\n\r\nThe AWS SDK for .NET allows you to configure the request timeout and socket read/write timeout values at the service client level. These values are specified in the Timeout and the ReadWriteTimeout properties of the ClientConfig class, respectively. These values are passed on as the Timeout and ReadWriteTimeout properties of the HttpWebRequest objects created by the AWS service client object. By default, the Timeout value is 100 seconds and the ReadWriteTimeout value is 300 seconds.\r\n\r\n\r\n	2017-09-26 14:34:32.444695
3	1	7	软件性能模型分析	通常软件系统中有线程池，有队列，cache，有流控，有锁。同时还有各种硬件资源。\r\n那么在这样一个系统中如何去分析性能瓶颈呢？在存在多种业务时，如何分析他们之间的互相影响？如何对不同业务做流控呢？\r\n\r\n本文意在探讨这个主题。	2017-09-27 07:54:39.494658
6	1	8	对象存储与人工智能	对象存储如何结合人工智能？\r\n\r\n为什么要走这个方向？\r\n\r\n存储是什么？\r\n历史上很多数据，每天也会有很多新数据，如何高效的记录这些数据，整理数据，高效率的存储等这些是存储关心的问题。\r\n存储是未来数据大厦的基石，是原材料。\r\n\r\n但是社会是追求附加值的，社会是创新引领的，存储的特征决定了其变革周期是相对大的。但是数据处理不是，其技术必将日新月异。\r\n\r\n我们想做的就是一个数据处理平台。人们关心的通常并非数据本身，而是数据所体现的规律，特征。\r\n我们不仅提供了存储，我们还可以给用户提供操作平台，给用户构建一种操作数据的能力，并且与时俱进。\r\n\r\n查询，统计是其中非常基本的功能，以前的数据处理很多停留在这个阶段。\r\n数据挖掘，主动帮助用户发现数据规律，辅助生产制造，生活，这是未来的基本功能。\r\n\r\nh1. 图片，视频，音频 识别与搜索\r\n\r\n一个很基本的想法是做图片识别，然后打标签。\r\n这跟人的记忆有点相似，标签即概念，图片就是背后的大脑影像。\r\n根据元素在图片中的比重，设置score。\r\n\r\n视频是图片和声音的结合。 文字即概念。\r\n\r\n这也是人智力的最初阶段，就是分辨，有点机器学习的感觉。\r\n\r\n\r\n2017-10-11：\r\n先智数据的思路是用AI改进存储软件。主要是\r\n1，磁盘寿命预测\r\n2，业务模型分析，预测。\r\n\r\n当然这2点是非常有价值的。\r\n我之前考虑的是如何辅助用户挖掘数据价值。\r\n\r\n	2017-09-30 07:31:09.560443
4	1	7	rgw性能模型	硬件：\r\nrgw使用cpu和网络，rgw目前还不支持使用ssd做cache.可能通常意义并不大.\r\n\r\n组件：\r\ncivetweb, nginx, fastcgi, rados\r\n\r\n线程：\r\nrgw_thread_pool_size\r\n\r\ncache：\r\nrgw cache: 给元数据，普通数据的属性做cache.\r\n\r\n队列：\r\n请求等待队列,由线程池负责处理\r\n\r\n流控：\r\nrgw处理流控\r\nrados client流控\r\n\r\n互斥资源：\r\nrados client？\r\nbucket index\r\ndata log\r\n\r\n	2017-09-27 12:06:04.309287
9	1	7	华为对象存储的部分使用场景	1，存储各种软件包\r\n比如support的安装包，CI的软件包\r\n\r\n2，存储镜像文件\r\n\r\nVDI和docker镜像，VDI增量备份\r\n\r\n3，扫描图片\r\n安全扫描等，这里有额外价值的地方在于图片的处理上\r\n\r\n4，个人网盘\r\n\r\n5，数据库备份\r\n\r\n6，云化应用的后端存储\r\n就是与openstack，docker对接\r\n\r\n痛点表现在：\r\n1，nas的规模问题\r\n2，数据容灾\r\n3，多版本\r\n4，WORM\r\n\r\nEC的使用还是比较广泛的。	2017-10-11 09:01:02.946874
5	1	8	Osd rebalance优化	在osd out之后会触发数据迁移，但是通常我们在osd down之后并不希望触发数据迁移。\r\n这时通常会延长osd out的时间，需要人工干预。\r\n\r\n如果只有2个副本，挂掉一个之后，osd不out，继续写可靠性会降低。\r\n\r\n\r\n\r\n\r\nidea：out的时候osd产生新副本，但是新副本只写新数据。增加一个状态 die，表示这个osd彻底不行了，这时迁移其上的全部数据。\r\ndie状态需要运维干预。\r\n\r\n这个特性对于中小规模的集群还是很有价值的。\r\n\r\n大规模集群可能直接迁移更合适。	2017-09-29 09:43:06.004812
12	1	7	从编程语言想到的	中文几乎没什么新单词出现\r\n\r\n英文一个新的事物出现时，就会利用词根生发出新的单词\r\n\r\n这跟go和c++对比起来感觉有点意思。\r\n\r\n中文没有很好的扩展机制，这种语言机制对人的思维可能是一种约束。\r\n虽说语言只是世界的一种反应，但是语言可能本身也影响着世界。\r\n\r\n我讨厌c++，为什么？\r\n复杂的语法？蹩脚的代码？ 也许是对简单的热爱\r\n\r\n一个地方使用泛型，相关的其他地方可能也得用泛型。整个代码看起来很麻烦。\r\n其他也只有那么一两个类型。\r\n\r\ngo正交设计，较少的关键字，做一件事情只需一种方法，避免重复工作浪费。\r\ngo语言 interface的方式很妙，可以很方便的对接\r\n\r\nhttps://www.zhihu.com/question/20275578\r\n封装和归一化类似军队制度建设，目标是搞出一个标准化、立体、多变、高效的指挥体系，从而获得打大战、打硬战的能力，然后再去轻松碾压问题。此所谓战略。\r\n\r\n\r\n这里面很长的一个回答很有意思，也说明了面向对象的本质：接口与归一化。\r\n其实go语言非常好的具备了这2个能力\r\n\r\n计算机语言 与 人类语言难以类比。\r\n\r\n人类的语言重点在于沟通。\r\n\r\n计算机语言的本质是命令，告诉机器做什么，怎么做。所以计算机编程就像一个工程。是达成某种结果的。\r\n\r\n计算机语言是纯逻辑性的。\r\n\r\n\r\nKISS应该是最重要的编程的艺术了吧，这也是生活的艺术，非常合适的解决一些问题。\r\n\r\n何为工程人士，我觉得工程设计最牛的地方应该在于简单，实用吧。但做到这样很难。\r\n\r\n人工智能可能颠覆软件工程吗？\r\n我觉得这是一个过程，最终结果不好说。\r\n而且这也不是一个问题，其实软件从业人员面临的是解决问题，问题会变，但是问题却从未消失过。\r\n\r\n如何聪明的解决问题，才是我们需要关心的，而我们关心什么问题，想解决什么问题，才是我们的使命，这就是世事变幻。\r\n\r\n所以正确的方式\r\n也许是找到定义使命，定义自己要解决的问题，熟悉解决问题所需要的工具，不断完善自己的方法。\r\n如果已经自己已经无法做得更好\r\n\r\n那就换另一个有趣的使命吧。\r\n\r\n以后技术的方向肯定让每个人都成为专家。\r\n而每个行业都有一些细分的公司，这些公司提供专家的能力给大众。\r\n\r\nAI辅助象棋，AI辅助羽毛球教学。让人快速具备专家能力。\r\n\r\n人改进AI，AI辅助人	2017-10-16 13:12:26.588307
15	1	5	backfill期间，pglog会overflow吗,如何处理这种情况？	你刚问的问题 在osd正常的情况下不会有问题吧 正常backfill情况下，pglog都是两边都写的。trim也是可以都trim的\r\n只有当backfill节点挂了 才会出现backfill期间 pglog相差很多的情况。\r\n\r\nbackfill期间异常的情况，首先猜想一下：\r\n1，pglog还能接上的情况，那当然可以做普通的recovery，先根据pglog恢复。\r\nbackfill是会对比版本的，因此也不存在重复恢复的问题。但是尚未backfill的对象不写数据，这样会造成额外的恢复？\r\n\r\n2，pglog绕了的情况，那也只能重新做backfill了。\r\n	2017-10-24 15:11:23.407039
11	1	5	bluestore layout	bluestore元数据，对照这篇文章看：\r\nhttp://www.cnblogs.com/lucas-sre/p/7096856.html\r\n\r\n\r\nextent：文件的逻辑片段，显然文件是可能有洞的，所以这个是有存在必要的\r\nblob：空间分配的单位，一个blob对应于一段空间，blob在csum和compress，以及clone的share都会用到\r\npextent: 实际的空间片段，分配的空间都是min_alloc_size的倍数的片段。\r\n\r\n注意blob的重用只能按照偏移顺序 为什么？\r\n这样可以保证在文件不存在空洞时最好的空间利用率，同时利于读取\r\n\r\n严格按照偏移来的，不会错乱放置，可以顺序读取\r\n\r\n显然一个pextent不可能同属于多个blob，但一个blob可能包含多个pextent。\r\n同样一个lextent不可能跨越多个blob，但是一个blob可能有多个lextent\r\n\r\n对于可能跨越blob的请求，可以拆分成多个lextent。\r\n\r\n\r\n对象存储是整体写的，非常适合COW，不必在原来的地方写。\r\n这样可以避免使用journal。\r\n\r\n对象存储可以只需一层。直接映射到pextent。没有lextent的合并，也不必搞blob那套。\r\n\r\nXBlueStore！！	2017-10-12 11:37:30.001905
14	1	8	一次应聘面试点	期望对方达到：\r\n1，对ceph的了解程度，逻辑思考能力\r\n2，对开发特性的认识\r\n3，对未来的思考，期望，待遇期望\r\n4，对事物发展的看法，对象存储的未来\r\n\r\n\r\n1，对s3接口熟悉，可以独立完成nginx或者上层的一些中间件和接口开发，对接各种数据库。\r\n2，对ceph，rgw内部实现不熟悉，了解一些基本概念，没有使用c/c++开发过项目\r\n3，经验主要在业务开发，创新想法一般\r\n4，他个人看好存储的发展，但是并未展现很多对自己未来的规划。\r\n\r\n主要经历是做软件外包，沟通还比较随和，\r\n如果预期未来有类似需求和开发任务，可考虑。\r\n	2017-10-24 12:52:15.391911
16	1	7	logstash 与 elasticsearch的安装	logstash直接下载zip包，解压就可以用了\r\n\r\n	2017-10-26 09:16:55.663167
13	1	7	使用es改善运维，提升效率	elk？ 能带来什么？ 首先是认知的改变。\r\nelk能做哪些统计，分析，报表？	2017-10-23 11:47:43.247047
10	1	5	ceph社区跟踪方法	1，社区计划，线路\r\nroadmap blueprint\r\n\r\ntracker网站上的没有及时更新\r\n\r\nhttps://trello.com/b/ugTc2QFH/ceph-backlog\r\nhttp://tracker.ceph.com/projects/ceph\r\n\r\n2，社区特性的讨论\r\n邮件列表\r\n\r\n3，关键时间点，版本计划\r\nhttp://docs.ceph.com/docs/master/releases/\r\n\r\n4，问题跟踪\r\nhttp://tracker.ceph.com/projects/ceph	2017-10-11 17:39:18.152353
18	1	8	ceph对象集群扩展问题的解决思路	ceph集群在扩容时，有两种比较合适的做法，避免数据迁移。\r\n\r\n一是新增物理pool，二是新增集群。\r\n\r\nrgw上管理多个集群的方案可能略为复杂。\r\n\r\n在bucket index上实现物理pool的方案也许更为可行。\r\n\r\nbucket index就是那一层，需要使用ssd加速。\r\n\r\n还有一种方案是使用类似olh一样的redirect方案，支持让对象在读取或写入时变更所属池子。\r\nbucket的base pool，以及extra pool。这种方案也可以纳入考虑范围。	2017-11-01 13:16:09.015343
17	1	7	docker在工作中的运用	docker 开发人员用来测试功能还是非常合适的。\r\n\r\n实际生产用docker还真难说合适，容器技术的本质就是环境，资源隔离。\r\n\r\n对于无状态服务这个很爽，跟其他应用隔离，避免了各种环境不一致导致的问题。\r\n开发和运维都简化很多\r\n\r\ndocker技术是应devops而生的。\r\n\r\n但数据库，存储的生产环境，通常仅仅用来跑存储和附属服务，没有强烈的隔离需求。\r\n\r\n但平时开发测试还是很方便的，避免重复安装，虚拟化，轻量级。\r\n\r\ndocker的特点：\r\n1，虚拟化\r\n   环境，资源隔离\r\n2，轻量级\r\n   效率高，启动，关闭速度快，拷贝文件快，镜像文件小。\r\n3，镜像管理技术\r\n\r\ndocker：应用虚拟化\r\n\r\n目前应用场景：\r\n1，编译工程\r\n 尤其是像ceph这种依赖一堆东西的项目\r\n2，搭建集群，容灾环境做测试\r\n3，部署其他应用，傻瓜式，不需要懂一个软件就可以部署应用。\r\n\r\n\r\n发起一个探讨：\r\nceph docker化是过度使用？还是必然方向？\r\n	2017-10-27 08:24:14.523759
20	1	7	关于招聘的理解	招聘的本质就是找齐产品缺乏的那个人。\r\n\r\n所以明确产品规划，以及人力部署之后，就很清晰了。\r\n\r\n而招人的核心：\r\n1，这个人能胜任工作\r\n2，这个人对这个领域有兴趣，能创造公司期望的价值。\r\n\r\n而人才对于公司：\r\n1，待遇合适\r\n2，公司战略符合自己的价值观，使命预期。	2017-11-02 08:33:44.383684
21	1	5	源代码注释规则	\r\nXRCM：注释\r\nXRWHY：暂时看不懂的地方	2017-11-03 13:59:32.879864
25	1	7	分布式系统常用算法	一致性hash\r\npaxos/raft	2017-11-10 13:08:28.118427
23	1	7	阿里初步面试总结	面试是采用电话的方式，视频比较卡。\r\n\r\n面试的重点还是在做过的项目上，面试官看重：\r\n1，算法\r\n  问了一致性hash，以及hbase等的路由算法\r\n2，论文\r\n\r\n这两个关注点也是比较自然的，想想我们工作，刨除一些价值不大的琐碎之外，主要价值就是算法方面。\r\n\r\n解决的大问题，以及核心算法。而我们平时学习的重心也在于此。	2017-11-08 13:49:15.67259
24	1	8	组件的解耦	如果底下用ceph了，那么上面一些组件用ceph合适吗？\r\n\r\n这得看情况：\r\n依赖有点不好的地方就是兼容，如果不是使用原生ceph，那就得做些不兼容的事情。\r\n\r\n另外要避免循环依赖。\r\n比如om系统，elast search本身就是ceph集群的一部分，这时这些组件依赖ceph，会造成循环依赖。\r\n1，你想定位问题，但是ceph坏了，om也不能提供有效信息\r\n	2017-11-08 16:01:12.887266
28	1	7	网宿胡瑶交流纪要	他们目前使用的还是H版本\r\n1，bucket index不做recovery，直接做backfill （减少阻塞的bucket index个数）\r\n2，对象合并直接在Rgw路径上做，后台等一个大对象内部的小对象删除到一定数量，再GC。\r\n另外由于读也经过bucket index，所以在osd上做了bucket index的缓冲。\r\n  该特性还没投入使用\r\n3，扩容，他们在上层有数据库存元数据，所以采用的多集群方案。\r\n4，他们在做将RGW元数据存到mongodb的方案，但是mongodb没事务，目前遇到一些一致性问题。\r\n但他们场景下可接受。\r\n5，他们还尝试过OpenCV做人脸识别，但是精度不高，放弃了。\r\n\r\n\r\n使用bucket index来实现object跨故障域或集群，显然非常受限制。\r\n并发的粒度太小了。如果分512个shard。读写冲突仍然是非常厉害的。\r\n而且osd pg的读写锁机制，对于并发非常不好。\r\n\r\n	2017-11-16 09:28:53.407278
22	1	8	ceph rgw架构分析	1，bucket index\r\n如果rgw使用no bucket index模式，我难以想象object version怎么实现。\r\nbucket index无序的组织方式注定了list是很慢的。s3 list要求按照字母排序\r\n\r\n2，元数据分多个地方存储，造成了rgw一致性的复杂局面\r\n为了保证bucket index， object version，olh 代码复杂度搞的非常高。\r\n好处是什么呢？ 避免了操作需要经过bucket index。然而为了支撑更加复杂的特性，最终访问经过元数据层可能仍然难以避免。\r\nhttp://tracker.ceph.com/projects/ceph/wiki/RGW_Object_Versioning\r\n看这文档简直复杂的无话可说，不就是一个事务搞定的事么。\r\n\r\n为了解决扩缩容，冷热数据问题。这里可能难免有一次调整。\r\n	2017-11-03 20:26:07.654727
26	1	8	bucket index优化	bucket index使用hash方式不是很合适，bucket index上的主要操作：\r\n1，list\r\n2，write\r\n\r\nlist是需要排序的，hash在排序上非常慢。\r\nwrite的时候方便，只需hash就可以得到。\r\n\r\n改进思路：\r\n采用类似哈夫曼树的方式来组织数据。\r\n一个bucket dir节点就是一个哈夫曼节点，在达到一定规模时自动分裂。\r\n\r\n需要分裂。\r\n\r\n考虑到各种情况，可能还是得使用平衡树。\r\n\r\n否则可能出现不平衡的情况，导致一些场景下恶化。\r\n\r\n但是这种场景还是相对简单，只需不断分裂即可，不必合并节点。\r\n而且可以保证树的深度为2.	2017-11-10 13:31:00.671116
27	1	7	数据组织方式的研究	可以分几个大类：\r\n1，内存中的数据\r\n2，磁盘中的数据\r\n3，网络中的数据	2017-11-10 15:32:43.076395
30	1	7	爱数方钰翔面试	对其他竞品有些了解，日立等\r\n对公司技术方向有全面了解\r\n  超融合的困境，对象存储销售的艰难，公司销售的思维\r\n\r\n技术方面：\r\n对rados和rgw有全面的了解。\r\nEC那块也有涉及。爱数网盘就是用的EC\r\n当然还有一些奇怪的需求，比如multisite之间不同bucket sync。解决了一些multisite的问题。\r\n支持rgw对象的tail跨pool。\r\n\r\n也搞过EIO\r\n	2017-12-11 14:14:02.876267
31	1	7	紫晶光存储	1，技术特征\r\n是怎么玩的？原理\r\n\r\n2，产品优势\r\n\r\n3，合作带来的价值提升	2017-12-12 07:07:11.834308
34	1	8	OSD优化点	1，心跳优化，心跳不会因为osd压力大而挂掉\r\n2，peering优化，优化peer消息处理的优先级\r\n3，scrub优化。	2018-01-02 08:26:44.447637
33	1	7	RGW一致性保证	1，冲突写同一个对象的情况，使用id tag来 cmp write保护。\r\n2，单个对象使用两阶段来保证bi和对象一致性， prepare + complete\r\n3，多版本对象使用olh log保障，bi，olh，instance的一致性。\r\n4，容灾使用bilog同步，保证一致性。全量同步和增量同步。	2017-12-27 07:42:30.891303
36	1	5	特性快照	如果单纯的在多版本基础上实现快照，然后打完快照就不允许关闭多版本，那做起来就容易了。\r\n\r\n但是如果想支持真正意义上的快照，并且和多版本可作独立特性而存在。那么就要理清楚多版本与快照之间的关系。\r\n\r\n*将快照的不同版本当作null一样处理是一个关键点。*	2018-01-03 04:35:13.247239
37	1	7	多版本容灾bugfix汇总	1, slave zone should consider version suspend too for delete, otherwise slave may generate new version for delete - set_olh case,this is different with master zone.\r\n2, slave zone also need "null" instance to keep the same delete logic for delete null instance.\r\n这个实际上是因为delete在slave执行与master同样流程导致，但是slave执行时没有“null” instance信息，导致流程与master不一致。\r\n3，乱序执行的影响\r\n可能产生多个olh tag，导致部分同步失败。\r\n\r\n而将全量改为按序执行主要是因为支持桶快照功能。\r\n4，convert 的null instance， epoch并非总是1\r\n比如fullsync，如果按社区版本逻辑，current是null，其epoch假设是5.\r\n如果null instance最新同步，那么将会出现2个null，一个epoch是5，另一个是1（convert的）。  将fullsync的执行顺序改为按照epoch顺序执行，则不会遇到这个问题。\r\n\r\nfix : 1,olh time use empty time,otherwise slave zone may use it as null instance mtime, then will not sync null instance because of olh's mtime is newer.\r\n2, set "null" instance for unlink_instance and skip del op, otherwise we can not delete null instance from suspend version bucket.\r\n这个问题另一种解决办法是slave和master采用不同逻辑。显然slave delete不需要产生新版本，它只是同步。\r\n\r\n3, set null instance for versioned(include suspended) bucket, otherwise fullsync will create new version for null instance.\r\n这个的核心问题在于slave与master使用了同样的RGWPutObjProcessor_Atomic::prepare，这里面会产生新的instance，slave sync过程显然不需要产生新的instance。\r\n\r\n5，slave zone，多版本instance并发执行同样有问题。\r\nupdate_olh_log参考这个函数，olh log是写入最新的epoch的。\r\nolh log没有按epoch顺序产生，老epoch的instance操作olh log写入了新的epoch中，*这时trim olh log就会因为并发导致trim掉尚未执行的olh log。*\r\n\r\n6，fullsync没有同步delete marker。\r\n	2018-01-04 13:11:27.843674
61	1	7	面试套路	筛选：\r\n1，学校，专业，年龄\r\n2，工作经验符合度\r\n3，背景\r\n\r\n电话面试(15分钟以内)\r\n问题1，请做一下自我介绍\r\n  观察点：自我认知，价值观，态度，表达能力\r\n问题2，简历中某件事情内容，如何完成的(3年以下偏向个人，3年以上偏向团队，最好有成功经验)\r\n  观察点：办事能力，团队协作能力，经验认知，专业知识\r\n问题3，专业领域技术问题\r\n  观察点：学习能力，分析解决问题能力\r\n问题4，专业知识问题\r\n  观察点：基本功\r\n问题5，个人求职意向(工资？发展方向？)\r\n  观点点：价值观\r\n\r\n  \r\n  \r\n当面面试（1个小时以内）：\r\n问题1，请做一下自我介绍\r\n问题2，请详细阐述简历中一项工作（这里如果不过关，可直接终止，参与人数？你的职责？代码行数？缺陷程度？改进想法？）\r\n问题3，技术细节盘问 （说不清楚，pass）\r\n问题4，如果让你做XX工作，你的想法是什么？(套路掌握情况，更适合有一定经验的人)\r\n问题5. 有一些展示项目吗？业余一般做什么？提升手段？（对于基本功差的，这个要重点问下）\r\n问题6，离职原因，个人发展规划 （不是非常match的，经验也不是特别match, pass）\r\n\r\nlinux基础：\r\n怎么查看线程的CPU占用？\r\n怎么查看防火墙是否开启？\r\n网络和磁盘压力怎么看？怎么查看磁盘信息？\r\n怎么判定一个linux环境是虚拟机还是物理机？\r\n用什么命令查看raid卡信息？\r\n\r\nC++基础：\r\nstl或boost库问题\r\ngdb条件断点怎么用？如何仅调试一个线程？\r\n程序segmefault之后没产生core文件，可能有哪些原因？\r\nC++ map，set各有什么特性？\r\n\r\n算法：\r\n基础算法与分布式算法\r\n冒泡排序逻辑过程是怎样的？\r\n你知道有哪些分布式一致性算法？\r\n一致性hash是什么？\r\n	2018-04-17 08:47:35.762957
62	1	7	性格，工作与成功	性格在心理学上也叫人格。\r\n\r\n成长型思维与固定型思维。如何让比较一般的人成为优秀的人，如何寻找天赋和成长都不错的人。\r\n人都喜欢停留在自己的舒适区，多巴胺的记忆。这也许是性格的起源。缺乏爱的人缺乏自信，小时候缺乏交流的人沟通可能有障碍。\r\n还有一种非常重要的情绪就是恐惧，惊吓。自卑或自傲等情绪。\r\n\r\n聪明与愚钝 （处理事物上，认知障碍）\r\n感性思维与理性思维 （认知障碍，情感障碍）\r\n\r\n依赖性人格与独立性人格\r\n立即满足型与延迟满足型 （急躁，尖酸。）\r\n集体型与个体型 （在责任感，荣誉感上不一样）\r\n勇敢与软弱  （成长阻碍，恐惧）\r\n\r\n自卑自大与自信 （与爱也有关系，有的人会伪造行为，制造出一个自我，这种人通常是自卑的）\r\n积极型与消极型（乐观与悲观）\r\n外向与内向型 （交际能力）\r\n给予型与获取型 （快感来源不一样）\r\n慈爱型与冷酷型（这与小时候获取的关爱有关系）\r\n\r\n寻求满足，自我保护，恐惧是最基本的性格特质。\r\n害羞，紧张，担心，忧虑都是恐惧情绪。\r\n对于批评的恐惧让人成为完美主义者。\r\n\r\n动力(性格)，能力，匹配好才能促成成功。\r\n\r\n当我在游泳时，我看到周围很多大人在岸上。泳池里面浅水区大部分是小孩。\r\n我仿佛听到有人在议论，看这么大的人还跟小孩一样在这游。而当时我却无比坚定。\r\n不懂就要学，好玩就可以玩，跟年龄有关系吗？\r\n\r\n当我看着青春的小孩时，不禁感叹，啊，时光走的真快，我没法把他们浪费在boring的事情上了，我得去潇洒的生活，才对得起这光阴啊。\r\n\r\n\r\n人性的弱点：\r\n人类天性至深的本质，就是渴求为人所重视。（满足）\r\n人通常不会承认自己犯了错误，而且在面对别人批评时，绝大部分人都是没有任何触动的。\r\n同样亲人也会看不到自己的错误。\r\n尖锐的批评、斥责，、永远不会有效果的。\r\n有的人需要鼓励，但我想并非所有人都如此，自傲自大的人显然鼓励没什么效果。\r\n延迟满足感，玩游戏时高潮来的特别快，然而当一切停下来时，只剩下虚空。\r\n自信心，很多人缺乏这个，鼓励产生作用的原因。让事情看起来没那么难，容易达成。\r\n\r\n有一种态度非常重要，就是把一切行为和情绪当成人的逻辑反应，而不是情绪化的看待这一切。\r\n佛洛依德就是那个最早仰望星空的人，去真正关心，理解一个人的心智。\r\n\r\n掌握原则，刻意练习，不断完善，就可以达成目标。\r\n这是每个人可以做到的，或者在一定帮助下可以做到的。\r\n\r\n集体的目标一致性非常重要，这就是价值观，工作的成就感，说得急功近利一点就是上升途径。\r\n每个人都应该从工作中获得乐趣，不然就是非常boring的。	2018-05-06 21:55:11.465282
63	1	7	git使用	git的多版本快照机制，记录全量而非增量、这是git与其他版本控制最大的区别。这也决定了git能提供离线工作方式\r\n\r\ngit checkout某个分支的完整版：\r\ngit clone -b v10.2.10 --recursive https://github.com/ceph/ceph.git\r\n\r\ngit tag： tag的本质commit标记。不同branch之间的commit是树状关系。所以如果你打一个tag 3.1.5，然后想基于此修改，那么应该从该tag拉出branch。\r\n而不是先创建branch，然后打tag，这样master分支将看不到tag。\r\n\r\ngit rebase -i HEAD~4\r\ngit push origin branch-name --force\r\ngit commit --amend\r\n注意，squash的意思是挤压，也就是和previous commit合并\r\ngit.exe push -v --progress  "origin" mylocal:xr.mylocal --force\r\n\r\ngit cherry-pick\r\n\r\ngithub提交流程：\r\n1，fork\r\n2，pull request\r\n注意comment格式\r\n\r\n\r\n问题单通常不会提到master上，是因为：\r\n1，开发过程出现问题不用提单\r\n2，客户或测试都是基于特定版本\r\n\r\n社区开发对bug处理方式总是合回master，然后再backport到其他分支。在分支上仍然是需要回归验证问题单的。\r\n\r\n在冲突的情况下，放弃本地修改，强行fetch某个文件:\r\ngit fetch\r\ngit checkout origin/master -- path/to/file\r\n\r\n	2018-05-17 06:49:47.709816
35	1	5	git无法push问题解决	fatal: sha1 file '<stdout>' write error: Invalid argument\r\n\r\n\r\n$ git push -u origin feature_mos_snap2 --force\r\nCounting objects: 631, done.\r\nDelta compression using up to 4 threads.\r\nCompressing objects: 100% (437/437), done.\r\nremote: error: object file ./objects/6e/b397e0dd15073c401e1870211d3fa5004be22a is empty\r\nremote: fatal: SHA1 COLLISION FOUND WITH 6eb397e0dd15073c401e1870211d3fa5004be22a !\r\nfatal: sha1 file '<stdout>' write error: Invalid argument\r\nerror: failed to push some refs to 'git@10.10.2.111:develop/sandstone.git'\r\n\r\n网上查了很多方法不行。\r\n最后是通过创建一个新分支，然后reset到有问题的那个commit之前。再push才成功。\r\n\r\n估计是git local和remote出现冲突，一致性出现问题导致。	2018-01-02 11:55:36.381424
41	1	7	RGW特性风险	1，双活同步模块，偶尔出现同步卡住的情况，需要手动触发才能恢复。\r\n   而且问题定位这块做的不够好，出问题仍然不好定位\r\n\r\n2，快照基于epoch的逻辑顺序，与多活基于时间的顺序是有矛盾的。\r\n另外使用epoch序与异步同步方式也存在逻辑上的缺陷。比如slave自己修改了epoch 10，然后改了epoch 11.\r\nmaster这时改了epoch 11，但是尚未同步epoch 10，这样snap指向的修改对象就不一样了。\r\n回滚的时候需要注意是回滚到那个版本。\r\n\r\n3，快照基于bucket来扫描，每次去读取bucket info是不合适的。\r\nbucket的数量在不同业务场景下，可能是有非常大差异的。也许300s都读不完。\r\n这里应该将信息同步到snap对应的pool中。\r\n\r\n4，es检索的效果不是很理想，可能查询不到。\r\n\r\n5，bucket list期间，如果一些instance删除了。如何确保能够list其后的instance？\r\n目前似乎没做到，rgw会跳过该对象其他instance。	2018-01-17 08:22:01.54981
43	1	7	ceph集群单机安装	#!/bin/bash\r\n\r\nrm -f /tmp/monmap\r\nrm -rf /etc/ceph/data/*\r\nINSTALL_DIR=/var/lib/ceph\r\nHOSTNAME=node0001\r\nIP="172.18.0.130:6789"\r\n#install master\r\n${INSTALL_DIR}/bin/monmaptool --create --add a  ${IP} /tmp/monmap\r\nmkdir -p /etc/ceph/data/ceph-a\r\n${INSTALL_DIR}/bin/ceph-mon --mkfs -i a --monmap /tmp/monmap\r\n${INSTALL_DIR}/sbin/init-ceph start mon.a\r\nsleep 10\r\n#install osd\r\n\r\nmkdir -p /etc/ceph/data/ceph-0\r\nmkdir -p /etc/ceph/data/ceph-1\r\nmkdir -p /etc/ceph/data/ceph-2\r\n${INSTALL_DIR}/bin/ceph osd create\r\n${INSTALL_DIR}/bin/ceph-osd -i 0 --mkfs\r\n${INSTALL_DIR}/bin/ceph osd create\r\n${INSTALL_DIR}/bin/ceph-osd -i 1 --mkfs\r\n${INSTALL_DIR}/bin/ceph osd create\r\n${INSTALL_DIR}/bin/ceph-osd -i 2 --mkfs\r\n#modify crush\r\n${INSTALL_DIR}/bin/ceph osd crush add-bucket ${HOSTNAME} host\r\n${INSTALL_DIR}/bin/ceph osd crush move ${HOSTNAME}  root=default\r\n${INSTALL_DIR}/bin/ceph osd crush add osd.0 1.0 host=${HOSTNAME}\r\n${INSTALL_DIR}/bin/ceph osd crush add osd.1 1.0 host=${HOSTNAME}\r\n${INSTALL_DIR}/bin/ceph osd crush add osd.2 1.0 host=${HOSTNAME}	2018-01-18 10:29:28.471846
42	1	7	rgw对象存储基本配置	[global]\r\nfsid = 005e9cec-819e-45cd-b911-976ada60d545\r\nrbd_default_features = 3\r\nauth cluster required = none\r\nauth service required = none\r\nauth client required = none\r\nosd pool default min size = 1\r\nosd pool default pg num = 64\r\nosd pool default pgp num = 64\r\nrgw_cache_enabled = False\r\nrgw_cache_lru_size = 100000\r\nrgw_thread_pool_size = 600\r\nrgw_num_rados_handles = 1\r\nrgw_override_bucket_index_max_shards = 64\r\nrgw_max_chunk_size = 4194304\r\nrgw_enable_usage_log = True\r\nrgw_user_quota_sync_wait_time = 1800\r\nrgw_user_quota_sync_interval = 1800\r\nrgw_multipart_min_part_size = 4194304\r\npublic network = 172.18.0.1/24\r\ncluster network = 172.18.0.1/24\r\nmon_osd_reporter_subtree_level = osd\r\nosd_crush_chooseleaf_type = 0\r\nrun dir = /etc/ceph/\r\n\r\n[mon]\r\nmon initial members = a\r\nmon osd down out interval = 172800\r\nlog_file = /etc/ceph/log/$cluster-$name.log\r\nmon data = /etc/ceph/data/$cluster-${id}\r\n\r\n[mon.a]\r\nhost = node0001\r\nmon addr = 172.18.0.130\r\n\r\n[osd]\r\nosd data = /etc/ceph/data/$cluster-${id}\r\nosd journal = /etc/ceph/data/$cluster-${id}/journal\r\nosd_max_write_size = 8\r\nosd_journal_size = 64\r\nlog_file = /etc/ceph/log/$cluster-$name.log\r\nosd scrub begin hour = 1\r\nosd scrub end hour = 5\r\nosd erasure code plugins = ""\r\nosd recovery max single start = 1\r\nosd recovery threads = 1\r\nosd push per object cost = 1000\r\nosd max backfills = 1\r\nosd max push objects = 1\r\nosd max push cost = 2097152\r\nosd delay recovery util = 0.6\r\nosd recovery max chunk = 4194304\r\nosd recovery max active = 1\r\nosd recovery sleep sec = 0.05\r\ndebug_objclass = 2\r\n[osd.0]\r\nhost = node0001\r\n[osd.1]\r\nhost = node0001\r\n[osd.2]\r\nhost = node0001\r\n\r\n[client.radosgw.sync_rgw1]\r\nkeyring = /etc/ceph/ceph.client.radosgw.keyring\r\nrgw_frontends = fastcgi\r\nrgw_port = 8090\r\nlog file = /etc/ceph/log/client.radosgw.sync_rgw1.log\r\nrgw test mode = 0\r\nrgw_zone = SZ\r\nrgw bucket map max pull size = 16777216\r\nrgw_print_continue = false\r\nrgw_content_length_compat = true\r\ndebug_rgw = 1\r\nrgw_bucket_max_snaps = 2\r\noperation_log_path = /etc/ceph/log/\r\nrgw_snaptask_processor_max_time = 10\r\n\r\n[client.radosgw.es]\r\nkeyring = /etc/ceph/ceph.client.radosgwes.keyring\r\nrgw_frontends = fastcgi\r\nrgw_port = 8092\r\nlog file = /etc/ceph/log/client.radosgw.es.log\r\nrgw test mode = 0\r\nrgw_zone = SZES\r\ndebug_rgw = 1\r\nrgw bucket map max pull size = 16777216\r\nrgw_print_continue = false\r\nrgw_content_length_compat = true\r\nrgw_enable_gc_threads = false\r\n\r\n\r\nnginx_conf:\r\nuser  root;\r\n\r\nworker_processes auto;\r\nworker_cpu_affinity auto;\r\nworker_rlimit_nofile 65535;\r\n\r\npid        /etc/ceph/nginx.pid;\r\nerror_log  /etc/ceph/nginx_error.log;\r\n\r\nevents {\r\n    use epoll;\r\n    worker_connections  65535;\r\n}\r\nhttp {\r\n    include       mime.types;\r\n    default_type  application/octet-stream;\r\n    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '\r\n                      '$status $body_bytes_sent "$http_referer" '\r\n                      '"$http_user_agent" "$http_x_forwarded_for"';\r\n\r\n    access_log  /etc/ceph/nginx_access.log  main;\r\n    #charset  utf-8;\r\n    sendfile        on;\r\n    tcp_nopush     on;\r\n    tcp_nodelay on;\r\n\r\n    fastcgi_connect_timeout 300;\r\n    fastcgi_send_timeout 300;\r\n    fastcgi_read_timeout 300;\r\n    fastcgi_buffer_size 64k;\r\n    fastcgi_buffers 4 64k;\r\n    fastcgi_busy_buffers_size 128k;\r\n    fastcgi_temp_file_write_size 128k;\r\n    keepalive_timeout  0;\r\n    client_max_body_size        100G;\r\n\r\n    include /root/nginx/conf/conf.d/*.conf ;\r\n} \r\n\r\nrgw conf:\r\nserver {\r\n        listen   8080;\r\n        location / {\r\n        if ($request_method = 'OPTIONS') {\r\n    add_header 'Access-Control-Allow-Origin' '*' always ;\r\n    add_header 'Access-Control-Allow-Methods' 'GET, POST,PUT, DELETE, OPTIONS' always;\r\n    add_header 'Access-Control-Max-Age' 1728000;\r\n    add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-MD5,ETag,authorization,x-amz-content-sha256,x-amz-acl,x-amz-date,x-amz-user-agent,x-amz-tagging,x-amz-copy-source'  always ;\r\n    add_header 'Content-Type' 'text/plain charset=UTF-8' always ;\r\n    add_header 'Access-Control-Expose-Headers' 'ETag' always;\r\n    return 204;\r\n}\r\nif ($request_method = 'POST') {\r\n  add_header 'Access-Control-Allow-Origin' '*' always ;\r\n  add_header 'Access-Control-Allow-Methods' 'GET, POST,PUT,DELETE, OPTIONS'  always ;\r\n  add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-MD5,ETag,authorization,x-amz-content-sha256,x-amz-acl,x-amz-date,x-amz-user-agent,x-amz-tagging,x-amz-copy-source'  always ;\r\n  add_header 'Access-Control-Expose-Headers' 'ETag' always;\r\n}\r\nif ($request_method = 'GET') {\r\n  add_header 'Access-Control-Allow-Origin' '*';\r\n  add_header 'Access-Control-Allow-Methods' 'GET, POST, PUT,DELETE,OPTIONS';\r\n  add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-MD5,ETag,authorization,x-amz-content-sha256,x-amz-acl,x-amz-date,x-amz-user-agent,x-amz-tagging,x-amz-copy-source';\r\n  add_header 'Access-Control-Expose-Headers' 'ETag' always;\r\n}\r\nif ($request_method = 'PUT') {\r\n  add_header 'Access-Control-Allow-Origin' '*' always;\r\n  add_header 'Access-Control-Allow-Methods' 'GET, POST, PUT,DELETE,OPTIONS' always;\r\n  add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-MD5,ETag,authorization,x-amz-content-sha256,x-amz-acl,x-amz-date,x-amz-user-agent,x-amz-tagging,x-amz-copy-source';\r\n  add_header 'Access-Control-Expose-Headers' 'ETag' always;\r\n}\r\nif ($request_method = 'DELETE') {\r\n  add_header 'Access-Control-Allow-Origin' '*' always;\r\n  add_header 'Access-Control-Allow-Headers' 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-MD5,ETag,authorization,x-amz-content-sha256,x-amz-acl,x-amz-date,x-amz-user-agent,x-amz-tagging,x-amz-copy-source';\r\n  add_header 'Access-Control-Allow-Methods' 'GET, POST, PUT,DELETE,OPTIONS' always;\r\n  add_header 'Access-Control-Expose-Headers' 'ETag' always;\r\n}\r\n             fastcgi_pass  127.0.0.1:8090 ;\r\n\r\n             fastcgi_param  QUERY_STRING     $query_string;\r\n             fastcgi_param  REQUEST_METHOD   $request_method;\r\n             fastcgi_param  CONTENT_TYPE     $content_type;\r\n             fastcgi_param  CONTENT_LENGTH   $content_length;\r\n             fastcgi_pass_header Authorization;\r\n             fastcgi_pass_request_headers on;\r\n\r\n             fastcgi_connect_timeout 600;\r\n             fastcgi_send_timeout 600;\r\n             fastcgi_read_timeout 600;\r\n             fastcgi_request_buffering off;\r\n\r\n             fastcgi_cache_valid 200 302 301 1h;\r\n             fastcgi_cache_valid any 1m;\r\n             fastcgi_cache_min_uses 1;\r\n             fastcgi_cache_use_stale error timeout invalid_header http_500;\r\n             fastcgi_cache_key $request_method://$host$request_uri;\r\n             include fastcgi_params;\r\n        }\r\n}\r\n	2018-01-18 09:45:18.742848
45	1	7	与邱尚高聊天记录	邱哥的观点：\r\n小企业在夹缝中生存。\r\nUSP难以构建竞争力，竞争激烈。\r\n\r\n对象存储的机遇在于大企业尚未在企业市场内投入，小企业在营销上存在一些缺陷。\r\n一般的售前在推广对象存储上有些困难。对象存储需要与用户深入交流。\r\n\r\n对象存储对于小企业是个机会。\r\n\r\n另外AI下沉到对象内部处理有一定优势。 但是并未讲明白优势在哪里。\r\n\r\n人事上，邱哥也明说很多人可能出来了，处于高位，但是不具备相应的能力。\r\n这种能力不仅是技术能力，还有社交能力，政治能力。\r\n\r\n不知人事，焉能带队。\r\n\r\n目前我在独自带队打造产品核心竞争力上仍然欠缺。对产品大架构调整的能力仍然欠缺。\r\n如何掌握ceph这种复杂度的软件的大规模修改。设计方案上的缺陷仍然存在。\r\n比如桶快照这种规格的特性，都有一些缺陷。\r\n\r\n就像打羽毛球的能力提升一样，研发技术上也有很多细节需要不断锻炼，不断提升。\r\n\r\n通人事，能干事。 也许年薪百万就不是难事了吧。\r\n给自己一年时间。	2018-01-19 20:43:32.871647
38	1	5	多版本代码解读之delete marker	在开启多版本的时候，delete marker比较单纯，因为没有对应的instance rados obj。 但是在多版本挂起或者快照场景下，就不一样了。delete marker可能直接写到一个有实体的对象上。\r\n\r\n为了应对这个问题，rgw有一个特殊的处理：\r\n<pre><code class="cpp">\r\n/*\r\n   * Special handling for null instance object / delete-marker. For these objects we're going to\r\n   * have separate instances for a data object vs. delete-marker to avoid collisions. We now check\r\n   * if we got to overwrite a previous entry, and in that case we'll remove its list entry.\r\n   */\r\n  if (op.key.instance.empty()) {\r\n    //XRCM:这段说白了就是清理以前的null instance index\r\n    //其他非null instance的instance is not need, will key the key\r\n    BIVerObjEntry other_obj(hctx, op.key);\r\n    ret = other_obj.init(!op.delete_marker); /* try reading the other null versioned entry */\r\n    existed = (ret >= 0 && !other_obj.is_delete_marker());\r\n    if (ret >= 0 && other_obj.is_delete_marker() != op.delete_marker) {\r\n      //XRCM:如果有delete marker,或者目前要执行delete，都clear index\r\n      ret = other_obj.unlink_list_entry();\r\n      if (ret < 0) {\r\n        return ret;\r\n      }\r\n      ret = other_obj.unlink();\r\n      if (ret < 0) {\r\n        return ret;\r\n      }\r\n    }\r\n\r\n    removing = existed && op.delete_marker;\r\n  } else {\r\n    removing = (existed && !obj.is_delete_marker() && op.delete_marker);\r\n  }\r\n</code></pre>\r\n\r\n这段意思是说给null instance & delete marker的情况额外的制造一个instance entry，从而避免冲突。 也就是 XX_id(d就是delete，参见)\r\n<pre><code class="cpp">\r\nstatic void encode_obj_versioned_data_key(const cls_rgw_obj_key& key, string *index_key, bool append_delete_marker_suffix = false)\r\n{\r\n  *index_key = BI_PREFIX_CHAR;\r\n  index_key->append(bucket_index_prefixes[BI_BUCKET_OBJ_INSTANCE_INDEX]);\r\n  index_key->append(key.name);\r\n  string delim("\\0i", 2);\r\n  index_key->append(delim);\r\n  index_key->append(key.instance);\r\n  *if (append_delete_marker_suffix) {\r\n    string dm("\\0d", 2);\r\n    index_key->append(dm);\r\n  }*\r\n}\r\n</code></pre>\r\n这里仅仅是处理这种特殊情况。\r\n\r\n上述第一段代码里面处理2种情况：\r\n1，在有instance的对象上，复用instance创建marker（bucket挂起或快照时存在）\r\n2，覆盖delete marker的instance，写入新对象。\r\n	2018-01-04 15:07:26.068343
32	1	8	黄金法则for 多版本，容灾	rule 1：olh修改操作对象哪个版本，取决于bucket状态。多版本挂起则olh操作null对象，多版本开启产生新版本作为操作对象。\r\nrule 2：容灾总是操作instance，所以不必产生新版本。\r\nrule 3：对于rados和bi， olh和null是一样的，总是操作一样的对象和key。 empty instance(olh)和null instance唯一区别在于操作对象的选取上，但容灾不必选取对象。所以容灾不必感知empty还是null。\r\nrule 4：全量同步按对象版本生成顺序串行执行\r\nrule 5：增量同步按bilog顺序串行执行（并发执行无法保证按照epoch顺序，因而造成逻辑混乱）\r\nrule 6：olh不是对象，没有mtime。\r\n\r\n多活下，olh epoch不一致会有问题吗？什么情况会导致olh epoch不一致？\r\n快照索引在多活下根据epoch调整的逻辑合适吗？会不会master zone快照的上一个对象与slave不一致？\r\n这种不一致存在，试想slave在没同步snap 10的对象时，自己写了snap 10对象，然后又切到snap 11.\r\n这时在slave上已经有了snap index，再次同步master snap 10的对象时，epoch可能比较小，就不会修改snap index了。\r\n\r\nrule 7：多活在多版本，或者快照下没有串行化，不同zone执行顺序并不一样。因而存在一致性上的问题。\r\nrule 8：元数据与数据分开同步，导致不同zone在执行操作时，可能使用不同的元数据。就像ceph按照pg分主从一样，在无锁条件下，完全的多主是实现不了的。\r\n所以使用多活也有约束，比如某些bucket在某些zone上作为主。\r\nrule 9：主备zone的olh epoch应该一致，否则olh指向的版本可能不一样。\r\n	2017-12-21 11:45:16.435082
44	1	7	如何写代码注释	代码的修改，新增都是有原因的。\r\n\r\n注释要写应该有2点原因：\r\n1，解释为什么改动代码\r\n2，解释复杂的逻辑\r\n\r\n<pre><code class="cpp">\r\n    bool versioning_enabled() {\r\n      //version able or disable,we can get from instance or olh, no need get from bucket info.\r\n      //espically from slave\r\n      return (!versioning_disabled);\r\n    }\r\n</code></pre>\r\n\r\n这注释就写的很龊，no need并非修改代码的原因，深层次的原因是什么呢？\r\n\r\n	2018-01-19 19:15:05.786891
46	1	7	git常用命令	删除远程分支 ： git push origin --delete branchname\r\n\r\n清除unstack file ： git clean -df\r\n\r\nsquash： \r\ngit rebase -i HEAD~4\r\ngit push origin branch-name --force\r\ngit commit --amend\r\n注意，squash的意思是挤压，也就是和previous commit合并\r\ngit.exe push -v --progress  "origin" mylocal:xr.mylocal --force\r\n\r\nmerge：\r\ngit merge --no-ff\r\n\r\n技巧：\r\n1，临时修改源文件，编译后还原\r\n使用git status | grep cc, git status | grep "\\.h"	2018-01-24 12:15:52.391627
47	1	7	桶快照操作	创建快照\tRest API\t"PUT bucket/?snapshot\r\n\r\n<SnapShot><description>snapshotexample</description></SnapShot>\r\n"\t\t\r\n获取快照列表\tRest API\t"GET bucket/?snapshot\r\n\r\n"\t<?xml version="1.0" encoding="UTF-8"?><SnapSet xmlns="http://s3.amazonaws.com/doc/2006-03-01/"><SnapShots><SnapShot><id>1</id><time>2018-01-02 07:58:32.000000Z</time><description>snapshotexample</description></SnapShot></SnapShots></SnapSet>\t\r\n获取快照变更列表\tRest API\t"GET bucket/?snapshot&id=\r\n\r\nid为快照id\r\n\r\n\r\n鉴权不包含id参数"\t<?xml version="1.0" encoding="UTF-8"?><ListSnapResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/"><Objects><Object><Key>assert.h</Key><Mtime>2018-01-02T08:08:04.092Z</Mtime><CurVersion>.DkPJfOsvXaF1xc8an.hQdORCtmzovv</CurVersion><PreVersion>oMq8adujIdz.lv1BZ0C56nkUhawUBKa</PreVersion></Object></Objects></ListSnapResult>\t\r\n设置bucket快照配置\tRest API\t"PUT bucket/?snapshot&config\r\n\r\n<SnapSetConfiguration><num>1</num><mode>day</mode><day>1</day><hour>14</hour><min>30</min></SnapSetConfiguration>\r\n\r\n鉴权不包含config参数\r\n"\t\t"interval单位是s\r\nnum是保留快照数量"\r\n获取bucket快照配置\tRest API\tGET bucket/?snapshot&config\t<?xml version="1.0" encoding="UTF-8"?><SnapSetConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/"><num>1</num><mode>day</mode><day>1</day><hour>14</hour><min>30</min><sec>0</sec></SnapSetConfiguration>\tmode分为day, week, month三种，sec可以不传入，默认为0\r\n回滚bucket到快照点\tRest API\t"PUT bucket/?rollback&id=\r\n\r\n鉴权不包含id参数"\t\t请求会在后台执行，该命令参数检查通过触发回滚就返回\r\n获取回滚进度\tRest API\tGET /?rollback\t<?xml version="1.0" encoding="UTF-8"?><ListBuckets xmlns="http://s3.amazonaws.com/doc/2006-03-01/"><Buckets><Bucket><name>test18</name><percent>0</percent></Bucket></Buckets></ListBuckets>\tpercent为回滚进度\r\n	2018-01-24 12:16:13.118571
48	1	7	多版本实现说明	特性描述\r\n目的\r\n桶快照特性的目标是解决用户桶出现整体性故障的恢复问题。在多版本下，故障恢复需要应用程序记录bucket内每个需要恢复的对象的版本，增加了应用使用的负担。\r\n\r\n有了桶快照之后，可以直接rollback到某个快照点即可。\r\n\r\n功能\r\n从快照设计目标看，快照功能与多版本功能是可以独立的。多版本是每个修改操作都操作新版本，但是快照从语义上讲是修改操作作用于当前版本，打了快照之后当前版本变成历史版本。也就是说新版本仅产生于新快照生成时。\r\n\r\n功能列表：\r\n\r\n支持同时启用快照和多版本\r\n支持手动创建快照\r\n支持配置规则自动打快照\r\n支持查询快照列表\r\n支持查询快照规则配置\r\n支持查询快照变更对象(这里没有提供查询快照对象，提供的是增量变化的列表)\r\n支持快照回滚，回滚进度可查\r\n支持自动trim快照\r\n支持在zone故障时，仍然能够rollback快照，trim快照\r\nrgw故障之后，其他rgw或者恢复后的rgw应该能够继续执行中断的rollback，trim 操作。\r\n\r\n数据结构\r\n快照ID\r\n每个快照的唯一编号，单调递增，从1开始。\r\n\r\n快照对象的表示\r\n如何表示快照对象？快照对象与普通对象，以及多版本对象的区别是什么？\r\n\r\n为了简化处理模型，这里将普通对象当作快照0，第一个快照的编号是1，以此类推。打完快照n之后，修改操作就落在该快照对应的对象上。这里可能与常见的快照处理就有点不一样了。也就是说null instance是“属于”快照1的对象，而快照1上修改的对象实际上属于快照2，但当前没有快照2. 这时需要注意的地方。\r\n\r\n所以rollback和trim的时候，处理的是snap Id对应的上一个版本的对象。比如rollback to snap 1，很可能就是拿着null instance来覆盖当前版本了。\r\n\r\n快照独立使用时，其使用的versionId(instance)可以使用快照编号。这样做的原因是修改操作在没有新快照产生时，总是写入到当前快照版本对应的对象上。\r\n\r\n快照与多版本一起使用时，使用多版本的规则，每次都产生新的versionId。但是bucket index中会记录每个instance(version)属于哪个快照版本。\r\n\r\n快照变更列表\r\n快照变更列表记录了快照期间修改的所有对象。 快照信息的维护，快照回滚，trim快照都是围绕该数据结构来的。\r\n\r\nstruct rgw_bucket_snapshot_entry {\r\n  uint64_t snapid;\r\n  cls_rgw_obj_key key;//obj name\r\n  list<string> instances; //该snap下的所有变更对象版本，用于trim清理\r\n  uint64_t prev_snapid; //用于找到上一个snapshot entry，trim的时候会用到\r\n  string prev_snap; //上一个版本，这个就是回滚的目标\r\n  ceph::real_time mtime;\r\n实现\r\n有了上述结构之后，实现就是根据该结构来执行相应的操作。\r\n\r\n回滚\r\n回滚任务只会在master zone执行。\r\n回滚期间bucket不可读写。\r\n\r\n用户触发回滚之后，会在snap worker中添加一个snap回滚的任务。snap worker每隔一段时间检查是否有任务要执行，如果有则触发回滚的执行。\r\n\r\n实现主体函数：\r\n\r\nint RGWSnapWorker::rollback(cls_rgw_snaptask_info &task, utime_t end)\r\n为了避免rgw故障后重复回滚，回滚会记录进度，进度信息持久化在snap相关的pool中（跟gc类似的机制）。在rgw重启或其他rgw接手任务之后，会从持久化的rollback位置继续。\r\n\r\n为了在zone切换时，仍然能够执行回滚，在rgw重新加载的时候(切换角色rgw会重新init rados storage)执行init_buckets_task加载bucket上的回滚任务。\r\n\r\nvoid RGWSnapWorker::init_buckets_task()\r\ntrim\r\n超过预留数量的snapshot会被trim。\r\n\r\ntrim 实现主体函数：\r\n\r\nint RGWSnapWorker::trim_snap(cls_rgw_snaptask_info &task, utime_t end)\r\ntrim根据snap index找到snap下的变更对象列表，然后将对象逐个删除。最终删除snap index，并且更新bucket的快照列表。\r\n\r\n自动快照\r\n支持按照每天/周/月 为周期打快照，打快照的具体时间可配置。 打快照的时间误差为配置项rgw_snaptask_processor_period，默认为5分钟。\r\n\r\nvoid RGWSnapWorker::check_buckets()\r\n注意事项\r\n快照的对象可以删除，但是删除可能影响快照的完整性。\r\n快照回滚期间，bucket不能读写，以免产生数据不一致。\r\n数据同步序按照epoch顺序，否则会导致快照信息的紊乱。\r\nbucket info同步存在时间差，在多活情况下，在时间临界点可能出现快照变更列表不一致。要考虑是否在业务接受范围。自动快照最好在业务不繁忙时。\r\n规格以及rest接口请参考：\r\nhttps://svn.szsandstone.com/svn/sandstone/doc/20.版本配套文档/对象存储文档/V3.1.3/bucket快照特性规格描述.xlsx	2018-01-30 08:22:42.864382
51	1	7	面试C++开发点评	沈普春： \r\n技能，毕业一年多了解的面还可以，深度一般。 \r\n能力，在组织表达上偏弱，阐述想法的逻辑性上不是特别好。解决问题的方法，思路方面没有体系化。\r\n学习，专业相关知识业余学习还可以，其他方面涉及不多。\r\n价值观，没有明确的职业规划，尚未想清楚自己的方向。\r\n性格，感觉比较温和敦厚。\r\n\r\n技能上，关于bug定位，性能调优，review代码，实现方案设计方面可以多涉及一点。\r\n\r\n价值观与公司文化契合度。\r\n性格，团队协作能力。积极主动，严于律己，宽以待人，具备反思精神。\r\n学习，更新自己，这是人发展潜力的标志。一年没进步的人，10年可能也没进步。\r\n\r\n	2018-03-06 14:11:21.890708
54	1	5	s3请求超时分析	{"op":"PUT","bucket":"test1","object":"myobjects9656","instance":"","mtime":"2018-03-13T10:55:47.853Z","user_id":"04ee2278917d3848becab9337dcc1a1c","display_name":"yuty","data_type":"BUSINESS","code":200}\r\n\r\n2018-03-13 21:24:25.865187 7f8c89c7f700 2 ====== req done req=0x7f8c70f621c0 obj=test1/myobjects9656 op status=-1 op name=get_obj http_status=403 ======\r\nget请求错误，get返回403的原因是什么？\r\n\r\nput请求\r\n2018-03-13 21:22:11.587343 7f8d0ad81700 3 req 165074:60.003823:s3:PUT /test1/ivw5gr62hpxse8zbk47l/b2918vtpgmihweo0u5knf6cd/mgkvq2zb/rjcshn83ka9q6pdvtluxz157/1xv/9sb3n17ozpejdiuf/xjq5U9q1kL:put_obj:test1/ivw5gr62hpxse8zbk47l/b2918vtpgmihweo0u5knf6cd/mgkvq2zb/rjcshn83ka9q6pdvtluxz157/1xv/9sb3n17ozpejdiuf/xjq5U9q1kL :completing\r\n2018-03-13 21:22:11.587408 7f8d0ad81700 3 req 165074:60.003888:s3:PUT /test1/ivw5gr62hpxse8zbk47l/b2918vtpgmihweo0u5knf6cd/mgkvq2zb/rjcshn83ka9q6pdvtluxz157/1xv/9sb3n17ozpejdiuf/xjq5U9q1kL:put_obj:test1/ivw5gr62hpxse8zbk47l/b2918vtpgmihweo0u5knf6cd/mgkvq2zb/rjcshn83ka9q6pdvtluxz157/1xv/9sb3n17ozpejdiuf/xjq5U9q1kL :op status=-2010\r\n2018-03-13 21:22:11.587413 7f8d0ad81700 3 req 165074:60.003891:s3:PUT /test1/ivw5gr62hpxse8zbk47l/b2918vtpgmihweo0u5knf6cd/mgkvq2zb/rjcshn83ka9q6pdvtluxz157/1xv/9sb3n17ozpejdiuf/xjq5U9q1kL:put_obj:test1/ivw5gr62hpxse8zbk47l/b2918vtpgmihweo0u5knf6cd/mgkvq2zb/rjcshn83ka9q6pdvtluxz157/1xv/9sb3n17ozpejdiuf/xjq5U9q1kL :http status=400\r\n2018-03-13 21:22:11.587418 7f8d0ad81700 2 ====== req done req=0x7f8c6ef77d00 obj=test1/ivw5gr62hpxse8zbk47l/b2918vtpgmihweo0u5knf6cd/mgkvq2zb/rjcshn83ka9q6pdvtluxz157/1xv/9sb3n17ozpejdiuf/xjq5U9q1kL op status=-2010 op name=put_obj http_status=400 ======\r\n\r\n对应于nginx的就是408错误：\r\n10.10.4.25 - - [13/Mar/2018:21:17:25 +0800] "PUT /test1/ivw5gr62hpxse8zbk47l/b2918vtpgmihweo0u5knf6cd/mgkvq2zb/rjcshn83ka9q6pdvtluxz157/1xv/9sb3n17ozpejdiuf/xjq5U9q1kL HTTP/1.1" 408 25 "-" "Boto/2.46.1 Python/2.7.10 Windows/7" "-"\r\n\r\n在中孚现场问题：\r\nnginx返回400错误，与此同时rgw的http err是403\r\n这个问题暴露了我们很多缺陷：\r\n1，rgw日志，审计日志都有问题，而日志是我们定位问题的第一道关，按理说95%问题在这一步能解决。\r\n2，nginx日志也有问题，而且nginx这块没人很精通，出了问题风险非常大。	2018-03-14 08:09:13.291394
59	1	7	人力需求	1，强化运维能力。打磨产品运维细节。\r\n\r\n2，osd研发，解决osd恢复阻塞业务，EC等问题。\r\n\r\n3，rgw研发，解决rgw核心竞争力问题，bucket无限扩展，跨故障域。\r\nrgw性能竞争力。数据流动，支持各种模式的多数据中心等。	2018-04-10 12:12:25.624987
56	1	7	docker在rgw开发中的使用	1，配置静态网络\r\ndocker network create --subnet=172.18.0.0/16 dockernet\r\n\r\n2.利用镜像创建docker虚拟机，并配置端口映射\r\ndocker run -it --privileged=true -v /opt/sandstone/:/var/lib/ceph/ --net dockernet --ip 172.18.0.102 -p 8000:8080 cephcluster_base /bin/bash\r\n其中8000是宿主机端口。\r\n\r\n3，启动容器，进入容器\r\ndocker start xx\r\ndocker exec -it xx /bin/sh\r\n\r\n\r\n目前用的docker容器：\r\nMOS_bugfix\r\ndocker run -it --privileged=true -v /home/xierui/mos/release/:/var/lib/ceph/ --net dockernet --ip 172.18.0.100 -p 8070:8080 registry.cn-hangzhou.aliyuncs.com/freelink/ceph_rgw_master:1 /bin/sh\r\n	2018-03-21 12:06:15.276145
49	1	8	Redmine项目管理的思考	redmine操作注意\r\n1，代码提交必须有对应的单号，或者feature编号\r\n  为什么这点如此重要？因为过了一段时间后，将没人知道为何有这个修改。\r\n2，问题需要在不同版本合入时，需要复制问题单到对应版本\r\n   避免问题单遗漏\r\n3，问题单根据定位的原因，纳入到相关特性，根据需要变更责任人。\r\n   划清责任人\r\n4，master转测拉分支时，Feature复制到对应分支，部分尚未解决但需要在该分支解决的问题单也需从master同步到新的release分支。\r\n5，发布，列出本版本新增特性Readme，确保所有问题得到解决，未解决说明原因可走到不解决的状态，文档更新。\r\n6，问题解决状态为resolved，转给测试，回归通过后close。\r\n7，问题单必须自测通过，才能走到resolved状态。\r\n8，问题在提出之后，需要立即做初步定为，并且增加注释，走出new状态。\r\n   任何系统都得使用起来，才有效果。trace很重要\r\n9，利用子任务功能，做好开发任务的进度管理。\r\n10，研发特性需提供的文档：1，特性实现文档， 2，特性规格接口文档。\r\n11，遇到问题，快速记录。 持续改进，这种创新改进氛围非常重要。\r\n\r\n核心问题：\r\n1，按版本，特性的维度把项目管理起来\r\n确保问题及时的记录到所有分支版本上\r\n确保版本的所有问题得到解决，风险可控。\r\n了解特性的风险\r\n\r\n2，代码提交规范，问题与提交记录关联。\r\n强调自测试，及时更新问题状态。\r\n\r\n版本1.0\r\n需解决如下问题：\r\n1，文档的更新如何与特性，bug相关联？\r\n因为有些特性，以及bug涉及更新文档。比如规格上的，规避手段上的。\r\n*\r\n可以把开发任务和分解任务，bug关联起来。*\r\n\r\n2，如何量化特性开发的进度？\r\n特性需进一步分解成小任务。并且需要从不同维度来展开。\r\n比如文档，升级影响，安全，性能 等等。\r\n\r\n3，更详细的产品规格，包括可靠性，硬盘故障的修复时间等等。\r\n\r\n4，另外例会时，应该有办法反应整个项目的进度，风险。 量化的方式展示出来，而不是从时间维度看，这周做什么，下周做什么。\r\n这种反应是有时间连贯性的。反应了一种因果逻辑，即我们的目标是什么？ 完成某个版本，分解下来有哪些事情，每个进展如何？\r\n\r\n基于目标的纵横。\r\n纵者，深入做好其中的一步，处理好与各种周边的关系\r\n横者，找到各种相关项，明确特性之间的相互影响关系。\r\nDFX等虽说不是代码，但是也是产品所体现出来的非常重要的特性， 是非常重要的维度。\r\n\r\n搞清楚项目管理这台机器基本运行，人的因素。\r\n\r\n绩效好的标准：\r\n1，个人高效\r\n2，团队高效\r\n\r\n\r\n高效包含质量和速度两个指标。\r\n包含方向和执行力两个维度。\r\n\r\n\r\n1，以目标驱动\r\n每个人根据整体目标，任务分解情况，制定小目标。\r\n目标要符合OKR的特征：\r\n1，可量化\r\n2，具备挑战\r\n3，公开透明\r\n\r\n重点在于目标制定和任务分解。\r\n\r\n2，任务执行\r\n任务制定之后，需要人高质量的执行，这是实在出成果的地方。\r\n为了方便沟通，确保任务的落实闭环，适当的流程是需要的。\r\n开发任务上，建议使用好redmine系统。\r\n从版本/特性/bug 维度，展示版本开发工作任务。\r\n从计划/完成 维度理清执行情况。\r\n\r\n重点在于有节奏的执行好每一步。\r\n\r\n3，自发的任务\r\n3.1 及时记录问题\r\n当脑海中闪现某个问题，产品缺陷时，要及时记录。\r\n当用户出现某个问题时，要及时记录。\r\n记录避免遗漏，避免犯同样的错误。\r\n\r\n3.2 专项任务的闭环\r\n当出现专项任务时，任务的闭环这块是需要做好的。\r\n否则可能出现无人跟踪的情况，专项任何其实也可以使用redmine来简单跟踪。\r\n但是详细资料可能需要另外存储。\r\n\r\n积极主动，确保目标达成。\r\n\r\n积极主动：改进与实施。组织人员是否能主动提出改进建议，并进行实施。\r\n这块需要预留一定的时间，同时可以缓冲一些风险。\r\n\r\n把事情做清楚的能力，很多人没搞清根因。\r\n\r\n\r\n人员交接的代价是非常高的。尤其是在缺乏科学的工程管理的情况下。\r\n想想那些千丝万缕的逻辑，保持软件逻辑的简单是软件设计的NO 1任务。\r\n即便如此，在长时间之后，也可能面目全非。没有人能够理解的代码就没办法维护。\r\n\r\n1，简单胜过其他\r\n2，重要修改应该有详细记录，所有修改都已经有对应的记录。记录中因为描述因果\r\n3，任务需要分解，需要设立时间点，责任人。\r\n4，把一套体系运作起来，就像一个机器一样。推动它，使用它，改进它。redmine如此，项目管理也是如此。\r\n\r\n\r\n在提交代码时的check：\r\n1，用例变更与自动化\r\n2，文档变更\r\n3，规格变更\r\n4，工具变更	2018-03-01 14:35:58.235544
52	1	7	rgw placement操作命令	ceph  osd crush add-bucket root_ssd root\r\nceph  osd crush add-bucket sandstone0001_ssd  host\r\nceph  osd crush move sandstone0001_ssd root=root_ssd\r\nceph  osd crush add osd.15 1.0 host=sandstone0001_ssd\r\nceph  osd crush rule create-simple rule_ssd root_ssd osd（crush choose leaf by osd）\r\n\r\nceph osd pool new_index  ssd 1024\r\nceph osd pool set new_index crush_ruleset 1\r\n\r\nbin/radosgw-admin zonegroup placement add --placement-id sandstone\r\nbin/radosgw-admin zone placement add  --placement-id sandstone --index_pool=new_index --data_pool=new_data --placement-index-type=indexless\r\nbin/radosgw-admin period update --commit\r\n\r\n./s3.sh create_bucket test4 "<CreateBucketConfiguration><LocationConstraint>:sandstone</LocationConstraint></CreateBucketConfiguration>"\r\n\r\n	2018-03-09 18:38:18.211907
19	1	7	杉岩数据对象存储发展路标	坚持与开源社区融合的方向\r\n\r\n分布式存储时代：\r\n1，解决海量小文件问题\r\n2，解决集群扩容问题\r\n\r\n2017下半年\r\n2018上半年\r\n\r\n智能存储时代：\r\n1，图片**\r\n2，规律**\r\n\r\n2018年底启动\r\n解决集群扩容问题。扩容后如何使用，bucket如何跨越故障域？\r\n解决bucket index对象恢复影响业务的问题。能否去掉bucket index，同时具备一些其他功能？ bucket数据量统计是需要的，quota目前依赖于bucket index。\r\n\r\n不同pool恢复的优先级其实不一样，但是是否会被阻塞呢？ 其实在IO路径上的object应该能很快恢复才对。\r\n有missing的时候是不是开启允许读呢？ 不然玩起来非常难，om也卡住。\r\n*本来就允许，只要当前节点在acting中，且在当前节点object不missing就可以读*\r\n\r\nQos，控制达到效果：阻塞io的请求优先处理。\r\n目前阻塞在io路径上的消息优先级本来也高些，所以这里也没问题。\r\n调度算法也是基于优先级的。\r\n io_queue get_io_queue() const {\r\n    if (cct->_conf->osd_op_queue == "debug_random") {\r\n      srand(time(NULL));\r\n      return (rand() % 2 < 1) ? prioritized : weightedpriority;\r\n    } else if (cct->_conf->osd_op_queue == "wpq") {\r\n      return weightedpriority;\r\n    } else {\r\n      return prioritized;\r\n    }\r\n  }\r\n\r\n\r\n压力大时，osd会自杀，sage看来这是磁盘压力大，慢盘导致的，并非问题。\r\nhttp://tracker.ceph.com/issues/14341\r\n\r\n能否在bucket index中记录增量？恢复该对象时，采用增量恢复的方式？\r\n\r\n*\r\n可以把bucket shard搞得非常大，根据数据总量来。但是不提供list功能。或者通过外部数据库来提供list功能。*\r\n\r\n\r\n	2017-11-01 13:19:26.000263
58	1	7	工作任务划分	1，sdk部分\r\n2，rgw特性，quato/acl/usage/policy等。\r\n3，rgw特性，多版本，快照，多数据中心。\r\n	2018-04-08 14:32:47.250996
60	1	6	period同步过程	period同步过程：\r\n\r\n当period修改提交之后。会在realm对象上发起notify。所有存活的radosgw都会收到notify信息。\r\nraodsgw处理notify信息，并且启动一个线程将最新period同步给其他zone,这个线程会一直执行，知道同步操作成功。\r\n\r\n代码请参考：void RGWPeriodPusher::handle_notify(RGWZonesNeedPeriod&& period)\r\n\r\n处理过程：RGWOp_Period_Post::execute\r\n其他zone收到Post请求之后保存period到本zone。\r\n\r\n注意period id不是每次都发生变化。\r\n\r\n然后在period history中加入该period。\r\n并且触发reload realm。\r\n\r\n如果当前本zone没有活着的radosgw，也没关系。\r\nRGWPeriodPusher::RGWPeriodPusher\r\n该构造函数中会读取最新的period，并且触发notify操作。\r\n\r\n那么period不同步到底是什么情况下发生呢？ \r\n日志中还可以看到failed to decode period.	2018-04-12 14:12:00.899024
29	1	8	杉岩数据对象存储项目管理建议	为了大家可以更加轻松有效的完成工作，建立更好的研发文化：\r\n1，严格版本出口，每个版本特性的时间确定，如果确定无法按期完成，则需要在例会中提出延期，并做出相关说明。\r\n2，任务按特性划分责任人，特性相关问题直接分给特性责任人。\r\n   可根据实际情况讨论，变更特性责任人划分。\r\n3，特性的设计方案，开发代码以及bugfix需要review，给出review意见\r\n4，建议使用redmine\r\n\r\n*物资奖励与工作任务*\r\n明确绩效达成奖励，当然这个不一定能落实，但是可以保证的是优秀者得到的更多。\r\n\r\n考核办法：\r\n在最初就定义好考核办法：\r\n根据有效人天量来评估，评估story的工作量。\r\n\r\n维护一个模块也有工作量，团队协助也有一定工作量。培养新人的工作量。\r\n\r\n\r\n工作安排：\r\n优先分配（个人能力和经验） + 人天价值模式。\r\n生长模型，新年都将加入新的任务，这是一种个人成长的需要，也是组织发展的需要。\r\n\r\n*发展和使命感*：\r\n渴望发展的人多进取，并且追求变革。\r\n使命感是把其当作长期事业的基础。\r\n\r\nOKR是什么？ 适合公司吗？ 如何落实？ 最最关键的是如何让大家都目标正确和明确，合理。\r\n\r\n\r\n核心目标：MOS产品在市场上的竞争优势\r\n这是无法非议的，每年的目标都如此，今年也许可以细化下，在金融领域的竞争力。\r\n\r\n比如rados模块，提升竞争力的方法： 支持单bucket多少数据量，支持多大的文件规模。延迟维持在多少等等。\r\n\r\n研发人员的kpi肯定不是开发哪些特性，开发多少行代码，少出多少bug，这些不是目标，而且没有激励性。\r\n这些目标是冰冷的，并不激励人。这些是工作，并非目标。\r\n\r\n这是OKR与KPI的区别，KPI引导人寻找指标，而不是目标。重点在于找到目标并且很好的分解目标，这是抓住核心的东西。\r\nOKR透明的意义在于大家都知道彼此的目标，并且每个人都明白自己的努力方向，对是方向而不是拼凑的任务。\r\n\r\n尝试使用redmine构建OKR系统。我觉得这是一个好想法。\r\n使用excel最大的问题在于写完之后很少打开去看。而使用redmine大家都知道文件就在那里，随时可以查看。\r\n\r\n几个大目标驱动团队\r\n让大家明白执行小任务背后的大目标。\r\n\r\nRedmine：任务分解与管理\r\nRedmine：版本开发管理，类别可以看作是大的feature，而每个小开发任务是feature内的划分。\r\n\r\n专项任务：\r\n邮件，专项文件，如果想用redmine也是可以的。\r\n\r\n企业内竞争的一个很重要的地方就是信息不对称，某些人掌握着其他人没有掌握的信息，别人只告诉你怎么做，但不一定告诉你为什么这样做。\r\n而企业生存一般在一个领域，更新较慢，一旦某个人的全部被其他人掌握，那么这个人就失去了权力。权力就是控制事情方向的能力。\r\n\r\n互联网竞争的核心是个人及团队能力，因为协作方法，知识，idea都是开放的，拼的是方案，营销，运维，运营的能力。\r\n\r\n\r\n1，目标\r\n整体目标充分讨论明确，每个人的分解目标明确。\r\n并且知道其他人的目标，以便更好的合作。\r\n同时目标的达成度是个人工作业绩的体现。\r\n\r\n1.1 模块分解，明确责任人\r\n\r\n2，任务\r\n2.1 版本\r\n团队最重要的任务就是交付版本\r\n每个版本都是由一些新增特性，或者增强特性组成。\r\n保证高质量的交付开发特性要求大家做好每一步，需求讨论，方案设计，review，开发，自测试，bugfix等等。\r\n\r\n2.2，专项任务\r\n\r\n3，团队建设\r\n建设一流的团队，成长的团队。\r\n\r\n\r\n\r\n\r\n	2017-11-20 07:40:33.094164
57	1	7	multiste 配置代码解读：RGWRados::init_complete	1，如何找到realm呢？\r\ndefault.realm  存了一个id\r\nrealms.${id} 存了realm的name\r\n\r\n这个是整个集群唯一的，放在.rgw.root pool中。\r\n\r\n2， period初始化\r\nperiod由3部分组成：\r\nperiods.3b289420-d65f-4203-a6a0-7b91d5e4980b.3\r\n中间是id. 最后是epoch\r\nid来自于realm。\r\n\r\n3，RGWRados::replace_region_with_zonegroup\r\n这个函数在zonegroup下基本什么都不执行。\r\n\r\n4，zonegroup从period初始化而来。init_zg_from_period\r\n注意这个函数如果当前没有zonegroup会创建，没有zone也会创建。\r\n\r\ndefault.zonegroup.$realmid 存放的就是本\r\n\r\n5，zone是怎么初始化的呢？\r\n从配置项rgw_zone而来，这个是核心。否则rgw都无法知道自己是谁。\r\n\r\n	2018-03-21 19:26:23.349675
64	1	7	发展规划	1，侧重点是在研发上，能独立设计产品，深谙技术方案的核心。优劣等。（个人能力）\r\n   当然运维能力也是能力。（知识是能力的基础）\r\n2，其次是带队，任务的执行，人员的成长，文化精神的建立等等。\r\n 连接人与事。 （团队能力）\r\n3，对大方向的把握，了解技术动态，看到未来。自己的主张。（价值认知）。\r\n\r\n可以看成是三维坐标。\r\n\r\n传道授业解惑，任何阶段的人都需要老师。只是恰在合适的时间遇到彼此。\r\n\r\n设计架构可以管5年吗？10年呢？\r\n\r\n定位：基础软件开发\r\n乐趣：发现基础软件设计之奥秘，软件研发之精髓。以达在软件领域知行合一之境界。若你真理解，请你实现它。	2018-05-23 06:59:21.502387
70	1	7	rgw http错误码	rgw内部错误码：\r\n\r\n#define STATUS_CREATED           1900\r\n\r\n#define STATUS_ACCEPTED          1901\r\n\r\n#define STATUS_NO_CONTENT        1902\r\n\r\n#define STATUS_PARTIAL_CONTENT   1903\r\n\r\n#define STATUS_REDIRECT          1904\r\n\r\n#define STATUS_NO_APPLY          1905\r\n\r\n#define STATUS_APPLIED           1906\r\n\r\n\r\n\r\n#define ERR_INVALID_BUCKET_NAME  2000\r\n\r\n#define ERR_INVALID_OBJECT_NAME  2001\r\n\r\n#define ERR_NO_SUCH_BUCKET       2002\r\n\r\n#define ERR_METHOD_NOT_ALLOWED   2003\r\n\r\n#define ERR_INVALID_DIGEST       2004\r\n\r\n#define ERR_BAD_DIGEST           2005\r\n\r\n#define ERR_UNRESOLVABLE_EMAIL   2006\r\n\r\n#define ERR_INVALID_PART         2007\r\n\r\n#define ERR_INVALID_PART_ORDER   2008\r\n\r\n#define ERR_NO_SUCH_UPLOAD       2009\r\n\r\n#define ERR_REQUEST_TIMEOUT      2010\r\n\r\n#define ERR_LENGTH_REQUIRED      2011\r\n\r\n#define ERR_REQUEST_TIME_SKEWED  2012\r\n\r\n#define ERR_BUCKET_EXISTS        2013\r\n\r\n#define ERR_BAD_URL              2014\r\n\r\n#define ERR_PRECONDITION_FAILED  2015\r\n\r\n#define ERR_NOT_MODIFIED         2016\r\n\r\n#define ERR_INVALID_UTF8         2017\r\n\r\n#define ERR_UNPROCESSABLE_ENTITY 2018\r\n\r\n#define ERR_TOO_LARGE            2019\r\n\r\n#define ERR_TOO_MANY_BUCKETS     2020\r\n\r\n#define ERR_INVALID_REQUEST      2021\r\n\r\n#define ERR_TOO_SMALL            2022\r\n\r\n#define ERR_NOT_FOUND            2023\r\n\r\n#define ERR_PERMANENT_REDIRECT   2024\r\n\r\n#define ERR_LOCKED               2025\r\n\r\n#define ERR_QUOTA_EXCEEDED       2026\r\n\r\n#define ERR_SIGNATURE_NO_MATCH   2027\r\n\r\n#define ERR_INVALID_ACCESS_KEY   2028\r\n\r\n#define ERR_MALFORMED_XML        2029\r\n\r\n#define ERR_USER_EXIST           2030\r\n\r\n#define ERR_NOT_SLO_MANIFEST     2031\r\n\r\n#define ERR_EMAIL_EXIST          2032\r\n\r\n#define ERR_KEY_EXIST            2033\r\n\r\n#define ERR_INVALID_SECRET_KEY   2034\r\n\r\n#define ERR_INVALID_KEY_TYPE     2035\r\n\r\n#define ERR_INVALID_CAP          2036\r\n\r\n#define ERR_INVALID_TENANT_NAME  2037\r\n\r\n#define ERR_WEBSITE_REDIRECT     2038\r\n\r\n#define ERR_NO_SUCH_WEBSITE_CONFIGURATION 2039\r\n\r\n#define ERR_AMZ_CONTENT_SHA256_MISMATCH 2040\r\n\r\n#define ERR_USER_SUSPENDED       2100\r\n\r\n#define ERR_INTERNAL_ERROR       2200\r\n\r\n#define ERR_NOT_IMPLEMENTED      2201\r\n\r\n#define ERR_SERVICE_UNAVAILABLE  2202\r\n\r\n\r\n\r\nhttp错误对照：\r\n\r\nconst static struct rgw_http_errors RGW_HTTP_ERRORS[] = {\r\n\r\n    { 0, 200, "" },\r\n\r\n    { STATUS_CREATED, 201, "Created" },\r\n\r\n    { STATUS_ACCEPTED, 202, "Accepted" },\r\n\r\n    { STATUS_NO_CONTENT, 204, "NoContent" },\r\n\r\n    { STATUS_PARTIAL_CONTENT, 206, "" },\r\n\r\n    { ERR_PERMANENT_REDIRECT, 301, "PermanentRedirect" },\r\n\r\n    { ERR_WEBSITE_REDIRECT, 301, "WebsiteRedirect" },\r\n\r\n    { STATUS_REDIRECT, 303, "" },\r\n\r\n    { ERR_NOT_MODIFIED, 304, "NotModified" },\r\n\r\n    { EINVAL, 400, "InvalidArgument" },\r\n\r\n    { ERR_INVALID_REQUEST, 400, "InvalidRequest" },\r\n\r\n    { ERR_INVALID_DIGEST, 400, "InvalidDigest" },\r\n\r\n    { ERR_BAD_DIGEST, 400, "BadDigest" },\r\n\r\n    { ERR_INVALID_BUCKET_NAME, 400, "InvalidBucketName" },\r\n\r\n    { ERR_INVALID_OBJECT_NAME, 400, "InvalidObjectName" },\r\n\r\n    { ERR_UNRESOLVABLE_EMAIL, 400, "UnresolvableGrantByEmailAddress" },\r\n\r\n    { ERR_INVALID_PART, 400, "InvalidPart" },\r\n\r\n    { ERR_INVALID_PART_ORDER, 400, "InvalidPartOrder" },\r\n\r\n    { ERR_REQUEST_TIMEOUT, 400, "RequestTimeout" },\r\n\r\n    { ERR_TOO_LARGE, 400, "EntityTooLarge" },\r\n\r\n    { ERR_TOO_SMALL, 400, "EntityTooSmall" },\r\n\r\n    { ERR_TOO_MANY_BUCKETS, 400, "TooManyBuckets" },\r\n\r\n    { ERR_MALFORMED_XML, 400, "MalformedXML" },\r\n\r\n    { ERR_AMZ_CONTENT_SHA256_MISMATCH, 400, "XAmzContentSHA256Mismatch" },\r\n\r\n    { ERR_LENGTH_REQUIRED, 411, "MissingContentLength" },\r\n\r\n    { EACCES, 403, "AccessDenied" },\r\n\r\n    { EPERM, 403, "AccessDenied" },\r\n\r\n    { ERR_SIGNATURE_NO_MATCH, 403, "SignatureDoesNotMatch" },\r\n\r\n    { ERR_INVALID_ACCESS_KEY, 403, "InvalidAccessKeyId" },\r\n\r\n    { ERR_USER_SUSPENDED, 403, "UserSuspended" },\r\n\r\n    { ERR_REQUEST_TIME_SKEWED, 403, "RequestTimeTooSkewed" },\r\n\r\n    { ERR_QUOTA_EXCEEDED, 403, "QuotaExceeded" },\r\n\r\n    { ENOENT, 404, "NoSuchKey" },\r\n\r\n    { ERR_NO_SUCH_BUCKET, 404, "NoSuchBucket" },\r\n\r\n    { ERR_NO_SUCH_WEBSITE_CONFIGURATION, 404, "NoSuchWebsiteConfiguration" },\r\n\r\n    { ERR_NO_SUCH_UPLOAD, 404, "NoSuchUpload" },\r\n\r\n    { ERR_NOT_FOUND, 404, "Not Found"},\r\n\r\n    { ERR_METHOD_NOT_ALLOWED, 405, "MethodNotAllowed" },\r\n\r\n    { ETIMEDOUT, 408, "RequestTimeout" },\r\n\r\n    { EEXIST, 409, "BucketAlreadyExists" },\r\n\r\n    { ERR_USER_EXIST, 409, "UserAlreadyExists" },\r\n\r\n    { ERR_EMAIL_EXIST, 409, "EmailExists" },\r\n\r\n    { ERR_KEY_EXIST, 409, "KeyExists"},\r\n\r\n    { ERR_INVALID_SECRET_KEY, 400, "InvalidSecretKey"},\r\n\r\n    { ERR_INVALID_KEY_TYPE, 400, "InvalidKeyType"},\r\n\r\n    { ERR_INVALID_CAP, 400, "InvalidCapability"},\r\n\r\n    { ERR_INVALID_TENANT_NAME, 400, "InvalidTenantName" },\r\n\r\n    { ENOTEMPTY, 409, "BucketNotEmpty" },\r\n\r\n    { ERR_PRECONDITION_FAILED, 412, "PreconditionFailed" },\r\n\r\n    { ERANGE, 416, "InvalidRange" },\r\n\r\n    { ERR_UNPROCESSABLE_ENTITY, 422, "UnprocessableEntity" },\r\n\r\n    { ERR_LOCKED, 423, "Locked" },\r\n\r\n    { ERR_INTERNAL_ERROR, 500, "InternalError" },\r\n\r\n    { ERR_NOT_IMPLEMENTED, 501, "NotImplemented" },\r\n\r\n    { ERR_SERVICE_UNAVAILABLE, 503, "ServiceUnavailable"}\r\n\r\n};	2018-06-13 11:47:03.801634
55	1	7	Git/TortoiseGit账号缓存	https://stackoverflow.com/questions/14000173/tortoisegit-save-user-authentication-credentials\r\n\r\nGo to "TortoiseGit > Settings > Credential"\r\nSelect Credential helper "Advanced"\r\nClick on the "G" (for global) under Helpers\r\nEnter the Helper path as below. Note: a regular Windows path notation (e.g. "C:\\Users...") will not work here, you have to replicate the exact line that installing winstore created in the global .gitconf without the "helper =" bit.\r\n\r\n!'C:\\\\Users\\\\yourlogin\\\\AppData\\\\Roaming\\\\GitCredStore\\\\git-credential-winstore.exe'\r\nClick the "Add New/Save" button\r\n\r\ngit账号缓存：\r\nhttps://help.github.com/en/articles/caching-your-github-password-in-git\r\nlinux：\r\ngit config --global credential.helper cache\r\n长期有效\r\ngit config --global credential.helper store	2018-03-15 18:16:46.428222
40	1	7	RGW ElasticSearch使用	查询所有index：\r\ncurl -XGET 172.18.0.150:9200/_all\r\n\r\n查询所有记录：\r\ncurl -XGET 172.18.0.150:9200/rgw-china-899bd0a5/_search/?\r\ncurl -XGET 172.18.0.150:9200/rgw-china-899bd0a5/_search?pretty=1\r\n\r\n查询某个key:\r\ncurl -XGET 172.18.0.150:9200/rgw-china-899bd0a5/_search -d '{"query":{"match":{"name":"assert.h"}}}'\r\n\r\n查询index状态，记录总数等：\r\ncurl -XGET 10.10.1.157:9200/mos_rgw_metadata/_stats/?pretty=1\r\n\r\n查询记录条数：\r\ncurl 10.10.1.177:9200/_cat/indices?v\r\n\r\n设置es日志级别：\r\ncurl -XPUT 10.10.1.177:9200/_cluster/settings -d '{"transient" : { "logger.discovery" : "DEBUG" }}'\r\n\r\nes 6.x上:\r\ncurl -H "Content-Type: application/json" -XPUT http://192.168.12.11:9200/_cluster/settings -d '{"transient":{"logger.org.elasticsearch.transport":"DEBUG" }}'\r\n详见: https://www.elastic.co/guide/en/elasticsearch/reference/6.x/logging.html\r\n\r\n查询语法请参考：\r\nhttps://es.xiaoleilu.com/010_Intro/30_Tutorial_Search.html\r\n\r\n删除index:\r\ncurl -XDELETE 172.18.0.150:9200/rgw-china-8656ab53\r\n\r\ntag：\r\ntag按照rgw实现，是可以直接同步到es的，但是元数据只有部分是支持的。\r\n\r\n\r\n优化：\r\nES zone同步哪些bucket是可以配置的，同时似乎从master zone同步即可。	2018-01-16 18:14:48.712582
50	1	8	面试方法	招人的本质是招一个能否胜任目标工作的人。就是在三象限上与公司匹配度非常好的人。\r\n太强也不一定合适，可能留不住。合适最重要。\r\n\r\n这里面有几个层面：\r\n1，技能上是否满足，这就得看具体岗位，明确岗位的需求。\r\n2，能力上是否合适，这里可以简单指一个人完成一件事情的质量。\r\n有的人，丢三落四，采用的方法非常低效，不善变通，交代的任务无法确保完成，这里有态度的问题，也有方法的问题。\r\n3，成长上是否有潜力\r\n这是招的人不满足的情况，或者期望其往后能承担什么样的职责的时候。\r\n4，价值观上\r\n个人是否认同企业的价值观，这点就是长线了，但是三观比较正的人发展潜力无疑更大。\r\n有格局，有志向的人，其人生逻辑不一样。\r\n\r\n四个问题：\r\n1，深入简历中某一个事项，深挖其细节，观察一个人做事的深度，以及其逻辑。\r\n2，深入其简历中做得最好的一件事，介绍下这件事的各个方面，核心问题，自己的应对方案，以观察其能力。\r\n3，如果安排进来做某个工作，谈下如何开展工作，思路？\r\n4，如何提到自己？ 学习的方法？\r\n5，你觉得搞软件最重要的品质是什么？\r\n6，对职业发展的规划，对行业的看法。（价值）\r\n7，交给你一个XX特性，你准备怎么开发？（能力，套路）\r\n8，你想解决什么样的问题？（价值）\r\n\r\n技能：\r\n1，深入一些技术细节，看你是否彻底掌握，如何提升技能？\r\n\r\n能力：\r\n1，方法\r\n2，深入其研发的一个特性，看看各方面做的怎么样，知行是否合一\r\n是否能准确的理解需求，方面的要点讲的怎么样。\r\n\r\n人品，性格：\r\n1，能否委托重任？\r\n2，是否追求极致？\r\n人性犹如冰山，很难得其全貌。\r\n有人自大孤傲，有人自卑怯弱。有人勇敢，有人鲁莽。\r\n有人沉着冷静，有人优柔寡断。有人热情诚恳，有人唯唯落落。\r\n有人气质忧郁，有人阳光。\r\n\r\n知人断事真功夫。\r\n\r\n\r\n知识能否胜任：\r\n1，专业，以及职位经验匹配度  （筛选）\r\n2，专业技能如何？ （技术一面）\r\n   linux基础\r\n   c++基础\r\n   算法基础，中高级要求对分布式hash算法，一致性等有一定了解\r\n   \r\n\r\n办事能力：（技术一面）\r\n判断一个人是否积极主动 （做的事情周边是否会涉及到一些）\r\n判断一个人是否能理清要事，能否直接讲到重点，并点明其中的玄机。 （问题是什么，核心矛盾的理解）\r\n判断一个人是否能够以始为终，目标明确 （目标是什么）\r\n\r\n沟通交流，品质：（可以看出一个人的部分品质）\r\n表达是否清晰流畅，有条理。\r\n\r\n更倾向于选择在一个集体中比较优秀的人（筛选）\r\n离职的原因是？\r\n【家庭原因？像梁先杰其实仅仅为了女朋友过来就有点，还是应该兼顾个人发展】\r\n【混不好？】\r\n【公司战略调整，请讲明调整方向】\r\n【专业方向调整， 请说明原因，这种一般经验不匹配】\r\n【挖人另当别论，挖人一般都是针对有经验的。】\r\n\r\n是否注重团队利益？\r\n是否好相处？\r\n\r\n问题：\r\n对团队的贡献体现在哪些方面？\r\n\r\n价值观：\r\n解决什么样的问题。\r\n\r\n\r\n面试的核心难点：\r\n1，如何在短时间内了解一个人\r\n2，如何确认一个新人在培养2年之后不会跳槽？\r\n3，如何在1-2年时间内让一个人产生与待遇匹配的绩效？\r\n\r\n抓紧因果，寻找矛盾的地方。\r\n\r\n\r\n技术水平鉴定：\r\n1，干些打杂的事，一些中小模块开发                    初级工程师 (xk-20k)\r\n2，能独立完成一个稍复杂模块设计开发，bugfix，维护          中级工程师 (20-40k)\r\n3，熟悉整个系统，了解其使用场景，对特性，模块之间的关系有深入理解，\r\n并且理解该系统的一些缺陷                           高级工程师（40-100K，google普通应届生可能是这水平）\r\n4，主导对一个系统进行大的架构调整并取得成功。  \r\n能自主设立项目，解决某一问题                       大牛 （100K+，google高级应届生在这水平，互联网的产品经理也应该达到这水平）\r\n5，能在一个问题上开辟新的算法，并做出大的改进。    大师  (1000K+,李开复可能是这种级别，也可能略高。一般来说独自设计算法，开辟新项目的在此级别)\r\n6，解决新的问题，维护超级大项目                    大神  (无价，这种人凤毛麟角，linus，jim gray，可能比一般xx研究员，首席科学家水平还高)\r\n	2018-03-05 12:46:45.988479
92	21	5	目前想选购的初步电器清单	厨房：\r\n厨余垃圾处理器https://post.smzdm.com\r\n洗碗机\r\n五门冰箱\r\n厨房冷霸\r\n\r\n\r\n\r\n\r\n卫生间\r\n	2019-03-19 18:16:40.829096
65	1	7	研发管理 常用链接	1，邮件系统,QQ,微信群(通知，任务推进)\r\nhttps://exmail.qq.com\r\n\r\n2，禅道（项目，任务管理）\r\nhttp://10.10.30.35/index.php?m=product&f=browse\r\n\r\n3，redmine (代码开发管理，问题单管理)\r\nhttp://10.10.2.201:10083/projects/mos\r\n\r\n4，文件共享（版本发布目录，临时版本也在此）\r\n\\\\10.10.30.39\\version_packages\\MOS\r\n\r\n5，SVN (版本管理)\r\nhttps://svn.szsandstone.com/svn/sandstone/doc/20.版本配套文档/对象存储文档	2018-05-24 08:34:27.467166
39	1	7	rgw multisite搭建过程	前提条件：\r\n安装好ceph集群\r\n\r\n创建zonegroup，zone：\r\nbin/radosgw-admin realm create --rgw-realm=china --default\r\n\r\nbin/radosgw-admin zonegroup create --rgw-zonegroup=china1 --endpoints=http://172.18.0.130:8080 --rgw-realm=china --master --default\r\n\r\nbin/radosgw-admin zone create --rgw-zonegroup=china1 --rgw-zone=SZ --master --default --endpoints=http://172.18.0.130:8080\r\n\r\nbin/radosgw-admin period update --commit\r\n\r\nbin/radosgw-admin user create --uid="sysuser" --display-name="sysuser" --access_key="root" --secret_key="sandstone" --system\r\n\r\nbin/radosgw-admin zone modify --rgw-zone=SZ --access-key="root" --secret="sandstone"\r\n\r\nbin/radosgw-admin period update --commit\r\n\r\nbin/radosgw-admin user create --uid="nuser" --display-name="nuser" --access_key="admin" --secret_key="admin"\r\n\r\n创建zone对应的pool:\r\nbin/ceph osd pool create SZ.rgw.buckets.index 3\r\nbin/ceph osd pool create SZ.rgw.buckets.data 3\r\nbin/ceph osd pool create SZ.rgw.buckets.non-ec 3\r\n\r\n创建EC pool （注意ec pool不支持omap操作，bucket.index, bucket.non-ec都不支持ec pool）：\r\nbin/ceph osd erasure-code-profile get default\r\nk=2\r\nm=1\r\nplugin=jerasure\r\ntechnique=reed_sol_van\r\nbin/ceph osd pool create SZ.rgw.buckets.data 64 erasure myprofile  \r\n\r\nceph osd erasure-code-profile set myprofile1  k=2  m=1  plugin=jerasure crush-failure-domain=osd  ruleset-failure-domain=osd\r\n\r\n注意最好把zone信息都配置好，\r\n然后自己手动建pool，\r\n再启动rgw，不然rgw启动后会建一些默认的。\r\n\r\n创建第二个zone:\r\n第二个zone：\r\nbin/radosgw-admin realm pull --url=http://172.18.0.130:8080 --access-key=root  --secret=sandstone\r\n  \r\nbin/radosgw-admin period pull --url=http://172.18.0.130:8080 --access-key=root --secret=sandstone\r\n\r\nbin/radosgw-admin zone create --rgw-zonegroup=china1 --rgw-zone=BJ --url=http://172.18.0.131:8080 --endpoints=http://172.18.0.131:8080 --access-key=root --secret=sandstone\r\n\r\nbin/radosgw-admin period update --commit\r\n\r\n运行rgw：\r\n/var/lib/ceph/bin/radosgw --pid-file /etc/ceph/client.radosgw.sync_rgw1.pid -c /etc/ceph/ceph.conf -n client.radosgw.sync_rgw1 --setuser sdsadmin --setgroup sdsadmin\r\n\r\n运行nginx：\r\n/root/nginx/sbin/nginx -c /root/nginx/conf/rgw_nginx.conf -p /root/nginx/\r\n\r\n主备zone切换：\r\nbin/radosgw-admin zone modify --rgw-zone=SZ --master --default\r\nbin/radosgw-admin period update --commit\r\n这两条命令之后，主端主动会降为slave。\r\n参考:http://docs.ceph.com/docs/master/radosgw/multisite/\r\n\r\n创建ES zone:\r\nbin/radosgw-admin zone create --rgw-zonegroup=china1 --rgw-zone=SZES --access-key="root" --secret="sandstone" --endpoints=http://172.18.0.130:8082\r\n\r\nbin/radosgw-admin zone modify --rgw-zone=SZES  --tier-type=elasticsearch --tier-config=endpoint=http://172.18.0.150:9200,num_shards=10,num_replicas=1\r\nbin/radosgw-admin zone modify --rgw-zone=SZES1 --sync-from-all=false --sync-from=SZ --tier-type=elasticsearch --tier-config=endpoint=http://172.18.0.161:9200,num_shards=10,num_replicas=1,override_index_path=rgw_metadata1\r\nbin/radosgw-admin period update --commit\r\n\r\nbin/ceph osd pool create SZES.rgw.buckets.index 3\r\nbin/ceph osd pool create SZES.rgw.buckets.data 3\r\nbin/ceph osd pool create SZES.rgw.buckets.non-ec 3\r\n\r\n/var/lib/ceph/bin/radosgw --pid-file /etc/ceph/client.radosgw.es.pid -c /etc/ceph/ceph.conf -n client.radosgw.es --setuser sdsadmin --setgroup sdsadmin\r\n\r\n给用户增加ak/sk\r\nradosgw-admin user modify --uid="sysuser" --acess-key="newk" --secret-key="newk"	2018-01-16 13:03:41.817465
67	1	7	2018.6.8	跟友商PK：\r\n> 生命周期，结合分层存储。\r\n> pk重点还是在性能上\r\n> \r\n> 我看的重点：\r\n> 1，可靠性，稳定性。故障对服务的影响。\r\n> 2，性能\r\n> 3，扩展性，扩容方面的表现。\r\n> \r\n> 基石，仍然存在缺陷。\r\n> \r\n> 4，数据管理，支持数据的各种流转，容灾，数据压缩，重删，加密，保护等.\r\n\r\nbcache加速元数据，backfill恢复优化之后。能抗住5千万+的数据。暂时可以不考虑把bi挪出来。\r\n\r\n\r\n	2018-06-08 14:12:13.19358
69	1	7	linux错误码	#define EPERM   1 /* Operation not permitted */\r\n\r\n#define ENOENT   2 /* No such file or directory */\r\n\r\n#define ESRCH   3 /* No such process */\r\n#define EINTR   4 /* Interrupted system call */\r\n#define EIO   5 /* I/O error */\r\n#define ENXIO   6 /* No such device or address */\r\n#define E2BIG   7 /* Argument list too long */\r\n#define ENOEXEC   8 /* Exec format error */\r\n#define EBADF   9 /* Bad file number */\r\n#define ECHILD  10 /* No child processes */\r\n#define EAGAIN  11 /* Try again */\r\n#define ENOMEM  12 /* Out of memory */\r\n#define EACCES  13 /* Permission denied */\r\n#define EFAULT  14 /* Bad address */\r\n#define ENOTBLK  15 /* Block device required */\r\n#define EBUSY  16 /* Device or resource busy */\r\n#define EEXIST  17 /* File exists */\r\n#define EXDEV  18 /* Cross-device link */\r\n#define ENODEV  19 /* No such device */\r\n#define ENOTDIR  20 /* Not a directory */\r\n#define EISDIR  21 /* Is a directory */\r\n#define EINVAL  22 /* Invalid argument */\r\n#define ENFILE  23 /* File table overflow */\r\n#define EMFILE  24 /* Too many open files */\r\n#define ENOTTY  25 /* Not a typewriter */\r\n#define ETXTBSY  26 /* Text file busy */\r\n#define EFBIG  27 /* File too large */\r\n#define ENOSPC  28 /* No space left on device */\r\n#define ESPIPE  29 /* Illegal seek */\r\n#define EROFS  30 /* Read-only file system */\r\n#define EMLINK  31 /* Too many links */\r\n#define EPIPE  32 /* Broken pipe */\r\n#define EDOM  33 /* Math argument out of domain of func */\r\n#define ERANGE  34 /* Math result not representable */\r\n#define EDEADLK  35 /* Resource deadlock would occur */\r\n#define ENAMETOOLONG 36 /* File name too long */\r\n#define ENOLCK  37 /* No record locks available */\r\n#define ENOSYS  38 /* Function not implemented */\r\n#define ENOTEMPTY 39 /* Directory not empty */\r\n#define ELOOP  40 /* Too many symbolic links encountered */\r\n#define EWOULDBLOCK EAGAIN /* Operation would block */\r\n#define ENOMSG  42 /* No message of desired type */\r\n#define EIDRM  43 /* Identifier removed */\r\n#define ECHRNG  44 /* Channel number out of range */\r\n#define EL2NSYNC 45 /* Level 2 not synchronized */\r\n#define EL3HLT  46 /* Level 3 halted */\r\n#define EL3RST  47 /* Level 3 reset */\r\n#define ELNRNG  48 /* Link number out of range */\r\n#define EUNATCH  49 /* Protocol driver not attached */\r\n#define ENOCSI  50 /* No CSI structure available */\r\n#define EL2HLT  51 /* Level 2 halted */\r\n#define EBADE  52 /* Invalid exchange */\r\n#define EBADR  53 /* Invalid request descriptor */\r\n#define EXFULL  54 /* Exchange full */\r\n#define ENOANO  55 /* No anode */\r\n#define EBADRQC  56 /* Invalid request code */\r\n#define EBADSLT  57 /* Invalid slot */\r\n\r\n#define EDEADLOCK EDEADLK\r\n\r\n#define EBFONT  59 /* Bad font file format */\r\n#define ENOSTR  60 /* Device not a stream */\r\n#define ENODATA  61 /* No data available */\r\n#define ETIME  62 /* Timer expired */\r\n#define ENOSR  63 /* Out of streams resources */\r\n#define ENONET  64 /* Machine is not on the network */\r\n#define ENOPKG  65 /* Package not installed */\r\n#define EREMOTE  66 /* Object is remote */\r\n#define ENOLINK  67 /* Link has been severed */\r\n#define EADV  68 /* Advertise error */\r\n#define ESRMNT  69 /* Srmount error */\r\n#define ECOMM  70 /* Communication error on send */\r\n#define EPROTO  71 /* Protocol error */\r\n#define EMULTIHOP 72 /* Multihop attempted */\r\n#define EDOTDOT  73 /* RFS specific error */\r\n#define EBADMSG  74 /* Not a data message */\r\n#define EOVERFLOW 75 /* Value too large for defined data type */\r\n#define ENOTUNIQ 76 /* Name not unique on network */\r\n#define EBADFD  77 /* File descriptor in bad state */\r\n#define EREMCHG  78 /* Remote address changed */\r\n#define ELIBACC  79 /* Can not access a needed shared library */\r\n#define ELIBBAD  80 /* Accessing a corrupted shared library */\r\n#define ELIBSCN  81 /* .lib section in a.out corrupted */\r\n#define ELIBMAX  82 /* Attempting to link in too many shared libraries */\r\n#define ELIBEXEC 83 /* Cannot exec a shared library directly */\r\n#define EILSEQ  84 /* Illegal byte sequence */\r\n#define ERESTART 85 /* Interrupted system call should be restarted */\r\n#define ESTRPIPE 86 /* Streams pipe error */\r\n#define EUSERS  87 /* Too many users */\r\n#define ENOTSOCK 88 /* Socket operation on non-socket */\r\n#define EDESTADDRREQ 89 /* Destination address required */\r\n#define EMSGSIZE 90 /* Message too long */\r\n#define EPROTOTYPE 91 /* Protocol wrong type for socket */\r\n#define ENOPROTOOPT 92 /* Protocol not available */\r\n#define EPROTONOSUPPORT 93 /* Protocol not supported */\r\n#define ESOCKTNOSUPPORT 94 /* Socket type not supported */\r\n#define EOPNOTSUPP 95 /* Operation not supported on transport endpoint */\r\n#define EPFNOSUPPORT 96 /* Protocol family not supported */\r\n#define EAFNOSUPPORT 97 /* Address family not supported by protocol */\r\n#define EADDRINUSE 98 /* Address already in use */\r\n#define EADDRNOTAVAIL 99 /* Cannot assign requested address */\r\n#define ENETDOWN 100 /* Network is down */\r\n#define ENETUNREACH 101 /* Network is unreachable */\r\n#define ENETRESET 102 /* Network dropped connection because of reset */\r\n#define ECONNABORTED 103 /* Software caused connection abort */\r\n#define ECONNRESET 104 /* Connection reset by peer */\r\n#define ENOBUFS  105 /* No buffer space available */\r\n#define EISCONN  106 /* Transport endpoint is already connected */\r\n#define ENOTCONN 107 /* Transport endpoint is not connected */\r\n#define ESHUTDOWN 108 /* Cannot send after transport endpoint shutdown */\r\n#define ETOOMANYREFS 109 /* Too many references: cannot splice */\r\n#define ETIMEDOUT 110 /* Connection timed out */\r\n#define ECONNREFUSED 111 /* Connection refused */\r\n#define EHOSTDOWN 112 /* Host is down */\r\n#define EHOSTUNREACH 113 /* No route to host */\r\n#define EALREADY 114 /* Operation already in progress */\r\n#define EINPROGRESS 115 /* Operation now in progress */\r\n#define ESTALE  116 /* Stale NFS file handle */\r\n#define EUCLEAN  117 /* Structure needs cleaning */\r\n#define ENOTNAM  118 /* Not a XENIX named type file */\r\n#define ENAVAIL  119 /* No XENIX semaphores available */\r\n#define EISNAM  120 /* Is a named type file */\r\n#define EREMOTEIO 121 /* Remote I/O error */\r\n#define EDQUOT  122 /* Quota exceeded */\r\n\r\n#define ENOMEDIUM 123 /* No medium found */\r\n#define EMEDIUMTYPE 124 /* Wrong medium type */\r\n\r\n	2018-06-13 11:46:25.108602
68	1	7	OKR与项目管理	OKR并非绩效考核方法，OKR是一种管理方法，促进目标在整体上达成的方法。\r\n就像敏捷是达成软件按时按质量交付的方法。\r\n\r\nOKR并非列出O，K, R就完事，还有中间如何推进，蕴含了要事优先的逻辑，并且在组织内达成共识，引发集体的讨论。\r\n1，目标明确，有目标，有关键结果，这样才叫目标明确。\r\n2，目标有优先级，且不能太多\r\n3，根据目标列举的重要任务，也不必列太多。\r\n4，最最重要的是积极主动，这点要求组织是双向的，既自上而下，也自下而上。\r\n让人感受到价值，成就感，有乐趣。\r\n\r\n所以show结果的阶段必须有，非常重要，不能说我们制定了一个宏伟的计划，结果啥都没干成。\r\n这种总结分享是非常必要的。show time！（谁show的好，最佳奖就给谁，点评）\r\n\r\n部门的四象限：\r\nO: 帮助企业更好的存储利用非结构化数据\r\nK：\r\n   版本交付时间准确率XX%，无致命缺陷。\r\n   产品性能保持竞争力\r\n   产品功能基本齐备，同时富有特色,拥有一两个重要功能差异点。\r\n   企业级的产品运维能力(1，产品可靠性，可用性好。 2，超强的故障诊断能力。 3，快速的恢复能力)\r\n\r\n2017年：\r\n1，支持多站点\r\n2，支持元数据检索\r\nXX\r\n\r\n2018年：\r\n1，支持海量小文件\r\n2，支持数据保护(秒级数据恢复到任意时间点)\r\n3，支持存储策略，生命周期，数据的流转 （支持bucket跨pool迁移数据）\r\n4，支持多站点，多分支机构\r\n\r\n目标，结果\r\nTOP 2工作\r\n风险\r\n\r\n每周五回顾result。\r\n\r\n解决目标以及成就感问题对于管理似乎还不够，这是一个大的轮廓。\r\n\r\n在日常执行过程中，还得不断的更新状态，推动项目进步。解决出现的问题。\r\n\r\n晨会的几个问题：\r\n1，首先明确大目标，有达成目标的成就感，价值感这是能量的来源。\r\n2，提起大家的精气神，传递一种能量。\r\n3，深入发现每个人的问题，是否在干其他任务，是否要事首先的处理，是否遇到阻塞任务需要求助。\r\n\r\n管理的本质是激发人的善意和潜能，如何做？\r\n\r\n不断的去发现人的问题，解决人的问题。只有每个人都发出自己的光和热，整体才能迸发出能量。\r\n管理的另一面是不断优化任务目标，降低项目整体的熵，提升流程效率，工具效率等。\r\n所以业务的架构非常重要，业务架构好则可以减少很多不必要的工作。\r\n\r\n现实世界其实也是于此，弱者被欲望控制，普通人被利益欲望驱动，真正的强者被使命和理想驱动。\r\n\r\n2018.7.10：\r\n具体开发任务交给研发人员。\r\n我需要做几件事：1，把握项目的技术风险   2，思考产品的竞争力  3，安排人事。  4，优化执行。\r\n\r\n这个目标机器的目标管理，风险管理，确保走向正确的目标。\r\n另一个就是不断优化机器执行效率。\r\n\r\n对团队成员的要求：\r\n1，接受任务，并且有较好执行能力\r\n2，目标-结果管理法，确保整体目标的达成。 --- 就这么简单，把执行结果发出来。考核根本不需要个人填写。\r\n\r\n产品定位和架构对于整体来说更加重要。当然执行也是非常重要的。\r\n\r\n\r\n考核关注点：\r\n异构集群 + 存储策略（1）\r\nCDP + Meta管理（1）\r\n生命周期 + 压缩/加解密等（1）\r\nS3/FTP/NFS等（2-3人）\r\n双活（1）\r\nES（1）\r\n\r\n从几个维度评价贡献:\r\n1, 研发新特性，提升产品竞争力\r\n2，修复bug，构建测试方案， 提升产品稳定性，可靠性\r\n3，提升效率，构建更好的基础平台\r\n4，支撑客户，促进POC和商业目标达成\r\n\r\n\r\n	2018-06-11 07:37:16.15017
72	1	7	ceph研发环境进化	1,在/home目录下创建自己的目录\r\n\r\n2，git clone 下载mos代码，并切换到自己的想编译的分支\r\n\r\n3，在ceph目录下执行sh autogen.sh\r\n\r\n4, configure，如果仅编译rgw相关，可带参数--with-rbd=no --enable-server=no，路径根据实际环境调整\r\n\r\n./configure --without-lttng --without-fuse --without-libatomic-ops --with-jemalloc --without-tcmalloc --without-libxfs --with-radosgw --with-cephfs=no --with-rbd=no --enable-server=no CXXFLAGS="-O0 -g" --prefix=/home/xierui/release LDFLAGS="-L/home/xierui/sandstone/ceph/thirdpart/leveldb-1.15.0  -L/home/xierui/sandstone/ceph/thirdpart/jemalloc-3.6.0/lib -L/home/xierui/sandstone/ceph/thirdpart/libs/" CFLAGS="-O0 -g"\r\n\r\n5，如果编译不过，请先编译thirdpart下的依赖包\r\n\r\n\r\n\r\n编译好rgw模块之后，替换文件（注意先关闭rgw和osd，替换好之后重启）：\r\n\r\nsrc/.libs/librgw.so.2.0.0 /var/lib/ceph/lib/librgw.so.2.0.0\r\n\r\nsrc/.libs/libcls_rgw.so /var/lib/ceph/lib/rados-classes/libcls_rgw.so\r\n\r\nsrc/.libs/radosgw /var/lib/ceph/bin/radosgw\r\n\r\nsrc/.libs/radosgw-admin /var/lib/ceph/bin/radosgw-admin\r\n\r\n\r\n\r\ndocker环境：\r\n\r\n     \r\n\r\n1，建议使用自己的dockernet网段，避免冲突。可使用docker network list， docker network inspect xx，命令查看当前的网络情况\r\n\r\n创建docker网络：docker network create --subnet=172.18.0.0/16 dockernet  \r\n\r\n注意多个站点只需要一个网段即可。其中16为子网掩码，创建的网络为后面创建容器使用\r\n\r\n\r\n\r\n\r\n2，使用mos_base1.0镜像\r\n\r\n[root@localhost ~]# docker images\r\n\r\nREPOSITORY                                                   TAG                 IMAGE ID            CREATED             SIZE\r\n\r\nmos_base1.0 \r\n\r\n\r\n3，创建容器\r\n\r\ndocker run -it --privileged=true --net dockernet --ip 172.18.0.150 -p 8050:8080 mos_base1.0 /bin/bash\r\n\r\n注意：\r\n\r\n1，网络选用自己创建的\r\n\r\n2，ip地址使用自己规划的网段\r\n\r\n3,8050是映射的主机端口，每个容器需映射自己的端口。\r\n\r\n4,8080是容器中nginx的服务端口\r\n\r\n\r\n\r\n4，配置脚本 /tmp/install.sh\r\n\r\n修改ip地址为上述定义的容器地址，IP="172.18.0.150:6789"\r\n\r\n\r\n\r\n5，配置脚本 /root/setup_zone.sh, /root/setup_slave_zone.sh 修改ip地址 以及ceph集群网段。\r\n\r\nMASTER_IP="172.18.0.150"\r\n\r\nIP="172.18.0.151" （slave rgw使用的ip地址）\r\n\r\npublic network = 172.19.0.1/24\r\n\r\ncluster network = 172.19.0.1/24\r\n\r\n\r\n\r\n6，修改ceph.conf,修改monitor ip配置：\r\n\r\nmon addr = 172.18.0.150\r\n\r\n\r\n\r\n7，创建集群\r\n\r\nsu sdsadmin "/tmp/install.sh"\r\n\r\nsbin/init-ceph start osd\r\n\r\n注：这个脚本需要用sdsadmin用户运行，另外，sdsadmin需要对/var/lib/ceph有相应权限，最好是owner改为sdsadmin\r\n\r\n\r\n\r\n8，注册license\r\n\r\n在http://10.10.30.30/ 上注册mos license\r\n\r\n使用ceph license dump命令查看集群信息，获取sn和机器码，注册。\r\n\r\nbin/ceph license register node0001 XXX（license key）\r\n\r\n\r\n\r\n8，sh /root/setup_zone.sh 配置站点\r\n\r\n\r\n\r\n9，启动rgw\r\n\r\n/var/lib/ceph/bin/radosgw --pid-file /var/lib/ceph/var/run/ceph/client.radosgw.sync_rgw1.pid -c /var/lib/ceph/etc/ceph/ceph.conf -n client.radosgw.sync_rgw1 --setuser sdsadmin --setgroup sdsadmin\r\n\r\n10，启动nginx\r\n\r\n/root/nginx/sbin/nginx -c /root/nginx/conf/rgw_nginx.conf -p /root/nginx/\r\n\r\n\r\n\r\n10，配置slave zone\r\n\r\n重复步骤3~7，注意slave容器使用新的ip。\r\n\r\n修改ceph.conf 配置slave rgw站点名字为BJ\r\n\r\n修改/root/setup_slave_zone.sh配置\r\n\r\n   MASTER_IP="172.18.0.150"\r\n\r\n   IP="172.18.0.151" （slave rgw使用的ip地址）\r\n\r\n运行sh setup_slave_zone.sh\r\n\r\n再按照9-10启动slave zone的rgw和nginx\r\n\r\n\r\n\r\n到此即完成了ceph单机集群和双活站点的配置\r\n\r\n\r\n\r\n\r\n\r\n重置环境：\r\n\r\n1，停止ceph集群\r\n\r\n/var/lib/ceph/sbin/init-ceph stop\r\n\r\n2，杀死rgw服务\r\n\r\nkillall radosgw\r\n\r\n3，重新执行su sdsadmin "/tmp/install.sh"， 启动osd\r\n\r\n4, 重新执行/root/setup_zone.sh\r\n\r\n5, 启动rgw\r\n\r\n\r\n\r\n启动容器\r\n\r\ndocker start xx\r\n\r\n进入容器\r\n\r\ndocker exec -it xx /bin/sh\r\n\r\n\r\n\r\n使用问题总结：\r\n1，容器内进程容易挂掉的问题\r\n是sdsadmin用户资源不够，修改/etc/security/limit.conf和limits.d/下面的文件中的nproc配置\r\n\r\n2，docker exec进不了容器，可尝试别的方式\r\nhttps://www.cnblogs.com/xhyan/p/6593075.html\r\n\r\n\r\n\r\n2018-11-18：\r\n构建一个rados容器，一个rgw容器，分离开来。rados容器通常无需升级。	2018-06-20 19:00:34.660382
71	1	7	第一次OKR会议总结	功能改进：\r\n1，多集群界面状态展示默认一个小时太短\r\n2，线条颜色不够清晰\r\n3，SSD使用模式改为仅支持Bcache,考虑兼容老的形式\r\n4，worm 批量删除bugfix合并可能遗漏。\r\n\r\n反应的问题：\r\n1，前期需求设计工作做的不够，评审方面应投入更多精力。\r\n   解决方法：减少资深人员开发工作量，投入更多精力在设计评审，代码review，困难问题攻关，架构看护上。\r\n\r\n2，部分特性拆分任务不够，导致没有识别出OM，数据管理系统开发任务。\r\n   解决方法：在设计文档中就应该明确各个模块的修改（更新设计文档模板），在录入任务时根据参与模块责任人列出子任务。\r\n\r\n3，研发自测试不充分，部分特性转测了仍然无法成功开始测试，存在非常明显的缺陷。\r\n   解决方法：研发特性转测步骤严格化，开发人员需提供证明其自测范围，以及效果，对自动化测试提出要求。\r\n\r\n整体来说效果还是不错的，这个会议的目的\r\n1，聚焦团队价值\r\n1，激发大家的责任感，使命感，成就感，加强团队凝聚力\r\n2，发现团队警戒信号，发现解决潜在问题。\r\n\r\n如果无法安排工作，无法确定时间，说明还没想清楚。\r\n	2018-06-15 16:01:12.439579
74	1	7	开发规范	特性开发规范：\r\n\r\n1，特性开发首先需明确需求，编写需求分析文档，确保明白所做的事，以及其边界情况。\r\n\r\n   \r\n\r\n2，需求分析文档会集中评审，测试此时介入。\r\n\r\n\r\n\r\n3，需求分析清楚后，进行特性设计，输出特性设计文档。\r\n\r\n\r\n\r\n4，特性设计文档评审，由特性责任人发起，SE，特性相关人，测试参与。\r\n\r\n\r\n\r\n5，开发阶段以及自测。输出测试用例。\r\n\r\n\r\n\r\n6，代码review，提交\r\n\r\n\r\n\r\n7，转测试，bugfix\r\n\r\n\r\n\r\n\r\n\r\n代码提交规范:\r\n\r\n1,代码提交只有两种情况，一是新增feature，二是修改bug，提交代码需带上feature或bug编号。\r\n\r\n\r\n\r\n  提交建议格式：\r\n\r\n  SHA-1: 8f35e0cc8b2a0ec52baf4f59d9b7e38955d480ee\r\n\r\n\r\n\r\n  bugfix: #487, XXX\r\n\r\n\r\n\r\n  Signed-off-by: XX <email>\r\n\r\n  Reviewed-by: \r\n\r\n\r\n\r\n  或\r\n\r\n  \r\n\r\n  SHA-1: 64eadf6fbe78f84312ebc57154ea88fb9172e745\r\n\r\n\r\n\r\n  feature : #311, XXX\r\n\r\n\r\n\r\n  Signed-off-by: XX <email>\r\n\r\n  Reviewed-by: \r\n\r\n  \r\n\r\n  编号使用redmine（后面是禅道）上对应的需求或bug编号。\r\n\r\n  请不要混淆使用feature或bugfix，是什么就填什么，优化也需要对应的单号。\r\n\r\n  \r\n\r\n\r\n\r\n2，代码提交前必须自验证\r\n\r\n\r\n\r\n  feature请提供测试清单\r\n\r\n  bugfix请说明测试方法，测试结果\r\n\r\n  \r\n\r\n\r\n\r\n3，代码review，关键代码需经过review,并在提交记录中说明Reviewed-by。\r\n\r\n\r\n\r\nbugfix规范：\r\n\r\n1，问题在发现第一时间，尽量及时定位并在问题单中说明。\r\n\r\n\r\n\r\n2，bug如果在其他发布版本存在，需同步问题单到对应版本。\r\n\r\n\r\n\r\n3，问题定位过程中的进展及时记录，以避免任务中断。\r\n\r\n\r\n\r\n4，bug修复后需自验证，问题单中需注明自验证情况。\r\n\r\n\r\n\r\n5，在每个版本上同步该bugfix	2018-06-27 11:21:04.250688
53	1	7	对象存储的理解	这就是对象的魅力所在，对象才是真正的大数据，对象打破了块分割使用的思路，同时也剪除了文件系统的巨大限制，使得海量存储成为可能。\r\n\r\n没有海量数据就没必要玩对象存储\r\n\r\n支持标准 RESTful API 接口，并提供丰富的数据在线处理服务，一站式解决互联网时代非结构化数据管理难题。\r\n\r\nrgw架构上：\r\n1，接入层\r\n负责各种协议的接入，使得对象存储可以运用于各种场景，负责应用接入等。\r\n\r\n2，表现层\r\n数据管理系统，提供一些功能，使得用户可以方便的操作数据。\r\n\r\n3，功能层\r\n提供对象各种概念的管理\r\n\r\n4，管理层\r\nom系统，管理监控整个系统\r\n\r\n5，内核层\r\nrados，提供数据存储能力。\r\n\r\n6，处理层\r\n提供数据处理能力\r\n\r\n支持异构多集群，支持使用几乎无感的数据迁移，故障切换（DNS），扩容，升级。（1人）\r\n\r\n支持隐私保护，账户管理，ldap, 权限验证，acl, ssl, worm， policy，加解密（1人）\r\n支持Qos控制，Quota控制，流量统计，优化服务质量。（1人）\r\n\r\n支持数据安全，多版本，CDP，快照，生命周期 （1人）\r\n支持高效存储，去重，压缩，EC等。（1人）\r\n\r\n\r\n维护版本的事情：\r\n支持系统内部部件的各种健康监控告警，性能监控，审计日志，性能排忧，配置优化，使用等（1人）\r\n\r\n对象存储基本功能支持，CORS，multipart，元数据检索（0.5人）\r\n支持外围接口丰富，S3 SDK，FTP，NFS等（0.5人）\r\n\r\n隐私，安全，有效，便捷，优质， 稳定可靠， 开放的存储系统。\r\n\r\n\r\n\r\n\r\n	2018-03-11 09:47:23.097892
73	1	5	GMT UTC 时间 时区	谢锐(x8671r@163.com)  11:26:05\r\nhttps://zh.wikipedia.org/wiki/ISO_8601\r\n\r\n谢锐(x8671r@163.com)  11:27:49\r\n\r\nhttps://zh.wikipedia.org/wiki/%E5%8D%8F%E8%B0%83%E4%B8%96%E7%95%8C%E6%97%B6	2018-06-27 09:01:11.529172
75	1	5	浦发提供与ceph官方修改	1、解决双活同步问题\r\n2、解决多版本在双活下同步的问题\r\n3、大量优化日志\r\n4、解决rest api请求datalog死循环问题。#20386\r\n5，解决osd故障时，没有立即发起提案，导致mon无法立即发现osd故障的问题\r\n6，修复osd df命令在新增故障域时，显示使用容量不对的问题\r\n7，修复osd在booting状态下boot失败，不重复send boot message的问题 #12693\r\n8，修复FileStore journal初始化失败的问题\r\n9，修复mon退出时挂住的问题\r\n10， 修复filestore sync超时，重启后仍然不断超时无法正常启动的问题。\r\n11， 修复osd因为机器时间跳变导致部分线程无法正常工作的问题\r\n12，修复osd之间心跳被消耗阻塞导致误判osd之间通信故障的问题\r\n13，优化osd恢复，增加新状态，避免部分pg无法恢复阻塞其他可以恢复的pg\r\n14，优化rgw bi恢复，缓解bi恢复组赛业务的问题\r\n15，解决多版本在全量同步时，因协程执行顺序的不确定导致最终版本混乱的问题\r\n16，优化pglog配置，避免osd使用内存暴涨。\r\n…\r\n\r\n\r\n1、支持iSCSI/FC接口（非对象版本），兼容传统应用访问\r\n2、支持VMWare VAAI和Hyper-V ODX(非对象版本)，加速私有云环境下的性能\r\n3、支持数据中心双写容灾\r\n4、支持跨数据中心异步复制QoS，支持分时间段的设置异步复制流量控制\r\n5、支持数据rebalance或者恢复时的QoS控制，保障业务访问性能\r\n6、支持桶快照和快照策略功能，实现桶级别快照恢复\r\n7、IO流程、元数据缓存机制优化，使得海量小文件情况下，小文件读写性能10倍以上提升；见测试报告\r\n8、支持WORM特性，支持法规遵从需求\r\n9、支持生命周期管理功能\r\n10、支持多集群统一管理功能，实现统一管理、统一监控、统一告警\r\n11、支持FTP/NFC/CIFS网关，兼容传统应用\r\n12、支持审计日志功能\r\n13、管理系统支持故障检测、故障自动隔离、磁盘\r\n14、支持ECM系统(filenet/Documentus) 利旧和统一访问\r\n15、支持文件后处理插件式框架，目前支持文档格式转换、图片处理等基础性功能\r\n	2018-06-27 13:26:12.310769
77	1	7	绩效引导意见	绩效考核引导：\r\nA：\r\n1，出色完成工作任务\r\n   开发任务：设计，代码质量，以及问题数量，完成时间，文档输出等\r\n   其他任务：根据任务实际性质评价\r\n2，在一些地方做出关键贡献\r\n\r\n关键贡献包括:\r\n1, 提出新的Idea或大的改进建议并实施，提升产品竞争力\r\n2，发现或修复重大bug，提升产品稳定性，可靠性\r\n3，提升效率，构建更好的开发以及测试平台\r\n4，支撑客户中贡献突出，促进POC和商业目标达成\r\n5，招纳优秀人才\r\n6，其他有价值的贡献\r\n\r\nB+：\r\n1，出色完成工作任务\r\n2，态度积极主动，构建良好团队氛围，积极帮助其他同事\r\n\r\nB：\r\n1，按时完成工作任务\r\n2，工作态度良好\r\n\r\nC：\r\n1，未能完成工作任务\r\n2，工作态度一般或存在恶习\r\n3，与公司文化不符或在工作中引入重大事故	2018-07-19 08:58:06.340015
78	1	7	一些工具使用问题	1，gitlab无法提交初始代码，提示：You are not allowed to push code to protected branches on this project.\r\n\r\n初看以为是SSL配置有误，再看以为是developer没权限，最终确定是只有master才能提交最初分支。\r\n然后需在项目的setting->Repository-> Protected Branches中把master分支 unprotect或设置权限\r\n\r\n\r\n\r\n2，yum确定哪个源有效\r\n使用yum list命令即可	2018-07-21 08:46:11.932748
81	1	8	问题与求解	解决问题全靠灵感？经验？显然这不科学。\r\n\r\n如何求解问题呢？	2018-08-22 06:45:56.495553
82	1	5	RAID相关	1，如何查看RAID卡类型，RAID卡有哪些规格？\r\n2，RAID卡的cache与盘的cache是什么回事，分别如何查看？\r\n3，RAID卡BBU状态怎么查看？\r\n4，RAID卡对性能的影响？	2018-09-19 13:59:07.03178
89	21	5	装修知识大梳理	装修的本质是什么？\r\n装修究竟包含了哪些工作流？\r\n如何让装修梳理进展？\r\n如何让装修效果达到自己的预想？	2019-03-18 15:37:26.61484
91	21	5	装修流程2	设计师在装修过程中可能会做哪些工作：\r\n量房拍照，收集信息\r\n协助梳理居住需求，讨论生活场景\r\n根据实际情况，确定设计构想的前瞻度\r\n与委托人配合，对各种方案思路的可行性进行验证\r\n根据双方确定的平面布置方案，进行深化设计\r\n协助控制预算，协助挑选施工方与供应商\r\n确定设计方案，列出采买清单，协助安排施工、采买、安装的时间节点\r\n开工后与施工方保持沟通，及时协商解决意外方案变动和偶发状况\r\n协助进行家具电器、灯具光源、补充配件的安装调试，以及参与其他约定的工作事项\r\n	2019-03-19 11:23:33.607488
79	1	5	面试题	1，网络 172.18.0.100/16  请说出每段的意思\r\n2，磁盘 iostat有哪些参数，各是什么意思？\r\n3，如何分析CPU压力	2018-07-31 09:27:06.960277
66	1	7	统计ceph集群的读写，性能分析	\r\n\r\nosd性能问题定位方法：将osd的日志级别开到15，osd会打印每个读写操作的日志。\r\n分析该日志文件即可得到osd节点的读写请求情况，以及延时。\r\n\r\n结论：\r\n1，在rgw cache打开的情况下，v5.1.0版本rgw会向rados发三种请求，\r\n分别是bi读，object写，bi写。其比例是1:1:1\r\n\r\n2，bi读的延时通常比bi写大，这反应了leveldb写快读慢的特点。\r\n\r\n分析方法：\r\nfor((i=1;i<18;i=i+3)); do bin/ceph --admin-daemon var/run/ceph/ceph-osd.${i}.asok config set debug_osd 15; done\r\nfor((i=1;i<18;i=i+3)); do bin/ceph --admin-daemon var/run/ceph/ceph-osd.${i}.asok config set debug_osd 1; done\r\nfor((i=1;i<18;i=i+3)); do cat var/log/ceph/ceph-osd.${i}.log | grep "log_op_stat" > oplog${i}; done\r\n\r\nobject写入：\r\nfor((i=0;i<18;i=i+3)); do cat oplog${i} | grep writefull | wc -l; done\r\nBI写入：\r\nfor((i=0;i<18;i=i+3)); do cat oplog${i} | grep complete_op | wc -l; done\r\nBI读：\r\nfor((i=0;i<18;i=i+3)); do cat oplog${i} | grep object_get | wc -l; done\r\n\r\n对写入对象大小进行分析：\r\nfor((i=0;i<18;i=i+3)); do cat oplog${i} | grep writefull | awk '{print $(NF-6)}' | awk '$1 > 512' | wc -l; done\r\n\r\n对延时进行分析：\r\n统计延时超过20ms的对象写入\r\nfor((i=0;i<18;i=i+3)); do cat oplog${i} | grep writefull | awk '{print $(NF)}' | awk '$1 > 0.200' | wc -l; done\r\n\r\n统计延时在20ms到50ms的对象写入\r\nfor((i=0;i<18;i=i+3)); do cat oplog${i} | grep writefull | awk '{print $(NF)}' | awk '$1 > 0.200  && $1 < 0.50' | wc -l; done\r\n\r\n\r\n计算延时：\r\nfor((i=0;i<18;i=i+3)); do cat oplog${i} | grep writefull | awk '{print $(NF)}' >> writefull.lat; done\r\n​awk '{sum += $1};END {print sum}' ./writefull.lat\r\n得出总耗时后除以操作个数就可以得到延时。\r\n\r\n\r\n\r\n同样可以分析bi写入和bi读操作的延时。\r\n比如：\r\n[root@wadehao ceph]# for((i=0;i<18;i=i+3)); do cat oplog${i} | grep object_get | awk '{print $(NF)}' | awk '$1 < 0.002' | wc -l; done\r\n3181\r\n3583\r\n3507\r\n3496\r\n4257\r\n4309\r\n[root@wadehao ceph]# for((i=0;i<18;i=i+3)); do cat oplog${i} | grep complete | awk '{print $(NF)}' | awk '$1 < 0.002' | wc -l; done\r\n225\r\n254\r\n190\r\n253\r\n314\r\n281\r\n\r\n通过对比可以发现，bi的写入性能比bi读取会好很多。\r\n\r\n	2018-05-30 18:09:10.908974
80	1	5	多版本与双活V5 黄金法则	多版本与同步总结：\r\n\r\n1，非多版本下操作的都是“null”版本\r\n2, 多版本下操作的都是新版本对象，删除产生delete marker\r\n3，多版本挂起下，操作都是作用于"null版本"，与非多版本区别在于其删除也会产生delete marker（"null"版本的delete marker）。\r\n\r\n4，GET/set_attr操作可以作用于current，也可以作用于具体版本，取决于客户端请求携带的version_id\r\n5，非同步操作，不产生mtime(其实是对象创建时间，在BI中对象按创建时间排序)，由bi产生。\r\n6，目前只有ACL，CORS，TAG等使用的是set_attr, 对象增加其他自定义属性操作属于PUT操作，其区别在于set_attr仅修改元数据，而PUT相当于创建一个\r\n同名的新对象，在多版本下PUT操作会产生新版本，而set_attr不会。同步的时候set_attr仅同步属性部分。\r\n\r\n对于同步：\r\n0，决定是否同步，以及哪个版本对象最新的是mtime（对象创建时间），注意不存在对象覆盖写的情况，只有修改对象属性的情况，这时会记录属性修改时间，以便于分辨master 和 slave谁的attr是最新的。\r\n1，同步操作总是作用于具体的版本，不会产生新版本，所以根据instance判断对象是否是多版本下的。“null”则是非多版本下的。\r\n3，同步对象元数据需使用bilog中的时间（修改时间），执行时与bi中attr_mtime比较决定是否执行。\r\n4，zone上的任何修改操作都需记录bilog（否则从属于该zone的其他zone无法同步数据），也需要zone_trace（否则会循环同步）\r\n5，delete marker同步也要对比时间。\r\n	2018-07-31 11:26:59.059275
85	1	7	责任划分	1，攻关疑难问题，分析产品缺陷，大的技术方案\r\n   osd问题处理\r\n\r\n2，rgw技术负责，处理rgw各种问题\r\n	2018-10-12 11:56:49.545603
84	1	7	代码提交规范	1，特性或重要bug的fix需要经过代码review，需要review的在提交信息中说明reviewed by：\r\n\r\n2，特性或bugfix的提交需提供自验证说明，问题单在单里面说明，特性在特性测试文档中说明。\r\n\r\n3，提交信息规范：\r\n\r\n    新增特性或变更，开头使用feature：\r\n\r\n    bugfix，使用 bugfix:#单号\r\n\r\n    优化，使用optimize:\r\n\r\n即提交格式如下：\r\n\r\n4，特性提交请发邮件知会特性变更情况，bugfix请在问题单中详细说明变更，以及问题复现建议等。\r\n5，squash无效提交。\r\n\r\n\r\nbugfix : #320, xxx\r\n\r\n\r\n\r\nSigned-off-by: lizhong <lizhong@szsandstone.com>\r\n\r\nReviewed-by: xierui <xierui@szsandstone.com>	2018-10-12 11:26:30.206779
93	17	7	PG内存管理	1，MemoryContext内存上下文\r\n  系统中的内存上文文形成一颗树，以便于区别管理，整体释放不同的内存。\r\n\r\n2，palloc内存分配\r\n  palloc是在当前上下文中分配内存，也可使用接口MemoryContextAlloc指定上下文分配内存。\r\n\r\n3，AllocSetContext内存管理\r\n  实现了内存池，以及buddy算法的freelist管理\r\n  \r\n参考：\r\n  https://blog.csdn.net/taochangchang/article/details/52593475\r\n  以及aset.c的注释部分\r\n\r\n4，genslab/slab 实现特定场景下的高效内存管理\r\n  2017年新增的.\r\n \r\n参考：\r\n  https://www.postgresql.org/message-id/flat/d15dff83-0b37-28ed-0809-95a5cc7292ad@2ndquadrant.com\r\n\r\n有观点认为内存管理不是当前程序的性能瓶颈，当然这是针对不同的软件来说的。\r\n实际上像ceph等涉及大量字符串创建，拷贝，小内存分配等性能影响还是非常大的。\r\n	2019-05-06 15:39:18.520563
86	1	7	mkfs参数	mkfs.xfs -f -i size=2048 /dev/sdb\r\nmkfs.xfs -f -i size=2048 -s size=4096 -b size=4096  /dev/sdb （带ssd cache）\r\nmount -o rw,nobarrier,noatime,inode64,logbsize=256K,delaylog /dev/sdb /sandstone-data/sds-15\r\nmount -o rw,noatime,inode64,logbsize=256K,delaylog	2018-10-25 17:50:32.317837
7	1	5	小文件读写慢的问题	问题原因：\r\n1，文件系统小文件增多之后，性能下降\r\n2，bucket index规模上来之后，相关的恢复，scrub都有风险。\r\n\r\nhttp://www.cnblogs.com/wuhuiyuan/p/4651698.html\r\n这篇文件介绍的方案也可以参考下。\r\n\r\n第二个问题好解决，大不了就增加bucket index，list对象的功能用的还是非常少的。\r\n还有一种牺牲的手法：遍历不保证全局有序，使用id + objectname方式遍历。\r\n\r\n*核心是保证对象不用经过元数据就可以一次性定位到。这样保证可以读性能不会下降。*\r\n\r\n*对象存储其实可以根据其整写整读的方式对store做优化。*\r\n\r\n小文件合并xsky的方案也可以与上述方案做些对比。\r\n\r\n进一步分析：\r\n1，一个文件系统能抗多少文件？\r\n2，rgw的元数据对文件读写性能的影响？\r\n3，bucket index到底多少会导致recover/backfill慢？如何设计测试用例验证?\r\n\r\nhttp://blog.csdn.net/liuaigui/article/details/9981135\r\n这篇文章有比较详细的分析。\r\n这个问题的核心应该是海量小文件导致文件系统元数据无法cache命中，海量之后本身元数据的操作开销也增加。\r\n\r\n通过增加一个中间层，将小文件合并之所以有效，主要是因为"索引文件" 可以利用cache。\r\n如果文件系统支持将元数据独立出来放到ssd，这个问题也就没了。\r\n\r\n目前有3种备选方案：\r\n1，xsky的使用一个pool先暂存，然后合并\r\n2，在filestore做合并的方案\r\n3，bluestore的方案\r\n\r\n长远看 bluestore肯定是主推方案，bluestore抛弃文件系统，可彻底解决该隐患\r\n\r\n2018-9-19:\r\n海量文件的问题本质上就是文件系统调用栈太深引起的开销问题。\r\n通过ssd缓存inode元数据的方案，可以在一定程度上缓解该问题，cache选择有intel的CAS\r\n或者改造bcache，支持仅仅缓存元数据，\r\n但是这种方案只是缓解，调用次数并未减少，调用栈仍然非常深。\r\n\r\n此外xfs的碎片管理上也存在一些问题，如果不主动做碎片整理。在大量空洞时，性能下降非常厉害。\r\n比较奇怪的是为什么在删除掉大量8kb文件时，xfs文件系统没有释放其空间？\r\n\r\n不过自己做小文件合并存在同样的问题。这问题可命名为 “gc问题”。\r\n任何空间管理的方案都要处理这个问题。\r\n\r\n2018-9-20：\r\n在rados的object上实现空间管理也有一些麻烦的地方。\r\n比如如果rgw写入数据成功，但是随后bi修改失败。则raods对象上有相关的key，可能rados对象就无法删除了。\r\n\r\n2018-10-15：\r\n独立出ssd pool，采用小文件合并方案。\r\n\r\n2018-10-17：\r\n三种方案：\r\n1，采用xsky类似方案，先写入小文件，后台合并。\r\n  多了合并操作，且在前端pool满时，可能不得不直接用小文件写后端。\r\n\r\n2，在小对象写入时，管理分配大文件空间。\r\n  这样做需考虑并发时的性能，每个对象都需在bucket shard上做一次空间分配，多了一次交互。\r\n  另外由于这种情况下空间分配与小文件的bi修改不是一个请求完成的，需额外考虑一致性问题。\r\n  并发时如何做空间分配性能更优?\r\n\r\n3，采用hash方式映射小文件到大文件，优化并发性能\r\n  hash扩展麻烦，后续要支持bucket海量数据。\r\n  gc操作无法合并大文件，只能清理无效和释放的对象空间。\r\n\r\n4，hash方式映射小文件到大文件，且空间分配在rados完成，通过cls实现。大对象在BI中记录有哪些小对象。以及操作信息方便gc。\r\n  增强了与rados的耦合\r\n  \r\n\r\n不论哪种方案，应该坚持元数据以BI为准的原则，即对象是否存在，rados空间是否有效以bucket index为准，否则就与当前设计冲突了。\r\n小文件上可记录到大文件的映射(prefix,offset,len)，避免读对象增加一次rados请求。\r\n大对象的bi上应该记录有哪些小文件，以方便实现gc。\r\n\r\nSSD和HDD独立建pool，不仅降低了硬件的耦合，使用上也更加灵活。\r\n\r\n2018.10.26：\r\n在使用bcache做元数据缓存之后，仍然需要做小文件合并的原因：\r\n1，降低硬件耦合，SSD故障不会影响到所有相关的HDD\r\n2，使用大文件，恢复和scrub等速度更快\r\n3，在POC测试时更加灵活(目前bcache使用并未缓存数据)\r\n4，即便在使用bcache情况下，xfs在写入后大量删除时，仍然会出现性能抖动厉害的问题，kworker占用内存暴涨。\r\n\r\n由于在IO路径上做空间管理的复杂度较高，且会增加一次写操作(空间分配)，性能受到影响。\r\n所以目前考虑采用类似xsky的方案，优先写入SSD，然后在后端进行合并。\r\n\r\n由于MOS并不存在对象的覆盖写入，所以对于单个对象修改的原子性没有要求，且可保证在合并之后的pool\r\n写入的对象是超过1MB的，因而V3 AgileStore是可以满足要求的(几个rgw的元数据池除外)。\r\n\r\n实际实现的时候gc是需要重点考虑的，gc的offload，降低rgw与osd之间的带宽消耗。\r\n后续会出具体实现方案，做下一次的细节讨论。\r\n	2017-10-10 08:09:50.065915
87	12	7	成长脚印	震哥小朋友最近有些便秘	2018-11-28 11:40:07.701975
90	21	5	装修流程1	室内设计，必须是基于真实需求，从现实条件的制约中去组合调配设计要素，并最终做出权衡取舍\r\n我们可以用温度、气味、触觉来评判居家环境，必要的时候，我们甚至可以假装自己是失聪者，用触觉、嗅觉、听觉、皮肤感觉来感受居室空间的动线情况、声音分布、空气流通、物品摆放、以及用身体的移动来感受动线走向\r\n\r\n\r\n花点时间了解一下自己的生活习惯，看看这些习惯中，哪些是因为条件所限，被迫潜移默化形成到的，哪些是因为自己觉得舒服自在而长久保持的\r\n装修过程中，你需要投入多少资金预算和时间精力，有相当一部分因素，在你选房买房的阶段就已经决定了\r\n楼位和户型朝向\r\n是否有外墙保温层\r\n入户门品质\r\n窗户是中空玻璃平开窗（包括内开内倒窗）还是单层玻璃推拉窗\r\n晴天正午阳光直射区域及有效直射的时长\r\n以上会影响到家中夏季空调耗电读书、冬季供暖期室内实际温度，房间的落灰层度、客厅和卧室隔离户外噪音的情况，从而在不经意间影响到实际生活品质\r\n\r\n\r\n\r\n装修的主要工序：\r\n拆除清运\r\n水电管线改造及完工确认\r\n墙体新砌及坑洞补平\r\n防水施工及闭水试验\r\n瓷砖铺贴及地面找平\r\n石膏板吊顶及轻质隔墙施工、其他现场木作\r\n墙面基层处理\r\n室内门及门套的现场制作或厂家定制\r\n柜体制作或厂家定制（包括橱柜）\r\n喷刷墙漆\r\n厨卫及阳台吊顶（除石膏板吊顶外的其他做法）\r\n安装室内门\r\n铺贴壁纸壁布\r\n铺设地板与踢脚线\r\n安装合金推拉门\r\n安装开关面板\r\n安装定制家具和相关电器设施\r\n调试安装灯具光源\r\n安装卫浴洁具\r\n安装窗帘轨道及窗帘布\r\n其他定制采购部件的协调安装等\r\n添置其他软装陈设及花卉绿植\r\n\r\n\r\n入住预算：指最终入职之前的最大入住预算，这不仅包括自购的基础建材、建材辅料、装饰建材。还包括水、电、网、气、风、暖设施，成品家具及配套产品、定制家具和其他定制产品、普通家用电器、只能家具硬件、五金配件、卫浴洁具、开关面板和灯具电料、软装陈设等，以及施工安装费用、设计费、灯具和洁具安装费用、物业押金和其他杂费等\r\n\r\n也就是说，在设定预算时，需要把乔迁之前的所有费用都先考虑进去，得到一个现阶段能拿得出的预算的最大值\r\n	2019-03-19 11:17:04.196985
76	1	7	rgw改造 V5	ceph rgw存在如下问题：\r\n1. BI使用rados对象保存，不支持增量恢复，在故障恢复时影响可用性 （使用backfill恢复机制后暂时得到缓解）\r\n2. 不能很好的支持bucket跨故障域和多集群,扩展性受限。 异构集群，冷热pool等。\r\n    bucket与pool绑定，在扩展性和使用的灵活性上存在限制。\r\n3. 海量小文件直接使用rados存储代价太大。\r\n4，多版本，multisite等特性复杂度不合适（非常重要，这决定了后续大量特性开发的复杂度）\r\n5，无法支持高效的list操作\r\n6，rgw put写放大，尤其是在多版本情况下。\r\n\r\n\r\n为了解决上述问题，考虑调整rgw架构：\r\n1，BI作为单独的一层，而不仅是实现bucket list，以及统计功能的附属。\r\n     BI作为对象的元数据存储，可以使用rados，也可以使用其他数据库（以优化问题1，5)\r\n     在此基础上实现小文件合并也相对容易 （问题3）\r\n     \r\n2，底层采用多版本机制，统一非多版本bucket与多版本bucket的实现，简化逻辑。\r\n     针对上述问题4，6\r\n\r\n但是bs的方式不变更，问题5无法彻底解决，bs的方式变更则同步逻辑需要大调整。\r\n\r\n底层数据组织方式决定了架构。\r\n\r\n\r\n2019.4.16:\r\n\r\n1/3/5都没在v5优化，还有昨天讨论的，非多版本pool的读写混合性能。解耦那时候还没提，后来越发觉得解耦是必须选项，以及多站点的重构	2018-06-27 14:08:29.214836
\.


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.documents_id_seq', 93, true);


--
-- Data for Name: email_addresses; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.email_addresses (id, user_id, address, is_default, notify, created_on, updated_on) FROM stdin;
1	1	jerry.xr86@gmail.com	t	t	2017-09-08 09:19:08.687057	2017-09-08 10:11:30.693949
2	5	x8671r@163.com	t	t	2017-09-08 13:40:38.745192	2017-09-08 13:40:38.745192
3	6	hudongyin@126.com	t	t	2018-11-02 21:03:05.65764	2018-11-02 21:04:07.791254
\.


--
-- Name: email_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.email_addresses_id_seq', 3, true);


--
-- Data for Name: enabled_modules; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.enabled_modules (id, project_id, name) FROM stdin;
1	1	issue_tracking
2	1	time_tracking
3	1	news
4	1	documents
5	1	files
6	1	wiki
7	1	repository
8	1	boards
9	1	calendar
10	1	gantt
11	2	issue_tracking
12	2	time_tracking
13	2	news
14	2	documents
15	2	files
16	2	wiki
17	2	repository
18	2	boards
19	2	calendar
20	2	gantt
21	3	issue_tracking
22	3	documents
23	3	repository
24	4	issue_tracking
25	4	documents
26	4	files
27	4	calendar
28	5	issue_tracking
31	5	documents
38	6	issue_tracking
39	6	documents
40	7	issue_tracking
41	7	documents
42	7	files
43	8	issue_tracking
44	8	documents
45	9	issue_tracking
46	9	documents
47	10	issue_tracking
48	10	documents
49	11	issue_tracking
50	11	documents
51	12	issue_tracking
52	12	documents
65	15	issue_tracking
66	16	issue_tracking
67	16	time_tracking
68	16	documents
69	16	calendar
70	17	issue_tracking
71	17	documents
72	18	issue_tracking
73	19	issue_tracking
74	19	time_tracking
75	19	news
76	19	documents
77	19	files
78	19	wiki
79	19	repository
80	19	boards
81	19	calendar
82	19	gantt
83	20	issue_tracking
84	20	news
85	20	documents
86	20	files
87	20	wiki
88	20	repository
89	20	boards
90	20	calendar
91	20	gantt
92	21	documents
93	21	files
104	23	issue_tracking
105	23	documents
106	21	issue_tracking
\.


--
-- Name: enabled_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.enabled_modules_id_seq', 106, true);


--
-- Data for Name: enumerations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) FROM stdin;
1	超高	1	f	IssuePriority	t	\N	\N	lowest
2	高	2	f	IssuePriority	t	\N	\N	low2
3	中	3	t	IssuePriority	t	\N	\N	default
4	低	4	f	IssuePriority	t	\N	\N	highest
5	FAQ	1	f	DocumentCategory	t	\N	\N	\N
6	代码注解	2	f	DocumentCategory	t	\N	\N	\N
8	Idea	4	f	DocumentCategory	t	\N	\N	\N
7	doc	3	f	DocumentCategory	t	\N	\N	\N
\.


--
-- Name: enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.enumerations_id_seq', 8, true);


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.groups_users (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: import_items; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.import_items (id, import_id, "position", obj_id, message) FROM stdin;
\.


--
-- Name: import_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.import_items_id_seq', 1, false);


--
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.imports (id, type, user_id, filename, settings, total_items, finished, created_at, updated_at) FROM stdin;
\.


--
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.imports_id_seq', 1, false);


--
-- Data for Name: issue_categories; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.issue_categories (id, project_id, name, assigned_to_id) FROM stdin;
1	1	RGW	5
2	1	RBD	\N
3	1	OSD	\N
4	1	elk	\N
5	1	rgw_object_versions	\N
6	1	multisite	\N
7	1	每日任务	\N
8	1	docker	\N
9	1	网络	\N
10	1	硬件	\N
11	1	运维	\N
12	5	经济	\N
13	5	政治	\N
14	5	法律	\N
15	5	文学	\N
16	5	历史	\N
17	11	黑玛亚	\N
18	12	记录点滴	\N
20	7	网络	\N
21	7	计算	\N
22	7	存储	\N
23	7	算法	\N
24	19	4月家庭会议主题确定	\N
\.


--
-- Name: issue_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.issue_categories_id_seq', 24, true);


--
-- Data for Name: issue_relations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.issue_relations (id, issue_from_id, issue_to_id, relation_type, delay) FROM stdin;
1	26	27	copied_to	\N
2	438	465	relates	\N
3	466	439	relates	\N
\.


--
-- Name: issue_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.issue_relations_id_seq', 3, true);


--
-- Data for Name: issue_statuses; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.issue_statuses (id, name, is_closed, "position", default_done_ratio) FROM stdin;
1	打开	f	1	\N
3	Need More Info	f	2	\N
4	In Progress	f	3	\N
6	Need Review	f	4	\N
7	Need Test	f	5	\N
8	Testing	f	6	\N
9	Pending Backport	t	7	\N
10	Pending Upstream	t	8	\N
11	Resolved	t	9	\N
12	Closed	t	10	\N
13	Rejected	t	11	\N
14	Won't Fix	t	12	\N
15	Can't reproduce	t	13	\N
16	Duplicate	t	14	\N
17	New	f	15	\N
18	Verified	f	16	\N
19	目标	f	17	\N
20	问题	f	18	\N
21	分析	f	19	\N
22	方案	f	20	\N
23	实施	f	21	\N
24	总结	t	22	\N
\.


--
-- Name: issue_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.issue_statuses_id_seq', 24, true);


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) FROM stdin;
407	6	21	关于装修的思考	装修的本质是什么？\r\n装修究竟包含了哪些工作流？\r\n如何让装修梳理进展？\r\n如何让装修效果达到自己的预想？\r\n	\N	\N	17	\N	3	\N	6	0	2019-05-22 04:13:26.522948	2019-05-22 04:13:26.522948	2019-05-22	0	\N	\N	407	1	2	f	\N
46	5	1	http://tracker.ceph.com/issues/20728	\N	\N	\N	17	\N	3	\N	5	0	2017-11-28 21:55:19.147402	2017-11-28 21:55:19.147402	2017-11-28	0	\N	\N	46	1	2	f	\N
39	7	1	海量小文件问题	bluestore本身没有海量小文件问题了，但是需要缩减其元数据规模，根据对象存储特征优化bluestore layout。	\N	1	17	5	3	4	5	7	2017-11-20 07:29:48.851521	2019-03-08 14:32:27.441898	2017-11-20	0	\N	\N	39	1	2	f	\N
30	3	1	cloudberry或s3browser增加http headers成功，但是底下什么都没	172.18.0.1 - - [31/Oct/2017:08:47:07 +0000] "PUT /xx1/bbbb.txt HTTP/1.1" 200 194 "-" "CloudBerryLab.Base.HttpUtil.Client 5.0.3 (http://www.cloudberrylab.com/)" "-"\r\n\r\n操作成功后，那一会能看到新增的http header，但是刷新下就没了。\r\n\r\n非常奇怪。	\N	1	14	5	3	3	5	2	2017-10-31 14:32:39.616019	2017-10-31 14:51:47.090629	2017-10-31	0	\N	\N	30	1	2	f	2017-10-31 14:51:47.090629
55	7	1	本周任务	1，完成已有bugfix\r\n2，license合入\r\n3，分析同步那块改进方案。彻底剪除隐患。	\N	\N	19	\N	3	\N	5	0	2018-01-29 07:12:56.625761	2018-01-29 07:12:56.625761	2018-01-29	0	\N	\N	55	1	2	f	\N
313	6	19	4月周末活动安排	发起活动建议，协调家庭成员的时间，促成各项家庭亲子活动的开展	\N	\N	17	\N	3	\N	6	1	2019-03-18 07:42:00.544156	2019-03-18 08:15:55.484395	2019-03-18	0	\N	\N	313	1	2	f	\N
31	3	1	多版本bucket的对象acl无法修改成功	在s3browser操作，apply change之后reload，权限还原成默认的。	\N	1	16	5	3	3	5	3	2017-10-31 14:56:41.285835	2017-11-08 13:27:27.529744	2017-10-31	0	\N	\N	31	1	2	f	2017-11-08 13:27:27.529744
27	3	1	object tag的v4鉴权失败	put_tag () {\r\n    bucket=/$1\r\n    resource=/$2\r\n    tagdata=$3\r\n    dateValue="`TZ=GMT date +'%a, %d %b %Y %H:%M:%S GMT'`"\r\n    stringToSign="PUT\\n\\napplication/x-www-form-urlencoded\\n${dateValue}\\n${bucket}${resource}?tagging"\r\n    echo $stringToSign\r\n    #stringToSign="PUT\\n\\n\\n${dateValue}\\n${bucket}${resource}?tagging"\r\n    signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${Key} -binary | base64`\r\n    url="http://${host}${bucket}${resource}?tagging"\r\n    echo "put tag begin"\r\n    echo "curl -L -i -v  -X PUT -H "Date: ${dateValue}" -H "Authorization: AWS ${Id}:${signature}" "${url}" -d $tagdata"\r\n    #curl -L -i -v  -X PUT -H "Date: ${dateValue}" -H "Authorization: AWS ${Id}:${signature}" "${url}" --data-urlencode "$tagdata"\r\n    curl -L -i -v  -X PUT -H "Date: ${dateValue}" -H "Authorization: AWS ${Id}:${signature}" "${url}" -d "$tagdata"\r\n    echo "put tag end"\r\n}\r\n\r\n当前版本采用v4鉴权会报501 not implemented	\N	1	17	5	3	5	5	2	2017-10-26 07:06:57.306928	2017-11-14 15:05:00.913332	2017-10-25	0	\N	\N	27	1	2	f	\N
59	8	1	http数据包会分片吗？	http数据包格式	\N	9	17	\N	3	\N	5	1	2018-02-28 07:26:21.749419	2018-02-28 08:18:42.135861	\N	0	\N	\N	59	1	2	f	\N
37	7	1	tag支持按照key来检索	tag多个key，搜key或者value都能搜到。\r\nes可以感知其格式么	\N	1	17	5	3	4	5	0	2017-11-14 15:23:46.871555	2017-11-14 15:23:46.871555	2017-11-14	0	\N	\N	37	1	2	f	\N
147	6	11	test	11	\N	\N	17	\N	3	\N	6	0	2018-11-03 13:32:25.073924	2018-11-03 13:32:25.073924	2018-11-03	0	\N	\N	147	1	2	f	\N
146	6	11	成就最美好的自己	深度阅读，思考从哪些方面成就最美好的自己，写下自己的感悟！	\N	\N	17	\N	3	\N	6	16	2018-11-03 12:13:58.283714	2018-11-28 08:41:59.040571	2018-11-03	0	\N	\N	146	1	2	f	\N
7	7	1	merge fron ceph luminous	迁移到ceph luminous版本，使用es特性。\r\n使用一种方法管理之前的fix，将之前的fix迁移到该版本。	\N	\N	17	\N	3	2	5	0	2017-09-12 07:44:06.528383	2017-09-12 07:44:06.528383	2017-09-12	0	\N	\N	7	1	2	f	\N
38	3	1	多版本删除最终不同步	陈乐  17:14:34\r\n复现步骤：\r\n在master端操作：\r\n1）未开启多版本时上传对象ab；\r\n2）开启多版本后，上传两个版本的ab对象；\r\n3）暂停多版本，删除当前对象列表中的ab对象（不带版本号）；\r\n4）开启多版本，删除多版本列表中所有版本的ab对象（带版本号）；\r\n5）查看bucket的对象列表，ab已被清除；\r\n在slave端查看：\r\n6）查看slave端对象列表：ab对象在对象列表中存在；\r\n陈乐  17:15:38\r\n测试的时候发现第4步没同步到slave	\N	1	4	5	2	5	5	7	2017-11-15 14:47:30.204834	2017-11-20 08:21:28.163894	2017-11-15	0	\N	\N	38	1	2	f	\N
408	6	21	设计一个家读书思考	寻找对自己有启发的知识点	\N	\N	17	\N	3	\N	6	3	2019-05-22 04:15:02.273349	2019-05-22 04:32:20.163261	2019-05-22	0	\N	\N	408	1	2	f	\N
441	6	15	改善球路	http://www.badmintoncn.com/view-8014-1.html	\N	\N	17	\N	3	\N	5	0	2019-06-06 11:50:13.594172	2019-06-06 11:50:13.594172	2019-06-06	0	\N	\N	441	1	2	f	\N
5	3	1	data sync一直显示未完成	"data_sync": [\r\n\r\n        {\r\n\r\n            "zone_name": "machang_master",\r\n\r\n            "zone_id": "b8b24847-9843-4d6f-a9be-f64a2e2baeff",\r\n\r\n            "retrieve_sync_info": "true",\r\n\r\n            "read_sync_status": "true",\r\n\r\n            "sync_status": "syncing",\r\n\r\n            "prepare_full_sync": 0,\r\n\r\n            "all_full_sync": 128,\r\n\r\n            "full_entry_sync": 0,\r\n\r\n            "prepare_incremental_sync": 128,\r\n\r\n            "all_incremental_sync": 128,\r\n\r\n            "fetch_local_sync": "true",\r\n\r\n            "fetch_source_sync": "true",\r\n\r\n            "data_sync_status": "sync",\r\n\r\n            "data_sync_num": 1,\r\n\r\n            "not_applied": "2017-09-06 16:02:59.0.518687s"\r\n\r\n        }\r\n\r\n    ]\r\n\r\n其他现象：\r\nrgw data sync的线程占用CPU接近100%\r\n打开日志疯狂打“[inc sync] can't do op”\r\n\r\n通过cr dump，以及gdb可以看到rgw卡在\r\n<pre><code class="cpp">\r\n        //遇到冲突的情况\r\n\t//这里出现死循环了\r\n        while (!marker_tracker->can_do_op(key) && (sync_status == 0)) {\r\n          if (!updated_status) {\r\n            set_status() << "can't do op, conflicting inflight operation";\r\n            updated_status = true;\r\n          }\r\n          ldout(sync_env->cct, 5) << *this << ": [inc sync] can't do op on key=" << key << " need to wait for conflicting operation to complete" << dendl;\r\n\t  yield wait_for_child();\r\n          bool again = true;\r\n          while (again) {\r\n            again = collect(&ret, lease_stack);\r\n            if (ret < 0) {\r\n              ldout(sync_env->cct, 0) << "ERROR: a child operation returned error (ret=" << ret << ")" << dendl;\r\n              sync_status = ret;\r\n              /* we have reported this error */\r\n            }\r\n          }\r\n        }\r\n</code></pre>\r\n\r\n\r\n进一步分析：\r\n发现RGWBucketShardIncrementalSyncCR的spwan stack都完成了，只有一个lease stack。\r\n但是上面的while循环无法结束。\r\n\r\nhttp://tracker.ceph.com/issues/21285\r\n	\N	1	10	5	3	1	5	6	2017-09-10 12:27:34.237984	2017-09-11 20:34:30.822345	2017-09-10	0	\N	\N	5	1	2	f	2017-09-11 20:34:12.778708
3	3	1	丢包严重时，bucket sync hang，没法完成同步。	http://tracker.ceph.com/issues/21256\r\n\r\n	\N	1	10	5	2	1	5	6	2017-09-10 11:58:40.934571	2017-09-11 11:53:15.270394	2017-09-10	0	\N	\N	3	1	2	f	2017-09-11 11:53:01.169948
442	6	17	PG vacuum	vacuum涉及面非常广，也算是pg比较伤的一个地方	\N	\N	17	\N	3	\N	5	7	2019-06-06 14:13:48.47508	2019-07-18 16:23:43.706735	2019-06-06	0	\N	\N	442	1	2	f	\N
6	6	1	RGWCoroutinesStack::collect 返回值	该函数返回值done，完全反应不了是否children都完成了，如果spawned是空了，像这些地方不是会死循环么？\r\n\r\n<pre><code class="cpp">\r\nwhile (num_spawned() > (size_t)num_cr_left) {\r\n      yield wait_for_child();\r\n      int ret;\r\n      while (collect(&ret, skip_stack)) {\r\n        if (ret < 0) {\r\n          ldout(cct, 10) << "collect() returned ret=" << ret << dendl;\r\n          /* we should have reported this error */\r\n          log_error() << "ERROR: collect() returned error (ret=" << ret << ")";\r\n        }\r\n      }\r\n    }\r\n</code></pre>\r\n	\N	1	17	5	3	\N	5	0	2017-09-11 13:37:33.185479	2017-09-11 13:37:33.185479	2017-09-11	0	\N	\N	6	1	2	f	\N
443	8	7	数据的形态变化，数据库的未来		\N	\N	17	\N	3	\N	5	0	2019-06-10 06:59:44.857728	2019-06-10 06:59:44.857728	\N	0	\N	\N	443	1	2	f	\N
8	3	1	s3fs can not show directory create by s3browser, but can show cloudberry.	s3fs挂载后无法正常显示目录	\N	1	8	5	3	\N	5	6	2017-09-12 13:57:56.123901	2017-09-12 19:49:50.525764	2017-09-12	0	\N	\N	8	1	2	f	\N
9	7	1	rgw cors usage	(gdb) p *s->cio\r\n$37 = {_vptr.RGWClientIO = 0x7f5e892798f0 <vtable for RGWFCGX+16>, _account = false, env = {env_map = std::map with 30 elements = {["CONTENT_LENGTH"] = "", ["CONTENT_TYPE"] = "", \r\n      ["DOCUMENT_ROOT"] = "/var/lib/ceph/nginx/html", ["DOCUMENT_URI"] = "/", ["FCGI_ROLE"] = "RESPONDER", ["GATEWAY_INTERFACE"] = "CGI/1.1", ["HTTP_ACCEPT"] = "*/*", \r\n      ["HTTP_ACCEPT_ENCODING"] = "gzip,deflate,sdch", ["HTTP_ACCEPT_LANGUAGE"] = "zh-CN,zh;q=0.8", \r\n      ["HTTP_ACCESS_CONTROL_REQUEST_HEADERS"] = "x-amz-content-sha256, x-amz-user-agent, x-amz-date, authorization", ["HTTP_ACCESS_CONTROL_REQUEST_METHOD"] = "GET", \r\n      ["HTTP_HOST"] = "10.10.7.83:5656", ["HTTP_ORIGIN"] = "http://10.10.7.83:6690", ["HTTP_PROXY_CONNECTION"] = "keep-alive", ["HTTP_REFERER"] = "http://10.10.7.83:6690/sdsomdata/", \r\n      ["HTTP_USER_AGENT"] = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36", ["HTTP_X_LANTERN_VERSION"] = "3.7.4", \r\n      ["QUERY_STRING"] = "", ["REDIRECT_STATUS"] = "200", ["REMOTE_ADDR"] = "10.10.200.103", ["REMOTE_PORT"] = "56849", ["REQUEST_METHOD"] = "OPTIONS", ["REQUEST_SCHEME"] = "http", \r\n      ["REQUEST_URI"] = "/", ["SCRIPT_NAME"] = "/", ["SERVER_ADDR"] = "10.10.7.83", ["SERVER_NAME"] = "", ["SERVER_PORT"] = "5656", ["SERVER_PROTOCOL"] = "HTTP/1.1", \r\n      ["SERVER_SOFTWARE"] = "nginx/1.9.15"}, conf = 0x7f5e68a1d1d0}}\r\n\r\nhow to set cors for js	\N	\N	17	5	3	2	5	1	2017-09-14 16:01:49.62542	2017-09-14 16:02:19.512055	2017-09-14	0	\N	\N	9	1	2	f	\N
18	7	1	PR特性合入jewel	jewel版本watch/notify机制变化了，这块需要研究清楚，然后调整下\r\n\r\npr需要提供接口给RBD，rbd通过命令操作。\r\n\r\n保留测试用例。\r\n\r\n\r\n这是一件蛋疼的事，监控系统尽量保持独立比较好。监控系统不应该因为存储故障收到影响。\r\n监控系统最好是一个多活的系统，其可靠性应该跟mon类似，非常适合使用paxos类协议构建。	\N	2	4	\N	3	\N	5	6	2017-10-16 09:17:47.571554	2017-10-18 15:36:26.364654	2017-10-16	0	\N	\N	18	1	2	f	\N
10	7	1	华为的ceph（hammer）环境请求超时问题	业务场景：\r\n客户使用800并发发送head和get请求。\r\n\r\n现象：\r\ncivetweb发送消息时返回EIO，最终http错误码是500\r\nrgw堆栈有466个vivetweb的call back，其中440个是在send函数上。\r\n也就是说大量的请求都在给客户端发送消息上。\r\n\r\n疑问：\r\n1，大量请求卡在给客户端的send函数，是否是因为超时，网络断了，但是rgw仍然sb的在发送？\r\n那这样就不能证明是civetweb发送慢\r\n\r\n2，civetweb比nginx慢的根因是什么？ 慢多少？ 该如何调优？\r\n\r\n3，大量卡在send，而不是给rados发送请求后的等待是否能说明，send存在瓶颈？	\N	\N	17	5	1	\N	5	5	2017-09-25 07:57:46.876645	2017-09-26 15:58:56.646846	2017-09-25	0	\N	\N	10	1	2	f	\N
32	3	1	特殊字符作为key的标签，能写入成功，但es无法检索到	从web界面操作的。\r\n\r\nkey:_1001\r\nvalue: @groupzine\r\n\r\n类似这种	\N	4	17	5	3	4	5	0	2017-11-02 06:50:52.309885	2017-11-02 06:50:52.309885	2017-11-02	0	\N	\N	32	1	2	f	\N
278	7	17	了解firebase 和 snowflake架构		\N	\N	19	\N	3	\N	5	0	2019-02-20 08:46:17.05383	2019-02-20 08:46:17.05383	2019-02-20	0	\N	\N	278	1	2	f	\N
11	3	1	osd scrub时间超长，无法完成	OSD::_committed_osd_maps等待pg锁\r\nosd tick无法获取锁\r\n出现900s超时，osd被down，但进程仍然在。\r\n\r\nbucket 一共780万对象，64个shard。	\N	\N	17	\N	3	1	5	2	2017-09-29 12:19:58.76523	2017-09-30 07:34:39.766652	2017-09-29	0	\N	\N	11	1	2	f	\N
47	7	1	slave zone请求增加审计日志 	提高可运维性。	\N	1	17	5	3	4	5	1	2017-12-29 22:41:52.435812	2017-12-29 22:51:39.431041	2017-12-29	0	\N	\N	47	1	2	f	\N
19	3	1	rgw 无法同步多版本对象		\N	1	11	5	3	1	5	5	2017-10-17 12:48:05.073588	2017-10-19 14:08:52.88303	2017-10-17	0	\N	\N	19	1	2	f	2017-10-19 14:08:52.88303
14	3	1	rgw zone修改endpoint不生效	在创建es zone时，忘了带endpoint参数，使用modify命令无法添加endpoint\r\n\r\nbin/radosgw-admin zone modify --rgw-zone=SZES endpoints=http://172.18.0.130:8082	\N	\N	11	5	3	1	5	2	2017-10-11 07:29:12.61125	2017-10-11 07:35:08.967692	2017-10-11	0	\N	\N	14	1	2	f	2017-10-11 07:35:08.967692
25	4	1	支持审计日志功能	\N	\N	\N	4	\N	3	3	5	7	2017-10-24 14:50:25.232587	2018-01-18 07:31:20.153683	2017-10-24	0	\N	\N	25	1	2	f	\N
12	3	1	目录下的对象元数据es同步失败	很容易复现	\N	\N	8	5	3	1	5	5	2017-09-30 15:15:32.852798	2017-10-10 11:50:36.723792	2017-09-30	0	\N	\N	12	1	2	f	\N
17	7	1	共享桶对共享用户不可见	http://s3browser.com/bucket-sharing-tutorial.aspx\r\n\r\n谢锐(x8671r@163.com)  15:20:20\r\n@董雷  我们版本不支持bucket policy，要实现共享用户bucket可见还得额外处理。 s3browser和cloudberry都是用external bucket的方式实现的。\r\n董雷(836444522)  15:24:37\r\n嗯嗯 那共享桶这个功能在月底出的版本隐藏掉吗\r\n谢锐(x8671r@163.com)  15:31:04\r\n这个要讨论下 如果这个版本没有人用这功能 我觉得可以隐藏掉 \r\n可以在后面的版本 通过bucket policy的方式实现\r\n董雷(836444522)  15:32:06\r\nL版本支持bucket policy了吗\r\n谢锐(x8671r@163.com)  15:33:36\r\nL版本开始部分支持了 \r\nListBucket在L版本支持的	\N	1	4	5	3	1	5	1	2017-10-13 13:06:50.195323	2017-10-13 13:07:12.091753	2017-10-13	0	\N	\N	17	1	2	f	\N
15	7	1	2017-10-11 任务清单	1，支持数据管理，es检索\r\n2，支持ftp\r\n3，支持es\r\n4，分析multisite同步速度，能否压缩优化等。	\N	\N	17	\N	3	\N	5	1	2017-10-11 09:10:14.309459	2017-10-13 13:08:55.204536	2017-10-11	0	\N	\N	15	1	2	f	\N
22	7	1	多版本如何将对象设置为某个版本？	使用copy？\r\n还是get，然后put？	\N	\N	4	\N	3	\N	5	1	2017-10-23 07:58:05.332904	2017-10-24 14:41:53.673935	2017-10-23	0	\N	\N	22	1	2	f	\N
64	3	1	xx问题	xx	\N	\N	4	\N	3	\N	5	0	2018-03-05 13:14:21.236066	2018-03-05 13:14:21.236066	2018-03-05	20	\N	61	61	8	9	f	\N
24	7	1	s3 copy鉴权	ceph rgw日志输出：\r\n\r\n2017-10-24 04:01:01.353844 7f6c35bf3700 10 auth_hdr:\r\nPUT\r\n\r\n\r\nTue, 24 Oct 2017 04:01:01 GMT\r\nx-amz-copy-source:/xx1/abc.jpg\r\n/testv/abc.jpg\r\n\r\n看来x-amz-copy-source 需要加入鉴权的	\N	\N	12	\N	3	3	5	4	2017-10-24 09:46:09.745277	2017-10-26 07:35:03.895416	2017-10-24	0	\N	\N	24	1	2	f	2017-10-24 13:38:42.595784
33	3	1	rgw超时，无法响应请求	@陈乐  rgw堆栈看非常乱 应该是踩内存导致锁结构破坏了，我先把堆栈保留下来。这问题还是第一次出现，不知道跟黎忠那块有没关系，等他改好之后再留意下	\N	1	17	5	3	3	5	0	2017-11-02 09:11:25.341203	2017-11-02 09:11:25.341203	2017-11-02	0	\N	\N	33	1	2	f	\N
62	7	1	任务分解1		\N	\N	19	\N	3	\N	5	2	2018-03-05 12:59:29.575307	2018-03-12 07:12:15.962752	2018-03-12	0	\N	61	61	2	5	f	\N
61	4	1	example	\N	\N	\N	17	\N	3	\N	5	3	2018-03-05 12:58:28.369002	2018-03-12 07:12:15.999709	2018-03-05	7	\N	\N	61	1	10	f	\N
67	3	1	监控mon的使用空间	mon 的空间使用情况是可以评估的，多出的部分需要给出合理解释。\r\n\r\n现场环境出现db猛涨的情况，一天增加了30GB。	\N	\N	17	\N	3	\N	5	0	2018-03-18 20:46:29.835988	2018-03-18 20:46:29.835988	2018-03-18	0	\N	\N	67	1	2	f	\N
68	3	1	如何判断服务器硬盘是否启用raid？	多块磁盘的时候，没有raid会怎么样？\r\nraid和controller的关系？	\N	10	17	5	3	\N	5	0	2018-03-25 13:18:38.691563	2018-03-25 13:18:38.691563	2018-03-25	0	\N	\N	68	1	2	f	\N
42	3	1	多版本同步删除null instance同步失败	测试方法：\r\n1，开启多版本，上传对象2次\r\n2，关闭多版本，上传同一对象一次\r\n3，删除null版本\r\n4，再次上传对象\r\n5，删除null版本\r\n\r\n这次slave zone删除null版本失败。	\N	\N	17	\N	3	\N	5	2	2017-11-23 14:04:58.11104	2017-11-24 19:49:00.637251	2017-11-23	0	\N	\N	42	1	2	f	\N
76	3	1	2018.6.19 （BI改造）	本周聚焦两件事：\r\n1，继续研发V5 demo\r\n2，招聘	\N	\N	17	5	3	\N	5	42	2018-06-19 06:49:59.288249	2019-04-28 07:30:40.817942	2018-06-19	0	\N	\N	76	1	2	f	\N
23	4	1	合入license功能	\N	\N	\N	17	\N	3	1	5	3	2017-10-23 12:58:52.68589	2018-01-18 07:31:48.96399	2017-10-23	0	\N	\N	23	1	2	f	\N
16	7	1	深交所需求痛点	深交所需要在北京，上海，深圳多地同步一些公告文件等，对同步的及时性有点要求，并且走的是公网。\r\n\r\n目前rgw同步是通知方式，但是通知可能出现丢失的情况。\r\n这时就得依赖于定时机制来获取data log。\r\n\r\n文件压缩传输是否有必要？	\N	1	17	5	3	1	5	1	2017-10-11 12:38:58.068347	2017-10-11 13:21:34.457975	2017-10-11	0	\N	\N	16	1	2	f	\N
71	7	1	2018.5.14	1，story合并代码 （重要不紧急）\r\n2，解决广发问题（重要紧急）\r\n3，3.1.5归档\r\n4，补充开工材料\r\n5，招聘发起面试	\N	7	19	5	3	\N	5	9	2018-05-14 06:39:42.818287	2018-06-08 08:49:18.796606	2018-05-14	0	\N	70	70	2	3	f	\N
26	6	1	object tag的操作方式	put_tag () {\r\n    bucket=/$1\r\n    resource=/$2\r\n    tagdata=$3\r\n    dateValue="`TZ=GMT date +'%a, %d %b %Y %H:%M:%S GMT'`"\r\n    stringToSign="PUT\\n\\napplication/x-www-form-urlencoded\\n${dateValue}\\n${bucket}${resource}?tagging"\r\n    echo $stringToSign\r\n    #stringToSign="PUT\\n\\n\\n${dateValue}\\n${bucket}${resource}?tagging"\r\n    signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${Key} -binary | base64`\r\n    url="http://${host}${bucket}${resource}?tagging"\r\n    echo "put tag begin"\r\n    echo "curl -L -i -v  -X PUT -H "Date: ${dateValue}" -H "Authorization: AWS ${Id}:${signature}" "${url}" -d $tagdata"\r\n    #curl -L -i -v  -X PUT -H "Date: ${dateValue}" -H "Authorization: AWS ${Id}:${signature}" "${url}" --data-urlencode "$tagdata"\r\n    curl -L -i -v  -X PUT -H "Date: ${dateValue}" -H "Authorization: AWS ${Id}:${signature}" "${url}" -d "$tagdata"\r\n    echo "put tag end"\r\n}\r\n\r\nget_tag () {\r\n    bucket=/$1\r\n    resource=/$2\r\n    dateValue="`TZ=GMT date +'%a, %d %b %Y %H:%M:%S GMT'`"\r\n    stringToSign="GET\\n\\n\\n${dateValue}\\n${bucket}${resource}?tagging"\r\n    echo $stringToSign\r\n    #stringToSign="PUT\\n\\n\\n${dateValue}\\n${bucket}${resource}?tagging"\r\n    signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${Key} -binary | base64`\r\n    url="http://${host}${bucket}${resource}?tagging"\r\n    echo "get tag begin"\r\n    echo "curl -L -X GET -H "Date: ${dateValue}" -H "Authorization: AWS ${Id}:${signature}" "${url}""\r\n    curl -L -X GET -H "Date: ${dateValue}" -H "Authorization: AWS ${Id}:${signature}" "${url}"\r\n    echo "get tag end"\r\n}	\N	1	17	5	3	\N	5	1	2017-10-25 15:19:26.420453	2017-10-25 15:19:43.147278	2017-10-25	0	\N	\N	26	1	2	f	\N
161	6	12	游戏力实操训练营（第二课 妈妈，我不行-如何培养孩子的自信）		\N	\N	17	\N	3	\N	6	2	2018-11-14 03:35:20.415264	2018-11-28 11:16:46.391461	2018-11-14	0	\N	\N	161	1	2	f	\N
77	3	1	2018.6.25	修复问题单，扫尾。\r\n讨论下一个版本的计划	\N	\N	17	\N	3	\N	5	3	2018-06-25 07:05:55.645817	2018-06-26 15:38:37.391201	2018-06-25	0	\N	\N	77	1	2	f	\N
28	8	1	usage log 在长期运行后会影响性能	理由是omap会持续增长？\r\n\r\nbilog，datalog那也得trim。	\N	\N	17	\N	3	\N	5	1	2017-10-27 07:30:48.569287	2017-10-27 07:43:06.455658	\N	0	\N	\N	28	1	2	f	\N
34	3	1	sqlite-rbd io failed not exit	马四  16:25:48\r\n谢锐 现在sqlite的进程，锁被强制释放后，读写报I/O错误，进程不会退出哦\r\n这样的话 rcm也不会重启db\r\n然后就一直没法访问的\r\n我记得之前说 报错的话  db好像会退出的吧、\r\n？\r\n谢锐  17:18:39\r\nI/O错误不一定会退出 读写因为锁出错才退出\r\n锁出错了还不退出么？\r\n马四  17:19:08\r\n嗯 现在就是锁被抢走了，日志里面报了I/O错误\r\n是的\r\n\r\n\r\n\r\n谢锐  17:28:59\r\n我看下sqlite的日志\r\n马四  17:30:16\r\n嗯 \r\n谢锐  17:53:16\r\n退出是在执行读写请求之间做锁检查的地方加的\r\n可能读写请求已经发下去了，这种读写出错，没有加assert\r\n马四  17:54:22\r\n额 这个地方能改吗\r\n谢锐  17:54:50\r\n我问下文达哈 如果sqlite无法处理底下的io错误 那可以直接退出 \r\n好像也没啥重试机制\r\n	\N	\N	4	\N	3	4	5	1	2017-11-08 15:38:29.586496	2017-11-13 11:55:40.783593	2017-11-08	0	\N	\N	34	1	2	f	\N
13	3	1	目录下的对象检索方式	比如test1目录下有文件iser.c iser.h\r\n\r\ncurl -XGET 172.18.0.151:9200/_search -d '{"query":{"match":{"name":"iser.c"}}}'\r\n{"took":2,"timed_out":false,"_shards":{"total":20,"successful":20,"failed":0},"hits":{"total":0,"max_score":null,"hits":[]}}\r\n\r\n[root@localhost ~]# curl -XGET 172.18.0.151:9200/_search -d '{"query":{"match":{"name":"test1"}}}'\r\n{"took":2,"timed_out":false,"_shards":{"total":20,"successful":20,"failed":0},"hits":{"total":0,"max_score":null,"hits":[]}}[root@localhost ~]# \r\n[root@localhost ~]# curl -XGET 172.18.0.151:9200/_search -d '{"query":{"match":{"name":"test1/"}}}'\r\n{"took":3,"timed_out":false,"_shards":{"total":20,"successful":20,"failed":0},"hits":{"total":1,"max_score":0.6931472,"hits":[{"_index":"rgw-china-95fdffb3","_type":"object","_id":"99c3ac9e-e654-4fd9-9f9f-4a68eb74240e.4147.1:test1/:null","_score":0.6931472,"_source":{"bucket":"xxx1","name":"test1\\/","instance":"","versioned_epoch":0,"owner":{"id":"nuser","display_name":"nuser"},"permissions":["nuser"],"meta":{"size":0,"mtime":"2017-09-30T09:20:15.014Z","content_type":"application\\/octet-stream","etag":"d41d8cd98f00b204e9800998ecf8427e","x-amz-date":"Sat, 30 Sep 2017 09:31:26 GMT"}}}]}}\r\n\r\n这样仍然搜索不到上述2文件\r\n\r\ncurl -XGET 172.18.0.151:9200/_search?q='name>test1'\r\n{"took":15,"timed_out":false,"_shards":{"total":20,"successful":20,"failed":0},"hits":{"total":4,"max_score":0.64433396,"hits":[{"_index":"rgw-china-95fdffb3","_type":"object","_id":"99c3ac9e-e654-4fd9-9f9f-4a68eb74240e.4147.1:test1/:null","_score":0.64433396,"_source":{"bucket":"xxx1","name":"test1\\/","instance":"","versioned_epoch":0,"owner":{"id":"nuser","display_name":"nuser"},"permissions":["nuser"],"meta":{"size":0,"mtime":"2017-09-30T09:20:15.014Z","content_type":"application\\/octet-stream","etag":"d41d8cd98f00b204e9800998ecf8427e","x-amz-date":"Sat, 30 Sep 2017 09:31:26 GMT"}}},{"_index":"rgw-china-95fdffb3","_type":"object","_id":"99c3ac9e-e654-4fd9-9f9f-4a68eb74240e.4147.1:test1/iser.c:null","_score":0.57601494,"_source":{"bucket":"xxx1","name":"test1\\/iser.c","instance":"","versioned_epoch":0,"owner":{"id":"nuser","display_name":"nuser"},"permissions":["nuser"],"meta":{"size":98245,"mtime":"2017-10-10T05:49:58.989Z","content_type":"text\\/plain","etag":"c9fde6ada0a9cd233791974050f0e97d","x-amz-date":"Tue, 10 Oct 2017 06:01:38 GMT"}}},{"_index":"rgw-china-95fdffb3","_type":"object","_id":"99c3ac9e-e654-4fd9-9f9f-4a68eb74240e.4147.1:test1/iser.h:null","_score":0.41360322,"_source":{"bucket":"xxx1","name":"test1\\/iser.h","instance":"","versioned_epoch":0,"owner":{"id":"nuser","display_name":"nuser"},"permissions":["nuser"],"meta":{"size":6966,"mtime":"2017-10-10T05:49:58.904Z","content_type":"text\\/plain","etag":"16063abbb467e965d425d3511f5bd5d9","x-amz-date":"Tue, 10 Oct 2017 06:01:38 GMT"}}},{"_index":"rgw-china-95fdffb3","_type":"object","_id":"99c3ac9e-e654-4fd9-9f9f-4a68eb74240e.4147.1:test1/pglog_assert.jpg:null","_score":0.1710554,"_source":{"bucket":"xxx1","name":"test1\\/pglog_assert.jpg","instance":"","versioned_epoch":0,"owner":{"id":"nuser","display_name":"nuser"},"permissions":["nuser"],"meta":{"size":341962,"mtime":"2017-09-30T09:20:24.052Z","content_type":"image\\/jpeg","etag":"9ee16c41e9a0babbe64b1ff80f774232","x-amz-date":"Sat, 30 Sep 2017 09:31:35 GMT"}}}]}}\r\n这种方式可以。	\N	1	11	5	3	1	5	7	2017-10-10 11:56:15.630012	2017-10-27 20:23:42.435698	2017-10-10	0	\N	\N	13	1	2	f	2017-10-27 20:23:42.435698
20	3	1	elastic search默认分词器无法支持文件后缀搜索	比如abc.jpg，搜索jpg无法找到，搜索abc也无法找到	\N	4	8	\N	3	3	5	8	2017-10-17 12:49:22.997701	2017-10-27 20:29:04.295855	2017-10-17	0	\N	\N	20	1	2	f	\N
36	7	1	支持bucket回滚到一个时间点	用法：用户根据审计日志，查看一个桶上的操作。\r\n可以根据这个来决定回滚到某个时间点。	\N	1	4	5	3	5	5	1	2017-11-14 09:39:46.650867	2017-11-15 15:37:21.058643	2017-11-14	0	\N	\N	36	1	2	f	\N
43	3	1	同步社区问题18885	http://tracker.ceph.com/issues/18885\r\n\r\nThis happens because the unlink_instance has a higher mtime than the del object operation (that happens later), so when squashing the ops we skip the second operations. The object removal on the target already happens, but we don't update the high marker when dealing with squashed entries.	\N	\N	17	\N	3	\N	5	0	2017-11-24 15:48:40.103839	2017-11-24 15:48:40.103839	2017-11-24	0	\N	\N	43	1	2	f	\N
29	3	1	多版本对象打tag，elastic search搜索不到		\N	4	8	5	3	3	5	16	2017-10-27 14:13:12.058884	2017-11-25 14:18:57.115087	2017-10-27	0	\N	\N	29	1	2	f	\N
35	3	1	统计没同步对象数量错误，实际完成同步，但显示有39对象未同步	统计方法有误，副本会合并bilog执行，所以ver不能准确反应实际数据差距	\N	\N	18	\N	3	3	5	1	2017-11-10 08:48:31.226888	2017-11-25 15:20:31.64143	2017-11-10	0	\N	\N	35	1	2	f	\N
44	3	1	多版本同步，slave zone在version suspend的时候，put请求仍然产生了新版本。	从当时现象看，slave zone的bucket version可能没有立即同步，但是这有关系么？\r\n\r\n在version suspend之后，null指向的对象是olh的。	\N	1	14	5	3	4	5	1	2017-11-27 14:09:58.643904	2017-11-27 14:11:56.0266	2017-11-27	0	\N	\N	44	1	2	f	2017-11-27 14:11:56.0266
45	8	1	覆盖写一个null instance会出现什么现象？	bilog会产生一个新版本么？产生的bilog又是怎么样的呢？	\N	1	17	\N	2	\N	5	0	2017-11-27 15:52:06.409453	2017-11-27 15:52:06.409453	\N	0	\N	\N	45	1	2	f	\N
40	3	1	多版本关闭之后出现残留对象 导致bucket 无法删除 delete	rgw_ldap.cc\t\r\nrevision #: 1 (deleted)\t2017/11/20 11:36:17\t\t\t\tnuser (nuser)\tnull\t\r\n\r\n测试步骤：\r\n1.创建一个名为bucket1的bucket；\r\n2.向该bucket上传一个对象深圳-123-.png；\r\n3.开启多版本再上传3个版本的深圳-123-.png对象；\r\n4.暂停bucket1的多版本；\r\n5.在数据管理界面bucket对应的文件列表中删除对象（不指定版本号）；\r\n6.进入多版本页面，删除所有版本的对象（指定版本号）；\r\n7.删除该bucket（bucket1）；	\N	5	4	\N	3	3	5	24	2017-11-20 11:53:46.13729	2017-11-27 21:08:30.687402	2017-11-20	0	\N	\N	40	1	2	f	\N
352	6	17	parser模块培训记录	入口：exec_simple_query\r\nNode和Oid是万物基类。\r\nQuery是核心，其中已经有了具体的table信息(RTE)，attr(Targetlist)信息。\r\n优化分为逻辑优化和物理优化，逻辑优化如上提子查询，条件下沉等。物理优化如动态规划，调整表连接顺序等。\r\n\r\n一个sql命令，可能包含多个sql语句。\r\n一个sql语句也可能解析为多个query。\r\n\r\nRTE有很多类型，不仅是表。\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2019-04-24 14:46:10.75585	2019-04-24 14:46:10.75585	2019-04-24	0	\N	\N	352	1	2	f	\N
41	3	1	多版本同步全量同步异常	测试步骤：\r\n1，关闭slave rgw\r\n2，创建bucket，开启多版本，上传对象2次\r\n3，关闭多版本，再次上传\r\n4，启动slave rgw\r\n\r\nslave zone同步失败：\r\nrgw_tag.h\t\r\nrevision #: 2 (current)\t2017/11/23 16:01:57\t"89acfb788b24ef60d7ad87fb3b9784cd"\t1012 bytes\tSTANDARD\tnuser (nuser)\tV2cNceDh.GYzB3Emf.F.ygb-a.Tvudc\t\r\nrevision #: 1\t2017/11/23 16:01:52\t"89acfb788b24ef60d7ad87fb3b9784cd"\t1012 bytes\tSTANDARD\tnuser (nuser)\tvhCkB3XAbibU91lLk2N1x9XRo.Em8al\t\r\n看不到null对象。	\N	\N	4	\N	3	\N	5	10	2017-11-23 13:54:58.686476	2017-12-17 12:18:54.48622	2017-11-23	0	\N	\N	41	1	2	f	\N
93	8	1	FileStore HashIndex的悬疑	HashIndex::list_by_hash_bitwise中有两种排序：\r\n1，按照CmpHexdigitStringBitwise给hash_prefixes排序\r\n2，按照cmp_bitwise过滤对象，cmp_bitwise过滤对象，其中重点是get_bitwise_key\r\n该函数中如何上述两种顺序不一样，可能出现一种情况：\r\n按照hash_prefixes顺序，object A在B前面，且A作为next结束一次遍历。\r\n再下一次遍历的时候A作为边界对象，虽然B会遍历到，但是不满足cmp_bitwise条件，无法加入到list结果中。\r\n\r\nCmpHexdigitStringBitwise\r\n在HashIndex::get_path_contents_by_hash_bitwise中，使用hash按字节反序(get_path_str).\r\ncmp_bitwise是按照bit反序。\r\n\r\n2B了....\r\nhash_prefixes定义中有CmpHexdigitStringBitwise\r\n会执行reverse_hexdigit_bits_string，完成按bit反序的逻辑。	\N	\N	17	\N	3	\N	5	5	2018-08-22 14:48:23.805734	2018-08-29 00:12:09.72623	\N	0	\N	\N	93	1	2	f	\N
48	3	1	双活环境，主备切换多次，period出现different，master创建bucket不同步	【操作步骤】\r\n1、创建双活环境；\r\n2、执行测试用例：metadata/data正在同步/同步完成时，挂master端或slave端rgw；\r\n3、执行主备切换多次；\r\n4、master端11.16上创建bucket；\r\n【预期结果】\r\n4、slave端同步成功，period信息状态same；\r\n【实际结果】\r\n4、slave端同步失败，查询同步状态出现period信息状态different；\r\n"period":\r\n{ "period_status": "different", "master_period": "b262af32-9fa0-4a1a-8e8c-a180a2342624", "local_period": "8b8f2a8a-e88e-404a-8371-ffabff0fa83c" }	\N	6	17	5	2	\N	5	2	2018-01-16 11:53:31.578011	2018-01-16 12:22:42.711736	2018-01-16	0	\N	\N	48	1	2	f	\N
49	9	1	在集群故障的时候，rgw可能卡住，集群恢复之后，需要手动重启rgw	rgw操作没有超时时间，请求异常的情况下，只能重启rgw。\r\n否则堆栈一直卡在那里，rgw无法响应请求	\N	1	17	\N	3	4	5	0	2018-01-17 09:28:48.122203	2018-01-17 09:28:48.122203	\N	0	\N	\N	49	1	2	f	\N
162	6	12	游戏力实操训练营（第三课 妈妈，我害怕- 如何让孩子勇敢）		\N	\N	17	\N	3	\N	6	3	2018-11-14 03:37:03.604227	2018-11-28 11:32:13.737019	2018-11-14	0	\N	\N	162	1	2	f	\N
50	7	1	完成多版本的bug回归验证	目的：\r\n1，完成工作任务\r\n2，整理多版本相关的bugfix，并列出具体原因，做一个多版本问题总结\r\n\r\n结果：\r\n1，完成bug验证\r\n2，邮件输出到MOS组。\r\n	\N	7	24	\N	3	\N	5	1	2018-01-18 07:36:35.726893	2018-01-19 08:27:37.255889	2018-01-18	0	\N	\N	50	1	2	f	2018-01-19 08:27:37.255889
51	7	1	完成快照文档写作，审视快照设计，以及相关问题修复	总结设计文档格式，写一个漂亮清晰的文档。	\N	7	24	5	3	\N	5	1	2018-01-19 08:29:03.963191	2018-01-19 20:53:45.349555	2018-01-19	0	\N	\N	51	1	2	f	2018-01-19 20:53:45.349555
70	7	1	2018.5	完成bucket规划优化，提供unorder list，bilog trim time功能。写出实现文档\r\nQos方案。\r\n安排调研，生命周期，policy等。考虑rgw以后的发展方向。\r\n分析清楚rgw的一致性方案\r\n调研tikv的region复制方案，raft如何应用于复制。\r\n搞清楚二阶段提交的本质。\r\n分析hash与region分区的利弊，以及hash的其他应用场景。\r\n简单阐述CAP，Base。\r\n	\N	\N	19	5	3	\N	5	6	2018-05-02 06:56:24.447876	2018-05-14 06:39:42.866728	2018-05-14	0	\N	\N	70	1	4	f	\N
4	3	1	rgw无法响应任何请求	nginx upstream的返回值都是499.\r\n客户端发起请求出现502错误，断点打在rgw_process 都没法到，日志级别调整后也看到处理请求。\r\n\r\n是跑在docker中的，但是rgw可以发送sync的请求到对端zone，并且能正常接收应答。\r\nFastCGI的Accept线程并未停止工作。\r\n\r\n需要更充分信息来定位。	\N	1	3	5	3	\N	5	35	2017-09-10 12:20:26.270494	2018-12-27 11:28:01.589632	2017-09-10	0	\N	\N	4	1	2	f	\N
72	7	1	2018.5.23	聚焦：\r\n1，auto trim实现\r\n2，sync from配置\r\n3，编译运行申威。	\N	7	19	5	3	4	5	1	2018-05-23 06:48:50.117551	2018-05-28 06:33:48.638744	2018-05-23	0	\N	\N	72	1	2	f	\N
73	7	1	2018.5.28	完成第二个迭代。\r\n\r\nauto trim，bilog auto trim。\r\n\r\n1，同步配置\r\n2，输出中广核升级可行性分析报告。	\N	\N	19	5	3	\N	5	5	2018-05-28 06:35:05.085179	2018-06-04 07:32:08.479373	2018-05-28	0	\N	\N	73	1	2	f	\N
110	7	1	2018.10.8	1,继续完善特性规格说明书\r\n2，定位双活和osd问题。	\N	\N	19	\N	3	\N	5	2	2018-10-08 08:12:55.925621	2018-10-08 15:10:07.048835	2018-10-08	0	\N	\N	110	1	2	f	\N
84	3	1	2018.7.30	1，V5.1.0版本 bugfix\r\n2，V5.2.0版本重新开工\r\n3，重整docker环境\r\n4，编写需求规格设计模板	\N	\N	17	\N	3	\N	5	1	2018-07-30 06:36:32.703774	2018-08-02 06:30:13.51887	2018-07-30	0	\N	\N	84	1	2	f	\N
74	7	1	2018.6.4	1,日志改进(邓颖聪)\r\n2，rgw v5方案初步设计\r\n2.1分析YIG是否满足要求\r\n\r\n3，ceph 元数据多版本以及cache解析	\N	7	19	5	3	\N	5	4	2018-06-04 07:37:48.476726	2018-06-05 13:38:22.227894	2018-06-04	0	\N	\N	74	1	2	f	\N
75	3	1	2018.6.12	面试周强和蓝盾的哥们	\N	\N	17	\N	3	\N	5	1	2018-06-14 06:48:21.474695	2018-06-14 07:13:05.251946	2018-06-14	0	\N	\N	75	1	2	f	\N
85	3	1	2018.8.6（研发体系）	1，解决V5.1.0的bug\r\n2，修复3.2.1遗留在5.1.0的问题\r\n3，协助完成V5.2.0的任务分解，并进一步审视技术方案\r\n4，编写s3tests用例，并完成s3tests框架的讲解，以及待改进。\r\n\r\n社区体系的玩法，建立一套可以远程协作的研发体系。\r\n每个版本集中开几次会议大讨论就可以了，找一个环境优美的地方。\r\n\r\n这里面有几个核心的地方:\r\n1,产品方向\r\n2，技术方案\r\n3，任务分解与分配\r\n4，基础平台，自动化测试，集成，代码合入等。\r\n5，bugfix，问题攻关\r\n	\N	\N	17	\N	3	\N	5	2	2018-08-06 07:00:00.903912	2018-08-07 17:22:46.612623	2018-08-06	0	\N	\N	85	1	2	f	\N
88	9	1	关于pg分裂		\N	\N	1	\N	3	\N	5	4	2018-08-06 15:13:50.972008	2018-08-10 07:02:56.758955	\N	0	\N	\N	88	1	2	f	\N
216	6	1	V6的思考(解耦)	能否去掉cls-rgw，rados提供三类接口满足各种需求：\r\n1，kv接口，支持批量key\r\n2，read/write接口\r\n3，watch/notify接口	\N	\N	17	\N	3	\N	5	21	2018-12-29 08:44:43.892638	2019-04-15 08:35:34.779857	2018-12-29	0	\N	\N	216	1	2	f	\N
52	3	1	ES 默认分词器文件名检索的问题	【简要描述】\r\nES通过“文件名称”检索，出现的问题归档记录；\r\n【系统版本】\r\nceph version 3.1.1-74-g16a17f7 (16a17f75508868d01ba0148c35e22955f3d1964c)\r\nsandstone-v3.1.1-installer.tar.gz.release.404\r\n【操作步骤】&【实际结果】\r\n1）中文全名搜索对象，匹配不准确；\r\n2）对于全英文字符名的对象，只能全名检索到对象；\r\n3）对于名为“英文”+“数字”的对象，只能全名检索到对象；\r\n4）对于名为“中文”+“英文”的对象，只能通过全名或者中文检索到对象；\r\n5）对于名为由“.”"_" 分割英文的对象，只能通过全名检索到对象；\r\n6）对象类型后缀名都是用'.'分割的，如果'.'前面是英文字母，则通过后缀名检索不到该对象；\r\neg:对象名为：2shenzhen.doc，通过doc检索不到该对象；shenzhen2.doc,通过doc可检索到该对象\r\n7）对于名为由“.”"_" 分割数字的对象，只能通过全名检索到对象；\r\n8）对于名为由“ ”“-”分割的对象，可以通过被符号分割前面的字段检索到对象；\r\n\r\n【预期结果】\r\n“文件名称”检索，匹配准确\r\nPS：记录跟踪	\N	4	18	5	2	\N	5	0	2018-01-19 10:23:17.921873	2018-01-19 10:23:17.921873	2018-01-19	0	\N	\N	52	1	2	f	\N
94	3	1	日志过滤算法	在一段时间内，如果日志第一次出现，则其概率是100%。\r\n随后概率递减。	\N	\N	17	\N	3	\N	5	0	2018-08-23 09:13:37.812582	2018-08-23 09:13:37.812582	2018-08-23	0	\N	\N	94	1	2	f	\N
53	3	1	/var/lib/ceph/bin/radosgw-admin sync status 查询失败	2018-01-19 17:45:12.832768 7f874089c9c0  0 error in read_id for object name: default : (2) No such file or directory\r\n2018-01-19 17:45:12.847812 7f874089c9c0  0 WARNING: can't generate connection for zone d3baa928-4274-4916-bf9c-dd8ec14de9d8 id ES-Sync: no endpoints defined\r\n2018-01-19 17:45:12.860538 7f874089c9c0  1 ERROR: msg->data.result=7\r\n2018-01-19 17:45:12.860612 7f874089c9c0  0 rgw meta sync: ERROR: failed to fetch mdlog info\r\n2018-01-19 17:45:12.862518 7f874089c9c0  1 ERROR: msg->data.result=7\r\n2018-01-19 17:45:12.862585 7f874089c9c0  0 ERROR: failed to fetch datalog info\r\n	\N	\N	17	\N	3	\N	5	0	2018-01-19 15:16:38.963078	2018-01-19 15:16:38.963078	2018-01-19	0	\N	\N	53	1	2	f	\N
54	7	1	合入license功能，处理快照，es问题，梳理es	输出es，元数据检索文档一篇。\r\n\r\n代码解读。\r\n\r\n	\N	7	19	5	3	\N	5	0	2018-01-22 08:09:36.659004	2018-01-22 08:09:36.659004	2018-01-22	0	\N	\N	54	1	2	f	\N
374	6	19	5.4 下周早餐安排	1，2只鸡\r\n2，一份牛排 + 牛奶\r\n3，一份水饺，可蒸 + 牛奶\r\n4，一份包子 + 牛奶\r\n5，一份鸡蛋饼\r\n6，红薯	\N	\N	17	\N	3	\N	5	0	2019-05-04 04:33:29.645523	2019-05-04 04:33:29.645523	2019-05-04	0	\N	\N	374	1	2	f	\N
56	8	1	如何配置网络使得docker容器可以访问宿主机的端口	docker容器可以ping宿主机的ip，但是却无法访问其端口\r\n\r\nsh-4.2# curl -XGET 172.17.0.1:9500/_all\r\ncurl: (7) Failed connect to 172.17.0.1:9500; No route to host\r\n	\N	8	17	\N	3	\N	5	0	2018-02-08 10:23:01.899129	2018-02-08 10:23:01.899129	\N	0	\N	\N	56	1	2	f	\N
57	7	1	2018.1计划	同步Qos控制，方案，以及实施。\r\n性能调测\r\nbugfix	2018-03-03	7	19	5	3	4	5	0	2018-02-26 07:24:13.179606	2018-02-26 07:24:13.179606	2018-02-26	0	\N	\N	57	1	2	f	\N
58	8	1	ldd能显示所有依赖的动态库吗？	在make -n中看到ceph-mon依赖于jemalloc，但是ldd看不到。\r\ncryptopp也是这样，看不到依赖关系。	\N	\N	17	\N	3	\N	5	1	2018-02-26 07:53:46.467598	2018-02-26 09:53:06.868812	\N	0	\N	\N	58	1	2	f	\N
60	4	1	容灾数据恢复	\N	\N	6	17	5	3	\N	5	1	2018-03-02 07:05:06.958516	2018-03-02 07:05:39.188102	2018-03-02	0	\N	\N	60	1	2	f	\N
65	8	1	bucket indexless的bucket可以启用多版本么？	这里面的关系是什么呢？	\N	\N	17	\N	3	\N	5	0	2018-03-09 11:56:26.8659	2018-03-09 11:56:26.8659	\N	0	\N	\N	65	1	2	f	\N
63	6	1	完成xx特性，文档更新	xxx	\N	\N	17	\N	3	\N	5	0	2018-03-05 13:02:25.538969	2018-03-05 13:02:25.538969	2018-03-05	0	\N	61	61	6	7	f	\N
66	7	1	2018-3-12 周计划	example	\N	\N	19	\N	3	\N	5	0	2018-03-12 07:12:15.87223	2018-03-12 07:12:15.87223	2018-03-12	0	\N	62	61	3	4	f	\N
69	9	1	osd scrub	ceph可配置scrub自动repair，并且可以支持超过多少对象error就不自动repair。\r\n\r\nscrub错误能自动repair的条件：\r\n1，存在auth的obj\r\n2，missing或inconsistent\r\n\r\n但是如果object没有缺失元数据，也没有read error，就有可能选错auth。\r\n\r\n比较奇怪的是scrub的时候，为啥没对比oi里面的digest与ScrubObject的digest？\r\n	\N	11	1	\N	3	\N	5	1	2018-04-11 08:26:31.344027	2018-04-11 08:31:07.806622	\N	0	\N	\N	69	1	2	f	\N
80	3	1	rgw 坑记录	1，测试性能时最好不要重复测同样对象，否则性能会差不少。\r\n可能是因为inode和空间重用，以及覆盖写带来额外的逻辑导致。追加写性能会好很多。但是追加写迟早也会做gc。\r\n\r\n2，使用dns来负载均衡有个问题，就是在rgw故障时，dns解析到新的ip需要一些时间。这种业务可能会中断。\r\n  er使用浮动ip则会快很多。	\N	\N	17	\N	3	\N	5	0	2018-07-11 08:56:46.897705	2018-07-11 08:56:46.897705	2018-07-11	0	\N	\N	80	1	2	f	\N
79	3	1	2018.7.10	本周工作事项：\r\n1，敦促3.2.1的转测\r\n2，3.2.1的回顾\r\n3，专利\r\n4，自评\r\n5，招聘\r\n6，3.1.6 双活fix合入\r\n7，5.1.0的gc修复\r\n8，讨论3.3.1计划\r\n	\N	\N	17	\N	3	\N	5	8	2018-07-10 06:44:32.585255	2018-07-16 13:00:28.183005	2018-07-10	0	\N	\N	79	1	2	f	\N
82	3	1	2018.7.23(V5.2.0需求分析，存储策略，异构集群)	本周工作计划：\r\n1，周2/3 出MOS5.1.0 beta版本\r\n2，辅助大家完成5.2.0的需求分析工作。\r\n3，完成一次rgw内部代码讲解。并输出材料\r\n4，完善专利交底书	\N	\N	17	\N	3	\N	5	9	2018-07-23 06:40:25.366499	2018-07-27 06:39:42.854278	2018-07-23	0	\N	\N	82	1	2	f	\N
81	3	1	2018.7.16	1，feature列表\r\n2，pbc\r\n3，专利\r\n4，v5.1.0基础版本\r\n5，招聘\r\n6，新员工计划	\N	\N	17	\N	3	\N	5	3	2018-07-16 09:11:56.162106	2018-07-17 14:55:34.443288	2018-07-16	0	\N	\N	81	1	2	f	\N
83	7	1	2018上半年工作总结	研发工作：\r\n1，开发桶快照功能\r\n2，合入license\r\n3，修复双活模块的bug\r\n4，开发多站点Qos特性\r\n5，支持bilog，datalog autotrim，减少bi数据规模\r\n6，支持bi backfill方式数据恢复，减少业务中断\r\n7，优化es zone索引使用。\r\n8，支持rgw单独编译，提高工作效率\r\n\r\n招聘工作：\r\n1，面试人数若干\r\n2，人数增加了3人\r\n\r\n支撑动作：\r\n1，参与广汽性能问题分析\r\n\r\n项目工作：\r\n1，上半年主要研发了3.1.5和3.2.1版本，3.2.1版本采用新的研发流程。\r\n2，周例会和每日站立会议运行起来。	\N	\N	19	\N	3	\N	5	1	2018-07-27 12:11:12.956472	2018-07-27 16:19:40.456865	2018-07-27	0	\N	\N	83	1	2	f	\N
86	9	1	ceph集群配置	1，控制pool和pg的数量，这个对于osd的内存使用量影响非常大。\r\n2，monitor在集群大时需单独部署。	\N	\N	1	\N	3	\N	5	1	2018-08-06 08:58:24.552573	2018-08-07 12:15:10.053017	\N	0	\N	\N	86	1	2	f	\N
78	3	1	多数据中心当前缺陷思考	1，同步状态不好管理，难以查询每个bucket的数据差异，同步监控方面也非常弱。\r\n2，es zone依赖于其他zone的ceph集群， 这样关系就没理清楚。\r\n   \r\n	\N	\N	17	\N	3	\N	5	3	2018-06-25 08:14:00.585079	2018-08-10 12:26:43.201799	2018-06-25	0	\N	\N	78	1	2	f	\N
87	3	1	奇怪的load average	top - 11:37:48 up 20 days, 20:59,  6 users,  load average: 212.61, 254.50, 336.13\r\nTasks: 594 total,   1 running, 593 sleeping,   0 stopped,   0 zombie\r\n%Cpu(s):  1.3 us,  0.6 sy,  0.0 ni, 93.2 id,  4.9 wa,  0.0 hi,  0.0 si,  0.0 st\r\nKiB Mem : 65759088 total,   349260 free, 62846768 used,  2563060 buff/cache\r\nKiB Swap: 23445500 total, 11722756 free, 11722744 used.  2130876 avail Mem\r\n\r\n这环境上有几个问题：\r\n1，奇怪的内存使用率\r\n2，系统盘超级大的压力\r\n3，load average巨大	\N	\N	17	\N	3	\N	5	0	2018-08-06 09:12:17.007588	2018-08-06 09:12:17.007588	2018-08-06	0	\N	\N	87	1	2	f	\N
92	3	1	8.20	1，从测试情况看，即便对象没达到数量也出现了分裂。\r\n是不是上次也出现了类似情况呢？ 搞清楚这个原因。	\N	\N	17	\N	3	\N	5	6	2018-08-20 07:15:15.699805	2018-08-24 07:35:04.334911	2018-08-20	0	\N	\N	92	1	2	f	\N
129	6	6	如何让一个产品稳定下来	1，梳理清楚代码逻辑，隔离相关影响，不能让代码彻底乱掉\r\n2，认真解决每个问题，不要让问题残留，多了必然乱掉	\N	\N	17	\N	3	\N	1	1	2018-10-22 06:41:55.459094	2018-12-04 13:12:10.88332	2018-10-22	0	\N	\N	129	1	2	f	\N
90	3	1	8.13	1，V5.1.0问题解决\r\n2，考虑海量小文件方案(下半年重点之一)。\r\n\r\n另外可能重点：\r\n1，rgw是否支持多集群？\r\n2，BI放入DB\r\n3，NFS支持	\N	\N	17	\N	3	\N	5	2	2018-08-14 06:40:59.431629	2018-08-17 16:11:13.523242	2018-08-14	0	\N	\N	90	1	2	f	\N
104	6	6	习惯	一个没有习惯的人，就像一个没有生活目标的人一样。生活在不知不觉中耗散。\r\n\r\n让我们良好的日常行为方式形成习惯，就可以减轻我们的负荷。\r\n阻碍习惯养成的2个隐患：\r\n1，没有计划，不做自我约束\r\n2，没有很好的分割我们的工作和生活。\r\n\r\n通常我们在热情高涨时制定一个日常行为指南，但是实际执行通常都有变化。\r\n比如某天精神不好，就不想早起，这样引起一系列连锁反应。\r\n\r\n热情高涨是短暂的，我们应该去寻求习惯背后的意义。\r\n我想养成每天早上7点起床锻炼身体的习惯，因为我真的渴望自己有良好的体质，有肌肉，还有良好的精神状态。\r\n为此我愿意牺牲晚上看手机，电影等不利于睡眠的习惯。\r\n\r\n我愿意养成每天整理知识的习惯，这是因为我真的热爱他们，我渴望自己变得更加睿智。\r\n\r\n持之以恒，这些行为方式就会成为习惯。\r\n\r\nh1. 习惯列表\r\n\r\n1，每天早上7点到8点之间做身体锻炼\r\n2，每天晚上8点-9点 做学习总结\r\n3，每天晚上9点之后，做心情梳理与家庭沟通，把不安的情绪给安放。\r\n   可以把不安情绪，担心的事件作为工作列表记录下来。\r\n4，在任何非常困的时间睡觉。	\N	\N	17	\N	3	\N	5	0	2018-10-06 19:24:55.198035	2018-10-06 19:24:55.198035	2018-10-06	0	\N	\N	104	1	2	f	\N
106	6	5	关于买房	房地产目前有两个大作用：\r\n1，解决相关人员就业问题，这个作用是非常巨大的，如果相关人员失业，波及面将非常广。\r\n2，作为人名币的蓄水池，完成剪羊毛功能。\r\n\r\n但是房地产这种模式能否永久持续下去呢？显然不会，大咖也不会认为会持续下去。\r\n主要条件：\r\n1，中国的城镇化程度\r\n2，长期人口增长情况\r\n3，继续放水的程度\r\n\r\n在1，2，3 条件均满足的情况下，房价必然上涨。\r\n目前农村限制建房，可以逼出一些需求，但是这个空间也不会太大了，但是改善性需求是存在的。\r\n但改善性需求能否维持房价基本面是一个问题。\r\n\r\n长期人口增长从目前看必然是下降的。\r\n如果控制放水速度与房产开发速度相当，则水可以灌入房产。但房产最终会出现相对过剩。\r\n\r\n这时放水可以维持房价，而且房价是合理的，但是问题在于财富分配会进一步不均衡。这才是问题的关键。\r\n我们对此的容忍度非常高。但并非没有极限。\r\n\r\n所以未来房价是上涨还是下跌取决于政府意志，下跌会巨痛，会经历失去的N多年。但上涨会更加的危险。\r\n目前看想控制住缓慢增长。但要做到这点非常难。\r\n\r\nh1. 刚需买房\r\n从个人角度看，如果不考虑各种政策，应该是看租售比。如果过高就买房，否则就租房。\r\n通过教育强制割羊毛是需考虑的一个因素，宁愿为了教育被割多少需看家庭经济情况。\r\n显然为了孩子教育赌几年的时间是值得的，但是如果超过了9年，我个人觉得并不划算。按年纯收入25万(刨除医疗等各种可能支出)。\r\n那么最多可牺牲200来万，这还是不考虑失业风险的情况下。\r\n\r\nh1. 投资买房\r\n投资则必须转手，得有人接手，这点风险是非常高的。\r\n在经济的整体上升期，资产价格会被高估，这时风险小，可大胆投入，在经济收缩时则相反。\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2018-10-07 21:42:37.759575	2018-10-07 21:42:37.759575	2018-10-07	0	\N	\N	106	1	2	f	\N
227	6	9	用人篇	用人德为先，无德则容易偏颇，狭隘。\r\n\r\n理性，有容，价值观正常积极。有责任感，能坦诚。	\N	\N	17	\N	3	\N	5	5	2019-01-06 21:26:11.564941	2019-03-07 10:08:52.522664	2019-01-06	0	\N	\N	227	1	2	f	\N
98	3	1	9.17	目前的疼点：\r\n1，恢复情况下的压力控制\r\n2，扩容对性能的影响（目前通过先扩osd，后修改crush的方式可以控制在几分钟内）\r\n3，海量文件\r\n4，单bucket的数据规模\r\n\r\n先把几个细活干了：\r\n1，整理产品的使用手册，运维手册。\r\n\r\n2，补充s3功能的自动化测试。\r\n   完善产品规格\r\n\r\n3，改进软件日志，以及运维工具。\r\n   admin工具改造。\r\n\r\n删除pool的影响还是比较大的，在数据量多的时候。\r\n\r\n	\N	\N	17	\N	3	\N	5	6	2018-09-17 08:57:17.082662	2018-09-21 07:47:22.313228	2018-09-17	0	\N	\N	98	1	2	f	\N
409	6	21	家用电器的知识准备	思考生活中哪些家用电器是自己所需，找到适合自己的那一款	\N	\N	17	\N	3	\N	6	1	2019-05-22 04:17:24.586946	2019-05-22 04:19:22.497968	2019-05-22	0	\N	\N	409	1	2	f	\N
95	7	1	8.27	1，继续解决5.1.0的问题\r\n2，提供专利材料\r\n3，招聘es的人？	\N	\N	19	\N	3	\N	5	7	2018-08-27 07:03:46.274373	2018-09-04 15:32:30.918697	2018-08-27	0	\N	\N	95	1	2	f	\N
100	6	1	积分式绩效管理法	研究积分式绩效管理法如何改进用于研发团队。\r\n\r\n一个现实的情况是有些任务，其他人无法胜任。这个可根据人的职级来。\r\n\r\n还有点执行困难在于任务有时并非提前确定的。不过这没关系，没任务积分低是合理的。\r\n\r\n按人天算，一个季度总分120。如果能完成交代的任务则得分为120.\r\n主动发现并完成bugfix，根据问题严重程度算积分。\r\n提出模块改进建议，执行按实际情况算得分。\r\n提出新的idea被采纳，实施根据贡献情况算得分。\r\n\r\n\r\n越靠近客户越可能产生想法，并获取积分。但是这跟人的性格等也有关系。\r\n也许有人做bugfix比去客户那更容易获得积分。\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2018-09-21 12:58:07.523309	2018-09-21 12:58:07.523309	2018-09-21	0	\N	\N	100	1	2	f	\N
298	6	18	IDEA-提供跨多云的对象存储服务	解决个人或中小企业使用公有云的风险，以及性能问题等。	\N	\N	17	\N	3	\N	5	4	2019-03-06 22:59:02.527448	2019-03-12 12:48:04.774186	2019-03-06	0	\N	\N	298	1	2	f	\N
96	3	1	9.5	主要任务修复V5.1.0遗留问题\r\n\r\n\r\n完善产品细节，osd增加类似iostat性能观察命令。\r\n	\N	\N	17	\N	3	\N	5	4	2018-09-05 06:59:22.749928	2018-09-07 14:46:42.903223	2018-09-05	0	\N	\N	96	1	2	f	\N
410	6	21	厨房相关		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:20:00.893431	2019-05-22 04:20:00.893431	2019-05-22	0	\N	\N	410	1	2	f	\N
113	8	5	在货币超发的情况下，资产价格有可能下降吗？		\N	12	17	\N	3	\N	1	1	2018-10-08 19:34:34.960761	2018-10-09 05:56:33.82073	\N	0	\N	\N	113	1	2	f	\N
111	3	1	curl: Cannot assign requested address	同步rgw发出的curl请求都是失败的。\r\n\r\n\r\n登陆到服务器，使用netstat -an发现有很多TIME_WAIT。\r\n \r\n根据TCP协议定义的3次握手断开连接规定，发起socket主动关闭的一方，socket将进入TIME_WAIT状态,TIME_WAIT状态将持续2个MSL(Max Segment Lifetime)。TIME_WAIT状态下的socket不能被回收使用。TIME_WAIT累积起来会严重影响服务器性能，甚至耗尽可用的socket。	\N	\N	17	5	3	\N	5	2	2018-10-08 09:40:47.782426	2018-10-08 12:04:18.228599	2018-10-08	0	\N	\N	111	1	2	f	\N
97	3	1	9.10	1，督促完成5.2.0的开发工作\r\n2，支撑各种客户\r\n3，海量小文件与BI的技术预研\r\n\r\n4, 定位廖天伟先做各种持续小优化，邓和梁进行大特性开发。\r\n黎负责支撑对接。	\N	\N	17	\N	3	\N	5	4	2018-09-10 06:59:21.721306	2018-09-13 06:47:23.093735	2018-09-10	0	\N	\N	97	1	2	f	\N
411	6	21	卫生间相关		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:20:15.564845	2019-05-22 04:20:15.564845	2019-05-22	0	\N	\N	411	1	2	f	\N
109	6	8	为何焦虑	我们会对未来不确定性，以及身上背负的压力而焦虑，你没看到大街上，地铁上都是焦虑的面孔么？\r\n安全感缺失，恐惧笼罩于生活。\r\n\r\n如果一个人能保持内心的纯然愉悦，外物触而不动，那说明这个人至少坚定了志向，明确了得失。\r\n一切看空的人只会变得淡然，但无法让人保持愉悦。\r\n\r\n很多人并不忧虑，但是只是他们对于眼下的境况保持一种乐观，但是他们并非努力提升，这种乐观是盲目的。\r\n	\N	\N	17	\N	3	\N	5	1	2018-10-08 05:58:38.958171	2018-10-09 19:08:30.218931	2018-10-08	0	\N	\N	109	1	2	f	\N
128	6	7	C++ auto	auto变量不是引用类型的，无法使用auto来修改原变量\r\n\r\n比如 for(auto i : vec) {\r\n       auto = 1;\r\n     }\r\n这样vec是不会有任何变化的	\N	\N	17	\N	3	\N	1	0	2018-10-20 09:16:24.79969	2018-10-20 09:16:24.79969	2018-10-20	0	\N	\N	128	1	2	f	\N
236	6	1	[idea] 将ceph改造为kv系统，支持关联key的事务，支持key的全量和增量同步	将ceph改造为kv系统，提供通用kv接口能力。\r\n比如支持value上的自增运算，支持cmp等。\r\n提供基于分表的事务。通过批量操作，提高效率。\r\nobject就是一个小的子库。里面有各种类型的kv。\r\n这些kv操作之间要求有事务保障。\r\n\r\n通用的不支持事务的kv系统存在的问题：\r\n1，不能很好的支持并发\r\n2，不支持多个关联key的修改\r\n\r\n传统数据库的强项在于sql。但是sql对于应用系统来说代价有点高。性能损耗大。\r\n\r\n抽象业务系统对于元数据保存的需求。	\N	\N	17	\N	3	\N	5	0	2019-01-18 05:43:13.911546	2019-01-18 05:43:13.911546	2019-01-18	0	\N	\N	236	1	2	f	\N
115	6	7	字符编码	研究字符编码相关的问题。\r\n文件系统，软件如何处理编码问题？\r\nstring类型与编码的关系？	\N	\N	17	\N	3	\N	5	8	2018-10-11 13:08:18.394392	2019-04-29 14:59:32.898544	2018-10-11	0	\N	\N	115	1	2	f	\N
412	6	21	玄关相关		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:20:35.371449	2019-05-22 04:20:35.371449	2019-05-22	0	\N	\N	412	1	2	f	\N
99	3	1	9.18(海量文件问题)	xfs在大量空洞时性能下降非常明显，非常奇怪的一点时，如果我申请非常多的8k文件，然后全部删除。\r\n这样为啥在文件系统还有空洞呢？ 无法自动合并这些空间，以便后续可以高效实用吗？\r\n\r\n另外通过该问题，暴露了我自身的一些问题：\r\n1，面对任何问题，都应该扑上去，问题就是经验啊\r\n2，linux基础薄弱，必须强化。\r\n3，bcache如果看磁盘没啥压力，那说明问题在调用栈上。\r\n调用栈不一定在应用软件，还有可能是在系统软件上。\r\n4，提供工具，快速分析每个osd节点的性能情况、\r\n	\N	\N	17	5	3	\N	5	0	2018-09-18 23:00:54.742419	2018-09-18 23:00:54.742419	2018-09-18	0	\N	\N	99	1	2	f	\N
91	3	1	大块读性能	磁盘使用direct方式随机读性能比非direct好\r\nfio -ioengine=sync -thread -iodepth=64 -group_reporting -bs=1M -filename=/dev/sdc -numjobs=64 -size=600G -rw=randread -runtime=300 -name=1M_random_read -norandommap\r\n\r\nfio -ioengine=sync -direct=1 -thread -iodepth=64 -group_reporting -bs=1M -filename=/dev/sdc -numjobs=64 -size=600G -rw=randread -runtime=300 -name=1M_random_read -norandommap\r\n\r\n但是如果增大预读，性能就接近了。\r\n[root@localhost ~]# cat /sys/block/sdc/queue/read_ahead_kb \r\n128\r\n[root@localhost ~]# fio -ioengine=sync -thread -iodepth=64 -group_reporting -bs=1M -filename=/dev/sdc -numjobs=64 -size=600G -rw=randread -runtime=300 -name=1M_random_read -norandommap\r\n1M_random_read: (g=0): rw=randread, bs=(R) 1024KiB-1024KiB, (W) 1024KiB-1024KiB, (T) 1024KiB-1024KiB, ioengine=sync, iodepth=64\r\n...\r\nfio-3.1\r\nStarting 64 threads\r\n^Cbs: 64 (f=64): [r(64)][1.3%][r=35.0MiB/s,w=0KiB/s][r=35,w=0 IOPS][eta 04m:56s]\r\n	\N	\N	17	\N	3	\N	5	4	2018-08-15 09:04:24.304176	2018-08-17 11:46:10.24061	2018-08-15	0	\N	\N	91	1	2	f	\N
101	3	1	9.25	1，考虑合并全局osd性能统计工具\r\n2，整理常用性能分析工具，以及分析套路。\r\n3，特性规格文档整理	\N	\N	17	\N	3	\N	5	1	2018-09-25 09:32:28.298942	2018-09-25 09:48:11.862598	2018-09-25	0	\N	\N	101	1	2	f	\N
166	6	7	关于share everything， share disk， share nothing	现在这种提法比较少见了，分布式系统基本都是share nothing架构的，也就是处理节点拥有独立的cpu，内存，磁盘等资源。\r\n\r\nhttps://www.jianshu.com/p/e4562faeef25	\N	\N	17	\N	3	\N	5	0	2018-11-15 09:32:10.866447	2018-11-15 09:32:10.866447	2018-11-15	0	\N	\N	166	1	2	f	\N
102	6	1	关于S3 V4鉴权	https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html\r\n\r\nV4鉴权有几个地方与V2不同：\r\n1，算法不同 \r\n2，可以支持对数据进行保护\r\n\r\nhttps://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-auth-using-authorization-header.html\r\n数据校验有2种情况，chunked和非chunk，这里chunked并非分片上传。\r\n请求过来之后，根据http header中携带的校验值与上一次读取数据计算出来的payload_hash进行比较。\r\n\r\naws4_auth_streaming_mode是什么概念？\r\n\r\nIf you choose chunked upload options, set the header value to STREAMING-AWS4-HMAC-SHA256-PAYLOAD.\r\n就是说chnked方式必须携带该Header	\N	\N	17	\N	3	\N	5	0	2018-09-26 12:30:54.052813	2018-09-26 12:30:54.052813	2018-09-26	0	\N	\N	102	1	2	f	\N
413	6	21	客厅相关		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:20:53.040541	2019-05-22 04:20:53.040541	2019-05-22	0	\N	\N	413	1	2	f	\N
105	6	8	中国人的思想观念	根子在于什么？\r\n在于政治形态。\r\n\r\n缺乏完全的人格尊严，没有人格平等的观念\r\n骨子内内在的等级观念\r\n没有内在的民主自由的能力\r\n培养的都是贪婪，软弱，恐惧的个体。\r\n\r\n没有完整的人哪有什么百家争鸣。\r\n控制和弱化公民。\r\n\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2018-10-06 21:35:53.648936	2018-10-06 21:35:53.648936	2018-10-06	0	\N	\N	105	1	2	f	\N
167	6	4	Veritas Cognitive Object Storage	法规遵从性保证: Regulatory compliance assurance	\N	\N	17	\N	3	\N	5	1	2018-11-15 13:26:05.023975	2018-11-15 16:25:30.119834	2018-11-15	0	\N	\N	167	1	2	f	\N
414	6	21	主卧相关		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:21:07.414725	2019-05-22 04:21:07.414725	2019-05-22	0	\N	\N	414	1	2	f	\N
108	6	5	权力	权力的本质就是选择，选择决定了未来的方向，集体的兴亡，甚至是物种的发展，历史的车轮。\r\n\r\n权力来自于集体的馈赠，或者野蛮的剥夺。这是斗争的核心。\r\n\r\n所以于个人而言，政治形态是首要的，其次是经济形态。\r\n\r\n个人如果不具备独立精神与意志，就不具备独立的政治认知。也不会参与zz斗争之中。\r\n但不选择也是一种选择，麻木的观众是绝大多数的存在。	\N	13	17	\N	3	\N	5	1	2018-10-07 22:25:46.323543	2018-10-08 19:31:31.274365	2018-10-07	0	\N	\N	108	1	2	f	\N
168	6	10	华为存储产品	了解华为的各种存储产品	\N	\N	17	\N	3	\N	5	1	2018-11-15 16:51:31.233883	2018-11-15 16:51:42.201638	2018-11-15	0	\N	\N	168	1	2	f	\N
112	8	5	在外汇严格管制的情况下，外资如何出逃？		\N	12	17	\N	3	\N	1	2	2018-10-08 19:33:55.071188	2018-10-08 19:48:06.71412	\N	0	\N	\N	112	1	2	f	\N
114	6	6	认真的态度	人如果做事情没有认真的精神，就缺了点意思。\r\n\r\n没有认真的精神，事情就做得比较粗糙，不追求极致，做出的事就缺了点精神。\r\n\r\n一桩事就是一桩事，要不不做，要么就做出水平。\r\n\r\nWhen a task is once begun never leave it till it’s done. Be the labor, great or small, do it well or not at all.	\N	\N	17	\N	3	\N	5	1	2018-10-09 18:49:03.389057	2018-10-09 19:05:49.014813	2018-10-09	0	\N	\N	114	1	2	f	\N
415	6	21	次卧相关		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:21:20.121161	2019-05-22 04:21:20.121161	2019-05-22	0	\N	\N	415	1	2	f	\N
416	6	21	儿童房相关		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:21:40.14616	2019-05-22 04:21:40.14616	2019-05-22	0	\N	\N	416	1	2	f	\N
117	6	9	如何有效的聚餐，聚餐时该如何交流？		\N	\N	17	\N	3	\N	5	0	2018-10-12 06:49:33.36202	2018-10-12 06:49:33.36202	2018-10-12	0	\N	\N	117	1	2	f	\N
121	3	1	filestore目录预分裂问题	pg_num  320\r\n\r\nhex: 140\r\n\r\nseed + 320\r\nseed: 1  001  141 281 3C1 501 641 781 8C1 A01 B41 C81 DC1 F01 \r\n \r\n给出一个函数，计算hash值情况，然后创建pg。 可提供参数，允许pool支持提前创建，这样可加快实际执行速度。\r\n参数限制预创建的目录总数，这样就基本可以控制一个pool的对象总数。	\N	\N	17	\N	3	\N	5	6	2018-10-16 09:45:25.556259	2018-10-19 07:43:08.175809	2018-10-16	0	\N	\N	121	1	2	f	\N
130	3	1	2018.10.22	1，完成bugfix\r\n2，完成规格文档\r\n3，完成bugfix合入\r\n\r\n\r\n1，调研分布式存储的未来\r\n2，调研分布式DB解决BI限制。	\N	\N	17	\N	3	\N	1	1	2018-10-22 06:44:26.716621	2018-10-22 11:30:09.241771	2018-10-22	0	\N	\N	130	1	2	f	\N
89	3	1	rgw缺陷记录	ceph rgw存在如下问题：\r\n\r\n1. BI使用rados对象保存，不支持增量恢复，在故障恢复时影响可用性 （使用backfill恢复机制后暂时得到缓解，deep-scrub同样有巨大影响）\r\n\r\n2. 不能很好的支持bucket跨故障域和多集群,扩展性受限。 异构集群，冷热pool等。\r\n\r\n    bucket与pool绑定，在扩展性和使用的灵活性上存在限制。\r\n\r\n3. 海量小文件直接使用rados存储代价太大。使用SSD缓存文件系统元数据之后，仍然饱受FileStore目录分裂的问题困扰。\r\n\r\n4，多版本，multisite等特性复杂度不合适（非常重要，这决定了后续大量特性开发的复杂度）\r\n\r\n5，无法支持高效的list操作\r\n\r\n6，rgw put写放大，尤其是在多版本情况下。\r\n\r\n7，nginx与rgw之间的链路出现问题，nginx无法正常upstream，一直报499错误\r\n\r\n8，双活同步仍然存在卡住的问题\r\n\r\n9，ES搜索结果不确定的问题。\r\n\r\n10，NFS对接仍然各种问题，尤其是在多版本下，会产生各种中级数据。	\N	\N	17	\N	3	\N	5	3	2018-08-08 06:40:10.59768	2018-10-11 13:00:59.977732	2018-08-08	0	\N	\N	89	1	2	f	\N
417	6	21	书房相关		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:21:54.150944	2019-05-22 04:21:54.150944	2019-05-22	0	\N	\N	417	1	2	f	\N
123	3	1	在生命周期转移时，如果有客户端写入新的对象，则存在新的对象被lc覆盖的情况	这显然是不合适的，我今天更新了一个对象，结果后台lc运行用一个老对象覆盖了新的。\r\n\r\n在生命周期完成数据转移，更新bi的时候应该对时间进行检查，如果对象已经更新，则不应该执行覆盖操作。\r\n这时生命周期转移应该失败，且主动把转移的版本数据丢入gc中。	\N	\N	17	\N	3	\N	5	0	2018-10-17 12:09:15.790019	2018-10-17 12:09:15.790019	2018-10-17	0	\N	\N	123	1	2	f	\N
118	6	6	一个人需了解的三个问题	第一个：你想到哪里？\r\n      描述越清晰说明目标越明确，思考的越多。\r\n\r\n七个习惯第一条就是积极主动，但是积极主动必须解决动机问题。积极主动背后是有原因的。\r\n有哪种没有明确目标却非常成功的人吗？存在没有明确目标却能积极主动的人吗？\r\n\r\n就像旅途一样，有些人在一路闲逛，有的人迷恋某处风景，当然不好说好坏，但是肯定这些人都无法走得很远。\r\n无法走得很远，对于一个领域而言，就是无法开拓新局面，也就不会成为最顶尖的那批人。\r\n\r\n\r\n第二个：你的能力支撑你到哪里吗？你的计划是什么？\r\n\r\n第三个：你是如何行动的？	\N	\N	17	\N	3	\N	5	2	2018-10-12 07:47:14.19471	2018-10-12 14:33:39.74926	2018-10-12	0	\N	\N	118	1	2	f	\N
119	6	1	osd满之后，修改pg数量的办法	1，修改/var/lib/ceph/etc/ceph/ceph.conf,在osd配置段加上配置项，并重启osd\r\nosd_backfill_full_ratio = 0.98 \r\n2，增加pg数量\r\n这个数据只能慢慢加，每次一个osd增加的pg数量不超过32\r\n/var/lib/ceph/bin/ceph osd pool set zone01.rgw.bucket.data pg_num 608\r\n/var/lib/ceph/bin/ceph osd pool set zone01.rgw.bucket.data pg_num 1088\r\n/var/lib/ceph/bin/ceph osd pool set zone01.rgw.bucket.data pg_num 1568\r\n/var/lib/ceph/bin/ceph osd pool set zone01.rgw.bucket.data pg_num 2048\r\n\r\n3，设置pgp_num\r\n\r\n/var/lib/ceph/bin/ceph osd pool set zone01.rgw.bucket.data pgp_num 2048	\N	\N	17	\N	3	\N	5	0	2018-10-13 08:57:32.354429	2018-10-13 08:57:32.354429	2018-10-13	0	\N	\N	119	1	2	f	\N
150	3	1	rgw 启动过程中 遇到register watch失败，在realm reload时 unwatch core掉	2018-11-09 21:28:15.154643 7fb4b93fe700 -1 *** Caught signal (Segmentation fault) **\r\n in thread 7fb4b93fe700 thread_name:safe_timer\r\n\r\n SandStone MOS V5.2.0 (aa96edc274de4f07e2d76b1df02d67173ba6c7d7)\r\n 1: (()+0x5e54c2) [0x7fb5037094c2]\r\n 2: (()+0xf5e0) [0x7fb50265d5e0]\r\n 3: (std::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::string const&)+0x18) [0x7fb502200f98]\r\n 4: (()+0x9cc4b) [0x7fb4f84aac4b]\r\n 5: (()+0x98b2f) [0x7fb4f84a6b2f]\r\n 6: (RGWRados::unwatch(unsigned long)+0x1c) [0x7fb50356349c]\r\n 7: (RGWRados::finalize_watch()+0x38) [0x7fb50356bff8]\r\n 8: (RGWRados::finalize()+0x6f9) [0x7fb5035ba1a9]\r\n 9: (RGWStoreManager::close_storage(RGWRados*)+0xf) [0x7fb5035662af]\r\n 10: (RGWRealmReloader::reload()+0x195) [0x7fb5034d4225]\r\n 11: (Context::complete(int)+0x9) [0x55646844aa79]\r\n 12: (SafeTimer::timer_thread()+0xec) [0x7fb5038e563c]\r\n 13: (SafeTimerThread::entry()+0xd) [0x7fb5038e6fdd]\r\n 14: (()+0x7e25) [0x7fb502655e25]\r\n 15: (clone()+0x6d) [0x7fb501c6134d]\r\n NOTE: a copy of the executable, or `objdump -rdS <executable>` is needed to interpret this.\r\n	\N	\N	17	\N	3	\N	5	1	2018-11-10 14:45:20.412721	2018-11-10 14:45:35.151491	2018-11-10	0	\N	\N	150	1	2	f	\N
155	8	7	关于软件架构		\N	\N	17	\N	3	\N	5	2	2018-11-11 15:28:05.587741	2019-03-05 13:08:00.350672	\N	0	\N	\N	155	1	2	f	\N
151	8	5	为何中华没走向科学繁荣之路	在封建时代社会的一切都是为了皇室和官僚体系服务。\r\n学校不会教授科学技术。决策和权力决定了社会的发展方向。\r\n\r\n试想如果当今学校不教授科学，那会是什么状态？ 一样的结果，科学无法进步。几代下来社会就会倒退。\r\n\r\n在技术保护上，现代和以前的只传嫡系并无大的区别。为什么开源那么可贵，且不可能始于中国？\r\n开源只会起源于生存压力小的地方。这是必然的。\r\n	\N	\N	17	\N	3	\N	5	0	2018-11-11 14:51:09.70136	2018-11-11 14:51:09.70136	\N	0	\N	\N	151	1	2	f	\N
124	3	1	rgw后端总是启用多版本的思考	bucket对外展示可以是非多版本的，但是内部实现是多版本的。\r\n\r\n使用多版本可解决并发相关的问题。这与我们按照时间来决定对象的新旧一样重要。\r\n尤其是内部操作与用户操作的并发场景下。\r\n\r\n比如小文件合并场景，如果正在扫描合并的文件被客户端修改，或者删除如何处理呢？\r\n\r\n但是当最终文件合并 与 生命周期淘汰，转移，CDP。\r\n\r\nGC机制为读写不一致提供了缓冲，假设我正准备读一个对象，这时被其他人删除了。但是删除是丢给gc的，所以没那么快就被干掉。\r\n于是仍然可以读取数据。这点非常重要，否则容易出现对象存在，但是没有数据的情况。\r\n\r\n假设后端使用64个线程运行任务。\r\n	\N	\N	17	\N	3	\N	5	0	2018-10-17 12:48:00.298409	2018-10-17 12:48:00.298409	2018-10-17	0	\N	\N	124	1	2	f	\N
120	3	1	2018.10.15	本周整体计划:\r\n1，完成5.2.0开发工作\r\n2，搞一次聚餐\r\n3，抽空讨论下一个版本的安排\r\n4，讨论rgw未来发展\r\n\r\n\r\n个人：\r\n1，优化rgw同步带宽显示\r\n\r\n个人能力：\r\n1，具备整体软件设计能力。\r\n2，具备带领小规模团队的能力，能够理清事和人。\r\n3，具备优秀的件开发能力\r\n\r\n这些都需要方法支持\r\n	\N	\N	17	\N	3	\N	5	1	2018-10-15 07:04:37.810455	2018-10-18 07:11:08.041753	2018-10-15	0	\N	\N	120	1	2	f	\N
153	3	1	linux 7.5 解决了拔盘D状态的问题。		\N	\N	17	\N	3	\N	5	0	2018-11-11 15:24:10.572789	2018-11-11 15:24:10.572789	2018-11-11	0	\N	\N	153	1	2	f	\N
418	6	21	生活阳台相关		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:22:24.11838	2019-05-22 04:22:24.11838	2019-05-22	0	\N	\N	418	1	2	f	\N
169	8	10	对象存储与大数据会有关系么	大数据其数据也是非结构化数据，如文件形式。使用对象存储是否有竞争力呢？	\N	\N	17	\N	3	\N	5	1	2018-11-15 17:34:11.73656	2018-11-15 17:55:37.489844	\N	0	\N	\N	169	1	2	f	\N
366	7	17	Beas对于内存和string使用的封装	BEAS架构思考：\r\nbeas的实现除了将beas功能内置为pg的子模块内，还有一种可能是将beas作为外部，内部把pg包住。	\N	\N	19	\N	3	\N	5	2	2019-04-28 13:59:25.652696	2019-05-07 14:56:02.802274	2019-04-28	100	\N	\N	366	1	2	f	\N
170	8	10	非机构化数据存储场景		\N	\N	17	\N	3	\N	5	0	2018-11-15 18:14:31.025185	2018-11-15 18:14:31.025185	\N	0	\N	\N	170	1	2	f	\N
419	6	21	水电改造		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:22:46.342071	2019-05-22 04:22:46.342071	2019-05-22	0	\N	\N	419	1	2	f	\N
152	6	8	不要在自己状态不佳的时候，做重大决定或深度思考	状态不好的时候，需要休息。\r\n\r\n世界是逻辑的，不管政治还是经济。当然人总是身处某些环境下。\r\n我们总有选择，你要做的就是看清真相，然后做合适选择。\r\n\r\n不需悲观，更不需气馁，甚至逃避。\r\n\r\n状态不好就休息，做做自己喜欢的事。将自己隐藏起来修复。	\N	\N	17	\N	3	\N	5	0	2018-11-11 14:57:20.767712	2018-11-11 14:57:20.767712	2018-11-11	0	\N	\N	152	1	2	f	\N
125	3	1	hash数据机构的限制	hash结构排序不方便，但是并发性比较好。\r\n\r\n如果后续采用分布式数据库存放元数据，还合适使用hash结构么？\r\n应该是没问题的，每个hash shard搞成一个子表。rados用来存bi的问题核心在于其只支持整表恢复。\r\n\r\n这是io被卡住的核心，另外目前的同步代码依赖于bucket shard机制，这里彻底改动会比较大。	\N	\N	17	\N	3	\N	5	0	2018-10-17 12:53:05.755158	2018-10-17 12:53:05.755158	2018-10-17	0	\N	\N	125	1	2	f	\N
126	3	1	多站点之间的数据分发	分发有三种实现方式：\r\n1，get请求发到一个zone，如果本地没数据，自动先去master zone读取数据，如果仍然读取不到则去其他所有zone遍历获取对象。\r\n2，需要异地获取的数据，都汇聚到master zone， get请求发到一个zone，如果本地没有，则去master zone拉取，如果master zone没有，返回404.\r\n3，应用自己根据用户的地域属性，在本地zone读取不到数据时，调用底层提供的copy命令从所属zone拷贝数据到本地zone。\r\n\r\n我们不推荐使用1，考虑到后续分支机构越来越多，遍历的跨地域访问会给整个系统的可用性造成影响。\r\n推荐方式2.3  该方案需进一步内部讨论 @邱尚高 @冯国毅 \r\n\r\n另外支持：\r\n1，支持配置user的所有bucket是否在zone之间同步。\r\n2，支持配置bucket是否在zone之间同步。\r\n3，支持在不同zone，以及相同或不同bucket之间copy对象。\r\n4，支持本地zone读取不到数据，去master zone读取数据。	\N	\N	17	\N	3	\N	1	0	2018-10-18 18:39:14.226232	2018-10-18 18:39:14.226232	2018-10-18	0	\N	\N	126	1	2	f	\N
158	6	1	S3协议	S3有哪些缺点：修改metadata需携带数据部分？\r\n\r\nACL不支持继承，需使用policy实现更细的权限控制。	\N	\N	17	\N	3	\N	5	0	2018-11-13 08:35:28.584143	2018-11-13 08:35:28.584143	2018-11-13	0	\N	\N	158	1	2	f	\N
127	3	1	多数据中心mdlog同步不停输出日志相关分析	ReadSyncStatus优先读取mdlog.sync-status,获取当前同步的realm epoch以及period信息。\r\n随后通过for循环获取每个shard的同步位置。\r\n\r\n注意如果是master，是获取不到信息的，但是不代表其中没有内容。\r\n\r\n通过gdb发现，mdlog_info中是realm为1的period！！！！\r\n这是没问题的，过渡到下一个period靠的是MetaSyncCR。在过渡到下一个period的时候，如果realm发生变化，应该重置marker。\r\nrealm变化其实也就是period id发生变化了。\r\n\r\nbilog_not 对于es zone无效，那么会不会因为这个导致bilog无法清理呢？\r\n不会实现原理不一样，bilog trim没有使用RGWBucketSyncStatusManager\r\n\r\n\r\n\r\nperiod history是如何管理的呢？\r\n\r\n还发现一个非常严重的bug：es的全量同步居然一直没有结束！！！\r\n可能是因为修改了es zone的num shard导致的。	\N	\N	17	\N	3	\N	1	2	2018-10-19 20:34:34.59584	2018-10-20 09:44:24.233686	2018-10-19	0	\N	\N	127	1	2	f	\N
131	7	1	王路稳面试	0，自我介绍\r\n1，使用场景介绍\r\n2，做了哪些修改，开发。如何同步社区修改\r\n3，维护中遇到的问题，性能问题的排查\r\n4，rbd和rgw缺陷的思考\r\n5，对公司看法，以及工作计划\r\n\r\n记住只问不答，不讨论。不说明我们做了什么。\r\n不需要为面试人设计问题，只需明确我们的招聘需求。\r\n\r\n需求：\r\n1，运维人员，能定位ceph，rgw的问题，linux环境以及性能问题。\r\n2，开发人员，开发具体特性，需要对rgw具体特性细节比较熟悉	\N	\N	19	\N	3	\N	1	0	2018-10-22 16:46:59.019733	2018-10-22 16:46:59.019733	2018-10-22	0	\N	\N	131	1	2	f	\N
137	6	5	政治的本质是什么？		\N	\N	17	\N	3	\N	5	4	2018-10-26 06:28:48.692014	2019-01-27 21:17:06.661844	2018-10-26	0	\N	\N	137	1	2	f	\N
132	9	1	pg均衡度，osd full默认值	集群full之后，可能需要调整2个参数：\r\n\r\n1，mos_osd_full_ratio\r\n\r\n默认值0.95，该参数会影响osdmap fullflag，osdmap中标记满之后，rados客户端不会发送写请求到osd。\r\n\r\n2，osd_failsafe_full_ratio\r\n\r\n默认值0.97,达到这个ratio之后，osd上无法执行读写操作\r\n\r\n3，osd_backfill_full_ratio\r\n\r\n默认值0.85,这个影响osd做backfill。\r\n\r\n默认值太高，操作风险非常高，可适当降低点。\r\n	\N	\N	1	\N	3	\N	5	0	2018-10-23 07:49:22.381413	2018-10-23 07:49:22.381413	\N	0	\N	\N	132	1	2	f	\N
133	8	10	私有云会长期存在么	从产品形态来说，私有云失去了云最大的特征，就是弹性扩展，以及高效率的统一运维。\r\n企业内部使用各种私有云，其数据仍然是割裂的。\r\n\r\n私有云存在的基础：\r\n1，管控数据\r\n  数据是受管控的，不用担心被公有云公司控制，比如公有云公司倒闭，或恶意陷害，以及各种捆绑销售等。\r\n\r\n2，数据安全\r\n  这里并非是网络安全等，毫无疑问，公有云在技术积累上更有优势，这里说的安全是指数据泄露的风险。\r\n\r\n3，政策推动\r\n  政策推动的项目	\N	\N	17	\N	3	\N	5	4	2018-10-23 08:52:30.550619	2019-02-10 23:03:04.394143	\N	0	\N	\N	133	1	2	f	\N
122	6	9	管理的理解	事：\r\n1，产品整体架构\r\n效率的最终体现，而且会限制公司的发展。\r\n\r\n2，产品的大技术方案\r\n这些都最终决定了事做的怎么样，产品的好坏。\r\n不可不深思熟虑啊，不能仅仅是满足功能，那样无法看到问题的本质。\r\n\r\n3，一些可能细节的遗漏，思考的全面性，严密性\r\n这可能导致一个项目的失败。\r\n\r\n4，沟通\r\n沟通不畅导致失败的例子简直到处都是。即便别人理解你字面的意思，但不一定了解背后的深意，这通常是分歧的根因。\r\n信息不流畅，则可能犯各种错误\r\n\r\n人：\r\n1，了解人\r\n这个非常深奥，且需要经验\r\n2，使用人\r\n\r\n\r\n制度机器：\r\n这是核心，没有强大的制度，就没法建立根本的优势。\r\n但是仅有制度，没有优秀的人也是白搭。	\N	\N	17	\N	3	\N	5	2	2018-10-17 09:25:35.810914	2019-04-28 14:19:36.41142	2018-10-17	0	\N	\N	122	1	2	f	\N
136	6	6	一些真相	1，修身养性，让自己变得有趣变得丰富明显比追逐欲望有意思\r\n2，起因，经过至少与结果同样重要\r\n3，关注结果并不会让人成功\r\n4，80%的人没有明确目标，80%的人缺乏计划，80%没有执行。最终成功的概率只有8%。刨除一些缺乏天赋的，一些意外中断的，再加一些缺乏运气的。\r\n在一个领域内能推动进步的人也许只占了万分之一或更低。而一个领域的主导权就掌握在这批人的手上。\r\n5，年薪千万的工作总需要人做\r\n6，一眼看穿事物本质的人与花几年才看清本质的人命运自然不一样。\r\n7，当我寻找完所有人能依赖的动力之后，发现理性本身就是最好的动力。	\N	\N	17	\N	3	\N	5	1	2018-10-26 06:08:38.544324	2018-10-26 06:13:31.689303	2018-10-26	0	\N	\N	136	1	2	f	\N
134	3	1	10.24	1，处理一个故障域不可用，导致其他故障域不可用问题\r\n2，处理双活同步，最终少同步数据的问题\r\n3，处理上传大对象，可能导致超时的问题	\N	\N	17	\N	3	\N	5	5	2018-10-24 12:44:53.255718	2018-10-27 07:52:33.892075	2018-10-24	0	\N	\N	134	1	2	f	\N
420	6	21	灯具选择		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:23:09.787663	2019-05-22 04:23:09.787663	2019-05-22	0	\N	\N	420	1	2	f	\N
141	6	1	5.2.0发布事宜	1，确定问题单状态\r\n2，输出版本的release notes\r\n3，完成文档刷新\r\n\r\n	\N	\N	17	\N	3	\N	5	2	2018-10-31 08:11:13.653304	2018-11-09 07:08:27.021977	2018-10-31	0	\N	\N	141	1	2	f	\N
156	8	1	hash结构下提升系统可用性	ceph在可用性上最头疼的问题就是一旦有部分节点故障，则整个系统可用性都是最差的情况。\r\n这就是hash的短板。\r\n\r\n能否在对象存储系统中，通过其他技术手段提升系统可用性。\r\n比如一个bi对象正在恢复，系统其实应该在非常短的时间内就能确定该状态。\r\n这时可暂停该对象的写入，与此同时可使用其他对象顶上？\r\n\r\n比如ceph的bi对象返回EBUSY的错误，或者对象等于min size的情况下，可读不可写。\r\n这时可使用另一对象来写入。完成之后后端进行合并操作。或可设置最多2-3层的故障兼容处理。\r\n\r\n值得一试。另ceph在5副本的时候，如果只有1副本故障，有必要限制写入么？	\N	\N	17	\N	3	\N	5	0	2018-11-12 07:07:13.816009	2018-11-12 07:07:13.816009	\N	0	\N	\N	156	1	2	f	\N
154	3	1	海量小文件问题，xfs 碎片整理，内存占用等问题	1，在海量小文件时，xfs可能出现大量碎片，为了分配空间，可能出现效率极低，cpu占用非常高的情况\r\n2，xfs如果attr等比较多，可能吃掉很多内存，但是这部分内存并没有详细统计在meminfo中，造成内存不知不觉被吃掉的情况。	\N	\N	17	\N	3	\N	5	2	2018-11-11 15:26:50.49892	2019-03-15 16:56:05.103095	2018-11-11	0	\N	\N	154	1	2	f	\N
159	6	1	双活同步的http请求	注意 双活同步的请求都是使用system用户发出的\r\n\r\n全量同步时，list objects请求\r\nlist_object() {\r\n    bucket=/$1\r\n    StringToSign="GET\\n\\n\\n${DateValue}\\n${bucket}/?versions"\r\n    #StringToSign="GET\\n\\n\\n${dateValue}\\n${bucket}/"\r\n    #Url="http://${host}$bucket/?versions"\r\n    Url="http://${host}$bucket/?versions&key-marker=light12822917&version-id-marker=null&rgwx-bucket-instance=synctest2:70a82b33-ffe4-4304-9e79-1eca3d30947b.16298.2:20&format=json&objs-container=true&rgw-zonegroup=018dda70-546b-4612-900a-1bea8e79e3af"\r\n    #url="http://${host}$bucket/"\r\n    #url="http://${host}$bucket/?max-keys=1"\r\n    Param="-L -X GET"\r\n}	\N	\N	17	\N	3	\N	5	0	2018-11-13 09:04:15.873669	2018-11-13 09:04:15.873669	2018-11-13	0	\N	\N	159	1	2	f	\N
157	3	1	11.12	1，解决双活同步问题\r\n2，完善规格特性文档\r\n3，招聘\r\n4，召集会议，做版本评审	\N	\N	17	\N	3	\N	5	1	2018-11-13 06:50:12.744754	2018-11-14 09:36:30.849617	2018-11-13	0	\N	\N	157	1	2	f	\N
182	6	12	0-6岁全脑潜能开发专题	学习全脑潜能开发的相关概念和基础知识，结合实践指导育儿行为	\N	\N	17	\N	3	\N	6	3	2018-11-28 13:43:16.283909	2019-05-14 12:55:36.386394	\N	0	\N	\N	182	1	2	f	\N
174	6	7	异步与多线程的思考	异步实际上将任务和资源分裂了。\r\n假设你100个线程池，如果线程都被占用则无法处理请求。\r\n\r\n如果不加超时，则整个程序像挂死一样。社区rgw也是这种工作模式。\r\n\r\n异步执行相对简单些，丢到任务队列，一旦超时就把任务给出错处理掉，没有占用线程资源。\r\n\r\n在多核下，现在流行的是一个核跑一个线程，减少线程切换开销，达到极致性能。	\N	\N	17	\N	3	\N	5	0	2018-11-18 08:08:14.278327	2018-11-18 08:08:14.278327	2018-11-18	0	\N	\N	174	1	2	f	\N
177	8	1	为啥当datalog同步的retry对象不存在时，返回的错误是-5，而不是-2	<pre><code class="cpp">\r\nfor (unsigned i = 0;\r\n       p != out_ops.end() && pb != op->out_bl.end();\r\n       ++i, ++p, ++pb, ++pr, ++ph) {\r\n    ldout(cct, 10) << " op " << i << " rval " << p->rval\r\n\t\t   << " len " << p->outdata.length() << dendl;\r\n    if (*pb)\r\n      **pb = p->outdata;\r\n    // set rval before running handlers so that handlers\r\n    // can change it if e.g. decoding fails\r\n    if (*pr)\r\n      **pr = ceph_to_hostos_errno(p->rval);\r\n    if (*ph) {\r\n      ldout(cct, 10) << " op " << i << " handler " << *ph << dendl;\r\n      (*ph)->complete(ceph_to_hostos_errno(p->rval));\r\n      *ph = NULL;\r\n    }\r\n  }\r\n</code></pre>\r\n\r\n在此处的complete为：\r\nstruct C_ObjectOperation_decodevals : public Context\r\n\r\n注意此时传入的参数为0，并非是m->result中的-2.\r\n实际上对象不存在，内容也是空的，故而在该结构体的finish函数中decode失败。从而返回-5错误。\r\n\r\n<pre><code class="cpp">\r\ntry {\r\n\t  if (pattrs)\r\n\t    decode(*pattrs, p);\r\n\t  if (ptruncated) {\r\n\t    std::map<std::string,bufferlist> ignore;\r\n\t    if (!pattrs) {\r\n\t      decode(ignore, p);\r\n\t      pattrs = &ignore;\r\n\t    }\r\n\t    if (!p.end()) {\r\n\t      decode(*ptruncated, p);\r\n\t    } else {\r\n\t      // the OSD did not provide this.  since old OSDs do not\r\n\t      // enfoce omap result limits either, we can infer it from\r\n\t      // the size of the result\r\n\t      *ptruncated = (pattrs->size() == max_entries);\r\n\t    }\r\n\t  }\r\n\t}\r\n\tcatch (buffer::error& e) {\r\n\t  if (prval)\r\n\t    *prval = -EIO;\r\n\t}\r\n</code></pre>\r\n\r\n上述为近期master代码，并非jewel代码\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2018-11-27 12:58:01.19123	2018-11-27 12:58:01.19123	\N	0	\N	\N	177	1	2	f	\N
421	6	21	橱柜、衣柜、门的定制		\N	\N	17	\N	3	\N	6	0	2019-05-22 04:23:32.148756	2019-05-22 04:23:32.148756	2019-05-22	0	\N	\N	421	1	2	f	\N
179	6	12	游戏力实操训练营（第六课 孩子，你快点-如何帮助孩子克服磨蹭）		\N	\N	17	\N	3	\N	6	0	2018-11-28 13:35:41.997281	2018-11-28 13:35:41.997281	2018-11-28	0	\N	\N	179	1	2	f	\N
178	6	12	游戏力实操训练营（第五课 孩子，你尽管哭-如何引导孩子管理情绪）		\N	\N	17	\N	3	\N	6	2	2018-11-28 08:46:27.574673	2018-11-28 11:15:34.666578	2018-11-28	0	\N	\N	178	1	2	f	\N
180	6	12	游戏力实操训练营（第七课 孩子，你可以说不-如何帮助孩子面对霸凌）		\N	\N	17	\N	3	\N	6	0	2018-11-28 13:36:35.870433	2018-11-28 13:36:35.870433	2018-11-28	0	\N	\N	180	1	2	f	\N
181	6	12	游戏力实操训练营（第八课 孩子，你不可以-如何帮助孩子建立规则意识）		\N	\N	17	\N	3	\N	6	0	2018-11-28 13:37:16.692417	2018-11-28 13:37:16.692417	2018-11-28	0	\N	\N	181	1	2	f	\N
369	6	7	设计机器	1，定义问题规模，并理解问题本质\r\n2，对问题涉及的各方面进行分解->模块或组件\r\n3，对每个模块或组件进行抽象，并了解其发展变化的可能性，软件生命周期内可能的大变化。\r\n4，关键路径的核心算法\r\n5，理解现有系统，现有系统的抽象，并加以运用。\r\n6，分析DFx，以及对现有模块产生的影响	\N	\N	17	\N	3	\N	5	2	2019-04-28 17:17:56.261464	2019-05-08 15:44:06.630709	2019-04-28	0	\N	\N	369	1	2	f	\N
368	6	15	羽毛球算法	V1.0：\r\n1，抬起脚根，抬起拍子，准备接球\r\n2，追高点\r\n3，放松(必须自信)展开击球，打到对方难受的地方 （需知彼）\r\n4，有节奏的回动到逻辑中心	\N	\N	17	\N	3	\N	5	3	2019-04-28 15:05:44.498039	2019-05-18 20:30:29.549856	2019-04-28	0	\N	\N	368	1	2	f	\N
21	3	1	文件系统空间足够，但是没法分配inode	no space left\r\n\r\nhttp://www.zphj1987.com/2017/09/04/osd-has-inode-cannot-write/#more\r\n\r\n谢锐(x8671r@163.com)  12:03:29\r\n默认来说inode chunk 为64 ，也就是需要64*inodesize的存储空间来存储inode\r\n马四<hosfore@qq.com>  12:04:06\r\n我也在看这句话\r\n\r\n谢锐(x8671r@163.com)  12:04:23\r\nblocksize = 4096 \r\n那就是要32个block\r\n马四<hosfore@qq.com>  12:05:22\r\ninode chunk  是包含64个inode的信息 吗？\r\n谢锐(x8671r@163.com)  12:06:51\r\n估计是为了提高分配效率吧  一次搞一个太碎片了\r\n马四<hosfore@qq.com>  12:07:28\r\n  Inode的分配是以64个inode为一个chunk进行分配的。\r\n嗯 inode是动态分配的，一次分配一个chunk（64个）\r\n\r\n	\N	3	18	5	3	\N	5	1	2017-10-19 09:51:50.13149	2019-04-15 08:50:08.660586	2017-10-19	0	\N	\N	21	1	2	f	\N
191	6	15	羽毛球战术	1，重杀目标就是得分\r\n2，点杀，劈杀以落点取胜\r\n3，平高球，平抽挡都是追求速度，打转身，配合，反应\r\n4，小球是为了造机会或过渡的。	\N	\N	17	\N	3	\N	5	1	2018-12-02 12:46:39.885435	2019-01-11 10:19:36.009026	2018-12-02	0	\N	\N	191	1	2	f	\N
160	8	1	http包解析	1，相应的包，header部分长度如何知道？\r\n2，header总长度有何限制？\r\n3，如何解析的？	\N	\N	17	\N	3	\N	5	0	2018-11-13 12:14:17.027784	2018-11-13 12:14:17.027784	\N	0	\N	\N	160	1	2	f	\N
172	6	12	游戏力实操训练营（第四课 妈妈，不要走-如何应对孩子的分离焦虑）		\N	\N	17	\N	3	\N	6	2	2018-11-16 16:11:31.345625	2018-11-28 09:29:24.685065	2018-11-16	0	\N	\N	172	1	2	f	\N
140	3	1	10.29	流程优化: trace每个步骤，按步骤的核心思想做好。\r\n按照经验，转测需提前预留2天开发自验证，尤其是大量特性合入的时候。\r\n\r\n本周任务：5.2.0的bugfix。\r\n	\N	\N	17	\N	3	\N	5	5	2018-10-30 08:47:55.3996	2018-10-30 18:32:41.51884	2018-10-30	0	\N	\N	140	1	2	f	\N
256	3	1	osdmap更新机制，以及过多osdmap问题	1，osdmap能否跳跃更新？ 比如我当前是1，但是系统已经到了10万了。不能一个一个更新吧。\r\n  出现这种情况跟osd状态有关系，如果有pg处于creating或un clena状态，osdmap保留时间会延迟。\r\n2，osdmap占用的内存有多少？\r\n3，osdmap prune机制。	\N	\N	17	\N	3	\N	5	1	2019-01-29 10:33:02.351425	2019-01-30 09:44:26.050243	2019-01-29	0	\N	\N	256	1	2	f	\N
175	6	1	multisite模块可定位能力增强	cr dump 反应每个cr的状态，包括执行状态，被谁阻塞，是否在sleep等等。\r\n\r\n另外需分析是否可能存在挂住的情况，发现时可让同步rgw果断自杀	\N	\N	17	\N	3	\N	5	3	2018-11-23 14:43:28.888274	2018-11-27 09:49:57.075931	2018-11-23	0	\N	\N	175	1	2	f	\N
258	3	1	大量站点的问题	1，支持几十个分支机构？\r\n2，如何控制同步时间？	\N	\N	17	\N	3	\N	5	0	2019-01-30 23:19:21.576497	2019-01-30 23:19:21.576497	2019-01-30	0	\N	\N	258	1	2	f	\N
163	6	7	性能分析探索	性能分析可以以延时为起点，并发能力下降通常也与延时有关系。\r\n能否清晰的看到每个环节的延时就比较好分析了。	\N	\N	17	\N	3	\N	5	3	2018-11-14 11:39:10.367315	2019-03-29 13:05:11.345994	2018-11-14	0	\N	\N	163	1	2	f	\N
164	8	1	如果bucket policy允许其他用户访问bucket的对象，但是object的acl默认是只属于owner的，这时可以访问么？	也就是说bucket policy与object acl是什么关系？	\N	\N	17	\N	3	\N	5	1	2018-11-14 12:05:50.499633	2018-11-14 12:15:12.025418	\N	0	\N	\N	164	1	2	f	\N
176	3	1	大压力时请求超过600s，rgw超时挂掉问题	显然请求超时，rgw挂掉对于业务rgw非常不合理。会导致业务中断	\N	\N	17	\N	3	\N	5	0	2018-11-27 12:07:47.50261	2018-11-27 12:07:47.50261	2018-11-27	0	\N	\N	176	1	2	f	\N
148	6	12	游戏力实操训练营（第一课 妈妈，你走开-如何与孩子重新建立联结）	https://mp.weixin.qq.com/s/3MOAMMozbmGH7XbapaBfGA	\N	\N	17	\N	3	\N	6	14	2018-11-04 09:30:44.809519	2018-11-28 11:16:24.804825	2018-11-04	0	\N	\N	148	1	2	f	\N
173	6	9	年度演讲主题：科学做事，合适做人		\N	\N	17	\N	3	\N	5	1	2018-11-18 07:34:30.832376	2018-11-18 07:35:26.518105	2018-11-18	0	\N	\N	173	1	2	f	\N
171	3	1	5.2.0版本大压力测试暴露的问题	1.osd full处理欠缺，遗漏。导致osd可能写到100%\r\n\r\n2，rgw在大压力下，会出现请求超时，会残留rados对象，数量不少\r\n\r\n3，大压力下，rgw会出现超时，尤其是大对象	\N	\N	17	\N	3	\N	5	11	2018-11-16 14:39:28.763877	2018-11-18 07:59:41.337927	2018-11-16	0	\N	\N	171	1	2	f	\N
183	3	1	499问题	当rgw处理慢时，rgw来不及处理足够的客户端请求导致堆积。\r\n在这种情况下 我们期望的结果是部分请求可以被正常处理，而不是所有请求都返回499错误。	\N	\N	17	\N	3	\N	5	1	2018-11-28 14:29:48.203388	2018-11-28 14:30:57.116204	2018-11-28	0	\N	\N	183	1	2	f	\N
139	6	7	软件工程方法总结	0，目标与价值\r\n1，架构，组件，模块\r\n2，测试，仿真体系\r\n3，流程与质量\r\n4，工具与效率	\N	\N	17	\N	3	\N	5	1	2018-10-29 13:25:42.889055	2018-12-01 08:05:28.276864	2018-10-29	0	\N	\N	139	1	2	f	\N
165	6	9	任务管理	使用任务来管理日常工作，给予合理的时间，但是需要个人自己推动任务的完成。\r\n让每个人自治，每个下层组织自治，确保目标达成。\r\n\r\n任务：\r\n1，目标(描述尽可能明确，范围清晰)：\r\n2，时间安排(合理)：\r\n3，输出(代码以及其他输出如文档，分享等)	\N	\N	17	\N	3	\N	5	2	2018-11-14 12:48:17.638876	2018-12-06 14:08:57.82776	2018-11-14	0	\N	\N	165	1	2	f	\N
184	6	15	发力心得总结		\N	\N	17	\N	3	\N	5	4	2018-12-01 16:22:44.500425	2018-12-01 16:24:03.521589	2018-12-01	0	\N	\N	184	1	2	f	\N
188	6	15	羽毛球运动特征	羽毛球是一个频繁多向折返的快速多变的羽球运动。\r\n其硬件条件是羽毛球，球拍，球网以及场地。\r\n\r\n但是并不需要很强的力量，没有身体对抗。但是运动量非常大，需要整个身体快速反应，整体协调。\r\n\r\n快速的放松和舒张的过程，就像发动机一样，公交车堵车时的操作。\r\n就是一个不断肌肉收缩，肌肉放松的过程。\r\n\r\n\r\n大健身，不仅锻炼肌肉，还得锻炼关节。平时运动中要注意不能过度。\r\n如果身体强度只允许高强度的活动一个小时，那就不能过度。\r\n\r\n身体强壮是一个循序渐进的过程。可每天坚持一个小时的运动，但是运动内容要根据需要调整。\r\n\r\n羽毛球特征：\r\n1，快速\r\n2，多点移动\r\n3，拍类运动的发力\r\n4，碰撞\r\n\r\n2是步伐面临的核心挑战，多点运动，最好的策略当然是每次打球都回到逻辑中心。\r\n这里说逻辑中心，是因为其跟球的落点有关系，一般球回到哪个半场逻辑中心就偏向哪个半场。还有如果对手不会打高远球，那逻辑中心可以靠前，如果对手不会小球，那逻辑中心可能偏后。\r\n身体从静态启动最好是一个慢到快的过程，多余的发力是没必要的，击球的最后一步最快，这个节奏非常重要。\r\n\r\n3是羽毛球发力的精髓，拍击类运动是拍作用于物体，应该都讲究接触瞬间的速度。所以羽毛球发力的内外旋和手腕很重要，想象甩鞭子，甩手上水，甩灭火柴的过程。手腕可以产生瞬间高速，但是手臂很难，而且手臂很重，容易累。\r\n一个更好的理解是这样的:\r\n大臂可以挥动，让球拍有一个初速度。但这得看引拍距离，短距离大臂引拍效果不好（这就解释了为什么反手防守球一般不用大臂）\r\n小臂和手腕旋甩进一步加速\r\n最后一步是紧，对于正手是食指压，对反手是大拇指顶，目的是防止反弹。\r\n\r\n4，碰撞\r\n上述紧的一步对于碰撞很重要，要尽量保持正面碰撞，这样可以能量最多的转化。\r\n声音由震动产生，击球的声音就是拍网的震动产生的，接触短促，震动越大声音就脆响。\r\n\r\n羽毛球对战策略：\r\n1，打球远离对手的逻辑中心\r\n2，攻击对方的弱点\r\n   弱点主要体现在：跑位特征，发力技巧掌握等。\r\n\r\n声音吧，确实很复杂，正确来说，声音并不是物体振动就发出了声音，而是，产生了振动，并引起周围空气振动，此刻，并没有声音产生，声波随着空气等介质传入耳朵后，耳朵中的鼓膜产生振动，对大脑产生信号，这是人听见声音，使大脑为了让人能感到振动的存在而自己产生的，诗人在进化过程中逐渐形成的一种功能，所以说，物体振动只能产生振动，在介质中可以产生声波，而真正人能听见声音，是耳朵的功能，物体振动并不发声，只是人耳能把振动传给大脑，大脑分析成让人能了解到的声音\r\n拍线的振动特点 与 声音的关系还没看到特别细的文章研究，后面可以检索下。\r\n\r\n从新总结下特征：\r\n1，羽拍击打的球类运动\r\n2，特有的场地\r\n3，一来一回的\r\n\r\n等级一：会发球，能接身边的顺手球\r\n等级二：能接反手球，主动情况可以拉到后场\r\n等级三：主动情况，能打主动小球和后场球，可以快速移动。\r\n等级四：步伐合理，发力良好，能回高质量被动球。\r\n\r\n发力的几种境界：\r\n1，大臂\r\n2，小臂\r\n3，手腕，手指\r\n\r\n羽毛球是一个发力不断叠加的过程，或者说叫逐节发力。从腰腹的摆动，到大臂的挥动，到小臂内外旋，到手腕的收与展，手指的顶与压。这种力量的叠加，最终通过弧线运动体现在球拍速度上。\r\n上一节完成发力之后下一节继续，要掌握这个时机节奏是需要长期训练的。\r\n\r\n为什么要放松？\r\n上一节的力量要传递到下一节，那么下一节必须放松，想想甩腕的过程，而下一节启动发力的时候更小的一节也得放松。\r\n\r\n有了拍子的速度，还得很好施加到球上，羽毛球击球过程就是一个碰撞过程。\r\n除了小球和吊球，抽打要尽量保持正面且在甜区碰撞，且碰撞时保持球拍的刚性，这样可以达到最好的能量转换效果，出去的球速度就会非常快。\r\n\r\n为什么前场球不能甩大臂？\r\n我觉得主要是时间因素，前场球反应时间短，挥拍空间有效，以拍为杠杆支点，通过甩手腕和手指顶压可以在更小空间内更快加速，且击打的精准度更好。而后场球因为球速慢，有足够的时间和空间来完成逐节加速，所以可以利用全身发力。\r\n\r\n为什么击球时要握紧？\r\n就是上述的刚性碰撞的思想，刚性并非是说在击球瞬间给球拍制动，那样就白发力了。而是要在快要碰撞到完成碰撞这极短的时间内不减速的情况下握紧球拍。所以在握紧过程中，手腕是在快速旋转的，否则就会产生制动效果。\r\n\r\n羽毛球黄金法则：\r\nrule 1: 最小发力\r\n          多节发力原则，握拍形式和发力有关系，不合适的握拍会影响发力，新手通常手和拍是一体的，发力靠大小臂。实际上显然除了后场高远，杀球等需要全身和大臂力量。其他很多球都是小臂和手腕，手指的力。发力小可以快速调整进入下一个环节。动作小还比较隐蔽，可辅助实施策略。\r\nrule 2: 精细控制\r\n          这也是羽毛球手法如此重要的原因，羽毛球是一个脑力活动，一个状态好的敌人是很难战胜的，我们必须控制调动对方，才能最大消耗对方。\r\nrule 3: 最省跑动\r\nrule 4 :最优策略\r\n          对付有缺陷的人专攻其缺陷即可。老年人体能速度是弱点，转拉后场反手球，推斜线。\r\n年轻人速度快，但是技术可能不全面。可以多打变化。反正基本三板斧吧：一反手高远，二拉斜线小球，三杀边。\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2018-12-02 12:42:08.06543	2018-12-02 12:42:08.06543	2018-12-02	0	\N	\N	188	1	2	f	\N
192	6	15	原则	羽毛球原则：\r\n\r\n保持自信，理性，集中注意力，同时放松身体\r\n提前引拍，在最早的时候击球\r\n减小前场收拍动作\r\n提前转换握拍，形成习惯\r\n缩短准备-移动引拍-击球-收拍-回动流程。\r\n击球后回到逻辑中心\r\n手指发力打前场小球，手腕小臂发力打前中场球，转身全身发力打后场球。\r\n准备时眼睛盯着球，打完之后不要看球，立即收拍，回动。\r\n高远球正面击球，碰撞效果最好。\r\n反手后场顶宽面和斜面要根据个人情况，我顶斜面发力更顺畅。\r\n保持节奏，移动中引拍，脚落地击球，否则应该可以在更早的点击球。\r\n步伐和手法都应该遵守最简原则，过渡转身也是不合适的。\r\n羽毛球发力原理：\r\n\r\n人体的结构来看，速度越慢的地方力量越大。 越是末梢速度越快，也越灵活。几乎所有运动都讲究核心力量。\r\n\r\n但是核心力量无法直接转换成速度。这就是羽毛球比较特别的地方。 它主要是一个速度性的运动。所以必须直接末梢的加速。在网上看到的钟摆理论可以比较好解释这个。羽毛球完整的发力过程是 1，蹬地 2，转体 3，摆大臂 4，甩小臂 （会产生甩腕效果，但是手腕并非发力部位） 5，压手指\r\n\r\n这是一个逐步加速的过程。其他发力都是在这个过程中删减。\r\n\r\n有了这个理论，可以解释如下问题。 为什么不能仅仅甩大臂就很好解释了，因为那样虽然力量大但是速度并不快。 为什么反手不宜转肩膀，其实效果就跟甩大臂一样。 为什么要架拍？ 其实是为了增加加速距离。架拍位置是加速起点。\r\n\r\n转体程度，取决于羽毛球和人的位置。反手打不好很大原因就是习惯问题，缺乏足够的训练很难在最佳的节奏位置上击球。\r\n\r\n发力轨迹也与球的轨迹有关系，但是整体发力过程仍然一样。\r\n\r\n如果把打羽毛球比喻成一个机器，每一个回合就是一次执行的话。 那么： 策略-》指令 发力能力-》cpu能力 发力轨迹-》执行优化 步伐-》寄存器，内存。\r\n\r\n快能弥补策略上的一些缺陷，策略可以优化执行速度。 最终拼的就是谁更快。\r\n\r\n怎么判断是否放松？其实很容易看出来，松则软。僵硬必然没放松。\r\n\r\n通常造成速度慢的几个原因： 1，发力不畅 2，击球点不合适 3，发力太晚，节奏不对 4，步伐沉重不到位。\r\n\r\n要快，必须要有节奏，步伐到了就击球。不存在步伐不到击球，或者步伐已经到位等球的情况。 不应该等球，步伐到了球未到，那就可以跳杀或者做假动作了。或者应该位置更靠前。\r\n\r\n杀球下网一般都是击球点过低，或者人步伐移动不够靠后。\r\n\r\n我的打法就是效仿李宗伟，在快速对抗中寻找机会。	\N	\N	17	\N	3	\N	5	0	2018-12-02 12:49:40.674192	2018-12-02 12:49:40.674192	2018-12-02	0	\N	\N	192	1	2	f	\N
185	6	15	发力	1，羽毛球高远球发力由蹬地，转腰，旋转大臂，内旋小臂，握紧手指等过程。\r\n每步都做好，需要注意一些细节。尤其是手指的握紧，收拍等。\r\n\r\n2，发力时步伐应该到位，身体伸展的。\r\n\r\n3，握拍与发力也关系密切，对于反手尤为明显。顶斜面在反手和正手网前都是比较舒适于发力的。	\N	\N	17	\N	3	\N	5	1	2018-12-01 16:29:31.683526	2018-12-02 12:50:25.099406	2018-12-01	0	\N	\N	185	1	2	f	\N
193	8	1	cr dump命令似乎未见meta cr的信息		\N	\N	17	\N	3	\N	5	0	2018-12-02 13:26:40.161771	2018-12-02 13:26:40.161771	\N	0	\N	\N	193	1	2	f	\N
195	6	9	代码提交的审核	1，问题单是否处理\r\n2，相关文档，规格是否修改\r\n3，review意见\r\n4，是否自测试	\N	\N	17	\N	3	\N	5	2	2018-12-03 12:44:08.381457	2018-12-06 14:13:20.504797	2018-12-03	0	\N	\N	195	1	2	f	\N
194	6	9	设计文档要素	1，需求概述\r\n  5W，明确需求价值，需求规格，时间要求等等\r\n\r\n2，实现原理描述\r\n\r\n3，任务拆分，时间安排\r\n\r\n4，文档相关，规格限制刷新\r\n\r\n5，升级影响\r\n\r\n6，自验证方法，测试建议\r\n\r\n7，review意见	\N	\N	17	\N	3	\N	5	1	2018-12-03 12:28:42.974653	2018-12-03 12:38:14.903627	2018-12-03	0	\N	\N	194	1	2	f	\N
186	3	1	rgw下一步发展的想法	1，继续定位于增强存储能力。\r\n2，支持bucket无限对象数量\r\n3，支持系统的无感扩展\r\n4，支持系统的快速演进（架构解耦，测试自动化构建）	\N	\N	17	\N	3	\N	5	4	2018-12-01 19:15:00.799198	2018-12-04 15:47:13.839632	2018-12-01	0	\N	\N	186	1	2	f	\N
187	6	15	羽毛球水平的阶段	我的理解：\r\n第一阶段：知道发球规则，不会发力。飞琳乐等都这水平\r\n第二阶段：高远发力稍微好些，可以把球打到底线了。反手可以回回直线网前，没什么步伐。 阳俊这水平\r\n第三阶段：高远发力轻松，但不到位，杀球基本能压住，反手可以打到半场，偶尔还能玩玩网前小球，但是非常糙，步伐容易站死。 目前我们都这水平。\r\n第四阶段：高远发力清脆，主动反手可以打任意位置，小球稳定性提高。有了基本的控制能力。步伐基本能到。 \r\n第五阶段：四方球非常精确到位，球速X2. 有了预判。\r\n第六阶段：球速x2,有多套技战术，各种短板得到补齐，鱼跃，劈杀。\r\n\r\n每个阶段跟上一个阶段比，估计都不会超过7个球（21个球）。11个球不超过4个。\r\n\r\n几个指标：\r\n1，力量，体能，步伐基本功 （力量）\r\n2，发力与速度（敏捷）\r\n3，战术能力 （智力）\r\n4，成败系数（经验，当然也可以纳入智力范围，经验体现了临场应变能力，情绪控制能力影响技能发挥）\r\n\r\n每个不仅用强弱来划分，而是用数值来衡量，从0到100.\r\n而总分是三位相乘。\r\n比如林丹巅峰期。\r\n80*90*90 = 648000\r\n比如我当前：\r\n5*10*10 = 500\r\n最高业务水平：\r\n60*60*60 = 216000\r\n\r\n也就是说业余最高水平跟林丹打，单个球胜率为 1/4. 21个球不会超过7个。	\N	\N	17	\N	3	\N	5	0	2018-12-02 12:36:32.318049	2018-12-02 12:36:32.318049	2018-12-02	0	\N	\N	187	1	2	f	\N
223	7	1	2018年工作总结	1，项目管理\r\n  经理了V3.1.5发布（广发升级） 5.23\r\n  V3.2.1发布（非商用） 8.1\r\n  V5.2.0发布 (受控商用) 11.25\r\n  V5.2.1 （即将发布） 1.4\r\n  版本质量，流程规范都是在逐步完善的。\r\n \r\n2，人员招聘与培训\r\n  总人数从\r\n  rgw人数从2人，扩展为5人\r\n\r\n3，流程规范\r\n  正式把迭代跑了起来，每个步骤按照一定规范执行。 \r\n\r\n4，产品架构\r\n\r\n5，开发工作\r\n\r\n6，缺点与改进\r\n6.1 在项目管理上，trace不够，需因人而异的进行管理。没有全程carry。流程执行虽然跑起来了，但是未完全达到预期。\r\n    改进想法：对工作进行分解，部分工作分摊给其他人\r\n6.2 人员招聘上因为经验不足导致了一些无用功，有1人因个人原因离开，另外一人被辞退。培训工作也迟迟才开展起来。\r\n6.3 产品架构调整未能看得更远，有些调整未能更早的识别，对于后续的升级发展有一定影响。\r\n  	\N	\N	19	\N	3	\N	5	0	2019-01-02 07:28:43.393093	2019-01-02 07:28:43.393093	2019-01-02	0	\N	\N	223	1	2	f	\N
314	6	20	我该如何踏出职业转型探索第一步？	纵观我毕业后近10年的毕业生涯，不管从哪个维度来说，都没有做到让自己满意。\r\n以前的日子是做一天和尚撞一天钟，没有太多目标，更没有太多的想法，囿于自己的认知跳不出来，总是认为那些梦想中的事情在我身上不可能发生，苦大仇深却不知去改变，温水煮青蛙的混着日子，看不到可能性。\r\n随着自己的心智不断的成熟，人也到了中年，对自己职业生涯的思考迫在眉睫，打算给自己10个月的时间，在2020年前完成这个大事。	\N	\N	17	\N	3	\N	6	2	2019-03-18 08:39:54.917283	2019-03-18 09:32:26.177639	2019-03-18	0	\N	\N	314	1	2	f	\N
238	6	7	一致性hash 与 crush	解决的问题：在使用一致哈希算法后，哈希表槽位数（大小）的改变平均只需要对 { K/n} K/n 个关键字重新映射，其中 { K} K是关键字的数量， { n} n是槽位数量。然而在传统的哈希表中，添加或删除一个槽位的几乎需要对所有关键字进行重新映射。\r\n\r\n传统hash存在的问题是将key直接映射到存储桶，桶的数量直接影响映射结果。\r\n一致性hash改进是key不直接映射桶，而是映射到中间KEY。再把node也映射到KEY同样的空间上，完成KEY到node的分配。\r\n\r\n这样node可变，KEY不变的情况下，keys不需重新映射。只需将减少的node的KEY加到其他node即可。\r\n\r\n这里分配KEY到node也有不同算法。最简单粗暴的就是一致性hash大量介绍文章中说明的将一个node的KEY丢给下一个node。\r\n但是这样显然压力不均衡。\r\n\r\n问题：\r\n1，如何将虚拟节点分配给存储node，尤其是node有权重的情况下。\r\n2，如何计算副本位置\r\n\r\n这2问题就是crush要解决的。\r\n	\N	\N	17	\N	3	\N	5	0	2019-01-19 17:16:57.755459	2019-01-19 17:16:57.755459	2019-01-19	0	\N	\N	238	1	2	f	\N
225	6	9	个人工作职责的剥离，用身边的人让自己变得成倍的强大。	目前已有角色：\r\n1，项目经理 （执行者）\r\n2，架构师\r\n3，招聘\r\n4，人员培训  能力建设\r\n5，活动组织  建立信任，活跃氛围，培养感情。让工作变得有趣。\r\n6，开发人员\r\n\r\n	\N	\N	17	\N	3	\N	5	3	2019-01-06 20:43:44.748438	2019-01-08 08:24:21.856146	2019-01-06	0	\N	\N	225	1	2	f	\N
315	6	20	职业生涯规划-小章鱼之咨询篇20190228-0336	链接第一个人为自己打开一扇窗	\N	\N	17	\N	3	\N	6	3	2019-03-18 10:19:21.233272	2019-03-18 11:59:55.030293	2019-03-18	0	\N	\N	315	1	2	f	\N
239	6	15	羽毛球发力的特征	1，小臂是内外旋运动\r\n2，手腕在垂直方向是抖，但不能压。所以必须在此方面上击球要么屏住手腕，要么将手腕在水平方向上收。\r\n3，手腕在水平方向上可以收和展。\r\n4，手指发力有大拇指顶，食指的压，还有后三指的收紧。\r\n5，击球前手臂要么是横在身前，要么外展。这两种形式其实默认都不好打右手附近的球。这种球最好垂直下肘，蹲下打。\r\n6，击球瞬间是刚性的，否则碰撞效果不好，想像球打到软强会回弹么？\r\n7，羽毛球是一个多节加速运动，越末梢越快。脚部，腰，大臂，小臂，手腕，手指。每样都练好才算发力高手。\r\n	\N	\N	17	\N	3	\N	5	1	2019-01-20 06:18:43.471628	2019-01-27 22:09:42.584083	2019-01-20	0	\N	\N	239	1	2	f	\N
241	6	6	系统是如何运作的	1，识别系统的核心部件\r\n2，搞清楚他们之间的关系，以及相互影响。知道如何牵一发而动全身。\r\n3，看到趋势与问题，调整系统架构\r\n\r\n部件：人，技术\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2019-01-21 20:37:57.936487	2019-01-21 20:37:57.936487	2019-01-21	0	\N	\N	241	1	2	f	\N
189	6	15	武术境界	http://www.cnblogs.com/secbook/archive/2013/09/09/3309333.html\r\n\r\n利剑和软剑级别：都追求快，破解对手  业余高手的境界，仍然有套路，有套路就有破解方法。区别在于谁能更快的看到对手的套路，弱点，展开攻击。\r\n重剑级别：大巧不工，这里就已经简化招式了，力量碾压  专业选手的中级境界，高远就可以拉死业余选手，重炮可以杀死\r\n木剑级别：以柔克刚  专业选手的高级境界，重炮杀不死，打太极，让对方露出破绽\r\n无剑级别：不需要武器了，这个羽毛球里面不讨论   \r\n\r\n之前业务高手和国家队的对打就是 利剑与木剑的一次较量。当然木剑水平还未及巅峰。                                       \r\n力量好的打力量差的，用不了什么招，只要能抓住弱点，不断碾压就行了。\r\n\r\n这里面有个硬件条件，就是个人的相对速度和力量。\r\n剑招就是打发。套路。\r\n\r\n羽毛球如果只有落地才算输，那木剑级别的林丹基本只有体能差的时候别人打的过，但是有界之后手感就有点重要了。\r\n\r\n如果水平相差很远，那么所有球都可以在高点和前点打，那自然对手就非常难受。	\N	\N	17	\N	3	\N	5	0	2018-12-02 12:42:46.873382	2018-12-02 12:42:46.873382	2018-12-02	0	\N	\N	189	1	2	f	\N
224	6	9	项目管理-会议	mos技术难点对策研讨。\r\n\r\n管理方法研讨。会议，任务跟踪。每个人讲述本周工作情况。有杀气，有侵略性。\r\n\r\n创新以及Idea探讨。重大问题探讨。 （创新与难关处理）\r\n\r\n	\N	\N	17	\N	3	\N	5	2	2019-01-05 14:39:18.369404	2019-01-07 14:16:43.332999	2019-01-05	0	\N	\N	224	1	2	f	\N
190	6	15	羽毛球培训记录	高远球要点： \r\n1，高点击球 \r\n2，立腕 \r\n3，鞭打 \r\n4，放松 \r\n5，一定要高，要远，否则不是高远球，就变成平高球 和 中场球\r\n\r\n2点：\r\n1，球拍要向后倒，加大引拍距离\r\n2，要正身击球，拍子别斜着引过来。\r\n\r\n搓球： \r\n1，是搓，不是弹，参见矛式搓球 \r\n2，前场步伐，最后出右脚，并且不过膝盖，便于收回。\r\n杀球： \r\n1，高点击球 \r\n2，后退充分，确保击球点靠前\r\n反手高球： \r\n1，切记要沉腕，就像正手要立腕一样 \r\n2，同样击球点要高 \r\n3，一定要面对后方，转身\r\n接杀：\r\n后退步伐： \r\n1，蹬转 \r\n2，侧身 \r\n3，并步\r\n李宗伟弹簧步本质就是蹬转快。靠小腿力量和脚的力量\r\n腿部力量，不需要任何额外设备都可以联系，手部也一样。 \r\n随便哪里都可以练习。\r\n12-10:： \r\n其实不仅高远球追求高点，所有球都应该追求高点。 \r\n当然如果想欺骗别人是另外说了。\r\n拉掉就是在普通击球的基础上收力。\r\n步伐是羽毛球的基石，看看李宗伟和林丹的步伐，真的是感觉武林高手的对决。 \r\n轻描淡写一般，但做到这种最简单，却是不容易。大音希声，返璞归真的境界。\r\n\r\n如何方便的接来自各个方位的球：\r\n1，步伐\r\n   大步伐就不说了，主要说说小步伐，尤其是反手球，将身体调整到适当的位置，使得身体可以转动，有足够的空间引拍\r\n2，握拍\r\n   绕8字的正确玩法，是要在绕的时候调整握拍姿势，迅速的转换握拍方式。\r\n3，引拍\r\n   不引拍没速度，有些球要大幅度引拍，有些球要小幅度。\r\n\r\n3-27：\r\n1，击球点应该在加速的末端，击完之后就应该放松\r\n2，击球时，手抓紧发力。\r\n其实不论对于什么球，只要想打远点都是这个道理。\r\n打远球和近球。\r\n\r\n3-29：\r\n1，其实在引拍过程中就要旋转小臂（或者说转手腕）了，不然在最高点拍子就不是正的。\r\n2，体会加速的过程。最响的地方应该在头上方附近。\r\n\r\n3-31：\r\n高远球出师了。\r\n体会：除了引拍向上的过程中，加速发力，并且拍面转正。\r\n其他阶段都是放松的，还有一点就是击球后，如果是放松的拍子应该从正前方往下落拍，而不是斜着落拍，斜着落拍说明发力了。\r\n\r\n倒排到击球应该是一气呵成的，不是先倒了然后掉在那里。羽毛球大部分动作都是三段：\r\n准备，执行，收。\r\n落拍放松的感觉。\r\n\r\n挑球也是要放松，引拍。\r\n\r\n腕力的解读\r\nhttp://bbs.aiyuke.com/thread-2438-1-1.html\r\n\r\n是的，这个youtube上面badminton universe的频道好像是创立还不久，全都是这样的平视角录像，非常便于爱好者观看研究。\r\n要是这样视角的录像多一些就好了，我个人觉得目前的转播视角不利于展现这项运动的美感。虽然上帝视角更加客观了，但是也忽略了大量细节。\r\n步伐原理：\r\n1，稳重心\r\n2，简化步伐（结合手法）\r\n3，启动，降重心，蹬转\r\n4，站位原则\r\n5，回动中如何保持重心，如何简化步伐？\r\n先一个小步子先垫一下，避免重心不稳。 回不是回到场地的中心，而是回到逻辑上最合适的点。\r\nhttps://www.zhihu.com/question/22608330\r\n\r\n\r\n4：14\r\n1，步伐有个基本规律，就是站在球场相当的位置上，并且稍微靠前。\r\n为什么呢？这样容易防直线球，直线距离最短，如果不优先防直线，很可能接不到。\r\n靠前是因为后场球球飞行需要时间，有足够时间去移动。\r\n这才是真正的回中含义。\r\n\r\n步伐总结：稳重心，回中心，快启动，慢收回。\r\n\r\n2，网前应该小退，不应该转身退。\r\n\r\n3，网前跳球，有一个小包的动作。不管打什么球，都有拍面的变化。\r\n\r\n4，高远球的手臂应该是从右上方击球，而不是正上方。\r\n\r\n5，腰部不应该转过，现在腰伤搞不好就是这么来的。各部位发力均称，而不能过度。\r\n\r\n\r\n4：16\r\n发高远球：\r\n不用搞到最低点击球，落球点和身体可以拉开点距离。\r\n网前步伐回来时候，右脚蹬地。\r\n\r\n\r\n关于脚步发力的文章\r\nhttp://bbs.badmintoncn.com/thread-675546-1-1.html\r\n\r\n\r\n\r\n击球速度 \r\n   大臂旋转，小臂内旋发力把球拍加速到非常快的速度。\r\n\r\n移动最短距离，防守最佳线路。移动最快速度\r\n\r\n5.14打球体会：\r\n回球不到位，在各种场景下回球不到位就给对手可趁之机。\r\n双打轮转不到位，没有及时转为防守式。\r\n进攻不具备特色，无进攻。\r\n\r\n体验：\r\n高远球 握紧短促发力的感觉\r\n以及步伐的垫步。\r\n\r\n感受：\r\n感受自己的握拍\r\n感受自己的走位\r\n感受自己的发力\r\n感受球路\r\n\r\n7.8：\r\n反手用大拇指顶，更容易回球，找那种感觉\r\n正手打球，在击球前放松，比如平抽球，想回球有速度就得放松打，一直紧绷打不好\r\n正手各个角度都可以平抽，可以稍微扭转身体。\r\n\r\n8.20：\r\n搓球是前场之母\r\n高远球是后场之父\r\n平抽是中场之子\r\n\r\n速度快才能获得很好的一致性，没有什么假动作，只是占了先机而已。占了先机就有多种选择。\r\n假动作背后的含义是未曾查明。\r\n\r\n9.27：\r\n反手高远球明显打的比以前好了些。但是以下地方需要加强：\r\n1，步伐\r\n2，多拍的放松与正反拍转换\r\n3，球要打到位，高远球就得真的高远。\r\n4，提前准备击球动作，该杀球的就杀球。\r\n\r\n对方出手前，我方就应该准备启动步了，对方出手。我方判断后就开始第二步了。\r\n我方回球后，就立即开始回动了。\r\n所以羽毛球就他妈是一个不停息的四方步运动.....\r\n\r\n击球后的放松过程必须有，否则多排之间无法持续发力。\r\n\r\n球拍带动身体打球，减少不必要的。\r\n\r\n所以再击打球之后，首先想到的应该是回位，放松，准备下一次击球。\r\n\r\n进入第二阶段：\r\n体能锻炼，确保自己能没压力的打完3场比赛。能够打单打。\r\n\r\n10.19：\r\n理解正反手出拍，发力，收拍过程\r\n杀球不能弹后场可能是没握紧导致的，球被弹出去了，虽然你用了很大力。然并卵。\r\n\r\n10.29：\r\n感觉自己对手腕发力的理解好了一些\r\n拿着拍子挥，反手明显手腕放松，甩的速度快很多。\r\n\r\n10.31：\r\n想参加比赛，必须攻克两个难题：\r\n1，后退步伐\r\n2，启动步伐\r\n3，反手防守\r\n\r\n羽毛球击球法：碰撞以及发声的原理\r\nhttp://blog.sina.com.cn/s/blog_51e3655d0100jmw7.html\r\n\r\n11.1：\r\n实现战术1，调动对手。\r\n根据羽毛球运动特征1，调动对手，使其做多点运动。\r\n有意图的实施战略，对于步伐问题大的对手效果必然刚刚的。\r\n正好可练习吊球技术。\r\n\r\n11.3：\r\n今天拉高远球有点感觉了，似乎听到了比较脆的声音。\r\n要点：\r\n1，还是先放松手腕，然后逐节发力，大臂到位后，小臂和手腕各节要发挥起来\r\n2，要从上面过去，不要侧面击球，打高点\r\n\r\n但是比赛的时候仍然有很多问题：\r\n1，平高球回的没有威胁，似乎架拍太慢\r\n2，高远球也没有抢好点，不知道是否为步伐问题\r\n3，前场挑球，要么不到位，要么出界。\r\n     挥拍动作也比较大。\r\n动作小的好处：可以保持重心，让自己快速进入下一回合。\r\n\r\n今天还有点进步的地方是对球的控制，前后场都可以打点小球。\r\n看来常练习各种颠球对手感还是有一定帮助的。\r\n\r\n定个目标：\r\n可以流畅的打单打，不至于出现满场乱跑，回球严重不到位的情况。\r\n能做基本的控球。\r\n\r\n\r\n11.14：\r\n如何能步伐不乱？\r\n步伐的核心不仅仅是控制重心和线路吧，就像手法显然不仅是选择打大球还是小球，控制方向。 更细微的发力是怎么样的呢？ 哪些部位应该放松？才可以更快的移动，仅仅是踮起脚跟么？\r\n当然重心也有讲究，通常重心是偏右脚的，启动步是右脚蹬地，最后一步是左脚蹬地。\r\n\r\n启，动，止。三种形态脚步发力是不一样的，如果脚尖一直用力，得不到放松那肯定会累。\r\n\r\n什么是放松？脚跟着地么？\r\n\r\n\r\n11.26：\r\n步伐快慢除了启动步之后，还有关键的蹬转。昨天练球这个毛病暴露无遗。\r\n快速蹬转的意识非常重要。\r\n另外前场球发力问题仍然没掌握，还得努力。\r\n前场搓球的意识非常弱，基本都是弹过去的。\r\n\r\n打球之前可以热身找下步伐节奏，以及手法放松感觉。\r\n中场击球可以垂下大臂，小臂带动手腕正反手挥拍，体会手腕放松的甩感觉，以及手指顶压的感觉。\r\n\r\n11.27：\r\n注意斜线步伐其实身体只需要转90多度就可以了，而不是180度。\r\n问题出在哪里呢？ 出在反手击球时身体的朝向上。如果身体朝前就不会需要转180度了。\r\n没看到有运动员一次性蹬转180度的，那样还不如搞个小转身先（经观察谌龙和李宗伟都是这样处理的）\r\n\r\n12.3：\r\n切球拍面还是尽可能平的，除非是切对角。太竖了接触面小，容易失误。\r\n步伐和动作要一致，尤其是中前场，基本都是落地击球的，身体要足够伸展。这样才是最快的击球。\r\n自信和放松是发挥最佳自己的不二法门。	\N	\N	17	\N	3	\N	5	1	2018-12-02 12:43:28.403527	2019-01-11 10:21:23.137909	2018-12-02	0	\N	\N	190	1	2	f	\N
316	6	20	职业生涯规划-二丫儿之教育行业探索篇20190309	链接一个人\r\n了解教育行业相关资讯	\N	\N	17	\N	3	\N	6	0	2019-03-18 11:59:07.819869	2019-03-18 11:59:07.819869	2019-03-18	0	\N	\N	316	1	2	f	\N
243	6	6	组织-顶在前面的那个石头	每个组织都有顶在前面的那个石头。后面的人也许可以感受优胜劣汰，但前面那个非常明显。\r\n但是前面的石头好处在于其可以发展状大。而后面的石头其命运可能取决于前面的石头。\r\n\r\n当你想做前面的石头时，想想自己准备好了吗？\r\n艰辛与残酷。想想成吉思汗铁木真的处境。	\N	\N	17	\N	3	\N	5	0	2019-01-21 20:47:44.848411	2019-01-21 20:47:44.848411	2019-01-21	0	\N	\N	243	1	2	f	\N
257	6	15	羽毛球单双打特征	双打人多注定了其打法与单打不一样。\r\n双打慢基本就是死，因为别人可以在网前各种抓。\r\n而且双打的局势变幻更快，需要两个人很好的配合，如果有很大漏洞，则容易被攻破。\r\n\r\n\r\n单打一个人击球，战术可根据自己的想法灵活变化。假动作更多样化。\r\n很难提前预判去抓球。打不死的情况下，四方球比稳定性，比耐心，控制节奏也是很好的打法。	\N	\N	17	\N	3	\N	5	0	2019-01-30 23:17:02.8896	2019-01-30 23:17:02.8896	2019-01-30	0	\N	\N	257	1	2	f	\N
103	6	6	学习与学习方法	h1. 学习的理解\r\n\r\n学习包含两个大的方面，一是掌握知识，二是练习运用。\r\n\r\n掌握知识可以看成去理解现有系统，一个系统中有树根，枝干，树叶。有各种公理，定理，还有原则, 经验。事物为何存在？ 解决什么样的问题？\r\n事物之间的联系是什么？\r\n\r\n练习运用就是形成思考习惯，在遇到问题时能够使用知识来处理新的问题。\r\n\r\nh1. 学习的动机\r\n\r\n学习是一种行为，有行为必然有动机，学习的动机通常是为了适应变化。\r\n为了更好的在环境中生存。\r\n\r\n在生存问题得以缓解之后，很多人就停止了继续学习，这是因为学习本身通常并非一个非常有趣的事情。\r\n只有极少人能从学习中获得满足感，这是人从出身的差异，以及在生长过程有关系。\r\n\r\n如果世界上有1000多个通用领域，每个领域大约有几百万人，但是其中能保持持续学习，不断精进的可能只有一万人。\r\n这一万人基本占了该领域的90%市场。\r\n为什么其他人不能保持持续学习呢？因为他们还不足以狂热，他们把精力耗算在多个领域上，但都不专业。比如玩游戏，听音乐，看电影，旅游消耗了大量时间，\r\n但是大部分人仅仅是在消费时间，他们无法成为这些领域的顶尖人物。也不是在精进，不是在投资自己的时间。\r\n有少数人能从其他领域获取灵感，寻找事物的关系，这其实仍然是在本领域内投资时间的，毕竟他一直在思考相关问题。\r\n\r\n唯有爱和兴趣能让人持续投入，只有这样才会成为顶级高手，压力之下固然也有高手，但这是一种畸变的力量，最终会反噬自己。\r\n\r\nh1. 学习方法\r\n\r\n有了动机之后，学习就简单了。学习就是不断琢磨，熟悉公里，定理，事物之间的关系然后不断练习的过程。\r\n其中关键点我觉得是把基本观念纳入思考习惯，以及对于事物关系的整理和记忆。现在人脑基本不会作为记忆的载体。\r\n但是当出现某种问题，能够联系到相关的知识仍然是需要的。\r\n\r\n持续学习方法，讲究学习结果的累加特性。也就是说我们每天都是进步的。这想想都非常激动。\r\n通过持续学习，我们可以确保自己一直在稳健的进步。\r\n\r\n通过对学习的理解，我们知道持续学习关键在于：\r\n1，持续的积累知识，什么是知识？ 原理，联系，问题，规律都是的。\r\n2，持续的锻炼，无论何时何地我们都可以进行思维锻炼，当然也可以进行身体锻炼。\r\n\r\n但是每一步走扎实非常重要，流于形式或者浮于表面的阅读都无法达到学习的目的。或者说无法实现高效的学习。\r\n通过记录的方式来整理自己的知识非常重要。\r\n	\N	\N	17	\N	3	\N	5	5	2018-10-06 18:49:27.044087	2019-04-03 07:08:06.767609	2018-10-06	0	\N	\N	103	1	2	f	\N
262	6	8	修身齐家治国	修身好理解，断绝各种恶念，以及修复原生家庭伤痛。让自己身心健康，正心，明辨是非。知道该如何做事。\r\n齐家要求就更高，不仅需了解自己，还需了解亲人，能换位。从不同人来看待一个整体。明白每个人的疾苦。\r\n同时还能处理好每个人之间的矛盾纠葛。\r\n治国需要看的不仅是亲人，需要看各种人，利益团队。要平衡好，做成事就更难了。	\N	\N	17	\N	3	\N	5	1	2019-02-12 10:28:54.919612	2019-02-12 10:33:14.471775	2019-02-12	0	\N	\N	262	1	2	f	\N
259	8	1	统一存储合适吗？	我们知道事务之间是有差别的，同时也有共性。\r\n当我们决定将事务统一时，考虑因素是什么？\r\n\r\n对象存储其特征决定了其对存储一致性要求相对低。\r\n甚至丢1，2个对象关系不是非常大。\r\n\r\n对于分布式系统而言，其可用性至关重要。如何在面对大规模集群经常有磁盘故障，网络故障时保持可可用。\r\n同时尽最大可能的找到数据。 这也是人脑存储的模型。\r\n\r\n采用多版本	\N	\N	17	\N	3	\N	5	1	2019-01-31 04:55:46.338309	2019-02-08 12:57:50.114926	\N	0	\N	\N	259	1	2	f	\N
260	3	1	蔚来环境无法恢复暴露的问题	1，ec下节点频繁故障造成内存暴涨无法恢复。\r\n2，ntp服务有且只有一个\r\n3，允许舍弃部分数据，恢复集群可用性。\r\n4，15个host操作效率就已经非常低下。监控运维必须加强。\r\n\r\n	\N	\N	17	\N	3	\N	5	5	2019-02-08 10:25:18.599097	2019-02-15 12:34:20.408739	2019-02-08	0	\N	\N	260	1	2	f	\N
138	8	8	如何改善人际关系？	1，如何打破沉默？你想要什么样的人际关系？ 你需要别人怎么待你？\r\n2，每个人对于人际关系的敏感度不一样，有些人也不会意识到去建立怎样的人际关系，以及其重要性，意义是什么？\r\n3，无法主动建立人际关系，无感一样，就像打羽毛球一样，有些人打了一辈子，但是从未研究过怎么样打合适。在人际关系领域也是一样。\r\n\r\n4，内向的人对别人缺乏信赖，缺乏与他人建立正常关系的经验。比如小时候就很少与朋友游玩，聚餐，聚会等。喜欢用消极心态防御。\r\n5，寻找有趣的灵魂，有意义的交谈，有趣的过往。 这些比独守自己，比无聊的游戏，以及垃圾文章有趣的多。	\N	\N	17	\N	3	\N	5	2	2018-10-26 07:05:25.289584	2019-02-12 10:19:33.385204	\N	0	\N	\N	138	1	2	f	\N
263	6	8	管理与统治的区别	管理者只是被人赋予了管理权限，这种权力是有限的，受控的。比如羽毛球群的群主。\r\n纯粹是提供服务的。\r\n\r\n而统治者是有绝对权力的，是可以干掉，清除被统治者的。\r\n\r\n这体现了2者之间的对等关系。一个强大一方弱化的结果。	\N	\N	17	\N	3	\N	5	1	2019-02-12 10:42:10.226322	2019-02-12 14:16:35.211381	2019-02-12	0	\N	\N	263	1	2	f	\N
264	7	16	2019-2-15	1，蔚来问题总结\r\n2，项目整体进展情况了解\r\n3，BP版本规划讨论\r\n4，5.3.0代码review	\N	\N	19	\N	3	\N	5	0	2019-02-15 07:08:26.643838	2019-02-15 07:08:26.643838	2019-02-15	0	\N	\N	264	1	2	f	\N
266	3	1	系统磁盘空间满时rgw会挂掉？		\N	\N	17	\N	3	\N	5	0	2019-02-15 13:22:29.152868	2019-02-15 13:22:29.152868	2019-02-15	0	\N	\N	266	1	2	f	\N
269	7	16	分析多个站点跑在一个集群上存在的问题		\N	\N	19	\N	3	\N	5	2	2019-02-16 14:02:17.085703	2019-02-19 07:21:22.293188	2019-02-16	100	\N	\N	269	1	2	f	\N
267	6	7	分布式系统面临的一些问题	分布式系统的本质就是扩展与复杂度上升。在组件变多之后，各种问题都变得复杂起来。\r\n\r\n测试\r\n监控\r\n运维\r\n开发：\r\n一致性\r\n数据分布\r\n故障检测\r\n	\N	\N	17	\N	3	\N	5	1	2019-02-16 08:56:35.536197	2019-02-16 14:47:24.945194	2019-02-16	0	\N	\N	267	1	2	f	\N
268	7	16	分析未来汽车leveldb损坏问题	是系统盘满，内存不够导致的？	\N	\N	19	\N	3	\N	5	3	2019-02-16 13:21:46.866648	2019-02-20 14:27:21.848425	2019-02-21	0	\N	\N	268	1	2	f	\N
265	7	16	提供广发V3升级到V5方案		2019-02-21	\N	19	\N	2	\N	5	4	2019-02-15 09:35:23.22653	2019-02-18 15:57:12.92714	2019-02-15	0	\N	\N	265	1	2	f	\N
317	6	20	职业生涯规划-小章鱼之友邦保险了解篇20190315	了解保险代理人行业\r\n认识这个行业的从业人员\r\n	\N	\N	17	\N	3	\N	6	0	2019-03-18 12:07:39.244132	2019-03-18 12:07:39.244132	2019-03-18	0	\N	\N	317	1	2	f	\N
196	6	9	软件项目运作	从角色上产品经理，项目经理，SE，开发人员，测试SE，测试人员 这是基本配置。\r\n其中SE和测试SE负责技术架构，避免产品在架构上犯错误。这其中包括技术选型，升级策略，硬件兼容，产品大的模块设计，整体测试方案等等。\r\n\r\n产品经理的任务是制定目标，确定时间点。\r\n项目经理的任务就是制定计划和trace执行。\r\nSE看护架构，实现架构演进。\r\n开发，测试实际执行者。	\N	\N	17	\N	3	\N	5	1	2018-12-03 12:59:59.021387	2018-12-04 06:17:19.171867	2018-12-03	0	\N	\N	196	1	2	f	\N
226	6	9	从不抱怨，适应规则，改变规则，保持酸疼，保持饥饿，保持虚心	这才是一个强者该有的态度。\r\n别人强我学之，别人不强，正好是机会。\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2019-01-06 21:20:24.190758	2019-01-06 21:20:24.190758	2019-01-06	0	\N	\N	226	1	2	f	\N
197	6	6	商业的思考	商业的本质就是分工与交换。商业成功本质上就是效率的提升。\r\n效率这里含两部分：\r\n分工引起的纵向效率提升\r\n交换引起的横向效率提升\r\n\r\n这里也可以扯出两种产品策略：\r\n1，做精品\r\n2，做生态	\N	\N	17	\N	3	\N	5	1	2018-12-04 13:03:49.346921	2018-12-04 13:09:59.428474	2018-12-04	0	\N	\N	197	1	2	f	\N
198	6	6	笨方法	用一种方法，不断去执行优化，最终会达成目标	\N	\N	17	\N	3	\N	5	1	2018-12-04 13:15:11.31864	2018-12-04 13:16:31.876453	2018-12-04	0	\N	\N	198	1	2	f	\N
229	7	1	讨论员工绩效		\N	\N	19	\N	3	\N	5	0	2019-01-09 08:33:17.813922	2019-01-09 08:33:17.813922	2019-01-09	0	\N	\N	229	1	2	f	\N
203	6	9	听未来简史	自由意志的泡影，人没有机器理性与正确。\r\n人与机器的关系 就像马和汽车的关系。\r\n智人终将被淘汰，可能出现生化人。加强的人，每个人可以轻松的做到正念，达到圣人的精神状态。\r\n没有真实的自我。就像黑客帝国中的运输控制程序。\r\n\r\n一个巨大的数据与逻辑网络。只是目前人类的复杂度尚未全部解释。\r\n现代社会没有剧本，用科技力量取代了农业时代的信仰。\r\n\r\nDNA就像代码一样。\r\n\r\n人类发展的过程就是数据处理方式变化的过程。\r\n数据教派\r\n万物互联\r\n\r\n所有生物都是算法\r\n生物都在处理数据\r\n\r\n智能与意识脱钩\r\n\r\n无意识的机器会比我们更了解自己\r\n\r\n总结：\r\n人的思维具备立体性，比如抽象出新的概念。总结事物的本质。\r\n如果我们知道桌子的制造过程，我们就更容易识别桌子。\r\n\r\n知识，技术就是权力\r\n未来人与算法仍然在很多领域展开竞争。\r\n	\N	\N	17	\N	3	\N	5	0	2018-12-08 14:58:19.574218	2018-12-08 14:58:19.574218	2018-12-08	0	\N	\N	203	1	2	f	\N
205	6	9	2017春节随笔	人生的意义是什么？\r\n\r\n就像代码也许有天会问 我存在的价值是什么？代码的价值是设计他，使用他的人决定的。\r\n这里并不是问 \r\n为什么存在？\r\n而是问存在的意义，\r\n\r\n也不是讨论人存在的价值，意义并不一定就是价值。\r\n\r\n生活的理想就是为了理想的生活。 那就得先搞明白什么是理想的生活。\r\n\r\n有2种基本的观点：\r\n宗教：人是由一个造物主制造的，其意义在于造物主的意图\r\n科学：人是在宇宙中普遍存在的因果网络中的。\r\n\r\n所以有些事情不要去问有什么意义，根本就没有意义，只是有因果。\r\n\r\n\r\n他说大约50年前，当逻辑实证主义者放弃哲学时，哲学就死了。 现在哲学只是在回顾哲学史，而哲学史包含的\r\n主要是失败的大脑模型。我们需要新哲学，以对人类的起源和意义的科学理解为基础的哲学。\r\n\r\n人是怎样的一种生物?\r\n\r\n意识的生理基础，意识是物质过程吗？\r\n\r\n现代心理分析是以关系为基础的，并不是以佛洛依德的个人欲望作为基础的。\r\n\r\n安全感，恐惧，自我防御也是一些行为的原动力。\r\n虚荣心，自满，这些也都是一些原动力。\r\n\r\n地域对人的影响真的非常重。比如我老婆老家的人喜欢聊天，而我们那边的人却不是特别喜欢。我们那边的显得冷漠简单粗暴。\r\n她们那边走亲戚是全家出动，而我们那边却只派一个代表。是什么造成这些差异呢？\r\n\r\n我站在远端，企图跳出自己去看周围的人。只有这样才能跳出自己的偏见。\r\n像卫庄一样，冷眼看着社会的变化并手握利剑，为了权力也是为了生存存在更多的选择，没有为什么，只有因果，存在。\r\n\r\n要理解人。技术只是看能否做到，是否发现，而产品是跟人相关的，有各种可能性。\r\n而且企业市场与个体市场又不一样。\r\n\r\n社会又是怎样的社会？\r\n奴隶社会，\r\n农业社会，土地时代\r\n工商业社会，资本时代\r\n美元时代的结束？\r\n\r\n因果。逻辑时代，数据时代\r\n\r\n\r\n\r\n2个技术：\r\n1，网页的逐渐模糊显示技术，摘要？\r\n2，手机与电脑的文字投射	\N	\N	17	\N	3	\N	5	0	2018-12-08 15:02:15.995144	2018-12-08 15:02:15.995144	2018-12-08	0	\N	\N	205	1	2	f	\N
207	6	15	打墙练习心得1	1，羽毛球全程发力是大臂，带动小臂，手腕，手指完成挥拍击球的过程。\r\n当你确定自己的接球挥拍路径之后，步伐就很自然形成了。虽然最后一步挥拍击球步伐也是最大的。\r\n\r\n2，多拍能力与快速放松能力成正比，发力干脆，快速进入放松阶段。\r\n\r\n3，前中场握拍靠上点可减轻手臂的负担，增强多拍能力\r\n	\N	\N	17	\N	3	\N	5	1	2018-12-08 20:42:52.445037	2018-12-08 21:02:49.633611	2018-12-08	0	\N	\N	207	1	2	f	\N
246	6	10	看问题，看趋势	5G\r\n大数据分析\r\n数据处理\r\n数据训练\r\n\r\n这些岂能不看。	\N	\N	17	\N	3	\N	5	0	2019-01-21 21:10:15.642501	2019-01-21 21:10:15.642501	2019-01-21	0	\N	\N	246	1	2	f	\N
210	3	1	libcurl segmentfault	(gdb) bt\r\n#0  0x00007f48bd4fd23b in raise () from /lib64/libpthread.so.0\r\n#1  0x00007f48be5a9685 in reraise_fatal (signum=11) at global/signal_handler.cc:71\r\n#2  handle_fatal_signal (signum=11) at global/signal_handler.cc:133\r\n#3  <signal handler called>\r\n#4  free (ptr=0x3) at include/jemalloc/internal/arena.h:532\r\n#5  0x00007f48bdb3319d in setstropt () from /lib64/libcurl.so.4\r\n#6  0x00007f48bdb33ef3 in Curl_init_userdefined () from /lib64/libcurl.so.4\r\n#7  0x00007f48bdb33fae in Curl_open () from /lib64/libcurl.so.4\r\n#8  0x00007f48bdb43164 in curl_easy_init () from /lib64/libcurl.so.4\r\n#9  0x00007f48be328612 in RGWHTTPClient::init_request (this=this@entry=0x7f472938abe8, method=method@entry=0x7f488c9406f8 "PUT", \r\n    url=url@entry=0x7f48a48bf798 "10.10.80.84:9200/mos-master/object/afc31178-f10e-4a54-99b3-f5c221db7752.15433.1:myobjects2706299:null", \r\n    _req_data=_req_data@entry=0x7f4724a63b80, send_data_hint=send_data_hint@entry=false) at rgw/rgw_http_client.cc:304\r\n#10 0x00007f48be32bbcf in RGWHTTPManager::add_request (this=this@entry=0x7f4886184c48, client=client@entry=0x7f472938abe8, method=<optimized out>, \r\n    url=0x7f48a48bf798 "10.10.80.84:9200/mos-master/object/afc31178-f10e-4a54-99b3-f5c221db7752.15433.1:myobjects2706299:null", send_data_hint=<optimized out>)\r\n    at rgw/rgw_http_client.cc:723\r\n#11 0x00007f48be4a2744 in RGWRESTStreamRWRequest::get_resource (this=this@entry=0x7f472938abe8, key=..., extra_headers=std::map with 1 elements = {...}, \r\n    resource="mos-master/object/afc31178-f10e-4a54-99b3-f5c221db7752.15433.1:myobjects2706299:null", send_data=send_data@entry=0x0, mgr=0x7f4886184c48)\r\n    at rgw/rgw_rest_client.cc:692\r\n#12 0x00007f48be4a75a8 in RGWRESTSendResource::aio_send (this=this@entry=0x7f472938ab00, outbl=...) at rgw/rgw_rest_conn.cc:365\r\n#13 0x00007f48be55d15a in RGWSendRESTResourceCR<es_obj_metadata, int>::send_request (this=0x7f4729059000) at rgw/rgw_cr_rest.h:112\r\n#14 0x00007f48be2cbe4e in RGWSimpleCoroutine::state_send_request (this=this@entry=0x7f4729059000) at rgw/rgw_coroutine.cc:1004\r\n#15 0x00007f48be2cf0bc in RGWSimpleCoroutine::operate (this=0x7f4729059000) at rgw/rgw_coroutine.cc:982\r\n#16 0x00007f48be2cc13b in RGWCoroutinesStack::operate (this=0x7f4706d81c00, _env=_env@entry=0x7f48807fc610) at rgw/rgw_coroutine.cc:287\r\n#17 0x00007f48be2cf7a2 in RGWCoroutinesManager::run (this=this@entry=0x7f4886184b60, stacks=std::list = {...}) at rgw/rgw_coroutine.cc:601\r\n#18 0x00007f48be2d06ed in RGWCoroutinesManager::run (this=this@entry=0x7f4886184b60, op=0x7f47005c6400) at rgw/rgw_coroutine.cc:744\r\n#19 0x00007f48be391fef in RGWRemoteDataLog::run_sync (this=this@entry=0x7f4886184b60, num_shards=128, sync_status=...) at rgw/rgw_data_sync.cc:1686\r\n#20 0x00007f48be463a82 in run (this=0x7f4886184b28) at rgw/rgw_data_sync.h:170\r\n#21 RGWDataSyncProcessorThread::process (this=0x7f4886184b00) at rgw/rgw_rados.cc:2970\r\n#22 0x00007f48be400944 in RGWRadosThread::Worker::entry (this=0x7f4887cc3780) at rgw/rgw_rados.cc:2776\r\n#23 0x00007f48bd4f5dc5 in start_thread () from /lib64/libpthread.so.0\r\n#24 0x00007f48bcb0176d in clone () from /lib64/libc.so.6\r\n	\N	\N	17	\N	3	\N	5	0	2018-12-17 12:03:13.363432	2018-12-17 12:03:13.363432	2018-12-17	0	\N	\N	210	1	2	f	\N
261	6	7	核心问题-复杂系统的扩展，迁移，容错，故障容忍	一个复杂系统该当如何处理系统生长，局部老坏，扩展等问题。	\N	\N	17	\N	3	\N	5	0	2019-02-08 19:06:57.698157	2019-02-08 19:06:57.698157	2019-02-08	0	\N	\N	261	1	2	f	\N
255	6	6	如何管理更多的人与事	1，分治方法，合时扼要\r\n其重点在于识人用人，以及事的架构设计\r\n\r\n2，抓住本质，深入理解问题\r\n其实一些事情看似复杂，但是问题规模可能也就十几个。\r\n有些人一年就搞定了，而有些人10年都搞不定。\r\n\r\n3，善用工具，机器模型\r\n\r\n4，学会放松，调整精力。\r\n人在任何领域的差距都有百倍之上。精力强的人表现也会百倍于精力差的人。\r\n\r\n这就是人的综合差距有上万倍的原因。\r\n\r\n	\N	\N	17	\N	3	\N	5	2	2019-01-28 08:41:25.777734	2019-02-12 10:12:39.914534	2019-01-28	0	\N	\N	255	1	2	f	\N
202	6	9	听王阳明大传	听王阳明哲学的解读之后\r\n参 就是不断的询问，一个思考过程。\r\n儒家 道家 佛家都不是宗教，其实都是教人为人处事的。\r\n其思路都是从 心 性 意等角度去了解自己，了解别人，处事。\r\n\r\n感觉王阳明是儒家与佛教的一种碰撞。\r\n\r\n善恶\r\n良知 中庸 正念\r\n\r\n为什么大师说话比较牛逼，因为他能找到那个点，那个恰好的点。\r\n用自己的思想去格物，不断修正理论。\r\n\r\n知行合一，即行即知。这里的知不是知道。\r\n\r\n我们有时候有这样的体验，有时候懂了一个道理，但是做的时候又违背了，这就说明并不知，\r\n也就是说行为与理念不一致，有时候行为可能发自于潜意识。比如说喜欢打游戏的人，即便他知道打游戏损害身体，不可长时间玩。\r\n但是在当时他可能顾不了那么多，控制不住。\r\n\r\n还有一种情况是自己做了合适的事，但是并不明白这是为什么。讲不出道理。\r\n\r\n如果理解知行合一，就是将意识理念 与 行为统一，怎么样就怎么样去做，做的都是所想的。想不清楚就不去做，这样可否算是知行合一呢？\r\n\r\n知是行之始，行是知之成。\r\n知行合一的重要性就在于此，真正的价值体现在行上，如果只是一个理念在脑子里转下，那就没啥意义。\r\n这也是王阳明能做出真正很有价值事情的内在动因。\r\n\r\n\r\n王阳明最后的境界：随时随地都知道对错。时刻秉持良知。\r\n也就是孔子说的吾道一以贯之。也就是老子的道。\r\n这样去看必然随时随地都保持正念。\r\n\r\n良知像是一个普世的价值判断？\r\n良知，是非善恶，心学的基石就是心即理。良知即天理。\r\n克己复礼为仁。礼就是孔子的部分价值观。孔子的言论大部分都是讲什么是对的，也就是一套价值观。\r\n儒家与佛家的根本区别也在于价值观的区别，佛家众生平等。儒家是厚薄有分的。佛家的理念是与世俗不合的，因而佛家要出家。\r\n\r\n致：\r\n醒觉，脱离惯性。\r\n\r\n心中无挂碍，凭良心而行，稳当快乐就是洒落。\r\n\r\n总结：\r\n心学感觉就是为了解决儒家的价值判断问题。这一点孔子并未明述，虽然已有很多案例。\r\n儒家里面有2个问题：\r\n1，何为仁？ 一切的对？ 如何判断对错？\r\n良知 即为仁\r\n2，如何做到仁？ 三月不违仁就是超高的境界\r\n知行合一	\N	\N	17	\N	3	\N	5	0	2018-12-08 14:57:27.816632	2018-12-08 14:57:27.816632	2018-12-08	0	\N	\N	202	1	2	f	\N
199	6	8	兴趣是什么	兴趣是什么呢？ 是满足欲望么，好像不是。是成功，也不是。\r\n\r\n维基：兴趣是人类在空闲时间喜欢做的休闲活动。兴趣是一种人们在空闲时享受及乐于去做的活动，通常人们不是以赚钱为目的而参与这些活动。\r\n\r\n这个答案似乎也不好，有些兴趣显然不是休闲的。\r\n\r\n我感觉兴趣是人们从事活动时，大脑分泌兴奋物质而导致的行为偏好。\r\n所以兴趣有几点：\r\n1，大脑兴奋\r\n2，容易上瘾\r\n\r\n兴趣可能强化，也可能逐步弱化。这个就像我参与羽毛球活动时，不断有新发现，不断提升自己可以强化兴趣。\r\n\r\n由此可见兴趣是可以培养的，掌握培养方法非常关键	\N	\N	17	\N	3	\N	5	2	2018-12-05 07:19:23.026586	2018-12-05 08:29:01.925777	2018-12-05	0	\N	\N	199	1	2	f	\N
228	7	1	近期几个小会	1，讨论filestore目录分裂问题的处理\r\n2，讨论liuqing工作，具体实施\r\n3，讨论v5.3版本如何解决v5.2.1的遗留问题\r\n	\N	\N	19	\N	3	\N	5	1	2019-01-07 07:11:45.075543	2019-01-07 09:01:55.683975	2019-01-07	0	\N	\N	228	1	2	f	\N
201	6	9	push上层，trace下层	管理者的职责，不仅是接收目标，任务，安排计划与执行。\r\n有时候还需反推，促进上层改革。\r\n\r\n对于被管理者，也是于此。需要积极push，怎样整体对于问题的理解才能更加深入。	\N	\N	17	\N	3	\N	5	0	2018-12-06 14:17:17.032576	2018-12-06 14:17:17.032576	2018-12-06	0	\N	\N	201	1	2	f	\N
204	6	9	2016春节后所想	二年没回家过年了，今年早早的回家了。\r\n\r\n回家当然是兴高采烈的，想看看故乡的样子，容颜是否还在。\r\n\r\n下城铁之后坐车直奔家里，一路上冬天的萧瑟已经让我觉得有点不习惯了。\r\n灰色是主色调，只有在后来去地里面挖野菜时才知道春将至。\r\n\r\n幸而在老家的几天天气都晴好，温度也比较高。\r\n\r\n中午到家后到隔离邻居坐着聊了下天，似乎没聊什么深入的内容。大家也都是从外地回来。\r\n邻居几家都买了车，有个老远也开回来了。网络也基本快普及了，农村人的生活看上去比城市人更加\r\n轻松惬意。\r\n\r\n村里的老一辈的人有很多都叫不上名字了，也没看到很多老人，年轻人更是不知道去哪里了。中午去运动场\r\n打下篮球也没见几个年轻人。后来才知道大家聚集在村头的几家打牌去了。\r\n\r\n在往年大年30或者初一还有人搞搞集体活动，在运动场打打篮球，跳跳舞啥的，如今这些都没了。\r\n村里的老人逐渐离去，年轻人之间也在不同的圈子，而下一代几乎没啥关联了。\r\n\r\n物理的社会逐渐在瓦解，农村慢慢也变得不识邻居了。\r\n社会关系慢慢的变成 家庭关系，同学关系，同事关系，圈子关系。\r\n\r\n\r\n网络上聊天的内容量估计早超越了现实。如果不去刻意激发，几乎聊不到什么深入的内容。\r\n大都是回忆，家常，寒暄。 聊工作，成长，理想已经算特别深入的话题了。\r\n\r\n由此也可见大家对于生活，对于工作的热爱与研究可能还停留在一个比较浅的层次上，关注点\r\n也比较狭窄。如何才能聊的深入有深度？把自己日常的思考给聊出来？\r\n\r\n现在其他的过年风俗几乎都没了，除了吃团圆饭，回家干的最多的可能就是体验劳动，以及在附近游玩了。\r\n爱人家正好在风景区边上，附近的一些农民也在通过旅游业来致富。\r\n\r\n聊天有深度，跟别人聊天时能够相互学习到一些新东西。家庭教育这块对此影响应该非常大。如果小孩子从小听\r\n长辈聊天中学习到很多新东西，那对小孩的成长影响应该是非常深远的。\r\n\r\n就像二嫂跟她小孩的聊天一样，可以让小孩子学习到很多东西。\r\n\r\n聊天真是一个神奇的东西，如果从外在的角度来看别人说你不能这么老实，你要多说话，但是然并卵。当自己发现聊天真的有趣，并且可以\r\n学习到很多东西，同时分享自己的见解，这样看聊天就特别有意思了。\r\n\r\n如果一个小孩不论说什么，家人都鼓励，接收，并且认真的从她的角度聊聊，那样小孩子就不可能变得沉默。\r\n\r\n于冬寅而言感激付出，但是长辈的付出却变成了一种压力。这样付出不会成为别人的债务。我选择做一件事，并不是期望未来可有可无的收获，\r\n我做好最坏的打算，即便在最差的情况我仍然能够接收，付出爱心，收获爱心。\r\n\r\nopen + 聊天\r\n\r\n冬寅说我:不随大流 不世俗 有独立思考 和 反思精神\r\n\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2018-12-08 15:00:02.808663	2018-12-08 15:00:02.808663	2018-12-08	0	\N	\N	204	1	2	f	\N
206	3	10	阿里云使用记录	1，选择不同区域，则有不同的endpoint，使用的是host-based的格式\r\noss-cn-beijing.aliyuncs.com\r\noss-cn-shenzhen.aliyuncs.com\r\n\r\n2，创建bucket的时候还可以选择存储类型，acl等等\r\n3，region对应我们的是zonegroup\r\nOSS 将用户的数据以冗余的方式存储在同一区域（Region）的 3 个可用区（Zone）中。提供机房级容灾能力。\r\n\r\n4，用户和bucket名称空间都是跨区域的\r\n\r\n多租户\r\n全球化\r\n多版本数据保护\r\nbucket无限数量和容量\r\n数据检索\r\n数据处理（加密，压缩，转换）\r\n\r\n公有云强化功能：\r\n域名\r\nCDN加速\r\n事件通知\r\n计费功能	\N	\N	17	\N	3	\N	5	0	2018-12-08 16:12:04.827816	2018-12-08 16:12:04.827816	2018-12-08	0	\N	\N	206	1	2	f	\N
208	3	1	解决多故障相关干扰的问题	1，osd full只影响相关故障域\r\n2，rgw不应该因为一个故障域卡住而退出\r\n  有些地方超时会抛出异常\r\n  rados op增加超时\r\n  流控增加超时\r\n  循环操作增加超时，如超过4M的读写，list 多个bucket等	\N	\N	17	\N	3	\N	5	1	2018-12-10 19:04:23.279828	2018-12-11 15:39:03.543269	2018-12-10	0	\N	\N	208	1	2	f	\N
200	6	1	s3与rgw框架随想	rgw架构如何调整，以满足快速交付，保证质量。	\N	\N	17	\N	3	\N	5	2	2018-12-06 12:25:37.771421	2018-12-12 13:26:32.715932	2018-12-06	0	\N	\N	200	1	2	f	\N
209	3	1	ceph 注入测试	ms_dispatch_throttle_bytes = 524288\r\nms_inject_delay_type = client\r\nms_inject_delay_max = 2\r\nms_inject_delay_probability = 0.3\r\n\r\n通过在osd消息接收端注入超时，构造osd超慢的情况	\N	\N	17	\N	3	\N	5	1	2018-12-11 14:05:59.270553	2018-12-13 14:43:38.497646	2018-12-11	0	\N	\N	209	1	2	f	\N
149	6	7	软件架构	软件架构的定义: "软件架构代表了一个系统的组织结构， 这包括将系统分解为不同的部分，界定它们之间的连接，确定它们之间的交换机制，并且为后续的设计提供指导性的原则"\r\n英文版：\r\nthe fundamental organization of a system, embodied in its components,\r\ntheir relationships to each other and the environment, and the principles\r\ngoverning its design and evolution.\r\n\r\n重点在于组件，模块独立，同时组件之间相互关联。\r\n独立因而独立发展，快速进化。 关联实现价值	\N	\N	17	\N	3	\N	5	11	2018-11-06 18:07:17.517523	2019-01-02 06:33:15.224863	2018-11-06	0	\N	\N	149	1	2	f	\N
232	6	6	一切都有逻辑，当然也有意外	意外不意味着无法控制，反而你不加以控制，意外会越来越多。\r\n\r\n你得不断优化调试自己的机器，不断升级版本。而不是处于混沌状态。这样才能用“笨方法”把事做成。\r\n不论是学习，管理，还是干其他事都是如此。\r\n\r\n将机器执行逻辑不断分割为更小模块，理解这些模块，以及其关联关系，知道如何牵一发而动全身。\r\n\r\n宏观可以看到方向，目标。 但计划与执行同样重要，微观决定成败。	\N	\N	17	\N	3	\N	5	2	2019-01-11 07:47:48.751325	2019-01-11 07:55:34.365837	2019-01-11	0	\N	\N	232	1	2	f	\N
233	6	6	缺点的思考	注意自己思维上可能存在的漏洞，同时明白自己存在的局限性。 这样经常自省，同时善于与人合作，借用别人的长处。	\N	\N	17	\N	3	\N	5	0	2019-01-11 10:22:45.902736	2019-01-11 10:22:45.902736	2019-01-11	0	\N	\N	233	1	2	f	\N
234	6	7	关于事务	很多业务系统开发都涉及事务，通常业务处理程序是无状态的，且有很多。\r\n\r\n事务可简化开发逻辑，但是代价也非常高。有时候我们需要的只是cmp，基于原value的+/-运算，以及单调唯一的key等。	\N	\N	17	\N	3	\N	5	0	2019-01-15 14:20:12.788516	2019-01-15 14:20:12.788516	2019-01-15	0	\N	\N	234	1	2	f	\N
270	7	16	解决问题单1127	同时在check_reload的时候，业务与后端rgw不要真正reload。	\N	\N	19	\N	3	\N	5	0	2019-02-16 14:03:27.129626	2019-02-16 14:03:27.129626	2019-02-16	0	\N	\N	270	1	2	f	\N
273	7	16	完成V5.3.0任务695		\N	\N	19	\N	3	\N	5	0	2019-02-18 07:21:40.514568	2019-02-18 07:21:40.514568	2019-02-18	0	\N	\N	273	1	2	f	\N
135	6	1	关于磁盘的cache	1，RAID卡cache和磁盘cache是两回事\r\n2, 查看raid卡cache:\r\n查询缓存模式：\r\n     /opt/MegaRAID/MegaCli/MegaCli64 -LDGetProp -Cache -LAll -a0\r\n\r\n批量命令：\r\n    for i in {1..8}; do /opt/MegaRAID/MegaCli/MegaCli64 -LDGetProp -Cache -L$i -a0; done\r\n或者\r\n     /opt/MegaRAID/MegaCli/MegaCli64 -LDGetProp -Cache -LAll -a0\r\n\r\n\r\n设置缓存模式：\r\n     /opt/MegaRAID/MegaCli/MegaCli64 -LDSetProp WT  -L0 -a0\r\n或者 /opt/MegaRAID/MegaCli/MegaCli64 -LDSetProp WT  -LAll -a0\r\n\r\n3，查看磁盘cache\r\n查询HDD/SSD的cache是否开关：\r\n关闭HDD/SSD的cache：\r\n/opt/MegaRAID/MegaCli/MegaCli64 -LDGetProp -DskCache -LALL -aALL\r\n/opt/MegaRAID/MegaCli/MegaCli64 -LDSetProp -DisDskCache -LALL -aALL\r\n\r\n4，仅仅关闭raid卡cache，在掉电情况下，仍然可能丢数据\r\nhttps://www.thomas-krenn.com/en/wiki/RAID_Controller_and_Hard_Disk_Cache_Settings\r\n\r\n5，O_SYNC,O_DSYNC不一定靠谱\r\nO_SYNC或者fdatasync时   os会构造一个带REQ_FLUSH的bio  最终会发flush或者FUA命令给磁盘的     所以大部分情况下是会保证磁盘的cache也刷到介质中去。\r\n有的情况  比如flashcache混合盘，根本就不处理flush命令，还有国科微的盘 支持得也不好。\r\n\r\n有RAID卡的环境这块支持可能也有问题，在测试中出现了journal损坏的情况。磁盘cache是打开的，虽然journal open时使用了O_DSYNC仍然靠不住。	\N	\N	17	\N	3	\N	5	3	2018-10-25 12:51:34.547721	2018-12-18 10:32:43.181541	2018-10-25	0	\N	\N	135	1	2	f	\N
247	6	1	明天事务	V5.2.0: 1052问题复现\r\nV5.2.1-tencent:合入unorder list，以及支持从内存读取统计信息\r\nV5.3.0：合入rgw reload修改。	\N	\N	17	\N	3	\N	5	0	2019-01-22 19:53:54.536775	2019-01-22 19:53:54.536775	2019-01-22	0	\N	\N	247	1	2	f	\N
214	6	9	平生愿	做一两款用户喜欢的产品，以聚友类。\r\n\r\n精通计算机技术，一方面养家糊口。另外也是做产品必须的。\r\n\r\n其他养好身体，搞搞娱乐，享受世间美好事物即可。	\N	\N	17	\N	3	\N	5	5	2018-12-23 21:42:51.48592	2019-03-06 19:25:17.9675	2018-12-23	0	\N	\N	214	1	2	f	\N
213	6	6	竞争让世界不断前进，但选择的是深渊还是末路未可知	当一个帝国崛起之后，其会稳固其领导地位。\r\n而其他国家则试图在技术，以及其他方面创新从而实现自己的崛起。\r\n\r\n封建时代，中国无疑算是非常成功的，虽然中间几次沦落，但是那时辱民政策的恶果。\r\n如今的机会可能在于打开新的潘多拉魔盒，就像信息革命和工业革命一样。\r\n\r\n但人是否过得更好并非一定是选择方向。尤其是专制政府下。\r\n\r\n中国很可能有机会开启下一个魔盒，释放出新的魔鬼。	\N	\N	17	\N	3	\N	5	1	2018-12-23 21:06:17.259425	2018-12-23 21:06:41.421272	2018-12-23	0	\N	\N	213	1	2	f	\N
248	3	1	bucket海量对象下的风险	1，像gc，usage，notify等默认值都太小，不利于分散到不同的osd。\r\n可缓解在局部osd压力大时，造成请求阻塞的情况\r\n\r\n2，所有删除丢到gc显然不合适。gc压力巨大。	\N	\N	17	\N	3	\N	5	0	2019-01-25 13:02:40.067934	2019-01-25 13:02:40.067934	2019-01-24	0	\N	\N	248	1	2	f	\N
252	6	5	暗礁	当下格局，水下暗礁。这些是需要探明的。\r\n兵者国之大事，软件也是如此。怎么随便漏过，\r\n工程是工程，算法的重要性不言而喻。\r\n\r\n\r\n\r\n\r\n政治，	\N	\N	17	\N	3	\N	5	0	2019-01-28 00:11:40.791467	2019-01-28 00:11:40.791467	2019-01-28	0	\N	\N	252	1	2	f	\N
367	8	17	beas整体架构，能否beas包含pg	beas的实现除了将beas功能内置为pg的子模块内，还有一种可能是将beas作为外部，内部把pg包住。	\N	\N	17	\N	3	\N	5	2	2019-04-28 14:10:41.305659	2019-04-29 07:45:02.257601	\N	0	\N	\N	367	1	2	f	\N
211	3	1	RGW框架调整	多站点：\r\nzone 对应的公有云的region\r\nbucket位于某个zone，就是bucket的源zone。如果数据在其他地方写入，则需同步回源zone。\r\n如果在其他地方读取数据，从默认从源zone拉取数据，应用不必感知。\r\n\r\n可以支持bucket迁移zone，后端数据可通过后台任务同步到其他zone。\r\n\r\nuser是跨zone的，可以查看user在各个zone的使用情况。\r\n\r\n多故障域：\r\nzone里面有st_pool,data pool，ia_pool等，支持数据以随机方式写入一种类型的pool，当\r\n同类型的某个pool故障或使用率过高时，可禁止新对象写入。 应用不需感知placement（实际上对于应用\r\n这也是非常麻烦的）\r\n\r\n\r\nbucket index：\r\n可考虑仍然使用rados存储的方案，但是对象按照范围组织成index，并且支持range split。以\r\n支持bucket的海量数据。	\N	\N	17	\N	3	\N	5	4	2018-12-21 07:11:21.271592	2018-12-28 07:24:50.354908	2018-12-21	0	\N	\N	211	1	2	f	\N
253	3	1	大规模	大规模下如何收集日志，快速定位问题。\r\n大规模下，一些服务的独立\r\n有些地方不必非得一致性，满足业务的当下最佳方案。	\N	\N	17	\N	3	\N	5	1	2019-01-28 00:11:58.19366	2019-01-30 11:48:06.282638	2019-01-28	0	\N	\N	253	1	2	f	\N
376	8	17	PG如何处理各种字符编码？	如何存储不同的字符编码？ 如果系统使用不同编码会有问题吗？	\N	\N	17	\N	3	\N	5	0	2019-05-05 12:29:24.132295	2019-05-05 12:29:24.132295	\N	0	\N	\N	376	1	2	f	\N
217	6	7	vlan学习笔记	1，vlan是用于企业内网络隔离的，隔离的好处就不说了，能解决各种问题。\r\n2，vlan需解决的问题：交换机如何配置支持，路由器如何支持。\r\n因而提出了交换机vlan配置，trunk配置（解决vlan跨交换机的效率问题）。\r\n也有了路由器trunk配置（解决vlan间通信问题）\r\n3，但是路由器trunk设置方式效率不好，因为都得经过trunk端口。\r\n因而出现了三层交换机，vlan之间的包不必经过路由器回转，提高了效率。	\N	\N	17	\N	3	\N	5	1	2018-12-30 12:49:39.082883	2018-12-30 13:26:07.165059	2018-12-30	0	\N	\N	217	1	2	f	\N
218	6	7	vxlan学习笔记	vlan的问题在于其在链路层协议实现，bit位为12，这对于企业是够用的。但是对于云场景不够用。\r\n因为存在大量的虚拟机，需要使用网络隔离。\r\n\r\nvlan的解决方法是在链路层之上，增加8bytes的标示。	\N	\N	17	\N	3	\N	5	1	2018-12-30 13:25:56.588387	2018-12-30 13:37:00.046489	2018-12-30	0	\N	\N	218	1	2	f	\N
220	6	7	学linux具体学什么	任务隔离，多租户。\r\n任务调度，Qos控制。\r\n资源隔离与使用策略。 内存管理\r\n同步协同。\r\n通信\r\n存储\r\nIO	\N	\N	17	\N	3	\N	5	0	2018-12-31 15:43:43.477616	2018-12-31 15:43:43.477616	2018-12-31	0	\N	\N	220	1	2	f	\N
219	6	7	linux 信号		\N	\N	17	\N	3	\N	5	2	2018-12-31 08:34:43.873902	2018-12-31 15:26:13.409004	2018-12-31	0	\N	\N	219	1	2	f	\N
277	8	17	伯克利 serverless概念？		\N	\N	17	\N	3	\N	5	0	2019-02-20 08:45:17.844645	2019-02-20 08:45:17.844645	\N	0	\N	\N	277	1	2	f	\N
377	6	7	开源协议	https://blog.csdn.net/testcs_dn/article/details/38496107\r\n\r\n一张图即可看明白	\N	\N	17	\N	3	\N	5	0	2019-05-05 12:59:15.750008	2019-05-05 12:59:15.750008	2019-05-05	0	\N	\N	377	1	2	f	\N
276	7	17	熟悉pg 11.2		\N	\N	19	\N	3	\N	5	1	2019-02-20 08:44:35.916893	2019-02-20 09:02:09.236429	2019-02-20	0	\N	\N	276	1	2	f	\N
370	6	7	数理逻辑-命题范式	范式是把命题公式中蕴含，等价，非 进行转换后只包含合取，析取，非的比较精简的格式。\r\n其中蕴含，等价，非可以用相应的等价形式做转换。\r\n\r\n命题范式化是为了方便命题的计算的。	\N	\N	17	\N	3	\N	5	1	2019-04-28 18:13:06.671141	2019-05-06 19:58:11.218308	2019-04-28	0	\N	\N	370	1	2	f	\N
254	8	7	关于软件工程		\N	\N	17	\N	3	\N	5	2	2019-01-28 07:23:49.989991	2019-03-23 14:41:02.671959	\N	0	\N	\N	254	1	2	f	\N
215	3	1	rgw当前缺陷总结	1，realm配置变更时，rgw reload，一方面可能中断业务，另外可能因为资源依赖导致reload时rgw挂掉或可能hang住。\r\n2，多站点特性，多边同时执行put和删除操作，可能导致一边对象未删除，多出对象。\r\n3，老版本删除，和多出版本删除等gc操作在前端实现，在并发时可能引起本该删除的老对象没及时删除。\r\n4，rgw使用libfcgi存在风险，libfcgi在accept循环中读取头部数据\r\n5，osd在压力大时，可能出现slow request， peering卡住等问题\r\n6，osd恢复qos控制效果不好\r\n7，在某些场景下，掉电会出现db损坏问题。\r\n8，用户Qos，低tps用户发送大量请求可能阻塞高优先级用户。	\N	\N	17	\N	3	\N	5	15	2018-12-27 11:36:57.971397	2019-04-09 07:47:28.490194	2018-12-27	0	\N	\N	215	1	2	f	\N
230	3	1	多站点数据不一致问题	方案1：\r\n1，在对象删除后，并非立即将bi删除，而是增加删除标记。并且将对象实例丢入待清理列表\r\n2，在获取对象mtime时，获取含删除标记的对象的mtime。\r\n3，后台任务，在一段时间后清理删除标记。这里可启动新的后台任务，而非gc。\r\n\r\n问题：如何确定对象已经被同步？多久之后清理？\r\n注意：需考虑bucket删除等交叉场景。\r\n\r\n方案2：\r\n1，所有删除操作都不直接清除对象实例，而是将实例rename或打标记\r\n2，修改gc实现，gc扫描bi获取已删除对象进行删除。\r\n\r\n方案2的问题在于对于大量对象的bucket，这种遍历代价有点高。\r\n采用rename的方式以目前cls的方式实现问题不大，但是逻辑上稍微复杂些，\r\n除了按instance名字查询对象实例mtime，还得额外查询rename之后的key，后续架构调整的目标是慢慢弱化cls。\r\n\r\n方案3：\r\n1，bucket都启用多版本	\N	\N	17	\N	3	\N	5	2	2019-01-09 15:01:20.671079	2019-01-10 09:45:51.316678	2019-01-09	0	\N	\N	230	1	2	f	\N
337	6	8	刺	人在成长过程中难免遇到很多困境，就像生长过程中遇到的刺一样。\r\n遇到刺，有三种不同方式面对，一是退回来或弯曲生长。二是默默承受，最终刺变成自己一部分。\r\n三是理解刺是成长路上正常存在的，然后积极应对处理。然而在我们还小的时候很难正确应对。\r\n\r\n在往后的机会中，我们仍然有机会自我诊断或寻求帮助，扶正自己或拔出体内的刺。\r\n	\N	\N	17	\N	3	\N	5	0	2019-04-16 07:38:42.069316	2019-04-16 07:38:42.069316	2019-04-16	0	\N	\N	337	1	2	f	\N
231	6	7	解bug的总结	1，科学严谨\r\n必须分析清楚根因，否则就是镜花水月\r\n在什么情况下必现，解决之后，不再出现。\r\n\r\n2，采用非常规手段，创造复现条件\r\n\r\n3，正确的看待问题的价值\r\n问题就是知识，搞透了就是高手。	\N	\N	17	\N	3	\N	5	0	2019-01-10 13:58:03.123803	2019-01-10 13:58:03.123803	2019-01-10	0	\N	\N	231	1	2	f	\N
235	3	1	对象实例的版本是否继承自对象？	目前ACL属性分别在不同的对象实例上。但是ACL控制可能针对的是对象。	\N	\N	17	\N	3	\N	5	0	2019-01-15 15:43:30.375866	2019-01-15 15:43:30.375866	2019-01-15	0	\N	\N	235	1	2	f	\N
237	6	1	tombstone cache	obj_tombstone_cache\r\n\r\n这个cache是解决多站点同步时，一边删除对象。然后同步对象put请求时可能出现的时序混乱问题。\r\n\r\n在我们将业务与同步rgw分离之后，该机制失效了。	\N	\N	17	\N	3	\N	5	0	2019-01-18 15:26:14.257888	2019-01-18 15:26:14.257888	2019-01-18	0	\N	\N	237	1	2	f	\N
385	7	17	Sds改造	1，将sdsnewlen 改为传入一段内存，且包含长度。\r\n   如果长度不够，则截断	\N	\N	19	\N	3	\N	5	1	2019-05-09 15:31:12.370691	2019-05-09 16:40:32.879762	2019-05-09	0	\N	\N	385	1	2	f	\N
242	6	6	战胜之道	战略需考虑趋势，力量的天平，屁民的共识，欺骗的力量。\r\n毛吸收的是老百姓。就像互联网吸收的是屌丝。\r\n这就是淘宝战胜ebay的方法。也是360战胜其他杀毒的方法。\r\n胜利的残忍和嗜血，老毛的阶级斗争，宣扬敌对。	\N	\N	17	\N	3	\N	5	0	2019-01-21 20:40:55.296393	2019-01-21 20:40:55.296393	2019-01-21	0	\N	\N	242	1	2	f	\N
245	6	7	业务系统对于元数据管理的需求	一定要用数据库么? 代价是什么？\r\n非要ACID？ \r\n非常方便的查询是不是很诱人。	\N	\N	17	\N	3	\N	5	0	2019-01-21 21:08:00.937381	2019-01-21 21:08:00.937381	2019-01-21	0	\N	\N	245	1	2	f	\N
249	8	15	关于等待状态下，拍子位置的问题	观察比赛选手，在防守姿态下，通常拍子还是斜下放置的，但是并非排头掉在地下的那种。\r\n而当对方出球后，根据1，落点判断 2，思考的回球位置与线路。然后决定是否提前举拍。\r\n\r\n显然通常来得及的情况下，都是压制。\r\n次之的是调度分球。\r\n最次的就是不到位，迫不得已的起球。\r\n\r\n放斜下是有道理的，可以较好的处理快速的杀球。这是最有威胁的。	\N	\N	17	\N	3	\N	5	0	2019-01-27 21:38:56.98924	2019-01-27 21:38:56.98924	\N	0	\N	\N	249	1	2	f	\N
250	8	15	关于羽毛球中的平衡问题	高手对决，都会有多回合，不断的寻找破绽。平衡不好，则无法连贯。\r\n1，发力过程的平衡\r\n2，收力的平衡\r\n3，站位的平衡\r\n你看盖聂出招，非持剑手是随之而动的。腿的位置与转腰是有关系的。	\N	\N	17	\N	3	\N	5	0	2019-01-27 21:44:40.961616	2019-01-27 21:44:40.961616	\N	0	\N	\N	250	1	2	f	\N
251	6	15	关于身体的放松	放松的感觉是什么？\r\n\r\n你知道击球瞬间还很远，此刻我不必惊慌。\r\n在对手击球后，观察球路，你知道要将爆发力留在击球瞬间，在此之前的跑动，架拍都是放松的。\r\n\r\n心态上，胜负不需看的太重。反正都是促进自己技术进步的。\r\n另外无惧强敌，保持自信非常重要。\r\n\r\n当你想变得更快，更合适时，自然就放松了。	\N	\N	17	\N	3	\N	5	2	2019-01-27 22:03:25.270647	2019-01-27 22:07:01.524607	2019-01-27	0	\N	\N	251	1	2	f	\N
222	6	9	优缺点分析	朋友之间，承诺非常重要。 承诺意味着必须做到。这也是朋友难得的原因，是需要用真诚付出来交换的。\r\n\r\n而我之前表现上有2问题：\r\n1，很少对别人承诺什么，即便是非常亲近的人\r\n这点说明人不是很重情谊，较少考虑别人的感受。\r\n其实设身处地从别人角度看问题， 才能看得更加全面和真实。\r\n\r\n2，在集体行动中，很少trace一些事情。\r\n如果没有负责人，作为队员，至少提出问题。\r\n	\N	\N	17	\N	3	\N	5	1	2018-12-31 22:44:26.835196	2019-03-07 10:05:03.887653	2018-12-31	0	\N	\N	222	1	2	f	\N
221	6	9	面试方法总结	技术：\r\n1，对某个系统的掌握程度------时间，关键问题的总结与理解\r\n2，代码开发，工程能力------看输出\r\n3，创新能力-------看对系统的改进，想法等。\r\n4，思维方法----逻辑清晰，科学态度\r\n\r\n德：\r\n1，责任感，重承诺----推动事情完成\r\n2，积极态度----能主动发现问题，积极处理\r\n3，三观要正----正确认知自己的价值，对未来的规划可体现部分。邓主要问题，三观有问题，社交一般也有问题。要么冷漠，麻木。要么勾心斗角。\r\n\r\n要识别伪君子，这种人比较恐怖，说得一套套，做起来都不行。像冯有这种倾向。\r\n少言者这种人比较少。\r\n\r\n社交：\r\n1，能分清自己和别人界限，具备良好的互赖，既无太孤僻，也不太依赖。\r\n黎就是有点依赖过头。\r\n\r\n\r\n\r\n	\N	\N	17	\N	3	\N	5	4	2018-12-31 22:37:14.816381	2019-03-07 10:25:16.613858	2018-12-31	0	\N	\N	221	1	2	f	\N
212	6	6	计算科学的本质	计算机本质上是逻辑，逻辑在任何行业都存在，所以计算机具备了改在其他各行各业的基础。\r\n\r\n就这是计算的本质。\r\n\r\n哲学与科学是相辅相成的，哲学上提出理性，感性，逻辑这些概念之后。\r\n古典那种模糊的理性就并非真的理性。\r\n\r\n计算机世界塑造万物的内核就是逻辑，事物的表象，呈现是逻辑在外在的表现。\r\n这是一种世界观。在计算机的世界上，人就像上帝一样。\r\n\r\n逻辑依赖于计算机这个实体，实体会因为材料，工艺等技术进步得以升级。\r\n\r\n人工智能是迈向人探索复杂算法的一步，未来毕将走得更远。\r\n如何理解这种复杂性？还是大道至简，使用简单粗暴的方法就能得到智能化。目前看确实走在这条路上。\r\n\r\n我他妈就喜欢简单粗暴。不断迭代逼近。\r\n这世界上有些问题复杂在于人的认知上难以纠正。另外有些问题复杂在于人不知道如何分类分治。	\N	\N	17	\N	3	\N	5	1	2018-12-23 09:49:09.147361	2019-03-21 20:49:12.665329	2018-12-23	0	\N	\N	212	1	2	f	\N
319	6	20	职业生涯规划-小章鱼之早会篇	时间：2019年3月22日8:30-9:30\r\n地点：能源大厦11楼\r\n人物：友邦保险深圳分公司吉大家族所有人员，分享嘉宾郑先桃\r\n参与理由：想了解保险代理人的工作流程及状态\r\n收获：\r\n友邦周五的早会主要内容是优秀代理人分享，外加业绩及活动的告知！\r\n1、首先人生有很多中可能性，其次就是用尽全力去正在做的每一件事情；\r\n2、从事销售，需要极度的自律，才能收获果子，销售首先是要销售自己，展现出自己的专业度。\r\n3、给自己一个激励自己的长期目标，在困难的时候可以让自己坚持下去，这也许就是信念的力量！\r\n\r\n\r\n行动：\r\n# 目前和小章鱼见面3次，其中1次是职业生涯咨询，1次是下午茶会，1次是每周五早会，她没有太多的去追问我的感受，只是在讲诉她在做些什么，这样一种姿态，虽然背后一定是有一目的性的，但会让人觉得不功利。今天微信表达了对她的感谢！\r\n【今天，谢谢雨晨，给我提供一个参加你们早会的机会，很开心能够看到桃子还有波姐这样优秀的人，还有你。通过第一次见面还有参加早会及下午茶会，给我最大的触动就是人生有很多中可能性，其次就是用尽全力去正在做的每一件事情。你也给了我很多启发，我正在践行、探索及思考，下次再跟你分享哈！】\r\n# 用半个小时的时间文字记录感受。	\N	\N	17	\N	3	\N	6	0	2019-03-22 08:40:54.351721	2019-03-22 08:40:54.351721	2019-03-22	0	\N	\N	319	1	2	f	\N
275	6	9	过程与结果	马老师说 没有过程无法复制，没有结果没有价值	\N	\N	17	\N	3	\N	5	0	2019-02-19 09:50:52.062286	2019-02-19 09:50:52.062286	2019-02-19	0	\N	\N	275	1	2	f	\N
244	6	6	问题与求解	1，问题分析\r\n2，案例查找\r\n3，借用相似案例\r\n4，识别出问题不一样的地方，并理解其本质\r\n5，采用新方案，或改进老方案。	\N	\N	17	\N	3	\N	5	1	2019-01-21 20:56:24.822774	2019-03-23 15:13:51.132536	2019-01-21	0	\N	\N	244	1	2	f	\N
271	7	16	考虑清楚V6版本多站点这块能做哪些改造	1，采用push方式。\r\n简单模型，同时方便实现向第三方存储同步数据（容灾，备份，以及归档等）\r\n\r\n2，采用独立组件，以及配置来运行。\r\n调用通用的写入接口来实现。\r\n\r\n3，考虑支持优先级队列，Qos控制等等。	\N	\N	19	\N	3	\N	5	5	2019-02-16 14:42:10.635769	2019-02-23 14:59:31.802244	2019-02-16	0	\N	\N	271	1	2	f	\N
283	6	1	服务框架解决负载均衡问题	在整个系统中设置接入的高可用服务。业务rgw启动后向其注册服务。\r\n该服务可向client分配业务rgw的endpoint。\r\n\r\n1，可制定灵活的分配规则。以及从端站点的利用。endpoint与region有关联。\r\n2，管理业务rgw的状态。根据状态确定endpoint是否可用。\r\n3，单个endpoint可配置HA，当然也可配置负载均衡。\r\n	\N	\N	17	\N	3	\N	5	2	2019-02-25 09:54:38.11807	2019-02-25 10:38:20.96612	2019-02-25	0	\N	\N	283	1	2	f	\N
321	6	8	为何要战	道不同，以光大本道。破除邪道。当人类走在分岔口。意识形态碰撞强烈时，战争就开始了。\r\n\r\n战争还有一种单纯的原因就是利益。在物质并非最贵资源的今天，以争夺资源为目标的战争缺乏存在的基础。\r\n但是利益之战仍然存在，其形态发生了改变。	\N	\N	17	\N	3	\N	5	1	2019-03-24 19:22:33.828936	2019-03-24 19:24:58.958456	2019-03-24	0	\N	\N	321	1	2	f	\N
284	7	16	梳理V5.3.0之前的问题单，分阶段解决	第一阶段：先解决重要且影响巨大的问题单	\N	\N	19	\N	3	\N	5	0	2019-02-26 07:07:59.947528	2019-02-26 07:07:59.947528	2019-02-26	0	\N	\N	284	1	2	f	\N
286	8	7	故障暴力重启 vs 故障细节处理	1，是提前分配内存，还是内存不够直接挂掉？\r\n2，恶性超时是直接退出，还是给客户端返错？\r\n3，watch失败是退出，还是设计重试机制？	\N	\N	17	\N	3	\N	5	0	2019-02-26 14:42:07.825817	2019-02-26 14:42:07.825817	\N	0	\N	\N	286	1	2	f	\N
272	6	9	什么是我	用数据发现价值	\N	\N	17	\N	3	\N	5	4	2019-02-18 07:19:54.648528	2019-04-04 21:57:58.792582	2019-02-16	0	\N	\N	272	1	2	f	\N
274	6	7	大数据与AI	https://juejin.im/post/5ad4b620f265da23a04a0ad0\r\n文中提及的模型比较有意思。大数据处理是f()/x, 输出是y。\r\nAI输入是x/y，输出是f(). 拟合各种函数。	\N	\N	17	\N	3	\N	5	1	2019-02-18 08:19:02.806912	2019-04-16 12:24:30.755843	2019-02-18	0	\N	\N	274	1	2	f	\N
340	6	17	账号	Anew**422\r\n\r\n码云:jerry_xr86\r\njira:xierui\r\n\r\n	\N	\N	17	\N	3	\N	5	1	2019-04-22 11:51:48.034669	2019-04-22 14:33:28.849304	2019-04-22	0	\N	\N	340	1	2	f	\N
341	7	17	熟悉pg整体架构以及存储子模块	1，整体架构\r\n2，存储模块架构\r\n3，数据组织\r\n4，如何自定义系统表或视图	\N	\N	19	\N	3	\N	5	6	2019-04-22 12:35:35.257702	2019-04-23 15:01:52.30496	2019-04-22	0	\N	\N	341	1	2	f	\N
342	7	16	2019.4.23	1，弄清楚数学的发展脉络，离散数学的起源\r\n2，离散数学所能解决的问题。\r\n\r\n下午：\r\n1，学习pg整体架构	\N	\N	19	\N	3	\N	5	2	2019-04-23 06:33:02.212158	2019-04-23 10:41:18.580623	2019-04-23	0	\N	\N	342	1	2	f	\N
345	8	7	如何把理发师悖论描述成集合论的表达方式？		\N	\N	17	\N	3	\N	5	1	2019-04-23 18:31:21.457047	2019-05-02 19:07:01.972029	\N	0	\N	\N	345	1	2	f	\N
280	6	9	谢锐3.0版本	3.0版本要求：\r\n硬件：\r\n1，修复牙齿\r\n2，羽毛球达到纯业余中高级水平\r\n\r\n操作系统：\r\n1，时间管理做到天级别\r\n2，正式做心态管理，持戒清念\r\n3，进一步完善认知和规则，并在日常工作和交流中加以运用。\r\n4，能进行流利的英文论文，杂志阅读。\r\n5，能进行非正式的会谈，建立起技术联系网。\r\n\r\n服务：\r\n1，启动第一个正式个人项目\r\n2，工作上继续完成工程能力，但同时也提升理论高度。	\N	\N	17	\N	3	\N	5	6	2019-02-23 06:40:10.417236	2019-06-30 09:17:57.383572	2019-02-23	0	\N	\N	280	1	2	f	\N
285	8	7	分布式系统元数据是否应该独立于数据，避免性能干扰	比如rgw中list bucket，user等操作会被其他操作卡住。\r\nosd的消息接收队列长度有限制，其线程调度也有限制。\r\n\r\n而且这些数据IO量不大，不必额外占用磁盘。	\N	\N	17	\N	3	\N	5	0	2019-02-26 08:32:59.863796	2019-02-26 08:32:59.863796	\N	0	\N	\N	285	1	2	f	\N
279	8	7	LVM学习笔记-疑问	1，NAT模式\r\n所有流量都走DS（转发服务器），所以带宽受限。\r\nRS回Client的请求经过DS，因而RS要配置DS为默认网关。\r\n好处是DS控制一切，可以走端口转换。\r\n\r\n2，DR模式\r\n问题1：是否所有包都经过DS？还是仅连接建立的包经过。\r\n问题2：RIP对应网卡出去的包，源IP如何伪装为VIP？伪装为VIP之后是否意味着，后续请求都得经过DS？lo在其中扮演什么样的角色？\r\n问题3：伪装为VIP是因为TCP/IP 4元组要求么？\r\n\r\n3，tun隧道模式\r\n问题1，什么是隧道? \r\n	\N	\N	17	\N	3	\N	5	3	2019-02-21 19:05:58.301505	2019-02-23 09:12:17.648766	\N	0	\N	\N	279	1	2	f	\N
343	8	9	我想有一双眼睛，能看到事务的本质，而不仅是使用形式思维，归纳思维。		\N	\N	17	\N	3	\N	5	0	2019-04-23 14:22:50.206118	2019-04-23 14:22:50.206118	\N	0	\N	\N	343	1	2	f	\N
281	7	16	xx 环境从Jewel升级到L之后bucket list不到部分对象的问题	1，rados对象是否损坏\r\n2，格式不兼容？但是能list到部分是什么情况？\r\n3，纯粹找不到key，db损坏如何解。	\N	\N	19	\N	3	\N	5	1	2019-02-24 13:25:04.959421	2019-02-24 15:28:20.858271	2019-02-24	0	\N	\N	281	1	2	f	\N
282	6	1	rgw cache	特点：\r\n1，是使用system obj来实现的，所以凡是采用类似方法，不论更新频度如何都会使用上cache\r\n所以实际上同步状态的更新不适合用cache\r\n2，cache的通知是用rados watch/notify机制。该机制在watch超时等情况下可能失效。应该额外设计轮询机制\r\n保障其可靠性。或者在watch失败的情况下退出程序（太粗暴，直接影响业务可用性）。\r\n3，cache住的是数据内容，即bufferlist。在内存中使用的是结构体，但是rgw对于很多元数据如zonegroup，zone等信息在cache失效情况下，没有reload。而是采用period更新机制来刷新的。这个机制可能中断业务rgw。动作非常大。\r\n4，bucket和user信息额外设计了结构体的cache，在rgw cache失效情况下会同时使上层cache失效。\r\n\r\n应该将zone相关信息使用聚焦，不去使用cache。或者将zone信息不变部分或变化部分稍微分离。确保业务rgw的简单稳定。	\N	\N	17	\N	3	\N	5	0	2019-02-25 09:46:01.478326	2019-02-25 09:46:01.478326	2019-02-25	0	\N	\N	282	1	2	f	\N
344	6	7	数理逻辑-命题公式-蕴含	如果p,那么q 就是一个命题公式。\r\n\r\n比如狗急跳墙，这就是一个蕴含命题。狗急了，狗跳墙。\r\n你要证明这个命题为假，用反证法，就需要找到一条狗，它急了，但是没跳墙。\r\n\r\n这就是蕴含命题作为命题公式的语义。它表示了作为一个整体，它描述了一个命题作为整体的真值情况。	\N	\N	17	\N	3	\N	5	0	2019-04-23 18:27:32.943197	2019-04-23 18:27:32.943197	2019-04-23	0	\N	\N	344	1	2	f	\N
291	8	7	TO B的选择	我想把多站点做好是因为想打扫自己觉得不舒服的地方么？\r\n还是从研发角度认为该功能比较有价值。\r\n\r\n售前的出发点是做特性拿下更多客户。\r\n而作为研发想出发点是做好产品，推广给客户。	\N	\N	17	\N	3	\N	5	0	2019-03-02 10:08:57.755381	2019-03-02 10:08:57.755381	\N	0	\N	\N	291	1	2	f	\N
287	6	7	关于网卡	1，如何确定系统有几张物理网卡？\r\n2，网卡名称从何而来？\r\n3，如何确定网卡可用？\r\n4，网卡可用与是否连接到交换机有关系么？\r\n5，网卡ifdown本质是什么？\r\n6，ifcfg-eth 配置可以随便改么，该文件的名字一定要和网卡名称对应么？	\N	\N	17	\N	3	\N	5	2	2019-02-28 09:46:12.531481	2019-03-01 07:28:15.409733	2019-02-28	0	\N	\N	287	1	2	f	\N
288	8	1	ceph  degraded or misplaced	degrade的是根据acting set计算的，意思是集群的对象缺少多少份副本。\r\n比如一个3副本的对象，缺少2副本。则degraded就是2.\r\ndegraded = (副本总数 - acting副本数) * num_objects + missing[acting副本]\r\n\r\nmisplaced是根据up计算的。算法比较简单，就是看有多少对象需要调整位置，放到不同的osd上。\r\nmisplaced = （acting副本数 - (acting 与 up交集副本数)）* num_objects.\r\n\r\n所以degraded + misplaced = 需要recovery与backfill的对象总数	\N	\N	17	\N	3	\N	5	0	2019-03-01 14:08:28.916887	2019-03-01 14:08:28.916887	\N	0	\N	\N	288	1	2	f	\N
296	6	18	交流的套路	有4种人，客户，投资人，合伙人，供应商。\r\n与人交流无外乎几种情况。\r\n\r\n把与每个人交流的思路反复演练。把自己的产品定义好，推销出去，搞好营销。	\N	\N	17	\N	3	\N	5	1	2019-03-06 22:54:27.788418	2019-03-08 11:51:36.639655	2019-03-06	0	\N	\N	296	1	2	f	\N
292	6	8	关于人的原则	1，人最深沉的本性就是渴望得到别人的重视。\r\n2，人是恐惧而有贪婪的。\r\n3，人必须伪装，否则无法生活。而大部分人只有在深夜独处时才将内心的野兽释放出来。\r\n4，人通常生活在自己构造的虚假，幻像世界中。真实离人何其遥远。\r\n5，避险与拒绝担责是人的天性。\r\n6，世界上唯一能影响人的办法就是谈论其想要的，而且还要告诉他如何得到想要的。\r\n7，人只有为自己服务的时候才最在状态，这就是兴趣的力量。如果把这种服务分享给其他人就能产生价值。\r\n8，你的管理能力，取决于你能深入了解多少人，并且能从他们的立场来考虑问题。	\N	\N	17	\N	3	\N	5	1	2019-03-03 21:37:22.01719	2019-03-03 21:51:00.513682	2019-03-03	0	\N	\N	292	1	2	f	\N
294	6	9	没有一无是处的人	没有一无是处的人，如果感觉有，可能出现了如下情况：\r\n1，他放错了地方，做着不适合自己的事。\r\n2，他做了不适合自己当下的事，聪明有经验的人不提出自己的建议，新手笨拙的人不提出自己的疑问。\r\n张小龙还想一秒变傻瓜呢，有些人不用变，因为心中没有魔障。\r\n\r\n说起来就是空间与时间，位置领域与趋势时机。	\N	\N	17	\N	3	\N	5	1	2019-03-05 07:50:19.076898	2019-03-05 07:51:48.854283	2019-03-05	0	\N	\N	294	1	2	f	\N
295	6	9	关于第三次换工作的思考	2018年我自己总结是在忙，在学习，但是缺乏归属感，成就感。总之工作中我不算快乐，我的动力纯粹来源于对于问题的好奇心。\r\n不得不说，在推动工作进展，推动其他人共同进步上，我是非常乏力的。当然在面试人看人上同样乏力。\r\n\r\n故而我现在坚持这样的观点，我想确定自己真正热爱的事业是什么。如果这点没想清楚，这个人顶多是高级工程师。\r\n这点决定了在遇到困难时，它可能采取的态度，是去逃避还是面对。\r\n\r\n第二点，选择有想法，坦诚而开放的人。这也许不能直接决定自己的成败。但至少过程会更加快乐。同时也有助于在遇到困难时，直面现实并克服困难。\r\n选择优秀的人，并让他们承担重任。而不是找马虎可用的人，这点非常重要。马虎敷衍的人会让整个团队都拖慢。\r\n\r\n第三点，就是风险，能消除生活环境，以及基本的经济压力。\r\n\r\n马云说的钱不到位，心理委屈。还是有点片面的。\r\n心理不委屈，但是无法持续快速发展的环境人也是待不住的。无法助人达到目标。还有本来就没找到自己目标的人同样也是不稳定的。\r\n在他们看到新的目标之后，可能就会离开。\r\n\r\n目标上，我个人将解决存储问题转移到数据的价值发现问题，用科学工具，收集数据，运用算法分析，得出结论。这样我的智慧就会与日俱增。\r\n而我业余所思的零散想法也可以科学化。如果我将服务提供给其他人，我的财富就会与日俱增。我相信每个人都需要一个智囊团，我可以首先给自己\r\n建立一个智囊，建立起知识的宝库，让人类所有已知的经验，知识为我所用。让人发现知识的方式发生根本改变。\r\n\r\n这次换工作可以说调整为该方向，也许他们最终目标与我有点不一样，但是至少是同路的。\r\n另外从第二点上他们应该算不错的同路人。\r\n\r\n所以这次换工作我在观念上有2个转变：我同时是创业者与打工者。\r\n我将自己的问题通过软件给解决掉，并考虑提供服务。可以找人合作，甚至招人等。\r\n\r\n另外谈点私心，任何人不会把自己最核心的竞争力分享给大众，否则他们将失去竞争力。所以从别人那里拿到的肯定不是\r\n最fresh的，但是这同样有助于我们成长。最世界都是一部分人收着另一部分人的税。如果你把交易也看成对于自己不擅长领域的交税的话。\r\n当然这是正常的。大部分人可能都生活在假象与未知之中。想要收别人的税，我们得看到真实，保持优势。并找到缺乏我们拥有东西的对象，收他们的税。\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2019-03-06 21:15:59.987974	2019-03-06 21:15:59.987974	2019-03-06	0	\N	\N	295	1	2	f	\N
297	8	18	创业的本质是什么	创业的本质目标就是雇佣人提供产品或服务。以解除创业者需自己主动劳动获取报酬的情况。\r\n赚取别人的剩余价值。\r\n\r\n或者说更直白点，就是提供产品，赚取税收。这产品不是自己的劳动。	\N	\N	17	\N	3	\N	5	0	2019-03-06 22:57:53.140159	2019-03-06 22:57:53.140159	\N	0	\N	\N	297	1	2	f	\N
318	6	7	内存存储与磁盘存储的本质区别	内存具备随机访问，每个数据都有地址。速度快，掉电就没了等特点。\r\n\r\n磁盘或SSD存储只能按最小单位读取。掉电没关系。\r\n\r\n其核心区别还有一点：地址的表达形式不一样。内存可使用逻辑地址指针，而磁盘存储必须用用户定义的逻辑地址。	\N	\N	17	\N	3	\N	5	0	2019-03-21 20:55:02.434409	2019-03-21 20:55:02.434409	2019-03-21	0	\N	\N	318	1	2	f	\N
300	7	16	事宜	1，确定4月公积金等是否正常\r\n2，确定加班时间如何算\r\n3，会否有其他补偿，保密协议内容	\N	\N	19	\N	3	\N	5	0	2019-03-08 12:14:37.448123	2019-03-08 12:14:37.448123	2019-03-08	0	\N	\N	300	1	2	f	\N
320	6	7	数据结构	数据结构用来管理一定数量的同类对象。\r\n既然有一定数量，自然有增删改查的需求。\r\n\r\n如果对象只有一个，那自然没那么费事。\r\n数据结构就是用于处理数据集，以及相关运算的。\r\n\r\n矩阵可以用来表示图，也可以表示方程组。表示多个变量之间的关系。\r\nhttps://www.zhihu.com/question/19919917	\N	\N	17	\N	3	\N	5	0	2019-03-22 16:26:09.13832	2019-03-22 16:26:09.13832	2019-03-22	0	\N	\N	320	1	2	f	\N
305	6	7	数据可靠性方法	1，多副本\r\n2，多站点\r\n3，多版本，WORM防误删，CDP\r\n\r\n4，Read repair\r\n5，Scrub数据校验与恢复\r\n\r\n检测类：\r\n6，坏道检测\r\n7，SSD健康检查\r\n8，系统监控	\N	\N	17	\N	3	\N	5	0	2019-03-15 16:44:09.498257	2019-03-15 16:44:09.498257	2019-03-15	0	\N	\N	305	1	2	f	\N
327	6	7	注册码	EA：\r\nUser: MTF\r\nCompany: STU\r\nRegistration Key：\r\nADF8D83B-0683-4d1f-BB60-FF66D-WFM1-CHPZ-PII0-HN75-BC	\N	\N	17	\N	3	\N	5	0	2019-04-02 09:01:51.697517	2019-04-02 09:01:51.697517	2019-04-02	0	\N	\N	327	1	2	f	\N
311	6	7	Raft		\N	23	17	\N	3	\N	5	0	2019-03-17 05:56:51.286238	2019-03-17 05:56:51.286238	2019-03-17	0	\N	\N	311	1	2	f	\N
302	6	4	学习思路		\N	\N	17	\N	3	\N	5	3	2019-03-09 15:20:46.47037	2019-03-24 14:37:38.057306	2019-03-09	0	\N	\N	302	1	2	f	\N
312	6	7	epoll的原理		\N	23	17	\N	3	\N	5	0	2019-03-17 05:57:14.957242	2019-03-17 05:57:14.957242	2019-03-17	0	\N	\N	312	1	2	f	\N
324	3	1	顺丰交流总结以及MOS存在的风险	1，业务要求的性能是包含故障，跨区域复制，以及日常数据转移，scrub在内的端到端性能。\r\n这点对于可用性和性能要求就非常高了。\r\n\r\n   感觉BI增量恢复必须实现，否则只要短暂阻塞几秒，整个系统性能就下来了。\r\n\r\n2，系统可靠性要求，必须上3副本。且必须考虑SSD和HDD常态下损坏的情况。恢复的数据量。scrub多久可以完成。\r\n这些对于系统可靠性至关重要。\r\n\r\n3，业务侧不使用bucket list，这对于具体场景而言是很常见的。结合场景可能很容易做出优化N倍的方案。\r\n甚至考虑内存读加速等手段。\r\n\r\n4，性能显然不是单纯的测纯读或纯写。 尤其是对于Rados，混合读写比纯写或纯读都差不少。\r\n	\N	\N	17	\N	3	\N	5	1	2019-03-26 13:53:49.187611	2019-03-26 13:56:40.209716	2019-03-26	0	\N	\N	324	1	2	f	\N
325	8	11	如何进行有效的陪购	#思路及流程\r\n#运用到的知识和工具\r\n#需要注意的细节\r\n	\N	\N	17	\N	3	\N	6	0	2019-03-29 07:21:37.879861	2019-03-29 07:21:37.879861	\N	0	\N	\N	325	1	2	f	\N
329	6	8	人性是什么	那千疮百孔，千面千面。于浩浩汤汤的人世，如水一样的变化适应才能处于有利位置吧。\r\n否则时势变化，所以上善若水，厚德载物。孔子也将君子当有时出，而有时隐。\r\n\r\n水在万物中，而道也在万物中。为何追求美好的品德？为啥善良如愚蠢。	\N	\N	17	\N	3	\N	5	2	2019-04-04 22:35:30.880457	2019-04-04 23:08:28.373572	2019-04-04	0	\N	\N	329	1	2	f	\N
330	6	4	字母起源	http://shaoeryingyu.baike.com/article-183243.html\r\n	\N	\N	17	\N	3	\N	5	0	2019-04-07 20:23:04.000421	2019-04-07 20:23:04.000421	2019-04-07	0	\N	\N	330	1	2	f	\N
333	6	9	【未完成】有温度的团体		\N	\N	17	\N	3	\N	5	0	2019-04-09 16:21:21.747445	2019-04-09 16:21:21.747445	2019-04-09	0	\N	\N	333	1	2	f	\N
336	6	7	RGW开发教训集	1，缺乏充分调研，错用社区不稳定模块。闭门造车。\r\n2，有时候重写比重用更好，多版本，多站点就是典型例子，如果没搞懂，未经验证，最好别用。\r\n3，有时候以为需求明确了，但对于需求的紧急程度，需求的价值缺乏深入理解。\r\n做了很多流产的对接与小功能。\r\n4，没完全搞清楚现有系统就开始设计？你可能一开始就掉入陷阱。桶快照从开始到废弃。\r\n5，除了做对，还得考虑如何做得更好，V5重构就是一个天大的机会。然后错失了优化元数据的一次机会。\r\n6，临时测试验证的东西直接做成方案？小文件优化把这个坑演绎到极致。\r\n7，自动化测试用例应该由开发人员来写，且必须能快速有效的运行。\r\n8，设计review和开发review不仅应该做，而且应该做得很细。	\N	\N	17	\N	3	\N	5	2	2019-04-15 14:07:01.933826	2019-04-15 14:08:26.855568	2019-04-15	0	\N	\N	336	1	2	f	\N
338	6	8	雾霾	1，造物主给了人很多，我们存在非常多的可能性\r\n2，生活就如一面镜子\r\n3，每个人都应该快乐\r\n4，多赢是一种常态\r\n\r\n体察身边的一切，当心念升起时，感受它，与之和谐相处。这便是雨。\r\n心念升起而又未知，莫名，即不在当下，就如程序踩了内存一般。这就是霾。看不清，道不明，不知何时何地升起。\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2019-04-16 07:44:21.852867	2019-04-16 07:44:21.852867	2019-04-16	0	\N	\N	338	1	2	f	\N
339	6	7	工具收藏	1，Q-dir 分屏\r\n2，wireshard抓包\r\n3，有道笔记\r\n4，beyond compare	\N	\N	17	\N	3	\N	5	0	2019-04-16 11:49:44.095702	2019-04-16 11:49:44.095702	2019-04-16	0	\N	\N	339	1	2	f	\N
353	6	7	数理逻辑-推理与证明	1，命题转换\r\n2，借助其他命题\r\n\r\n前提条件，蕴含的意思是如果前提为真，那么整体是否为真取决于结论是否为真。\r\np->q为真，则p是q的充分条件。\r\n\r\n推理规则就是采用等值变换将命题转换为其他形式。或根据前提来得出结论。\r\n\r\n直接证明：利用定义，以及其他公理，定理。通过推理来得出结论。\r\n反证法原理：p->q 等价于 非p V q 等价于 qV非p 等于于非q->非p。\r\n归谬法原理：证明p为真 等价于 非p->false为真。 false的一种形式为r且非r。 \r\n\r\nso看到没，数理逻辑是数学证明的基础。证明的本质在于运用定义，公理来推理。	\N	\N	17	\N	3	\N	5	3	2019-04-25 09:23:13.664047	2019-05-06 20:10:10.72367	2019-04-25	0	\N	\N	353	1	2	f	\N
388	6	23	名正言顺		\N	\N	17	\N	3	\N	5	0	2019-05-13 06:56:44.658633	2019-05-13 06:56:44.658633	2019-05-13	0	\N	\N	388	1	2	f	\N
391	6	9	不要去抱怨，社会系统已经把我们放在了比较合适的位置		\N	\N	17	\N	3	\N	5	0	2019-05-13 08:13:40.247678	2019-05-13 08:13:40.247678	2019-05-13	0	\N	\N	391	1	2	f	\N
326	6	19	第13周周末活动安排（3/30-3/31）	安排好自己的时间\r\n协调好家人的时间\r\n过一个有意义的周末	\N	\N	17	\N	3	\N	6	4	2019-03-29 07:23:50.720558	2019-05-14 12:47:02.743892	\N	0	\N	\N	326	1	2	f	\N
303	6	4	英语的说文解字	1，说文解字只是学习的初步阶段的工作，在真正记住词义之后，用的越来越少。\r\n2，词素概念是说文解字的理论基础。句子由词素构成。\r\n3，单词由词根与词缀拼装而成。并且在词形，词义，词音与语法上关联。\r\n在词形上为了符合语法构词要求通常会增加连接词，以及在连接的地方做些变化。\r\n词义上通常以词根为主，但是会做一些延伸，变化。\r\n词音，通常重音在词根上。\r\n语法上，根据词根的语法属性，对构词有点要求，同时派生词的熟悉也与词根有关系，当然见的更多的是词缀来转化词的语法属性。	\N	\N	17	\N	3	\N	5	2	2019-03-11 04:42:31.619307	2019-03-24 08:37:29.127242	2019-03-11	0	\N	\N	303	1	2	f	\N
299	6	8	机器模型-荷塘	通过荷塘系统，加强生活节奏，时间管理，心态管理监控\r\n\r\n荷塘系统的目标是让自己每天保持健康的生态，下雨会有，晴天会有。但雾霾，沙尘不能有。	\N	\N	17	\N	3	\N	5	2	2019-03-08 06:59:27.122022	2019-03-08 09:27:21.164398	2019-03-08	0	\N	\N	299	1	2	f	\N
290	8	7	科学研究与工程的区别	科学研究与工程产品，工作范式不一样。\r\n科学研究是纵，犹如在黑夜中穿越森林。http://www.sohu.com/a/278979780_610300\r\n工程产品是横，需在纷繁复杂多领域中折中与取舍。	\N	\N	17	\N	3	\N	5	2	2019-03-02 10:07:50.768426	2019-03-08 09:33:19.400313	\N	0	\N	\N	290	1	2	f	\N
301	6	7	REST 与 RPC	总结：\r\n对外开放给全世界的API推荐采用RESTful，是否严格按照规范是一个要权衡的问题。要综合成本、稳定性、易用性、业务场景等等多种因素。\r\n内部调用推荐采用RPC方式。当然不能一概而论，还要看具体的业务场景。\r\n另外一个因素是人，关键是你有什么人，postgresql、mysql都有用的不错的，迁来迁去，关键是你的人对哪个更熟悉。\r\n--------------------- \r\n作者：王启军 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/douliw/article/details/52592188 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！	\N	\N	17	\N	3	\N	5	0	2019-03-08 16:03:40.934477	2019-03-08 16:03:40.934477	2019-03-08	0	\N	\N	301	1	2	f	\N
328	6	5	制度与文化	制度与文化的关系就像机器与润滑油的关系。\r\n\r\n文化能迸发出生生不息的力量。制度与法律就是企业的方，而文化就是企业的圆。	\N	\N	17	\N	3	\N	5	0	2019-04-04 21:52:10.812577	2019-04-04 21:52:10.812577	2019-04-04	0	\N	\N	328	1	2	f	\N
323	6	10	杉岩产品研发的教训	1，苗错市场，未能及时准备与投入\r\n   开始重点投入块存储，后识别对象存储后，也未能果断及时投入。\r\n2，未能识别关键问题，特性投入失误\r\n  看客户做需求，但是看的客户又不够多，没抓住核心痛点重点投入。\r\n  其实对于对象存储就1个大痛点：海量小文件场景下的性能\r\n  另外一个是分布式系统的可用性，性能稳定性。\r\n\r\n  以高打低的方式\r\n\r\n3，技术基础架构方面未能在开始打通产品平台，造成极大的资源浪费。\r\n4，缺乏完善的工程体系，整体效率低下。\r\n   现代复杂软件的模式下，难以想象没有自动化的测试，以及针对分布式系统的各种注入测试。	\N	\N	17	\N	3	\N	5	2	2019-03-25 23:32:05.260507	2019-03-25 23:37:26.704235	2019-03-25	0	\N	\N	323	1	2	f	\N
304	7	16	3.14安排	1，验证迭代三软件包\r\n2，验证trigger方式是否会导致其他rgw挂掉。\r\n3，看还有没问题单可以想办法解决	\N	\N	19	\N	3	\N	5	0	2019-03-14 07:04:01.286585	2019-03-14 07:04:01.286585	2019-03-14	0	\N	\N	304	1	2	f	\N
116	3	1	系统盘满导致s3客户端获取数据异常，获取的数据比期望的长度短	分析半天，才发现nginx日志中打出了关键信息。\r\n\r\nnginx fcgi buffer 机制，当http header部分数据需要写入到缓存目录，当操作系统盘满之后，会导致无法写入磁盘。\r\n数据发送到客户端的内容不完整，所以MD5校验失败。\r\n\r\n什么情况下http header会写入fastcgi_temp目录呢？	\N	\N	17	\N	3	\N	5	1	2018-10-11 19:46:25.619833	2019-03-30 12:56:48.275554	2018-10-11	0	\N	\N	116	1	2	f	\N
306	6	9	头条面试总结	1，LSM-tree\r\n2.Raft协议实现\r\n3.epoll实现，内部算法\r\n\r\n主要考察还是算法和数据结构这块。	\N	\N	17	\N	3	\N	5	0	2019-03-15 17:42:29.032144	2019-03-15 17:42:29.032144	2019-03-15	0	\N	\N	306	1	2	f	\N
293	6	7	测试覆盖的方法	任何软件系统都是函数组成的。函数有涉及输入输出。\r\n，通常函数还会依赖其他函数。\r\n\r\nf(x) = g(x) + kx + m (其中x是输入变量组)\r\n\r\n在该模型下，要测试完整。需要做几件事：\r\n1，覆盖所有的x输入情况\r\n2，对g(x)所有返回值进行打桩\r\n\r\n系统测试的含义可能就是如此。软件系统是有各种输入，一些外部交互组成的。\r\n构造一个测试机器人，通过系统内部的打桩等。\r\n\r\n任何组件都可以设计这样一个测试系统。\r\n实际的情况可能更复杂一点，我们需要考虑在函数执行的某一步失败，需引入序列失败以及随机失败情况。\r\n\r\n\r\n\r\n	\N	\N	17	\N	3	\N	5	2	2019-03-05 07:18:53.797404	2019-04-04 21:21:21.364298	2019-03-05	0	\N	\N	293	1	2	f	\N
307	6	7	红黑树		\N	23	17	\N	3	\N	5	0	2019-03-17 05:55:09.558452	2019-03-17 05:55:09.558452	2019-03-17	0	\N	\N	307	1	2	f	\N
308	6	7	哈希表		\N	23	17	\N	3	\N	5	0	2019-03-17 05:55:37.984243	2019-03-17 05:55:37.984243	2019-03-17	0	\N	\N	308	1	2	f	\N
331	6	7	能否证明所有同步复制方式，其复杂度跟raft是一样的	比如ceph的副本同步机制，完全没觉得其复杂度比raft低多少。\r\n其本质就是选举 + 一阶段提交 + 日志补偿	\N	\N	17	\N	3	\N	5	0	2019-04-09 07:54:05.072611	2019-04-09 07:54:05.072611	2019-04-09	0	\N	\N	331	1	2	f	\N
309	6	7	B-tree		\N	23	17	\N	3	\N	5	0	2019-03-17 05:55:52.810127	2019-03-17 05:55:52.810127	2019-03-17	0	\N	\N	309	1	2	f	\N
461	6	17	PG VXID	此机制也由32位的xid引入，针对查询不必消耗xid的优化。真是蛋疼！！！\r\nhttp://itfish.net/article/31621.html	\N	\N	17	\N	3	\N	5	0	2019-07-08 12:12:55.994631	2019-07-08 12:12:55.994631	2019-07-08	0	\N	\N	461	1	2	f	\N
310	6	7	LSM-Tree		\N	\N	17	\N	3	\N	5	0	2019-03-17 05:56:08.882386	2019-03-17 05:56:08.882386	2019-03-17	0	\N	\N	310	1	2	f	\N
334	6	9	【未完成】工作中应该花多少时间做深度思考	我觉得至少有一半吧，把日常开发工作时间压缩，效率提升一倍。\r\n然后通过深度思考，改进工作机器持续改进效率。	\N	\N	17	\N	3	\N	5	1	2019-04-09 16:24:30.454424	2019-04-09 16:25:46.240673	2019-04-09	0	\N	\N	334	1	2	f	\N
335	7	16	2019-4-5	1，完成离职相关事宜，离职证明\r\n<pre><code class="text">\r\n1、身份证、取得的最高学历证书和学位证书、职称证书等原件；\r\n\r\n2、原单位离职证明、社会保障卡，住房公积金卡等原件；\r\n\r\n3、大一寸免冠彩色照片三张；\r\n\r\n4、区级以上医院体检报告原件；\r\n</code></pre>\r\n\r\n2，建行解锁处理\r\n3，人才房事宜\r\n	\N	\N	19	\N	3	\N	5	0	2019-04-15 07:53:20.132628	2019-04-15 07:53:20.132628	2019-04-15	0	\N	\N	335	1	2	f	\N
347	6	18	数据交易市场-让每个人获取更好的数据，让思考不再空穴来风	不同的组织与个人之间交互数据，并进行计费。	\N	\N	17	\N	3	\N	5	3	2019-04-24 09:12:24.188837	2019-07-10 07:59:18.10072	2019-04-24	0	\N	\N	347	1	2	f	\N
349	6	9	算法与机器	算法是机器的执行逻辑，但机器本身还有其他内容，比如涉及的主体，角色，能量分配等。 可能主要是工程学问题。	\N	\N	17	\N	3	\N	5	0	2019-04-24 09:26:41.51712	2019-04-24 09:26:41.51712	2019-04-24	0	\N	\N	349	1	2	f	\N
348	6	18	算法市场	比如提供基于历史数据，以及当前数据的天气算法。不同的人可定义不同的算法。需要知识信息的人为算法付费。\r\n\r\n比如搜索引擎输入：明天天气情况\r\n如果存在默认算法，输出结果是明天下雨，或者其他情况，而不是一堆天气网站。\r\n\r\n其实针对问题我们可以给出答案。\r\n	\N	\N	17	\N	3	\N	5	1	2019-04-24 09:20:01.690005	2019-04-24 09:31:28.429895	2019-04-24	0	\N	\N	348	1	2	f	\N
351	7	17	学习离散数学-数理逻辑这块	命题，谓词，量词，推导，证明	\N	\N	19	\N	3	\N	5	0	2019-04-24 13:39:56.373279	2019-04-24 13:39:56.373279	2019-04-24	0	\N	\N	351	1	2	f	\N
350	6	7	数理逻辑-命题，谓词，量词	命题是逻辑的基本构件，是一个陈述语句，它或真或假，不能既真又假。\r\n谓词：谓词本质就是命题函数，存在变元。含谓词的命题也叫谓词命题\r\n量词：量词就是对于变元的情况做出规范，分为全称量词和存在量词。含量词的命题也叫量化命题	\N	\N	17	\N	3	\N	5	1	2019-04-24 11:35:28.63424	2019-04-25 06:45:05.685826	2019-04-24	0	\N	\N	350	1	2	f	\N
354	6	17	进程间通信-共享内存	pg中用到两种共享内存使用方式mmap与system v.\r\n\r\nmmap:由于pg多个进程是父子进程，因而使用的是匿名的共享内存。其实现原理大概是在fork产生子进程时，虚拟地址（内存地址）被子进程共享，由于共享的正好是共享内存，因此操作系统不会额外的给其生成拷贝。也就是说多个\r\n进程使用的是同一片内存，从而达到共享目的。\r\n\r\nsystem v 是采用特殊文件系统的方式实现的（https://www.ibm.com/developerworks/cn/linux/l-ipc/part5/index1.html）\r\nsystem v创建的共享内存空间受系统限制。	\N	\N	17	\N	3	\N	5	0	2019-04-25 15:30:42.077578	2019-04-25 15:30:42.077578	2019-04-25	0	\N	\N	354	1	2	f	\N
372	6	19	家庭生活的机器	工作日早上：6:30左右起床，完成运动和早餐准备。8点结束。\r\n晚上：7点-10点到家，如7点，则执行配谢震程序，和其他家庭准备事务。 如10点，则稍作休息，启动睡眠程序。\r\n\r\n休息日：安排带谢震活动 或家庭聚餐 或 交际沟通程序 或 个人提升程序（包括学习程序与专项运动程序）。\r\n\r\n饮食程序：1，避免吃过于辛辣，尤其是较晚的时候，影响睡眠。\r\n	\N	\N	17	\N	3	\N	5	1	2019-04-29 07:53:18.130105	2019-05-05 06:36:08.706326	2019-04-29	0	\N	\N	372	1	2	f	\N
358	6	9	程序员与算法	所谓架构就是函数之间的关系。从模块关系，特性关系等维度描述。这样就明确了如何牵一发而动全身。\r\n\r\n算法的本质就是数学逻辑，通过公理，定理，以及事物的定义和规律我们可以找到不同的路径来达到目标。\r\n还有更普遍的情况是我们没有摸清楚整体而犯的错，以及维护整体而做的修补工作。知晓未知而做的假设。\r\n程序员的核心工作当然是发现以及优化算法，并将其落地。数学是程序员的核心。否则就仅仅是执行者。\r\n\r\n具有天赋的人可能未经严密论证，凭直觉就找到了本来需经过很多步推导与转换才能知道的规律或定理。\r\n然后利用汗水去验证。\r\n\r\n工程上的问题同样非常重要。算法通常在存在细节和非常多的边缘情况处理。算法是骨，工程是肉。	\N	\N	17	\N	3	\N	5	1	2019-04-26 06:55:49.294642	2019-04-26 06:58:12.969068	2019-04-26	0	\N	\N	358	1	2	f	\N
360	6	17	PG内存数据的一致性保证		\N	\N	17	\N	3	\N	5	1	2019-04-26 08:47:28.253602	2019-04-26 09:12:04.347157	2019-04-26	0	\N	\N	360	1	2	f	\N
361	6	17	PG SysCache与RelCache		\N	\N	17	\N	3	\N	5	3	2019-04-26 08:47:48.534376	2019-04-28 09:07:33.344752	2019-04-26	0	\N	\N	361	1	2	f	\N
357	8	9	如何深入参加其他人主导，多人参与的讨论，讨论的范围以及结论的把握	讨论的范围完全不发散，那信息量太少，但是过于发散则成本上升。效率才是核心问题。\r\n多人参与的讨论需提前发出讨论主题，参与人应该提前熟悉并思考相关主题，否则就变成了发起人的独角戏。	\N	\N	17	\N	3	\N	5	1	2019-04-26 06:54:07.422094	2019-04-28 14:14:51.271206	\N	0	\N	\N	357	1	2	f	\N
375	6	9	读低风险创业有感	所谓忧虑，就是存在风险\r\n所谓风险，就是能力不足，无法cover住各种情况\r\n所谓创业，就是做一份自己热爱的事\r\n所谓懒惰，就是没有能力掌控自己的精力	\N	\N	17	\N	3	\N	5	3	2019-05-04 04:34:42.784883	2019-05-04 04:39:11.143843	2019-05-04	0	\N	\N	375	1	2	f	\N
378	6	7	windows编译	Cygwin：是poxis模拟环境，提供了一套模拟运行环境\r\nMINGW:是GNU的工具链，用于在windows上像linux一样编译程序。\r\nQt:基于Qt的桌面软件,Qt是一个桌面程序开发框架，就像windows上的MFC等	\N	\N	17	\N	3	\N	5	1	2019-05-05 16:45:54.895617	2019-05-05 16:52:08.993712	2019-05-05	0	\N	\N	378	1	2	f	\N
392	6	23	C语言是静态语言实现不了，结构体类型在执行期间确定的效果	请看这篇文章：\r\nhttps://cloud.tencent.com/developer/article/1152804\r\n\r\n编译时就知道变量类型的是静态类型；运行时才知道一个变量类型的叫做动态类型。\r\n不允许隐式转换的是强类型，允许隐式转换的是弱类型。\r\n\r\nC是静态弱类型语言。\r\n\r\n所以想通过指针，指向一个在执行期间根据变量确定其指向的结构体类型是不能实现的，你只能指向某种值类型。	\N	\N	17	\N	3	\N	5	1	2019-05-13 13:12:01.060616	2019-05-13 13:15:26.275234	2019-05-13	0	\N	\N	392	1	2	f	\N
395	6	19	2019年5月17日家庭活动筹备	# 确定主题\r\n# 制定流程\r\n# 对相关内容以及期望达到的效果进行准备\r\n# 通知相关参与人员以及协助筹备的工作	2019-05-16	\N	17	\N	3	\N	6	1	2019-05-14 12:43:40.13825	2019-05-14 12:45:21.886606	2019-05-14	0	\N	\N	395	1	2	f	\N
394	6	19	2019年5月12日母亲节活动总结	表达对母亲的感谢，促进家庭关系的和谐！	\N	\N	17	\N	3	\N	6	4	2019-05-14 12:13:16.298395	2019-05-14 12:44:25.405862	2019-05-14	0	\N	\N	394	1	2	f	\N
399	6	23	C语言-static	static语义是静态的，描述变量的静态存储特性，静态存储变量会自动初始化\r\n\r\n但是static在c语言中还有另一个作用（有点奇葩，一个关键字2个语义）： 限制作用域在本文件内。对于头文件而言就是包含该头文件的C文件内。	\N	\N	17	\N	3	\N	5	1	2019-05-14 15:22:42.03723	2019-05-14 15:24:17.939241	2019-05-14	0	\N	\N	399	1	2	f	\N
396	8	12	观察日期（15月-16月）	学会做父母，需要用心去体察，用爱去表达，是要用一生去学习、实践的人生大课\r\n# 通过日常的观察来了解谢震的内心世界\r\n# 通过记录来发现自己认知的盲区\r\n# 通过实践来提升自己做妈妈的能力	\N	\N	17	\N	3	\N	6	1	2019-05-14 12:55:09.883706	2019-05-15 12:54:25.01001	\N	0	\N	\N	396	1	2	f	\N
393	8	23	gitlab分支提交冲突解决办法	1，在自己仓库分支修改\r\n2，在自己仓库从origin的master分支pull\r\n3，在本地完成merge request，解决冲突\r\n4，将本地master推到自己的仓库master\r\n5，创建merge request	\N	\N	17	\N	3	\N	5	2	2019-05-13 17:38:35.106909	2019-05-17 11:40:30.470278	\N	0	\N	\N	393	1	2	f	\N
422	6	17	mysql redo调研	1,关于mysql的rowid\r\n2，mysql的redo格式\r\nredo记录的是page上的修改操作。\r\nSpaceID | PageNo  | Offset | OperationType | Changes on that page\r\n\r\nundo格式：\r\nPrimary Key Value |  Old trx id | Old values on that row\r\n\r\ninnodb数据以primary key以btree组织，其他index指向primary index。\r\ninnodb中delete以update方式记录undo，相当于update visible=false。\r\ndelete的记录不会立即删除，而是等到undo被discard的时候做purge。\r\n\r\nSome internal columns are added by InnoDB, such as DB_ROW_ID (row ID), DB_TRX_ID (transaction ID), \r\nand DB_ROLL_PTR (a pointer to the rollback/undo data).\r\n参考：https://dev.mysql.com/doc/refman/5.6/en/innodb-multi-versioning.html\r\n\r\n\r\n第一行数据:\r\n03 02 02 01 /*变长字段*/ ---- 如果没有变长字段，则长度为0\r\n00 /*NULL标志位，第一行没有null的数据*/\r\n00 00 10 00 25 /*记录头信息,固定5个字节*/\r\n00 00 00 03 b9 00 /*RowID,固定6个字节,表没有主键*/\r\n00 00 00 02 49 01 /*事务ID,固定6个字节*/\r\n82 00 00 01 4a 01 10 /*回滚指针,固定7个字节*/\r\n61 62 62 62 62 63 63 63 /*列的数据*/\r\n\r\n问题：\r\n1，primay key与普通列一起存储吗？\r\n  存是存，但是是存在rowid的位置。\r\n2，rowid等列会记录到redo吗？\r\n  primay key会，delete只记录到page/offset\r\n  但是其他非修改列不会记录。\r\n3, redo for undo与undo本身还是有区别的。\r\n  delete操作的redo for undo中并未记录所有old columns。	\N	\N	17	\N	3	\N	5	0	2019-05-23 13:08:29.903269	2019-05-23 13:08:29.903269	2019-05-23	0	\N	\N	422	1	2	f	\N
356	6	17	beas parser分享总结	核心思想就是利用Access Schema来改写查询，缩小查询规模，从而加速查询。\r\n改写的时候有一些坑：比如坑1在同一个表传递schema的时候存在放大的情况。\r\n坑2是多个表之间的schema，在运用时可能存在环。\r\n坑3是利用其他表作为中转，以及大量schema时，如何选择路径，以及如何运用条件等。	\N	\N	17	\N	3	\N	5	3	2019-04-25 19:00:52.357197	2019-04-27 13:45:26.6485	2019-04-25	0	\N	\N	356	1	2	f	\N
359	7	17	通过Admin Tool对BEAS中增加access schema信息	分解：\r\n1，创建access schema分为哪几步？有哪些操作？\r\n  当作元数据，用户管理schema属于元数据操作。\r\n  比如关联创建constraint index，关联创建衍生的acess schema? 是否需修改beas中保存的元数据？\r\n\r\n2，access schema在哪些阶段使用？怎样使用？\r\n  beas逻辑优化阶段\r\n\r\n3，access schema在什么情况下会被修改或删除？是否需关联删除constraint index？\r\n  当一个表的字段发生修改时\r\n  当一个表被删除时\r\n  \r\n  用户直接修改\r\n\r\n4，显然access schema在内存和外存中分别以什么形态存储？\r\n  hash查找快，但不好扩展。hash用来做均衡分布挺好的\r\n  红黑树可能更适合。\r\n\r\n5，对于access schema的使用做监控管理，比如用户使用怎样的查询语句来使用schema\r\n\r\n6，对于常量到表字段的映射，也需要加入到schema中管理？ \r\n比如select b2，a4 from A，B where a3 = 1. schema有null->a1, a1->b2.\r\nA的fetch sequence：a3=1\r\nB的fetch sequence：a3=1, a3->a1 , a1->a2\r\n\r\n7，关系提前生成？\r\n如a3->c4, c4->b3。从而生成a3->b3.\r\n	\N	\N	17	\N	3	\N	5	10	2019-04-26 08:30:26.433121	2019-05-07 09:18:33.942478	2019-04-26	30	\N	\N	359	1	2	f	\N
364	6	17	PG BufferCache		\N	\N	17	\N	3	\N	5	1	2019-04-28 09:07:55.133534	2019-04-28 14:24:45.016278	2019-04-28	0	\N	\N	364	1	2	f	\N
428	6	17	关于数据库范式	数据库范式是为了解决数据存储的规范引入的。在不满足数据规范时，由于存在内部依赖关系，可能引起数据的更新或删除异常。\r\n\r\nhttps://blog.csdn.net/ljp812184246/article/details/50706596\r\n\r\n一种比较简单的定义数据方法可能是将实体与关系分离。也就是所谓的ER图。	\N	\N	17	\N	3	\N	5	0	2019-05-26 13:59:32.797045	2019-05-26 13:59:32.797045	2019-05-26	0	\N	\N	428	1	2	f	\N
365	6	18	从机器，数据和算法的角度看世界	企业运行就是在执行算法，效率高的企业自动化执行，而效率低的企业人肉执行。是否人力密集型。\r\n企业的核心资产就是数据，当然有些公司在该市场上仅提供算法处理数据。但没有数据的算法就是无本之源。\r\n\r\n由此角度看，兴趣的本质就是人所关心的数据，以及算法。以及背后就是想解决的问题。\r\n\r\nso，比如说你喜欢羽毛球，这是一个市场。我们可以从数据与算法角度来解析这个市场。\r\n\r\n羽毛球拍公司掌握了制作羽毛球的算法，羽毛球，鞋子，衣服，手胶等等分支也是如此。\r\n这些公司实际上也可收集用户数据，但是通常公司做这个。\r\n\r\n球馆其实拥有客户数据，但是通常也没球馆专门分析客户数据。也没球馆分析客户使用的球拍和鞋子等。\r\n球馆提供了硬件环境-场地。\r\n\r\n打球的人作为客户享受了服务。并为此支付了自己其他劳动。\r\n\r\n通常人们说兴趣是指：作为客户享受什么样的服务。但这里想说的兴趣是作为客户，其自己需要什么样的服务，具备自行打造服务的能力，且可能出售自己的服务。这才是完整的兴趣。\r\n	\N	\N	17	\N	3	\N	5	0	2019-04-28 09:27:36.624257	2019-04-28 09:27:36.624257	2019-04-28	0	\N	\N	365	1	2	f	\N
362	6	17	PG事务与并发控制		\N	\N	17	\N	3	\N	5	5	2019-04-26 15:15:46.593093	2019-06-17 12:29:11.716922	2019-04-26	0	\N	\N	362	1	2	f	\N
430	6	17	执行器分享记录	标哥提及的一个查询扫描page时与vacuum的并发问题。\r\nTupleTableSlot：每次取一条记录。\r\n向量化执行：MPP中采用列存，可一次取一批，从而实现优化。\r\n并行执行，多个pg进程分工完成复杂查询。\r\njit：利用内联优化，加速计算密集型执行效率。\r\n\r\n并行，批量，减少不必要动作。还有啥性能优化手段。	\N	\N	17	\N	3	\N	5	0	2019-05-28 18:18:11.956206	2019-05-28 18:18:11.956206	2019-05-28	0	\N	\N	430	1	2	f	\N
431	6	12	扭扭车	https://detail.tmall.com/item.htm?id=552943690321&ali_refid=a3_430750_1006:1110353589:N:zumN4WFrVyoYFzUISvNddck7t2Iv8CtK:07bb167c79efee9951594235fbe952bb&ali_trackid=1_07bb167c79efee9951594235fbe952bb&spm=a21wu.10013406.0.0&skuId=3392316805043	\N	\N	17	\N	3	\N	5	0	2019-05-29 11:36:55.661701	2019-05-29 11:36:55.661701	2019-05-29	0	\N	\N	431	1	2	f	\N
433	6	6	有限游戏与无限游戏	我将生生不息的参与2个游戏，一个是增强智慧与知识。另一个增强体魄与精气神。\r\n再个就是强化沟通与交流，编织精彩网络。	\N	\N	17	\N	3	\N	5	1	2019-06-01 11:13:49.435828	2019-06-01 11:16:13.880282	2019-06-01	0	\N	\N	433	1	2	f	\N
437	6	7	复杂度-NP	https://www.zhihu.com/question/27039635\r\n通俗理解	\N	\N	17	\N	3	\N	5	0	2019-06-02 20:44:43.85898	2019-06-02 20:44:43.85898	2019-06-02	0	\N	\N	437	1	2	f	\N
240	6	7	软件工程总结	1，设计，代码都应该经过review，探讨。\r\n2，如果没有严密的逻辑验证，设计和开发离目标的距离都可能是一条鸿沟。\r\n3，问题在驱动着系统改进。任何系统都难以滴水不漏，关键在于确保在生命周期内，不会出现无法弥补的问题。\r\n	\N	\N	17	\N	3	\N	5	7	2019-01-21 19:26:49.059496	2019-04-28 07:41:53.631564	2019-01-21	0	\N	\N	240	1	2	f	\N
363	6	17	yy对于数据产品的理解	1，以人为中心\r\n2，数据的关系\r\n3，时序性\r\n4，视图（这是体现数据价值的部分，说视图是从人角度看关注的数据不一样）\r\n\r\n可以基于此思路看看现有产品。。。	\N	\N	17	\N	3	\N	5	0	2019-04-28 08:18:01.303417	2019-04-28 08:18:01.303417	2019-04-28	0	\N	\N	363	1	2	f	\N
355	6	17	beas一期模块分解讨论	1，Access Schema,定义表不同列之间的关系。\r\ntableid/columnid - tableid/columnid - N\r\n\r\nSchema第一阶段是导入的。但是最好能够统计出来用户常用查询涉及的column，并自动分析其存在的关系。\r\n\r\n2，constraint index\r\ntable_column_val - table_column_val - n (表示具体的某个实例对应的另一个实例存在的个数)\r\nconstraint index作用就是额外建立索引，从而实现bound query。\r\n\r\n注意：Schema中的N是比较固定的，可以说是上限。而constraint index中的n表示的是存在具体val映射关系的记录个数。\r\n3，第三方库导入的表在beas中使用pg_class还是其他表存需深入分析。\r\n4，FDW产品可以了解下，FDW在其自身上定义表，并适配访问不同的数据源。\r\n5，执行器还是有讲究的，后面可能是并行执行。	\N	\N	17	\N	3	\N	5	3	2019-04-25 16:54:07.379242	2019-04-28 13:54:11.932591	2019-04-25	0	\N	\N	355	1	2	f	\N
423	6	17	PG wal	https://paquier.xyz/postgresql-2/postgres-9-4-feature-highlight-replica-identity-logical-replication/	\N	\N	17	\N	3	\N	5	4	2019-05-23 13:41:29.862551	2019-07-29 15:28:14.356492	2019-05-23	0	\N	\N	423	1	2	f	\N
424	6	17	PG执行引擎听讲笔记	1，执行器拿到的一颗执行树。\r\n2，执行的中间过程被另外保存，与输入的执行计划是独立的。孩子节点作为父节点的输入。\r\n3，存在4类执行节点，每个节点都有开始，执行，结束等方法。	\N	\N	17	\N	3	\N	5	0	2019-05-23 19:59:31.622282	2019-05-23 19:59:31.622282	2019-05-23	0	\N	\N	424	1	2	f	\N
434	6	9	Keep 微酸，Keep 微压	他么还要专门去学英语，明显是学习压力不够么	\N	\N	17	\N	3	\N	5	0	2019-06-01 11:49:11.67486	2019-06-01 11:49:11.67486	2019-06-01	0	\N	\N	434	1	2	f	\N
427	6	17	关于列式存储	可以把每个字段看成一个数组，这样同一个下标的不同列数组就构成了一行。\r\n\r\n列式存储只是一种存储形态，但数据的关系仍然是基于行的。这是由数据本身决定的。	\N	\N	17	\N	3	\N	5	0	2019-05-26 13:57:15.708004	2019-05-26 13:57:15.708004	2019-05-26	0	\N	\N	427	1	2	f	\N
435	6	7	幂等特性的理解，与应用领域	https://www.jianshu.com/p/475589f5cd7b\r\n\r\n幂等性原本是数学上的概念，即使公式：f(x)=f(f(x)) 能够成立的数学性质。用在编程领域，则意为对同一个系统，使用同样的条件，一次请求和重复的多次请求对系统资源的影响是一致的。\r\n\r\n也即系统允许在出错时，不断重复执行，其结果与成功执行一次的效果一样。\r\n\r\n幂等性是分布式领域的一把利刃，每一个有志与分布式领域的程序员都应该熟悉它的设计思想。\r\n\r\nredo日志的重复执行就需要具备这种性质，这一特性在分布式系统中运用确实非常广泛。	\N	\N	17	\N	3	\N	5	0	2019-06-01 14:22:51.250492	2019-06-01 14:22:51.250492	2019-06-01	0	\N	\N	435	1	2	f	\N
436	6	7	乔姆斯基文法分类	乔姆斯基的文法分类。\r\n首先，应该非常清楚乔姆斯基对于四种文法分类的定义，并能理解其含义。\r\n几种文法中，最基本的是0型文法，读者可以将它理解为其它所有文法的基础，它是可以表示任何语言的文法。\r\n后面的1，2,3三种文法，是分别对于0型文法产生式的两边作了不同的限制之后，形成了新的文法。\r\n比如：规定0型文法的每个产生式中，其左边字符集长度小于右边字符集长度并且同时规定开始符号只可出现于产生式的左边，不能出现在任何产生式的右边，这样，就成为了1型文法(即上下文有关文法)。\r\n其它与此类似，在1型文法的基础上，进一步规定该文法的任意产生式，其左部只允许有一个字符且必须为非终结符，这样就构成了上下文无关文法；\r\n再在上下文无关文法的基础上进行限制：规定除了左部有且只有一个非终结符外，还特别规定右部最多只允许有两个字符，当为两上字符时必须一个为非终结符，另一个为终结符，\r\n而当只有一个字符时，必须为终结符，这样的文法就成了正规文法。\r\n这样一层套一层的限制，就形成了从0型到3型文法的定义体制，每一层都是在前一层基础上进行定义的，所以说前一层一定比该层表示的范围要广，因为其受的限制要少。 \r\n那么，我们在判断一个文法时应该以什么规则来判断呢？这个规则当然是：3->2->1->0.也就是说，我们判断是从高到低来判断的，\r\n比如：一旦判断其属于正规文法之后就没必要再判断其是否属于上下文无关的了(因为它必定属于上下文无关，我们应该以最高规则来判定其属于的文法类型)，其它情况与此类推。\r\n只有当我们判断不属于3型文法时，我们才向下判断，其是不是属于2型的，若不属于2型的，则依此类推再向下判断。最终的结果如果不属于3，2和1三种类型，那就只有属于0型了。	\N	\N	17	\N	3	\N	5	1	2019-06-02 19:59:34.732251	2019-06-02 20:00:31.602804	2019-06-02	0	\N	\N	436	1	2	f	\N
425	6	17	复制技术简介	1，物理复制\r\n有的数据库也叫流式复制。是基于二进制数据的数据复制，这里的二进制数据通常是redo log。	\N	\N	17	\N	3	\N	5	7	2019-05-25 12:38:54.196816	2019-05-27 20:58:14.971219	2019-05-25	0	\N	\N	425	1	2	f	\N
432	6	17	内存数据库调研	关系型内存数据库：\r\nhttp://www.dbgeek.org/Jishu/bloginfo/id/119\r\n\r\n	\N	\N	17	\N	3	\N	5	0	2019-05-29 15:02:16.348828	2019-05-29 15:02:16.348828	2019-05-29	0	\N	\N	432	1	2	f	\N
107	6	6	思维方法	1，围棋思考法 (普遍联系)\r\n2，问题思考法 (发展)\r\n3，本质思考法 （矛盾)\r\n4，原则思考法\r\n      4.1 中庸之道\r\n      4.2 佛家四法印\r\n      4.3 环境选择\r\n5，机器模型思考法\r\n6，换位逆向思考法\r\n7.   金字塔思维组织法\r\n8，科学思维\r\n     不仅是科学的对待，还能科学的研究与推论，还有自我的思辨思维，能够自己得出结论，这非常重要。否则智商税交不完。\r\n9，持续发展法\r\n     一个系统从最初不断累加完善的思维。持续学习，原则的完善都是这种思路。不断积累量变。	\N	\N	17	\N	3	\N	5	4	2018-10-07 22:00:53.351316	2019-06-01 02:54:58.274829	2018-10-07	0	\N	\N	107	1	2	f	\N
439	6	17	PG的mvcc机制	MVCC的解决的问题是事务的隔离性。PG这块搞起来很复杂，一方面是因为事务本身复杂，pg的实现复杂。二是结合事务的各种状态，多版本的管理以及可见性判断复杂。\r\n隔离一种实现方式是加锁，但性能上没法接受。另一种方式就是MVCC。undo也是其中一种实现方案。	\N	\N	17	\N	3	\N	5	8	2019-06-06 08:46:55.07251	2019-07-25 14:45:02.342139	2019-07-25	0	\N	\N	439	1	4	f	\N
346	6	7	数理逻辑的起源	　逻辑（logic）一词源于希腊文logoc，有“思维”和“表达思考的言辞”之意。数理逻辑是用数学的方法来研究推理规律的科学，它采用符号的方法来描述和处理思维形式、思维过程和思维规律，进一步的说，数理逻辑就是研究推理中前提和结论之间的形式关系，这种形式关系是由作为前提和结论的命题的逻辑形式决定的，因此，数理逻辑又称为形式逻辑或符号逻辑。\r\n　　最早提出用数学方法来描述和处理逻辑问题的是德国数学家莱布尼茨（G.W.Leibnitz），但直到1847年英国数学家乔治·布尔（George Boole）发表“逻辑的数学分析”后才有所发展。1879年德国数学家弗雷格（G.Frege）在《表意符号》一书中建立了第一个比较严格的逻辑演算系统，英国逻辑学家怀特海（A.N.Witehead）和罗素（B.Russell）合著的《数学原理》一书，对当时数理逻辑的成果进行了总结，使得数理逻辑形成了专门的学科。 \r\n　　1938年，克劳德•艾尔伍德•香农（Claude Elwood Shannon）发表了著名论文《继电器和开关电路的符号分析》，首次用布尔代数对开关电路进行了相关的分析，并证明了可以通过继电器电路来实现布尔代数的逻辑运算，同时明确地给出了实现加，减，乘，除等运算的电子电路的设计方法。这篇论文成为开关电路理论的开端。其后，数理逻辑开始应用于所有开关线路的理论中，并在计算机科学等方面获得应用，成为计算机科学的基础理论之一。 	\N	\N	17	\N	3	\N	5	2	2019-04-24 06:45:39.033312	2019-05-06 20:22:52.50841	2019-04-24	0	\N	\N	346	1	2	f	\N
400	6	15	羽毛球丢球的情况	羽毛球丢球的情况：\r\n1，失误\r\n1.1 发力的方向与大小出现偏差\r\n1.2 场地的环境引起的偏差\r\n2，速度跟不上\r\n2.1 脚步跟不上\r\n2.1.1 启动步没有双脚做好准备\r\n2.1.2 中间步力量不够，速度跟不上\r\n2.1.3 终止步冗余，回步慢\r\n2.1.4 采用了错误的步伐\r\n\r\n2.2 手上跟不上\r\n2.1.1 挥拍动作过大导致收拍速度收到影响\r\n2.1.2 启动式没做到位\r\n2.1.3 使用了错误发力部位，导致速度跟不上，通常越大部位速度越慢	\N	\N	17	\N	3	\N	5	2	2019-05-14 18:10:15.50777	2019-06-13 16:30:30.094686	2019-05-14	0	\N	\N	400	1	2	f	\N
379	8	7	从数理逻辑到计算机的发明	计算理论导引	\N	\N	17	\N	3	\N	5	0	2019-05-06 20:54:00.038524	2019-05-06 20:54:00.038524	\N	0	\N	\N	379	1	2	f	\N
380	7	17	考虑beas内的共享内存管理		\N	\N	19	\N	3	\N	1	0	2019-05-07 14:54:16.80013	2019-05-07 14:54:16.80013	2019-05-07	0	\N	373	373	2	3	f	\N
406	6	17	Mysql 5.7编译安装	Mysql编译：\r\n1，下载源代码\r\nhttps://github.com/mysql/mysql-server/tree/5.7\r\n2，下载boost 1.59\r\nhttps://www.boost.org/users/history/version_1_59_0.html\r\n\r\n3，安装ncurses\r\nyum install ncurses-devel\r\n\r\n4，mkdir build;cd build; cmake ../ -DWITH_BOOST=/root/boost_1_59_0/\r\n\r\n5，mysqld --initialize 初始化（5.7以后）\r\n\r\n6，在/var/log/mysql/error.log日志里面可以看到随机生成的root密码\r\n\r\n7，登录：mysql -uroot -p'GCIq<iXoo82j'\r\n\r\n8，修改用户\r\nhttps://blog.51cto.com/arthur376/1840353	\N	\N	17	\N	3	\N	5	5	2019-05-21 13:22:17.035384	2019-07-11 07:27:58.862359	2019-05-21	0	\N	\N	406	1	2	f	\N
381	7	17	考虑独立出安全函数	将安全函数独立头文件	\N	\N	19	\N	3	\N	1	0	2019-05-07 14:55:08.244603	2019-05-07 14:55:08.244603	2019-05-07	0	\N	373	373	4	5	f	\N
386	8	17	beas的理解	Schema使用例子：\r\n存在一张学生日志记录表，其中日志中有日期，天气，作者，事件等信息。\r\n另外还有一张表记录了某个学生请假的情况，有学生，请假，日期。\r\n\r\n现在想分析学生请假与下雨的关系。\r\n这样可使用schema：日期->天气\r\n学生日志记录表可抽取 日期|天气的子表。其记录数量远小于学生日志记录表。\r\n\r\n由此说来存在子表通常更可能出现在表设计没有充分分解的情况。如果将日志记录表拆开。\r\n日期，作者，事件\r\n日期，天气\r\n这样就不存在问题。	\N	\N	17	\N	3	\N	5	5	2019-05-11 03:48:54.375613	2019-05-29 15:09:28.982426	\N	0	\N	\N	386	1	2	f	\N
383	8	17	索引是如何更新的，索引如何记录多个tid/rowid		\N	\N	17	\N	3	\N	5	0	2019-05-09 13:34:34.675413	2019-05-09 13:34:34.675413	\N	0	\N	\N	383	1	2	f	\N
387	6	7	计算机理论导引阅读笔记	1，数学领域经常把复杂问题，通过图表等方式描述以方便理解。	\N	\N	17	\N	3	\N	5	1	2019-05-12 19:32:34.339605	2019-05-12 20:00:07.221927	2019-05-12	0	\N	\N	387	1	2	f	\N
373	7	17	考虑beas common，内存管理与字符串操作封装		\N	\N	19	\N	3	\N	5	12	2019-04-29 14:06:04.04455	2019-05-13 06:53:42.15463	2019-05-07	0	\N	\N	373	1	6	f	\N
371	6	7	集合论-为什么说是数学的基础	其实这个说法是有争议的，集合论也有不能涵盖的范围。\r\n所以说数学是发明而不是发现，发明是存在缺陷的。\r\n\r\n集合作为数学基础，是因为集合可以准确定义目前用到数学的很多概念。比如函数	\N	\N	17	\N	3	\N	5	1	2019-04-28 18:23:01.518927	2019-05-14 18:35:30.852072	2019-04-28	0	\N	\N	371	1	2	f	\N
384	8	7	大数据分析的脉络，经典产品所处的位置		\N	\N	17	\N	3	\N	5	5	2019-05-09 13:36:42.543367	2019-05-11 03:45:28.587909	\N	0	\N	\N	384	1	2	f	\N
382	8	23	如何做代码封装	1，接口优于类？\r\n  接口不含数据\r\n2，不同接口优于传参接口？ \r\n	\N	\N	17	\N	3	\N	5	2	2019-05-09 04:00:54.613079	2019-05-13 06:56:13.285765	\N	0	\N	\N	382	1	2	f	\N
389	6	23	软件分工就像并行算法，最大最好的并行化		\N	\N	17	\N	3	\N	5	0	2019-05-13 06:57:25.694986	2019-05-13 06:57:25.694986	2019-05-13	0	\N	\N	389	1	2	f	\N
403	6	7	数据管理系统的方方面面	IO模型\r\n内存数据组织\r\n{\r\n   数据变更的通知\r\n   淘汰机制\r\n   数据加载，数据加载需要锁保护，数据访问也需要锁保护。\r\n}\r\n磁盘数据组织\r\n数据的编解码\r\n事务机制\r\n{\r\n  并发控制\r\n  {\r\n    锁在内存的实现\r\n    锁的层次\r\n\t锁的类型\r\n  }\r\n  一致性保证\r\n  {\r\n    redo机制：提交则数据必然成功修改\r\n  }\r\n  隔离级别\r\n}\r\n数据保护\r\n{\r\n    多版本\r\n    快照\r\n    备份\r\n    容灾\r\n    防篡改\r\n}\r\n副本数据同步\r\n数据分布\r\nGC	\N	\N	17	\N	3	\N	5	1	2019-05-17 15:44:55.872049	2019-05-17 16:10:31.528605	2019-05-17	0	\N	\N	403	1	2	f	\N
322	6	15	羽毛球反手发力	技术关键点：\r\n1，转体屈膝\r\n2，收肩申肘\r\n3，外旋握紧\r\n\r\n其实正手发力也是如此，道理一模一样。\r\n\r\n最重要的是击球点，必须在右侧或头顶上方。\r\n击球点的把握是最难的。\r\n\r\n开始练习可以把1,2步的力用好、反手纯靠手臂比较难。	\N	\N	17	\N	3	\N	5	1	2019-03-25 23:24:05.0432	2019-05-18 20:32:49.765175	2019-03-25	0	\N	\N	322	1	2	f	\N
438	6	17	PG索引技术	4，摸清楚索引实现套路，以及可能存在的问题。\r\ngist索引是基于(p,ptr)的模型的，ptr为指向heap tuple的指针。\r\nac索引在插入/删除时，可能需转换为count上的操作。且需管理IKs存放形式。\r\n另外需利用index填充数据，根据fetch的是x | y | count | IKs。\r\nhash索引无法支持联合索引，基本可以排除。\r\n\r\n5，ac的索引实现需skip pg_index.这块的影响。\r\n6，索引是如何使能的？\r\n7，btree联合索引的存储结构\r\n8，分析cover index，include column是如何带入的。以及如何独立于索引更新。\r\n   create a covered index。\r\n   insert into t2 values(1,1) on CONFLICT(id) do update set count=excluded.count+1;\r\n9，GiST with dummy tuple	\N	\N	17	\N	3	\N	5	11	2019-06-04 12:20:38.245877	2019-08-02 08:56:44.764567	2019-07-31	0	\N	\N	438	1	4	f	\N
450	6	17	PG ctid	/* A word about t_ctid: whenever a new tuple is stored on disk, its t_ctid\r\n * is initialized with its own TID (location).  If the tuple is ever updated,\r\n * its t_ctid is changed to point to the replacement version of the tuple.\r\n//如果让ctid指向索引，这个or就不成立了\r\n * Thus, a tuple is the latest version of its row iff XMAX is invalid or\r\n * t_ctid points to itself (in which case, if XMAX is valid, the tuple is\r\n * either locked or deleted).  \r\n * One can follow the chain of t_ctid links\r\n * to find the newest version of the row.  Beware however that VACUUM might\r\n * erase the pointed-to (newer) tuple before erasing the pointing (older)\r\n * tuple.  \r\n//follow应该终止如果ctid不指向同一个block\r\nHence, when following a t_ctid link,\r\n\r\n it is necessary to check\r\n * to see if the referenced slot is empty or contains an unrelated tuple.\r\n * Check that the referenced tuple has XMIN equal to the referencing tuple's\r\n * XMAX to verify that it is actually the descendant version and not an\r\n * unrelated tuple stored into a slot recently freed by VACUUM.  If either\r\n * check fails, one may assume that there is no live descendant version.\r\n *\r\n * t_ctid is sometimes used to store a speculative insertion token, instead\r\n * of a real TID.  A speculative token is set on a tuple that's being\r\n * inserted, until the inserter is sure that it wants to go ahead with the\r\n * insertion.  Hence a token should only be seen on a tuple with an XMAX\r\n * that's still in-progress, or invalid/aborted.  The token is replaced with\r\n * the tuple's real TID when the insertion is confirmed.  One should never\r\n * see a speculative insertion token while following a chain of t_ctid links,\r\n * because they are not used on updates, only insertions.\r\n//speculative insertion token仍然可以保留，只是在确定插入的时候，其指向索引信息。\r\n\r\n这仅对于ac而言，ac的数据扫描由自己完成。	\N	\N	17	\N	3	\N	5	1	2019-06-20 12:03:05.232454	2019-06-20 13:25:05.903814	2019-06-20	0	\N	\N	450	1	2	f	\N
451	6	17	PG CI-IOT	IOT使用场景：1，查询基本使用key。 2，除了index key之外表比较短小。 3，尽量少的second index。\r\n从BEAS理论来说这两点都是满足的。\r\n\r\npostgresql不支持IOT可能有两方面原因：\r\n1，通常IOT实现在index上增加可见信息，这与pg目前框架区别太大，代价非常高。\r\n2，IOT适用场景比较有限。\r\n\r\npostgresql clusterd index：\r\nhttps://www.postgresql.org/docs/10/sql-cluster.html\r\n这代价有点大，而且需使用命令触发。\r\n\r\n\r\n如果将index最底层的page换成heap会怎样？\r\n或者说index不变，只是其指向的不再是tuple，而是page。逻辑上会发生什么变化。\r\n\r\n或者说成稀疏index，whatever？ 这样heap里面的tuple格式就与目标一致了，且insert不必总是更新两个页面。\r\n而版本清理后续还能通过undo机制优化。\r\n\r\nIOT的玩法对于scan也是一样，总是index scan。或者说这并非传统意义上的indexscan，这就是ac scan。\r\n如果能用索引，就直接定位到具体的heap page，如果不能，就从最左边的heap page开始。\r\n\r\nheap page仅支持单向扫描，干掉左边的指针。也可不支持指向parent，使得btree代码可以完全重用。\r\n\r\n优点：\r\n1，通常只需更新heap，可加快更新速度。\r\n2，砍掉了index头部，节省部分空间\r\n3，查询时不必额外拼装tuple。写入时也不必拆分。\r\n	\N	\N	17	\N	3	\N	5	9	2019-06-22 09:05:58.556767	2019-06-26 08:13:34.847236	2019-06-22	0	\N	\N	451	1	2	f	\N
455	6	17	PG CI_v2	索引记录的存储结构为\r\nX|Y|Z\r\nZ = heap header | count | pkid, Z是定长结构。\r\n\r\n该方案只需在中间层做些手脚就可以了，不改btree，也不改heap。\r\n\r\n记录格式调整为:\r\nIndexTupleData + [ | IndexAttributeBitMapData] + [ | HeapHeaderData] + fields\r\n\r\n使用ItemPointerData的offset最高位表示是否为AC，对于该offset的使用一定要小心。\r\n这样可直接返回heapTuple。 HeapHeaderData中null部分是变长的。\r\n\r\n\r\n	\N	\N	17	\N	3	\N	5	9	2019-06-26 12:01:24.429652	2019-06-28 14:33:46.96595	2019-06-26	0	\N	\N	455	1	2	f	\N
444	6	17	PG heap/storage	1，一个文件多大，如何切换文件\r\n这个实现在md中，_mdfd_segpath。pg对于relfilenode抽象：\r\ntypedef struct buftag\r\n{\r\n    RelFileNode rnode;            /* physical relation identifier */\r\n    ForkNumber    forkNum;\r\n    BlockNumber blockNum;        /* blknum relative to begin of reln */\r\n} BufferTag;\r\n\r\nforkNum：\r\n/*\r\n * The physical storage of a relation consists of one or more forks. The\r\n * main fork is always created, but in addition to that there can be\r\n * additional forks for storing various metadata. ForkNumber is used when\r\n * we need to refer to a specific fork in a relation.\r\n */\r\n因此我们可以定义自己的forkNum实现特殊的存储目的。\r\n\r\n对pg而言页的逻辑number是不断增加的，但是一个文件的大小受限于RELSEG_SIZE。默认是128k，这样一个segment不会超过1GB。	\N	\N	17	\N	3	\N	5	8	2019-06-11 12:51:12.651853	2019-07-05 15:05:35.314571	2019-06-11	0	\N	\N	444	1	2	f	\N
402	6	23	C-内存安全函数封装	C11标准定义的函数是有点奇怪的，其不仅做了防溢出处理，整个函数形式都发生了变化。	\N	\N	17	\N	3	\N	5	5	2019-05-15 12:38:40.543818	2019-05-16 09:37:25.452196	2019-05-15	0	\N	\N	402	1	2	f	\N
398	6	23	C语言-extern	extern的语义是：声明变量或函数在其他地方定义了，避免编译器在编译期间找不到其定义导致编译出错。\r\n\r\n注意：显然这个关键字是不会改变变量/函数的作用域的。	\N	\N	17	\N	3	\N	5	1	2019-05-14 15:01:16.66401	2019-05-14 15:15:19.847724	2019-05-14	0	\N	\N	398	1	2	f	\N
397	6	23	C语言-内联与宏定义	C++ 语言的函数内联机制既具备宏代码的效率，又增加了安全性，而且可以自由操作类的数据成员。所以在C++ 程序中，应该用内联函数取代所有宏代码.\r\n\r\n内联是以代码膨胀（复制）为代价，仅仅省去了函数调用的开销，从而提高函数的执行效率。如果执行函数体内代码的时间，相比于函数调用的开销较大，那么效率 的收获会很少。另一方面，每一处内联函数的调用都要复制代码，将使程序的总代码量增大，消耗更多的内存空间。以下情况不宜使用内联： \r\n（1）如果函数体内的代码比较长，使用内联将导致内存消耗代价较高。 \r\n（2）如果函数体内出现循环，那么执行函数体内代码的时间要比函数调用的开销大。 \r\n类的构造函数和析构函数容易让人误解成使用内联更有效。要当心构造函数和析构函数可能会隐藏一些行为，如“偷偷地”执行了基类或成员对象的构造函数和析构函数。所以不要随便地将构造函数和析构函数的定义体放在类声明中。 \r\n　　一个好的编译器将会根据函数的定义体，自动地取消不值得的内联（这进一步说明了inline不应该出现在函数的声明中）。\r\n\r\nhttps://www.cnblogs.com/luntai/p/6251727.html\r\n\r\n使用，但不可滥用。	\N	\N	17	\N	3	\N	5	2	2019-05-14 14:52:40.105597	2019-05-14 18:26:38.352974	2019-05-14	0	\N	\N	397	1	2	f	\N
401	6	9	品格言集	1，散漫只会让人变得骄横，不会真正让人变强。相反每天的自律与更新可以让人变强。\r\n	\N	\N	17	\N	3	\N	5	0	2019-05-15 06:46:24.850985	2019-05-15 06:46:24.850985	2019-05-15	0	\N	\N	401	1	2	f	\N
404	6	17	beas constraint index的管理	1，数理清楚IO模型，使用场景，数据关系特征。\r\n2，初步方案，并结合现有实现细化场景。	\N	\N	17	\N	3	\N	5	18	2019-05-20 06:48:49.155098	2019-06-20 08:35:08.616856	2019-05-20	0	\N	\N	404	1	2	f	\N
453	6	18	大存储-世界普遍存在的问题	人的生活，生产活动中无处不在。存储可以代表实体资源或虚拟资源。围绕资源的关系，维护，访问。\r\n存储，计算，网络构成了整个互联网世界。	\N	\N	17	\N	3	\N	5	0	2019-06-25 06:39:50.260716	2019-06-25 06:39:50.260716	2019-06-25	0	\N	\N	453	1	2	f	\N
449	6	17	PG Scan执行	了解heapscan，bitmapscan，indexscan等各种实现细节。\r\n更加清晰ciscan的地位。	\N	\N	17	\N	3	\N	5	4	2019-06-18 14:37:56.253948	2019-06-22 13:37:31.31779	2019-06-18	0	\N	\N	449	1	2	f	\N
405	6	17	聚簇索引	聚簇索引，其数据根据索引顺序组织，因而其btree的中间节点可指向页面，叶子节点就是实际数据。\r\n非聚簇索引，叶子节点存的是tid。\r\n\r\n\r\n<pre><code class="text">\r\n1、大多数表都应该有聚簇索引或使用分区来降低对表尾页的竞争，在一个高事务的环境中，对最后一页的封锁严重影响系统的吞吐量。\r\n\r\n2、在聚簇索引下，数据在物理上按顺序排在数据页上，重复值也排在一起，\r\n因而在那些包含范围检查(between、<、<=、>、>=)或使用group by或orderby的查询时，\r\n一旦找到具有范围中第一个键值的行，具有后续索引值的行保证物理上毗连在一起而不必进一步搜索，\r\n避免了大范围扫描，可以大大提高查询速度。\r\n\r\n3、在一个频繁发生插入操作的表上建立聚簇索引时，不要建在具有单调上升值的列(如IDENTITY)上，否则会经常引起封锁冲突。\r\n\r\n4、在聚簇索引中不要包含经常修改的列，因为码值修改后，数据行必须移动到新的位置。\r\n\r\n5、选择聚簇索引应基于where子句和连接操作的类型。\r\n</code></pre>\r\n	\N	\N	17	\N	3	\N	5	1	2019-05-20 08:19:55.405042	2019-05-20 08:20:30.817725	2019-05-20	0	\N	\N	405	1	2	f	\N
452	6	17	PG page/buffer	buffer上有4种锁：\r\npin\r\nread lock\r\nwrite lock\r\nsuper-exclusive lock\r\n\r\npin与最后一个冲突。	\N	\N	17	\N	3	\N	5	0	2019-06-23 21:24:14.928543	2019-06-23 21:24:14.928543	2019-06-23	0	\N	\N	452	1	2	f	\N
454	6	17	PG CI	CI is constraint index，我们希望将其作为小规模的数据源来使用。即它是一个可以作为数据源的index。\r\n\r\n这样可以基于普通表来创建AC，也可以基于远程表来创建AC。\r\n\r\n测试方式，创建一个本地表，创建ac。然后在原表中写入数据。\r\nac通过索引方式，引发数据写入，但是ac在最底层会将index tuple转为普通的tuple。	\N	\N	17	\N	3	\N	5	2	2019-06-26 08:18:32.67748	2019-06-26 09:11:32.41991	2019-06-26	0	\N	\N	454	1	2	f	\N
440	6	17	PG术语	TID：tuple id\r\nXID：事务id\r\nLSN：log sequence number，记录在page上，用于确保wal机制.	\N	\N	17	\N	3	\N	5	2	2019-06-06 09:19:24.564355	2019-06-28 07:51:30.034199	2019-06-06	0	\N	\N	440	1	2	f	\N
464	6	7	Succinct Data Structure	https://chuansongme.com/n/2035229\r\nhttp://xszhao.science/blog/Review-SuRF-Practical-Range-Query-Filtering-with-Fast-Succinct-Tries/	\N	\N	17	\N	3	\N	5	0	2019-07-11 21:24:02.697835	2019-07-11 21:24:02.697835	2019-07-11	0	\N	\N	464	1	2	f	\N
468	6	17	PG CI_v2 vacuum&analyze	index老版本膨胀问题。火车头 xmax | tid | count | tid | count. 尾巴，尾巴的page可考虑单独管理.\r\npage和tuple的组织结构发生变化。可能需利用btrree\r\n\r\nvacuum效率问题。vm标记也是必须的，要么就在page上标记，这样仍然需加载page。\r\nci全量同步事务id消耗。全量导入期间不启动事务。而不是每个全量包启动一个事务来执行。	\N	\N	17	\N	3	\N	5	6	2019-07-17 07:29:08.476547	2019-07-19 07:50:34.207239	2019-07-17	0	\N	\N	468	1	2	f	\N
465	6	17	PG 索引 pin问题	buffer manager的README：\r\n5. To physically remove a tuple or compact free space on a page, one\r\nmust hold a pin and an exclusive lock, *and* observe while holding the\r\nexclusive lock that the buffer's shared reference count is one (ie,\r\nno other backend holds a pin).  If these conditions are met then no other\r\nbackend can perform a page scan until the exclusive lock is dropped, and\r\nno other backend can be holding a reference to an existing tuple that it\r\nmight expect to examine again.  Note that another backend might pin the\r\nbuffer (increment the refcount) while one is performing the cleanup, but\r\nit won't be able to actually examine the page until it acquires shared\r\nor exclusive content lock.\r\n\r\n那么什么情况下需要pin呢？\r\n<pre><code class="text">\r\nThis is not necessary for correctness in terms of the btree index\r\noperations themselves; as explained above, index scans logically stop\r\n"between" pages and so can't lose their place.  The reason we do it is to\r\nprovide an interlock(互锁) between non-full VACUUM and indexscans.  Since VACUUM\r\ndeletes index entries before reclaiming heap tuple line pointers, the\r\nsuper-exclusive lock guarantees that VACUUM can't reclaim for re-use a\r\nline pointer that an indexscanning process might be about to visit.  This\r\nguarantee works only for simple indexscans that visit the heap in sync\r\nwith the index scan, not for bitmap scans.  We only need the guarantee\r\nwhen using non-MVCC snapshot rules; when using an MVCC snapshot, it\r\ndoesn't matter if the heap tuple is replaced with an unrelated tuple at\r\nthe same TID, because the new tuple won't be visible to our scan anyway.\r\nTherefore, a scan using an MVCC snapshot which has no other confounding\r\nfactors will not hold the pin after the page contents are read.  The\r\ncurrent reasons for exceptions, where a pin is still needed, are if the\r\nindex is not WAL-logged or if the scan is an index-only scan.  If later\r\nwork allows the pin to be dropped for all cases we will be able to\r\nsimplify the vacuum code, since the concept of a super-exclusive lock\r\nfor btree indexes will no longer be needed.\r\n</code></pre>\r\n\r\n这段说明了这种情况。非MVCC好理解，因为他们要看到所有tuple，如果scan page之后访问时，被vacuum修改，\r\n即TID变更，可能出现异常行为。\r\n\r\n那index only scan呢？\r\n按readme中的意思，super-exclusive lock和pin的并发可以确保index对应的heap tid不\r\n被回收。否则可能出现vacuum清理了vm可见，且回收了TID，index only scan还能看到对应的\r\ntuple，这样逻辑上就出问题了。\r\n假设index only scan释放pin之后，vacuum拿到page lock，并且进行清理。然后index only scan拿到scan中缓存的tuple。\r\n以及被vacuum修改的vm visible信息。那index only scan可能看到本来被删除的记录。在index scan的时候这样没问题，可以通过检查判断\r\nTID对应的tuple发生了变化。\r\n	\N	\N	17	\N	3	\N	5	1	2019-07-13 18:36:17.669962	2019-07-31 14:02:49.712596	2019-07-13	0	\N	\N	465	1	2	f	\N
445	6	8	关于幸福与烦恼	1，幸福并非来自目标的达成\r\n2，真正的幸福是现在幸福将来也幸福\r\n3，幸福是对快乐的感知能力，快乐是一种心流体验。\r\n   说得更低点快乐就是需求被满足的感觉。但被满足的幸福这个就是一副毒药。\r\n   就像及时行乐的幸福，这种幸福非常短暂。\r\n\r\n   小孩子的快乐既有被满足的快乐，也有发现与探索的快乐。小孩子因身体限制其一般不会过度，因而其快乐是非常合适的。\r\n\r\n4，结合无限游戏和心流，我们知道快乐真正其实来源于能够产生美好感受的游戏，且这种美好是自己参与其中的。\r\n成就感\r\n身体需要\r\n成长\r\n快乐的事情可能都满足这些标准。\r\n\r\n5，烦恼来自于对过去的不甘和对未来的不安，习得性无阻是活力的屏障。一个没有活力的人通常也是习得性无助的人。\r\n6，不仅要安排好我们的时间，还有我们的体能，以及我们的脑力。使得我们能有节律的生活。就像打球一样，刚开始可能练动作很奇怪，然而没有人天生就会生活。\r\n7，更深的烦恼来自于矛盾，即你想达成的目标，与当下无法去达成的矛盾。这种矛盾简单把现代人逼疯了。不过这个问题在任何时代可能都非常严重，只是现代\r\n诱惑更多，人更容易采用临时性满足的方式去代替，因而人与人的差距也变得更大。\r\n8，如果因人或事而烦恼，且没有阻碍我们去处理的矛盾。那么这本身就不会那么痛苦，反而在处理过程中能够得到快乐。\r\n显然人不是因为生活在记忆或憧憬中而快乐，尽管这种方式看上去很常见，没有多少人能活在当下，体验真实的快乐。	\N	\N	17	\N	3	\N	5	0	2019-06-16 12:52:28.831491	2019-06-16 12:52:28.831491	2019-06-16	0	\N	\N	445	1	2	f	\N
448	6	7	linux时间-唯一id	硬件时间与系统时间\r\nhttps://linux.die.net/man/8/hwclock\r\nhttps://linux.die.net/man/2/clock_gettime\r\n\r\n想在应用程序中使用单调时间，需使用硬件时间。	\N	\N	17	\N	3	\N	5	0	2019-06-18 14:29:34.91606	2019-06-18 14:29:34.91606	2019-06-18	0	\N	\N	448	1	2	f	\N
457	6	17	PG之HeapTupleHeader	了解HeapTupleHeader中每个字段的含义，以及存在的原因	\N	\N	17	\N	3	\N	5	0	2019-07-06 12:07:43.904879	2019-07-06 12:07:43.904879	2019-07-06	0	\N	\N	457	1	2	f	\N
459	6	17	PG 锁	二阶段加锁：\r\nhttps://yq.aliyun.com/articles/626848\r\n\r\n锁都是针对资源的。资源可以是任何事物。\r\n锁可以分不同的模式，这是由资源的熟悉决定的。\r\n锁有明确的时间属性。所以分别有不同的实现方式。\r\n\r\n如果不是拿完立即释放就存在死锁的情况。数据库表锁和行锁就是这种。	\N	\N	17	\N	3	\N	5	2	2019-07-07 19:05:47.626652	2019-07-07 19:33:01.93067	2019-07-07	0	\N	\N	459	1	2	f	\N
460	6	9	看自己，看当下	如果你球没打好，你会分析自己今天哪里出了问题。\r\n是身体不适，还是某个技术点没掌握好等。\r\n\r\n工作也是如此，当下的现实情况是什么？找到根因，从而突破自己。\r\n如果你不希望自己有某个行为，也要挖清楚内在根因是什么。\r\n\r\n生活就如科学一样，想突破成高手。就需要去研究每个细节，不断的去实践总结。\r\n\r\n	\N	\N	17	\N	3	\N	5	1	2019-07-07 21:44:13.60313	2019-07-13 19:10:36.763912	2019-07-07	0	\N	\N	460	1	2	f	\N
446	6	17	PG测试方法	PGTap看上去很鸡肋，pg测试基本是基于sql的。\r\n\r\n第一阶段，先挂载到一个表上。\r\n表定义包含2列，一是x，另一个是y。在此基础上附上一列count。\r\n并拦截其操作。	\N	\N	17	\N	3	\N	5	1	2019-06-17 13:34:14.144403	2019-08-05 08:53:00.765307	2019-06-17	0	\N	\N	446	1	2	f	\N
456	6	9	唯实力论	你可以不计较一时的输赢，但你得有实力。\r\n就像羽毛球技术一样，真正的实力就是碾压式的。互有输赢的时候才有资格说不计较输赢，否则就有点自不量力了。\r\n\r\n就像羽毛球运动一样，很多事情都有衡量实力的尺度。这些尺度显然不近人情，但是客观的，这是游戏有趣的地方，否则就无法衡量实力了。\r\n比如个人经济能力，就看利润和收益比。羽毛球比赛就看输赢，比分。\r\n教育就看综合素养，各方面的评分。\r\n\r\n有尺度并非说是最终目标，这些都是无限游戏，尺度是让我们知道在这游戏中自己水平如何。\r\n\r\n劈开实力去高谈阔论就容易言过其实。\r\n\r\n实力就是知行合一后的尺度，在这真实的世界中如何轻快的飞驰，保持实力是每个直面生活的人都需不断思考的。	\N	\N	17	\N	3	\N	5	1	2019-07-03 22:01:25.620429	2019-07-13 19:01:38.522886	2019-07-03	0	\N	\N	456	1	2	f	\N
390	6	9	达利欧-原则-成功方法论	我们都知道一个缺乏原动力的人是多么的无趣，做事情没有认真严谨态度，对结果无所谓。我们在自己热爱的事情上难以容忍这样的搭档存在。\r\n我们可以有很多美好的目标，并且知道这些目标可以达到。有了激动人心的目标，我们就可以发挥自己的智慧提升自己的效率，自动思考相关问题，我们可以行动起来，不断逼近。\r\n我们不因别人的好恶影响自己的选择，我们选择是因为我们的目标如此，我们不愿错过美好。\r\n我们不去假设自己成为那个最优秀的人，也许天生环境我们无法达到。但我们可以在自己热爱的方向上不断前进，这就足够美好了。\r\n\r\n成功方法论\r\n激励自己的目标 + 逻辑机器构建项目 + 彻底解决项目运转的各个细节问题(一个领域常见疑难问题可能就上千规模)。\r\n\r\n成熟检验方法：\r\n一个人只有当自己完全自由时，直面压力，掌控自己达成目标。才算真正成长起来，成为那个可以在前面遮风挡雨，独当一面的人。\r\n\r\n病痛分析：\r\n每个人因成长环境，原生家庭，可能形成恐惧，麻木，软弱不自信，无力，懒散，安全感缺失，依赖，放纵等等毛病。\r\n焦虑是因为有风险，有风险是因为能力不够或预期不实际。\r\n不去制定目标通常是因为缺乏自信，或者没有痛感，对自己的成长对世界的探索丧失了兴趣。	\N	\N	17	\N	3	\N	5	5	2019-05-13 07:57:54.06441	2019-07-07 21:46:03.014214	2019-05-13	0	\N	\N	390	1	2	f	\N
462	6	17	PG hot standby	官方文档：\r\nhttps://www.postgresql.org/docs/9.0/hot-standby.html\r\n\r\n有个很大的问题是冲突，官方文档中有详细描述。\r\n在master上删除一个tuple 可能是surely dead的，但是在hot standby中可能有事务能看到。这种conflict很常见。	\N	\N	17	\N	3	\N	5	0	2019-07-08 12:59:03.716197	2019-07-08 12:59:03.716197	2019-07-08	0	\N	\N	462	1	2	f	\N
463	6	17	Terark 技术分析	ac中大量重复的x和y是可以做压缩的。这样可以在很大程度上减小数据存储规模，同时保证其查找特性。\r\n最小化编码的可查找树，这样将数据轻松放在SSD或内存中，爽爆	\N	\N	17	\N	3	\N	5	1	2019-07-10 07:49:35.670193	2019-07-10 07:52:18.89985	2019-07-10	0	\N	\N	463	1	2	f	\N
469	8	17	PG 进程被立即终止时，如何释放锁以及恢复局部修改的buffer？	这问题是标哥问的。	\N	\N	12	\N	3	\N	5	5	2019-07-17 08:05:39.098879	2019-08-05 17:53:49.321502	\N	0	\N	\N	469	1	2	f	2019-07-17 09:04:24.035789
447	6	17	PG heap/toast	toast机制工作原理\r\nhttps://blog.csdn.net/liguangxianbin/article/details/80538473\r\ntoast会在创建一个表关联于原表，并将超长数据以压缩/切片方式存储在toast表中。\r\n*可能存在性能问题，如果增加一条记录，就涉及这边的多条记录变更的话。*\r\n尤其是更新的情况下。\r\n\r\n<pre><code class="text">\r\ntest=# select * from pg_class where relfilenode=40963;\r\n    relname     | relnamespace | reltype | reloftype | relowner | relam | relfilenode | reltablespace | relpages | reltuples | relallvisible | reltoastrelid | relhasindex | relisshared | relpersistence | relkind | relnatts | relchecks | relhasoids | relhasrules | relhastriggers | relhassubclass | relrowsecurity | relforcerowsecurity | relispopulated | relreplident | relispartition | relrewrite | relfrozenxid | relminmxid | relacl | reloptions | relpartbound\r\n----------------+--------------+---------+-----------+----------+-------+-------------+---------------+----------+-----------+---------------+---------------+-------------+-------------+----------------+---------+----------+-----------+------------+-------------+----------------+----------------+----------------+---------------------+----------------+--------------+----------------+------------+--------------+------------+--------+------------+--------------\r\n pg_toast_40960 |           99 |   40964 |         0 |       10 |     0 |       40963 |             0 |        0 |         0 |             0 |             0 | t           | f           | p              | t       |        3 |         0 | f          | f           | f              | f              | f              | f                   | t              | n            | f              |          0 |          596 |          1 |        |            |\r\n(1 row)\r\n\r\n\r\ntest=# select * from pg_class where relname='sal_emp';\r\n relname | relnamespace | reltype | reloftype | relowner | relam | relfilenode | reltablespace | relpages | reltuples | relallvisible | reltoastrelid | relhasindex | relisshared | relpersistence | relkind | relnatts | relchecks | relhasoids | relhasrules | relhastriggers | relhassubclass | relrowsecurity | relforcerowsecurity | relispopulated | relreplident | relispartition | relrewrite | relfrozenxid | relminmxid | relacl | reloptions | relpartbound\r\n---------+--------------+---------+-----------+----------+-------+-------------+---------------+----------+-----------+---------------+---------------+-------------+-------------+----------------+---------+----------+-----------+------------+-------------+----------------+----------------+----------------+---------------------+----------------+--------------+----------------+------------+--------------+------------+--------+------------+--------------\r\n sal_emp |         2200 |   40962 |         0 |       10 |     0 |       40960 |             0 |        0 |         0 |             0 |         40963 | f           | f           | p              | r       |        2 |         0 | f          | f           | f              | f              | f              | f                   | t              | d            | f              |          0 |          596 |          1 |        |            |\r\n(1 row)\r\n</code></pre>\r\n\r\ntoast_insert_or_update：这个函数的逻辑就是将row中需要toast的列全部存到toast表中，然后根据toast存储信息填充tuple，存到原表上。\r\n不同的列是单独作为一个chunk存储的，如果一列超过MAX CHUNK SIZE则使用chunk内多个seq表示。\r\n<pre><code class="text">\r\ntypedef struct varatt_external\r\n{\r\n\tint32\t\tva_rawsize;\t\t/* Original data size (includes header) */\r\n\tint32\t\tva_extsize;\t\t/* External saved size (doesn't) */\r\n\tOid\t\t\tva_valueid;\t\t/* Unique ID of value within TOAST table */\r\n\tOid\t\t\tva_toastrelid;\t/* RelID of TOAST table containing it */\r\n}\t\t\tvaratt_external;\r\n</code></pre>\r\n结构存储到原表中。	\N	\N	17	\N	3	\N	5	1	2019-06-17 16:58:02.225222	2019-07-12 15:02:46.960678	2019-06-17	0	\N	\N	447	1	2	f	\N
429	6	7	工程师的工作套路，效率	1，理解问题，展开细节，讨论\r\n2，备选方案，理解现有解法，搜论文。\r\n3，理解问题的差异点，并基于某个平台构建解决方案\r\n4，快速构建表达能力\r\n5，天下武功，唯快不破。打球想快，开发过程又何尝不如此呢？	\N	\N	17	\N	3	\N	5	1	2019-05-28 06:15:30.708846	2019-07-13 19:24:02.388413	2019-05-28	0	\N	\N	429	1	2	f	\N
466	6	17	PG MVCC之一共有哪些中snapshot，使用场景以及区别是什么		\N	\N	17	\N	3	\N	5	0	2019-07-13 20:33:28.267887	2019-07-13 20:33:28.267887	2019-07-13	0	\N	\N	466	1	2	f	\N
467	7	17	2019-7-15	1.完成vacuum和analyze的实现\r\n2，pg的操作有三条线\r\n 用户请求\r\n 后台定时任务\r\n 复制\r\n之前搞rgw也是这三条线路。\r\n3，pg的存储引擎\r\n存储引擎一般有数据格式，内存管理，并发控制与原子性保障，持久化性等主题。\r\n\r\n本月的目标也是把pg搞熟，了然于胸，然后输出相关文档。\r\n三个维度：\r\n1，框架维度，是一棵树\r\n2，流程维度，是算法，执行序列\r\n3，关联维度，是矩阵	\N	\N	19	\N	3	\N	5	0	2019-07-15 06:48:39.950907	2019-07-15 06:48:39.950907	2019-07-15	0	\N	\N	467	1	2	f	\N
470	8	17	PG HEAP_MOVED使用场景？	\t/*\r\n\t * Old-style VACUUM FULL is gone, but we have to keep this code as long as\r\n\t * we support having MOVED_OFF/MOVED_IN tuples in the database.\r\n\t */\r\n	\N	\N	17	\N	3	\N	5	0	2019-07-17 16:24:29.670665	2019-07-17 16:24:29.670665	\N	0	\N	\N	470	1	2	f	\N
471	8	17	PG 关于index空间的回收	1，只有vacuum full，执行reindex，才能真正回收index空间。\r\n2，index recycle page需要page mark delete的事务id小于RecentGlobalXmin,然而如果近期没有事务则该值不变。\r\n   会导致index page无法recycle。这时执行一个简单的插入，再次vacuum就能回收了。	\N	\N	17	\N	3	\N	5	0	2019-07-18 13:42:49.640524	2019-07-18 13:42:49.640524	\N	0	\N	\N	471	1	2	f	\N
473	8	17	PG why need command ID 以及 Combo CommandID	为什么需要command ID，解决什么问题？ AC可以不需要command ID么？	\N	\N	12	\N	3	\N	5	3	2019-07-19 07:48:38.871961	2019-07-19 08:26:13.790952	\N	0	\N	\N	473	1	2	f	2019-07-19 08:26:13.790952
476	6	17	PG tuple sort	重点函数puttuple_common	\N	\N	17	\N	3	\N	5	2	2019-07-19 13:27:43.189017	2019-07-22 07:05:15.716116	2019-07-19	0	\N	\N	476	1	2	f	\N
474	6	17	PG CI_v2 优化	1，AC的写入和读取是分离的。因而同一个事务内的写入可以合并\r\n2，可快速清理ac tuple，减小膨胀。\r\n3，当然最好还是把老版本隔离存储，这样可彻底避免ci膨胀	\N	\N	17	\N	3	\N	5	1	2019-07-19 08:34:00.340898	2019-07-24 13:51:47.434702	2019-07-19	0	\N	\N	474	1	2	f	\N
477	3	10	软件开发，羽毛球，江湖	准备好装备\r\n研究对手打发，策略\r\n热身\r\n做好每个球的环节\r\n调整状态，补给\r\n打完之后的放松与拉升\r\n总结\r\n收拾好装备\r\n\r\n-------------------------------------\r\n\r\n找到某个问题\r\n找到有相关问题的人\r\n研究人与问题\r\n了解问题目前所有的解法\r\n了解问题与之前解法中存在不一样的地方\r\n设计解决方案\r\n基于现有可用产品选型，构建新产品\r\n产品的不断迭代，改进，新增的用户需求处理\r\n产品维护\r\n新问题的出现- 下一代产品	\N	\N	17	\N	3	\N	5	1	2019-07-19 15:01:06.707031	2019-07-19 15:08:10.901104	2019-07-19	0	\N	\N	477	1	2	f	\N
332	8	7	【未完成】分布式系统的核心问题研究	FLP，CAP，BASE等等研究透。\r\nCAP其实就包含了分布式系统的核心问题，C，A，P。 \r\n\r\n分布式系统另外一个问题是数据分布算法，比如ceph的crush	\N	\N	17	\N	3	\N	5	2	2019-04-09 08:10:28.973141	2019-07-19 12:51:56.535879	\N	0	\N	\N	332	1	2	f	\N
478	8	17	PG vacuum的触发时机	1，全量在指定时间一定会触发么，如果指定时间内处理不完怎么办？\r\n2，表在什么情况下才需要vacuum，表的vacuum时间配置	\N	\N	17	\N	3	\N	5	0	2019-07-23 14:20:03.111971	2019-07-23 14:20:03.111971	\N	0	\N	\N	478	1	2	f	\N
484	6	7	外排序算法		\N	\N	17	\N	3	\N	5	1	2019-07-29 17:54:36.840485	2019-07-29 18:19:57.356074	2019-07-29	0	\N	\N	484	1	2	f	\N
475	6	17	PG CI_v2 支持build以及rebuild	AcBuildBegin\r\nAcBuildInsert\r\nAcBuildEnd\r\n\r\n支持在内存中合并，然后批量写入。如果内存不够，可按批次写入。事务ID使用frozen id	\N	\N	17	\N	3	\N	5	8	2019-07-19 08:57:48.777793	2019-07-29 09:29:04.164936	2019-07-19	0	\N	\N	475	1	2	f	\N
480	6	17	PG snapshot 管理机制		\N	\N	17	\N	3	\N	5	0	2019-07-24 15:39:57.409519	2019-07-24 15:39:57.409519	2019-07-24	0	\N	\N	480	1	2	f	\N
482	6	17	PG 事务执行与异常处理	pg执行时要保证：\r\n1，可回滚性，在事务最终未成功提交时，所有操作都具备可回滚性。比如文件的删除，创建。\r\n2，资源释放，在事务出错退出时，其使用的内存，共享内存，锁，句柄等都能正常释放。\r\n   pg在出错时，直接跳转，这点要非常注意。写代码时要注意在存在这种跳转逻辑，考虑到资源的释放。\r\n\r\n<pre><code class="text">\r\n \tpostgres.exe!RelationDropStorage(RelationData * rel) 行 145\tC\r\n \tpostgres.exe!heap_drop_with_catalog(unsigned int relid) 行 1886\tC\r\n \tpostgres.exe!doDeletion(const ObjectAddress * object, int flags) 行 1144\tC\r\n \tpostgres.exe!deleteOneObject(const ObjectAddress * object, RelationData * * depRel, int flags) 行 1039\tC\r\n \tpostgres.exe!deleteObjectsInList(ObjectAddresses * targetObjects, RelationData * * depRel, int flags) 行 263\tC\r\n>\tpostgres.exe!performDeletion(const ObjectAddress * object, DropBehavior behavior, int flags) 行 344\tC\r\n \tpostgres.exe!finish_heap_swap(unsigned int OIDOldHeap, unsigned int OIDNewHeap, bool is_system_catalog, bool swap_toast_by_content, bool check_constraints, bool is_internal, unsigned int frozenXid, unsigned int cutoffMulti, char newrelpersistence) 行 1645\tC\r\n \tpostgres.exe!rebuild_relation(RelationData * OldHeap, unsigned int indexOid, bool verbose) 行 629\tC\r\n \tpostgres.exe!cluster_rel(unsigned int tableOid, unsigned int indexOid, bool recheck, bool verbose) 行 433\tC\r\n</code></pre>\r\n\r\n<pre>\r\n>\tpostgres.exe!smgrdounlinkall(SMgrRelationData * * rels, int nrels, bool isRedo) 行 426\tC\r\n \tpostgres.exe!smgrDoPendingDeletes(bool isCommit) 行 361\tC\r\n \tpostgres.exe!CommitTransaction() 行 2156\tC\r\n \tpostgres.exe!CommitTransactionCommand() 行 2818\tC\r\n \tpostgres.exe!vacuum_rel(unsigned int relid, RangeVar * relation, int options, VacuumParams * params) 行 1604\tC\r\n \tpostgres.exe!vacuum(int options, List * relations, VacuumParams * params, BufferAccessStrategyData * bstrategy, bool isTopLevel) 行 340\tC\r\n \tpostgres.exe!ExecVacuum(VacuumStmt * vacstmt, bool isTopLevel) 行 141\tC\r\n</pre>	\N	\N	17	\N	3	\N	5	2	2019-07-29 07:27:15.700432	2019-07-29 15:18:17.351847	2019-07-29	0	\N	\N	482	1	2	f	\N
483	6	7	资管管理	资管管理类，涉及的问题。\r\n\r\n编号，唯一编号，名称到编号的映射，非编号系统，资源查找，LRU。	\N	\N	17	\N	3	\N	5	0	2019-07-29 17:54:19.763356	2019-07-29 17:54:19.763356	2019-07-29	0	\N	\N	483	1	2	f	\N
485	6	17	PG unlogged table	https://www.postgresql.org/message-id/BANLkTi%3D9eR4C4To9PdJD0ztGvR335PQ6HA%40mail.gmail.com\r\n\r\nunlogged table在vacuum时如何处理索引，会进行修正么？\r\n如何理解这段：\r\nThe current reasons for exceptions, where a pin is still needed, are if the\r\nindex is not WAL-logged or if the scan is an index-only scan.	\N	\N	17	\N	3	\N	5	2	2019-07-31 12:35:31.007243	2019-07-31 12:58:47.050561	2019-07-31	0	\N	438	438	2	3	f	\N
458	6	7	软件性能	评估方式：\r\n   时间复杂度\r\n   空间复杂度\r\n\r\n大维度：计算，存储，网络三大板块。\r\n   \r\n常用手段：\r\n   减小数据规模，砍掉不必要的东西\r\n   压缩减小存储空间\r\n   减少必须执行的步骤\r\n   优化每步的速度，使用不同的硬件，以及改进算法\r\n   批量执行\r\n   并行执行\r\n   预热处理，缓存技术，可以减少在重复执行时的一些步骤\r\n   副本技术，读写分离等减少资源冲突\r\n   最小化锁冲突，无锁数据结构	\N	\N	17	\N	3	\N	5	3	2019-07-06 12:54:59.080752	2019-08-02 14:43:18.75702	2019-07-06	0	\N	\N	458	1	2	f	\N
487	6	7	Bw-tree	https://zhuanlan.zhihu.com/p/29314464\r\n\r\n1，page地址不固定，采用追加写入\r\n2，将btree每次整理推迟，采用追加增量修改，避免加锁\r\n3，copy方式实现页面合并，在最后修改table mapping避免加锁\r\n4，pin机制保护正在访问与回收page并发\r\n5，分裂也是copy，完成后使用CAS更新mapping\r\n\r\n所谓无锁，就是使用CAS，最小化锁冲突	\N	\N	17	\N	3	\N	5	0	2019-08-02 16:02:17.072244	2019-08-02 16:02:17.072244	2019-08-02	0	\N	\N	487	1	2	f	\N
479	6	17	PG CI_v2 测试		\N	\N	17	\N	3	\N	5	7	2019-07-23 15:00:42.26385	2019-08-05 08:45:44.286431	2019-07-23	0	\N	\N	479	1	2	f	\N
481	6	17	PG Transaction Isolation	事务隔离级别\r\n\r\n官方文档已经写的非常细致了\r\nhttps://www.postgresql.org/docs/current/transaction-iso.html\r\n\r\n\r\nPG实际支持的就是SI，通过SI实现RC和RR隔离级别。PG最低级别就是RC。\r\nRC说读到的数据都是提交的，即执行数据修改的事务不能是运行状态。\r\nRC在读取数据时，根据snapshot判断事务是否为提交状态。已提交，则可读。\r\n\r\nRR说读到的数据，下次再读结果应该一样。即在一个事务内不同的CID，读取的数据是一样的。\r\nRR是在事务期间一直使用事务开始时的快照，即在事务执行期间，其读取数据发生的变更对其不可见，因而可以重复读。\r\n\r\nPG的RR级别似乎可以避免幻读问题，在RR事务期间，有新写入或删除的数据，其事务id必然是未提交状态。\r\nbecause a repeatable read transaction cannot modify or lock rows changed by other transactions after the repeatable read transaction began.\r\n不修改别人改过的记录。\r\n举个例子：\r\n事务1：读取当前有多少钱，把数量+100\r\n事务2：读取当前有多少钱，把数量+100\r\n这两事务如果同时提交成功，则数量只会加100. 因为都是基于老的数值。\r\n有人把我之前读取的数据修改了，而我想基于我之前读取的数据进行修改。但这时有冲突，只能撤销当前事务。\r\n这个问题本质上还是不可重复读问题，只不过这个读是为了写。(写的时候要求读取的数据与之前一样，然而数据变了，基于老版本数据进行修改已经没了意义)\r\nNote that only updating transactions might need to be retried; read-only transactions will never have serialization conflicts.\r\n这个是显然的，因为MVCC老版本总是在那。\r\n\r\nSS要求更高，SS不仅是别人不能影响我，而且还得别人的影响我全都看得到。\r\nclass | value\r\n-------+-------\r\n     1 |    10\r\n     1 |    20\r\n     2 |   100\r\n     2 |   200\r\n\r\n事务1：\r\nSELECT SUM(value) FROM mytab WHERE class = 1;\r\ninsert into mytab values(2, 300)\r\n\r\n事务2：\r\nSELECT SUM(value) FROM mytab WHERE class = 2;\r\ninsert into mytab values(1, 30)\r\n\r\n在RR下执行完全没问题，互不干扰。但是SS下，并行的结果不等价于任意一种串行的效果。\r\n这种异常叫serialization anomaly。\r\n\r\nPG的实现这文章讲的还可以：\r\nhttps://www.cnblogs.com/flying-tiger/p/9591583.html	\N	\N	17	\N	3	\N	5	1	2019-07-25 14:44:45.797625	2019-07-25 14:45:02.31051	2019-07-25	0	\N	439	439	2	3	f	\N
472	6	17	PG log配置	log_destination 语义并不准确，实际上是log格式。配置了stderr，但是下面配置collector，以及文件就能输出到指定文件。\r\n\r\n<pre><code class="text">\r\n#log_destination = 'csvlog'\t\t# Valid values are combinations of\r\n\t\t\t\t\t# stderr, csvlog, syslog, and eventlog,\r\n\t\t\t\t\t# depending on platform.  csvlog\r\n\t\t\t\t\t# requires logging_collector to be on.\r\n\r\n# This is used when logging to stderr:\r\nlogging_collector = on\t\t# Enable capturing of stderr and csvlog\r\n\t\t\t\t\t# into log files. Required to be on for\r\n\t\t\t\t\t# csvlogs.\r\n\t\t\t\t\t# (change requires restart)\r\n\r\n# These are only used if logging_collector is on:\r\nlog_directory = 'pg_log'\t\t\t# directory where log files are written,\r\n\t\t\t\t\t# can be absolute or relative to PGDATA\r\nlog_filename = 'postgresql-%Y-%m-%d_%H%M%S.log'\t# log file name pattern,\r\n\t\t\t\t\t# can include strftime() escapes\r\nlog_file_mode = 0640\t\t\t# creation mode for log files,\r\n\t\t\t\t\t# begin with 0 to use octal notation\r\n#log_truncate_on_rotation = off\t\t# If on, an existing log file with the\r\n\t\t\t\t\t# same name as the new log file will be\r\n\t\t\t\t\t# truncated rather than appended to.\r\n\t\t\t\t\t# But such truncation only occurs on\r\n\t\t\t\t\t# time-driven rotation, not on restarts\r\n\t\t\t\t\t# or size-driven rotation.  Default is\r\n\t\t\t\t\t# off, meaning append to existing files\r\n\t\t\t\t\t# in all cases.\r\nlog_rotation_age = 2d\t\t\t# Automatic rotation of logfiles will\r\n\t\t\t\t\t# happen after that time.  0 disables.\r\nlog_rotation_size = 100MB\t\t# Automatic rotation of logfiles will\r\n\t\t\t\t\t# happen after that much log output.\r\n\t\t\t\t\t# 0 disables.\r\n</code></pre>\r\n	\N	\N	17	\N	3	\N	5	3	2019-07-18 15:21:38.619189	2019-07-31 15:33:52.433192	2019-07-18	0	\N	\N	472	1	2	f	\N
486	6	7	关于 int64 格式化，以及DEBUG宏	PRId64正确使用来保证跨平台\r\nhttps://yq.aliyun.com/articles/285029\r\n\r\nDEBUG\r\nhttps://blog.csdn.net/u012707739/article/details/80217959	\N	\N	17	\N	3	\N	5	0	2019-08-01 14:43:49.873999	2019-08-01 14:43:49.873999	2019-08-01	0	\N	\N	486	1	2	f	\N
289	6	7	关于混沌工程	看了几篇文章，仍然没有搞清楚混沌工程与注入测试的区别。在手段上也许是接近的。\r\n区别可能是理念上的。\r\n\r\n混沌工程的几个关键词： 生产环境，实验，监控。\r\n\r\n与注入测试手段上类似，但是上述3点观念上的区别很大。 比如你可能在实验环境上做各种注入测试。\r\n但是你考虑过在生产环境做多中心切换实验么？\r\n\r\n实验与测试的区别在于实验是对于结果并非完全确定的，这也许是监控需要的原因。有时候我们在观察系统的反应。因为它太复杂了。\r\n就像社会上施行某一个政策一样。先在一个地方做个实验看看。\r\n\r\n另外普通故障注入 与 多变量注入并不一样	\N	\N	17	\N	3	\N	5	1	2019-03-01 15:15:51.35839	2019-08-01 14:49:38.712735	2019-03-01	0	\N	\N	289	1	2	f	\N
426	6	18	关于世界与知识	世界有如万维图，不同的人在不同维度与不同值域上活动。\r\n这个图不知道有没尽头。\r\n世界的复杂就在于即便几个维度的组合运算就超出了人类的范围。\r\n\r\n行存体现的是人类活动，人在不同维度上已经建立的联系。而列存\r\n更好的反应了维度本身。\r\n\r\n知识：存在反应的是在不同维度间建立的知识。\r\n知识可以是隶属关系，推导关系，等价关系。也可以是其他关系	\N	\N	17	\N	3	\N	5	2	2019-05-26 06:45:32.767199	2019-08-01 15:32:22.536809	2019-05-26	0	\N	\N	426	1	2	f	\N
\.


--
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.issues_id_seq', 487, true);


--
-- Data for Name: journal_details; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.journal_details (id, journal_id, property, prop_key, old_value, value) FROM stdin;
9	5	attr	status_id	18	4
11	9	attr	status_id	18	8
12	11	attr	status_id	4	8
13	12	attr	status_id	8	11
14	13	attr	status_id	11	10
15	16	attr	status_id	8	11
16	17	attr	status_id	11	10
17	22	attr	status_id	17	18
18	23	attr	status_id	18	8
19	36	attr	status_id	18	8
20	42	attr	status_id	18	4
21	43	attr	status_id	4	11
22	44	attr	status_id	18	8
23	46	attr	status_id	17	4
24	48	attr	category_id	\N	2
25	49	attr	status_id	17	4
26	56	attr	status_id	17	4
27	57	attr	status_id	4	8
28	58	attr	status_id	8	11
29	62	attr	status_id	17	4
30	63	attr	status_id	4	12
31	64	attr	status_id	17	4
32	68	relation	copied_to	\N	27
33	69	relation	copied_from	\N	26
34	70	attr	fixed_version_id	\N	3
35	74	attr	status_id	17	4
36	75	attr	category_id	\N	4
37	75	attr	fixed_version_id	\N	3
38	76	attr	category_id	1	4
39	82	attr	status_id	8	11
40	84	attr	status_id	17	4
41	87	attr	status_id	4	8
42	95	attr	status_id	17	14
43	96	attr	status_id	17	4
44	99	attr	status_id	4	8
45	104	attr	status_id	17	16
46	105	attr	fixed_version_id	\N	1
47	106	attr	status_id	17	4
48	107	attr	fixed_version_id	4	5
49	108	attr	status_id	17	18
50	109	attr	status_id	17	4
51	114	attr	status_id	18	4
52	115	attr	fixed_version_id	\N	4
53	117	attr	category_id	\N	5
54	117	attr	fixed_version_id	\N	3
55	120	attr	status_id	17	4
56	144	attr	status_id	17	14
57	146	attr	status_id	17	18
58	152	attr	status_id	18	4
59	160	attr	tracker_id	7	4
60	160	attr	description	能够查询一个对象的变更历史，知道何时何人对对象做了变更。	\N
61	161	attr	tracker_id	7	4
62	161	attr	description	1，摸清楚license原理以及用法	\N
63	162	attr	status_id	19	24
64	163	attr	status_id	19	24
65	167	attr	done_ratio	0	100
66	221	attr	subject	2018.6.19	2018.6.19 （BI改造）
67	256	attr	subject	2018.7.23	2018.7.23(V5.2.0需求分析，存储策略，异构集群)
68	268	attachment	4	\N	pg分裂问题的严重性.png
69	286	attr	subject	基于bluestore的海量小文件处理方案	海量小文件问题
70	330	attr	category_id	\N	13
71	331	attr	category_id	\N	12
74	401	attachment	9	\N	rgw架构.png
75	405	attr	subject	游戏力实操训练营	游戏力实操训练营（第一课 妈妈，你走开-如何与孩子重新建立联结）
76	406	attr	subject	游戏力实操训练营（第3课 妈妈，我害怕- 如何让孩子勇敢）	游戏力实操训练营（第三课 妈妈，我害怕- 如何让孩子勇敢）
77	423	attr	subject	游戏力实操训练营（第四课 -妈妈，不要走-如何应对孩子的分离焦虑）	游戏力实操训练营（第四课 妈妈，不要走-如何应对孩子的分离焦虑）
78	455	attachment	12	\N	第四课复习卡.jpg
79	456	attachment	13	\N	第五课复习卡.jpg
80	457	attachment	14	\N	第一课复习卡.jpg
81	458	attachment	15	\N	第二课复习卡.jpg
82	459	attachment	16	\N	第三课复习卡.jpg
83	491	attr	subject	抽球练习心得1	打墙练习心得1
84	502	attachment	17	\N	499_tcpdump.png
85	504	attachment	18	\N	tcpdump_not_accept.png
86	511	attr	description	当一个帝国崛起之后，其会稳固其领导地位。\r\n而其他国家则试图在技术，以及其他方面创新从而实现自己的崛起。\r\n\r\n封建时代，中国无疑算是非常成功的，虽然中间几次沦落，但是那时辱民政策的恶果。\r\n如今的机会可能在于打开新的潘多拉魔盒，就像信息革命和工业革命一样。\r\n\r\n但人是否过得更好并非一定是选择方向。尤其是专制政府下。\r\n\r\n中国很可能有机会开启下一个魔盒，但释放的可能是新的魔鬼。	当一个帝国崛起之后，其会稳固其领导地位。\r\n而其他国家则试图在技术，以及其他方面创新从而实现自己的崛起。\r\n\r\n封建时代，中国无疑算是非常成功的，虽然中间几次沦落，但是那时辱民政策的恶果。\r\n如今的机会可能在于打开新的潘多拉魔盒，就像信息革命和工业革命一样。\r\n\r\n但人是否过得更好并非一定是选择方向。尤其是专制政府下。\r\n\r\n中国很可能有机会开启下一个魔盒，释放出新的魔鬼。
87	514	attachment	19	\N	tcpdump_not_accept.png
88	515	attachment	19	tcpdump_not_accept.png	\N
89	516	attachment	20	\N	tcp_netstat_error.png
90	518	attachment	21	\N	tcp_netstat_2.png
91	521	attachment	22	\N	hang_tcpdump.png
92	521	attachment	23	\N	normal_tcpdump.png
94	535	attr	subject	linux 进程通信与同步学习	linux 信号
108	682	attr	description	道不同，以光大本道。破除邪道。当人类走在分岔口。意识形态碰撞强烈时，战争就开始了。\r\n\r\n利益是小规模战争的原因。小规模是指局部战争，或实力悬殊的战胜。	道不同，以光大本道。破除邪道。当人类走在分岔口。意识形态碰撞强烈时，战争就开始了。\r\n\r\n战争还有一种单纯的原因就是利益。在物质并非最贵资源的今天，以争夺资源为目标的战争缺乏存在的基础。\r\n但是利益之战仍然存在，其形态发生了改变。
119	758	attr	description	所谓忧虑，就是存在风险\r\n所谓风险，就是能力不足，无法cover住各种情况。\r\n所谓创业，就是做一份自己热爱的事	所谓忧虑，就是存在风险\r\n所谓风险，就是能力不足，无法cover住各种情况\r\n所谓创业，就是做一份自己热爱的事\r\n所谓懒惰，就是没有能力掌控自己的精力
93	525	attr	description	1，realm配置变更时，rgw reload，一方面可能中断业务，另外可能因为资源依赖导致reload时rgw挂掉或可能hang住。\r\n2，多站点特性，多边同时执行put和删除操作，可能导致一边对象未删除，多出对象。\r\n3，老版本删除，和多出版本删除等gc操作在前端实现，在并发时可能引起本该删除的老对象没及时删除。\r\n4，osd在压力大时，可能出现slow request， peering卡住等问题\r\n5，osd恢复qos控制效果不好\r\n6，在某些场景下，掉电会出现db损坏问题。	1，realm配置变更时，rgw reload，一方面可能中断业务，另外可能因为资源依赖导致reload时rgw挂掉或可能hang住。\r\n2，多站点特性，多边同时执行put和删除操作，可能导致一边对象未删除，多出对象。\r\n3，老版本删除，和多出版本删除等gc操作在前端实现，在并发时可能引起本该删除的老对象没及时删除。\r\n4，rgw使用libfcgi存在风险，libfcgi在accept循环中读取头部数据\r\n5，osd在压力大时，可能出现slow request， peering卡住等问题\r\n6，osd恢复qos控制效果不好\r\n7，在某些场景下，掉电会出现db损坏问题。\r\n8，用户Qos，低tps用户发送大量请求可能阻塞高优先级用户。
95	546	attr	subject	个人工作职责的剥离	个人工作职责的剥离，用身边的人让自己变得成倍的强大。
96	555	attr	description	方案1：\r\n1，在对象删除后，并非立即将bi删除，而是增加删除标记。并且将对象实例丢入待清理列表\r\n2，在获取对象mtime时，获取含删除标记的对象的mtime。\r\n3，后台任务，在一段时间后清理删除标记。这里可启动新的后台任务，而非gc。\r\n\r\n问题：如何确定对象已经被同步？多久之后清理？\r\n注意：需考虑bucket删除等交叉场景。\r\n\r\n方案2：\r\n1，所有删除操作都不直接清除对象实例，而是将实例rename或打标记\r\n2，修改gc实现，gc扫描bi获取已删除对象进行删除。\r\n\r\n方案2的问题在于对于大量对象的bucket，这种遍历代价有点高。\r\n采用rename的方式以目前cls的方式实现问题不大，但是后续架构调整的目标是慢慢弱化cls。\r\n\r\n方案3：\r\n1，bucket都启用多版本	方案1：\r\n1，在对象删除后，并非立即将bi删除，而是增加删除标记。并且将对象实例丢入待清理列表\r\n2，在获取对象mtime时，获取含删除标记的对象的mtime。\r\n3，后台任务，在一段时间后清理删除标记。这里可启动新的后台任务，而非gc。\r\n\r\n问题：如何确定对象已经被同步？多久之后清理？\r\n注意：需考虑bucket删除等交叉场景。\r\n\r\n方案2：\r\n1，所有删除操作都不直接清除对象实例，而是将实例rename或打标记\r\n2，修改gc实现，gc扫描bi获取已删除对象进行删除。\r\n\r\n方案2的问题在于对于大量对象的bucket，这种遍历代价有点高。\r\n采用rename的方式以目前cls的方式实现问题不大，但是逻辑上稍微复杂些，\r\n除了按instance名字查询对象实例mtime，还得额外查询rename之后的key，后续架构调整的目标是慢慢弱化cls。\r\n\r\n方案3：\r\n1，bucket都启用多版本
97	560	attr	description	意外不意味着无法控制，反而你不加以控制，意外会越来越多。\r\n\r\n你得不断优化调试自己的机器，不断升级版本。而不是处于混沌状态。\r\n不论是学习，管理，还是干其他事都是如此。\r\n\r\n宏观可以看到方向，目标。 但微观才是决定成败的。	意外不意味着无法控制，反而你不加以控制，意外会越来越多。\r\n\r\n你得不断优化调试自己的机器，不断升级版本。而不是处于混沌状态。这样才能用“笨方法”把事做成。\r\n不论是学习，管理，还是干其他事都是如此。\r\n\r\n将机器执行逻辑不断分割为更小模块，理解这些模块，以及其关联关系，知道如何牵一发而动全身。\r\n\r\n宏观可以看到方向，目标。 但微观才是决定成败的。
98	561	attr	description	意外不意味着无法控制，反而你不加以控制，意外会越来越多。\r\n\r\n你得不断优化调试自己的机器，不断升级版本。而不是处于混沌状态。这样才能用“笨方法”把事做成。\r\n不论是学习，管理，还是干其他事都是如此。\r\n\r\n将机器执行逻辑不断分割为更小模块，理解这些模块，以及其关联关系，知道如何牵一发而动全身。\r\n\r\n宏观可以看到方向，目标。 但微观才是决定成败的。	意外不意味着无法控制，反而你不加以控制，意外会越来越多。\r\n\r\n你得不断优化调试自己的机器，不断升级版本。而不是处于混沌状态。这样才能用“笨方法”把事做成。\r\n不论是学习，管理，还是干其他事都是如此。\r\n\r\n将机器执行逻辑不断分割为更小模块，理解这些模块，以及其关联关系，知道如何牵一发而动全身。\r\n\r\n宏观可以看到方向，目标。 但计划与执行同样重要，微观决定成败。
99	574	attr	subject	xfs 碎片整理，内存占用等问题	海量小文件问题，xfs 碎片整理，内存占用等问题
100	586	attr	description	1，分治方法，合时扼要\r\n其重点在于识人用人，以及事的架构设计\r\n\r\n2，抓住本质，深入理解问题\r\n其实一些事情看似复杂，但是问题规模可能也就十几个。\r\n有些人一年就搞定了，而有些人10年都搞不定。\r\n\r\n3，学会放松\r\n\r\n	1，分治方法，合时扼要\r\n其重点在于识人用人，以及事的架构设计\r\n\r\n2，抓住本质，深入理解问题\r\n其实一些事情看似复杂，但是问题规模可能也就十几个。\r\n有些人一年就搞定了，而有些人10年都搞不定。\r\n\r\n3，善用工具，机器模型\r\n\r\n4，学会放松，调整精力。\r\n人在任何领域的差距都有百倍之上。精力强的人表现也会百倍于精力差的人。\r\n\r\n这就是人的综合差距有上万倍的原因。\r\n\r\n
101	598	attr	subject	关于去掉cls-rgw的思考	V6的思考(解耦)
102	611	attr	subject	提供中广核V3升级到V5方案	提供广发V3升级到V5方案
103	612	attr	done_ratio	0	100
104	641	attr	description	没有一无是处的人，如果感觉有，可能出现了如下情况：\r\n1，他放错了地方\r\n2，他做了不适合自己当下的事，聪明有经验的人不提出自己的建议，新手笨拙的人不提出自己的疑问。\r\n张小龙还想一秒变傻瓜呢，有些人不用变，因为心中没有魔障。\r\n\r\n说起来就是空间与时间，位置领域与趋势时机。	没有一无是处的人，如果感觉有，可能出现了如下情况：\r\n1，他放错了地方，做着不适合自己的事。\r\n2，他做了不适合自己当下的事，聪明有经验的人不提出自己的建议，新手笨拙的人不提出自己的疑问。\r\n张小龙还想一秒变傻瓜呢，有些人不用变，因为心中没有魔障。\r\n\r\n说起来就是空间与时间，位置领域与趋势时机。
105	643	attr	subject	当下流行的软件架构，以及常用组件	关于软件架构
106	646	attr	subject	一个大缺点 --- 缺乏责任心	优缺点分析
107	672	attr	subject	职业生涯规划-小章鱼之咨询篇	职业生涯规划-小章鱼之咨询篇20190228-0336
122	770	attr	done_ratio	0	30
124	790	attr	project_id	7	23
109	704	attr	description	1，缺乏充分调研，错用社区不稳定模块。闭门造车。\r\n2，有时候重写比重用更好，多版本就是典型例子，如果没搞懂，未经验证，最好别用。\r\n3，有时候以为需求明确了，但对于需求的紧急程度，需要的价值缺乏深入理解。\r\n做了很多流产的对接与小功能。\r\n4，没完全搞清楚现有系统就开始设计？你可能一开始就掉入陷阱。从开始到废弃。\r\n5，除了做对，还得考虑如何做得更好，V5重构就是一个天大的机会。然后错失了优化元数据的一次机会。\r\n6，临时测试验证的东西直接做成方案？小文件优化把这个坑演绎到极致。\r\n7，自动化测试用例应该由开发人员来写，且必须能快速有效的运行。\r\n8，设计review和开发review不仅应该做，而且应该做得很细。	1，缺乏充分调研，错用社区不稳定模块。闭门造车。\r\n2，有时候重写比重用更好，多版本就是典型例子，如果没搞懂，未经验证，最好别用。\r\n3，有时候以为需求明确了，但对于需求的紧急程度，需求的价值缺乏深入理解。\r\n做了很多流产的对接与小功能。\r\n4，没完全搞清楚现有系统就开始设计？你可能一开始就掉入陷阱。桶快照从开始到废弃。\r\n5，除了做对，还得考虑如何做得更好，V5重构就是一个天大的机会。然后错失了优化元数据的一次机会。\r\n6，临时测试验证的东西直接做成方案？小文件优化把这个坑演绎到极致。\r\n7，自动化测试用例应该由开发人员来写，且必须能快速有效的运行。\r\n8，设计review和开发review不仅应该做，而且应该做得很细。
110	705	attr	description	1，缺乏充分调研，错用社区不稳定模块。闭门造车。\r\n2，有时候重写比重用更好，多版本就是典型例子，如果没搞懂，未经验证，最好别用。\r\n3，有时候以为需求明确了，但对于需求的紧急程度，需求的价值缺乏深入理解。\r\n做了很多流产的对接与小功能。\r\n4，没完全搞清楚现有系统就开始设计？你可能一开始就掉入陷阱。桶快照从开始到废弃。\r\n5，除了做对，还得考虑如何做得更好，V5重构就是一个天大的机会。然后错失了优化元数据的一次机会。\r\n6，临时测试验证的东西直接做成方案？小文件优化把这个坑演绎到极致。\r\n7，自动化测试用例应该由开发人员来写，且必须能快速有效的运行。\r\n8，设计review和开发review不仅应该做，而且应该做得很细。	1，缺乏充分调研，错用社区不稳定模块。闭门造车。\r\n2，有时候重写比重用更好，多版本，多站点就是典型例子，如果没搞懂，未经验证，最好别用。\r\n3，有时候以为需求明确了，但对于需求的紧急程度，需求的价值缺乏深入理解。\r\n做了很多流产的对接与小功能。\r\n4，没完全搞清楚现有系统就开始设计？你可能一开始就掉入陷阱。桶快照从开始到废弃。\r\n5，除了做对，还得考虑如何做得更好，V5重构就是一个天大的机会。然后错失了优化元数据的一次机会。\r\n6，临时测试验证的东西直接做成方案？小文件优化把这个坑演绎到极致。\r\n7，自动化测试用例应该由开发人员来写，且必须能快速有效的运行。\r\n8，设计review和开发review不仅应该做，而且应该做得很细。
111	721	attr	description	命题是逻辑的基本构件，是一个陈述语句，它或真或假，不能既真又假。\r\n谓词：谓词本质就是命题函数，存在变元。\r\n量词：量词就是对于变元的情况做出规范，分为全称量词和存在量词。	命题是逻辑的基本构件，是一个陈述语句，它或真或假，不能既真又假。\r\n谓词：谓词本质就是命题函数，存在变元。含谓词的命题也叫谓词命题\r\n量词：量词就是对于变元的情况做出规范，分为全称量词和存在量词。含量词的命题也叫量化命题
112	722	attr	description	1，命题转换\r\n2，借助其他命题\r\n\r\n前提条件，蕴含的意思是如果前提为真，那么整体是否为真取决于结论是否为真。\r\np->q为真，则p是q的充分条件。\r\n\r\n推理规则就是采用等值变换将命题转换为其他形式。或根据前提来得出结论。\r\n\r\n直接证明：利用定义，以及其他公理，定理。通过推理来得出结论。\r\n反证法原理：p->q 等价于 非p V q 等价于 qV非p 等于于非q->非p。\r\n归谬法原理：证明p为真 等价于 非p->false为真。 false的一种形式为r且非r。 \r\n	1，命题转换\r\n2，借助其他命题\r\n\r\n前提条件，蕴含的意思是如果前提为真，那么整体是否为真取决于结论是否为真。\r\np->q为真，则p是q的充分条件。\r\n\r\n推理规则就是采用等值变换将命题转换为其他形式。或根据前提来得出结论。\r\n\r\n直接证明：利用定义，以及其他公理，定理。通过推理来得出结论。\r\n反证法原理：p->q 等价于 非p V q 等价于 qV非p 等于于非q->非p。\r\n归谬法原理：证明p为真 等价于 非p->false为真。 false的一种形式为r且非r。 \r\n\r\nso看到没，数理逻辑是数学证明的基础。证明的本质在于运用定义，公理来推理。
113	725	attr	description	分解：\r\n1，创建access schema分为哪几步？有哪些操作？\r\n  当作元数据，用户管理schema属于元数据操作。\r\n\r\n2，access schema在哪些阶段使用？怎样使用？\r\n  beas逻辑优化阶段\r\n\r\n3，access schema在什么情况下会被修改或删除？是否需关联删除constraint index？\r\n  当一个表的字段发生修改时\r\n  当一个表被删除时\r\n  \r\n  用户直接修改\r\n\r\n4，显然access schema在内存和外存中分别以什么形态存储？\r\n  hash查找快，但不好扩展。hash用来做均衡分布挺好的\r\n  红黑树可能更适合。\r\n\r\n5，对于access schema的使用做监控管理，比如用户使用怎样的查询语句来使用schema\r\n\r\n6，对于常量到表字段的映射，也需要加入到schema中管理？ \r\n比如select b2，a4 from A，B where a3 = 1. schema有null->a1, a1->b2.\r\nA的fetch sequence：a3=1\r\nB的fetch sequence：a3=1, a3->a1 , a1->a2\r\n\r\n7，关系提前生成？\r\n如a3->c4, c4->b3。从而生成a3->b3.\r\n	分解：\r\n1，创建access schema分为哪几步？有哪些操作？\r\n  当作元数据，用户管理schema属于元数据操作。\r\n  比如关联创建constraint index，关联创建衍生的acess schema? 是否需修改beas中保存的元数据？\r\n\r\n2，access schema在哪些阶段使用？怎样使用？\r\n  beas逻辑优化阶段\r\n\r\n3，access schema在什么情况下会被修改或删除？是否需关联删除constraint index？\r\n  当一个表的字段发生修改时\r\n  当一个表被删除时\r\n  \r\n  用户直接修改\r\n\r\n4，显然access schema在内存和外存中分别以什么形态存储？\r\n  hash查找快，但不好扩展。hash用来做均衡分布挺好的\r\n  红黑树可能更适合。\r\n\r\n5，对于access schema的使用做监控管理，比如用户使用怎样的查询语句来使用schema\r\n\r\n6，对于常量到表字段的映射，也需要加入到schema中管理？ \r\n比如select b2，a4 from A，B where a3 = 1. schema有null->a1, a1->b2.\r\nA的fetch sequence：a3=1\r\nB的fetch sequence：a3=1, a3->a1 , a1->a2\r\n\r\n7，关系提前生成？\r\n如a3->c4, c4->b3。从而生成a3->b3.\r\n
114	739	attr	subject	PG内存数据的结构算法	PG SysCache与RelCache
115	743	attr	description	beas的实现除了将beas功能内置为pg的子模块内，还有一种可能是将beas作为外部，内部把pg包住。	BEAS架构思考：\r\nbeas的实现除了将beas功能内置为pg的子模块内，还有一种可能是将beas作为外部，内部把pg包住。
116	747	attr	description	1，抬起脚根，抬起拍子，准备接球\r\n2，追高点\r\n3，放松(必须自信)展开击球，打到对方难受的地方 （需知彼）\r\n4，有节奏的回动到逻辑中心	V1.0：\r\n1，抬起脚根，抬起拍子，准备接球\r\n2，追高点\r\n3，放松(必须自信)展开击球，打到对方难受的地方 （需知彼）\r\n4，有节奏的回动到逻辑中心
117	756	attr	description	所谓风险，就是能力不足，无法cover住各种情况。	所谓忧虑，就是存在风险\r\n所谓风险，就是能力不足，无法cover住各种情况。
118	757	attr	description	所谓忧虑，就是存在风险\r\n所谓风险，就是能力不足，无法cover住各种情况。	所谓忧虑，就是存在风险\r\n所谓风险，就是能力不足，无法cover住各种情况。\r\n所谓创业，就是做一份自己热爱的事
121	769	attr	tracker_id	6	7
120	763	attr	description	Cygwin：是poxis模拟环境，提供了一套模拟运行环境\r\nMINGW:是GNU的工具链，用于在windows上像linux一样编译程序。	Cygwin：是poxis模拟环境，提供了一套模拟运行环境\r\nMINGW:是GNU的工具链，用于在windows上像linux一样编译程序。\r\nQt:基于Qt的桌面软件,Qt是一个桌面程序开发框架，就像windows上的MFC等
123	772	attr	done_ratio	0	100
126	792	attr	description	我们都知道一个缺乏原动力的人是多么的无趣，做事情没有认真严谨态度，对结果无所谓。我们在自己热爱的事情上难以容忍这样的搭档存在。\r\n我们可以有很多美好的目标，并且知道这些目标可以达到。只要我们行动起来，不断逼近。\r\n我们不因别人的好恶影响自己的选择，我们选择是因为我们的目标如此，我们不愿错过美好。\r\n\r\n成功方法论\r\n激励自己的目标 + 逻辑机器构建项目 + 彻底解决项目运转的各个细节问题(一个领域常见疑难问题可能就上千规模)。\r\n\r\n成熟检验方法：\r\n一个人只有当自己完全自由时，直面压力，掌控自己达成目标。才算真正成长起来，成为那个可以在前面遮风挡雨，独当一面的人。\r\n\r\n病痛分析：\r\n每个人因成长环境，原生家庭，可能形成恐惧，麻木，软弱不自信，无力，懒散，安全感缺失，依赖，放纵等等毛病。\r\n焦虑是因为有风险，有风险是因为能力不够或预期不实际。\r\n不去制定目标通常是因为缺乏自信，或者没有痛感，对自己的成长对世界的探索丧失了兴趣。	我们都知道一个缺乏原动力的人是多么的无趣，做事情没有认真严谨态度，对结果无所谓。我们在自己热爱的事情上难以容忍这样的搭档存在。\r\n我们可以有很多美好的目标，并且知道这些目标可以达到。只要我们行动起来，不断逼近。\r\n我们不因别人的好恶影响自己的选择，我们选择是因为我们的目标如此，我们不愿错过美好。\r\n我们不去假设自己成为那个最优秀的人，也许天生环境我们无法达到。但我们可以在自己热爱的方向上不断前进，这就足够美好了。\r\n\r\n成功方法论\r\n激励自己的目标 + 逻辑机器构建项目 + 彻底解决项目运转的各个细节问题(一个领域常见疑难问题可能就上千规模)。\r\n\r\n成熟检验方法：\r\n一个人只有当自己完全自由时，直面压力，掌控自己达成目标。才算真正成长起来，成为那个可以在前面遮风挡雨，独当一面的人。\r\n\r\n病痛分析：\r\n每个人因成长环境，原生家庭，可能形成恐惧，麻木，软弱不自信，无力，懒散，安全感缺失，依赖，放纵等等毛病。\r\n焦虑是因为有风险，有风险是因为能力不够或预期不实际。\r\n不去制定目标通常是因为缺乏自信，或者没有痛感，对自己的成长对世界的探索丧失了兴趣。
130	799	attr	due_date	\N	2019-05-16
135	805	attr	description	static语义是静态的，描述变量的存储特性。\r\n\r\n但是static在c语言中还有另一个作用（有点奇葩，一个关键字2个语义）： 限制作用域在本文件内。对于头文件而言就是包含该头文件的C文件内。	static语义是静态的，描述变量的静态存储特性，静态存储变量会自动初始化\r\n\r\n但是static在c语言中还有另一个作用（有点奇葩，一个关键字2个语义）： 限制作用域在本文件内。对于头文件而言就是包含该头文件的C文件内。
142	869	attr	description		MVCC的解决的问题是事务的隔离性。PG这块搞起来很复杂，一方面是因为事务本身复杂，pg的实现复杂。二是结合事务的各种状态，多版本的管理以及可见性判断复杂。\r\n隔离一种实现方式是加锁，但性能上没法接受。另一种方式就是MVCC。undo也是其中一种实现方案。
145	896	attr	subject	PG ScanDesc	PG Scan执行
147	898	attr	description	IOT使用场景：1，查询基本使用key。 2，表比较短小。\r\n从BEAS理论来说这两点都是满足的。\r\n\r\n如果将index最底层的page换成heap会怎样？\r\n或者说index不变，只是其指向的不再是tuple，而是page。逻辑上会发生什么变化。\r\n\r\n或者说成稀疏index，whatever？ 这样heap里面的tuple格式就与目标一致了，且insert不必总是更新两个页面。\r\n而版本清理后续还能通过undo机制优化。\r\n\r\nIOT的玩法对于scan也是一样，总是index scan。或者说这并非传统意义上的indexscan，这就是ac scan。\r\n如果能用索引，就直接定位到具体的heap page，如果不能，就从最左边的heap page开始。\r\n\r\nheap page仅支持单向扫描，干掉左边的指针。也可不支持指向parent，使得btree代码可以完全重用。\r\n\r\n优点：\r\n1，通常只需更新heap，可加快更新速度。\r\n2，砍掉了index头部，节省部分空间\r\n3，查询时不必额外拼装tuple。写入时也不必拆分。\r\n	IOT使用场景：1，查询基本使用key。 2，除了index key之外表比较短小。 3，尽量少的second index。\r\n从BEAS理论来说这两点都是满足的。\r\n\r\npostgresql不支持IOT可能有两方面原因：\r\n1，通常IOT实现在index上增加可见信息，这与pg目前框架区别太大，代价非常高。\r\n2，IOT适用场景比较有限。\r\n\r\n\r\n如果将index最底层的page换成heap会怎样？\r\n或者说index不变，只是其指向的不再是tuple，而是page。逻辑上会发生什么变化。\r\n\r\n或者说成稀疏index，whatever？ 这样heap里面的tuple格式就与目标一致了，且insert不必总是更新两个页面。\r\n而版本清理后续还能通过undo机制优化。\r\n\r\nIOT的玩法对于scan也是一样，总是index scan。或者说这并非传统意义上的indexscan，这就是ac scan。\r\n如果能用索引，就直接定位到具体的heap page，如果不能，就从最左边的heap page开始。\r\n\r\nheap page仅支持单向扫描，干掉左边的指针。也可不支持指向parent，使得btree代码可以完全重用。\r\n\r\n优点：\r\n1，通常只需更新heap，可加快更新速度。\r\n2，砍掉了index头部，节省部分空间\r\n3，查询时不必额外拼装tuple。写入时也不必拆分。\r\n
149	901	attr	subject	PG wal格式	PG wal
151	910	attr	description	索引记录的存储结构为\r\nX|Y|Z\r\nZ = heap header | count | pkid, Z是定长结构。\r\n\r\n该方案只需在中间层做些手脚就可以了，不改btree，也不改heap。\r\n\r\n\r\n	索引记录的存储结构为\r\nX|Y|Z\r\nZ = heap header | count | pkid, Z是定长结构。\r\n\r\n该方案只需在中间层做些手脚就可以了，不改btree，也不改heap。\r\n\r\n记录格式调整为:\r\nIndexTupleData + [ | IndexAttributeBitMapData] + [ | HeapHeaderData] + fields\r\n使用info长度为0的方式表达。或\r\n\r\n
152	911	attr	description	索引记录的存储结构为\r\nX|Y|Z\r\nZ = heap header | count | pkid, Z是定长结构。\r\n\r\n该方案只需在中间层做些手脚就可以了，不改btree，也不改heap。\r\n\r\n记录格式调整为:\r\nIndexTupleData + [ | IndexAttributeBitMapData] + [ | HeapHeaderData] + fields\r\n使用info长度为0的方式表达。或\r\n\r\n	索引记录的存储结构为\r\nX|Y|Z\r\nZ = heap header | count | pkid, Z是定长结构。\r\n\r\n该方案只需在中间层做些手脚就可以了，不改btree，也不改heap。\r\n\r\n记录格式调整为:\r\nIndexTupleData + [ | IndexAttributeBitMapData] + [ | HeapHeaderData] + fields\r\n\r\n使用ItemPointerData的offset最高位表示是否为AC，对于该offset的使用一定要小心。\r\n
154	913	attr	description	索引记录的存储结构为\r\nX|Y|Z\r\nZ = heap header | count | pkid, Z是定长结构。\r\n\r\n该方案只需在中间层做些手脚就可以了，不改btree，也不改heap。\r\n\r\n记录格式调整为:\r\nIndexTupleData + [ | IndexAttributeBitMapData] + [ | HeapHeaderData] + fields\r\n\r\n使用ItemPointerData的offset最高位表示是否为AC，对于该offset的使用一定要小心。\r\n这样可直接返回heapTuple。\r\n\r\n\r\n	索引记录的存储结构为\r\nX|Y|Z\r\nZ = heap header | count | pkid, Z是定长结构。\r\n\r\n该方案只需在中间层做些手脚就可以了，不改btree，也不改heap。\r\n\r\n记录格式调整为:\r\nIndexTupleData + [ | IndexAttributeBitMapData] + [ | HeapHeaderData] + fields\r\n\r\n使用ItemPointerData的offset最高位表示是否为AC，对于该offset的使用一定要小心。\r\n这样可直接返回heapTuple。 HeapHeaderData中null部分是变长的。\r\n\r\n\r\n
164	947	attr	status_id	4	12
165	952	attr	description	log_destination 语义并不准确，实际上是log格式。配置了stderr，但是下面配置collector，以及文件就能输出到指定文件。\r\n\r\n#log_destination = 'csvlog'\t\t# Valid values are combinations of\r\n\t\t\t\t\t# stderr, csvlog, syslog, and eventlog,\r\n\t\t\t\t\t# depending on platform.  csvlog\r\n\t\t\t\t\t# requires logging_collector to be on.\r\n\r\n# This is used when logging to stderr:\r\nlogging_collector = on\t\t# Enable capturing of stderr and csvlog\r\n\t\t\t\t\t# into log files. Required to be on for\r\n\t\t\t\t\t# csvlogs.\r\n\t\t\t\t\t# (change requires restart)\r\n\r\n# These are only used if logging_collector is on:\r\nlog_directory = 'pg_log'\t\t\t# directory where log files are written,\r\n\t\t\t\t\t# can be absolute or relative to PGDATA\r\nlog_filename = 'postgresql-%Y-%m-%d_%H%M%S.log'\t# log file name pattern,\r\n\t\t\t\t\t# can include strftime() escapes\r\nlog_file_mode = 0640\t\t\t# creation mode for log files,\r\n\t\t\t\t\t# begin with 0 to use octal notation\r\n#log_truncate_on_rotation = off\t\t# If on, an existing log file with the\r\n\t\t\t\t\t# same name as the new log file will be\r\n\t\t\t\t\t# truncated rather than appended to.\r\n\t\t\t\t\t# But such truncation only occurs on\r\n\t\t\t\t\t# time-driven rotation, not on restarts\r\n\t\t\t\t\t# or size-driven rotation.  Default is\r\n\t\t\t\t\t# off, meaning append to existing files\r\n\t\t\t\t\t# in all cases.\r\nlog_rotation_age = 2d\t\t\t# Automatic rotation of logfiles will\r\n\t\t\t\t\t# happen after that time.  0 disables.\r\nlog_rotation_size = 100MB\t\t# Automatic rotation of logfiles will\r\n\t\t\t\t\t# happen after that much log output.\r\n\t\t\t\t\t# 0 disables.	log_destination 语义并不准确，实际上是log格式。配置了stderr，但是下面配置collector，以及文件就能输出到指定文件。\r\n\r\n<pre><code class="text">\r\n#log_destination = 'csvlog'\t\t# Valid values are combinations of\r\n\t\t\t\t\t# stderr, csvlog, syslog, and eventlog,\r\n\t\t\t\t\t# depending on platform.  csvlog\r\n\t\t\t\t\t# requires logging_collector to be on.\r\n\r\n# This is used when logging to stderr:\r\nlogging_collector = on\t\t# Enable capturing of stderr and csvlog\r\n\t\t\t\t\t# into log files. Required to be on for\r\n\t\t\t\t\t# csvlogs.\r\n\t\t\t\t\t# (change requires restart)\r\n\r\n# These are only used if logging_collector is on:\r\nlog_directory = 'pg_log'\t\t\t# directory where log files are written,\r\n\t\t\t\t\t# can be absolute or relative to PGDATA\r\nlog_filename = 'postgresql-%Y-%m-%d_%H%M%S.log'\t# log file name pattern,\r\n\t\t\t\t\t# can include strftime() escapes\r\nlog_file_mode = 0640\t\t\t# creation mode for log files,\r\n\t\t\t\t\t# begin with 0 to use octal notation\r\n#log_truncate_on_rotation = off\t\t# If on, an existing log file with the\r\n\t\t\t\t\t# same name as the new log file will be\r\n\t\t\t\t\t# truncated rather than appended to.\r\n\t\t\t\t\t# But such truncation only occurs on\r\n\t\t\t\t\t# time-driven rotation, not on restarts\r\n\t\t\t\t\t# or size-driven rotation.  Default is\r\n\t\t\t\t\t# off, meaning append to existing files\r\n\t\t\t\t\t# in all cases.\r\nlog_rotation_age = 2d\t\t\t# Automatic rotation of logfiles will\r\n\t\t\t\t\t# happen after that time.  0 disables.\r\nlog_rotation_size = 100MB\t\t# Automatic rotation of logfiles will\r\n\t\t\t\t\t# happen after that much log output.\r\n\t\t\t\t\t# 0 disables.\r\n</code></pre>\r\n
166	956	attr	subject	PG CI_v3	PG CI_v2 vacuum&analyze
169	960	attr	status_id	4	12
125	791	attr	description	我们都知道一个缺乏原动力的人是多么的无趣，做事情没有认真严谨态度，对结果无所谓。我们在自己热爱的事情上难以容忍这样的搭档存在。\r\n我们可以有很多美好的目标，并且知道这些目标可以达到。只要我们行动起来，不断逼近。\r\n我们不因别人的好恶影响自己的选择，我们选择是因为我们的目标如此，我们不愿错过美好。\r\n\r\n成功方法论\r\n激励自己的目标 + 逻辑机器构建项目 + 彻底解决项目运转的各个细节问题(一个领域常见疑难问题可能就上千规模)。\r\n\r\n成熟检验方法：\r\n一个人只有当自己完全自由时，直面压力，掌控自己达成目标。才算真正成长起来，成为那个可以在前面遮风挡雨，独当一面的人。\r\n\r\n病痛分析：\r\n每个人因成长环境，原生家庭，可能形成恐惧，麻木，软弱不自信，无力，懒散，安全感缺失，依赖，放纵等等毛病。\r\n焦虑是因为有风险，有风险是因为能力不够或预期不实际。\r\n	我们都知道一个缺乏原动力的人是多么的无趣，做事情没有认真严谨态度，对结果无所谓。我们在自己热爱的事情上难以容忍这样的搭档存在。\r\n我们可以有很多美好的目标，并且知道这些目标可以达到。只要我们行动起来，不断逼近。\r\n我们不因别人的好恶影响自己的选择，我们选择是因为我们的目标如此，我们不愿错过美好。\r\n\r\n成功方法论\r\n激励自己的目标 + 逻辑机器构建项目 + 彻底解决项目运转的各个细节问题(一个领域常见疑难问题可能就上千规模)。\r\n\r\n成熟检验方法：\r\n一个人只有当自己完全自由时，直面压力，掌控自己达成目标。才算真正成长起来，成为那个可以在前面遮风挡雨，独当一面的人。\r\n\r\n病痛分析：\r\n每个人因成长环境，原生家庭，可能形成恐惧，麻木，软弱不自信，无力，懒散，安全感缺失，依赖，放纵等等毛病。\r\n焦虑是因为有风险，有风险是因为能力不够或预期不实际。\r\n不去制定目标通常是因为缺乏自信，或者没有痛感，对自己的成长对世界的探索丧失了兴趣。
127	793	attr	description	我们都知道一个缺乏原动力的人是多么的无趣，做事情没有认真严谨态度，对结果无所谓。我们在自己热爱的事情上难以容忍这样的搭档存在。\r\n我们可以有很多美好的目标，并且知道这些目标可以达到。只要我们行动起来，不断逼近。\r\n我们不因别人的好恶影响自己的选择，我们选择是因为我们的目标如此，我们不愿错过美好。\r\n我们不去假设自己成为那个最优秀的人，也许天生环境我们无法达到。但我们可以在自己热爱的方向上不断前进，这就足够美好了。\r\n\r\n成功方法论\r\n激励自己的目标 + 逻辑机器构建项目 + 彻底解决项目运转的各个细节问题(一个领域常见疑难问题可能就上千规模)。\r\n\r\n成熟检验方法：\r\n一个人只有当自己完全自由时，直面压力，掌控自己达成目标。才算真正成长起来，成为那个可以在前面遮风挡雨，独当一面的人。\r\n\r\n病痛分析：\r\n每个人因成长环境，原生家庭，可能形成恐惧，麻木，软弱不自信，无力，懒散，安全感缺失，依赖，放纵等等毛病。\r\n焦虑是因为有风险，有风险是因为能力不够或预期不实际。\r\n不去制定目标通常是因为缺乏自信，或者没有痛感，对自己的成长对世界的探索丧失了兴趣。	我们都知道一个缺乏原动力的人是多么的无趣，做事情没有认真严谨态度，对结果无所谓。我们在自己热爱的事情上难以容忍这样的搭档存在。\r\n我们可以有很多美好的目标，并且知道这些目标可以达到。有了激动人心的目标，我们就可以发挥自己的智慧提升自己的效率，自动思考相关问题，我们可以行动起来，不断逼近。\r\n我们不因别人的好恶影响自己的选择，我们选择是因为我们的目标如此，我们不愿错过美好。\r\n我们不去假设自己成为那个最优秀的人，也许天生环境我们无法达到。但我们可以在自己热爱的方向上不断前进，这就足够美好了。\r\n\r\n成功方法论\r\n激励自己的目标 + 逻辑机器构建项目 + 彻底解决项目运转的各个细节问题(一个领域常见疑难问题可能就上千规模)。\r\n\r\n成熟检验方法：\r\n一个人只有当自己完全自由时，直面压力，掌控自己达成目标。才算真正成长起来，成为那个可以在前面遮风挡雨，独当一面的人。\r\n\r\n病痛分析：\r\n每个人因成长环境，原生家庭，可能形成恐惧，麻木，软弱不自信，无力，懒散，安全感缺失，依赖，放纵等等毛病。\r\n焦虑是因为有风险，有风险是因为能力不够或预期不实际。\r\n不去制定目标通常是因为缺乏自信，或者没有痛感，对自己的成长对世界的探索丧失了兴趣。
128	795	attachment	31	\N	2019年5月12日母亲节感恩会.jpg
129	798	attr	subject	2019/5/12日母亲节活动总结	2019年5月12日母亲节活动总结
131	800	attr	tracker_id	8	6
132	800	attr	done_ratio	\N	0
133	801	attr	tracker_id	8	6
134	801	attr	done_ratio	\N	0
136	811	attr	project_id	17	23
137	818	attr	description	IO模型\r\n内存数据组织\r\n{\r\n   数据变更的通知\r\n   淘汰机制\r\n}\r\n磁盘数据组织\r\n数据的编解码\r\n事务机制\r\n{\r\n  并发控制\r\n  {\r\n    锁在内存的实现\r\n    锁的层次\r\n\t锁的类型\r\n  }\r\n  一致性保证\r\n  {\r\n    redo机制：提交则数据必然成功修改\r\n  }\r\n  隔离级别\r\n}\r\n数据保护\r\n{\r\n    多版本\r\n    快照\r\n    备份\r\n    容灾\r\n    防篡改\r\n}\r\n副本数据同步\r\n数据分布\r\nGC	IO模型\r\n内存数据组织\r\n{\r\n   数据变更的通知\r\n   淘汰机制\r\n   数据加载，数据加载需要锁保护，数据访问也需要锁保护。\r\n}\r\n磁盘数据组织\r\n数据的编解码\r\n事务机制\r\n{\r\n  并发控制\r\n  {\r\n    锁在内存的实现\r\n    锁的层次\r\n\t锁的类型\r\n  }\r\n  一致性保证\r\n  {\r\n    redo机制：提交则数据必然成功修改\r\n  }\r\n  隔离级别\r\n}\r\n数据保护\r\n{\r\n    多版本\r\n    快照\r\n    备份\r\n    容灾\r\n    防篡改\r\n}\r\n副本数据同步\r\n数据分布\r\nGC
138	823	attr	description	聚簇索引，其数据根据索引顺序组织，因而其btree的中间节点可指向页面，叶子节点就是实际数据。\r\n非聚簇索引，叶子节点存的是tid。\r\n\r\n\r\n<pre><code class="text">\r\n1、大多数表都应该有聚簇索引或使用分区来降低对表尾页的竞争，在一个高事务的环境中，对最后一页的封锁严重影响系统的吞吐量。\r\n2、在聚簇索引下，数据在物理上按顺序排在数据页上，重复值也排在一起，因而在那些包含范围检查(between、<、<=、>、>=)或使用group by或orderby的查询时，一旦找到具有范围中第一个键值的行，具有后续索引值的行保证物理上毗连在一起而不必进一步搜索，避免了大范围扫描，可以大大提高查询速度。\r\n3、在一个频繁发生插入操作的表上建立聚簇索引时，不要建在具有单调上升值的列(如IDENTITY)上，否则会经常引起封锁冲突。\r\n4、在聚簇索引中不要包含经常修改的列，因为码值修改后，数据行必须移动到新的位置。\r\n5、选择聚簇索引应基于where子句和连接操作的类型。\r\n</code></pre>\r\n	聚簇索引，其数据根据索引顺序组织，因而其btree的中间节点可指向页面，叶子节点就是实际数据。\r\n非聚簇索引，叶子节点存的是tid。\r\n\r\n\r\n<pre><code class="text">\r\n1、大多数表都应该有聚簇索引或使用分区来降低对表尾页的竞争，在一个高事务的环境中，对最后一页的封锁严重影响系统的吞吐量。\r\n\r\n2、在聚簇索引下，数据在物理上按顺序排在数据页上，重复值也排在一起，\r\n因而在那些包含范围检查(between、<、<=、>、>=)或使用group by或orderby的查询时，\r\n一旦找到具有范围中第一个键值的行，具有后续索引值的行保证物理上毗连在一起而不必进一步搜索，\r\n避免了大范围扫描，可以大大提高查询速度。\r\n\r\n3、在一个频繁发生插入操作的表上建立聚簇索引时，不要建在具有单调上升值的列(如IDENTITY)上，否则会经常引起封锁冲突。\r\n\r\n4、在聚簇索引中不要包含经常修改的列，因为码值修改后，数据行必须移动到新的位置。\r\n\r\n5、选择聚簇索引应基于where子句和连接操作的类型。\r\n</code></pre>\r\n
139	829	attr	description	Mysql编译：\r\n1，下载源代码\r\nhttps://github.com/mysql/mysql-server/tree/5.7\r\n2，下载boost 1.59\r\nhttps://www.boost.org/users/history/version_1_59_0.html\r\n\r\n3，安装ncurses\r\nyum install ncurses-devel\r\n\r\n4，mkdir build;cd build; cmake ../ -DWITH_BOOST=/root/boost_1_59_0/	Mysql编译：\r\n1，下载源代码\r\nhttps://github.com/mysql/mysql-server/tree/5.7\r\n2，下载boost 1.59\r\nhttps://www.boost.org/users/history/version_1_59_0.html\r\n\r\n3，安装ncurses\r\nyum install ncurses-devel\r\n\r\n4，mkdir build;cd build; cmake ../ -DWITH_BOOST=/root/boost_1_59_0/\r\n\r\n5，mysqld --initialize 初始化（5.7以后）\r\n\r\n6，在/var/log/mysql/error.log日志里面可以看到随机生成的root密码\r\n\r\n7，登录：mysql -uroot -p'GCIq<iXoo82j'\r\n\r\n8，修改用户\r\nhttps://blog.51cto.com/arthur376/1840353
140	857	attr	description	我将生生不息的参与2个游戏，一个是增强智慧与知识。另一个增强体魄与精气神。	我将生生不息的参与2个游戏，一个是增强智慧与知识。另一个增强体魄与精气神。\r\n再个就是强化沟通与交流，编织精彩网络。
141	864	attr	description	TID：tuple id\r\nXID：事务id\r\n	TID：tuple id\r\nXID：事务id\r\nLSN：log sequence number，记录在page上，用于确保wal机制.
143	871	attr	description	1，一个文件多大，如何切换文件	1，一个文件多大，如何切换文件\r\n这个实现在md中，_mdfd_segpath。pg对于relfilenode抽象：\r\ntypedef struct buftag\r\n{\r\n    RelFileNode rnode;            /* physical relation identifier */\r\n    ForkNumber    forkNum;\r\n    BlockNumber blockNum;        /* blknum relative to begin of reln */\r\n} BufferTag;\r\n\r\nforkNum：\r\n/*\r\n * The physical storage of a relation consists of one or more forks. The\r\n * main fork is always created, but in addition to that there can be\r\n * additional forks for storing various metadata. ForkNumber is used when\r\n * we need to refer to a specific fork in a relation.\r\n */\r\n因此我们可以定义自己的forkNum实现特殊的存储目的。\r\n\r\n对pg而言页的逻辑number是不断增加的，但是一个文件的大小受限于RELSEG_SIZE。默认是128k，这样一个segment不会超过1GB。
167	958	attr	subject	PG why need command ID	PG why need command ID 以及 Combo CommandID
168	959	attr	status_id	17	4
170	966	attr	subject	软件开发与打羽毛球	软件开发，羽毛球，江湖
171	974	attr	parent_id	\N	439
144	892	attr	description	如果将index最底层的page换成heap会怎样？\r\n或者说index不变，只是其指向的不再是tuple，而是page。逻辑上会发生什么变化。\r\n\r\n或者说成稀疏index，whatever？ 这样heap里面的tuple格式就与目标一致了，且insert不必总是更新两个页面。\r\n而版本清理后续还能通过undo机制优化。\r\n\r\nIOT的玩法对于scan也是一样，总是index scan。或者说这并非传统意义上的indexscan，这就是ac scan。\r\n如果能用索引，就直接定位到具体的heap page，如果不能，就从最左边的heap page开始。\r\n\r\nheap page仅支持单向扫描，干掉左边的指针。也可不支持指向parent，使得btree代码可以完全重用。\r\n	如果将index最底层的page换成heap会怎样？\r\n或者说index不变，只是其指向的不再是tuple，而是page。逻辑上会发生什么变化。\r\n\r\n或者说成稀疏index，whatever？ 这样heap里面的tuple格式就与目标一致了，且insert不必总是更新两个页面。\r\n而版本清理后续还能通过undo机制优化。\r\n\r\nIOT的玩法对于scan也是一样，总是index scan。或者说这并非传统意义上的indexscan，这就是ac scan。\r\n如果能用索引，就直接定位到具体的heap page，如果不能，就从最左边的heap page开始。\r\n\r\nheap page仅支持单向扫描，干掉左边的指针。也可不支持指向parent，使得btree代码可以完全重用。\r\n\r\n优点：\r\n1，通常只需更新heap，可加快更新速度。\r\n2，砍掉了index头部，节省部分空间\r\n3，查询时不必额外拼装tuple。写入时也不必拆分。\r\n
146	897	attr	description	如果将index最底层的page换成heap会怎样？\r\n或者说index不变，只是其指向的不再是tuple，而是page。逻辑上会发生什么变化。\r\n\r\n或者说成稀疏index，whatever？ 这样heap里面的tuple格式就与目标一致了，且insert不必总是更新两个页面。\r\n而版本清理后续还能通过undo机制优化。\r\n\r\nIOT的玩法对于scan也是一样，总是index scan。或者说这并非传统意义上的indexscan，这就是ac scan。\r\n如果能用索引，就直接定位到具体的heap page，如果不能，就从最左边的heap page开始。\r\n\r\nheap page仅支持单向扫描，干掉左边的指针。也可不支持指向parent，使得btree代码可以完全重用。\r\n\r\n优点：\r\n1，通常只需更新heap，可加快更新速度。\r\n2，砍掉了index头部，节省部分空间\r\n3，查询时不必额外拼装tuple。写入时也不必拆分。\r\n	IOT使用场景：1，查询基本使用key。 2，表比较短小。\r\n从BEAS理论来说这两点都是满足的。\r\n\r\n如果将index最底层的page换成heap会怎样？\r\n或者说index不变，只是其指向的不再是tuple，而是page。逻辑上会发生什么变化。\r\n\r\n或者说成稀疏index，whatever？ 这样heap里面的tuple格式就与目标一致了，且insert不必总是更新两个页面。\r\n而版本清理后续还能通过undo机制优化。\r\n\r\nIOT的玩法对于scan也是一样，总是index scan。或者说这并非传统意义上的indexscan，这就是ac scan。\r\n如果能用索引，就直接定位到具体的heap page，如果不能，就从最左边的heap page开始。\r\n\r\nheap page仅支持单向扫描，干掉左边的指针。也可不支持指向parent，使得btree代码可以完全重用。\r\n\r\n优点：\r\n1，通常只需更新heap，可加快更新速度。\r\n2，砍掉了index头部，节省部分空间\r\n3，查询时不必额外拼装tuple。写入时也不必拆分。\r\n
148	899	attr	description	IOT使用场景：1，查询基本使用key。 2，除了index key之外表比较短小。 3，尽量少的second index。\r\n从BEAS理论来说这两点都是满足的。\r\n\r\npostgresql不支持IOT可能有两方面原因：\r\n1，通常IOT实现在index上增加可见信息，这与pg目前框架区别太大，代价非常高。\r\n2，IOT适用场景比较有限。\r\n\r\n\r\n如果将index最底层的page换成heap会怎样？\r\n或者说index不变，只是其指向的不再是tuple，而是page。逻辑上会发生什么变化。\r\n\r\n或者说成稀疏index，whatever？ 这样heap里面的tuple格式就与目标一致了，且insert不必总是更新两个页面。\r\n而版本清理后续还能通过undo机制优化。\r\n\r\nIOT的玩法对于scan也是一样，总是index scan。或者说这并非传统意义上的indexscan，这就是ac scan。\r\n如果能用索引，就直接定位到具体的heap page，如果不能，就从最左边的heap page开始。\r\n\r\nheap page仅支持单向扫描，干掉左边的指针。也可不支持指向parent，使得btree代码可以完全重用。\r\n\r\n优点：\r\n1，通常只需更新heap，可加快更新速度。\r\n2，砍掉了index头部，节省部分空间\r\n3，查询时不必额外拼装tuple。写入时也不必拆分。\r\n	IOT使用场景：1，查询基本使用key。 2，除了index key之外表比较短小。 3，尽量少的second index。\r\n从BEAS理论来说这两点都是满足的。\r\n\r\npostgresql不支持IOT可能有两方面原因：\r\n1，通常IOT实现在index上增加可见信息，这与pg目前框架区别太大，代价非常高。\r\n2，IOT适用场景比较有限。\r\n\r\npostgresql clusterd index：\r\nhttps://www.postgresql.org/docs/10/sql-cluster.html\r\n这代价有点大，而且需使用命令触发。\r\n\r\n\r\n如果将index最底层的page换成heap会怎样？\r\n或者说index不变，只是其指向的不再是tuple，而是page。逻辑上会发生什么变化。\r\n\r\n或者说成稀疏index，whatever？ 这样heap里面的tuple格式就与目标一致了，且insert不必总是更新两个页面。\r\n而版本清理后续还能通过undo机制优化。\r\n\r\nIOT的玩法对于scan也是一样，总是index scan。或者说这并非传统意义上的indexscan，这就是ac scan。\r\n如果能用索引，就直接定位到具体的heap page，如果不能，就从最左边的heap page开始。\r\n\r\nheap page仅支持单向扫描，干掉左边的指针。也可不支持指向parent，使得btree代码可以完全重用。\r\n\r\n优点：\r\n1，通常只需更新heap，可加快更新速度。\r\n2，砍掉了index头部，节省部分空间\r\n3，查询时不必额外拼装tuple。写入时也不必拆分。\r\n
150	903	attr	subject	PG IOT	PG CI-IOT
153	912	attr	description	索引记录的存储结构为\r\nX|Y|Z\r\nZ = heap header | count | pkid, Z是定长结构。\r\n\r\n该方案只需在中间层做些手脚就可以了，不改btree，也不改heap。\r\n\r\n记录格式调整为:\r\nIndexTupleData + [ | IndexAttributeBitMapData] + [ | HeapHeaderData] + fields\r\n\r\n使用ItemPointerData的offset最高位表示是否为AC，对于该offset的使用一定要小心。\r\n	索引记录的存储结构为\r\nX|Y|Z\r\nZ = heap header | count | pkid, Z是定长结构。\r\n\r\n该方案只需在中间层做些手脚就可以了，不改btree，也不改heap。\r\n\r\n记录格式调整为:\r\nIndexTupleData + [ | IndexAttributeBitMapData] + [ | HeapHeaderData] + fields\r\n\r\n使用ItemPointerData的offset最高位表示是否为AC，对于该offset的使用一定要小心。\r\n这样可直接返回heapTuple。\r\n\r\n\r\n
155	926	attr	description	ac中大量重复的x和y是可以做压缩的。这样可以在很大程度上减小数据存储规模，同时保证其查找特性。\r\n这样将数据轻松放在SSD或内存中，爽爆	ac中大量重复的x和y是可以做压缩的。这样可以在很大程度上减小数据存储规模，同时保证其查找特性。\r\n最小化编码的可查找树，这样将数据轻松放在SSD或内存中，爽爆
156	928	attr	subject	数据交易市场	数据交易市场-让每个人获取更好的数据，让思考不再空穴来风
157	930	attr	description	评估方式：\r\n   时间复杂度\r\n   空间复杂度\r\n\r\n大维度：计算，存储，网络三大板块。\r\n   \r\n常用手段：\r\n   减小数据规模，砍掉不必要的东西\r\n   减少必须执行的步骤\r\n   优化每步的速度，使用不同的硬件，以及改进算法\r\n   批量执行\r\n   并行执行\r\n   预热处理，缓存技术，可以减少在重复执行时的一些步骤\r\n   副本技术，读写分离等减少资源冲突	评估方式：\r\n   时间复杂度\r\n   空间复杂度\r\n\r\n大维度：计算，存储，网络三大板块。\r\n   \r\n常用手段：\r\n   减小数据规模，砍掉不必要的东西\r\n   压缩减小存储空间\r\n   减少必须执行的步骤\r\n   优化每步的速度，使用不同的硬件，以及改进算法\r\n   批量执行\r\n   并行执行\r\n   预热处理，缓存技术，可以减少在重复执行时的一些步骤\r\n   副本技术，读写分离等减少资源冲突
158	939	attr	subject	工程师的工作套路	工程师的工作套路，效率
159	940	relation	relates	\N	465
160	941	relation	relates	\N	438
161	942	relation	relates	\N	439
162	943	relation	relates	\N	466
163	946	attr	status_id	17	4
172	992	attr	description	评估方式：\r\n   时间复杂度\r\n   空间复杂度\r\n\r\n大维度：计算，存储，网络三大板块。\r\n   \r\n常用手段：\r\n   减小数据规模，砍掉不必要的东西\r\n   压缩减小存储空间\r\n   减少必须执行的步骤\r\n   优化每步的速度，使用不同的硬件，以及改进算法\r\n   批量执行\r\n   并行执行\r\n   预热处理，缓存技术，可以减少在重复执行时的一些步骤\r\n   副本技术，读写分离等减少资源冲突	评估方式：\r\n   时间复杂度\r\n   空间复杂度\r\n\r\n大维度：计算，存储，网络三大板块。\r\n   \r\n常用手段：\r\n   减小数据规模，砍掉不必要的东西\r\n   压缩减小存储空间\r\n   减少必须执行的步骤\r\n   优化每步的速度，使用不同的硬件，以及改进算法\r\n   批量执行\r\n   并行执行\r\n   预热处理，缓存技术，可以减少在重复执行时的一些步骤\r\n   副本技术，读写分离等减少资源冲突\r\n   最小化锁冲突，无锁数据结构
\.


--
-- Name: journal_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.journal_details_id_seq', 172, true);


--
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) FROM stdin;
5	3	Issue	5	出现该问题的原因可能是io路径上有中间层没有重试机制导致的。\r\n虽然说tcp有丢包重传，但是超过一定次数之后，tcp也不再重试。所以出现hang必然是软件层错误处理存在问题。\r\n\r\n解决方法是在rgw这层增加超时重试机制。\r\n注意要区分一些情况：\r\n一个请求可能确实需要获取大量数据，比如同步非常大的对象，所以在获取到数据的时候，超时时间应该重置\r\n请求可能在rgw内部阻塞，所以如果仅处理网络超时，应该是针对linked request。	2017-09-10 12:05:14.431767	f
8	5	Issue	5	while (!marker_tracker->can_do_op(key) && (sync_status == 0)) 是修改之后的。\r\n之前是\r\nwhile (!marker_tracker->can_do_op(key)	2017-09-11 08:23:27.210021	f
10	3	Issue	5	超时给上层返回值 应该使用EAGAIN，不然RGWMetaSyncShardCR::incremental_sync 不会处理这种错误	2017-09-11 08:58:41.33899	f
11	3	Issue	5	测试方法：\r\n1，使用tc配置丢包率\r\ntc qdisc add dev eth0 root netem loss 30%\r\n\r\n2，使用s3.sh脚本循环创建1000 bucket，同步成功后再删除掉。\r\n\r\n观察是否有bucket没创建成功，或者没删除成功。	2017-09-11 11:52:33.226829	f
12	3	Issue	5	测试通过	2017-09-11 11:53:01.175772	f
13	3	Issue	5	提到到社区	2017-09-11 11:53:15.276353	f
15	5	Issue	5	<pre><code class="cpp">\r\nwhile (!marker_tracker->can_do_op(key) && (sync_status == 0)) {\r\n          if (!updated_status) {\r\n            set_status() << "can't do op, conflicting inflight operation";\r\n            updated_status = true;\r\n          }\r\n          ldout(sync_env->cct, 5) << *this << ": [inc sync] can't do op on key=" << key << " need to wait for conflicting operation to complete" << dendl;\r\n          yield wait_for_child();\r\n          bool again = true;\r\n          while (again) {\r\n            again = collect(&ret, lease_stack.get());\r\n            if (ret < 0) {\r\n              ldout(sync_env->cct, 0) << "ERROR: a child operation returned error (ret=" << ret << ")" << dendl;\r\n              sync_status = ret;\r\n              /* we have reported this error */\r\n            }\r\n          }\r\n        }\r\n\r\n        if (sync_status != 0) {\r\n          ldout(sync_env->cct, 0) << "ERROR:exit increment sync and retry" << dendl;\r\n          break;\r\n        }\r\n</code></pre>\r\n\r\n该日志确实可以打出来，说明确实存在这种情况。\r\n\r\n2017-09-11 09:23:02.805409 7fbc96bff700  5 _complete_request request http://172.18.0.100:8080/xx3/obj_23?rgwx-zonegroup=eefd67c0-f35e-4c99-a709-4e396cb84be6&rgwx-prepend-metadata=eefd67c0-f35e-4c99-a709-4e396cb84be6 complete -11\r\n2017-09-11 09:23:02.805417 7fbc96bff700  1  request timeout\r\n2017-09-11 09:23:02.805498 7fbc96bff700  0 store->fetch_remote_obj() returned r=-5\r\n2017-09-11 09:23:02.805569 7fbc837fd700  5 Sync:9e09ddca:data:Object:xx3:9e09ddca-a536-4951-89b5-d93aab87265e.4138.1:1/obj_23[0]:done, retcode=-5\r\n2017-09-11 09:23:02.805578 7fbc837fd700  0 ERROR: failed to sync object: xx3:9e09ddca-a536-4951-89b5-d93aab87265e.4138.1:1/obj_23\r\n2017-09-11 09:23:02.814598 7fbc837fd700  5 Sync:9e09ddca:data:Object:xx3:9e09ddca-a536-4951-89b5-d93aab87265e.4138.1:1/obj_23[0]:finish\r\n2017-09-11 09:23:02.814612 7fbc837fd700  0 ERROR: a child operation returned error (ret=-5)\r\n2017-09-11 09:23:02.814615 7fbc837fd700  0 ERROR:*exit increment sync and retry*\r\n\r\n\r\n重现方法：\r\n1，使用bi shard为4的bucket\r\n2，设置rgw_curl_timeout时间为20s\r\n3，使用tc，配置丢包率在30%，20%\r\n4，使用脚本密集写一些对象\r\n\r\n#!/bin/sh\r\n\r\nNUM=50\r\nCN=1\r\nwhile [ 1 == 1 ]; do\r\n    CN=1\r\n    while [ $CN -le $NUM ] ; \r\n    do\r\n        echo ${CN}\r\n        ./s3.sh upload_object ./s3.sh xx3 obj_${CN}\r\n    #sleep 1\r\n        CN=$((CN + 1))\r\n    done\r\ndone\r\n\r\n通过在日志中搜索"a child operation returned error"，如果出现该日志，在修复之前的版本就有可能出现hang的情况了。	2017-09-11 15:07:06.2593	f
9	5	Issue	5	使用tc模拟丢包来重现，但是需要一点就是后来上传的对象的名字要与之前的一样，否则不会走到这里。\r\n可以把bucket的shard搞小点，这样比较好测试\r\n\r\n测试的时候还发现另一种情况：\r\nRGWBucketShardIncrementalSyncCR的spwan stack都完成了，只剩lease stack，但是lease stack并未结束 （第一个发现时，lease stack结束了 retcode = -16）。\r\n同样卡在2573行，且该cr不会被调度了。	2017-09-11 08:31:22.917385	f
14	5	Issue	5	只要确保所有child stack错误处理应该就不会卡在这里。\r\nchild stack必然经过collect处理，所以parent总是能感知child上发生的错误。	2017-09-11 14:42:41.27964	f
21	8	Issue	5	然在来这里设置的\r\n\r\n<pre><code class="cpp">\r\nmode_t get_mode(headers_t& meta, const char* path, bool checkdir, bool forcedir)\r\n{\r\n  mode_t mode = 0;\r\n  bool isS3sync = false;\r\n  headers_t::const_iterator iter;\r\n\r\n  if(meta.end() != (iter = meta.find("x-amz-meta-mode"))){\r\n    mode = get_mode((*iter).second.c_str());\r\n  }else{\r\n    if(meta.end() != (iter = meta.find("x-amz-meta-permissions"))){ // for s3sync\r\n      mode = get_mode((*iter).second.c_str());\r\n      isS3sync = true;\r\n    }\r\n  }\r\n  // Checking the bitmask, if the last 3 bits are all zero then process as a regular\r\n  // file type (S_IFDIR or S_IFREG), otherwise return mode unmodified so that S_IFIFO,\r\n  // S_IFSOCK, S_IFCHR, S_IFLNK and S_IFBLK devices can be processed properly by fuse.\r\n  if(!(mode & S_IFMT)){\r\n    if(!isS3sync){\r\n      if(checkdir){\r\n        if(forcedir){\r\n          mode |= S_IFDIR;\r\n        }else{\r\n          if(meta.end() != (iter = meta.find("Content-Type"))){\r\n            string strConType = (*iter).second;\r\n            // Leave just the mime type, remove any optional parameters (eg charset)\r\n            string::size_type pos = strConType.find(";");\r\n            if(string::npos != pos){\r\n              strConType = strConType.substr(0, pos);\r\n            }\r\n            if(strConType == "application/x-directory"){\r\n              mode |= S_IFDIR;\r\n            }else if(path && 0 < strlen(path) && '/' == path[strlen(path) - 1]){\r\n              if(strConType == "binary/octet-stream" || strConType == "application/octet-stream"){\r\n                mode |= S_IFDIR;\r\n              }else{\r\n                if(complement_stat){\r\n                  // If complement lack stat mode, when the object has '/' charactor at end of name\r\n                  // and content type is text/plain and the object's size is 0 or 1, it should be\r\n                  // directory.\r\n                  off_t size = get_size(meta);\r\n                  if(strConType == "text/plain" && (0 == size || 1 == size)){\r\n                    mode |= S_IFDIR;\r\n                  }else{\r\n                    mode |= S_IFREG;\r\n                  }\r\n                }else{\r\n                  mode |= S_IFREG;\r\n                }\r\n              }\r\n            }else{\r\n              mode |= S_IFREG;\r\n            }\r\n          }else{\r\n            mode |= S_IFREG;\r\n          }\r\n        }\r\n      }\r\n      // If complement lack stat mode, when it's mode is not set any permission,\r\n      // the object is added minimal mode only for read permission.\r\n      if(complement_stat && 0 == (mode & (S_IRWXU | S_IRWXG | S_IRWXO))){\r\n        mode |= (S_IRUSR | (0 == (mode & S_IFDIR) ? 0 : S_IXUSR));\r\n      }\r\n    }else{\r\n      if(!checkdir){\r\n        // cut dir/reg flag.\r\n        mode &= ~S_IFDIR;\r\n        mode &= ~S_IFREG;\r\n      }\r\n    }\r\n  }\r\n  return mode;\r\n}\r\n</code></pre>\r\n	2017-09-12 19:34:19.497896	f
16	5	Issue	5	经测试问题得到解决	2017-09-11 20:34:12.784617	f
17	5	Issue	5		2017-09-11 20:34:30.828187	f
18	8	Issue	5	(gdb) p (char *)0x7f5b7c001d80 \r\n$19 = 0x7f5b7c001d80 "<?xml version=\\"1.0\\" encoding=\\"UTF-8\\"?><ListBucketResult xmlns=\\"http://s3.amazonaws.com/doc/2006-03-01/\\"><Name>xx1</Name><Prefix></Prefix><Marker></Marker><MaxKeys>1000</MaxKeys><Delimiter>/</Delimiter><IsTruncated>false</IsTruncated><Contents><Key>cr.dump</Key><LastModified>2017-09-12T09:57:51.565Z</LastModified><ETag>&quot;29ea96a1b63dc3596db60be0542cf1f1&quot;</ETag><Size>360968</Size><StorageClass>STANDARD</StorageClass><Owner><ID>nuser</ID><DisplayName>nuser</DisplayName></Owner></Contents><CommonPrefixes><Prefix>vv/</Prefix></CommonPrefixes></ListBucketResult>"\r\n\r\n\r\n这是一个正常的结果	2017-09-12 14:30:42.230703	f
22	8	Issue	5		2017-09-12 19:47:54.452545	f
23	8	Issue	5	 注意s3broswer的content-type是空的，head命令返回时没有携带该header\r\n 所以需要改的是这里\r\n     }else{\r\n           * if (path && 0 < strlen(path) && '/' == path[strlen(path) - 1])\r\n              mode |= S_IFDIR;\r\n            else\r\n              mode |= S_IFREG;*\r\n          }\r\n\r\n测试通过！	2017-09-12 19:49:50.53188	f
26	10	Issue	5	#1  0x00007f2ba368fe6a in Wait (mutex=..., this=0x7f2b53ccb0c0) at ./common/Cond.h:56\r\n#2  Throttle::_wait (this=this@entry=0x7f2b9d54cfd0, c=c@entry=4194304) at common/Throttle.cc:107\r\n#3  0x00007f2ba3690aa7 in Throttle::get (this=0x7f2b9d54cfd0, c=4194304, m=0) at common/Throttle.cc:177\r\n#4  0x00007f2ba35f0b25 in Objecter::_throttle_op (this=this@entry=0x7f2b9d54cb00, op=op@entry=0x7f2a24811c80, sul=..., op_budget=op_budget@entry=4194304) at osdc/Objecter.cc:3114\r\n#5  0x00007f2ba35fd3b8 in _take_op_budget (sul=..., op=0x7f2a24811c80, this=0x7f2b9d54cb00) at osdc/Objecter.h:1931\r\n#6  Objecter::_op_submit_with_budget (this=this@entry=0x7f2b9d54cb00, op=op@entry=0x7f2a24811c80, sul=..., ptid=ptid@entry=0x7f2a248b2b30, ctx_budget=ctx_budget@entry=0x0) at osdc/Objecter.cc:2154\r\n#7  0x00007f2ba35fd5bd in Objecter::op_submit (this=0x7f2b9d54cb00, op=op@entry=0x7f2a24811c80, ptid=ptid@entry=0x7f2a248b2b30, ctx_budget=ctx_budget@entry=0x0) at osdc/Objecter.cc:2138\r\n#8  0x00007f2ba35d2b80 in librados::IoCtxImpl::aio_operate_read (this=0x7f2b644aac00, oid=..., o=0x7f2b4a4fd100, c=0x7f2a248b2a80, flags=flags@entry=0, pbl=pbl@entry=0x0) at librados/IoCtxImpl.cc:749\r\n#9  0x00007f2ba359eb5f in librados::IoCtx::aio_operate (this=this@entry=0x7f2b5f3fc0c0, oid="bae868b8-766d-4963-b5ad-66f46cc22f87.27202.2__shadow_.Fm9FwIwFIy0-KODJi2AIl-GV2LYkFqg_95", c=c@entry=0x7f2a24890930, o=o@entry=0x7f2b5f3fc0d0, pbl=pbl@entry=0x0) at librados/librados.cc:1463\r\n#10 0x00007f2bae44f532 in RGWRados::get_obj_iterate_cb (this=0x7f2b9d52ac00, ctx=<optimized out>, astate=0x7f2a24881098, obj=..., obj_ofs=398458880, read_ofs=read_ofs@entry=0, len=4194304, is_head_obj=false, arg=arg@entry=0x7f2a24813a80) at rgw/rgw_rados.cc:9573\r\n#11 0x00007f2bae44fcee in _get_obj_iterate_cb (obj=..., obj_ofs=<optimized out>, read_ofs=0, len=<optimized out>, is_head_obj=<optimized out>, astate=<optimized out>, arg=0x7f2a24813a80) at rgw/rgw_rados.cc:9427\r\n#12 0x00007f2bae452ae4 in RGWRados::iterate_obj (this=this@entry=0x7f2b9d52ac00, obj_ctx=..., obj=..., ofs=398458880, ofs@entry=0, end=end@entry=419430399, max_chunk_size=4194304, iterate_obj_cb=iterate_obj_cb@entry=0x7f2bae44fcb0 <_get_obj_iterate_cb(rgw_obj&, off_t, off_t, off_t, bool, RGWObjState*, void*)>, arg=arg@entry=0x7f2a24813a80) at rgw/rgw_rados.cc:9677\r\n#13 0x00007f2bae452f22 in RGWRados::Object::Read::iterate (this=this@entry=0x7f2b5f3fc920, ofs=0, end=419430399, cb=cb@entry=0x7f2b5f3fc8b0) at rgw/rgw_rados.cc:9608\r\n#14 0x00007f2bae4042cb in RGWGetObj::execute (this=0x7f29cdd95600) at rgw/rgw_op.cc:1311\r\n#15 0x00007f2bae416128 in process_request (store=0x7f2b9d52ac00, rest=0x7ffefbf124b0, req=req@entry=0x7f29cdea9e80, client_io=client_io@entry=0x7f2b5f3fd710, olog=0x0) at rgw/rgw_process.cc:174\r\n#16 0x00007f2bb7eb4140 in RGWFCGXProcess::handle_request (this=0x7f2b9d5bc300, r=0x7f29cdea9e80) at rgw/rgw_fcgi_process.cc:121\r\n#17 0x00007f2bb7eb5a90 in RGWProcess::RGWWQ::_process (this=0x7f2b9d5bc5b8, req=0x7f29cdea9e80) at rgw/rgw_process.h:85\r\n#18 0x00007f2bae7743de in ThreadPool::worker (this=0x7f2b9d5bc370, wt=0x7f2b6480e1c0) at common/WorkQueue.cc:128\r\n#19 0x00007f2bae7752c0 in ThreadPool::WorkThread::entry (this=<optimized out>) at common/WorkQueue.h:445\r\n#20 0x00007f2bad76edc5 in start_thread () from /lib64/libpthread.so.0\r\n#21 0x00007f2bacd7a21d in clone () from /lib64/libc.so.6\r\n\r\n\r\n\r\n#0  0x00007f2bad7726d5 in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0\r\n#1  0x00007f2ba359db41 in Wait (mutex=..., this=0x7f2b96d6fed8) at ./common/Cond.h:56\r\n#2  wait_for_safe_and_cb (this=0x7f2b96d6fe80) at ./librados/AioCompletionImpl.h:111\r\n#3  librados::AioCompletion::wait_for_safe_and_cb (this=this@entry=0x7f2b96c0e7e0) at librados/librados.cc:1011\r\n#4  0x00007f2bae452f60 in wait_next_io (done=<synthetic pointer>, this=0x7f2b96c4d800) at rgw/rgw_rados.cc:9303\r\n#5  RGWRados::Object::Read::iterate (this=this@entry=0x7f2b01f86920, ofs=0, end=419430399, cb=cb@entry=0x7f2b01f868b0) at rgw/rgw_rados.cc:9615\r\n#6  0x00007f2bae4042cb in RGWGetObj::execute (this=0x7f29f14e5e00) at rgw/rgw_op.cc:1311\r\n#7  0x00007f2bae416128 in process_request (store=0x7f2b9d52ac00, rest=0x7ffefbf124b0, req=req@entry=0x7f29cde32740, client_io=client_io@entry=0x7f2b01f87710, olog=0x0) at rgw/rgw_process.cc:174\r\n#8  0x00007f2bb7eb4140 in RGWFCGXProcess::handle_request (this=0x7f2b9d5bc300, r=0x7f29cde32740) at rgw/rgw_fcgi_process.cc:121\r\n#9  0x00007f2bb7eb5a90 in RGWProcess::RGWWQ::_process (this=0x7f2b9d5bc5b8, req=0x7f29cde32740) at rgw/rgw_process.h:85\r\n#10 0x00007f2bae7743de in ThreadPool::worker (this=0x7f2b9d5bc370, wt=0x7f2b6482dd00) at common/WorkQueue.cc:128\r\n#11 0x00007f2bae7752c0 in ThreadPool::WorkThread::entry (this=<optimized out>) at common/WorkQueue.h:445\r\n#12 0x00007f2bad76edc5 in start_thread () from /lib64/libpthread.so.0\r\n#13 0x00007f2bacd7a21d in clone () from /lib64/libc.so.6\r\n\r\n\r\n\r\n#0  0x00007f846a3386d5 in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0\r\n#1  0x00007f846b32d02a in Wait (mutex=..., this=0x7f8421829b00) at ./common/Cond.h:56\r\n#2  Throttle::_wait (this=this@entry=0x7f84454306f8, c=c@entry=4194304) at common/Throttle.cc:107\r\n#3  0x00007f846b32dc67 in Throttle::get (this=this@entry=0x7f84454306f8, c=c@entry=4194304, m=m@entry=0) at common/Throttle.cc:177\r\n#4  0x00007f846b01518c in RGWRados::get_obj_iterate_cb (this=0x7f845a12ac00, ctx=<optimized out>, astate=0x7f84454a3098, obj=..., obj_ofs=20971520, read_ofs=read_ofs@entry=0, len=4194304, is_head_obj=false, arg=arg@entry=0x7f8445430580) at rgw/rgw_rados.cc:9557\r\n#5  0x00007f846b015cee in _get_obj_iterate_cb (obj=..., obj_ofs=<optimized out>, read_ofs=0, len=<optimized out>, is_head_obj=<optimized out>, astate=<optimized out>, arg=0x7f8445430580) at rgw/rgw_rados.cc:9427\r\n#6  0x00007f846b018ae4 in RGWRados::iterate_obj (this=this@entry=0x7f845a12ac00, obj_ctx=..., obj=..., ofs=20971520, ofs@entry=0, end=end@entry=419430399, max_chunk_size=4194304, iterate_obj_cb=iterate_obj_cb@entry=0x7f846b015cb0 <_get_obj_iterate_cb(rgw_obj&, off_t, off_t, off_t, bool, RGWObjState*, void*)>, arg=arg@entry=0x7f8445430580) at rgw/rgw_rados.cc:9677\r\n#7  0x00007f846b018f22 in RGWRados::Object::Read::iterate (this=this@entry=0x7f83f1bf1920, ofs=0, end=419430399, cb=cb@entry=0x7f83f1bf18b0) at rgw/rgw_rados.cc:9608\r\n#8  0x00007f846afca2cb in RGWGetObj::execute (this=0x7f8421519a00) at rgw/rgw_op.cc:1311\r\n#9  0x00007f846afdc128 in process_request (store=0x7f845a12ac00, rest=0x7fff6d6d7300, req=req@entry=0x7f82722cc540, client_io=client_io@entry=0x7f83f1bf2710, olog=0x0) at rgw/rgw_process.cc:174\r\n#10 0x00007f8474a7a140 in RGWFCGXProcess::handle_request (this=0x7f845a1bc300, r=0x7f82722cc540) at rgw/rgw_fcgi_process.cc:121\r\n#11 0x00007f8474a7ba90 in RGWProcess::RGWWQ::_process (this=0x7f845a1bc5b8, req=0x7f82722cc540) at rgw/rgw_process.h:85\r\n#12 0x00007f846b33a3de in ThreadPool::worker (this=0x7f845a1bc370, wt=0x7f84214196a0) at common/WorkQueue.cc:128\r\n#13 0x00007f846b33b2c0 in ThreadPool::WorkThread::entry (this=<optimized out>) at common/WorkQueue.h:445\r\n#14 0x00007f846a334dc5 in start_thread () from /lib64/libpthread.so.0\r\n#15 0x00007f846994021d in clone () from /lib64/libc.so.6\r\n\r\n一些throttle	2017-09-25 15:37:06.235366	f
232	76	Issue	5	没了unlink instance之后，删除delete marker成了一个问题。 通用路径上需要get到对象才能删除。\r\n但是delete marker又比较特殊。\r\n\r\n搞到单机功能可用，就合入。	2018-07-04 13:43:27.790996	f
234	76	Issue	5	干掉rgw_bucket_entry_ver	2018-07-06 11:36:45.598122	f
236	76	Issue	5	delete_at， if_match, if_not_match 标记的处理	2018-07-06 12:44:01.359579	f
237	76	Issue	5	*实现gc*	2018-07-06 12:54:48.978748	f
240	79	Issue	5	obj_tag改为使用instance，rados instance，作为对象的唯一标识。\r\n\r\n在读取对象信息时，将删除掉的obj读取出来怎么样？\r\n但是这样就得读取多次。\r\n\r\n在成功之后，直接调用cls_get 接口获取需要delete的entry。但是并非总是一个。比如修改bi成功之后，添加到gc失败了。 下次来就有更多的delete。\r\n\r\n	2018-07-11 13:32:44.361288	f
319	98	Issue	5	定义每个文档的负责人。\r\n定义清楚人的工作职责	2018-09-17 09:50:26.339011	f
604	216	Issue	5	支持模拟运行，可对接本地的rocksdb和目录运行。\r\n支持性能统计，以及故障随机注入等。	2019-02-16 14:38:05.603978	f
19	8	Issue	5	<?xml version=\\"1.0\\" encoding=\\"UTF-8\\"?><ListBucketResult xmlns=\\"http://s3.amazonaws.com/doc/2006-03-01/\\"><Name>xx1</Name><Prefix></Prefix><Marker></Marker><MaxKeys>1000</MaxKeys><Delimiter>/</Delimiter><IsTruncated>false</IsTruncated><Contents><Key>cr.dump</Key><LastModified>2017-09-12T09:57:51.565Z</LastModified><ETag>&quot;29ea96a1b63dc3596db60be0542cf1f1&quot;</ETag><Size>360968</Size><StorageClass>STANDARD</StorageClass><Owner><ID>nuser</ID><DisplayName>nuser</DisplayName></Owner></Contents><CommonPrefixes><Prefix>ddd/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>vv/</Prefix></CommonPrefixes></ListBucketResult>\r\n\r\n异常时，s3fs收到的数据，其中ddd应该是目录\r\n\r\n而且调试也是走的dir\r\nBreakpoint 2, S3ObjList::insert (this=this@entry=0x7f5b894df930, name=name@entry=0x7f5b8417e570 "ddd", etag=0x0, is_dir=is_dir@entry=true) at s3fs_util.cpp:76\r\n76\ts3fs_util.cpp: No such file or directory.\r\n(gdb) c\r\nContinuing.\r\n\r\nBreakpoint 2, S3ObjList::insert (this=this@entry=0x7f5b894df930, name=name@entry=0x7f5b8417e570 "vv", etag=0x0, is_dir=is_dir@entry=true) at s3fs_util.cpp:76\r\n76\tin s3fs_util.cpp\r\n(gdb) c\r\nContinuing.\r\n\r\n但是显示的却是：\r\n[root@localhost s3fs-fuse-1.82]# ls -l /tmp/xx2\r\ntotal 354\r\n----------. 1 root root 360968 Sep 12 05:57 cr.dump\r\n----------. 1 root root      0 Sep 12 06:15 ddd\r\nd---------. 1 root root      0 Sep 12 04:58 vv	2017-09-12 15:46:18.396585	f
20	8	Issue	5	172.18.0.1 - - [12/Sep/2017:13:30:36 +0000] "GET /xx1?prefix=&max-keys=1000&delimiter=%2F HTTP/1.1" 200 697 "-" "CloudBerryLab.Base.HttpUtil.Client 5.0.3 (http://www.cloudberrylab.com/)" "-"\r\n172.18.0.1 - - [12/Sep/2017:13:30:40 +0000] "HEAD /xx1/kk/ HTTP/1.1" 404 0 "-" "CloudBerryLab.Base.HttpUtil.Client 5.0.3 (http://www.cloudberrylab.com/)" "-"\r\n172.18.0.1 - - [12/Sep/2017:13:30:40 +0000] "PUT /xx1/kk/ HTTP/1.1" 200 0 "-" "CloudBerryLab.Base.HttpUtil.Client 5.0.3 (http://www.cloudberrylab.com/)" "-"\r\n172.18.0.1 - - [12/Sep/2017:13:30:40 +0000] "GET /xx1?prefix=&max-keys=1000&delimiter=%2F HTTP/1.1" 200 750 "-" "CloudBerryLab.Base.HttpUtil.Client 5.0.3 (http://www.cloudberrylab.com/)" "-"\r\n172.18.0.1 - - [12/Sep/2017:13:30:48 +0000] "GET /xx1/?delimiter=/&max-keys=1000&prefix= HTTP/1.1" 200 750 "-" "s3fs/1.80 (commit hash unknown; OpenSSL)" "-"\r\n172.18.0.1 - - [12/Sep/2017:13:31:14 +0000] "HEAD /xx1/kk/ HTTP/1.1" 200 0 "-" "s3fs/1.80 (commit hash unknown; OpenSSL)" "-"\r\n\r\n这是gdb调试的过程，可见s3fs做了一次cache，新创建的目录kk执行了HEAD命令。	2017-09-12 19:03:36.596826	f
24	9	Issue	5	处理的handle是RGWHandler_REST_Service_S3 就是list bucket的请求handle\r\n\r\n但是这个handler并没有OPTIONS方法。所以返回值的是405. 请求被禁止	2017-09-14 16:02:19.517578	f
25	10	Issue	5	100个cosbench并发读取400M文件：\r\n\r\nop1: read \t748 ops \t313.73 GB \t43431.18 ms \t11828.07 ms \t1.68 op/s \t703.79 MB/S \t74.8% \r\n\r\n第二次记录100并发：\r\nop1: read \t740 ops \t310.38 GB \t48013.19 ms \t17354.92 ms \t1.56 op/s \t655.66 MB/S \t74% \r\n\r\n50个并发：\r\nop1: read \t280 ops \t117.44 GB \t27852.87 ms \t3414.41 ms \t0.79 op/s \t329.62 MB/S \t56% \r\n\r\n第二次50并发测试\r\nop1: read \t319 ops \t133.8 GB \t25651.13 ms \t4085.41 ms \t0.92 op/s \t386.41 MB/S \t63.8%\r\n\r\n再次记录50并发：\r\nop1: read \t385 ops \t161.48 GB \t28168.32 ms \t1363.48 ms \t1.23 op/s \t516.76 MB/S \t77% \r\n\r\n\r\n疑问;带宽都跑不满，为什么还有这么多超时？\r\n\r\n后面再跑 性能又上来了，同样的压力\r\n\r\nop1: read \t500 ops \t209.72 GB \t19276.92 ms \t1787.86 ms \t2.6 op/s \t1.09 GB/S \t100% \r\n\r\ncosbench测试波动非常大，是不是有请求阻塞了呢？ 目前有什么手段分析超时请求么？	2017-09-25 13:17:05.910798	f
27	10	Issue	5	civetweb效果：\r\n50并发：\r\nop1: read \t500 ops \t209.72 GB \t17371.17 ms \t1123.35 ms \t2.88 op/s \t1.21 GB/S \t100% \r\n100并发\r\nop1: read \t1 kops \t      419.43 GB \t35341.8 ms \t2156.81 ms \t2.83 op/s \t1.19 GB/S \t100% \r\n\r\n100个callback线程，16在调用send， 84个在throttle wait。即便这样还能把带宽跑满。\r\n不知道他们的流控参数怎样，何以都不处于流控状态？\r\n\r\nop1: read \t2 kops \t838.86 GB \t73014.83 ms \t4020.73 ms \t2.74 op/s \t1.15 GB/S \t100% \r\n看不懂cosbench的超时到底是多久？\r\n看来s3的请求也不是sb形式的.中间能收到数据包可能不会超时。\r\n\r\n"get": 2000,\r\n        "get_b": 8190000,\r\n        "get_initial_lat": {\r\n            "avgcount": 2000,\r\n            "sum": 30.675071437  （时间单位是s）\r\n        },\r\n	2017-09-25 21:23:14.88661	f
29	10	Issue	5	java.net.SocketTimeoutException: Read timed out\r\n        at java.net.SocketInputStream.socketRead0(Native Method)\r\n        at java.net.SocketInputStream.socketRead(Unknown Source)\r\n        at java.net.SocketInputStream.read(Unknown Source)\r\n        at java.net.SocketInputStream.read(Unknown Source)\r\n        at org.apache.http.impl.io.AbstractSessionInputBuffer.read(AbstractSessionInputBuffer.java:198)\r\n        at org.apache.http.impl.io.ContentLengthInputStream.read(ContentLengthInputStream.java:178)\r\n        at org.apache.http.conn.EofSensorInputStream.read(EofSensorInputStream.java:137)\r\n        at com.amazonaws.internal.SdkFilterInputStream.read(SdkFilterInputStream.java:72)\r\n        at com.amazonaws.event.ProgressInputStream.read(ProgressInputStream.java:151)\r\n        at com.amazonaws.internal.SdkFilterInputStream.read(SdkFilterInputStream.java:72)\r\n        at com.amazonaws.services.s3.model.S3ObjectInputStream.read(S3ObjectInputStream.java:155)\r\n        at com.amazonaws.internal.SdkFilterInputStream.read(SdkFilterInputStream.java:72)\r\n堆栈在这里	2017-09-26 15:58:56.652481	f
28	10	Issue	5	civetweb不适合做高性能服务器，但是这种大快可能也不存在问题。 \r\n\r\n谢锐(x8671r@163.com)  11:48:21\r\n我测试cosbench 400并发读400MB文件 在civetweb下都没超时。只是延迟增大了很多\r\nop1: read \t4 kops \t1.68 TB \t144089.9 ms \t7844.06 ms \t2.78 op/s \t1.16 GB/S \t100% \r\n谢锐(x8671r@163.com)  11:50:04\r\n看来cosbench超时并不是看的处理总时间 可能是看多久都没回任何应答\r\n\r\n使用3个cosbench dirver跑效果差不多，600并发。延迟200多s，也出现超时了\r\nop1: read \t3.09 kops \t1.3 TB \t207271.57 ms \t12194.16 ms \t2.54 op/s \t1.07 GB/S \t85.89%\r\n\r\n\r\n所以这个问题原因基本可以排除是单纯的civetweb性能问题。\r\n有多种可能：\r\n1，网卡带宽不够，压力过大\r\n2，civetweb在hammer版本存在bug\r\n3，业务模型比我们测试更加复杂，受业务模型影响。\r\n\r\n还需要定位的问题是为什么fastcgi的表现这么差，就算50并发也有超时？ 我觉得可能跟并发数量的限制有点关系。\r\n网络没到瓶颈，rados osd节点也没压力，那只能是nginx 或者rgw有性能问题了。\r\n	2017-09-26 07:30:39.88514	f
30	11	Issue	5	该环境上出现主板损坏，在恢复之后，osd被拉起几分钟后出现了时间变化。大约隔了8个小时	2017-09-29 12:36:24.73952	f
31	11	Issue	5	bucket index记录条数达到10万级别时，scrub和recovery这个对象需要多久，这个需要验证下。\r\n如果时间过长，可能得想办法缩小bucket index。\r\n\r\n经验证，一个bucket index内10万数据秒间完成。难道是总对象数量太少了？	2017-09-30 07:34:39.771971	f
32	12	Issue	5	2017-10-09 02:22:29.246669 7f47d4bfe700 10 received header:HTTP/1.1 400 Bad Request\r\n2017-10-09 02:22:29.246673 7f47d4bfe700 10 receive_http_header\r\n2017-10-09 02:22:29.246673 7f47d4bfe700 10 received header:content-type: text/plain; charset=UTF-8\r\n2017-10-09 02:22:29.246678 7f47d4bfe700 10 receive_http_header\r\n2017-10-09 02:22:29.246679 7f47d4bfe700 10 received header:content-length: 126\r\n	2017-10-09 08:07:17.420433	f
251	82	Issue	5	输出V5.2.0迭代计划。	2018-07-23 08:01:24.421458	f
33	12	Issue	5	从tcpdump结果看，json格式数据并没问题。看来可能是/导致的。\r\n如何验证呢\r\n\r\n{\r\n                "_index": "rgw-china-f9fc7c72", \r\n                "_type": "object", \r\n                "_id": "99c3ac9e-e654-4fd9-9f9f-4a68eb74240e.4147.1:xie.png:null", \r\n                "_score": 1, \r\n                "_source": {\r\n                    "bucket": "xxx1", \r\n                    "name": "xie.png", \r\n                    "instance": "", \r\n                    "versioned_epoch": 0, \r\n                    "owner": {\r\n                        "id": "nuser", \r\n                        "display_name": "nuser"\r\n                    }, \r\n                    "permissions": [\r\n                        "nuser"\r\n                    ], \r\n                    "meta": {\r\n                        "size": 2062, \r\n                        "mtime": "2017-09-22T03:10:20.822Z", \r\n                        "content_type": "image/png", \r\n                        "etag": "faaee68556e04f6000f68d8c85dac00b", \r\n                        "x-amz-acl": "private", \r\n                        "x-amz-copy-source": "/xxx1/xie.png", \r\n                        "x-amz-date": "Fri, 22 Sep 2017 03:21:05 GMT", \r\n                        "x-amz-metadata-directive": "REPLACE", \r\n                        "x-amz-storage-class": "STANDARD"\r\n                    }\r\n                }\r\n            }, \r\n\r\n这个结构怎么来的。\r\n\r\n"_index": "rgw-china-f9fc7c72", \r\n"_type": "object", \r\n"_id": "99c3ac9e-e654-4fd9-9f9f-4a68eb74240e.4147.1:xie.png:null", \r\n"_score": 1, \r\n"_source"\r\n这部分是es的元数据	2017-10-09 12:17:27.095247	f
35	12	Issue	5	  string get_obj_path(const RGWBucketInfo& bucket_info, const rgw_obj_key& key) {\r\n    string id;\r\n    url_encode(key.name, id);\r\n    return index_path +  "/object/" + bucket_info.bucket.bucket_id + ":" + id + ":" + (key.instance.empty() ? "null" : key.instance);\r\n  }\r\n \r\n  加个url_encode 看看	2017-10-09 15:27:13.461325	f
37	13	Issue	5	增加分词符号也许是一个解决办法。	2017-10-10 12:19:39.770212	f
39	13	Issue	5	文件名称的分词方法，规则可以更多。比如. / 都可以作为分词符号，不仅是空格。	2017-10-10 12:45:46.072892	f
41	13	Issue	5	keyword字段类型不对，并且要选择合适的analyzer。\r\n\r\n修改方法：\r\n1，修改字段类型，使用text\r\n2，修改默认的分词器，使用中文分词\r\n\r\n每个字段定义分词方式有点难受。	2017-10-10 14:18:24.074706	f
42	14	Issue	5	用法不对，少了--    但是radosgw-admin没提示\r\n\r\nbin/radosgw-admin zone modify --rgw-zone=SZES --endpoints=http://172.18.0.130:8082	2017-10-11 07:34:19.775305	f
45	16	Issue	5	不仅通知可能丢失，30s一次的记录data log也是不可靠的。\r\n但是这不影响最终的数据同步，只是同步的时间可能被拉的非常长。	2017-10-11 13:21:34.464854	f
47	15	Issue	5	修复es的bug\r\n多版本的详细介绍\r\nEC实现的详细介绍\r\n	2017-10-13 13:08:55.209733	f
48	18	Issue	5		2017-10-16 13:16:26.772704	f
49	18	Issue	5	NotifyMessage携带编解码问题。\r\n定义notify的type，提供encode/decode方法\r\n\r\n每个notify的type，提供处理方法\r\ntemplate <typename I>\r\nbool ImageWatcher<I>::handle_payload\r\n\r\nAcquireRequest是什么？ImageCtx header如何刷新？\r\nAioImageRequestWQ::_void_dequeue在这里面判断了，只是代码架构调整了。\r\n\r\n增加了类ImageState\r\n\r\n如果需要refresh，那么就在refresh成功之后，才把普通op丢到处理队列。\r\n\r\nImageWatcher还搞一个泛型，真是日了狗了。\r\n\r\nrbd命令参数--help看不到：\r\nvoid get_add_arguments(po::options_description *positional,\r\n                       po::options_description *options) {\r\n  at::add_image_spec_options(positional, options, at::ARGUMENT_MODIFIER_NONE);\r\n  add_id_option(positional);\r\n  options->add_options()\r\n    ("shared", po::value<std::string>(), "shared lock tag");\r\n}\r\n日了，这是。泛型搞的source insight基本没法看c++了\r\nvoid add_id_option(po::options_description *positional) {\r\n  positional->add_options()\r\n    ("lock-id", "unique lock id");\r\n}\r\nbin/rbd lock add lock-id mylock --image xr1\r\n\r\n\r\n这个lock特性就是给单边使用的。rbd map等，只能一个节点可以读写。	2017-10-16 15:39:27.942695	f
51	18	Issue	5	有个奇怪的现象 一个sqlite打开db之后，会主动抢占锁。\r\n另外一个继续操作就会报：\r\nsqlite> .tables\r\nError: database disk image is malformed\r\n\r\n但是并不退出。\r\n\r\n但数据库实际上并未损坏，只是没法读写而已。	2017-10-18 14:02:23.952447	f
55	19	Issue	5	es同步情况：\r\n\r\n{\r\n        "key": 14,\r\n        "val": {\r\n            "status": "incremental-sync",\r\n            "full_marker": {\r\n                "position": {\r\n                    "name": "aabbcc.mp3",\r\n                    "instance": "null"\r\n                },\r\n                "count": 1\r\n            },\r\n            "inc_marker": {\r\n                "position": "00000000023.30.3"\r\n            }\r\n        }\r\n    },\r\n\r\nmaster zone，bilog也是到这里\r\n\r\n{\r\n        "op_id": "14#00000000021.27.10",\r\n        "op_tag": "0000000059e481eau3291g7c0ld3z0fq",\r\n        "op": "link_olh",\r\n        "object": "aabbcc.mp3",\r\n        "instance": "4npayy3yx56tp1uy-sSS3gqgGM6F9pv",\r\n        "state": "complete",\r\n        "index_ver": 21,\r\n        "timestamp": "2017-10-16 09:54:50.097805579Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 2\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n\r\n2017-10-19 07:27:20.551952 7f2a9bbff700 20 parsed entry: id=00000000059.341.9 iter->object=sds-osd.rar iter->instance=hqrRIfstpKnCSxqdg05oo.BXlgjo08P name=sds-osd.rar instance= ns=\r\n2017-10-19 07:27:20.551955 7f2a9bbff700 20 [inc sync] skipping object: xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6:20/sds-osd.rar[hqrRIfstpKnCSxqdg05oo.BXlgjo08P]: squashed operation\r\n\r\n居然link_olh的bilog被squashed了。\r\n显然有bug\r\nhttp://tracker.ceph.com/issues/18208\r\n	2017-10-19 13:51:41.141199	f
50	18	Issue	5	看来可以想办法借用上lock exclusive特性。这个是为lun的互斥访问量身定做的。\r\n先摸清楚用法\r\n\r\ntemplate <typename I>\r\nvoid ReacquireRequest<I>::set_cookie() {\r\n  CephContext *cct = m_image_ctx.cct;\r\n  ldout(cct, 10) << dendl;\r\n\r\n  librados::ObjectWriteOperation op;\r\n  rados::cls::lock::set_cookie(&op, RBD_LOCK_NAME, LOCK_EXCLUSIVE, m_old_cookie,\r\n                               ExclusiveLock<>::WATCHER_LOCK_TAG, m_new_cookie);\r\n\r\n  librados::AioCompletion *rados_completion = create_rados_safe_callback<\r\n    ReacquireRequest<I>, &ReacquireRequest<I>::handle_set_cookie>(this);\r\n  int r = m_image_ctx.md_ctx.aio_operate(m_image_ctx.header_oid,\r\n                                         rados_completion, &op);\r\n  assert(r == 0);\r\n  rados_completion->release();\r\n}\r\n\r\n测试用例中有用法。\r\n\r\nsqlite open：\r\nopen\r\nacquire lock\r\n\r\nclose\r\nrelease lock\r\n\r\nom：\r\ncheck lock\r\nbreak lock\r\n\r\n需要验证一下	2017-10-17 15:13:51.330058	f
56	19	Issue	5		2017-10-19 14:05:53.381769	f
34	12	Issue	5	\r\n解决方法\r\n没有约束.可以使用正斜杠.但是为了在REST API中使用这样的id,它必须被url编码:\r\n\r\n$ curl -XPUT "localhost:9200/id-test-index/rec/1+1%2F2" -d '{"field" : "one and a half"}'\r\n这个方法好使。\r\n例如：\r\ncurl -XPUT http://172.18.0.151:9200/rgw-china-f9fc7c72/object/99c3ac9e-e654-4fd9-9f9f-4a68eb74240e.4147.1:test3%2F:jerry -d '{"field" : "test3/jerry"}'\r\n\r\nname如果不使用全名，怎么找到对象？ 如果使用全名，是否影响搜索？\r\n搜索通常不会使用目录名吧，\r\n[root@localhost ~]# curl -XGET 172.18.0.151:9200/_search?q=field:jerry\r\n{"took":4,"timed_out":false,"_shards":{"total":20,"successful":20,"failed":0},"hits":{"total":1,"max_score":0.25811607,"hits":[{"_index":"rgw-china-f9fc7c72","_type":"object","_id":"99c3ac9e-e654-4fd9-9f9f-4a68eb74240e.4147.1:test3/:jerry","_score":0.25811607,"_source":{"field" : "test3/jerry"}}]}}\r\n\r\n[root@localhost ~]# curl -XGET 172.18.0.151:9200/_search?q=field:test3/jerry\r\n{"error":{"root_cause":[{"type":"query_shard_exception","reason":"Failed to parse query [field:test3/jerry]","index_uuid":"-XlvdsplTayDFIwREo0N7g","index":"rgw-china-95fdffb3"},{"type":"query_shard_exception","reason":"Failed to parse query [field:test3/jerry]","index_uuid":"69sFlh-SSN-knd0l1iHMbQ","index":"rgw-china-f9fc7c72"}],"type":"search_phase_execution_exception","reason":"all shards failed","phase":"query","grouped":true,"failed_shards":[{"shard":0,"index":"rgw-china-95fdffb3","node":"rog_3_rvTj6Kj04ZbcpOwA","reason":{"type":"query_shard_exception","reason":"Failed to parse query [field:test3/jerry]","index_uuid":"-XlvdsplTayDFIwREo0N7g","index":"rgw-china-95fdffb3","caused_by":{"type":"parse_exception","reason":"Cannot parse 'field:test3/jerry': Lexical error at line 1, column 18.  Encountered: <EOF> after : \\"/jerry\\"","caused_by":{"type":"token_mgr_error","reason":"Lexical error at line 1, column 18.  Encountered: <EOF> after : \\"/jerry\\""}}}},{"shard":0,"index":"rgw-china-f9fc7c72","node":"rog_3_rvTj6Kj04ZbcpOwA","reason":{"type":"query_shard_exception","reason":"Failed to parse query [field:test3/jerry]","index_uuid":"69sFlh-SSN-knd0l1iHMbQ","index":"rgw-china-f9fc7c72","caused_by":{"type":"parse_exception","reason":"Cannot parse 'field:test3/jerry': Lexical error at line 1, column 18.  Encountered: <EOF> after : \\"/jerry\\"","caused_by":{"type":"token_mgr_error","reason":"Lexical error at line 1, column 18.  Encountered: <EOF> after : \\"/jerry\\""}}}}]},"status":400}[root@localhost ~]# \r\n[root@localhost ~]# \r\n[root@localhost ~]# curl -XGET 172.18.0.151:9200/_search?q=field:test3%2Fjerry\r\n{"error":{"root_cause":[{"type":"query_shard_exception","reason":"Failed to parse query [field:test3/jerry]","index_uuid":"-XlvdsplTayDFIwREo0N7g","index":"rgw-china-95fdffb3"},{"type":"query_shard_exception","reason":"Failed to parse query [field:test3/jerry]","index_uuid":"69sFlh-SSN-knd0l1iHMbQ","index":"rgw-china-f9fc7c72"}],"type":"search_phase_execution_exception","reason":"all shards failed","phase":"query","grouped":true,"failed_shards":[{"shard":0,"index":"rgw-china-95fdffb3","node":"rog_3_rvTj6Kj04ZbcpOwA","reason":{"type":"query_shard_exception","reason":"Failed to parse query [field:test3/jerry]","index_uuid":"-XlvdsplTayDFIwREo0N7g","index":"rgw-china-95fdffb3","caused_by":{"type":"parse_exception","reason":"Cannot parse 'field:test3/jerry': Lexical error at line 1, column 18.  Encountered: <EOF> after : \\"/jerry\\"","caused_by":{"type":"token_mgr_error","reason":"Lexical error at line 1, column 18.  Encountered: <EOF> after : \\"/jerry\\""}}}},{"shard":0,"index":"rgw-china-f9fc7c72","node":"rog_3_rvTj6Kj04ZbcpOwA","reason":{"type":"query_shard_exception","reason":"Failed to parse query [field:test3/jerry]","index_uuid":"69sFlh-SSN-knd0l1iHMbQ","index":"rgw-china-f9fc7c72","caused_by":{"type":"parse_exception","reason":"Cannot parse 'field:test3/jerry': Lexical error at line 1, column 18.  Encountered: <EOF> after : \\"/jerry\\"","caused_by":{"type":"token_mgr_error","reason":"Lexical error at line 1, column 18.  Encountered: <EOF> after : \\"/jerry\\""}}}}]},"status":400}\r\n\r\n这样是不支持的，转移了这样用也不行\r\n	2017-10-09 13:02:59.686813	f
36	12	Issue	5	该方案似乎可行 需要进一步测试。\r\n	2017-10-10 11:50:36.729748	f
38	13	Issue	5	董雷(836444522)  15:04:48\r\nname用的是match\r\n谢锐(x8671r@163.com)  15:06:06\r\n[root@localhost ~]#  curl -XGET 172.18.0.151:9200/_search -d '{"query":{"match":{"name":"2.5版本性能测试报告_64_release2.xlsx"}}}'\r\n{"took":2,"timed_out":false,"_shards":{"total":20,"successful":20,"failed":0},"hits":{"total":1,"max_score":0.9808292,"hits":[{"_index":"rgw-china-95fdffb3","_type":"object","_id":"99c3ac9e-e654-4fd9-9f9f-4a68eb74240e.4147.1:2.5版本性能测试报告_64_release2.xlsx:null","_score":0.9808292,"_source":{"bucket":"xxx1","name":"2.5版本性能测试报告_64_release2.xlsx","instance":"","versioned_epoch":0,"owner":{"id":"nuser","display_name":"nuser"},"permissions":["nuser"],"meta":{"size":33664,"mtime":"2017-10-10T06:42:05.024Z","content_type":"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet","etag":"8739cde1c900a41a2e204a50a68c98c3","x-amz-date":"Tue, 10 Oct 2017 06:53:46 GMT"}}}]}}[root@localhost ~]# \r\n[root@localhost ~]#  curl -XGET 172.18.0.151:9200/_search -d '{"query":{"match":{"name":"性能测试"}}}'\r\n{"took":1,"timed_out":false,"_shards":{"total":20,"successful":20,"failed":0},"hits":{"total":0,"max_score":null,"hits":[]}}[root@localhost ~]# \r\n像这种我用全名也可以检索到，但是用部分检索不到	2017-10-10 12:38:12.496754	f
40	13	Issue	5	[root@localhost ~]# curl -XGET 172.18.0.151:9200/rgw-china-f9fc7c72?pretty=1\r\n{\r\n  "rgw-china-f9fc7c72" : {\r\n    "aliases" : { },\r\n    "mappings" : {\r\n      "object" : {\r\n        "properties" : {\r\n          "bucket" : {\r\n            "type" : "keyword"\r\n          },\r\n          "field" : {\r\n            "type" : "text",\r\n            "fields" : {\r\n              "keyword" : {\r\n                "type" : "keyword",\r\n                "ignore_above" : 256\r\n              }\r\n            }\r\n          },\r\n          "instance" : {\r\n            "type" : "keyword"\r\n          },\r\n          "meta" : {\r\n            "properties" : {\r\n              "cache_control" : {\r\n                "type" : "keyword"\r\n              },\r\n              "content_disposition" : {\r\n                "type" : "keyword"\r\n              },\r\n              "content_encoding" : {\r\n                "type" : "keyword"\r\n              },\r\n              "content_language" : {\r\n                "type" : "keyword"\r\n              },\r\n              "content_type" : {\r\n                "type" : "keyword"\r\n              },\r\n              "custom-date" : {\r\n                "type" : "nested",\r\n                "properties" : {\r\n                  "name" : {\r\n                    "type" : "keyword"\r\n                  },\r\n                  "value" : {\r\n                    "type" : "date"\r\n                  }\r\n                }\r\n              },\r\n              "custom-int" : {\r\n                "type" : "nested",\r\n                "properties" : {\r\n                  "name" : {\r\n                    "type" : "keyword"\r\n                  },\r\n                  "value" : {\r\n                    "type" : "long"\r\n                  }\r\n                }\r\n              },\r\n              "custom-string" : {\r\n                "type" : "nested",\r\n                "properties" : {\r\n                  "name" : {\r\n                    "type" : "keyword"\r\n                  },\r\n                  "value" : {\r\n                    "type" : "keyword"\r\n                  }\r\n                }\r\n              },\r\n              "etag" : {\r\n                "type" : "keyword"\r\n              },\r\n              "expires" : {\r\n                "type" : "keyword"\r\n              },\r\n              "mtime" : {\r\n                "type" : "date"\r\n              },\r\n              "size" : {\r\n                "type" : "long"\r\n              },\r\n              "x-amz-acl" : {\r\n                "type" : "text",\r\n                "fields" : {\r\n                  "keyword" : {\r\n                    "type" : "keyword",\r\n                    "ignore_above" : 256\r\n                  }\r\n                }\r\n              },\r\n              "x-amz-copy-source" : {\r\n                "type" : "text",\r\n                "fields" : {\r\n                  "keyword" : {\r\n                    "type" : "keyword",\r\n                    "ignore_above" : 256\r\n                  }\r\n                }\r\n              },\r\n              "x-amz-date" : {\r\n                "type" : "text",\r\n                "fields" : {\r\n                  "keyword" : {\r\n                    "type" : "keyword",\r\n                    "ignore_above" : 256\r\n                  }\r\n                }\r\n              },\r\n              "x-amz-metadata-directive" : {\r\n                "type" : "text",\r\n                "fields" : {\r\n                  "keyword" : {\r\n                    "type" : "keyword",\r\n                    "ignore_above" : 256\r\n                  }\r\n                }\r\n              },\r\n              "x-amz-storage-class" : {\r\n                "type" : "text",\r\n                "fields" : {\r\n                  "keyword" : {\r\n                    "type" : "keyword",\r\n                    "ignore_above" : 256\r\n                  }\r\n                }\r\n              }\r\n            }\r\n          },\r\n          "name" : {\r\n            "type" : "keyword"\r\n          },\r\n          "owner" : {\r\n            "properties" : {\r\n              "display_name" : {\r\n                "type" : "text",\r\n                "fields" : {\r\n                  "keyword" : {\r\n                    "type" : "keyword",\r\n                    "ignore_above" : 256\r\n                  }\r\n                }\r\n              },\r\n              "id" : {\r\n                "type" : "text",\r\n                "fields" : {\r\n                  "keyword" : {\r\n                    "type" : "keyword",\r\n                    "ignore_above" : 256\r\n                  }\r\n                }\r\n              }\r\n            }\r\n          },\r\n          "permissions" : {\r\n            "type" : "text",\r\n            "fields" : {\r\n              "keyword" : {\r\n                "type" : "keyword",\r\n                "ignore_above" : 256\r\n              }\r\n            }\r\n          },\r\n          "versioned_epoch" : {\r\n            "type" : "long"\r\n          }\r\n        }\r\n      }\r\n    },\r\n    "settings" : {\r\n      "index" : {\r\n        "creation_date" : "1505983035961",\r\n        "number_of_shards" : "10",\r\n        "number_of_replicas" : "1",\r\n        "uuid" : "69sFlh-SSN-knd0l1iHMbQ",\r\n        "version" : {\r\n          "created" : "5050299"\r\n        },\r\n        "provided_name" : "rgw-china-f9fc7c72"\r\n      }\r\n    }\r\n  }\r\n}	2017-10-10 13:05:40.591471	f
43	14	Issue	5	咱不解决	2017-10-11 07:35:08.973809	f
44	13	Issue	5	ok了，默认分词也可以分辨中文。\r\n\r\n将name字段改为text类型即可。	2017-10-11 08:27:39.307885	f
46	17	Issue	5	暂时不解决	2017-10-13 13:07:12.097834	f
52	18	Issue	5	sh-4.2# bin/rbd lock rm lock-id "auto 140330338880752" 1 -p sys client.4343\r\nrbd: too many arguments\r\nsh-4.2# bin/rbd lock rm lock-id "auto 139858966235872" --image image1 --pool test-librbd-localhost.localdomain-4668-1 client.4270^C\r\nsh-4.2# bin/rbd lock rm lock-id "auto 140330338880752" --image 1 -p sys client.4343\r\n\r\n莫名其妙的用法，还有如果在read/write的时候检查lock，那么进入直接就退出了。这好像也符合预期。\r\n什么乱七八槽的玩意，抢锁到底发生在哪里？\r\n\r\nsh-4.2# bin/rbd lock list 1-journal -p sys\r\nThere is 1 exclusive lock on this image.\r\nLocker      ID                   Address                  \r\nclient.4343 auto 140330338916640 172.18.0.130:0/346161615 \r\nsh-4.2# bin/rbd lock rm lock-id "auto 140330338916640" --image 1-journal -p sys client.4343\r\nsh-4.2# bin/rbd lock list 1-journal -p sys\r\n	2017-10-18 15:16:29.694772	f
53	18	Issue	5	还有个问题  sqlite3正常退出不会释放锁。\r\n\r\n似乎没有走正常的shutdown流程。但是这个框架基本上可以用了。\r\n\r\n在另一个进程打开rbd image的情况下，新的客户端无法打开。\r\n但是如果另外一个进程挂了，那么经过一旦时间后，可以打开。\r\n\r\n当然可以禁止访问，这是最重要的。	2017-10-18 15:36:26.369932	f
54	19	Issue	5	这问题非必现，但是有另外一个问题。\r\n董雷环境配置了一个业务rgw（没有启动run_sync_thread），一个es同步的rgw。\r\n\r\nes的rgw无法同步元数据。因为master zone没有sync 	2017-10-19 09:11:48.042713	f
58	19	Issue	5		2017-10-19 14:08:52.888829	f
57	19	Issue	5	创建一个bucket，上传一个大对象sds-osd.rar\r\n开启多版本，再次上传该对象。\r\n\r\nquery成功\r\n[root@localhost ceph]# curl -XGET 172.18.0.151:9200/_search?pretty=true -d '{"query":{"match":{"name":"sds-osd.rar"}}}'\r\n{\r\n  "took" : 3,\r\n  "timed_out" : false,\r\n  "_shards" : {\r\n    "total" : 30,\r\n    "successful" : 30,\r\n    "failed" : 0\r\n  },\r\n  "hits" : {\r\n    "total" : 2,\r\n    "max_score" : 2.8238168,\r\n    "hits" : [\r\n      {\r\n        "_index" : "rgw-china-4b191740",\r\n        "_type" : "object",\r\n        "_id" : "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4428.1:sds-osd.rar:null",\r\n        "_score" : 2.8238168,\r\n        "_source" : {\r\n          "bucket" : "xx6",\r\n          "name" : "sds-osd.rar",\r\n          "instance" : "",\r\n          "versioned_epoch" : 0,\r\n          "owner" : {\r\n            "id" : "nuser",\r\n            "display_name" : "nuser"\r\n          },\r\n          "permissions" : [\r\n            "nuser"\r\n          ],\r\n          "meta" : {\r\n            "size" : 57876485,\r\n            "mtime" : "2017-10-19T08:13:30.050Z",\r\n            "content_type" : "application/octet-stream",\r\n            "etag" : "651175b12c94bebfb80e6eab761c5a8b-7",\r\n            "x-amz-acl" : "private",\r\n            "x-amz-date" : "Thu, 19 Oct 2017 08:24:32 GMT"\r\n          }\r\n        }\r\n      },\r\n      {\r\n        "_index" : "rgw-china-4b191740",\r\n        "_type" : "object",\r\n        "_id" : "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4428.1:sds-osd.rar:KFWnBSg9DOPCarGXl-hnmfm-t-gfGTs",\r\n        "_score" : 0.51623213,\r\n        "_source" : {\r\n          "bucket" : "xx6",\r\n          "name" : "sds-osd.rar",\r\n          "instance" : "KFWnBSg9DOPCarGXl-hnmfm-t-gfGTs",\r\n          "versioned_epoch" : 2,\r\n          "owner" : {\r\n            "id" : "nuser",\r\n            "display_name" : "nuser"\r\n          },\r\n          "permissions" : [\r\n            "nuser"\r\n          ],\r\n          "meta" : {\r\n            "size" : 57876485,\r\n            "mtime" : "2017-10-19T08:15:57.109Z",\r\n            "content_type" : "application/octet-stream",\r\n            "etag" : "651175b12c94bebfb80e6eab761c5a8b-7",\r\n            "x-amz-acl" : "private",\r\n            "x-amz-date" : "Thu, 19 Oct 2017 08:26:59 GMT"\r\n          }\r\n        }\r\n      }\r\n    ]\r\n  }\r\n}	2017-10-19 14:08:40.756778	f
59	20	Issue	5	谢锐(x8671r@163.com)  16:47:38\r\nIK分词结果 bbc.jpg; bbc;  jpg\r\n董雷(836444522)  16:48:52\r\nIK是指不同的分析器吗\r\n谢锐(x8671r@163.com)  16:49:13\r\n嗯 分词器\r\n这种分词结果 应该可以按后缀搜索\r\n谢锐(x8671r@163.com)  16:52:08\r\n默认分词器中文分词效率也比较低  我们需要替换下分词器\r\n杉岩数据性能指标.xlsx\r\n杉,岩,数据,性能指标,性能,能指,指标,xlsx\r\n董雷(836444522)  16:54:58\r\n默认的是中文好像是一个字一个字分	2017-10-19 14:26:26.552275	f
60	23	Issue	5	[深圳]bluefish 2017/10/23 14:54:31\r\nLicense安全加固\r\n\r\n当前版本使用license方案的缺点：\r\n1）使用machine_id、有效期、容量等信息生成的license_key，其中加密信息编解码算法使用的参数一般比较固定，为machine_id中携带的CPU的个数，然而服务器CPU个数一般都比较固定\r\n2）当前machine_id算法比较单一，要不使用的是服务器的主板id，要不就是MAC地址生成的等信息，可能会造成节点machine_id相同\r\n3）对于machine_id相同的节点，则同一个license_key对该节点进行注册使用也是有效的\r\n\r\n新的方案：\r\n1）License_key生成：\r\n输入：series_number和machine_id，有效期、容量等\r\n其中 series_number用于编解码算法使用，machine_id和有效期以及容量等是用于被加密的信息\r\nseries_number= fsid + 厂家id + cluster_created_time\r\n输出：license_key\r\n2）machine_id的生成\r\nOSD启动时候获取cpu、board_id、mem、mac等硬件组合信息进行hash运算，然后对hash值进行MD5值校验，取12个字节，前两个字节预留为了以后做CPU控制使用，最后该信息发送给MON进行bootstrap操作\r\n3）license_key注册\r\nMON收到license注册请求，用集群 series_number信息将该license_key进行解码，如果解码出来的machine_id与MON内部的保存的相同，则认为该license_key是有效的，否则是无效的\r\n新方案的优点：\r\n1）不同的集群 series_number肯定是不同的，保证了编解码算法的不同\r\n2）保证了节点生成的machine_id的不同\r\n3）即使machine_id相同，因为 series_number不同，同一个license_key也不能在其他集群节点使用	2017-10-23 12:58:58.173119	f
61	24	Issue	5	curl -L -i -v -X PUT -H "Date: Tue, 24 Oct 2017 07:30:33 GMT" -H "Authorization: AWS BVDUBNIUOW0JM72RE9MQ:eRByi/+uumK+9At2i1M/10lgiyM=" -H "x-amz-copy-source:/xx5/quick.txt?=versionId=5nI5y.Hmr3qFJhKrDfCoQKbyzpSQmj6" "http://172.18.0.130:8080/xx5/quick.txt"\r\n\r\ncopy_object () {\r\n    source=$1\r\n    bucket=/$2\r\n    resource=/$3\r\n    version_id=$4\r\n    dateValue="`TZ=GMT date +'%a, %d %b %Y %H:%M:%S GMT'`"\r\n    stringToSign="PUT\\n\\n\\n${dateValue}\\nx-amz-copy-source:$source?versionId=${version_id}\\n${bucket}${resource}"\r\n    signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${Key} -binary | base64`\r\n    url="http://${host}${bucket}${resource}"\r\n    echo "begin copy bucket ${source} to ${url}"\r\n    cmd="curl -L -i -v -X PUT -H \\"Date: ${dateValue}\\" -H \\"Authorization: AWS ${Id}:${signature}\\" -H \\"x-amz-copy-source:$source?=versionId=${version_id}\\" \\"${url}\\""\r\n    echo "$cmd"\r\n    curl -L -i -v  -X PUT -H "Date: ${dateValue}" -H "Authorization: AWS ${Id}:${signature}" -H "x-amz-copy-source:$source?versionId=${version_id}" "${url}"\r\n    echo "end copy bucket"\r\n}\r\n\r\nx-amz-copy-source 加入到鉴权	2017-10-24 13:36:46.789251	f
62	24	Issue	5		2017-10-24 13:37:56.977452	f
63	24	Issue	5	s3命令使用curl请求作为客户端，调试还比较方便	2017-10-24 13:38:42.601743	f
64	22	Issue	5	目前采用了copy的方案，可以实现。\r\n\r\n将老的版本copy为当前版本。	2017-10-24 14:41:53.679564	f
100	29	Issue	5	测试出一个bug:\r\n\r\n先修改不带版本对象的acl，然后覆盖put一个对象。副本侧看同步完成，但是s3 browser看不到该版本。\r\n\r\n效果就相当于有具体版本的操作，但是没有olh操作，没有产生这种dir entry，但是有1000_的dir entry。\r\nsbsb.txt^@v906^@iqSjEL9lN1oDrqnifEEvdQ.D6NmiWVGA\r\nsbsb.txt^@v907^@iNoned93E3v5LpKMmmDlxJiPnDl2wLPT\r\n	2017-11-08 09:21:59.742747	f
66	25	Issue	5	logstash 如何使用呢？\r\n2个核心问题：\r\n1，怎么知道一个文件被处理完了？\r\n   我的需求是一个文件被处理了，并且长期没有变更，应该转移到其他目录。\r\n   方案1：\r\n   就按照logstash ignore_file的标准。在标记ignore的地方，转移到一个ignore的目录里面去。\r\n   方案2：\r\n   自己读取sincedb，根据文件名分析文件是否可能继续更新，如果不会，移到ignore目录。\r\n   \r\n2，文件的格式如何处理，格式化数据如何被更好的处理\r\n   这里给出了这个问题的解http://www.cnblogs.com/duanxuan/p/6517462.html	2017-10-25 12:21:09.388073	f
73	28	Issue	5	OPTION(rgw_usage_log_flush_threshold, OPT_INT, 1024) // threshold to flush pending log data\r\nOPTION(rgw_usage_log_tick_interval, OPT_INT, 30) // flush pending log data every X seconds\r\n\r\n这样看usage log跟datalog的规模差不多，bilog是最多的。\r\n\r\n都得考虑 trim的问题。而且bilog和bucket index在同样对象上面，影响可能比较大。	2017-10-27 07:43:06.461289	f
67	26	Issue	5	注意鉴权部分\r\n而且当前版本采用v4鉴权会报501 not implemented\r\n	2017-10-25 15:19:43.153252	f
68	26	Issue	5		2017-10-26 07:06:57.363681	f
69	27	Issue	5		2017-10-26 07:06:57.36687	f
70	24	Issue	5		2017-10-26 07:35:03.90107	f
72	25	Issue	5	input {\r\n    file {\r\n        path => ["/root/testlog/op*"]\r\n        type => "oplog"\r\n\tignore_older => 86400\r\n\tsincedb_path => "/root/logstash/oplog.sdb"\r\n        codec => json {\r\n            charset => "UTF-8"\r\n        } \r\n    }\r\n}\r\n\r\noutput {\r\n    elasticsearch {\r\n        hosts => ["172.18.0.151:9200"]\r\n        index => "logstash-rgw"\r\n        workers => 2\r\n        template_overwrite => true\r\n    }\r\n}	2017-10-26 13:35:35.994349	f
105	23	Issue	5		2017-11-08 13:28:26.275984	f
107	27	Issue	5	支持v4鉴权	2017-11-14 15:05:00.919454	f
109	36	Issue	5	没开多版本的bucket不支持回滚	2017-11-15 15:37:21.064511	f
252	82	Issue	5	申威编译(今晚投入)	2018-07-23 08:23:39.865665	f
255	82	Issue	5	考虑在pool名字到实际存储之间加一层映射？	2018-07-24 17:36:36.914398	f
321	98	Issue	5	海量小文件方案:\r\n设置bucket的rados shard数量。\r\n比如默认按5000万对象算，100个小文件合并为一个大文件。10kb~500kb文件，rados对象就是1M~50MB。\r\n总文件数50万。\r\n\r\n可支持动态修改。rados shard。但是之前的对象不会挪位置。	2018-09-17 17:20:27.853056	f
71	25	Issue	5	filewatch会打这个日志，可以帮助分辨，但需要打开logstash的日志\r\n\r\n@logger.debug? && @logger.debug("_discover_file: #{file}: skipping because it was last modified more than #{@ignore_older} seconds ago")\r\n\r\n[root@localhost ~]# cat /root/logstash/oplog.sdb \r\n106023883 0 64768 361\r\n[root@localhost ~]# file /root/testlog/oplog.2017-10-26 \r\n/root/testlog/oplog.2017-10-26: ASCII text, with very long lines\r\n[root@localhost ~]# ls -l /root/testlog/oplog.2017-10-26\r\n-rw-r--r--. 1 root root 361 Oct 26 14:41 /root/testlog/oplog.2017-10-26\r\n\r\nsincedb是明文的，可以写脚本分析日志是否处理完。也比较简单\r\n\r\n*注意使用vim修改文件，会重新parse文件。而echo "” 》 这种append方式不会。*\r\n\r\n[root@localhost logstash]# cat oplog.sdb \r\n106023883 0 64768 566\r\n106023882 0 64768 462\r\n106023884 0 64768 462\r\n106023885 0 64768 767\r\n其实是一个文件，但是vim打开写产生了新的inode。\r\nThe inode number (or equivalent).\r\nThe major device number of the file system (or equivalent).\r\nThe minor device number of the file system (or equivalent).\r\nThe current byte offset within the file.\r\n\r\n\r\n[root@localhost logstash]# cat oplog.sdb \r\n106023883 0 64768 566\r\n106023882 0 64768 462\r\n106023884 0 64768 462\r\n106023885 0 64768 767\r\n[root@localhost logstash]# ls -il /root/testlog/\r\ntotal 4\r\n106023885 -rw-r--r--. 1 root root 767 Oct 26 15:37 oplog.2017-10-26\r\n[root@localhost logstash]#\r\n根据inode清理	2017-10-26 09:16:20.475952	f
74	25	Issue	5	要支持自定义模板，数据类型。\r\n\r\n可自动识别数据类型。	2017-10-27 13:17:34.682376	f
84	20	Issue	5	{ \r\n"template" : "oplog_logstash*", \r\n"order":1,\r\n"settings" : { "index.refresh_interval" : "5s" }, \r\n"mappings" : { \r\n"_default_" : { \r\n"_all" : { "enabled" : false }, \r\n"dynamic_templates" : [{ \r\n"message_field" : { \r\n"match" : "message", \r\n"match_mapping_type" : "string", \r\n"mapping" : { "type" : "string", "index" : "analyzed" } \r\n} \r\n}, { \r\n"string_fields" : { \r\n"match" : "*", \r\n"match_mapping_type" : "string", \r\n"mapping" : { "type" : "string", "index" : "analyzed" } \r\n} \r\n}], \r\n"properties" : { \r\n"@version" : { "type" : "integer", "index" : "analyzed" }, \r\n"path" : { "type" : "string", "index" : "analyzed" },\r\n"host" : { "type" : "string", "index" : "analyzed" },\r\n"object" : { "type" : "text", "analyzer" : "ik_max_word" }\r\n} \r\n} \r\n}\r\n}\r\n\r\nik_max_word不是index，而是analyzer。\r\nik_smart类型无法解决abc.jpg按照后缀搜索问题，需要使用ik_max_word.	2017-10-27 20:25:22.357771	f
85	20	Issue	5	"bucket" : {\r\n"type" : "text" \r\n},\r\n"code" : {\r\n"type" : "long" \r\n},\r\n"date" : {\r\n"type" : "date" \r\n},\r\n"host" : {\r\n"type" : "text" \r\n},\r\n"object" : {\r\n"type" : "text",\r\n"analyzer" : "ik_max_word" \r\n},\r\n"op" : {\r\n"type" : "text" \r\n},\r\n"owner" : {\r\n"type" : "text" \r\n},\r\n"path" : {\r\n"type" : "text" \r\n},\r\n"type" : {\r\n"type" : "text" \r\n}	2017-10-27 20:25:41.558428	f
86	20	Issue	5	input {\r\nfile {\r\npath => ["/root/testlog/op*"]\r\ntype => "oplog" \r\nignore_older => 86400\r\nsincedb_path => "/root/logstash/oplog.sdb" \r\ncodec => json {\r\ncharset => "UTF-8" \r\n} \r\n}\r\n}\r\n\r\noutput {\r\nelasticsearch {\r\nhosts => ["192.168.4.50:9200"]\r\nindex => "oplog_logstash6" \r\nworkers => 2\r\ntemplate => "/root/logstash/ik_template.json" \r\ntemplate_name => "ik_template" \r\n}\r\n}\r\n\r\nlogstash配置文件	2017-10-27 20:26:05.699303	f
89	20	Issue	5	插件相当不好下载 \r\n./elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v5.6.1/elasticsearch-analysis-ik-5.6.1.zip\r\n\r\n当然这是网络问题，网络好的时候下载很快。	2017-10-27 20:29:04.301286	f
90	29	Issue	5	问题的原因在于：\r\n以前写多版本对象，复制仅在link_olh时进行。\r\n所以忽略了对存在版本的对象的处理，现在需要处理这种情况。\r\n\r\nlink_olh和产生对象的版本本来就是2个动作，为什么要过滤掉呢？\r\n\r\n多版本又是如何同步的呢？\r\n\r\nae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6_重阳.txt\r\nae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6__:s.ue4J9MnHG6ZRpVYcp5PHyGrBya-8-_测试对象.txt\r\nae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6__:oP4235G3Uccu91UAfu0ysf-lFc.jutc_重阳.txt\r\n\r\nolh对象和多版本的对象分别是怎么同步的？\r\n\r\n包含额外的元数据：\r\n1，olh的对象，这个对象记录了olh.info等属性。\r\n     olh.info   RGWOLHInfo   存储当前版本\r\n       olh.ver\r\n       olh.idtag\r\n     \r\n2，1001开头的bi olh entry\r\n     这个是用来记录bilog的\r\n3，BIVerObjEntry\r\n      这一个结构就管理了多版本的两种index，一种是bucket list index，也就是xie.pngv912iIe3QYVLBL78GY.Jo4B0.YE1IWEfBTp6 这种格式的。\r\n    另一种是以前老的作为version object的bi entry。\r\n\r\n写一个多版本的对象步骤：\r\n1，prepare\r\n2，写入多版本对象的head obj\r\n3，complete，这里就写入了1000_xie.pngiIe3QYVLBL78GY.Jo4B0.YE1IWEfBTp6 \r\n4，set olh，这步是多出来的，分为几个小步\r\n4.1，如果没有对象，要创建olh对象\r\n4.2，convert_plain_entry_to_versioned中写入非版本对象的bucket index key。\r\n        写入bi olh entry （这里就包含了bilog）\r\n        BIVerObjEntry::write （这里写了两个version object的index）	2017-10-30 08:23:17.057789	f
65	25	Issue	5	谢锐(x8671r@163.com)  10:28:45\r\n我在想审计日志在IO路径上写不是很合适，可能影响性能，还得考虑es挂的错误处理。\r\n能否这样，先像普通日志一样单独写一个审计日志文件。然后后台用工具导入到es\r\n谢锐(x8671r@163.com)  10:40:12\r\n把日志搞到es里面处理可能有现成工具，不过日志有格式化的和非格式化的\r\n\r\n\r\nrgw起异步进程也可以，搞个异步处理队列。不过这个对性能也没啥要求，放在外围做。以后好迁移版本。\r\n\r\n而且异步队列，在进程挂掉时可能丢数据，但是文件缓冲在文件系统，可以在一些情况下正常刷到文件。\r\n还有放队列存在处理不过来的情况，这些都得处理	2017-10-25 08:11:18.563547	f
75	20	Issue	5		2017-10-27 14:18:27.313591	f
76	29	Issue	5		2017-10-27 14:18:41.758636	f
91	4	Issue	5	[root@localhost ~]# ./s3.sh list_bucket \r\nbegin list bucket http://172.18.0.131:8080/ \r\ncurl -X GET -H "Date: Tue, 31 Oct 2017 03:37:25 GMT" -H "Authorization: AWS BVDUBNIUOW0JM72RE9MQ:/de000/nebsJcVBaSF5M8WH60m4=" "http://172.18.0.131:8080/" \r\ncurl: (28) Operation timed out after 100000 milliseconds with 0 out of -1 bytes received\r\nend list bucket\r\n\r\n在一次对rgw进程调试后出现\r\n\r\n172.18.0.130 - - [31/Oct/2017:03:41:45 +0000] "GET /admin/log/?type=data&id=48&info&rgwx-zonegroup=0fbaadfd-bbe6-465c-b594-122993af93f9 HTTP/1.1" 499 0 "-" "-" "-"\r\n172.18.0.130 - - [31/Oct/2017:03:41:45 +0000] "GET /admin/log/?type=data&id=103&info&rgwx-zonegroup=0fbaadfd-bbe6-465c-b594-122993af93f9 HTTP/1.1" 499 0 "-" "-" "-"\r\n172.18.0.130 - - [31/Oct/2017:03:42:12 +0000] "GET /admin/log/?type=data&id=22&info&rgwx-zonegroup=0fbaadfd-bbe6-465c-b594-122993af93f9 HTTP/1.1" 499 0 "-" "-" "-"\r\n172.18.0.130 - - [31/Oct/2017:03:42:21 +0000] "GET /admin/log/?type=data&id=27&info&rgwx-zonegroup=0fbaadfd-bbe6-465c-b594-122993af93f9 HTTP/1.1" 499 0 "-" "-" "-"\r\n\r\n发送list请求，nginx无任何日志，可见应该是nginx和rgw之间的链路断开了，但是为啥没重连呢？\r\nnginx发起重连了，但没成功\r\n2017/10/31 03:20:41 [error] 6701#0: *591995 connect() failed (111: Connection refused) while connecting to upstream, client: 172.18.0.130, server: , request: "POST /admin/realm/period?period=8759346e-474d-4176-90a9-5c5c1f1f0bf3&epoch=11&rgwx-zonegroup=0fbaadfd-bbe6-465c-b594-122993af93f9 HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "172.18.0.131:8080"\r\n2017/10/31 03:20:41 [error] 6701#0: *591997 connect() failed (111: Connection refused) while connecting to upstream, client: 172.18.0.130, server: , request: "GET /admin/log?type=data&rgwx-zonegroup=0fbaadfd-bbe6-465c-b594-122993af93f9 HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "172.18.0.131:8080"\r\n2017/10/31 03:20:41 [error] 6701#0: *591999 connect() failed (111: Connection refused) while connecting to upstream, client: 172.18.0.130, server: , request: "POST /admin/log?type=data&notify&source-zone=ae41357a-6f20-47bb-a3bd-1f0a166cd8f4&rgwx-zonegroup=0fbaadfd-bbe6-465c-b594-122993af93f9 HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "172.18.0.131:8080"\r\n\r\n\r\n\r\n2017-10-31 03:30:18.953959 7fec8df25700  1 heartbeat_map reset_timeout 'RGWProcess::m_tp thread 0x7fec8df25700' had timed out after 60\r\n2017-10-31 03:30:18.953980 7fec8e726700  1 heartbeat_map reset_timeout 'RGWProcess::m_tp thread 0x7fec8e726700' had timed out after 60\r\n2017-10-31 03:30:18.953989 7fed37ffe700  0 check_pending_requests request : http://172.18.0.130:8080/admin/log/?type=data&id=89&info&rgwx-zonegroup=0fbaadfd-bbe6-465c-b594-122993af93f9 timeout, last run at2017-10-31 03:21:57.782688\r\n2017-10-31 03:30:18.953994 7fecc0f8b700  1 heartbeat_map reset_timeout 'RGWProcess::m_tp thread 0x7fecc0f8b700' had timed out after 60\r\n2017-10-31 03:30:18.954012 7fec8c722700  1 heartbeat_map reset_timeout 'RGWProcess::m_tp thread 0x7fec8c722700' had timed out after 60	2017-10-31 12:13:50.635884	f
82	13	Issue	5		2017-10-27 20:23:42.441756	f
87	20	Issue	5		2017-10-27 20:26:17.116226	f
83	20	Issue	5	index.analysis.analyzer.default.type:ik\r\n\r\n报错了：\r\n[2017-10-27T17:42:29,491][INFO ][o.e.p.PluginsService ] [node-50] loaded plugin [analysis-ik]\r\n[2017-10-27T17:42:30,048][WARN ][o.e.c.s.SettingsModule ] [node-50] *****************************************************************************\r\nFound index level settings on node level configuration.\r\n\r\nSince elasticsearch 5.x index level settings can NOT be set on the nodes\r\nconfiguration like the elasticsearch.yaml, in system properties or command line\r\narguments.In order to upgrade all indices the settings must be updated via the\r\n/${index}/_settings API. Unless all settings are dynamic all indices must be closed\r\nin order to apply the upgradeIndices created in the future should use index templates\r\nto set default values.\r\n\r\nPlease ensure all required values are updated on all indices by executing:\r\n\r\ncurl -XPUT 'http://localhost:9200/_all/_settings?preserve_existing=true' -d '{\r\n"index.analysis.analyzer.default.type" : "ik" \r\n}'\r\n\r\n现在已经不支持这种用法了	2017-10-27 20:24:59.952059	f
88	25	Issue	5	input {\r\nfile {\r\npath => ["/root/testlog/op*"]\r\ntype => "oplog" \r\nignore_older => 86400\r\nsincedb_path => "/root/logstash/oplog.sdb" \r\ncodec => json {\r\ncharset => "UTF-8" \r\n} \r\n}\r\n}\r\n\r\noutput {\r\nelasticsearch {\r\nhosts => ["192.168.4.50:9200"]\r\nindex => "oplog_logstash6" \r\nworkers => 2\r\ntemplate => "/root/logstash/ik_template.json" \r\ntemplate_name => "ik_template" \r\n}\r\n}\r\n\r\nlogstash配置文件，支持自定义mapping的模板。\r\n\r\n{ \r\n"template" : "oplog_logstash*", \r\n"order":1,\r\n"settings" : { "index.refresh_interval" : "5s" }, \r\n"mappings" : { \r\n"_default_" : { \r\n"_all" : { "enabled" : false }, \r\n"dynamic_templates" : [{ \r\n"message_field" : { \r\n"match" : "message", \r\n"match_mapping_type" : "string", \r\n"mapping" : { "type" : "string", "index" : "analyzed" } \r\n} \r\n}, { \r\n"string_fields" : { \r\n"match" : "*", \r\n"match_mapping_type" : "string", \r\n"mapping" : { "type" : "string", "index" : "analyzed" } \r\n} \r\n}], \r\n"properties" : { \r\n"@version" : { "type" : "integer", "index" : "analyzed" }, \r\n"path" : { "type" : "string", "index" : "analyzed" },\r\n"host" : { "type" : "string", "index" : "analyzed" },\r\n"object" : { "type" : "text", "analyzer" : "ik_max_word" }\r\n} \r\n} \r\n}\r\n}	2017-10-27 20:27:57.956131	f
92	29	Issue	5	把olh和add bilog单独处理还比较麻烦，从逻辑角度看这是一个动作触发的。\r\n\r\n看看能否给增加tag这种元数据修改，使用额外的标签以区分。	2017-10-31 13:52:43.690454	f
93	30	Issue	5	s3browser操作需要apply changes才能生效。\r\n\r\n但是cloudberry很奇怪，不仅不能生效，而且原来在s3browser中增加的属性也没了。	2017-10-31 14:41:17.176377	f
95	30	Issue	5	应该是cloud berry有bug。\r\n从上面请求可以看出，http header走的是普通的put请求。在多版本下也会修改olh。这种实现是非常低效率的。	2017-10-31 14:51:47.096995	f
96	29	Issue	5	解决方案：\r\n增加额外操作类型\r\nCLS_RGW_OP_SETATTR = 7,\r\n这类操作可以单纯作用于多版本对象，也可以是非多版本对象。\r\n\r\n而且这类操作同步的时候是不必拷贝数据部分的，shit 修改个元数据，你让我同步全部数据？\r\n\r\n有一点这类操作的合并与 ADD有区别，需要额外处理。\r\n\r\n还有这种op是否写bilog？狗日的，真想把bilog重复写给合入了。\r\n\r\n同样面临的问题还有：在set attr失败之后如何回滚？\r\n使用跟对象操作一样的机制，但是在suggest的时候，根据prepare的类型决定实际op类型。\r\n\r\n在bilog同步合并的时候也需要一定策略，CLS_RGW_OP_SETATTR可以合入CLS_RGW_OP_ADD中。	2017-11-02 09:40:42.188921	f
94	29	Issue	5	http header是可以同步的，不过是通过olh，也就是说http header走的是正常的put请求。从请求的url也可以看出来。\r\n多版本修改http header会产生新的版本，完全就是一个put请求。\r\n\r\n经过RGWRados::set_attrs 来增加CLS_RGW_OP_ADD类型的bilog的，在多版本下都有风险，因为没有set olh。\r\n\r\n搞个set metadata的bilog？ 这样可单独处理各种只改属性的操作。	2017-10-31 14:49:05.328021	f
97	31	Issue	5	olh对象上设置acl是没用的，需要在版本对象上操作，就可以了\r\n\r\n在多zone之间同步问题，请参考 Bug #29	2017-11-07 09:15:27.115395	f
98	29	Issue	5	*set acl, tag等本身就不应该同步整个对象*\r\n\r\n所以这里优化后应该要实现仅同步对象元数据的功能。\r\n\r\n要支持这个还挺麻烦的，因为没法通过bilog知道哪个属性修改的。所以只能全部属性覆盖了，但是rados似乎没有clear已有属性的操作。	2017-11-07 12:48:37.117931	f
325	101	Issue	5	有一个命令反应osd整体的请求延时。\r\n读写请求总数，光看pg均衡情况无法反应真实的请求压力。不同的对象(如bi)上读写请求压力并不一样，有些bucket可能频繁访问。\r\n请求平均延时。	2018-09-25 09:48:11.867531	f
326	111	Issue	5	rgw同步应该考虑使用长连接	2018-10-08 09:46:15.902849	f
99	29	Issue	5	sbsb.txt\t\r\nrevision #: 3\t2017/11/8 10:17:09\t"8245850a9970806494b50a4a8e9d1eb6"\t20 bytes\tSTANDARD\tnuser (nuser)\tnI0aAeHcT78I42RKzT2jGMP-3PW0Ga8\t\r\nrevision #: 2 (current)\t2017/11/8 9:32:33\t"8245850a9970806494b50a4a8e9d1eb6"\t20 bytes\tSTANDARD\tnuser (nuser)\t2KlWSlU8tqMc1buKZV2mzqe4TTDEJ7B\t\r\nrevision #: 1\t2017/11/7 15:03:03\t"8245850a9970806494b50a4a8e9d1eb6"\t20 bytes\tSTANDARD\tnuser (nuser)\tiNUu.4VPalePLpnCLbUyiBPjWjlFofH\t\r\n\r\nslave zone like these，some bug there。why olh not linked?\r\n\r\n再次测试并未出现，非常奇怪。\r\n\r\n加强各种场景下的测试，也加强理论分析。\r\n在副本做bilog合并处理那块，可以构造一些用例：\r\n1，先写新对象，然后set attr，再同步\r\n2，先set attr，再写对象，再同步。	2017-11-08 08:13:40.799901	f
101	29	Issue	5	2017-11-08 06:14:56.230889 7f7c513ff700 20 bucket sync single entry (source_zone=ae41357a-6f20-47bb-a3bd-1f0a166cd8f4) b=xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6:11/sbsb.txt[0] log_entry=00000000056.1010.4 op=7 op_state=1\r\n2017-11-08 06:14:56.230895 7f7c513ff700  5 Sync:ae41357a:data:Object:xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6:11/sbsb.txt[0]:start\r\n2017-11-08 06:14:56.230902 7f7c513ff700 20 parsed entry: id=00000000057.1011.2 iter->object=sbsb.txt iter->instance=5dJn43PD374ff-3OMRaJ.H2SUgypCOp name=sbsb.txt instance= ns=\r\n2017-11-08 06:14:56.230908 7f7c513ff700 20 [inc sync] skipping object: xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6:11/sbsb.txt[5dJn43PD374ff-3OMRaJ.H2SUgypCOp]: non-complete operation\r\n2017-11-08 06:14:56.230911 7f7c513ff700 20 parsed entry: id=00000000058.1012.3 iter->object=sbsb.txt iter->instance=5dJn43PD374ff-3OMRaJ.H2SUgypCOp name=sbsb.txt instance= ns=\r\n2017-11-08 06:14:56.230917 7f7c513ff700 20 [inc sync] skipping object: xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6:11/sbsb.txt[5dJn43PD374ff-3OMRaJ.H2SUgypCOp]: squashed operation\r\n2017-11-08 06:14:56.230926 7f7c513ff700 20 parsed entry: id=00000000059.1013.9 iter->object=sbsb.txt iter->instance=5dJn43PD374ff-3OMRaJ.H2SUgypCOp name=sbsb.txt instance= ns=\r\n2017-11-08 06:14:56.230931 7f7c513ff700 20 [inc sync] syncing object: xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6:11/sbsb.txt[5dJn43PD374ff-3OMRaJ.H2SUgypCOp]\r\n2017-11-08 06:14:56.230937 7f7c513ff700 20 operate(): entry->timestamp=2017-11-08 06:14:56.0.063785s\r\n2017-11-08 06:14:56.230956 7f7c513ff700 20 bucket sync single entry (source_zone=ae41357a-6f20-47bb-a3bd-1f0a166cd8f4) b=xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6:11/sbsb.txt[5dJn43PD374ff-3OMRaJ.H2SUgypCOp][12] log_entry=00000000059.1013.9 op=4 op_state=1\r\n2017-11-08 06:14:56.230961 7f7c513ff700  5 Sync:ae41357a:data:Object:xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6:11/sbsb.txt[5dJn43PD374ff-3OMRaJ.H2SUgypCOp][12]:start\r\n2017-11-08 06:14:56.230966 7f7c513ff700 20 operate(): listing bilog for incremental sync\r\n2017-11-08 06:14:56.230977 7f7c513ff700 10 multisite data sync should run between 0 - 24 now 6 = yes\r\n2017-11-08 06:14:56.230980 7f7c513ff700 20 cr:s=0x7f7b1498f100:op=0x7f7b0fb04000:26RGWBucketSyncSingleEntryCRISs11rgw_obj_keyE: operate()\r\n2017-11-08 06:14:56.230986 7f7c513ff700  5 bucket sync: sync obj attr: ae41357a-6f20-47bb-a3bd-1f0a166cd8f4/xx5(@{i=BJ.rgw.buckets.index,e=BJ.rgw.buckets.non-ec}BJ.rgw.buckets.data[ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6])/sbsb.txt[0]\r\n2017-11-08 06:14:56.230991 7f7c513ff700  5 Sync:ae41357a:data:Object:xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6:11/sbsb.txt[0]:fetch\r\n2017-11-08 06:14:56.231009 7f7c513ff700 10 multisite data sync should run between 0 - 24 now 6 = yes\r\n2017-11-08 06:14:56.231012 7f7c513ff700 20 cr:s=0x7f7b1498f480:op=0x7f7b0fb04800:26RGWBucketSyncSingleEntryCRISs11rgw_obj_keyE: operate()\r\n2017-11-08 06:14:56.231016 7f7c513ff700  5 bucket sync: sync obj: ae41357a-6f20-47bb-a3bd-1f0a166cd8f4/xx5(@{i=BJ.rgw.buckets.index,e=BJ.rgw.buckets.non-ec}BJ.rgw.buckets.data[ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6])/sbsb.txt[5dJn43PD374ff-3OMRaJ.H2SUgypCOp][12]\r\n2017-11-08 06:14:56.231020 7f7c513ff700  5 Sync:ae41357a:data:Object:xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6:11/sbsb.txt[5dJn43PD374ff-3OMRaJ.H2SUgypCOp][12]:fetch\r\n\r\nsetattr是在olh对象上执行，instance为空。\r\nput对象的olh log是在instance上，并且这两个操作并行执行了。\r\n\r\n2017-11-08 06:14:56.256769 7f7c5e3e2700 20  bucket index object: .dir.ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6.11\r\n2017-11-08 06:14:56.257584 7f7c5e3e2700 20 bucket_index_link_olh() target_obj=xx5:_:5dJn43PD374ff-3OMRaJ.H2SUgypCOp_sbsb.txt delete_marker=0 returned -125\r\n2017-11-08 06:14:56.257608 7f7c5e3e2700 20 get_obj_state: rctx=0x7f7c5e3e0790 obj=xx5:sbsb.txt state=0x7f7c534fa098 s->prefetch_data=0\r\n2017-11-08 06:14:56.258565 7f7c5e3e2700 20 get_obj_state: setting s->obj_tag to 0ke71z11swyyntmabcnlp9eqitujbrk0\r\n2017-11-08 06:14:56.258590 7f7c5e3e2700 20 bucket_index_guard_olh_op(): olh_state.olh_tag=9zlvyr2ye6r4q3uaqblrr1l9daktby39\r\n2017-11-08 06:14:56.261065 7f7c5e3e2700 20 reading from BJ.rgw.data.root:.bucket.meta.xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6\r\n2017-11-08 06:14:56.261093 7f7c5e3e2700 20 get_system_obj_state: rctx=0x7f7c5e3de5f0 obj=BJ.rgw.data.root:.bucket.meta.xx5:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4164.6 state=0x7f7c534fa698 s->prefetch_data=0\r\n\r\n\r\n看来是在rgw_bucket_link_olh中出错了\r\n\r\n    const string& olh_tag = olh.get_tag();\r\n    if (op.olh_tag != olh_tag) {\r\n      if (!olh.pending_removal()) {\r\n        CLS_LOG(5, "NOTICE: op.olh_tag (%s) != olh.tag (%s)", op.olh_tag.c_str(), olh_tag.c_str());\r\n        return -ECANCELED;\r\n      }\r\n      /* if pending removal, this is a new olh instance */\r\n      olh.set_tag(op.olh_tag);\r\n    }	2017-11-08 12:28:10.805807	f
102	29	Issue	5	这里有两个地方可以修改：\r\n1，ACL在olh对象上修改是没有任何作用的，应该改为像tag一样，在obj instance上生效。\r\n  社区版已修改：\r\n    obj = rgw_obj(s->bucket, s->object);\r\n    store->set_atomic(s->obj_ctx, obj);\r\n    //if instance is empty, we should modify the latest object\r\n    op_ret = modify_obj_attr(store, s, obj, RGW_ATTR_ACL, bl);\r\n\r\n2，setattr不必修改olh id tag等。\r\n\r\n合入第一个之后问题就得到解决了。\r\n\r\n*但是要注意这点，就是setattr不应该去修改olh对象。*	2017-11-08 13:04:49.194585	f
103	31	Issue	5	社区已经修改，olh上设置acl需要设置到current version上。\r\n\r\n    obj = rgw_obj(s->bucket, s->object);\r\n    store->set_atomic(s->obj_ctx, obj);\r\n    //if instance is empty, we should modify the latest object\r\n    op_ret = modify_obj_attr(store, s, obj, RGW_ATTR_ACL, bl);	2017-11-08 13:26:51.411363	f
104	31	Issue	5	在 #29 已经合入	2017-11-08 13:27:27.536641	f
106	34	Issue	5	这问题涉及的点 不仅仅是RbdRead和RbdWrite.但是改动起来又觉得不是很有必要	2017-11-13 11:55:40.789737	f
108	38	Issue	5	陈乐  17:45:32\r\n谢锐，是第3步没同步	2017-11-15 15:16:05.158485	f
111	38	Issue	5	暂时多版本的时候的对象信息：\r\nbloom.cc\t\r\nrevision #: 3 (current)\t2017/11/16 10:39:33\t"c625679bb2a19c9d7ad9262c6de92491"\t12.37 KB\tSTANDARD\tnuser (nuser)\thqw.BWlLXEqJVWAUKCkgxn8u0XHpaaU\t\r\nrevision #: 2\t2017/11/16 10:39:09\t"c625679bb2a19c9d7ad9262c6de92491"\t12.37 KB\tSTANDARD\tnuser (nuser)\tMEOgy.4sKa-.2VKik7ccNIJDTV47cBp\t\r\nrevision #: 1\t2017/11/16 10:38:31\t"c625679bb2a19c9d7ad9262c6de92491"\t12.37 KB\tSTANDARD\tnuser (nuser)\tnull\t\r\n\r\n删除非版本的对象之后变成这样：\r\nbloom.cc\t\r\nrevision #: 4 (deleted)\t2017/11/16 10:41:13\t\t\t\t                                        nuser (nuser)\tP0VkD9aG7C14sxij-.ubGsCfvDXGaUO\t\r\nrevision #: 3 (deleted)\t2017/11/16 10:41:13\t\t\t\t                                        nuser (nuser)\tnull\t\r\nrevision #: 2\t2017/11/16 10:39:33\t"c625679bb2a19c9d7ad9262c6de92491"\t12.37 KB\tSTANDARD\tnuser (nuser)\thqw.BWlLXEqJVWAUKCkgxn8u0XHpaaU\t\r\nrevision #: 1\t2017/11/16 10:39:09\t"c625679bb2a19c9d7ad9262c6de92491"\t12.37 KB\tSTANDARD\tnuser (nuser)\tMEOgy.4sKa-.2VKik7ccNIJDTV47cBp\t\r\n\r\nslave zone：\r\nbloom.cc\t\r\nrevision #: 4 (deleted)\t2017/11/16 10:41:13\t\t\t\t                                        nuser (nuser)\tP0VkD9aG7C14sxij-.ubGsCfvDXGaUO\t\r\nrevision #: 3\t2017/11/16 10:39:33\t"c625679bb2a19c9d7ad9262c6de92491"\t12.37 KB\tSTANDARD\tnuser (nuser)\thqw.BWlLXEqJVWAUKCkgxn8u0XHpaaU\t\r\nrevision #: 2\t2017/11/16 10:39:09\t"c625679bb2a19c9d7ad9262c6de92491"\t12.37 KB\tSTANDARD\tnuser (nuser)\tMEOgy.4sKa-.2VKik7ccNIJDTV47cBp\t\r\nrevision #: 1\t2017/11/16 10:38:31\t"c625679bb2a19c9d7ad9262c6de92491"\t12.37 KB\tSTANDARD\tnuser (nuser)\tnull\t	2017-11-16 08:25:22.089992	f
116	38	Issue	5	要搞清楚多版本删除的原理，以及多版本打开关闭的逻辑处理。\r\n看这个单：http://tracker.ceph.com/issues/21210\r\n多版本suspend之后，bilog仍然是采用olh方式写的！！！ 那么set olh的逻辑又当如何呢？\r\n\r\n该patch确实能解决问题，看上去问题是在之前的同步过程中修改了olh tag，导致后续使用olh log的时候tag不匹配。\r\n\r\nWhen sync prior versions, the olh is not exsit. The slave zone will create olh itself. The olh.idtag is rand generated.\r\nThe null version's data_instance and olh is the same obj. When sync the null version's data, the olh attr is also synced to slave zone regarded as obj metadata.\r\nThus the olh.tag in olh_data_entry and the tag in olh is not the same.\r\n\r\nolh在创建的时候产生tag，所以同步对象如果把olh_tag同步过来，那么肯定跟BIOLHEntry结构中的不一致。	2017-11-20 08:21:28.169216	f
118	40	Issue	5	经验证如果没有挂起多版本这一步，就可以成功删除。\r\n\r\n挂起之后，删除olh之后变成这样：\r\nsbsb.txt\t\r\nrevision #: 4 (deleted)\t2017/11/20 14:56:04\t\t\t\tnuser (nuser)\t8wNZCuNjrjOtLaM2bJ7LfFdQFMZO9jK\t\r\nrevision #: 3 (deleted)\t2017/11/20 14:56:04\t\t\t\tnuser (nuser)\tnull\t\r\nrevision #: 2\t2017/11/20 14:55:11\t"8f14e45fceea167a5a36dedd4bea2543"\t1 bytes\tSTANDARD\tnuser (nuser)\towFJBm2mVUcITCO6suWm.TllK4vvkwr\t\r\nrevision #: 1\t2017/11/20 14:55:06\t"8f14e45fceea167a5a36dedd4bea2543"\t1 bytes\tSTANDARD\tnuser (nuser)\tx2ous5ZnUFnvhj6P4NBKUOWtWLdkRmm\t\r\n\r\n多出了null的deleted标记，且这个标记无法删除\r\n\r\n最终这个删除不掉：\r\nsbsb.txt\t\r\nrevision #: 1 (deleted)\t2017/11/20 14:56:04\t\t\t\tnuser (nuser)\tnull\t	2017-11-20 12:37:23.243348	f
258	82	Issue	5	1，面试\r\n2，转正\r\n3，方案讨论	2018-07-27 06:39:42.859881	f
259	83	Issue	5	申威编译	2018-07-27 16:19:40.465697	f
606	267	Issue	5	服务发现\r\n消息组件\r\n	2019-02-16 14:47:24.961301	f
608	269	Issue	5	今天验证没有出问题，是可以跑的。	2019-02-18 12:15:21.813263	f
609	265	Issue	5	文件命名不一样，v5版本 manifest中在perfix中加入了tag，详见prepare过程。\r\n\r\nv5版本没有任何xattr。\r\nv3版本有acl，content_type, etag，idtag，manifest， pg_ver， source_zone, x-amz-acl, x-amz-date,\r\nx-amz-meta-s3b-last-modified等\r\n	2019-02-18 13:31:33.15186	f
611	265	Issue	5		2019-02-18 15:57:12.9454	f
112	38	Issue	5	bilog类似这种：\r\n{\r\n        "op_id": "17#00000000009.528.16",\r\n        "op_tag": "000000005a0cf90bqfoaa259de496e87",\r\n        "op": "link_olh_del",\r\n        "object": "arena.cc",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 9,\r\n        "timestamp": "2017-11-16 02:33:47.829487895Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 4\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "nuser",\r\n        "owner_display_name": "nuser"\r\n    },\r\n    {\r\n        "op_id": "17#00000000010.529.3",\r\n        "op_tag": "_nCk1RGWIsJy7cnACGEYShUm6-z1yaZ1",\r\n        "op": "del",\r\n        "object": "arena.cc",\r\n        "instance": "",\r\n        "state": "pending",\r\n        "index_ver": 10,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "17#00000000011.530.4",\r\n        "op_tag": "_nCk1RGWIsJy7cnACGEYShUm6-z1yaZ1",\r\n        "op": "del",\r\n        "object": "arena.cc",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 11,\r\n        "timestamp": "2017-11-16 02:31:45.819343031Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 356\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "17#00000000012.532.10",\r\n        "op_tag": "000000005a0cf90c4jkaa68j9ddcdh77",\r\n        "op": "link_olh_del",\r\n        "object": "arena.cc",\r\n        "instance": "Y6GbFVmsodJFHVeNwcbouRM6xj0AnHY",\r\n        "state": "complete",\r\n        "index_ver": 12,\r\n        "timestamp": "2017-11-16 02:33:47.829487895Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 4\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "nuser",\r\n        "owner_display_name": "nuser"\r\n    }	2017-11-16 08:28:25.666751	f
119	40	Issue	5	[\r\n    {\r\n        "op_id": "11#00000000001.753.2",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4771.404123",\r\n        "op": "write",\r\n        "object": "sbsb.txt",\r\n        "instance": "",\r\n        "state": "pending",\r\n        "index_ver": 1,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 0,\r\n        "versioned": false,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000002.754.3",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4771.404123",\r\n        "op": "write",\r\n        "object": "sbsb.txt",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 2,\r\n        "timestamp": "2017-11-20 06:54:49.941944255Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 898\r\n        },\r\n        "bilog_flags": 0,\r\n        "versioned": false,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000003.755.2",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4771.404833",\r\n        "op": "write",\r\n        "object": "sbsb.txt",\r\n        "instance": "x2ous5ZnUFnvhj6P4NBKUOWtWLdkRmm",\r\n        "state": "pending",\r\n        "index_ver": 3,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000004.756.3",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4771.404833",\r\n        "op": "write",\r\n        "object": "sbsb.txt",\r\n        "instance": "x2ous5ZnUFnvhj6P4NBKUOWtWLdkRmm",\r\n        "state": "complete",\r\n        "index_ver": 4,\r\n        "timestamp": "2017-11-20 06:55:06.081030215Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 99721\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000005.757.10",\r\n        "op_tag": "000000005a127c4av9ncm3uqah7h6imx",\r\n        "op": "link_olh",\r\n        "object": "sbsb.txt",\r\n        "instance": "x2ous5ZnUFnvhj6P4NBKUOWtWLdkRmm",\r\n        "state": "complete",\r\n        "index_ver": 5,\r\n        "timestamp": "2017-11-20 06:55:06.081030215Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 2\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000006.759.2",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4771.404996",\r\n        "op": "write",\r\n        "object": "sbsb.txt",\r\n        "instance": "owFJBm2mVUcITCO6suWm.TllK4vvkwr",\r\n        "state": "pending",\r\n        "index_ver": 6,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000007.760.3",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4771.404996",\r\n        "op": "write",\r\n        "object": "sbsb.txt",\r\n        "instance": "owFJBm2mVUcITCO6suWm.TllK4vvkwr",\r\n        "state": "complete",\r\n        "index_ver": 7,\r\n        "timestamp": "2017-11-20 06:55:11.234795982Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 99777\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000008.761.9",\r\n        "op_tag": "000000005a127c4f97h3vefltbp7704s",\r\n        "op": "link_olh",\r\n        "object": "sbsb.txt",\r\n        "instance": "owFJBm2mVUcITCO6suWm.TllK4vvkwr",\r\n        "state": "complete",\r\n        "index_ver": 8,\r\n        "timestamp": "2017-11-20 06:55:11.234795982Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 3\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000009.763.16",\r\n        "op_tag": "000000005a127c84vofo0u6wduiw7dw9",\r\n        "op": "link_olh_del",\r\n        "object": "sbsb.txt",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 9,\r\n        "timestamp": "2017-11-20 06:56:04.320275507Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 4\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "nuser",\r\n        "owner_display_name": "nuser"\r\n    },\r\n    {\r\n        "op_id": "11#00000000010.764.3",\r\n        "op_tag": "_2AI7BEA3BYke5gTtKVBlimvZAZ4rR7q",\r\n        "op": "del",\r\n        "object": "sbsb.txt",\r\n        "instance": "",\r\n        "state": "pending",\r\n        "index_ver": 10,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000011.765.4",\r\n        "op_tag": "_2AI7BEA3BYke5gTtKVBlimvZAZ4rR7q",\r\n        "op": "del",\r\n        "object": "sbsb.txt",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 11,\r\n        "timestamp": "2017-11-20 06:55:11.250974962Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 904\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000012.767.10",\r\n        "op_tag": "000000005a127c84dz08gf9ysfgemhma",\r\n        "op": "link_olh_del",\r\n        "object": "sbsb.txt",\r\n        "instance": "8wNZCuNjrjOtLaM2bJ7LfFdQFMZO9jK",\r\n        "state": "complete",\r\n        "index_ver": 12,\r\n        "timestamp": "2017-11-20 06:56:04.320275507Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 4\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "nuser",\r\n        "owner_display_name": "nuser"\r\n    },\r\n    {\r\n        "op_id": "11#00000000013.769.5",\r\n        "op_tag": "000000005a127ccaaxmmnjpci1yoxh0w",\r\n        "op": "unlink_instance",\r\n        "object": "sbsb.txt",\r\n        "instance": "owFJBm2mVUcITCO6suWm.TllK4vvkwr",\r\n        "state": "complete",\r\n        "index_ver": 13,\r\n        "timestamp": "2017-11-20 06:57:14.827634744Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 5\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000014.770.2",\r\n        "op_tag": "_J9N37R7bEuXGBcMZ49zuDYue5mtIrXw",\r\n        "op": "del",\r\n        "object": "sbsb.txt",\r\n        "instance": "owFJBm2mVUcITCO6suWm.TllK4vvkwr",\r\n        "state": "pending",\r\n        "index_ver": 14,\r\n        "timestamp": "2017-11-20 06:55:11.234795982Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 99777\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000015.771.3",\r\n        "op_tag": "_J9N37R7bEuXGBcMZ49zuDYue5mtIrXw",\r\n        "op": "del",\r\n        "object": "sbsb.txt",\r\n        "instance": "owFJBm2mVUcITCO6suWm.TllK4vvkwr",\r\n        "state": "complete",\r\n        "index_ver": 15,\r\n        "timestamp": "2017-11-20 06:55:11.234795982Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 101011\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000016.773.5",\r\n        "op_tag": "000000005a127ccey04kmw663nj1dzn9",\r\n        "op": "unlink_instance",\r\n        "object": "sbsb.txt",\r\n        "instance": "x2ous5ZnUFnvhj6P4NBKUOWtWLdkRmm",\r\n        "state": "complete",\r\n        "index_ver": 16,\r\n        "timestamp": "2017-11-20 06:57:18.486806542Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 6\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000017.774.2",\r\n        "op_tag": "_KlhLeHqJDUsH1C2tyAplpXaGRZbV335",\r\n        "op": "del",\r\n        "object": "sbsb.txt",\r\n        "instance": "x2ous5ZnUFnvhj6P4NBKUOWtWLdkRmm",\r\n        "state": "pending",\r\n        "index_ver": 17,\r\n        "timestamp": "2017-11-20 06:55:06.081030215Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 99721\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000018.775.3",\r\n        "op_tag": "_KlhLeHqJDUsH1C2tyAplpXaGRZbV335",\r\n        "op": "del",\r\n        "object": "sbsb.txt",\r\n        "instance": "x2ous5ZnUFnvhj6P4NBKUOWtWLdkRmm",\r\n        "state": "complete",\r\n        "index_ver": 18,\r\n        "timestamp": "2017-11-20 06:55:06.081030215Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 101048\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "11#00000000019.777.7",\r\n        "op_tag": "000000005a127cd5utbwigvi0exred6h",\r\n        "op": "unlink_instance",\r\n        "object": "sbsb.txt",\r\n        "instance": "8wNZCuNjrjOtLaM2bJ7LfFdQFMZO9jK",\r\n        "state": "complete",\r\n        "index_ver": 19,\r\n        "timestamp": "2017-11-20 06:57:25.621603650Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 7\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    }\r\n]	2017-11-20 12:54:37.454971	f
113	38	Issue	5	先回答一个问题：这种情况下，应该是怎么样的。\r\n\r\n对于没关闭多版本的，删除就是产生一个标记，delete marker，同时产生一个新版本，也即表明最新版本是删除的。\r\nchannel.h\t\r\nrevision #: 3 (deleted)\t2017/11/16 14:30:04\t\t\t\t                                nuser (nuser)\t7eciT6VnL88Hfgak1MUvIPbpv6U0vdA\t\r\nrevision #: 2\t2017/11/16 14:29:32\t"d67a6520a7bd5f315b4330cfe44bc244"\t1.62 KB\tSTANDARD\tnuser (nuser)\tGod27gciF-G0FBfbcoeGl1rXbWGygY7\t\r\nrevision #: 1\t2017/11/16 14:29:05\t"d67a6520a7bd5f315b4330cfe44bc244"\t1.62 KB\tSTANDARD\tnuser (nuser)\tnull\t\r\n\r\n多版本无法关闭，只能挂起，挂起意味着什么呢？\r\n这个测试步骤问题更严重：\r\n1，不开启多版本，上传一个对象\r\n2，开启多版本，再次上传\r\n3，删除该对象\r\n4，挂起bucket version\r\n5，再次上传对象\r\n\r\n这时看到的现象是：\r\nmaster zone\r\nchannel.h\t\r\nrevision #: 3 (current)\t2017/11/16 14:34:56\t"d67a6520a7bd5f315b4330cfe44bc244"\t1.62 KB\tSTANDARD\tnuser (nuser)\tnull\t\r\nrevision #: 2 (deleted)\t2017/11/16 14:30:04\t\t\t\tnuser (nuser)\t7eciT6VnL88Hfgak1MUvIPbpv6U0vdA\t\r\nrevision #: 1\t2017/11/16 14:29:32\t"d67a6520a7bd5f315b4330cfe44bc244"\t1.62 KB\tSTANDARD\tnuser (nuser)\tGod27gciF-G0FBfbcoeGl1rXbWGygY7\t\r\n\r\nslave zone：\r\nchannel.h\t\r\nrevision #: 3 (deleted)\t2017/11/16 14:30:04\t\t\t\tnuser (nuser)\t7eciT6VnL88Hfgak1MUvIPbpv6U0vdA\t\r\nrevision #: 2\t2017/11/16 14:29:32\t"d67a6520a7bd5f315b4330cfe44bc244"\t1.62 KB\tSTANDARD\tnuser (nuser)\tGod27gciF-G0FBfbcoeGl1rXbWGygY7\t\r\nrevision #: 1\t2017/11/16 14:29:05\t"d67a6520a7bd5f315b4330cfe44bc244"\t1.62 KB\tSTANDARD\tnuser (nuser)\tnull\t\r\n\r\n\r\nbilog:\r\n[\r\n    {\r\n        "op_id": "54#00000000001.589.2",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4712.4757287",\r\n        "op": "write",\r\n        "object": "channel.h",\r\n        "instance": "",\r\n        "state": "pending",\r\n        "index_ver": 1,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 0,\r\n        "versioned": false,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "54#00000000002.590.3",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4712.4757287",\r\n        "op": "write",\r\n        "object": "channel.h",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 2,\r\n        "timestamp": "2017-11-16 06:29:05.858972802Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 213\r\n        },\r\n        "bilog_flags": 0,\r\n        "versioned": false,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "54#00000000003.591.2",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4712.4757453",\r\n        "op": "write",\r\n        "object": "channel.h",\r\n        "instance": "God27gciF-G0FBfbcoeGl1rXbWGygY7",\r\n        "state": "pending",\r\n        "index_ver": 3,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "54#00000000004.592.3",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4712.4757453",\r\n        "op": "write",\r\n        "object": "channel.h",\r\n        "instance": "God27gciF-G0FBfbcoeGl1rXbWGygY7",\r\n        "state": "complete",\r\n        "index_ver": 4,\r\n        "timestamp": "2017-11-16 06:29:32.401551049Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 214\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "54#00000000005.593.10",\r\n        "op_tag": "000000005a0d304c6t0vm937tepi4vbz",\r\n        "op": "link_olh",\r\n        "object": "channel.h",\r\n        "instance": "God27gciF-G0FBfbcoeGl1rXbWGygY7",\r\n        "state": "complete",\r\n        "index_ver": 5,\r\n        "timestamp": "2017-11-16 06:29:32.401551049Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 2\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "54#00000000006.595.9",\r\n        "op_tag": "000000005a0d306cbc4xkf9nsknng350",\r\n        "op": "link_olh_del",\r\n        "object": "channel.h",\r\n        "instance": "7eciT6VnL88Hfgak1MUvIPbpv6U0vdA",\r\n        "state": "complete",\r\n        "index_ver": 6,\r\n        "timestamp": "2017-11-16 06:30:04.011833121Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 3\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "nuser",\r\n        "owner_display_name": "nuser"\r\n    },\r\n    {\r\n        "op_id": "54#00000000007.597.3",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4712.4757769",\r\n        "op": "write",\r\n        "object": "channel.h",\r\n        "instance": "",\r\n        "state": "pending",\r\n        "index_ver": 7,\r\n        "timestamp": "2017-11-16 06:29:05.858972802Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 213\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "54#00000000008.598.4",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4712.4757769",\r\n        "op": "write",\r\n        "object": "channel.h",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 8,\r\n        "timestamp": "2017-11-16 06:34:56.129691615Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 219\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "54#00000000009.599.14",\r\n        "op_tag": "000000005a0d31909u52r2okkbrf19yi",\r\n        "op": "link_olh",\r\n        "object": "channel.h",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 9,\r\n        "timestamp": "2017-11-16 06:34:56.129691615Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 4\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    }\r\n]	2017-11-16 12:10:57.260669	f
121	40	Issue	5	sh-4.2# for e in `cat testq.bi`; do bin/rados listomapkeys $e -p SZ.rgw.buckets.index; done\r\nver1.txt\r\nver1.txtv912iZYS-9JbNNiYVQQzRaaPXfikyAIChwls\r\nver1.txtv913imZGghn7ChutQ6Zxw9mMD0kv9fAlJQ32\r\nver1.txtv914i\r\n0_00000000001.102367.2\r\n0_00000000002.102368.3\r\n0_00000000003.102549.2\r\n0_00000000004.102550.3\r\n0_00000000005.102551.10\r\n0_00000000006.102597.2\r\n0_00000000007.102598.3\r\n0_00000000008.102599.9\r\n1000_ver1.txti\r\n1000_ver1.txtiZYS-9JbNNiYVQQzRaaPXfikyAIChwls\r\n1000_ver1.txtimZGghn7ChutQ6Zxw9mMD0kv9fAlJQ32\r\n1001_ver1.txt\r\nsh-4.2# for e in `cat testq.bi`; do bin/rados listomapkeys $e -p SZ.rgw.buckets.index; done\r\nver1.txt\r\nver1.txtv911i\r\nver1.txtv911idi8TzdrrnTx0k02GEqxpCzb9Hzsr8qR\r\nver1.txtv912iZYS-9JbNNiYVQQzRaaPXfikyAIChwls\r\nver1.txtv913imZGghn7ChutQ6Zxw9mMD0kv9fAlJQ32\r\n0_00000000001.102367.2\r\n0_00000000002.102368.3\r\n0_00000000003.102549.2\r\n0_00000000004.102550.3\r\n0_00000000005.102551.10\r\n0_00000000006.102597.2\r\n0_00000000007.102598.3\r\n0_00000000008.102599.9\r\n0_00000000009.103317.16\r\n0_00000000010.103318.3\r\n0_00000000011.103319.4\r\n0_00000000012.103321.10\r\n1000_ver1.txtid\r\n1000_ver1.txtiZYS-9JbNNiYVQQzRaaPXfikyAIChwls\r\n1000_ver1.txtidi8TzdrrnTx0k02GEqxpCzb9Hzsr8qR\r\n1000_ver1.txtimZGghn7ChutQ6Zxw9mMD0kv9fAlJQ32\r\n1001_ver1.txt\r\n\r\n区别在于suspend的bucket，会同时删除掉版本为null的对象。也就是说一次性触发了两个动作。	2017-11-20 13:07:11.2152	f
136	40	Issue	5	修改之后的才有循环同步的问题，从正常情况的日志看，在slave zone处理逻辑并不一样。\r\nslave zone是完全当作一个没有版本的对象来处理的，所以没有set_olh的bilog。\r\n为什么呢？ \r\n错，还是olh，进到函数set_olh了，并且调用cls_rgw_bucket_link_olh\r\n(gdb) p call\r\n$12 = {key = {name = "rgw_tag.h", instance = ""}, olh_tag = "gge8m6nxemcegfkot0y6ybcra8u52el2", delete_marker = false, op_tag = "000000005a158662d739hzbd20mhllyr", meta = {\r\n    category = 0 '\\000', size = 0, mtime = {__d = {__r = 0}}, etag = "", owner = "", owner_display_name = "", content_type = "", accounted_size = 0}, olh_epoch = 5, log_op = true, \r\n  bilog_flags = 0, unmod_since = {__d = {__r = 0}}, high_precision_time = false}\r\n\r\n\r\nosd执行：\r\n\r\nBreakpoint 2, rgw_bucket_link_olh (hctx=0x7f70bf7f5a38, in=<optimized out>, out=<optimized out>) at cls/rgw/cls_rgw.cc:1473\r\n1473\tin cls/rgw/cls_rgw.cc\r\n(gdb) p op\r\n$1 = {key = {name = "rgw_tag.h", instance = ""}, olh_tag = "gge8m6nxemcegfkot0y6ybcra8u52el2", delete_marker = false, op_tag = "000000005a158662d739hzbd20mhllyr", meta = {\r\n    category = 0 '\\000', size = 0, mtime = {__d = {__r = 0}}, etag = "", owner = "", owner_display_name = "", content_type = "", accounted_size = 0}, olh_epoch = 5, log_op = true, \r\n  bilog_flags = 0, unmod_since = {__d = {__r = 0}}, high_precision_time = false}\r\n(gdb) p olh\r\n$2 = {hctx = 0x7f70bf7f5a38, key = {name = "rgw_tag.h", instance = ""}, olh_data_idx = "\\200\\061\\060\\060\\061_rgw_tag.h", olh_data_entry = {key = {name = "rgw_tag.h", \r\n      instance = "zdQer7DunwEc.CZ6LVLq-4xfv.kzHSx"}, delete_marker = false, epoch = 3, pending_log = std::map with 0 elements, tag = "z933ci1gmj6818h31sxyo46oyb3xfkw8", exists = true, \r\n    pending_removal = false}, initialized = false}\r\n\r\n还有个明显的问题 就是op.olh_tag与 olh中的不一致。\r\n这就是http://tracker.ceph.com/issues/21210，又遇到了。\r\n\r\n再解决这个问题之后，社区版本就有了循环同步的问题。\r\n当然这个问题通过避免在slave zone写bilog可以避免，但是jewel版本该如何处理呢？\r\n\r\n合入http://tracker.ceph.com/issues/21743 试下看	2017-11-22 20:23:30.475185	f
137	40	Issue	5	注意测试一种情况，没有所谓的null对象，只有olh的情况。\r\n\r\nhttp://tracker.ceph.com/issues/18939 这个问题也应该关注下	2017-11-22 21:05:19.959248	f
151	41	Issue	5	slave zone同步后，null instance多出来1个。\r\n其中一个是版本1，估计是convert出来的，为啥以前没这问题呢？以前增量的时候都是从低版本过来的。\r\n而且convert只会执行一次。\r\n\r\n也就是说上来第一个对象必须从olh epoch 1开始，但是在rgw_bucket_link_olh中写入的BIVerObjEntry又是来自于olh，这样就产生了两个key。\r\n效果就相当于先写了一个普通对象，然后set_olh里面又写了一次。\r\n\r\n\r\n-static int convert_plain_entry_to_versioned(cls_method_context_t hctx, cls_rgw_obj_key& key, bool demote_current, bool instance_only)\r\n+static int convert_plain_entry_to_versioned(cls_method_context_t hctx, cls_rgw_obj_key& key, bool demote_current, bool instance_only, uint64_t epoch)\r\n {\r\n   if (!key.instance.empty()) {\r\n     return -EINVAL;\r\n@@ -1358,8 +1359,9 @@ static int convert_plain_entry_to_versioned(cls_method_context_t hctx, cls_rgw_o\r\n       CLS_LOG(0, "ERROR: read_key_entry() returned ret=%d", ret);\r\n       return ret;\r\n     }\r\n-\r\n-    entry.versioned_epoch = 1; /* converted entries are always 1 */\r\n+    if (epoch == 0)\r\n+      epoch = 1;\r\n+    entry.versioned_epoch = epoch; /* converted entries are always 1 */\r\n     entry.flags |= RGW_BUCKET_DIRENT_FLAG_VER;\r\n \r\n     if (demote_current) {\r\n@@ -1518,7 +1520,7 @@ static int rgw_bucket_link_olh(cls_method_context_t hctx, bufferlist *in, buffer\r\n   } else {\r\n     bool instance_only = (op.key.instance.empty() && op.delete_marker);\r\n     cls_rgw_obj_key key(op.key.name);\r\n-    ret = convert_plain_entry_to_versioned(hctx, key, true, instance_only);\r\n+    ret = convert_plain_entry_to_versioned(hctx, key, true, instance_only, op.olh_epoch);\r\n     if (ret < 0) {\r\n       CLS_LOG(0, "ERROR: convert_plain_entry_to_versioned ret=%d", ret);\r\n       return ret;\r\n@@ -1623,7 +1625,7 @@ static int rgw_bucket_unlink_instance(cls_method_context_t hctx, bufferlist *in,\r\n   if (!olh_found) {\r\n     bool instance_only = false;\r\n     cls_rgw_obj_key key(dest_key.name);\r\n-    ret = convert_plain_entry_to_versioned(hctx, key, true, instance_only);\r\n+    ret = convert_plain_entry_to_versioned(hctx, key, true, instance_only, 0);\r\n     if (ret < 0) {\r\n       CLS_LOG(0, "ERROR: convert_plain_entry_to_versioned ret=%d", ret);\r\n       return ret;\r\n\r\n这样修改可解决该问题。  上面删除的问题也得到解决。	2017-11-28 14:26:45.941054	f
612	269	Issue	5		2019-02-19 07:21:22.312761	f
115	39	Issue	5		2017-11-20 07:30:32.127599	f
114	38	Issue	5	2017-11-16 08:22:27.430089 7f7f4dbb4700  0 WARNING: set_req_state_err err_no=125 resorting to 500\r\n2017-11-16 08:22:27.430122 7f7f4dbb4700  3 req 1005:0.005856:s3:GET /testf/crc32c.cc:get_obj:testf/crc32c.cc :op status=0\r\n2017-11-16 08:22:27.430127 7f7f4dbb4700  3 req 1005:0.005862:s3:GET /testf/crc32c.cc:get_obj:testf/crc32c.cc :http status=500\r\n2017-11-16 08:22:27.430131 7f7f4dbb4700  2 ====== req done req=0x7f7e3c9e1e40 obj=testf/crc32c.cc op status=0 op name=get_obj http_status=500 ======\r\n2017-11-16 08:22:27.434901 7f7f937fb700  0 ERROR: exceeded max ECANCELED retries, aborting (EIO)\r\n2017-11-16 08:22:27.434931 7f7f937fb700  0 store->fetch_remote_obj() returned r=-5\r\n2017-11-16 08:22:27.435009 7f7f79fff700  5 Sync:ae41357a:data:Object:testf:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4764.1:57/crc32c.cc[6]:done, retcode=-5\r\n2017-11-16 08:22:27.435017 7f7f79fff700  0 ERROR: failed to sync object: testf:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4764.1:57/crc32c.cc\r\n2017-11-16 08:22:27.436603 7f7f79fff700  5 Sync:ae41357a:data:Object:testf:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4764.1:57/crc32c.cc[6]:finish\r\n2017-11-16 08:22:27.436616 7f7f79fff700  0 ERROR: a sync operation returned error -5\r\n2017-11-16 08:22:27.437984 7f7f79fff700  0 inc sync bucket:testf:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4764.1:57ERROR: failure in sync, backing out (sync_status=-5)\r\n2017-11-16 08:22:27.439316 7f7f79fff700  5 Sync:ae41357a:data:BucketInc:testf:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4764.1:57:finish\r\n2017-11-16 08:22:27.439335 7f7f79fff700  5 incremental sync on testf:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4764.1:57 failed, retcode=-5\r\n2017-11-16 08:22:27.439342 7f7f79fff700  5 Sync:ae41357a:data:Bucket:testf:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.4764.1:57:finish\r\n\r\n后面还有一次重试，看上去成功了。但是没产生一致的结果\r\n\r\nerr_no=125\r\n\r\n\r\n2017-11-20 03:02:57.538968 7f1264bff700  1 <cls> cls/rgw/cls_rgw.cc:1748: NOTICE: rgw_bucket_read_olh_log(): olh_tag_mismatch olh_data_entry.tag=8zena0falazw7imxcygi7uu2cy1r7dxq op.olh_tag=5bi43uiio494x2bwj38fcbypw4b79api\r\n	2017-11-16 14:20:18.722683	f
117	40	Issue	5		2017-11-20 11:55:41.271513	f
123	40	Issue	5	Breakpoint 1, RGWRados::bucket_index_link_olh (this=this@entry=0x7f057e54dc00, olh_state=..., obj_instance=..., delete_marker=delete_marker@entry=true, \r\n    op_tag="000000005a128d301irodeiyl0f6rgoq", meta=meta@entry=0x7f049ff2b5c0, olh_epoch=olh_epoch@entry=0, unmod_since=unmod_since@entry=..., \r\n    high_precision_time=high_precision_time@entry=false) at rgw/rgw_rados.cc:10046\r\n10046\tin rgw/rgw_rados.cc\r\n(gdb) bt\r\n#0  RGWRados::bucket_index_link_olh (this=this@entry=0x7f057e54dc00, olh_state=..., obj_instance=..., delete_marker=delete_marker@entry=true, op_tag="000000005a128d301irodeiyl0f6rgoq", \r\n    meta=meta@entry=0x7f049ff2b5c0, olh_epoch=olh_epoch@entry=0, unmod_since=unmod_since@entry=..., high_precision_time=high_precision_time@entry=false) at rgw/rgw_rados.cc:10046\r\n#1  0x00007f058f1f1d23 in RGWRados::set_olh (this=this@entry=0x7f057e54dc00, obj_ctx=..., bucket_info=..., target_obj=..., delete_marker=delete_marker@entry=true, \r\n    meta=meta@entry=0x7f049ff2b5c0, olh_epoch=0, unmod_since=..., high_precision_time=false) at rgw/rgw_rados.cc:10376\r\n#2  0x00007f058f214a30 in RGWRados::Object::Delete::delete_obj (this=this@entry=0x7f049ff2b940) at rgw/rgw_rados.cc:8031\r\n#3  0x00007f058f19c9d2 in RGWDeleteObj::execute (this=0x7f0574929600) at rgw/rgw_op.cc:3374\r\n#4  0x00007f058f1b4929 in process_request (store=0x7f057e54dc00, rest=0x7ffdfbcf4f90, req=req@entry=0x7f05518b9dc0, client_io=client_io@entry=0x7f049ff2c6d0, olog=0x0)\r\n    at rgw/rgw_process.cc:174\r\n#5  0x00007f0598c74cc0 in RGWFCGXProcess::handle_request (this=0x7f057e5c9b00, r=0x7f05518b9dc0) at rgw/rgw_fcgi_process.cc:121\r\n#6  0x00007f0598c76990 in RGWProcess::RGWWQ::_process (this=0x7f057e5c9db8, req=0x7f05518b9dc0) at rgw/rgw_process.h:85\r\n#7  0x00007f058f52583e in ThreadPool::worker (this=0x7f057e5c9b70, wt=0x7f0551855a60) at common/WorkQueue.cc:128\r\n#8  0x00007f058f526720 in ThreadPool::WorkThread::entry (this=<optimized out>) at common/WorkQueue.h:445\r\n#9  0x00007f058e2e8dc5 in start_thread () from /lib64/libpthread.so.0\r\n#10 0x00007f058d8f476d in clone () from /lib64/libc.so.6\r\n(gdb) c\r\nContinuing.\r\n[Switching to Thread 0x7f056bff3700 (LWP 72577)]\r\n\r\nBreakpoint 1, RGWRados::bucket_index_link_olh (this=this@entry=0x7f057e54dc00, olh_state=..., obj_instance=..., delete_marker=delete_marker@entry=true, \r\n    op_tag="000000005a128d38emfg6cky1udcs90m", meta=meta@entry=0x7f056bff0f50, olh_epoch=olh_epoch@entry=4, unmod_since=unmod_since@entry=..., \r\n    high_precision_time=high_precision_time@entry=true) at rgw/rgw_rados.cc:10046\r\n10046\tin rgw/rgw_rados.cc\r\n(gdb) bt\r\n#0  RGWRados::bucket_index_link_olh (this=this@entry=0x7f057e54dc00, olh_state=..., obj_instance=..., delete_marker=delete_marker@entry=true, op_tag="000000005a128d38emfg6cky1udcs90m", \r\n    meta=meta@entry=0x7f056bff0f50, olh_epoch=olh_epoch@entry=4, unmod_since=unmod_since@entry=..., high_precision_time=high_precision_time@entry=true) at rgw/rgw_rados.cc:10046\r\n#1  0x00007f058f1f1d23 in RGWRados::set_olh (this=this@entry=0x7f057e54dc00, obj_ctx=..., bucket_info=..., target_obj=..., delete_marker=delete_marker@entry=true, \r\n    meta=meta@entry=0x7f056bff0f50, olh_epoch=4, unmod_since=..., high_precision_time=true) at rgw/rgw_rados.cc:10376\r\n#2  0x00007f058f214a30 in RGWRados::Object::Delete::delete_obj (this=this@entry=0x7f056bff12d0) at rgw/rgw_rados.cc:8031\r\n#3  0x00007f058f0b39bd in RGWAsyncRemoveObj::_send_request (this=0x7f0411d1f580) at rgw/rgw_cr_rados.cc:637\r\n#4  0x00007f058f0afe82 in send_request (this=0x7f0411d1f580) at rgw/rgw_cr_rados.h:31\r\n#5  RGWAsyncRadosProcessor::handle_request (this=<optimized out>, req=0x7f0411d1f580) at rgw/rgw_cr_rados.cc:76\r\n#6  0x00007f058f0aff4d in RGWAsyncRadosProcessor::RGWWQ::_process (this=0x7f057e598090, req=<optimized out>, handle=...) at rgw/rgw_cr_rados.cc:36\r\n#7  0x00007f058f52583e in ThreadPool::worker (this=0x7f057e597e60, wt=0x7f057e5c1a60) at common/WorkQueue.cc:128\r\n#8  0x00007f058f526720 in ThreadPool::WorkThread::entry (this=<optimized out>) at common/WorkQueue.h:445\r\n#9  0x00007f058e2e8dc5 in start_thread () from /lib64/libpthread.so.0\r\n#10 0x00007f058d8f476d in clone () from /lib64/libc.so.6\r\n(gdb) f 1\r\n#1  0x00007f058f1f1d23 in RGWRados::set_olh (this=this@entry=0x7f057e54dc00, obj_ctx=..., bucket_info=..., target_obj=..., delete_marker=delete_marker@entry=true, \r\n    meta=meta@entry=0x7f056bff0f50, olh_epoch=4, unmod_since=..., high_precision_time=true) at rgw/rgw_rados.cc:10376\r\n10376\tin rgw/rgw_rados.cc\r\n(gdb) p target_obj\r\n$1 = (rgw_obj &) @0x7f056bff1060: {orig_obj = "ver1.txt", loc = "", object = "_:uZzLw6A-nVwsNl0ZhO9bjK0n8sUyOdm_ver1.txt", instance = "uZzLw6A-nVwsNl0ZhO9bjK0n8sUyOdm", bucket = {\r\n    tenant = "", name = "tests4", data_pool = "SZ.rgw.buckets.data", data_extra_pool = "SZ.rgw.buckets.non-ec", index_pool = "SZ.rgw.buckets.index", \r\n    marker = "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5183.1", bucket_id = "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5183.1", \r\n    oid = ".bucket.meta.tests4:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5183.1"}, ns = "", in_extra_data = false, index_hash_source = ""}\r\n(gdb) c\r\n还真在这里停留了两次，我日了。\r\n	2017-11-20 13:55:33.657169	f
120	40	Issue	5	sh-4.2# for e in `cat testo.bi`; do bin/rados listomapkeys $e -p SZ.rgw.buckets.index; done\r\nsbsb.txtv911i\r\n0_00000000001.753.2\r\n0_00000000002.754.3\r\n0_00000000003.755.2\r\n0_00000000004.756.3\r\n0_00000000005.757.10\r\n0_00000000006.759.2\r\n0_00000000007.760.3\r\n0_00000000008.761.9\r\n0_00000000009.763.16\r\n0_00000000010.764.3\r\n0_00000000011.765.4\r\n0_00000000012.767.10\r\n0_00000000013.769.5\r\n0_00000000014.770.2\r\n0_00000000015.771.3\r\n0_00000000016.773.5\r\n0_00000000017.774.2\r\n0_00000000018.775.3\r\n0_00000000019.777.7\r\n1000_sbsb.txtid\r\n\r\n删除olh之前：\r\nsh-4.2# for e in `cat testp.bi`; do bin/rados listomapkeys $e -p SZ.rgw.buckets.index; done\r\n0_00000000001.2068.2\r\n0_00000000002.2069.3\r\n0_00000000003.2070.2\r\n0_00000000004.2071.3\r\n0_00000000005.2072.10\r\n0_00000000006.2074.2\r\n0_00000000007.2075.3\r\n0_00000000008.2076.9\r\n1000_测试对象.txti\r\n1000_测试对象.txtiBaIJnvR4VUTY0RGQ6O5U3xU1Rl44rP1\r\n1000_测试对象.txtiDKmSS4b9NFOLobTk91i0mqtBKznwCAM\r\n1001_测试对象.txt\r\n测试对象.txt\r\n测试对象.txtv912iDKmSS4b9NFOLobTk91i0mqtBKznwCAM\r\n测试对象.txtv913iBaIJnvR4VUTY0RGQ6O5U3xU1Rl44rP1\r\n测试对象.txtv914i\r\n\r\nsh-4.2# for e in `cat testp.bi`; do bin/rados listomapkeys $e -p SZ.rgw.buckets.index; done\r\n0_00000000001.2068.2\r\n0_00000000002.2069.3\r\n0_00000000003.2070.2\r\n0_00000000004.2071.3\r\n0_00000000005.2072.10\r\n0_00000000006.2074.2\r\n0_00000000007.2075.3\r\n0_00000000008.2076.9\r\n0_00000000009.2078.9\r\n1000_测试对象.txti\r\n1000_测试对象.txtiBaIJnvR4VUTY0RGQ6O5U3xU1Rl44rP1\r\n1000_测试对象.txtiDKmSS4b9NFOLobTk91i0mqtBKznwCAM\r\n1000_测试对象.txtiUNbh6YIH7bsP6nxFtEp0dgn2t4S-5h6\r\n1001_测试对象.txt\r\n测试对象.txt\r\n测试对象.txtv911iUNbh6YIH7bsP6nxFtEp0dgn2t4S-5h6\r\n测试对象.txtv912iDKmSS4b9NFOLobTk91i0mqtBKznwCAM\r\n测试对象.txtv913iBaIJnvR4VUTY0RGQ6O5U3xU1Rl44rP1\r\n测试对象.txtv914i\r\n	2017-11-20 13:00:04.370578	f
122	40	Issue	5	更奇怪的现象：在我关闭slave zone的rgw之后，执行同样操作，结果是这样的：\r\nver2.txt\t\r\nrevision #: 3 (deleted)\t2017/11/20 15:46:29\t\t\t\tnuser (nuser)\tnull\t\r\nrevision #: 2\t2017/11/20 15:46:01\t"7a6f01477ea0ab4fcedecbeeb2b310e9"\t501 bytes\tSTANDARD\tnuser (nuser)\tID4Aoavr6wGDRKSLTHydkYASq0KnPjJ\t\r\nrevision #: 1\t2017/11/20 15:45:54\t"7a6f01477ea0ab4fcedecbeeb2b310e9"\t501 bytes\tSTANDARD\tnuser (nuser)\tMDl6T.i8Dz0YWCzEt520PUCjZw6S7VI\t\r\n\r\n这时delete对应的bilog:\r\n {\r\n        "op_id": "1#00000000009.110810.16",\r\n        "op_tag": "000000005a128855325xege7c4l7oej3",\r\n        "op": "link_olh_del",\r\n        "object": "ver2.txt",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 9,\r\n        "timestamp": "2017-11-20 07:46:29.131235396Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 4\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "nuser",\r\n        "owner_display_name": "nuser"\r\n    },\r\n    {\r\n        "op_id": "1#00000000010.110811.3",\r\n        "op_tag": "_k6N6HnPUobAateg0mghcsJLEuU4IgcD",\r\n        "op": "del",\r\n        "object": "ver2.txt",\r\n        "instance": "",\r\n        "state": "pending",\r\n        "index_ver": 10,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "1#00000000011.110812.4",\r\n        "op_tag": "_k6N6HnPUobAateg0mghcsJLEuU4IgcD",\r\n        "op": "del",\r\n        "object": "ver2.txt",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 11,\r\n        "timestamp": "2017-11-20 07:46:01.432380235Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 946\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    }	2017-11-20 13:31:56.145496	f
124	40	Issue	5	正确的做法是什么呢？不应该是把null的版本干掉吧？\r\nslave zone：\r\nver1.txt\t\r\nrevision #: 4 (deleted)\t2017/11/20 16:07:12\t\t\t\tnuser (nuser)\tuZzLw6A-nVwsNl0ZhO9bjK0n8sUyOdm\t\r\nrevision #: 3\t2017/11/20 16:06:49\t"05b64c65fcc220fe52d5a9bf8fee7172"\t501 bytes\tSTANDARD\tnuser (nuser)\tCX6BiM09Aiqi3xoJfno8TODg6OyDn6i\t\r\nrevision #: 2\t2017/11/20 16:06:39\t"05b64c65fcc220fe52d5a9bf8fee7172"\t501 bytes\tSTANDARD\tnuser (nuser)\tQHXnGECXcB3YEwmCW3vy9mmeQ70cY6X\t\r\nrevision #: 1\t2017/11/20 16:06:05\t"05b64c65fcc220fe52d5a9bf8fee7172"\t501 bytes\tSTANDARD\tnuser (nuser)\tnull\t\r\n\r\n主副本在这块的执行逻辑不一样。\r\n\r\n主本bilog：\r\n{\r\n        "op_id": "46#00000000009.912.16",\r\n        "op_tag": "000000005a128d301irodeiyl0f6rgoq",\r\n        "op": "link_olh_del",\r\n        "object": "ver1.txt",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 9,\r\n        "timestamp": "2017-11-20 08:07:12.955839015Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 4\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "nuser",\r\n        "owner_display_name": "nuser"\r\n    },\r\n    {\r\n        "op_id": "46#00000000010.913.3",\r\n        "op_tag": "_mrqDuwpawNTEJjzNtF4EmEImZX1VOyc",\r\n        "op": "del",\r\n        "object": "ver1.txt",\r\n        "instance": "",\r\n        "state": "pending",\r\n        "index_ver": 10,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "46#00000000011.914.4",\r\n        "op_tag": "_mrqDuwpawNTEJjzNtF4EmEImZX1VOyc",\r\n        "op": "del",\r\n        "object": "ver1.txt",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 11,\r\n        "timestamp": "2017-11-20 08:06:51.721181829Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 964\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "46#00000000012.916.10",\r\n        "op_tag": "000000005a128d38emfg6cky1udcs90m",\r\n        "op": "link_olh_del",\r\n        "object": "ver1.txt",\r\n        "instance": "uZzLw6A-nVwsNl0ZhO9bjK0n8sUyOdm",\r\n        "state": "complete",\r\n        "index_ver": 12,\r\n        "timestamp": "2017-11-20 08:07:12.955839015Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 4\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "nuser",\r\n        "owner_display_name": "nuser"\r\n    }\r\n最后一条bilog是从slave同步过来的	2017-11-20 14:04:56.505492	f
127	40	Issue	5	还有null instance的对象是不是和olh对象的名字一摸一样？这样如何区分呢？\r\n还真不清楚，但是确实是olh和null版本共用了一个对象，而且null instance的数据并没被覆盖\r\n\r\n为什么不在写olh的时候把null version相关的bi信息给清理或者覆盖掉呢？\r\n\r\nsh-4.2# for t in `cat ./test10.bi`; do bin/rados listomapkeys $t -p BJ.rgw.buckets.index; done\r\nrgw_acl_swift.h\r\nrgw_acl_swift.hv911itWNVGC54iwG7obfdSde8aV0Tt2bMLZs\r\nrgw_acl_swift.hv912i9YUzYm-fc5Q87geRhV9psc3QBqm2UZA\r\nrgw_acl_swift.hv913iTkARIgCqHkCHzcsoIMN2yXiVAlgRI3p\r\nrgw_acl_swift.hv914i\r\n0_00000000001.73.2\r\n0_00000000002.74.3\r\n0_00000000003.75.2\r\n0_00000000004.76.3\r\n0_00000000005.77.10\r\n0_00000000006.79.2\r\n0_00000000007.80.3\r\n0_00000000008.81.9\r\n0_00000000009.83.9\r\n1000_rgw_acl_swift.hi\r\n1000_rgw_acl_swift.hi9YUzYm-fc5Q87geRhV9psc3QBqm2UZA\r\n1000_rgw_acl_swift.hiTkARIgCqHkCHzcsoIMN2yXiVAlgRI3p\r\n1000_rgw_acl_swift.hitWNVGC54iwG7obfdSde8aV0Tt2bMLZs\r\n1001_rgw_acl_swift.h\r\nsh-4.2# bin/rados ls -p BJ.rgw.buckets.data | grep "rgw_acl"\r\nae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4_rgw_acl_swift.h\r\nae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4__:9YUzYm-fc5Q87geRhV9psc3QBqm2UZA_rgw_acl_swift.h\r\nae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4__:TkARIgCqHkCHzcsoIMN2yXiVAlgRI3p_rgw_acl_swift.h\r\n\r\nunlink instance到底缺了什么呢？\r\n这时null instance指向了olh的对象。\r\n\r\n在slave zone执行时，delete的参数instance是null的，但是mark version id是"null"。对象是versioned的。\r\nif (!params.marker_version_id.empty()) {\r\n        if (params.marker_version_id != "null") {\r\n          marker.set_instance(params.marker_version_id);\r\n        }\r\n      //XRWHY:so if suspend,delete will direct on null instance,but maybe the null instance is an older version.\r\n      //why ? we should only make a delete marker, otherwise, we can not rollback, or find older version.\r\n      // should see a null instance as a version too!\r\n      } else if ((params.versioning_status & BUCKET_VERSIONS_SUSPENDED) == 0) {\r\n        store->gen_rand_obj_instance_name(&marker);\r\n      }\r\n\r\n      result.version_id = marker.get_instance();\r\n      result.delete_marker = true;\r\n这样就走向了delete marker分支，但这实际上是一个unlink instance操作。\r\n\r\n有趣的是把删除标记删除掉，就相当于回滚了..删除\r\n	2017-11-21 07:40:02.978457	f
125	40	Issue	5	RGWRados::Object::Delete::delete_obj：     \r\n      //XRWHY:so if suspend,delete will direct on null instance,but maybe the null instance is an older version.\r\n      //why ? we should only make a delete marker, otherwise, we can not rollback, or find older version.\r\n      // should see a null instance as a version too!\r\n      } else if ((params.versioning_status & BUCKET_VERSIONS_SUSPENDED) == 0) {\r\n        store->gen_rand_obj_instance_name(&marker);\r\n      }\r\n关闭多版本的情况下，这里就不会在delete时产生新版本，直接把老版本给干掉了。\r\n\r\nslave zone：\r\nBreakpoint 2, RGWRados::Object::Delete::delete_obj (this=this@entry=0x7fc6d1bf22d0) at rgw/rgw_rados.cc:7993\r\n7993\trgw/rgw_rados.cc: No such file or directory.\r\n(gdb) bt\r\n#0  RGWRados::Object::Delete::delete_obj (this=this@entry=0x7fc6d1bf22d0) at rgw/rgw_rados.cc:7993\r\n#1  0x00007fc6f47839bd in RGWAsyncRemoveObj::_send_request (this=0x7fc58009ba00) at rgw/rgw_cr_rados.cc:637\r\n#2  0x00007fc6f477fe82 in send_request (this=0x7fc58009ba00) at rgw/rgw_cr_rados.h:31\r\n#3  RGWAsyncRadosProcessor::handle_request (this=<optimized out>, req=0x7fc58009ba00) at rgw/rgw_cr_rados.cc:76\r\n#4  0x00007fc6f477ff4d in RGWAsyncRadosProcessor::RGWWQ::_process (this=0x7fc6e3d95290, req=<optimized out>, handle=...) at rgw/rgw_cr_rados.cc:36\r\n#5  0x00007fc6f4bf583e in ThreadPool::worker (this=0x7fc6e3d95060, wt=0x7fc6e3daf2e0) at common/WorkQueue.cc:128\r\n#6  0x00007fc6f4bf6720 in ThreadPool::WorkThread::entry (this=<optimized out>) at common/WorkQueue.h:445\r\n#7  0x00007fc6f39b8dc5 in start_thread () from /lib64/libpthread.so.0\r\n#8  0x00007fc6f2fc476d in clone () from /lib64/libc.so.6\r\n(gdb) p params\r\n$1 = {bucket_owner = {tenant = "", id = "nuser"}, versioning_status = 2, obj_owner = {id = {tenant = "", id = "nuser"}, display_name = "nuser"}, olh_epoch = 4, marker_version_id = "", \r\n  bilog_flags = 0, remove_objs = 0x0, expiration_time = {__d = {__r = 0}}, unmod_since = {__d = {__r = 1511170925253828643}}, mtime = {__d = {__r = 1511170925253828643}}, \r\n  high_precision_time = true}\r\n\r\nversioning_status = 2 居然是2\r\n\r\nif (versioned) {\r\n    del_op.params.versioning_status = BUCKET_VERSIONED;\r\n}\r\n这里简单粗暴，显然bilog entry的\r\n"versioned": true无法表示bucket多版本是suspend状态。\r\n\r\n多版本挂起之后，写入就是之前没有启用多版本的null对象，这一点导致设计上出现了不一致。\r\n这也造成了一些混淆，当我不带version去删除时和带version null删除时处理上的混乱\r\n带null version：\r\n172.18.0.1 - - [20/Nov/2017:11:25:00 +0000] "DELETE /tests6/ver1.txt?versionId=null HTTP/1.1" 204 0 "-" "S3 Browser 6-5-9 http://s3browser.com" "-"\r\n不带任何版本的:\r\n172.18.0.1 - - [20/Nov/2017:11:27:55 +0000] "DELETE /tests6/ver1.txt HTTP/1.1" 204 0 "-" "S3 Browser 6-5-9 http://s3browser.com" "-"\r\n果然还是不一样的。\r\n\r\n*个人觉得应该把null version当作一个普通的version来看待，在delete olh时，行为还是仅仅做一个delete marker。*\r\n麻烦在于在表示一个rgw_obj时，没法区分这两种情况。\r\n\r\ns3在suspend version之后的行为也是如此，不带版本删除时，null instance被干掉了。\r\n\r\n奇葩的是suspend的bucket删除当前版本，还能rollback到上一个版本。	2017-11-20 15:16:06.929707	f
126	40	Issue	5	//} else if ((params.versioning_status & BUCKET_VERSIONS_SUSPENDED) == 0) {\r\n      } else {\r\n        assert(params.versioning_status & BUCKET_VERSIONED);\r\n        store->gen_rand_obj_instance_name(&marker);\r\n      }\r\n采用这个改法，最终删除null对象时也会产生一个marker，同步时需要注意这种情况。\r\n\r\n2017-11-20 12:01:23.945853 7fc6d27ee700  0 _send_request(): deleting obj=tests7:_:E8OcLaalAAaCoXw7RzaoT9NI2beWMVD_ver1.txt\r\n2017-11-20 12:01:23.953511 7fc6bf7ff700  0 ERROR: a sync operation returned error -2\r\n2017-11-20 12:01:23.970162 7fc6bf7ff700  0 inc sync bucket:tests7:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.1:46ERROR: failure in sync, backing out (sync_status=-2)\r\n2017-11-20 12:01:23.972665 7fc6bf7ff700  0 WARNING: skipping data log entry for missing bucket tests7:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.1:46\r\n\r\n采用该改法之后，slave zone出现上述错误。\r\n\r\n看上去像执行乱序了：\r\n2017-11-20 12:13:37.730518 7fc6bf7ff700  5 parsed entry: id=00000000011.116215.8 iter->object=get_400M.xml iter->instance= name=get_400M.xml instance= ns=\r\n2017-11-20 12:13:37.730537 7fc6bf7ff700  5 [inc sync] syncing object: tests8:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.2:36/get_400M.xml\r\n2017-11-20 12:13:37.730551 7fc6bf7ff700  5 operate(): entry->timestamp=2017-11-20 12:13:37.0.611605s\r\n2017-11-20 12:13:37.730593 7fc6bf7ff700  5 Sync:ae41357a:data:Object:tests8:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.2:36/get_400M.xml[6]:start\r\n2017-11-20 12:13:37.730605 7fc6bf7ff700  5 parsed entry: id=00000000012.116216.3 iter->object=get_400M.xml iter->instance= name=get_400M.xml instance= ns=\r\n2017-11-20 12:13:37.730612 7fc6bf7ff700  5 [inc sync] skipping object: tests8:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.2:36/get_400M.xml: non-complete operation\r\n2017-11-20 12:13:37.730616 7fc6bf7ff700  5 parsed entry: id=00000000013.116217.4 iter->object=get_400M.xml iter->instance= name=get_400M.xml instance= ns=\r\n2017-11-20 12:13:37.730620 7fc6bf7ff700  5 [inc sync] skipping object: tests8:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.2:36/get_400M.xml: squashed operation\r\n2017-11-20 12:13:37.730640 7fc6bf7ff700  5 Sync:ae41357a:data:Object:tests8:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.2:36/get_400M.xml[6]:remove\r\n2017-11-20 12:13:37.730744 7fc6d67f6700  0 _send_request(): deleting obj=tests8:get_400M.xml\r\n2017-11-20 12:13:37.730878 7fc6bf7ff700  5 add_request request http://172.18.0.130:8080/admin/log?bucket-instance=tests8%3Aae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.2%3A36&format=json&marker=00000000013.116217.4&type=bucket-index&rgwx-zonegroup=0fbaadfd-bbe6-465c-b594-122993af93f9\r\n2017-11-20 12:13:37.730960 7fc6bbffe700  5 link_request req_data=0x7fc6be1ffa80 req_data->id=6156, easy_handle=0x7fc583146000\r\n2017-11-20 12:13:37.743418 7fc6df7fd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2017-11-20 12:13:37.752565 7fc6bf7ff700  5 Sync:ae41357a:data:Object:tests8:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.2:36/get_400M.xml[6]:done\r\n2017-11-20 12:13:37.755434 7fc6bf7ff700  5 Sync:ae41357a:data:Object:tests8:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.2:36/get_400M.xml[6]:finish\r\n\r\n\r\nlink_olh_del比 remove先执行了。\r\n\r\n\r\n{\r\n        "op_id": "34#00000000009.1039.9",\r\n        "op_tag": "000000005a12ceaav7v9edwmgw99w0pv",\r\n        "op": "link_olh_del",\r\n        "object": "rgw_acl_swift.h",\r\n        "instance": "tWNVGC54iwG7obfdSde8aV0Tt2bMLZs",\r\n        "state": "complete",\r\n        "index_ver": 9,\r\n        "timestamp": "2017-11-20 12:46:34.805575147Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 4\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "nuser",\r\n        "owner_display_name": "nuser"\r\n    },\r\n\r\n上面是执行删除olh对象时的bilog，下面是仅接着执行删除version为null对象的bilog，与之前的bilog并不一样，可见instance直接影响了bilog的形成。\r\n那么在slave zone仍然能看到null version的对象，但是无法执行删除(返回-2)的根因是什么呢？\r\n    {\r\n        "op_id": "34#00000000010.1041.7",\r\n        "op_tag": "000000005a12ceb1ea0deqrt8dag2ctb",\r\n        "op": "unlink_instance",\r\n        "object": "rgw_acl_swift.h",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 10,\r\n        "timestamp": "2017-11-20 12:46:41.791979083Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 5\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "34#00000000011.1042.3",\r\n        "op_tag": "_zTFl-reak1RHQtEJzRD_pKS8HjdF6BL",\r\n        "op": "del",\r\n        "object": "rgw_acl_swift.h",\r\n        "instance": "",\r\n        "state": "pending",\r\n        "index_ver": 11,\r\n        "timestamp": "2017-11-20 12:45:19.489294844Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 5219\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "34#00000000012.1043.4",\r\n        "op_tag": "_zTFl-reak1RHQtEJzRD_pKS8HjdF6BL",\r\n        "op": "del",\r\n        "object": "rgw_acl_swift.h",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 12,\r\n        "timestamp": "2017-11-20 12:46:35.120816869Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 5228\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    }\r\n\r\n\r\n2017-11-20 12:46:41.987830 7fc6bf7ff700  5 parsed entry: id=00000000010.1041.7 iter->object=rgw_acl_swift.h iter->instance= name=rgw_acl_swift.h instance= ns=\r\n2017-11-20 12:46:41.987837 7fc6bf7ff700  5 [inc sync] syncing object: test10:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4:34/rgw_acl_swift.h\r\n2017-11-20 12:46:41.987850 7fc6bf7ff700  5 operate(): entry->timestamp=2017-11-20 12:46:41.0.791979s\r\n2017-11-20 12:46:41.987885 7fc6bf7ff700  5 Sync:ae41357a:data:Object:test10:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4:34/rgw_acl_swift.h[5]:start\r\n2017-11-20 12:46:41.987893 7fc6bf7ff700  5 parsed entry: id=00000000011.1042.3 iter->object=rgw_acl_swift.h iter->instance= name=rgw_acl_swift.h instance= ns=\r\n2017-11-20 12:46:41.987898 7fc6bf7ff700  5 [inc sync] skipping object: test10:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4:34/rgw_acl_swift.h: non-complete operation\r\n2017-11-20 12:46:41.987902 7fc6bf7ff700  5 parsed entry: id=00000000012.1043.4 iter->object=rgw_acl_swift.h iter->instance= name=rgw_acl_swift.h instance= ns=\r\n2017-11-20 12:46:41.987906 7fc6bf7ff700  5 [inc sync] skipping object: test10:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4:34/rgw_acl_swift.h: squashed operation\r\n2017-11-20 12:46:41.987952 7fc6bf7ff700  5 Sync:ae41357a:data:Object:test10:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4:34/rgw_acl_swift.h[5]:remove\r\n2017-11-20 12:46:41.988071 7fc6d8ffb700  0 _send_request(): deleting obj=test10:rgw_acl_swift.h\r\n2017-11-20 12:46:41.988252 7fc6bf7ff700  5 add_request request http://172.18.0.130:8080/admin/log?bucket-instance=test10%3Aae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4%3A34&format=json&marker=00000000012.1043.4&type=bucket-index&rgwx-zonegroup=0fbaadfd-bbe6-465c-b594-122993af93f9\r\n2017-11-20 12:46:41.988288 7fc6bbffe700  5 link_request req_data=0x7fc6be2d2080 req_data->id=21165, easy_handle=0x7fc5801bb000\r\n2017-11-20 12:46:41.989211 7fc6bf7ff700  5 Sync:ae41357a:data:Object:test10:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4:34/rgw_acl_swift.h[5]:done, retcode=-2\r\n2017-11-20 12:46:41.991119 7fc6bf7ff700  0 datalog.sync-status.shard.ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.91.retry add retry entry test10:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4:34 ret 0\r\n2017-11-20 12:46:41.993016 7fc6bf7ff700  5 Sync:ae41357a:data:Object:test10:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5186.4:34/rgw_acl_swift.h[5]:finish\r\n\r\n显然第一个同步create_delete_marker并非仅仅create_delete_marker	2017-11-20 18:11:24.611403	f
134	40	Issue	5	场景是关闭多版本上传一个对象，就会产生很多条bilog，循环产生。\r\n\r\nbilog时间规律是\r\nprepare一个时间\r\n\r\ncomplete一个时间\r\nset_olh和complete同时间。\r\n\r\n\r\n原因搞不好是这个问题\r\nhttp://tracker.ceph.com/issues/21743\r\n\r\n也就是说olh对象的mtime一直在修改，这样bilog中记录的时间与olh时间不一致。\r\nolh.mtime > bilog.olh.time\r\n这样就会不断的循环，以前有这个问题么？	2017-11-22 15:28:15.000517	f
130	40	Issue	5	新的问题：\r\n{\r\n        "op_id": "62#00000000042.9831.7",\r\n        "op_tag": "000000005a14089ei48nf693jwc6xjes",\r\n        "op": "unlink_instance",\r\n        "object": "rgw_tag.h",\r\n        "instance": "null",\r\n        "state": "complete",\r\n        "index_ver": 42,\r\n        "timestamp": "2017-11-21 11:06:06.332797486Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 3\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "62#00000000043.9832.3",\r\n        "op_tag": "_mnP6rfK-J5NQoW2Z5eU5mR3-pOhc4WZ",\r\n        "op": "del",\r\n        "object": "rgw_tag.h",\r\n        "instance": "",\r\n        "state": "pending",\r\n        "index_ver": 43,\r\n        "timestamp": "2017-11-21 11:05:41.355198827Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 6109\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "62#00000000044.9833.4",\r\n        "op_tag": "_mnP6rfK-J5NQoW2Z5eU5mR3-pOhc4WZ",\r\n        "op": "del",\r\n        "object": "rgw_tag.h",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 44,\r\n        "timestamp": "2017-11-21 11:06:06.325824432Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 6113\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n主上删除之后 bilog这样，在slave zone执行又出问题了。\r\n分析下多版本未关闭时，一个null version的删除过程。\r\n在多版本的时候，是不存在直接删除一个版本的，都是走的上述流程，有3条bilog\r\n\r\n在删除一个多版本的null instance之后：\r\nslave\r\nrgw_tag.h\t\r\nrevision #: 4 (deleted)\t2017/11/21 21:39:19\t\t\t\t ()\trl-BIj0bWGesh3BiNAQ9sKhkcndCLRz\t\r\nrevision #: 3 (deleted)\t2017/11/21 21:39:19\t\t\t\t ()\t8ZAduL8Cc2kffJgRI98wVX-WCyA1JAo\t\r\nrevision #: 2\t2017/11/21 21:38:55\t"89acfb788b24ef60d7ad87fb3b9784cd"\t1012 bytes\tSTANDARD\tnuser (nuser)\tNOxCtx3CuHqO0ad1nr4aAm-8Wmi3CIh\t\r\nrevision #: 1\t2017/11/21 21:38:49\t"89acfb788b24ef60d7ad87fb3b9784cd"\t1012 bytes\tSTANDARD\tnuser (nuser)\tHsJUW0FyCXf5IEZ3Hzd0TbM5Sfm.ft3\t	2017-11-21 16:54:17.57271	f
132	40	Issue	5	将 delete_obj中 prepare delete 的bilog 改为使用src_obj，带null之后效果更令人诧异：\r\nrgw_tag.h\t\r\nrevision #: 3\t2017/11/21 21:42:37\t"89acfb788b24ef60d7ad87fb3b9784cd"\t1012 bytes\tSTANDARD\tnuser (nuser)\tb2APVlliy3tIwC5-7NtFzTC2h.f1e-L\t\r\nrevision #: 2 (current)\t2017/11/21 21:42:37\t"89acfb788b24ef60d7ad87fb3b9784cd"\t1012 bytes\tSTANDARD\tnuser (nuser)\tCYMJkGLXiPnDB1LvVtqyG2f08vmTsvj\t\r\nrevision #: 1\t2017/11/21 21:42:33\t"89acfb788b24ef60d7ad87fb3b9784cd"\t1012 bytes\tSTANDARD\tnuser (nuser)\tIWgxPnKyV0931dMiVwJDoqkGTIKgnmP\t\r\n\r\n上传一个对象后，出现了循环同步的现象	2017-11-21 19:29:32.366813	f
135	40	Issue	5	[root@localhost ceph]# git diff src/rgw/rgw_rados.cc\r\ndiff --git a/ceph/src/rgw/rgw_rados.cc b/ceph/src/rgw/rgw_rados.cc\r\nindex 6fb346d..4ef2b32 100644\r\n--- a/ceph/src/rgw/rgw_rados.cc\r\n+++ b/ceph/src/rgw/rgw_rados.cc\r\n@@ -7054,6 +7054,10 @@ int RGWRados::fetch_remote_obj(RGWObjectCtx& obj_ctx,\r\n       JSONDecoder::decode_json("attrs", src_attrs, &jp);\r\n \r\n       src_attrs.erase(RGW_ATTR_MANIFEST); // not interested in original object layout\r\n+      src_attrs.erase(RGW_ATTR_OLH_INFO);\r\n+      src_attrs.erase(RGW_ATTR_OLH_VER);\r\n+      src_attrs.erase(RGW_ATTR_OLH_ID_TAG);\r\n+      src_attrs.erase(RGW_ATTR_OLH_PENDING_PREFIX);\r\n       if (source_zone.empty()) { /* need to preserve expiration if copy in the same zonegroup */\r\n         src_attrs.erase(RGW_ATTR_DELETE_AT);\r\n       } else {\r\n@@ -8036,7 +8040,7 @@ int RGWRados::Object::Delete::delete_obj()\r\n         return r;\r\n       }\r\n       result.delete_marker = dirent.is_delete_marker();\r\n-      r = store->unlink_obj_instance(target->get_ctx(), target->get_bucket_info(), obj, params.olh_epoch);\r\n+      r = store->unlink_obj_instance(target->get_ctx(), target->get_bucket_info(), src_obj, params.olh_epoch);\r\n       if (r < 0) {\r\n         return r;\r\n       }\r\n@@ -8122,7 +8126,7 @@ int RGWRados::Object::Delete::delete_obj()\r\n   RGWBucketInfo& bucket_info = target->get_bucket_info();\r\n \r\n   RGWRados::Bucket bop(store, bucket_info);\r\n-  RGWRados::Bucket::UpdateIndex index_op(&bop, obj, state);\r\n+  RGWRados::Bucket::UpdateIndex index_op(&bop, src_obj, state);\r\n \r\n   index_op.set_bilog_flags(params.bilog_flags);\r\n\r\n\r\n\r\n[root@localhost ceph]# git diff src/cls/rgw/cls_rgw.cc\r\ndiff --git a/ceph/src/cls/rgw/cls_rgw.cc b/ceph/src/cls/rgw/cls_rgw.cc\r\nindex 58247b5..2bde98b 100644\r\n--- a/ceph/src/cls/rgw/cls_rgw.cc\r\n+++ b/ceph/src/cls/rgw/cls_rgw.cc\r\n@@ -1624,6 +1624,8 @@ static int rgw_bucket_unlink_instance(cls_method_context_t hctx, bufferlist *in,\r\n     obj.set_epoch(1);\r\n   }\r\n \r\n+  CLS_LOG(0, "olh current epoch is %d, op olh_epoch is %d", \r\n+              olh.get_epoch(), op.olh_epoch);\r\n   if (!olh.start_modify(op.olh_epoch)) {\r\n     ret = obj.unlink_list_entry();\r\n     if (ret < 0) {\r\n[root@localhost ceph]# git diff src/rgw/rgw_cr_rados.cc\r\ndiff --git a/ceph/src/rgw/rgw_cr_rados.cc b/ceph/src/rgw/rgw_cr_rados.cc\r\nindex ac40dc6..7143b1e 100644\r\n--- a/ceph/src/rgw/rgw_cr_rados.cc\r\n+++ b/ceph/src/rgw/rgw_cr_rados.cc\r\n@@ -625,7 +625,9 @@ int RGWAsyncRemoveObj::_send_request()\r\n     del_op.params.unmod_since = timestamp;\r\n   }\r\n   if (versioned) {\r\n-    del_op.params.versioning_status = BUCKET_VERSIONED;\r\n+    del_op.params.versioning_status = bucket_info.versioning_status();\r\n+    ldout(store->ctx(), 0) << " bucket " << bucket_info.bucket.name << " key " << obj << " version status " \r\n+                                      << del_op.params.versioning_status << dendl;\r\n   }\r\n   del_op.params.olh_epoch = versioned_epoch;\r\n   del_op.params.marker_version_id = marker_version_id;\r\n	2017-11-22 18:51:27.742744	f
179	71	Issue	5	删除.git目录，否则autogen.sh过不了。\r\n\r\nceph_ver.h:\r\n#ifndef CEPH_VERSION_H\r\n#define CEPH_VERSION_H\r\n\r\n#define CEPH_GIT_VER 951609bd3033f20560230d1d3514b535cffc0fde\r\n#define CEPH_GIT_NICE_VER "eph_v10.2.10"\r\n\r\n#endif	2018-05-17 11:32:46.713775	f
180	71	Issue	5	/usr/lib/gcc/sw_64sw4-sunway-linux-gnu/5.3.0/../../../../sw_64sw4-sunway-linux-gnu/bin/ld: cls/journal/.libs/cls_journal_types.o: dtp-relative relocation against dynamic symbol _ZZ9stringifyIN3cls7journal11ClientStateEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKT_E2ssB5cxx11\r\n/usr/lib/gcc/sw_64sw4-sunway-linux-gnu/5.3.0/../../../../sw_64sw4-sunway-linux-gnu/bin/ld: cls/journal/.libs/cls_journal_types.o: dtp-relative relocation against dynamic symbol _ZZ9stringifyIN3cls7journal11ClientStateEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKT_E2ssB5cxx11\r\n/usr/lib/gcc/sw_64sw4-sunway-linux-gnu/5.3.0/../../../../sw_64sw4-sunway-linux-gnu/bin/ld: cls/journal/.libs/cls_journal_types.o: dtp-relative relocation against dynamic symbol _ZZ9stringifyIN3cls7journal11ClientStateEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKT_E2ssB5cxx11\r\n/usr/lib/gcc/sw_64sw4-sunway-linux-gnu/5.3.0/../../../../sw_64sw4-sunway-linux-gnu/bin/ld: final link failed: Nonrepresentable section on output\r\n\r\n有两种尝试：\r\n1.增加-fPIC\r\n2，-fvisibility-hidden\r\nhttps://stackoverflow.com/questions/3570355/c-fvisibility-hidden-fvisibility-inlines-hidden	2018-05-17 20:24:32.957491	f
183	72	Issue	5	申威编译完成，其他两项还在进行中。	2018-05-28 06:33:48.647834	f
181	71	Issue	5	./configure CXXFLAGS="-mieee" CFLAGS="-mieee"  --build=sw_64-unknown-linux-gnu --without-lttng --without-fuse --without-libatomic-ops --without-jemalloc --without-tcmalloc --without-libxfs --with-radosgw --without-cephfs --without-mds --prefix=/root/xierui/release/ \r\n\r\n这样仍然不行\r\n\r\n根因是-O2，部分文件拿出来重新编译即可。	2018-05-18 09:24:53.236042	f
184	73	Issue	5	完成TR2 审查的一些遗留事项。	2018-05-28 08:22:02.441154	f
187	73	Issue	5	使用三个zone测试auto trim。	2018-05-30 07:22:19.13984	f
188	73	Issue	5	well done!	2018-06-04 07:32:08.488409	f
191	74	Issue	5	用吹毛求疵的精神改进日志，列出多少个改进点。	2018-06-05 06:18:34.341863	f
189	74	Issue	5	bucket instance，这个instance和元数据的version是一回事么？\r\n显然不是一回事。\r\nbucket instance实际上bucket meta instance。在当前版本bucket信息分为2部分：\r\n1，bucket entry (记录了bucket name，bucket id等)\r\n2，bucket instance\r\n分离的目的是什么？\r\n\r\n根据bucket id可以找到具体的bucket instance。 bucket id仅在reshard的时候会发生变化。\r\n\r\nuser link 到某个bucket instance，但是这有什么用呢？\r\n\r\nversion tacker是给多客户端并发用的。读上来写下去，如果覆盖其他客户端写下来的就有不一致的问题。\r\n\r\n为啥UserInfo不整这个呢？\r\n\r\n	2018-06-04 09:17:08.176299	f
190	74	Issue	5	YIG并不满足我们要求，不支持usage，multisite等。\r\n\r\nmultisite设计在元数据中占了很重要的部分。另外与多版本等特性牵连。\r\nYIG是一个内部使用的系统，这与我们的目标也不一致。\r\n\r\ns3协议完整性，YIG，Minio等系统均不一定支持。\r\n\r\n\r\n	2018-06-05 06:04:03.444927	f
192	74	Issue	5	先读懂Yig代码，学习下go	2018-06-05 13:38:22.237175	f
193	71	Issue	5	替换kernel，支持xfs	2018-06-08 08:49:18.828863	f
194	75	Issue	5	V5实施计划：\r\n文件级别去重，CDP 一个人\r\n超生命周期的数据迁移+bucket跨pool，placement整改  一个人\r\n租户的Qos控制等周边 一个人\r\n性能  一个人\r\n\r\n可能需组建实施团队。\r\n1+1\r\n6个人团队其实也差不多，2运维+4研发	2018-06-14 07:13:05.259557	f
128	40	Issue	5	实施新的修改方案，slave zone也获取bucket info来执行remove_object。\r\n果然这样delete olh之后的行为在slave也是将null instance改为delete状态了。\r\n\r\n但是最后在delete这个delete_marker时 slave zone无法同步。\r\n最后一步的bilog:\r\n{\r\n        "op_id": "0#00000000018.116410.8",\r\n        "op_tag": "000000005a13bfc7ydir27j2hcqavwvs",\r\n        "op": "unlink_instance",\r\n        "object": "rgw_client_io.cc",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 18,\r\n        "timestamp": "2017-11-21 05:55:19.897362372Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 7\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    }\r\n\r\nslave zone出错信息：\r\n2017-11-21 05:55:20.051206 7f1f693ee700 20 get_obj_state: s->obj_tag was set empty\r\n2017-11-21 05:55:20.051221 7f1f693ee700 20 get_obj_state_impl: setting s->olh_tag to 2exxf5r5b386w6hcf01s64eo8gblmm5r\r\n2017-11-21 05:55:20.051258 7f1f693ee700 20 _send_request(): get_obj_state() obj=test13:rgw_client_io.cc returned ret=-2\r\n2017-11-21 05:55:20.051344 7f1f563ff700 10 multisite data sync should run between 0 - 24 now 5 = yes\r\n2017-11-21 05:55:20.051360 7f1f563ff700 20 cr:s=0x7f1e119518a0:op=0x7f1e18c84800:14RGWRemoveObjCR: operate()\r\n2017-11-21 05:55:20.051371 7f1f563ff700 20 cr:s=0x7f1e119518a0:op=0x7f1e18c84800:14RGWRemoveObjCR: operate() returned r=-2\r\n\r\n\r\n这是一个新问题，slave zone的delete marker无法删除，还有点比较奇葩，在这种情况下master zone可以删除bucket，slave zone不完全是空的，但是也可以删除。\r\n区别在于master zone执行的时候instance是"null"，而slave zone执行的时候就变成empty了\r\n\r\n\r\nint RGWRados::Object::Delete::delete_obj()\r\n{\r\n  RGWRados *store = target->get_store();\r\n  rgw_obj& src_obj = target->get_obj();\r\n  const string& instance = src_obj.key.instance;\r\n  rgw_obj obj = src_obj;\r\n\r\n  if (instance == "null") {\r\n    obj.key.instance.clear();\r\n  }\r\n\r\n罪魁祸首是这个。太乱了\r\n虽然olh和null instance共用一个对象，但是bi里面还是单独的。\r\n像1000_rgw_acl_swift.hi 就是null instance的。	2017-11-21 11:42:05.379941	f
138	40	Issue	5	还是有问题，在关闭多版本情况下，直接先删除null的instance\r\n\r\n出现了循环执行unlink instance的现象，并且对象无法再次上传成功了\r\n\r\n{\r\n        "op_id": "62#00000000388.16589.2",\r\n        "op_tag": "_ROD7trnSGrT27TNONkLLybmRDjejAVq",\r\n        "op": "del",\r\n        "object": "rgw_tag.h",\r\n        "instance": "null",\r\n        "state": "pending",\r\n        "index_ver": 388,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "62#00000000389.16590.3",\r\n        "op_tag": "_ROD7trnSGrT27TNONkLLybmRDjejAVq",\r\n        "op": "del",\r\n        "object": "rgw_tag.h",\r\n        "instance": "null",\r\n        "state": "complete",\r\n        "index_ver": 389,\r\n        "timestamp": "2017-11-22 15:42:02.691040405Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 138991\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "62#00000000390.16592.3",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5925.5134",\r\n        "op": "write",\r\n        "object": "rgw_tag.h",\r\n        "instance": "",\r\n        "state": "pending",\r\n        "index_ver": 390,\r\n        "timestamp": "2017-11-22 15:42:02.691040405Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 138840\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "62#00000000391.16593.4",\r\n        "op_tag": "ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5925.5134",\r\n        "op": "write",\r\n        "object": "rgw_tag.h",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 391,\r\n        "timestamp": "2017-11-22 15:42:40.512816990Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 138993\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "62#00000000392.16594.14",\r\n        "op_tag": "000000005a159af0ffwiq3g51v6ftzmy",\r\n        "op": "link_olh",\r\n        "object": "rgw_tag.h",\r\n        "instance": "",\r\n        "state": "complete",\r\n        "index_ver": 392,\r\n        "timestamp": "2017-11-22 15:42:40.512816990Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 10\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    }\r\n最终bilog如上，但是看不到olh和null instance了。\r\n\r\n只剩如此了：\r\nrgw_tag.h\t\r\nrevision #: 2\t2017/11/22 23:41:17\t"89acfb788b24ef60d7ad87fb3b9784cd"\t1012 bytes\tSTANDARD\tnuser (nuser)\t4LzRLOgL3pQ.l8ofPzfjslnV.llPIDY\t\r\nrevision #: 1\t2017/11/22 23:41:11\t"89acfb788b24ef60d7ad87fb3b9784cd"\t1012 bytes\tSTANDARD\tnuser (nuser)\tThf-sv4MbTx.GgdHhOSa4SQLhgD36oN\t	2017-11-22 21:33:24.758628	f
140	42	Issue	5	某次同步失败的log\r\n2017-11-24 10:04:47.945250 7f733ffff700  0 inc sync bucket:test30:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5964.2:25ERROR: failure in sync, backing out (sync_status=-125)\r\n2017-11-24 10:04:47.948018 7f733ffff700  0 datalog.sync-status.shard.ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.114.retry add retry entry test30:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5964.2:25 ret 0\r\n2017-11-24 10:04:50.733681 7f734c7e1700  0 _send_request(): deleting obj=test30:rgw_usage.h\r\n2017-11-24 10:04:50.736663 7f733ffff700  0 ERROR: failed to sync object: test30:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5964.2:25/rgw_usage.h	2017-11-24 15:49:55.626917	f
131	40	Issue	5	解决方案：\r\n跳过这种情况？如果是del操作，并且instance是null的情况。\r\n这种必须经过unlink instance来同步。\r\n或者说del并且version是true的情况，都给干掉\r\n\r\n还有个疑问：\r\n{\r\n        "op_id": "62#00000000202.10051.5",\r\n        "op_tag": "000000005a1415a0s3qnmhfxyi4s2fxr",\r\n        "op": "unlink_instance",\r\n        "object": "rgw_tag.h",\r\n        "instance": "SBHR6PNOeCeGbI6ySeYBlV9Kk8AaCLt",\r\n        "state": "complete",\r\n        "index_ver": 202,\r\n        "timestamp": "2017-11-21 12:01:36.120037613Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 14\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "62#00000000203.10052.2",\r\n        "op_tag": "_2uOx41g3hOZB52zCOpLG7bfjRds8zTl",\r\n        "op": "del",\r\n        "object": "rgw_tag.h",\r\n        "instance": "SBHR6PNOeCeGbI6ySeYBlV9Kk8AaCLt",\r\n        "state": "pending",\r\n        "index_ver": 203,\r\n        "timestamp": "2017-11-21 11:29:12.417290614Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 132249\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "62#00000000204.10053.3",\r\n        "op_tag": "_2uOx41g3hOZB52zCOpLG7bfjRds8zTl",\r\n        "op": "del",\r\n        "object": "rgw_tag.h",\r\n        "instance": "SBHR6PNOeCeGbI6ySeYBlV9Kk8AaCLt",\r\n        "state": "complete",\r\n        "index_ver": 204,\r\n        "timestamp": "2017-11-21 11:29:12.417290614Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 132252\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    }\r\n像这种bilog，如果分2次执行，逻辑上会不会出问题呢？\r\n不会返回-2，但是同步是成功的\r\n\r\n2017-11-21 12:42:51.749610 7efcd97ff700 10 multisite data sync should run between 0 - 24 now 12 = yes\r\n2017-11-21 12:42:51.749613 7efcd97ff700 20 cr:s=0x7efcd8362b00:op=0x7efb9d690800:26RGWBucketSyncSingleEntryCRISs11rgw_obj_keyE: operate()\r\n2017-11-21 12:42:51.749619 7efcd97ff700  5 Sync:ae41357a:data:Object:test18:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5686.2:62/rgw_tag.h[23DS6dImg5npSoIwbiYyw8aDCCgLoho][0]:done, retcode=-2\r\n2017-11-21 12:42:51.749621 7efcd97ff700  6 sync object retcode= -2: test18:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5686.2:62/rgw_tag.h\r\n2017-11-21 12:42:51.749635 7efcd97ff700 20 store_marker(): updating marker marker_oid=bucket.sync-status.ae41357a-6f20-47bb-a3bd-1f0a166cd8f4:test18:ae41357a-6f20-47bb-a3bd-1f0a166cd8f4.5686.2:62 marker=00000000216.10073.3\r\n	2017-11-21 18:11:52.402218	f
133	40	Issue	5	但是过滤掉delete操作也不是一种很好的办法，因为有些是remove instance的 不是unlink instance	2017-11-21 19:30:28.681453	f
141	42	Issue	1	同样测试用例，有时候删除不成功，有时候同步写入不成功。	2017-11-24 19:49:00.642823	f
177	71	Issue	5	cd ./ceph-detect-init ; ../tools/setup-virtualenv.sh /tmp/ceph-detect-init-virtualenv ; test -d wheelhouse && export NO_INDEX=--no-index ; /tmp/ceph-detect-init-virtualenv/bin/pip install $NO_INDEX --find-links=file://$(pwd)/wheelhouse -e .\r\n../tools/setup-virtualenv.sh:行21: virtualenv: 未找到命令\r\n../tools/setup-virtualenv.sh:行22: /tmp/ceph-detect-init-virtualenv/bin/activate: 没有那个文件或目录\r\n../tools/setup-virtualenv.sh:行25: pip: 未找到命令\r\n../tools/setup-virtualenv.sh:行30: pip: 未找到命令\r\n../tools/setup-virtualenv.sh:行32: pip: 未找到命令\r\n/bin/bash: /tmp/ceph-detect-init-virtualenv/bin/pip: 没有那个文件或目录\r\nMakefile:33198: recipe for target '/tmp/ceph-detect-init-virtualenv' failed\r\n\r\n直接不编译ceph-disk, ceph-detect-init,test等	2018-05-17 09:21:40.247592	f
217	76	Issue	5	其实去重是对象级别的，我们需要有一个地方表示对象实例。要么就仍然使用head_obj表示，然后head_obj上有引用计数。\r\n\r\ntail是一个obj chain，gc的时候是整个移除的。chain上的每个obj都有引用计数。\r\n\r\nmanifest仍然不需要head_bucket和tail bucket，但是需要一个字段记录数据在哪个pool。\r\n1，移到其他pool\r\n2，修改bi\r\n3，减少源对象的引用计数\r\n这是lc迁移的逻辑。\r\n\r\n对象上有引用计数，对象全部都在lc的时候做彻底删除。\r\nlc删除：\r\n1，过期删除\r\n2，把标记删除的删除（有两种情况，一是对象覆盖，二是删除操作）\r\n删除都是调用cls_refcount_put检查是否有引用计数\r\n\r\nobject放在哪个pool，后面不仅取决于bucket，还跟存储策略有关系，不过暂时先不管。\r\nmainfest记录obj在哪个pool。	2018-06-28 12:51:13.349513	f
224	76	Issue	5	static inline void prepend_bucket_marker(rgw_bucket& bucket, const string& orig_oid, string& oid)\r\n{\r\n  //bucket所有对象的前缀\r\n  if (bucket.marker.empty() || orig_oid.empty()) {\r\n    oid = orig_oid;\r\n  } else {\r\n    oid = bucket.marker;\r\n    oid.append("_");\r\n    oid.append(orig_oid);\r\n  }\r\n}\r\n\r\nRGWObjManifest::get_implicit_location\r\nRGWObjManifest::generator::create_begin\r\n\r\n对象名字的来源。\r\n\r\nbucket marker + ns + oid（有时候是instance） + part_id + stripe.\r\n非多版本：\r\nbucket marker + oid    /  bucket marker + shadow + prefix + stipe\r\n多版本：\r\nbucket marker + instance + oid  /  bucket marker + shadow + instance + prefix + stipe\r\n\r\n统一成：\r\n对象\r\nbucket marker + ns + oid + prefix + stripe\r\n\r\nhas_manifest这个标记要好好处理\r\n	2018-07-02 12:16:46.64461	f
219	76	Issue	5	manifest中保留instance和rule即可？理论上是这样的，没有head对象了。\r\n没有head概念 这很重要，就是一个条带化的instance。\r\ncopy，rollback，重用对象的逻辑都于此相关。\r\n\r\nhead_obj概念仍然在，但是与之前不同的是 head_obj是第一个分片。并不会承担更多。	2018-06-30 07:42:00.1106	f
139	40	Issue	5	可见合入社区2个gix 再加上解决上面2问题仍然没有彻底解决问题。\r\n\r\n看来必须彻底理清楚这块才行。\r\n\r\n\r\n{\r\n        "op_id": "62#00000000378.16576.7",\r\n        "op_tag": "000000005a159aedllk2fnhnnvc6bxyx",\r\n        "op": "unlink_instance",\r\n        "object": "rgw_tag.h",\r\n        "instance": "null",\r\n        "state": "complete",\r\n        "index_ver": 378,\r\n        "timestamp": "2017-11-22 15:42:37.654742054Z",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 9\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "62#00000000379.16577.2",\r\n        "op_tag": "_YWJfdrdcIBK4YLw3v2e-cAVJWFj0YT6",\r\n        "op": "del",\r\n        "object": "rgw_tag.h",\r\n        "instance": "null",\r\n        "state": "pending",\r\n        "index_ver": 379,\r\n        "timestamp": "0.000000",\r\n        "ver": {\r\n            "pool": -1,\r\n            "epoch": 0\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n    {\r\n        "op_id": "62#00000000380.16578.3",\r\n        "op_tag": "_YWJfdrdcIBK4YLw3v2e-cAVJWFj0YT6",\r\n        "op": "del",\r\n        "object": "rgw_tag.h",\r\n        "instance": "null",\r\n        "state": "complete",\r\n        "index_ver": 380,\r\n        "timestamp": "2017-11-22 15:42:02.691040405Z",\r\n        "ver": {\r\n            "pool": 11,\r\n            "epoch": 138982\r\n        },\r\n        "bilog_flags": 1,\r\n        "versioned": true,\r\n        "owner": "",\r\n        "owner_display_name": ""\r\n    },\r\n注意unlink instance的时间。\r\n\r\n测试方法：\r\n1，开启多版本，上传对象\r\n2，挂起多版本，再次上传\r\n3，删除对象。\r\n\r\n这里不应该使用unlink instance的时间。unlink instance的bilog时间为当前时间。所以出现了循环删除的现象。\r\n\r\n这个问题的根因是null instance被干掉之后，同步逻辑去获取olh对象，并且以为olh就是null instance。\r\n其实只有在极少情况下 null instance与olh重叠。仅当olh中target指向null instance时，两者才有重叠关系。\r\n\r\n//XRCM,if do not follow olh,and instance is not empty\r\n//we should return -ENOENT\r\n\r\n仍然停不下来，还是不停delete，而且olh对象的olh.info属性确实没了。但是为啥就删不掉这个对象呢？\r\n\r\nnull instance在开启多版本或者suspend多版本的情况下，任何时候都不应该被删除，除非所有版本都被干掉。\r\n\r\n\r\n	2017-11-22 21:35:01.315969	f
129	40	Issue	5	修改后该用例可以通过测试了。\r\n主要有2个问题：\r\n1，slave zone在delete_obj时没有考虑version suspend状态，导致主从执行的delete olh逻辑不一样。该问题对于put请求同样如此，但是put请求使用了bucket info中的version\r\n  RGWPutObjProcessor_Atomic processor(obj_ctx,\r\n                                      dest_bucket_info, dest_obj.bucket, dest_obj.get_orig_obj(),\r\n                                      cct->_conf->rgw_obj_stripe_size, tag, dest_bucket_info.versioning_enabled());\r\n\r\n  只要经过olh的bilog link或unlink都是versioned，但是执行时候光看这个是不够的。\r\n  问题同样在于，如果bucket状态并不一样，严格的执行另外一个bucket的物理日志么？\r\n\r\n2，在删除null instance时，主zone执行的是unlink instance,但是由于bilog中instance被清理掉，变成empty。\r\n以目前的逻辑 rgw_bucket_unlink_instance执行时不可能看到null instance。\r\n从而使得slave zone执行delete_obj时走到set_olh分支，出现不一致。\r\n\r\n为什么写null instance没问题呢？\r\n会不会一个写到null instance，另一个写出一个新版本？\r\n写的时候没有清理写入目标的instance。 当然在多版本挂起的时候按理说不支持写null instance吧，此时null instance就是olh？\r\n\r\n2.1 这段逻辑也有问题\r\nrgw_bucket_dir_entry dirent;\r\n\r\n      //XRWHY: clear "null" instance before this?\r\n      //if do not clear, it will find 1000_xxinull? no this bi entry\r\n      //i think it is wrong here,we should not get the place holder as null instance\r\n      int r = store->bi_get_instance(obj, &dirent);\r\n      if (r < 0) {\r\n        return r;\r\n      }\r\n\r\n3，slave zone执行时，不同instance乱序执行，可能存在问题。\r\n\r\ncheck：\r\n1，slave zone同步多版本时，应该follow olh么？	2017-11-21 16:49:12.176266	f
142	29	Issue	5	修改content_type，增加http header都是走的：\r\n#0  RGWRados::Bucket::UpdateIndex::complete (this=this@entry=0x7f9225b2b520, poolid=poolid@entry=8, epoch=epoch@entry=26, size=size@entry=501, ut=..., \r\n    etag="05b64c65fcc220fe52d5a9bf8fee7172", content_type="text/txt", acl_bl=acl_bl@entry=0x7f9225b2b4d0, category=RGW_OBJ_CATEGORY_MAIN, remove_objs=0x0, op=op@entry=CLS_RGW_OP_ADD)\r\n    at rgw/rgw_rados.cc:9334\r\n#1  0x00007f92eb8bcf05 in RGWRados::Object::Write::write_meta (this=this@entry=0x7f9225b2b910, size=501, attrs=std::map with 10 elements = {...}) at rgw/rgw_rados.cc:6367\r\n#2  0x00007f92eb8bdc30 in RGWPutObjProcessor_Atomic::do_complete (this=0x7f9225b2c110, etag=..., mtime=0x7f9299dc96a0, set_mtime=..., attrs=std::map with 10 elements = {...}, delete_at=..., \r\n    if_match=0x0, if_nomatch=0x0, zones_trace=0x0) at rgw/rgw_rados.cc:2557\r\n#3  0x00007f92eb88452d in RGWPutObjProcessor::complete (this=this@entry=0x7f9225b2c110, etag="05b64c65fcc220fe52d5a9bf8fee7172", mtime=mtime@entry=0x7f9299dc96a0, set_mtime=..., \r\n    set_mtime@entry=..., attrs=std::map with 10 elements = {...}, delete_at=..., delete_at@entry=..., if_match=if_match@entry=0x0, if_nomatch=if_nomatch@entry=0x0, \r\n    zones_trace=zones_trace@entry=0x0) at rgw/rgw_rados.cc:2181\r\n#4  0x00007f92eb8b852b in RGWRados::copy_obj_data (this=this@entry=0x7f92dad4dc00, obj_ctx=..., dest_bucket_info=..., read_op=..., end=<optimized out>, dest_obj=..., src_obj=..., \r\n    max_chunk_size=4194304, mtime=0x7f9299dc96a0, set_mtime=set_mtime@entry=..., attrs=std::map with 10 elements = {...}, category=RGW_OBJ_CATEGORY_MAIN, olh_epoch=0, delete_at=..., \r\n    version_id=0x0, ptag=0x7f9225b2e580, petag=0x7f9299dc9968, err=0x7f9225b2e120) at rgw/rgw_rados.cc:7720\r\n#5  0x00007f92eb8e3f9d in RGWRados::copy_obj (this=0x7f92dad4dc00, obj_ctx=..., user_id=..., client_id=..., op_id=..., info=<optimized out>, source_zone="", dest_obj=..., src_obj=..., \r\n    dest_bucket_info=..., src_bucket_info=..., src_mtime=0x7f9299dc9698, mtime=0x7f9299dc96a0, mod_ptr=0x0, unmod_ptr=0x0, high_precision_time=false, if_match=0x0, if_nomatch=0x0, \r\n    attrs_mod=RGWRados::ATTRSMOD_REPLACE, copy_if_newer=false, attrs=std::map with 10 elements = {...}, category=RGW_OBJ_CATEGORY_MAIN, olh_epoch=0, delete_at=..., version_id=0x0, \r\n    ptag=0x7f9225b2e580, petag=0x7f9299dc9968, err=0x7f9225b2e120, progress_cb=0x7f92eb84abb0 <copy_obj_progress_cb(off_t, void*)>, progress_data=0x7f9299dc9400) at rgw/rgw_rados.cc:7526\r\n#6  0x00007f92eb856127 in RGWCopyObj::execute (this=0x7f9299dc9400) at rgw/rgw_op.cc:3653\r\n#7  0x00007f92eb87b81b in process_request (store=0x7f92dad4dc00, rest=0x7ffcf3d9f130, req=req@entry=0x7f916bc30100, client_io=client_io@entry=0x7f9225b2e6d0, olog=0x0)\r\n    at rgw/rgw_process.cc:174\r\n#8  0x00007f92f5340cd0 in RGWFCGXProcess::handle_request (this=0x7f92dadbae00, r=0x7f916bc30100) at rgw/rgw_fcgi_process.cc:121\r\n#9  0x00007f92f5342970 in RGWProcess::RGWWQ::_process (this=0x7f92dadbb0b8, req=0x7f916bc30100) at rgw/rgw_process.h:84\r\n#10 0x00007f92ebbf04be in ThreadPool::worker (this=0x7f92dadbae70, wt=0x7f92b2441e20) at common/WorkQueue.cc:128\r\n#11 0x00007f92ebbf13a0 in ThreadPool::WorkThread::entry (this=<optimized out>) at common/WorkQueue.h:445\r\n#12 0x00007f92ea9abdc5 in start_thread () from /lib64/libpthread.so.0\r\n#13 0x00007f92e9fb776d in clone () from /lib64/libc.so.6\r\n\r\n\r\n<pre><code class="cpp">\r\n\r\nRGWOp *RGWHandler_REST_Obj_S3::op_put()\r\n{\r\n  if (is_acl_op()) {\r\n    return new RGWPutACLs_ObjStore_S3;\r\n  } else if (is_tagging_op()) {\r\n    return new RGWPutObjTags_ObjStore_S3;\r\n  }\r\n  \r\n  if (s->init_state.src_bucket.empty())\r\n    return new RGWPutObj_ObjStore_S3;\r\n  else\r\n    return new RGWCopyObj_ObjStore_S3;\r\n}\r\n</code></pre>\r\n\r\nRGWPutMetadataObject 是swift用的\r\nRGWSetAttrs rgw_file 使用\r\n\r\nCors，ACL，Tag是S3走set attr的。\r\n	2017-11-25 14:18:57.120847	f
143	35	Issue	5	该问题的实际情况是master zong从slave 同步set attr失败，原因从当时日志看是set attr返回了NOT MODIFY。\r\nset attr应该处理这种情况	2017-11-25 15:20:31.646891	f
144	44	Issue	5	果然是这样：\r\nRGWPutObjProcessor_Atomic processor(obj_ctx,\r\n                                      dest_bucket_info, dest_obj.bucket, dest_obj.get_orig_obj(),\r\n                                      cct->_conf->rgw_obj_stripe_size, tag, dest_bucket_info.versioning_enabled());\r\n看最后一个参数。\r\n\r\nbucket info就是本地的，因而如果version没设置，是有可能出现这种情况的	2017-11-27 14:11:56.033174	f
146	41	Issue	5	这里有个问题，就是在另一个rgw挂掉期间，这些执行的rgw操作其根据的是当时的bucket状态。这样非常容易造成混乱。\r\n\r\nver1.txt\r\nver1.txtv913i-mYef0JLNm9RJjKoLcB446a7HwY5XKX\r\nver1.txtv914i\r\n0_00000000001.193.2\r\n0_00000000002.194.2\r\n0_00000000003.195.2\r\n0_00000000004.196.3\r\n0_00000000005.197.3\r\n0_00000000006.198.3\r\n0_00000000007.199.10\r\n1000_ver1.txti\r\n1000_ver1.txti-mYef0JLNm9RJjKoLcB446a7HwY5XKX\r\n1000_ver1.txti9GDcGQ8GIW2QwRU7D2hIiuqE0dlU9Dq\r\n1001_ver1.txt\r\n\r\n副本节点进入了这种状态：\r\nver1.txt\t\r\nrevision #: 2\t2017/11/28 9:20:47\t"05b64c65fcc220fe52d5a9bf8fee7172"\t501 bytes\tSTANDARD\tnuser (nuser)\tnull\t\r\nrevision #: 1 (current)\t2017/11/28 9:19:54\t"05b64c65fcc220fe52d5a9bf8fee7172"\t501 bytes\tSTANDARD\tnuser (nuser)\t-mYef0JLNm9RJjKoLcB446a7HwY5XKX\t\r\n\r\n还有这种状态：\r\nver2.txt\t\r\nrevision #: 3\t2017/11/28 9:27:05\t"7a6f01477ea0ab4fcedecbeeb2b310e9"\t501 bytes\tSTANDARD\tnuser (nuser)\tnull\t\r\nrevision #: 2 (current)\t2017/11/28 9:26:52\t"7a6f01477ea0ab4fcedecbeeb2b310e9"\t501 bytes\tSTANDARD\tnuser (nuser)\t9g0GBL08NZBpVoElQs9LxsV1cRZKJRw\t\r\nrevision #: 1\t2017/11/28 9:26:46\t"7a6f01477ea0ab4fcedecbeeb2b310e9"\t501 bytes\tSTANDARD\tnuser (nuser)\tklz6xfxkVRu-7CRmRt1Rfslsk6La9-J\t\r\n\r\n这些问题出现还有一个原因就是同步的乱序执行。对于同一个对象的不同instance，乱序执行是不对的。\r\n\r\n这块没必现有种原因可能是olh id tag并非每次都变。	2017-11-28 07:25:33.474512	f
150	41	Issue	5	执行上述过程后，逐个删除对象实例，出现slave zone无法删除的现象：\r\n\r\n2017-11-28 07:24:39.650630 7f98aabe1700 20 bucket_index_link_olh() target_obj=test14:_:6iEB5T2cEw0XFCcf3AS26mFjwQlivT2_ver2.txt returned -2\r\n2017-11-28 07:24:39.650648 7f98aabe1700 20 _send_request(): delete_obj() obj=test14:_:6iEB5T2cEw0XFCcf3AS26mFjwQlivT2_ver2.txt returned ret=-2\r\n2017-11-28 07:24:39.650713 7f989e3ff700 10 multisite data sync should run between 0 - 24 now 7 = yes\r\n2017-11-28 07:24:39.650726 7f989e3ff700 20 cr:s=0x7f9761d8c080:op=0x7f97618cc800:14RGWRemoveObjCR: operate()\r\n2017-11-28 07:24:39.650734 7f989e3ff700 20 cr:s=0x7f9761d8c080:op=0x7f97618cc800:14RGWRemoveObjCR: operate() returned r=-2\r\n2017-11-28 07:24:39.650740 7f989e3ff700 10 multisite data sync should run between 0 - 24 now 7 = yes\r\n2017-11-28 07:24:39.650741 7f989e3ff700 20 cr:s=0x7f9761d8c080:op=0x7f97618cc000:26RGWBucketSyncSingleEntryCRISs11rgw_obj_keyE: operate()\r\n2017-11-28 07:24:39.650745 7f989e3ff700  5 Sync:f943c167:data:Object:test14:f943c167-90d3-41f9-92d0-955fbb27eae4.4425.1:1/ver2.txt[6iEB5T2cEw0XFCcf3AS26mFjwQlivT2][0]:done, retcode=-2\r\n2017-11-28 07:24:39.650747 7f989e3ff700  6 sync object retcode= -2: test14:f943c167-90d3-41f9-92d0-955fbb27eae4.4425.1:1/ver2.txt\r\n	2017-11-28 13:14:50.559904	f
152	41	Issue	5		2017-11-28 14:50:45.659795	f
145	40	Issue	5	问题仍然没有得到解决。\r\n目前已经合入修改：\r\n1，zone trace避免循环同步\r\n2，不同步olh id/tag等\r\n3，olh 和 null共用对象，其时间不跟据olh调整\r\n4，remove使用bucket info，而不是bilog中的versioned\r\n5，delete使用src_obj，包含null instance。\r\n\r\n目前的问题是挂起时在olh上执行delete时，把null instance给删除了（这是正确的，对于挂起的bucket，olh就是null instance）.\r\n但是之后该null上的delete marker无法删除，这个行为就不对了。\r\ns3的行为是删除成功，且current version指向下一个版本。\r\n\r\n原因是带null instance执行 unlink instance，在bi_get_instance时返回-2\r\n我真不知道这种delete marker有何意义？为啥需要删除delete marker才能指向下一个版本呢？这里逻辑是什么？\r\n也许可以这么理解，那个delete marker并非是null instance的，而是上一个版本的，你删除了delete marker，自然就可以显示上一个版本了。\r\n\r\n这里怪异产生的原因是null instance的存在，null instance在version suspend的时候，与olh同消亡。\r\n\r\nrgw_bucket_dir_entry dirent;\r\n\r\n      //XRWHY: clear "null" instance before this?\r\n      //if do not clear, it will find 1000_xxinull? no this bi entry\r\n      //i think it is wrong here,we should not get the place holder as null instance\r\n      int r = store->bi_get_instance(obj, &dirent); //这里的obj不修改为src_obj,就不会有上述问题，但根因是什么？\r\n      if (r < 0) {\r\n        return r;\r\n      }\r\n      result.delete_marker = dirent.is_delete_marker();\r\n      //XRCM: unlink instance is pure op on obj instance,not olh\r\n      r = store->unlink_obj_instance(target->get_ctx(), target->get_bucket_info(), obj, params.olh_epoch);\r\n      if (r < 0) {\r\n        return r;\r\n      }\r\n      result.version_id = instance;\r\n	2017-11-27 21:08:30.692944	f
147	41	Issue	5	2017-11-28 02:54:51.650035 7f56f17f8700 10 gen olh tag, object: test12:ver2.txt tag: k0qj3pa1hhax3ztgbqql9efj6f90fumw\r\n2017-11-28 02:54:51.650092 7f56efff5700 10 gen olh tag, object: test12:ver2.txt tag: 1226b3mi8altmvy75e1epts6o60zaemw\r\n2017-11-28 02:54:51.650666 7f56efff5700 20 olh_init_modification() target_obj=test12:_:7W8-XjnNuotU6y62zWGVefYTcq8eWbi_ver2.txt delete_marker=0 returned -125\r\n果然出现了这种现象，并发执行，都去产生olh tag。	2017-11-28 08:46:58.065915	f
149	41	Issue	5	修改思路1：\r\n如果list能否逆序就比较合适，但是这样也会有很多问题。工作量也不小。\r\n\r\n修改思路2：\r\n根据状态，修改执行逻辑。如果非current，就只拷贝instance。\r\nRGW_BUCKET_DIRENT_FLAG_CURRENT 这个flag的使用。 还有一点，如果你上来直接写最近的，其实olh epoch最大，这个也影响着后面的逻辑。\r\nversioned_epoch 也就是olh epoch。\r\n所以最终执行效果是 ： 最新先执行，先link，后面的执行，但是不link，只写instance。\r\nyield {\r\n            spawn(new RGWBucketSyncSingleEntryCR<rgw_obj_key, rgw_obj_key>(sync_env, bucket_info, bs,\r\n                                                                           entry->key,\r\n                                                                           false, /* versioned, only matters for object removal */\r\n                                                                           entry->versioned_epoch, entry->mtime,\r\n                                                                           entry->owner, op, CLS_RGW_STATE_COMPLETE, entry->key, marker_tracker, zones_trace),\r\n                                                                           entry->is_latest);\r\n          }\r\n如果是latest，则同步执行。其他instance顺序则无所谓。这样还有一个作用就是仅产生一个olh_tag.\r\n但是其他执行是否存在关联顺序还要进一步分析代码	2017-11-28 12:02:06.804553	f
195	76	Issue	5	BI修改，增加需要的类型，先不做纯粹的改造。\r\n增加get操作。把属性丢到bi。\r\n\r\n本周完成读写，list流程修改，可编译通过。\r\n\r\n先调通非多版本的。\r\nput流程还没改完，明天继续修改。\r\n1，put delete list改完联调，基本功能。\r\n2，支持分片上传，copy\r\n3，支持gc\r\n4，支持多版本\r\n5，支持multipart\r\n5，支持生命周期\r\n6，list支持按修改时间查询\r\n7，结合该优化，考虑rados改进，像海航优化的不去get_object_content。\r\n\r\n计划本周完成一个可以跑的版本，即完成验证工作。	2018-06-19 12:17:32.571817	f
208	76	Issue	5	分片上传和多版本基本可以成功。\r\n可见在原有dir上面，套一个object entry的修改方法在端段时间内就能完成原型修改。\r\n但是细节的雕塑需要的时间更多。\r\n\r\n产生delete marker的逻辑中，index_ctx 没有初始化。\r\n	2018-06-23 12:19:23.083731	f
211	77	Issue	5	有一点确实存在问题，ES zone依赖于其他zone的集群，这个关系就有点乱了\r\nzone是在集群之上的。\r\n理论上es的rgw代表的是es集群的同步服务，应该依赖于es集群，而不是其他集群	2018-06-25 08:08:13.394033	f
198	76	Issue	5	多版本的对象算几个？\r\n有几个实例算几个，但是delete marker不算在内。\r\n\r\n\r\n这种级别的改造，没有测试用例真的玩不了。	2018-06-20 18:49:47.55925	f
196	76	Issue	5	do not need olh epoch now! no use. 对于副本而言就是写入一个instance。。\r\n多版本的区别焦点在于instance名字。 “null”就是非多版本，其他就是多版本。\r\n\r\n多版本的顺序关系取决于时间，以及在object entry中的顺序，object entry在新的instance产生时，总是append的。\r\n同步写入的instance根据时间排序。在时间严重不一致时，做出提示。\r\n\r\n配额本没必要实时刷新，在多版本情况下，每个版本。\r\n\r\n直接修改immutable head可以跳过first chunk。	2018-06-20 08:57:17.78574	f
200	76	Issue	5	性能，可靠性，稳定性取决于设计，而功能可以用测试来解决。	2018-06-20 18:56:55.201975	f
202	76	Issue	5	多版本list序问题。\r\n采用反转的方式处理，根据epoch反转处理。\r\n\r\nif (ret == -ENOENT) {\r\n   /* couldn't find the entry, set key value after the current object */\r\n    char buf[2] = { 0x1, 0 };\r\n    string s(buf);\r\n    *index_key  = key.name + s;\r\n    return 0;\r\n  }\r\n这里仍然有问题，如果list的marker被干掉了，原来是这么处理的？ why?	2018-06-21 09:35:14.980197	f
204	76	Issue	5	manifest相关，需改造，直接上来写head对象。	2018-06-21 15:15:48.709595	f
205	76	Issue	5	非多版本对象的put/get/delete/list都没问题了，确实简单不少。\r\n但是有不少旁路分支可能存在一些问题。比如delete带的哪些参数，unmod_since等等	2018-06-22 17:06:07.601437	f
153	41	Issue	5	测试场景：\r\n1，关闭slave rgw\r\n2，不开启多版本上传对象\r\n3，开启多版本上传对象\r\n4，启动slave rgw\r\n\r\n全量同步失败：\r\n2017-11-28 08:55:26.639873 7fe5adff4700 10 get_canon_resource(): dest=/test16/ppp.txt?versionId=null\r\n2017-11-28 08:55:26.639874 7fe5adff4700 10 generated canonical header: GET\r\n\r\n\r\nTue Nov 28 08:55:26 2017\r\n/test16/ppp.txt?versionId=null\r\n2017-11-28 08:55:26.639914 7fe5adff4700 15 generated auth header: AWS 7AF6X6C4ZGNDG6U99MQM:6sU12N2aKcdaAFK4q6Dx6Y8ZKgA=\r\n2017-11-28 08:55:26.639916 7fe5adff4700 20 RGWEnv::set(): AUTHORIZATION: AWS 7AF6X6C4ZGNDG6U99MQM:6sU12N2aKcdaAFK4q6Dx6Y8ZKgA=\r\n2017-11-28 08:55:26.639921 7fe5adff4700 20 sending request to http://172.18.0.130:8080/test16/ppp.txt?rgwx-zonegroup=a7367de0-4297-42da-860c-82eeab41d953&rgwx-prepend-metadata=a7367de0-4297-42da-860c-82eeab41d953&rgwx-sync-manifest&versionId=null\r\n2017-11-28 08:55:26.639927 7fe5adff4700  5 add_request request http://172.18.0.130:8080/test16/ppp.txt?rgwx-zonegroup=a7367de0-4297-42da-860c-82eeab41d953&rgwx-prepend-metadata=a7367de0-4297-42da-860c-82eeab41d953&rgwx-sync-manifest&versionId=null\r\n2017-11-28 08:55:26.639929 7fe5adff4700 20 register_request mgr=0x7fe59e9986a0 req_data->id=0, easy_handle=0x7fe59e9bf000\r\n2017-11-28 08:55:26.639932 7fe5adff4700  5 link_request req_data=0x7fe59e813580 req_data->id=0, easy_handle=0x7fe59e9bf000\r\n2017-11-28 08:55:26.646182 7fe5adff4700 10 receive_http_header\r\n2017-11-28 08:55:26.646199 7fe5adff4700 10 received header:HTTP/1.1 304 Not Modified\r\n\r\n看上去slave zone把olh当作null instance获取对象时间了，然而实际上null instance根本不存在。。\r\nnull instance是否存在只有在bucket index看得出来。\r\n\r\n删除null instance，底下对象会删除么？\r\n会，但是立马又会创建：\r\nrgw_obj_remove\r\n\r\n能否通过id tag来分辨对象是否是null instance？如果没有id tag，就认为不存在null instance。\r\n那是否不存在null instance（bi instance不存在），但是id tag属性还有的情况。\r\nnull instance delete marker的情况，bi instance和 id tag等都存在。但是显示上不可知null instance到底是否存在。\r\nquick.txt\t\r\nrevision #: 3 (deleted)\t2017/11/28 18:13:02\t\t\t\tnuser (nuser)\tnull\t\r\nrevision #: 2\t2017/11/28 18:12:15\t"bcbe3365e6ac95ea2c0343a2395834dd"\t3 bytes\tSTANDARD\tnuser (nuser)\tTf78hNMYtFh5Kmeve3EEvjbkg1AqVRs\t\r\nrevision #: 1\t2017/11/28 18:12:10\t"bcbe3365e6ac95ea2c0343a2395834dd"\t3 bytes\tSTANDARD\tnuser (nuser)\tpYFZ5.FiIbn2JsrB2SGUtcaI6GeXXUk\t\r\n\r\n可以理解成delete marker挂在null instance上，就像olh挂在null instance上一样\r\n\r\nget_obj_state_impl\r\n\r\n//if no ID,also no mtime\r\n  iter = s->attrset.find(RGW_ATTR_ID_TAG);\r\n  if (iter == s->attrset.end()) {\r\n    assert(s->mtime == real_time());\r\n    s->mtime = real_time();\r\n  }\r\n这个改法不好使，\r\n可以这样改：\r\nfetch_remote_obj:\r\n//maybe we get an olh, do not set pmod,otherwise we will get 304 Not Modified\r\n    if (!dest_obj.have_null_instance() || dest_state->has_manifest) {\r\n      if (!real_clock::is_zero(dest_state->mtime)) {\r\n        dest_mtime_weight.init(dest_state);\r\n        pmod = &dest_mtime_weight.mtime;\r\n      }\r\n    }\r\n\r\n但是这样结果仍然不对，null instance同步之后变成了有版本的了。\r\n因为同步的时候bucket已经是versioned了。\r\n为什么不传入null instance呢，看这个单\r\nhttp://tracker.ceph.com/issues/19599\r\n\r\n对象在全量同步时，是使用null instance的，不论是否开启多版本。\r\nso？ how to do？\r\n改为根据bucket状态当前bucket状态来决定是否设置version。\r\n如果没有多版本，就不设置null的情况，否则就设置。\r\n\r\n测试用例：\r\n1，上传null instance \r\n2，开启多版本\r\n3，启动rgw触发同步。\r\n\r\n修改：\r\nSHA-1: 8b4d3e8a798016e58d91676ce1a601e8bfb690cf\r\n\r\n* fix : 1,olh time use empty time,otherwise slave zone may use it as null instance mtime, then will not sync null instance because of olh's mtime is newer.\r\n2, set "null" instance for unlink_instance and skip del op, otherwise we can not delete null instance from un versioned bucket.\r\n3, set null instance for versioned(include suspended) bucket, otherwise fullsync will create new version for null instance.\r\n\r\nSigned-off-by: xierui <xierui@szsandstone.com>\r\n	2017-11-28 15:35:08.980596	f
155	41	Issue	5	全量同步问题汇总：\r\n1，由于并发执行，多个op均产生了olh_tag，导致其中部分操作由于olh tag不匹配而失败\r\n2，全量打乱执行顺序后，最新的对象可能是null instance，根据convert规则，其epoch是1，但实际上其epoch是最大的。\r\n3，根据时间同步，olh不应该有时间，因为olh并不同步。需要同步的是null instance，应该设置其为null instance的时间。\r\n4，slave zone执行del bilog时，如果master zone删除的是null instance，那么副本也应该是如此，否则逻辑就不一致了。\r\n同样在fullsync fetch对象的时候也应该感知是使用null instance，而不是olh\r\n5，全量同步没考虑同步delete marker	2017-12-17 12:18:54.491745	f
157	47	Issue	5	软件系统发生的持久化变更，都应该记录审计日志。\r\n而不是有可能打开，有可能关闭的日志。这样问题都无法定位。\r\n\r\n所有修改 都肉眼可见\r\n\r\n方便定位各种问题。	2017-12-29 22:51:39.44048	f
160	25	Issue	5	最终使用方案是rgw写日志到日志文件中，以一个固定格式。\r\n然后由logstash写入到es中。\r\n\r\n这个方案的好处是避免写日志影响业务，同时可以避免日志缓冲引起故障场景下日志丢失问题。	2018-01-18 07:31:20.164166	f
164	58	Issue	5	make -n看到的，但是ldd看不到\r\nldd看得到，但是执行不到（tcmalloc）\r\n\r\n同样的ceph-mon编译 -ljemalloc， osd也是如此。\r\n但是ceph-mon ldd看到依赖jemalloc，但是osd不依赖。？？？？？？？？？/？	2018-02-26 09:53:06.879664	f
167	62	Issue	5		2018-03-05 13:03:00.942672	f
168	69	Issue	5	比较奇怪的是scrub选取auth的时候，ReplicatePG为啥没对比oi里面的digest与ScrubObject的digest？	2018-04-11 08:31:07.813837	f
171	70	Issue	5	中广核的分发就是cdn（内容分发网络）。\r\n但是有点区别的是其分支站点并非仅仅是cdn的中间源，分支站点可以接受写请求。\r\n\r\n如果用户网站访问数据中心，其知道有哪些数据。但是在获取具体数据时，其直接在本中心获取数据。\r\ncdn会自动从数据中心拉取数据到分支。并且为数据设置缓存策略(简单实现可基于生命周期，写入时设置，读取时重置生命周期)。	2018-05-02 09:43:36.647171	f
170	70	Issue	5	qos，这篇文章值得一看： https://blog.csdn.net/u011364612/article/details/53608278。\r\nR，L，P 从三个维度实现Qos。 基于时间标签的算法，通过对比标签决定谁能执行。公式是重点。\r\n\r\n通过max避免预留或限流过期的问题。过期的就是过期的。\r\n标签调整问题也值得关注。\r\n\r\n用户的要求是不是用nginx的qos就能实现？ 限制ip地址的流量。	2018-05-02 08:57:30.66867	f
154	41	Issue	5	拥有一个delete marker的全量同步。\r\n测试步骤：\r\n1，关闭slave rgw\r\n2，创建bucket，上传对象\r\n3，开启多版本，再上次同一对象2次\r\n4，关闭多版本\r\n5，删除olh\r\n这时就会出现null instance是delete marker的情况。\r\n6，启动slave rgw。\r\n\r\n\r\n结果slave zone这样：\r\nquick.txt\t\r\nrevision #: 3\t2017/11/28 18:16:36\t"bcbe3365e6ac95ea2c0343a2395834dd"\t3 bytes\tSTANDARD\tnuser (nuser)\td6b2jSyFNx5jT3FrC25rf6GwAhIJAfJ\t\r\nrevision #: 2\t2017/11/28 18:16:31\t"bcbe3365e6ac95ea2c0343a2395834dd"\t3 bytes\tSTANDARD\tnuser (nuser)\t0PAbgn.9JkLbFbTYAOjWpYWzyXF5vRK\t\r\nrevision #: 1 (current)\t2017/11/28 18:16:16\t""\t0 bytes\tSTANDARD\t ()\tnull\t\r\n\r\nmaster zone也被更新成这样：\r\nquick.txt\t\r\nrevision #: 3\t2017/11/28 18:16:36\t"bcbe3365e6ac95ea2c0343a2395834dd"\t3 bytes\tSTANDARD\tnuser (nuser)\td6b2jSyFNx5jT3FrC25rf6GwAhIJAfJ\t\r\nrevision #: 2\t2017/11/28 18:16:31\t"bcbe3365e6ac95ea2c0343a2395834dd"\t3 bytes\tSTANDARD\tnuser (nuser)\t0PAbgn.9JkLbFbTYAOjWpYWzyXF5vRK\t\r\nrevision #: 1 (current)\t2017/11/28 18:16:16\t""\t0 bytes\tSTANDARD\t ()\tnull\t\r\n\r\n问题出现原因很明显，全量同步没考虑delete marker。\r\n而且这里还有一个漏洞，就是全量同步不会考虑bilog，slave zone启动全量同步，master zone与此同时也启动了全量同步。\r\n这是该操作可以同步到master zone的原因。	2017-11-28 16:10:36.948335	f
156	4	Issue	5	2017/12/28 10:38:44 [error] 29529#0: *14031976 connect() failed (111: Connection refused) while connecting to upstream, client: 10.10.200.103, server: , request: "GET /test1/?delimiter=%2F&max-keys=1000 HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "192.168.2.147:8030"\r\n2017/12/28 10:38:45 [error] 29529#0: *14031978 connect() failed (111: Connection refused) while connecting to upstream, client: 10.10.200.103, server: , request: "GET /test1/?versions= HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "192.168.2.147:8030"\r\n2017/12/28 10:38:45 [error] 29529#0: *14031980 connect() failed (111: Connection refused) while connecting to upstream, client: 10.10.200.103, server: , request: "GET /test1/?delimiter=%2F&max-keys=1000 HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "192.168.2.147:8030"\r\n2017/12/28 10:53:44 [error] 29527#0: *14040882 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 172.18.0.1, server: , request: "GET /test6/?versions HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "172.18.0.130:8080"\r\n2017/12/28 10:53:51 [error] 29527#0: *14040886 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 10.10.200.103, server: , request: "GET /test7/?delimiter=%2F&max-keys=1000 HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "192.168.2.147:8030"\r\n2017/12/28 10:55:37 [error] 29528#0: *14041436 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 10.10.200.103, server: , request: "GET /test7/?delimiter=%2F&max-keys=1000 HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "192.168.2.147:8030"\r\n2017/12/28 10:57:23 [error] 29528#0: *14041718 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 10.10.200.103, server: , request: "GET /test7/?delimiter=%2F&max-keys=1000 HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "192.168.2.147:8030"\r\n2017/12/28 10:57:40 [error] 29528#0: *14041720 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 172.18.0.1, server: , request: "GET /test7?snapshot HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "172.18.0.130:8080"\r\n2017/12/28 10:59:09 [error] 29528#0: *14042000 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 10.10.200.103, server: , request: "GET /test7/?delimiter=%2F&max-keys=1000 HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "192.168.2.147:8030"\r\n2017/12/28 11:00:25 [error] 29533#0: *14040340 upstream timed out (110: Connection timed out) while reading response header from upstream, client: 10.10.200.103, server: , request: "GET /test6/?delimiter=%2F&max-keys=1000 HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "192.168.2.147:8030"\r\n2017/12/28 11:06:16 [error] 29539#0: *14043304 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 172.18.0.1, server: , request: "GET /test7?snapshot HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "172.18.0.130:8080"\r\n2017/12/28 11:12:25 [error] 29528#0: *14043322 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 10.10.200.103, server: , request: "PUT /test6/assert.h HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "192.168.2.147:8030"\r\n2017/12/28 11:12:25 [error] 29528#0: *14043323 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 10.10.200.103, server: , request: "PUT /test6/atomic.h HTTP/1.1", upstream: "fastcgi://127.0.0.1:8090", host: "192.168.2.147:8030"\r\n	2017-12-28 08:48:23.118022	f
148	41	Issue	5	bucket list是按照对象逆序来排列的，full sync执行的结果全凭运气么？ 为什么这么说？因为并发执行，不按照olh epoch，则link的逻辑就有点乱？ 为什么乱？不是有olh epoch么？ 小的epoch就算link了，后面也会被大的epoch覆盖. *问题核心就是olh tag产生了多个吧*\r\n\r\n还有delete marker做全量同步是否有bug呢？ bug严重，连delete标记都没了。。。。\r\n开玩笑么，这块逻辑完全是缺失的。\r\n\r\n含有delete marker的instance怎么全量同步法？ 先写入instance，然后再设置delete marker？\r\n\r\n还有场景是多个对象的full sync。\r\n还有分片对象的同步，当然当作非分片处理的。	2017-11-28 09:15:50.611699	f
158	48	Issue	5	该问题一个原因是：\r\n\r\nperiod的解析都有问题，在fastcgi模式下的测试不充分。\r\n   该问题是curl使用chunked模式，nginx给fastcgi传递empty的content_length导致的，不使用chunked模式没问题。\r\n\r\n<pre><code class="cpp">\r\nint RGWRESTPostResource::aio_send(bufferlist& outbl)\r\n{\r\n  //do not use chunked\r\n  //rgw will get empty content_length,and seam it as no data.see rgw_rest_read_all_input\r\n  req.set_send_length(outbl.length());\r\n  req.set_outbl(outbl);\r\n  int ret = req.get_resource(conn->get_key(), headers, resource, mgr);\r\n  if (ret < 0) {\r\n    ldout(cct, 5) << __func__ << ": get_resource() resource=" << resource << " returned ret=" << ret << dendl;\r\n    return ret;\r\n  }\r\n\r\n  return 0;\r\n}\r\n</code></pre>\r\n\r\n增加长度部分	2018-01-16 12:19:22.284135	f
159	48	Issue	5	另外同步从一个period过度到下一个period有bug\r\n\r\n对比cursor的结果总是true的，应该对比cursor对应的epoch：\r\n<pre><code class="cpp">\r\ncurrent = sync_env->store->period_history->get_current();\r\n        if (cursor.get_epoch() == current.get_epoch()) {\r\n          next = RGWPeriodHistory::Cursor{};\r\n          if (cursor) {\r\n            ldout(cct, 10) << "RGWMetaSyncCR on current period="\r\n                << cursor.get_period().get_id() << dendl;\r\n          } else {\r\n            ldout(cct, 10) << "RGWMetaSyncCR with no period" << dendl;\r\n          }\r\n        }\r\n</code></pre>\r\n	2018-01-16 12:22:42.723433	f
161	23	Issue	5	已完成合入	2018-01-18 07:31:48.975095	f
162	50	Issue	5	完成，输出<《RGW多版本设计文档解读》一篇。\r\n但是文档输出延后了。	2018-01-19 08:27:37.272463	f
163	51	Issue	5	桶快照文档写的还可以。而且写文档过程能想到存在的缺陷。\r\n\r\n认真干事，必有收获，干好每个细节，每天进步。	2018-01-19 20:53:45.364934	f
165	59	Issue	5	可以，rgw在处理get请求时，数据也是分片发送的。\r\nheader部分和data也是分多次调用。\r\n\r\nRGWGetObj_ObjStore_S3::send_response_data\r\n会被调用多次。\r\n\r\ncurl在接收response也是如此。	2018-02-28 08:18:42.148254	f
166	60	Issue	5	在一个数据中心局部数据异常时，提供工具恢复数据。\r\n\r\n比对，然后恢复	2018-03-02 07:05:39.20448	f
169	4	Issue	5	http://blog.51cto.com/yucanghai/1713803\r\n\r\n总之，这个错误的比例升高可能表明服务器upstream处理过慢，导致用户提前关闭连接。而正常情况下有一个小比例是正常的。\r\n\r\n可能rgw 600个线程都被占满了，还有很多任务等待处理，然后最终都超时！！！	2018-04-25 08:27:09.920056	f
172	70	Issue	5	世上只有一种分布式一致性协议，paxos，其他都是变种	2018-05-02 13:55:33.602071	f
173	70	Issue	5	分析L版本增强特性，是否提前启动L版本的切换。\r\n分析增加DB层的利弊，以及工作量，人力需求。	2018-05-04 09:38:55.884286	f
174	70	Issue	5	本月还有一个任务是解读EC代码。做一次分享。\r\n\r\n另外解读rgw各个特性，为后续的改造奠定基础。\r\n\r\n把培训的专项做起来。	2018-05-07 07:21:32.5725	f
176	71	Issue	5	leveldb编译不过。	2018-05-15 14:57:23.448232	f
175	71	Issue	5	ceph 申威服务器编译\r\n\r\n./configure --without-lttng --without-fuse --without-libatomic-ops --without-jemalloc --without-tcmalloc --without-libxfs --with-radosgw --without-cephfs --prefix=/root/ceph_jewel  CXXFLAGS=-O2\r\n\r\nlibcurl缺乏\r\nlibsnappy 缺乏，默认安装的是静态库	2018-05-14 16:44:08.84056	f
178	71	Issue	5	In file included from test/journal/mock/MockJournaler.cc:4:0:\r\ntest/journal/mock/MockJournaler.h:7:25: fatal error: gmock/gmock.h: No such file or directory\r\n	2018-05-17 10:21:10.548624	f
225	76	Issue	5	multipart在bi上这样存：\r\n\r\nobj\r\n\r\nmultipart + ori obj + uploadid + partid\r\n\r\nuploadid + partid作为instance。\r\n\r\nrgw_obj这个结构体是关键。\r\n\r\n注意一点 manifest中间产生的并非rgw意义上的obj，实际上head_obj才是真正意义上的rgw obj。\r\n\r\nrados使用的hash方式与bi并不一样。\r\nbi用的是orig_obj,而rados用的是obj。manifest决定了rados对象的位置。\r\n\r\n之前在bi中multipart的key跟rados规则类似，用prefix和namespace表示。但是现在不必这样表示。\r\n\r\n\r\n	2018-07-03 07:52:40.101717	f
227	76	Issue	5	计划：\r\n1，解决multipart读写问题\r\n2，解决多版本问题，并砍掉代码。\r\n\r\ndata storage的重构又会引起架构变化，但是相对会好些。\r\n然后就可以考虑合入了。	2018-07-03 17:53:09.491589	f
182	71	Issue	5	2018-05-25 06:57:53.431517 20000034f00  0 filestore(/var/lib/ceph/data/ceph-0) mount: enabling WRITEAHEAD journal mode: checkpoint is not enabled\r\n2018-05-25 06:57:53.432216 20000034f00 -1 journal FileJournal::_open: disabling aio for non-block journal.  Use journal_force_aio to force use of aio anyway\r\n2018-05-25 06:57:53.432228 20000034f00  1 journal _open /var/lib/ceph/data/ceph-0/journal fd 18: 5368709120 bytes, block size 4096 bytes, directio = 1, aio = 0\r\n2018-05-25 06:57:53.432562 20000034f00  1 journal _open /var/lib/ceph/data/ceph-0/journal fd 18: 5368709120 bytes, block size 4096 bytes, directio = 1, aio = 0\r\n2018-05-25 06:57:53.433880 20000034f00  1 filestore(/var/lib/ceph/data/ceph-0) upgrade\r\n2018-05-25 06:57:53.434206 20000034f00 -1 osd.0 0 backend (filestore) is unable to support max object name[space] len\r\n2018-05-25 06:57:53.434222 20000034f00 -1 osd.0 0    osd max object name len = 2048\r\n2018-05-25 06:57:53.434230 20000034f00 -1 osd.0 0    osd max object namespace len = 256\r\n2018-05-25 06:57:53.434236 20000034f00 -1 osd.0 0 (63) File name too long\r\n2018-05-25 06:57:53.434761 20000034f00  1 journal close /var/lib/ceph/data/ceph-0/journal\r\n2018-05-25 06:57:53.436326 20000034f00 -1  ** ERROR: osd init failed: (63) File name too long\r\n\r\n\r\n\r\next4增加配置：\r\nosd_max_object_name_len = 256\r\nosd_max_object_namespace_len = 64	2018-05-25 12:23:54.979684	f
185	73	Issue	5	今天我什么都不干，就干一件事。-- 整理研发要搞哪些流程，大概花多少时间。项目经理要干什么,开发人员要干什么。	2018-05-28 08:23:24.707756	f
186	73	Issue	5	今天三件事：\r\n1，提交backfill\r\n2，申威编译打包\r\n3，测试auto trim	2018-05-29 06:38:42.479632	f
199	76	Issue	5	注意list操作。把多版本塞到一个key之后，如何保证顺序是一个问题。\r\n如果list marker正好落在一个key内，怎么保证下次能正常的list？	2018-06-20 18:54:59.575986	f
197	76	Issue	5	在write_meta的时候根据bucket version信息，决定是否产生instance。\r\nmultipart不必产生instance信息。也就是说使用“null”， instance。\r\n\r\n以后bilog的统计将会更加准确。使用单调递增的编号。\r\n\r\nrgw_obj结构体解析：\r\n(gdb) p head_obj\r\n$1 = {orig_obj = "assert.h", loc = "", object = "_:qnPBPm8212tJwy0F8GVmxrYgrB3HY54_assert.h", instance = "qnPBPm8212tJwy0F8GVmxrYgrB3HY54", \r\n  bucket = {tenant ...	2018-06-20 14:12:03.28255	f
201	76	Issue	5	能否使用locator作为实际instance呢？	2018-06-20 19:14:34.41153	f
203	76	Issue	5	多版本修改属性 产生新版本这种低效率的，可以考虑去重来解决。gc的时候采用check then delete，需要引用计数。\r\n但是计数放在哪里需要好好考虑。	2018-06-21 09:38:28.151627	f
206	76	Issue	5	注意同步操作总是针对某个instance的。	2018-06-22 17:07:57.939822	f
207	76	Issue	5	合并属性中的attr与meta中的信息。去重！	2018-06-23 12:09:47.235563	f
209	76	Issue	5	主要修改数据结构：\r\n#define RGW_BUCKET_DIRENT_FLAG_DELETE        0x10   /* diff from delete marker, the instance is deleted */\r\n\r\ndir entry：\r\nstring list_key;//list by epoch order\r\nmap<string, bufferlist> attrs;\r\n\r\nstruct rgw_bucket_obj_entry {\r\n  string name;\r\n  uint32_t epoch;\r\n  ceph::real_time mtime;  \r\n  vector<struct rgw_bucket_dir_entry> instances;\r\n}	2018-06-23 12:21:26.388285	f
210	77	Issue	5	如果一个人做一个特性，别人花很短时间思考的问题比他还深入。那说明什么？\r\n说明这个人的价值没发挥出来。\r\n\r\n这样的组织状态是不正常的。	2018-06-25 07:29:30.380597	f
212	77	Issue	5	可以把rgw实现砍到最精简的状态。\r\n\r\n然后当前人力可以满足。\r\n\r\n1，mos组研发思维导图，研发流程图。\r\n2，mos特性列表\r\n3，新员工基础测试list	2018-06-26 15:38:37.396449	f
213	76	Issue	5	接口标准变成了cls_obj_complete_add等操作了。\r\n\r\n这并非一次彻底的修改。	2018-06-27 14:18:19.691579	f
214	76	Issue	5	其实根据bilog的mtime基本可以确定是否需要同步对象。如果是非多版本的，可以考虑不同步。这是一个优化。\r\n\r\nrgw_bi_log_entry结构中：\r\nver成员没有作用。ver主要是产生bilog的id，这个可以在bs上顺序产生。使用index_ver即可。\r\n后面如果使用其他pool存放，需另外设计\r\n\r\ntag机制也可以干掉。\r\nolh相关的全部干掉\r\nbi编码的全部干掉\r\n\r\nlocator 改为rados_instance_name.其原含义相关代码全部干掉。\r\nversioned-epoch换成新的object_entry的epoch。\r\n\r\nmanifest这块的优化。这里可以简化，只保留必须的信息manifest结构体持久化还挺占空间的。\r\n\r\n\r\n\r\n\r\n	2018-06-28 08:08:06.206824	f
215	76	Issue	5	tombstone是干啥的？\r\n\r\nOPTION(rgw_obj_tombstone_cache_size, OPT_INT) // how many objects in tombstone cache, which is used in multi-zone sync to keep\r\n                                                    // track of removed objects' mtime\r\n\r\n从代码看确实是这个意图，现在不需要了。对象的mtime在bilog中就有。\r\n举个例子 master zone修改一个对象，slave zone在之后删除这个对象。然后slave同步master修改。但是这是不必要的，这时可判断删除动作对应的mtime 小于修改，从而不执行对应的同步。\r\n不过这玩意记录在内存，好像有缺陷。\r\n\r\n问题在于同步不一定会立即发生，如果rgw异常，或者cache满掉。那么就无法获取到mtime，是否就会执行该同步呢？\r\n\r\n*增加限制，如果dir entry对应的index_ver尚未同步，暂不删除dir entry？*	2018-06-28 08:17:31.04461	f
216	76	Issue	5	对象的tail部分是用gc来移除的，gc会检查是否有引用。\r\ncopy的时候tail是不需要copy的。\r\n\r\n这块在bi修改之后可以做得更彻底，整个obj都是可以共享的。移除全部经过gc或lc。\r\n一个有引用的对象在一些处理上会遇到问题，比如是否转移到其他pool？（在冷热的问题上，这里可以保留两份以提高其可靠性？冷热池与去重是有关联的）\r\n\r\n小文件合并时，这里存在一个问题，新obj上的引用，转移到其他pool的引用计数如何保证一致性？\r\n\r\n仍然不保证一致性，允许计数出错，对象残留。但是在删除bucket时，是不去理会引用计数的。\r\n\r\ngc这块还有obj tag。 注意gc就是专门搞对象尾巴的，没有就用不上gc。\r\n	2018-06-28 12:27:48.753642	f
221	76	Issue	5		2018-07-02 09:07:18.609368	f
222	76	Issue	5	obj-tag 不在需要了，obj tag就是为了实现原子性的。而现在通过多版本避开了rados实例的原子性问题。	2018-07-02 09:14:49.683854	f
218	76	Issue	5	obj with manifest should have tag？ why？\r\n\r\nhead_obj概念仍然需要吗？tail_object仍然要吗？\r\nmanifest最简化。manifest内部的几个类，以及其关系使用完全弄清楚。	2018-06-28 13:24:03.901227	f
229	76	Issue	5	对象的删除不应该使用lc来完成，lc是生命周期，其并不一定针对所有对象。而且所有对象的扫描效率并不好。\r\n\r\n仍然使用gc来实现。	2018-07-04 07:11:42.768864	f
223	76	Issue	5	RGWObjManifest结构体：\r\n\r\n1，perfix\r\n在multipart时，是uploadid\r\n在atomic时，是instance\r\n\r\n所以RGWObjManifest结构体是\r\n{\r\n  rgw_bucket bucket // 对象所在bucket\r\n  string prefix;// uploadid or obj instance\r\n  uint64_t size;\r\n  map<>  rules;\r\n}\r\n\r\nover,只有这些了。	2018-07-02 09:23:07.451946	f
230	76	Issue	5	多版本下产生一个问题：就是如何实现版本删除。gc扫描整个bucket显然不合适。\r\n可以在complete的时候的返回值中携带需要删除的instance，然后丢到gc中。\r\n一致性在bi上保证。\r\n\r\n新增一个op，在非version的add，以及delete之后，增加一步获取所有delete状态的obj，丢带gc里面处理。\r\nbucket删除的时候可能存在遗漏部分对象是标记删除，但是尚未gc，存在残留。\r\n\r\n我们实际上只需记录哪些对象需要gc。添加一个已经存在的对象需要gc，这是覆盖写。delete一个对象需要gc。\r\nbi需增加一个接口，真正的clear entry。在gc成功之后执行。	2018-07-04 08:46:13.87081	f
226	76	Issue	5	multipart的meta obj比较特殊，其作为multipart upload的状态信息承载。\r\n在multipart上传成功之后会删除，其内容主体在extra pool上。其上主要存放multipart的part信息。\r\n\r\n在删除的时候其不能仅仅做delete标记，需要真正删除。\r\n\r\n为什么不在io路径上删除对象？这样会导致空间无法快速释放。如果是删除，应该立刻执行删除。\r\n先删除head，后删除对象。\r\n\r\n之前的bucket list如何过滤掉 multipart的meta和multipart的可以的呢？\r\n\r\n在list_objects 中有过滤，根据namespace。	2018-07-03 12:00:30.475755	f
231	76	Issue	5	acl和tag是在current版本上进行的，新增修改http header是用put请求，会产生新版本。	2018-07-04 09:51:35.119574	f
228	76	Issue	5	multipart问题在于 分片的key在object entry中如何表示合适？\r\n\r\n作为特殊实例？ 使用multipart flag标记？\r\n这样在current的处理上需要跳过multipart的key。\r\nlist的时候同样需要跳过。\r\n\r\n或者干脆允许key的name不一样？ multipart的对象的key名字来自于prefix。\r\n\r\nno no， multipart的key是作为单独的object entry出现的。key.name不一样	2018-07-03 18:24:22.314782	f
233	76	Issue	5	干掉snapshot特性，干掉check index(index两阶段一致性检查)，干掉olh相关的。\r\n\r\nnull instance同步与其他并无区别。都是读取数据过来同步，只不过其instance是null。	2018-07-05 12:13:54.348769	f
220	78	Issue	5	同步rgw状态无法代表zone状态，应该监控业务rgw状态。 玩积木的时候首先你得发现有哪些积木。设计评审，代码review皆是如此。\r\n\r\n1，基于时间的脆弱性\r\n\r\n2，目前协程框架下定位问题有点麻烦，如果某个cr卡住了，无法直观的看到它卡在哪里？况且cr dump偶尔还有错误\r\n\r\n[root@softbank126251002143 ceph]# bin/ceph --admin-daemon var/run/ceph/ceph-client.radosgw.default_sync.asok cr dump\r\nadmin_socket: 'ascii' codec can't decode byte 0xe6 in position 310125: ordinal not in range(128)\r\nadmin_socket: 'ascii' codec can't decode byte 0xe6 in position 310125: ordinal not in range(128)\r\n\r\n一个cr在等待哪个异步任务？\r\n\r\n3，period对于meta同步的影响，在机制上如何确保没有任何问题？ 测试中已经出现period变更之后，meta的sync info读取不到的情况。\r\n\r\n框架修改为pull方式，便于做状态管理。现在状态是分离的，要查询两个zone之间差多少数据，必须两边都是活的。\r\n\r\n4，数量差异在全量同步时也不准确。\r\n\r\n\r\n状态太他妈难看了，能否像bucket stats一样给出一组值呢。\r\n其实就是他妈一个数组\r\n[source_zone1, {1,2,....,63}]\r\n[source_zone2, {1,2,....,63}]\r\n[source_zone3, {1,2,....,63}]\r\n通过数字反应出来是否同步，以及差距多少对象同步。\r\n\r\n不同步就什么都没有\r\n	2018-07-02 07:19:23.694524	f
235	76	Issue	5	tag 和epoch的修正	2018-07-06 11:43:01.815209	f
239	79	Issue	5	defer gc的意思就是推迟删除对象，注意对象虽然删除，但是并非立即被gc清除，而是要等待一段时间（应该是避免有的客户端仍然在访问的问题）\r\nobj_tag这里其实代表了对象的实例。\r\n\r\n目前有两种实现方式：\r\n1，在write_meta中捞出需要delete的对象，注意不一定是上一个版本，这里存在并发场景。\r\n捞出来之后，根据manifest将其加入到gc中。\r\n\r\n2，send chain仅丢入一个key，由gc自己去bi中捞。这样可能对性能有点影响。\r\n\r\n此外还需要提供接口真正的删除bi entry	2018-07-11 12:19:47.102189	f
241	79	Issue	5	改造 cls_bi_get的接口，支持获取各种instance。\r\n\r\n仍然做一种比较，在instance epoch不一致的时候，让客户端操作retry。或者像以前的处理一样，当作成功。\r\n\r\n	2018-07-11 14:37:03.642995	f
238	79	Issue	5	上午搞专利\r\n3.2.1的回顾\r\n3.1.6 bug合入\r\n\r\nlicense bug合入。\r\n\r\n升级直接用工具是否可行。在同一个集群。 或者仅转换元数据?  其实NFS也可以类似玩法。\r\nmanifest是一种抽象，提供了切割能力的抽象。\r\n\r\n后面可能需要提供工具，支持写入bi的能力。\r\n	2018-07-10 06:52:53.783666	f
242	78	Issue	5	就提供一个查询命令 bucket sync status。bucket stats反应bucket最新修改	2018-07-14 09:01:04.66065	f
243	79	Issue	5	关于上双活同步时间的问题：\r\n\r\n对于非多版本请求，这个比较好说根据epoch可以判断。\r\n比如1边在同步对象A， 在同步的任务中会得到A的版本10，这时如果写入了对象11，则同步操作因为比较epoch失败而被取消。\r\n注意这是一种正常情况。\r\nepoch只能避免同时写的情况。解决gc问题。\r\n\r\n但是如果这时操作是删除对象，那么最终是否该对象仍然存在？ 这个需要根据时间来判断。\r\n\r\n\r\n删除的时候如果携带了时间，则与最新的时间对比，如果有修改，则cancel删除。\r\ndelete marker也是如此。\r\n\r\n但是ADD不一样，老版本也是有必要同步的，且同步之后不作为最新版本。\r\n举个例子两个zone各写入对象的多个版本，然后开始做全量同步，最终结果会是怎样？ 版本顺序对吗？一致吗？	2018-07-14 09:24:48.926058	f
244	79	Issue	5	set attr不涉及object和instance时间修改，也就是说不去影响对象instance的存在性。否则双活可能不同步，一边删除了，另外一边因为修改属性不去同步删除操作。	2018-07-14 09:42:58.56986	f
245	79	Issue	5	rule：\r\n1，同名instance，时间小，则不执行操作。\r\n2，非同名instance，根据时间排序。	2018-07-14 09:46:39.410994	f
246	79	Issue	5	多版本相关仍然有用例失败：\r\n1，开启多版本情况下，产生delete marker，从端不同步。	2018-07-16 13:00:28.189594	f
247	81	Issue	5	今天搞定feature列表，还有pbc。\r\n\r\n另外投入v5基础版本。\r\n\r\n周三开始投入专利交底书。	2018-07-17 07:06:14.847828	f
248	81	Issue	5	V5.1.0版本：\r\n本周完成双活模块的相关验证。\r\n解决多版本与分片上传的问题。	2018-07-17 11:45:15.590852	f
250	82	Issue	5	本周输出需求分析，以及周边规格调研。	2018-07-23 08:00:43.420039	f
249	81	Issue	5	思考如何支持异构集群，bilog是否增加字段？ dir entry是否调整？\r\n主要论证双活同步这块没有问题。 以及对后续升级的影响。	2018-07-17 14:55:34.448552	f
253	82	Issue	5	rgw_obj中的loc可作为标识对象在那个引擎的字段，同时，manifest的prefix可标识路径。\r\nManifest增加字段表明对象存储在哪种引擎中？ 还是在bi中标识更合适呢？ 这里对同步可能略为有点影响。\r\n\r\n问题在于你如何确定一个字段属于哪里？ 对象的acl表明对象的访问权限，对象的manifest表明对象如何存储。BI的作用在于定位对象，以及实现bucket list。\r\n这样理解并没什么问题。\r\n\r\nbucket list中还有一个字段是storage class，如果能运用这个字段可能恰到好处。其实生命周期转移数据也可以理解为转移到其他storage class。\r\n但是这样需要把storage class给管理起来，增加这样的一层。如果有个需求是将到期数据转移到公有云？	2018-07-24 07:03:54.299785	f
254	82	Issue	5	pool与实际底下存储之间必须得有一层抽象，以便实现bucket的data可以放入异构的pool，如果pool不支持异构，这个问题非常简单。只要在obj上调整即可。\r\n但实际上比较难。\r\n\r\nbucket是逻辑概念，pool存储实际数据。 其间的关系主要在于在bucket写入时（bi，data），需要有一个默认的pool。不然无法得知数据写入到哪里。\r\n\r\n这个问题placement可解决。从目前来说我们的主存都是rados，数据总是直接写入rados。但是我们要支持数据写到其他地方，淘汰到其他地方。\r\n\r\n得考虑到一种灵活性，比如将大对象丢到ec pool。	2018-07-24 17:28:06.673123	f
256	82	Issue	5		2018-07-26 11:59:49.612954	f
257	82	Issue	5	可以考虑在rgw_bucket上增加一个字段：NFS_pool(记录NFS挂载路径？)。然后在rgw obj中使用storage class记录其存储类型为NFS。\r\nrgw bucket可以具体对应storage class中一个pool，每种类型的storage class定义一个pool。\r\n如果想bucket对应storage class的多个pool，可以将具体pool信息转移到obj上。就这点区别。\r\n\r\nplacement并非s3的location。s3 location定义bucket在哪个zone。 placement的作为就是确定bucket的storage class下的具体pool。\r\nso，如果后续bucket只定义一个默认存储策略。则存储策略就在placement的位置，一个存储策略里面定义多个类型一样的pool。\r\n\r\nrgw bucket现在的逻辑就是直接对上pool，如果想支持其他异构的pool，可以直接扩展rgw-bucket。\r\n\r\n如果想用生命周期扩展数据 到公有云等，可建立对应的pool。没有特别的类型表示异构，就用变量名。\r\n	2018-07-26 13:05:49.571282	f
261	76	Issue	5	delete marker的处理可能略有问题，lc的时候如果当前版本是delete marker，则不必再产生新的delete marker。\r\n	2018-07-29 20:54:44.263957	f
262	84	Issue	5	专利收尾\r\n邓转正\r\n5.2.0 讨论	2018-08-02 06:30:13.526388	f
266	85	Issue	5	elasticsearch验证。	2018-08-07 17:22:46.619659	f
267	4	Issue	5	再次出现，rgw并没有很多任务处理，截取了相关的报文，nginx尝试与fastcgi接口通信，但似乎链接一直都成功。\r\n(gdb) b rgw/rgw_fcgi_process.cc:102\r\nBreakpoint 2 at 0x7f00695d9d7d: file rgw/rgw_fcgi_process.cc, line 102.\r\n(gdb) c\r\nContinuing.\r\n^C\r\nProgram received signal SIGINT, Interrupt.\r\n0x00007f005ec1870d in read () from /lib64/libpthread.so.0\r\n(gdb) b FCGX_Accept_r\r\nBreakpoint 3 at 0x7f005f02f700\r\n(gdb) c\r\nContinuing\r\n\r\n断点在这里都毫无反应，可见accept都无法接收请求了。	2018-08-07 17:24:22.368658	f
264	88	Issue	5	pg分裂不是特别好计算到底到达多少对象分裂。\r\n有点奇怪的是对象的hash并不具备离散性。\r\n\r\n这个可能并非是完全hash，而是根据对象名字的反转。通常文件名不一样，而后缀一样。\r\n所以pg放对象时是根据hash的末尾开始选择目录的。\r\n\r\n而我们性能测试的时候，文件名前缀一样，没有后缀。所以出现根据hash的尾部选择目录，对象集中在一些目录的现象。\r\n\r\n	2018-08-07 11:41:53.026933	f
270	88	Issue	5	使用预分裂的方式。	2018-08-08 08:10:55.992327	f
274	4	Issue	5	停掉rgw或rgw端口不对，nginx返回值都是502.\r\ngdb rgw卡住，nginx返回值是499.\r\n\r\n当时的情况是nginx发送了请求，但是fastcgi接收包失败。	2018-08-09 14:40:39.595985	f
278	4	Issue	5	syn_recv   net.core.somaxconn 太小。导致请求溢出？\r\n\r\n但是性能测试环境的请求不是更多吗？是因为执行时间的差异吗？\r\n\r\n性能环境上 TIME_WAIT状态的连接高达2万多。	2018-08-13 11:37:38.206255	f
282	91	Issue	5	也就是说在读取数据的size小于预读时，direct和非direct性能是接近的。\r\n\r\nRaid卡是另一个影响因素，低端RAID卡像H710可能不支持直通。\r\n通过Raid命名可查看是否直通，直通模式下Raid信息中不包含对应的磁盘信息。	2018-08-15 09:07:57.868916	f
285	90	Issue	5	分析v5.1.0的问题。	2018-08-16 13:39:22.59014	f
286	39	Issue	5	bucket index规模增加也许也是性能下降的一大原因。 omap规模增大，leveldb性能下降。\r\n\r\n最终的架构也许还是小文件合并，bi放在单独的ssd osd上以提升各方面的性能。\r\n\r\nrados cls提供空间管理能力，每个bucket index上分配1万个rados对象，然后bucket对象映射到rados对象上。	2018-08-16 14:04:45.280371	f
288	91	Issue	5	还有可以调整的是调度算法。如果认定队列中请求太少，可在上端增加压力。\r\nrgw cache对于小块读性能影响非常大。	2018-08-17 11:46:10.246283	f
260	76	Issue	5	mtime，slave use bilog time to check wether new or old. no need try get remote obj.\r\nmtime 表示的是创建时间，bilog中记录的时间即为修改时间，是否同步对比bilog时间和本地state即可。\r\n\r\n前端操作除非无法知道instance，否则都应该传入instance。\r\ndelete_obj有两种情况，一种是多版本下不带版本删除，就是delete marker。\r\n另外一种就是删除实际的instance。非多版本下就是删除null。\r\n\r\n在s3上实际操作，修改tag和acl对象的上次修改时间均不会变。\r\n问题的核心是否会产生新版本，对象需要根据版本有序（我们这是根据时间有序），则规则如下：\r\n如果一个操作在多版本下会产生新的版本，则其会变更修改时间，否则不会。\r\n\r\n保留mtime作为对象创建时间，set_attr 额外使用一个时间，如果时间小于当前attr时间则不执行对应操作。\r\n测试方法：断开同步，分别设置acl，测试最终是否一致。\r\n	2018-07-29 20:01:53.331161	f
263	85	Issue	5	务必将双活等引入到自动化测试中。	2018-08-06 07:18:25.13106	f
265	86	Issue	5	monitor在集群大时单独部署，可减少操作系统压力对monitor的影响。\r\n当内存不够时，所有进程都会收到影响。通信异常等各种问题。\r\n\r\n	2018-08-07 12:15:10.060809	f
268	88	Issue	5		2018-08-08 06:44:28.56406	f
280	39	Issue	5	一种方案是支持bucket开启小文件合并。直接在io路径上做文件合并，每个rgw使用各自的文件。\r\n前期可考虑不支持gc，对象转移或删除的时候更新引用计数，计数为0，则删除文件。\r\n\r\n在rgw bi上产生对应的key。这个key的作用就是gc。否则可以让rgw对象直接对应到rados对象。\r\n	2018-08-13 18:11:54.498838	f
269	89	Issue	5	3，看来海量小文件合并仍然有必要。SSD仍然无法很好的解决海量小文件的问题。这问题主要在分裂上。\r\n能否：1，将pg分裂发散到各个时间段？ 2，提前预分裂？\r\n\r\n\r\n10，NFS的性能也是一个大问题。	2018-08-08 07:43:41.370913	f
271	89	Issue	5	11, apache httpd服务无法正常停止，导致系统内存撑爆	2018-08-09 11:24:50.937236	f
272	4	Issue	5	问题，gdb调试卡太久，对accept调用有影响吗？ 499是accept出问题了么？\r\n网络在什么情况下出现状态问题呢？\r\n\r\ntcp的应答是自动发出的吗？卡住程序对这个有影响吗？\r\n\r\ngdb卡住时间长的假设是错误的，实际在卡住程序很久之后。仍然可以恢复。那究竟是什么影响了呢？	2018-08-09 12:39:19.034553	f
273	4	Issue	5	the RTT is negative?\r\nRetransmision  PSH,ACK	2018-08-09 13:28:22.852145	f
275	88	Issue	5	采用预分裂方式，目前看性能是相对平稳的。\r\n但是\r\n1，目录深度应该可以优化\r\n2，对象名长度应该想办法缩短。	2018-08-10 07:02:56.766239	f
276	78	Issue	5	还有一个非常大的缺陷是：\r\n全量同步并没有跳过哪些对象就是自己写入的对象。对象应该有首选归属地。\r\n全量同步的bilog中同样应该记录归属地，试想B从C全量同步，同步到A zone的对象m，如果bilog中不记录。A与B增量同步，仍然会同步对象m。\r\n\r\n多活的情况实际更加复杂，非数据所属zone仍然存在重复执行的情况，所以这一问题在多活中普遍存在。	2018-08-10 12:26:43.20677	f
277	4	Issue	5	[root@localhost engine]# netstat -anp | grep 1230\r\ntcp      129      0 0.0.0.0:1230            0.0.0.0:*               LISTEN      25822/radosgw       \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48164         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48165         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48133         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48413         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49091         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49006         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48030         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49015         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48840         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48086         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49034         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48332         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49052         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48654         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48954         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:47988         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48577         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48852         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48777         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48264         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48073         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48950         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48547         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48256         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48019         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48821         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48163         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49109         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48412         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49123         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48822         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48867         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48897         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48942         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48904         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48937         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48885         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48609         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48354         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48761         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48246         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48035         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48414         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48949         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48446         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48029         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49422         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49320         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48220         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48919         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48930         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48221         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48350         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48024         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:47908         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48094         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48093         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:47907         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:47811         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48036         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48477         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49116         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48570         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:47768         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48537         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48406         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48625         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48111         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48351         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48129         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48321         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49063         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49051         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48395         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48010         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48846         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48653         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49111         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48509         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48067         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48920         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49168         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:49094         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:48324         SYN_RECV    -                   \r\ntcp        0      1 127.0.0.1:49072         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0    905 127.0.0.1:48010         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5073 127.0.0.1:48220         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49229         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0      1 127.0.0.1:49070         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5049 127.0.0.1:47815         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5065 127.0.0.1:47228         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   1256 127.0.0.1:48351         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48858         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   5065 127.0.0.1:47983         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48864         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   5065 127.0.0.1:47202         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49081         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49087         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49100         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   1257 127.0.0.1:47768         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0    912 127.0.0.1:48035         127.0.0.1:1230          ESTABLISHED 15829/nginx: worker \r\ntcp        0      1 127.0.0.1:49074         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5049 127.0.0.1:48609         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48553         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   1257 127.0.0.1:47077         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49065         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5064 127.0.0.1:48897         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0   1256 127.0.0.1:48133         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0   5049 127.0.0.1:48413         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0    904 127.0.0.1:49422         127.0.0.1:1230          ESTABLISHED 15835/nginx: worker \r\ntcp        0      1 127.0.0.1:48857         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0      1 127.0.0.1:48150         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49067         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0    904 127.0.0.1:48093         127.0.0.1:1230          ESTABLISHED 15829/nginx: worker \r\ntcp        0   5401 127.0.0.1:47183         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49106         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0    904 127.0.0.1:48653         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0      1 127.0.0.1:48556         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0    872 127.0.0.1:48332         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0   5065 127.0.0.1:47122         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   1257 127.0.0.1:47624         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48939         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0    905 127.0.0.1:47085         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48449         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   1257 127.0.0.1:47811         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48941         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5048 127.0.0.1:49091         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0   1256 127.0.0.1:48030         127.0.0.1:1230          ESTABLISHED 15829/nginx: worker \r\ntcp        0      1 127.0.0.1:48209         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48878         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48543         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49080         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49090         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48559         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   1256 127.0.0.1:48406         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0   5064 127.0.0.1:48867         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0    904 127.0.0.1:48777         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0      1 127.0.0.1:48234         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49092         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48039         127.0.0.1:1230          SYN_SENT    15829/nginx: worker \r\ntcp        0    912 127.0.0.1:48577         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0   1256 127.0.0.1:48073         127.0.0.1:1230          ESTABLISHED 15829/nginx: worker \r\ntcp        0      1 127.0.0.1:48893         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5065 127.0.0.1:47194         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5048 127.0.0.1:49111         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48153         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48544         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   5065 127.0.0.1:47799         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5064 127.0.0.1:48885         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48561         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0      1 127.0.0.1:48166         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0    904 127.0.0.1:48024         127.0.0.1:1230          ESTABLISHED 15829/nginx: worker \r\ntcp     5065      0 127.0.0.1:1230          127.0.0.1:54940         CLOSE_WAIT  -                   \r\ntcp        0   5065 127.0.0.1:47968         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49054         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48889         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5064 127.0.0.1:48937         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49096         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49064         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0    904 127.0.0.1:48654         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0      1 127.0.0.1:48926         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5065 127.0.0.1:47798         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   1256 127.0.0.1:48246         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0    904 127.0.0.1:48221         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0   1256 127.0.0.1:48822         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0      1 127.0.0.1:48447         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48034         127.0.0.1:1230          SYN_SENT    15829/nginx: worker \r\ntcp        0   5065 127.0.0.1:47943         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5065 127.0.0.1:48163         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48648         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   5064 127.0.0.1:49052         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0   5048 127.0.0.1:48919         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48546         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   5041 127.0.0.1:48625         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49105         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   5049 127.0.0.1:48264         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49093         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48856         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0    912 127.0.0.1:48846         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0   5064 127.0.0.1:48949         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48552         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0      1 127.0.0.1:49088         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48879         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5064 127.0.0.1:49051         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49132         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0    904 127.0.0.1:48821         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0   5064 127.0.0.1:48942         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0   5065 127.0.0.1:48129         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5064 127.0.0.1:48920         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48938         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49084         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5049 127.0.0.1:47907         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49154         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0   6024 127.0.0.1:48321         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0    912 127.0.0.1:48354         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48224         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49169         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0      1 127.0.0.1:48887         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49152         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49095         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48031         127.0.0.1:1230          SYN_SENT    15829/nginx: worker \r\ntcp        0      1 127.0.0.1:49108         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   5065 127.0.0.1:47823         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49181         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0   5065 127.0.0.1:47193         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp     5065      0 127.0.0.1:1230          127.0.0.1:54947         CLOSE_WAIT  -                   \r\ntcp        0      1 127.0.0.1:48557         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   5049 127.0.0.1:48412         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49076         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48943         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48033         127.0.0.1:1230          SYN_SENT    15829/nginx: worker \r\ntcp        0    905 127.0.0.1:47260         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0    905 127.0.0.1:47179         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0    904 127.0.0.1:49006         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49103         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48874         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49104         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48558         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   1248 127.0.0.1:48094         127.0.0.1:1230          ESTABLISHED 15829/nginx: worker \r\ntcp        0      1 127.0.0.1:49071         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5065 127.0.0.1:47227         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0    904 127.0.0.1:48547         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48853         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp     5065      0 127.0.0.1:1230          127.0.0.1:54934         CLOSE_WAIT  -                   \r\ntcp        0   5049 127.0.0.1:47809         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5041 127.0.0.1:48414         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49055         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0    904 127.0.0.1:48761         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0      1 127.0.0.1:49117         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   5065 127.0.0.1:47988         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48235         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48172         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49079         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49082         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp      905      0 127.0.0.1:1230          127.0.0.1:55001         CLOSE_WAIT  -                   \r\ntcp        0      1 127.0.0.1:49086         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49110         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   5049 127.0.0.1:47833         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48886         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49069         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   1257 127.0.0.1:47392         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48173         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48038         127.0.0.1:1230          SYN_SENT    15829/nginx: worker \r\ntcp        0      1 127.0.0.1:49470         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0   5049 127.0.0.1:48537         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48944         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48890         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   1249 127.0.0.1:47622         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5065 127.0.0.1:47819         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48859         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   5064 127.0.0.1:49116         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0   1256 127.0.0.1:49320         127.0.0.1:1230          ESTABLISHED 15835/nginx: worker \r\ntcp        0      1 127.0.0.1:48223         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48032         127.0.0.1:1230          SYN_SENT    15829/nginx: worker \r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:55524         ESTABLISHED 25822/radosgw       \r\ntcp        0      1 127.0.0.1:48185         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49066         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48877         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49085         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48212         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49101         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   5065 127.0.0.1:48111         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   4993 127.0.0.1:47175         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0    912 127.0.0.1:48350         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0   5049 127.0.0.1:48570         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49077         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49173         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0      1 127.0.0.1:48860         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   5048 127.0.0.1:49109         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49068         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49133         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49009         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0    905 127.0.0.1:47671         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48591         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   5065 127.0.0.1:47740         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5057 127.0.0.1:47942         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49136         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   5049 127.0.0.1:48477         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0    904 127.0.0.1:48840         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0      1 127.0.0.1:48863         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0      1 127.0.0.1:49089         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   5065 127.0.0.1:47253         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5065 127.0.0.1:47741         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48873         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48562         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0      1 127.0.0.1:48854         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   1257 127.0.0.1:47391         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5065 127.0.0.1:47350         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48233         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   5065 127.0.0.1:47831         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   1256 127.0.0.1:48446         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0    913 127.0.0.1:47675         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48861         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0      1 127.0.0.1:49078         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   1257 127.0.0.1:47623         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5064 127.0.0.1:48950         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0    905 127.0.0.1:48019         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5065 127.0.0.1:47201         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48542         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0    904 127.0.0.1:49015         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49261         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0      1 127.0.0.1:48040         127.0.0.1:1230          SYN_SENT    15829/nginx: worker \r\ntcp        0      1 127.0.0.1:48940         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49341         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0      1 127.0.0.1:49075         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:49429         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0    905 127.0.0.1:47731         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5064 127.0.0.1:49063         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48869         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0      1 127.0.0.1:49097         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   5048 127.0.0.1:49094         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0   5065 127.0.0.1:47977         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   1257 127.0.0.1:47835         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5057 127.0.0.1:47251         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48186         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48169         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49083         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0    904 127.0.0.1:48852         127.0.0.1:1230          ESTABLISHED 15858/nginx: worker \r\ntcp        0   5049 127.0.0.1:48256         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48560         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0    904 127.0.0.1:48029         127.0.0.1:1230          ESTABLISHED 15829/nginx: worker \r\ntcp        0   5049 127.0.0.1:48509         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0    904 127.0.0.1:48165         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp     5049      0 127.0.0.1:1230          127.0.0.1:54941         CLOSE_WAIT  -                   \r\ntcp        0      1 127.0.0.1:49073         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48855         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0    904 127.0.0.1:49034         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48037         127.0.0.1:1230          SYN_SENT    15829/nginx: worker \r\ntcp        0   1248 127.0.0.1:48904         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0   5065 127.0.0.1:48164         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   1256 127.0.0.1:48067         127.0.0.1:1230          ESTABLISHED 15829/nginx: worker \r\ntcp        0      1 127.0.0.1:48217         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48168         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49256         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0      1 127.0.0.1:49118         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48862         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   5064 127.0.0.1:49123         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48396         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   1256 127.0.0.1:48086         127.0.0.1:1230          ESTABLISHED 15829/nginx: worker \r\ntcp        0      1 127.0.0.1:49151         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0    904 127.0.0.1:48036         127.0.0.1:1230          ESTABLISHED 15829/nginx: worker \r\ntcp        0      1 127.0.0.1:49102         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49099         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0    912 127.0.0.1:48930         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0    913 127.0.0.1:47677         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49056         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0    905 127.0.0.1:47688         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp     5065      0 127.0.0.1:1230          127.0.0.1:54939         CLOSE_WAIT  -                   \r\ntcp        0   1257 127.0.0.1:47330         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5049 127.0.0.1:47908         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49153         127.0.0.1:1230          SYN_SENT    15835/nginx: worker \r\ntcp        0      1 127.0.0.1:49057         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48210         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   6024 127.0.0.1:48324         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49035         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0   1256 127.0.0.1:49168         127.0.0.1:1230          ESTABLISHED 15835/nginx: worker \r\ntcp        0      1 127.0.0.1:49058         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0    905 127.0.0.1:47676         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0    905 127.0.0.1:47674         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:49107         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:48948         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp     5049      0 127.0.0.1:1230          127.0.0.1:54904         CLOSE_WAIT  -                   \r\ntcp        0    904 127.0.0.1:48395         127.0.0.1:1230          ESTABLISHED 15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49053         127.0.0.1:1230          SYN_SENT    15857/nginx: worker \r\ntcp        0      1 127.0.0.1:48143         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0      1 127.0.0.1:49098         127.0.0.1:1230          SYN_SENT    15839/nginx: worker \r\ntcp        0   1257 127.0.0.1:47874         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0   5072 127.0.0.1:48954         127.0.0.1:1230          ESTABLISHED 15857/nginx: worker \r\ntcp        0   5065 127.0.0.1:47744         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48868         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0      1 127.0.0.1:48770         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0   5065 127.0.0.1:47739         127.0.0.1:1230          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:48866         127.0.0.1:1230          SYN_SENT    15858/nginx: worker \r\ntcp        0    905 127.0.0.1:47670         127.0.0.1:1230          FIN_WAIT1   - 	2018-08-13 06:53:15.970429	f
283	91	Issue	5	7200卷磁盘，在osd上随机读写1MB，带宽只有30M左右。avgrq-sz只能到256，到不了512. why？\r\n	2018-08-15 13:20:24.810908	f
279	4	Issue	5	[root@localhost ceph]# netstat -anp | grep 1230 | grep "59825"\r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:59825         SYN_RECV    -                   \r\ntcp        0   1256 127.0.0.1:59825         127.0.0.1:1230          ESTABLISHED 15833/nginx: worker \r\n[root@localhost ceph]# netstat -anp | grep 1230 | grep "59825"\r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:59825         SYN_RECV    -                   \r\ntcp        0   1256 127.0.0.1:59825         127.0.0.1:1230          ESTABLISHED 15833/nginx: worker \r\n[root@localhost ceph]# netstat -anp | grep 1230 | grep "59825"\r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:59825         SYN_RECV    -                   \r\ntcp        0   1257 127.0.0.1:59825         127.0.0.1:1230          FIN_WAIT1   -                   \r\n[root@localhost ceph]# netstat -anp | grep 1230 | grep "59825"\r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:59825         SYN_RECV    -                   \r\ntcp        0   1257 127.0.0.1:59825         127.0.0.1:1230          FIN_WAIT1   -                   \r\n[root@localhost ceph]# netstat -anp | grep 1230 | grep "59825"\r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:59825         SYN_RECV    -                   \r\ntcp        0   1257 127.0.0.1:59825         127.0.0.1:1230          FIN_WAIT1   -                   \r\n[root@localhost ceph]# netstat -anp | grep 1230 | grep "59825"\r\ntcp        0      0 127.0.0.1:1230          127.0.0.1:59825         SYN_RECV    -                   \r\ntcp        0   1257 127.0.0.1:59825         127.0.0.1:1230          FIN_WAIT1   -                   \r\n[root@localhost ceph]# netstat -anp | grep 1230 | grep "59825"\r\ntcp        0   1257 127.0.0.1:59825         127.0.0.1:1230          FIN_WAIT1   -                   \r\n[root@localhost ceph]# netstat -anp | grep 1230 | grep "59825"\r\ntcp        0   1257 127.0.0.1:59825         127.0.0.1:1230          FIN_WAIT1   -                   \r\n[root@localhost ceph]# netstat -anp | grep 1230 | grep "59825"\r\ntcp        0   1257 127.0.0.1:59825         127.0.0.1:1230          FIN_WAIT1   - \r\n\r\n从其状态也可见是服务端出了问题。服务端无法进入ESTABLISHED状态。\r\n\r\nhttps://www.cnblogs.com/leezhxing/p/5329786.html\r\n但是为什么RECV_Q一直是129呢？\r\n\r\n<pre>\r\n[root@localhost ceph]# ss -lnt\r\nState       Recv-Q Send-Q                      Local Address:Port                                     Peer Address:Port              \r\nLISTEN      0      100                                     *:6665                                                *:*                  \r\nLISTEN      0      50                                      *:6601                                                *:*                  \r\nLISTEN      0      5                               127.0.0.1:6666                                                *:*                  \r\nLISTEN      0      50                                      *:6602                                                *:*                  \r\nLISTEN      0      50                                      *:6603                                                *:*                  \r\nLISTEN      129    128                                     *:1230                                                *:*   \r\n</pre>	2018-08-13 11:42:05.228825	f
281	39	Issue	5	使用小文件合并，可以解决filestore分裂问题，xfs文件系统元数据过多问题。\r\n同时还能实现顺序写优化，降低bcache引入而引起的风险(还有一个ssd坏了大量osd异常的问题)\r\n\r\nbcache可以感知元数据，但是无法感知目录，文件数量增多之后，仍然可能有目录被淘汰。	2018-08-14 06:53:00.25958	f
308	95	Issue	5	1,解决es sync不到的问题\r\n2，解决分片上传meta对象仍然存在的问题\r\n3，bucket和user一致性问题，bucket，bucket instance，user。 出现非常莫名的bucket不存在了，但是instance在，且还link在user上，况且是没有执行删除bucket的情况下。\r\n没有删除bucket，估计是同步出现一致性问题。 删除bucket那就是删除操作本身也出现一致性问题。\r\n问题都是bucket信息没了，并非bucket instance key对应的bucket info信息没了。	2018-09-01 05:53:53.196374	f
309	95	Issue	5	4，gc list问题是因为加入gc使用instance不具备唯一性。应该使用manifest中的prefix。\r\n另外对象删除如果依赖gc，也没必要必须等多久删除，当然这样有奇效（就是防止误删除）\r\n\r\n多数据中心数据缓存也可以利用该机制来处理，对于那些不在本地存数据的bucket，或者数据不在本地的对象，使用gc来管理其淘汰策略。	2018-09-02 10:55:48.999112	f
310	95	Issue	5	奇怪的是配置了nginx支持长连接之后，rgw波动就好了很多。性能也变得稳定了，看来nginx这里可能是波动的瓶颈\r\n\r\nkeepalive_timeout  180;\r\nkeepalive_requests 8192;	2018-09-04 15:32:30.925198	f
311	96	Issue	5	继续改进rgw日志，v5.2.0 增加同步带宽的监视。\r\n强调时间，效率	2018-09-05 07:00:16.635654	f
313	96	Issue	5	如何进行大对象空间管理。\r\nfreelist。 \r\n\r\n可提供bucket的强力删除手段，把index和rados对象都给删除掉。\r\n\r\n这个特性与到期数据转移可能存在一些冲突。小文件还转移吗？代价有点高。\r\n\r\nbucket针对每个pool都有hash空间也是可以的。BI上记录对象被映射到哪个rados object。\r\n\r\n顺序存放的问题在于写入冲突非常剧烈，对性能影响比较大。\r\nhash的问题在于难以控制每个桶的对象，且扩展不方便。	2018-09-06 07:45:27.597197	f
314	96	Issue	5	帮忙修复5.2.0的问题等。\r\n\r\n修改性能统计的时间精度	2018-09-07 14:46:42.909837	f
315	97	Issue	5	完成5.1.0的发布。\r\n1，遗留问题处理。\r\n2，兼容性问题处理。单个zone升级兼容，以及多个zone的升级兼容。\r\nrados的兼容。 rgw升级验证。\r\n\r\nNAS pool写入，全量同步的时候传入storage class，增量的时候可利用特殊的op来标记bilog	2018-09-10 07:06:41.997057	f
316	97	Issue	5	综合优化：\r\n1，osd进程挂掉之后，在数据量大时，需要很长时间才up\r\n2，恢复优先对peering速度有影响\r\n3，恢复qos控制不精准。	2018-09-11 09:33:05.816317	f
317	97	Issue	5	1,完成摘要式的ceph与s3标准接口对比\r\n2，梳理产品规格，完善产品手册。\r\n3，修复qos的bug。	2018-09-12 07:09:26.945881	f
284	91	Issue	5	https://www.kernel.org/doc/Documentation/block/queue-sysfs.txt\r\nqueue参数\r\n\r\nhttps://blog.csdn.net/wangww631/article/details/78798637\r\n\r\nmax_segments (RO)\r\n-----------------\r\nMaximum number of segments of the device.\r\n\r\nmax_segment_size (RO)\r\n---------------------\r\nMaximum segment size of the device.\r\n\r\n这两参数主要是影响io下发情况，一个segment即一个内存片段。iov方式写入时，最大请求大小就是\r\nmax_segments*max_segment_size， 显然通常可能达不到。\r\n\r\n\r\nmax_hw_sectors_kb (RO)\r\n----------------------\r\nThis is the maximum number of kilobytes supported in a single data transfer.这个是硬限制，通常是256kb\r\n\r\nmax_integrity_segments (RO)\r\n---------------------------\r\nWhen read, this file shows the max limit of integrity segments as\r\nset by block layer which a hardware controller can handle.\r\n\r\nmax_sectors_kb (RW)\r\n-------------------\r\nThis is the maximum number of kilobytes that the block layer will allow\r\nfor a filesystem request. Must be smaller than or equal to the maximum\r\nsize allowed by the hardware.\r\n\r\nnr_requests (RW)\r\n----------------\r\nThis controls how many requests may be allocated in the block layer for\r\nread or write requests. Note that the total allocated number may be twice\r\nthis amount, since it applies only to reads or writes (not the accumulated\r\nsum).\r\n\r\nTo avoid priority inversion through request starvation, a request\r\nqueue maintains a separate request pool per each cgroup when\r\nCONFIG_BLK_CGROUP is enabled, and this parameter applies to each such\r\nper-block-cgroup request pool.  IOW, if there are N block cgroups,\r\neach request queue may have up to N request pools, each independently\r\nregulated by nr_requests.\r\n\r\n小请求时，这个参数非常重要，队列深度不够则合并减少，整体性能也会下降。 可对比avgqu-sz来分析\r\n	2018-08-15 14:11:28.084483	f
287	39	Issue	5	用SSD缓存inode并没解决inode过多的问题。	2018-08-16 15:00:38.587427	f
290	90	Issue	5	协助支持烽火性能测试\r\n协助分析海量小文件性能问题，修改目录层次，并调整对象的hash放置。目前性能仍然在测试阶段，达到3亿之后的稳定性有明显提升。\r\n提供Admin API接口支持查询bucket是否同步。	2018-08-17 16:11:13.528667	f
291	92	Issue	5	scrub的问题还没那么好改，其实这不仅是scrub的问题。凡是list可能都有问题。\r\n不过还好rgw不会调用rados的list功能。\r\n\r\nhash与reverse nibble的关系是反转的。\r\n这里的主要问题在于list是按字符序的，但是index认为自己是反序的。\r\n这里index的顺序和nibble一致，	2018-08-20 18:47:26.738492	f
292	92	Issue	5	考虑整个多数据中心方案。应用如何感知数据位置？	2018-08-22 06:58:16.094814	f
293	92	Issue	5	解决双活在bucket全量同步阶段的问题 cd#246	2018-08-22 07:01:12.112784	f
294	92	Issue	5	FileStore的hash index遍历算法：\r\n	2018-08-22 10:25:54.371639	f
295	92	Issue	5	scrub能扫描到所有对象有一个前提：\r\nhash_prefixes的排序与cmp_bitwise的排序一致。\r\n但是hash_prefixes是用的hash反序，与bitwise用bit反序顺序必然不一定一致。	2018-08-22 13:58:27.953328	f
296	92	Issue	5	解决问题#240，#218	2018-08-24 07:35:04.340089	f
297	95	Issue	5	解决分片上传统计的bug	2018-08-27 09:04:06.686401	f
298	95	Issue	5	验证perf版本是否有问题。\r\n可能是因为rgw在线创建pool过慢导致meta同步出现问题。	2018-08-27 12:00:57.864021	f
299	4	Issue	5	附件，不一定有多少个已建立连接	2018-08-27 15:33:19.300798	f
300	4	Issue	5	奇怪的是当把其他同步rgw关闭，netstat 查看大部分与此rgw相关连接也进入CLOSE_WAIT状态，ss -lt仍然看到Recv-Q 129,似乎无法释放。	2018-08-27 15:46:21.749632	f
301	95	Issue	5	日志和分片上传问题解决。\r\n但是499问题根因仍然没找到，为什么撑爆了恢复不了呢？ filestore分裂仍然有问题，可能恢复和pool删除场景都有问题。	2018-08-27 18:50:57.685517	f
302	95	Issue	5	1,中广核数据分发方案\r\n2，filestore分裂方案	2018-08-28 13:27:33.432297	f
303	93	Issue	5	还有一种排序是目录排序，这是三位一体的。这三者必须保持一致，否则可能无法扫描到所有对象。\r\n\r\n请参考get_path_contents函数，其中有根据目录排序的逻辑	2018-08-28 15:33:39.262307	f
304	93	Issue	5	common/Mutex.cc: 113: FAILED assert(r == 0)\r\n\r\n mos version v5.1.0-54-g42a2ebc (42a2ebc4965ff3ab1c12135387cfcb96554c8f83)\r\n 1: (ceph::__ceph_assert_fail(char const*, char const*, int, char const*)+0x8b) [0x7f198cdd92eb]\r\n 2: (Mutex::Lock(bool)+0x19c) [0x7f198cd89fdc]\r\n 3: (std::_Sp_counted_deleter<FDCache::FD*, SharedLRU<ghobject_t, FDCache::FD, ghobject_t::BitwiseComparator, std::hash<ghobject_t> >::Cleanup, std::allocator<int>, (__gnu_cxx::_Lock_policy)2>::_M_dispose()+0x28) [0x7f198cad67a8]\r\n 4: (std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()+0x39) [0x7f198c74cec9]\r\n 5: (FileStore::lfn_unlink(coll_t const&, ghobject_t const&, SequencerPosition const&, bool)+0x33f) [0x7f198cab3a6f]\r\n 6: (FileStore::_remove(coll_t const&, ghobject_t const&, SequencerPosition const&)+0x6f) [0x7f198cab42ff]\r\n 7: (FileStore::_do_transaction(ObjectStore::Transaction&, unsigned long, int, ThreadPool::TPHandle*)+0x1e72) [0x7f198cac7b92]\r\n 8: (FileStore::_do_transactions(std::vector<ObjectStore::Transaction, std::allocator<ObjectStore::Transaction> >&, unsigned long, ThreadPool::TPHandle*)+0x3b) [0x7f198cacb3fb]\r\n\r\n\r\n已知在pg创建时，重启osd会挂掉\r\n删除pool，pg会挂掉	2018-08-28 21:59:53.219662	f
305	93	Issue	5	会不会是部分对象的hash前面全部都是0，导致的。\r\n\r\n确实像是这种原因，修改之后就可以删除pool了。	2018-08-28 22:07:01.301899	f
307	93	Issue	5	合入5.1.0版本，支持配置目录层次，默认2层。	2018-08-29 00:12:09.733251	f
306	93	Issue	5	调整算法，根据hash来计算目录，只是前面三层仅为一层目录而已。其他地方无需任何修改\r\n这种算法有个限制，就是pg的hash值需要为16的倍数，也就是hash要单独占一个字符，否则对象分布并不在预期内。\r\n比如说4个pg，只占了2字符。 那么hash值尾数为1，5，9，13都会落在这个pg。但是根据规则可能只创建了DIR_1.\r\n\r\n当然这提前可以计算。就是把剩余位数补齐之后，计算所有数对于当前pg总数求模的值\r\n\r\n另外如果仅两层目录搞预分裂也是非常快的。\r\n\r\n	2018-08-28 23:28:37.006996	f
312	96	Issue	5	性能可以做到以5s为粒度几乎不波动。 cosbench统计周期也是5s	2018-09-05 13:47:41.96519	f
318	97	Issue	5	1,同步不跑的bug\r\n2，qos的bug\r\n3，合入gc tag处理的问题	2018-09-13 06:47:23.100955	f
320	98	Issue	5	海量小文件方案:\r\n设置bucket的rados shard数量。\r\n比如默认按5000万对象算，100个小文件合并为一个大文件。10kb~500kb文件，rados对象就是1M~50MB。\r\n总文件数50万。\r\n\r\n可支持动态修改。rados shard。但是之前的对象不会挪位置。这样虽然rados对象大小不一致，但是关系不大。\r\n\r\n对于不存在删除场景的bucket，可以使用其他方式处理。	2018-09-17 17:12:59.155963	f
322	98	Issue	5	在技术栈上，TiKV符合mos对于分布式kv系统的要求。下决心攻克这个堡垒。\r\n\r\n1，支持事务\r\n2，range数据分布，以支持高效的数据查询。\r\n3，增量恢复，解决bi以rados object粒度恢复以及scrub的问题。\r\n\r\n现在的mos无法作为一个大规模产品，bucket的限制，以及查询的限制都严重制约了其使用场景。\r\n	2018-09-17 17:23:21.828922	f
323	98	Issue	5	解决qos bug，以及simple messager死循环bug\r\n\r\n提交cdp相关修改。在多版本的情况下，也记录bilog，并且将bilog trim的时间调整为默认30天。\r\n优化修改leveldb配置，sst文件大小与 write_buffer_size也有关系。将其默认值调整为64MB\r\n	2018-09-19 09:45:34.354972	f
324	98	Issue	5	编写性能分析工具，可以按照非常方便的查看每个osd的请求数量以及延时情况等。	2018-09-21 07:47:22.319864	f
327	111	Issue	5	linux下，通过调整内核参数解决，\r\nvim /etc/sysctl.conf\r\n编辑文件，加入以下内容：\r\nnet.ipv4.tcp_syncookies = 1\r\nnet.ipv4.tcp_tw_reuse = 1\r\nnet.ipv4.tcp_tw_recycle = 1\r\nnet.ipv4.tcp_fin_timeout = 30\r\n然后执行 /sbin/sysctl -p 让参数生效。\r\n\r\n这样可以避免出现该错误\r\n\r\n*让time_wait状态的进行重用，这对于高并发连接的服务器是必须设置的*。	2018-10-08 12:04:18.234183	f
329	110	Issue	5	6，net.ipv4.tcp_tw_reuse = 1 解决端口被使用完的问题	2018-10-08 15:10:07.056232	f
335	109	Issue	5	焦虑多是因为风险\r\n风险是因为自己太弱	2018-10-09 19:08:30.22552	f
336	89	Issue	5	刷新：\r\n1，BI使用rados pool存储时的规模限制。\r\n   可以考虑使用db来存储bi，以及realm，zone，bucket，user等元数据。\r\n\r\n2，bucket自动跨pool，对业务不感知\r\n\r\n3，框架调整，实现与rados的解耦。\r\n   一方面可以利用rados的进步，另外根据对象存储，可实现自定义的backend。\r\n   比如在bluestore的基础上，各种砍除，剪裁。\r\n4，实现小文件的合并（看怎么实现，可能对于rados而言就存在覆盖写了）\r\n\r\n5，双活优化\r\n可以考虑将meta的同步改为同步方式，以避免period的变化对meta同步实现的影响。\r\n不过要考虑zone失效的情况。	2018-10-11 13:00:59.983637	f
337	103	Issue	5	1，确定自己是真有兴趣的，校验标准是自己平时会想它么，就像恋爱一样，吸引着你吗？\r\n2，搞清楚大体框架，沙盘，理清其本质，解决的核心问题。\r\n3，反复演练，让自己练出思维惯性。	2018-10-12 12:40:07.598284	f
339	118	Issue	5	当一个人本身有良好的习惯，比较容易通过学习或其他方式获得成功时，目标不是一个大问题。\r\n\r\n对于迷路很久的人，需要打破现有状态是需要精神力量支持的，因为他们还没看到正向循环，还没感受到合理的方式本身会让生活更好更有趣。	2018-10-12 14:33:39.755934	f
341	115	Issue	5	https://blog.csdn.net/smstong/article/details/42193177	2018-10-12 20:51:18.957093	f
343	115	Issue	5	wchar_t 存在的意义是什么？表示unicode编码的字符串？\r\n其意义在于不论用何用方式保存源文件，其字符串编码都是唯一确定的，不用考虑字符串编码格式问题。\r\n*一个宽字符可以表示任何系统所能认识的字符* （包括中文等）\r\n通常我们并不关心这个问题，因为一般源文件保存格式与终端输出格式是一致的。但是如果你想程序既能在windows上运行（默认gbk编码），也能在linux上运行（默认utf8编码）。则必须注意输出的编码格式了。或者你把大陆的gbk编码拿到台湾的big5下，不使用wchar_t 也是搞不定的。这是因为不同编码格式下存储方式不一致，而wchar_t 定义了不依赖于系统编码的格式。\r\n\r\n\r\nhttp://www.cppblog.com/lf426/archive/2010/06/25/118707.html	2018-10-12 21:34:23.377889	f
328	110	Issue	5	3,检查5.1.0是否有修改需同步到5.2.0\r\n4,es 6.x版本不支持在一个index下面使用多个type了，之前我们多个数据中心使用不同type区分的使用方式需要修改.\r\n5,修改版本命名规范	2018-10-08 13:42:18.946577	f
330	108	Issue	1		2018-10-08 19:31:31.284943	f
331	112	Issue	1		2018-10-08 19:34:03.002459	f
332	112	Issue	1	一方面并未完全限制死。另外如果内地企业卖往国外的产品产生的外汇收入不流入国内(海外结算)，而国内需使用美元购买必需品，长期下去外汇必然不断减少。\r\n\r\n在国内信用下降时，他国商人如果不能直接兑换外汇，就会换成商品转移出去。这时股市会大降。信心流失，而物价则会上涨。	2018-10-08 19:48:06.721426	f
333	113	Issue	1	你要理解钱的本质是什么？ 是信用。是信用推动了M2的发展。但当信用出现危机时，这些钱就回从到原始的地方。\r\n最终社会流动性降低，资产价格下降。价格是供需决定的，货币流动减少则供应减少。	2018-10-09 05:56:33.830474	f
334	114	Issue	5	人生也是因为有了认真，有了坚实不虚的每一天才那么多彩	2018-10-09 19:05:49.023883	f
338	118	Issue	5	也许难以统一人的精神动机，有的人是因为恐惧，有的是因为虚荣，有的是因为憎恨，压迫算么？孤独？信仰？神灵？榜样？斗争（斗争的动力是什么）？\r\n\r\n理性的认知：因为这种充满精神力量的，有目标感的生活是更好的方式。俗人以为慵懒，满足自己欲望是更好的。\r\n\r\n但是感性在其中起着怎样的作用呢？理性如何解释人如何能产生崇高的理想，坚定的目标？这也是我起初认为爱和兴趣，好奇心是精神力量的源头。像牛顿，爱因斯坦这种科学家，破解未解之谜。当然名誉也是一种动力，获得赞美也是动力。\r\n\r\n也许对于一些人而言。因兴趣而为，伴随榜样的力量，赞誉的推动加上天赋就足以达到别人无法企及的水平。\r\n	2018-10-12 14:08:06.965639	f
345	115	Issue	5	通过xfs从windows传中文文本文件，在linux上文件名和内容均无法识别。\r\n系统默认编码绝对了内容的存放方式，也决定了部分终端对输出的处理方式。\r\n除非部分终端进行转码处理。\r\n\r\nwchar_t 可以解决这种跨平台问题，在运行时，根据环境决定输出使用什么编码。	2018-10-13 11:47:01.628016	f
340	115	Issue	5	几乎所有编码都是兼容ASCII的，所以对于字符串而言，使用\\0结束都不是问题。\r\n软件如果内部不进行转码，在string中存储了就是对应编码的2进制形式，这时使用其他方式解码很可能就是乱码。\r\n\r\n比如你保存一个文本文件，其使用gbk编码。 如果你使用notepad++ 使用ansi编码，utf8编码查看都不是中文字符。\r\n\r\nANSI 编码\r\nD0B6D0B0  卸邪\r\n\r\nUTF8编码\r\nD0B6D0B0  жа\r\n\r\n中文BIG5编码：\r\nD0B6D0B0  笢\r\n\r\n中文 GB2312编码\r\nD0B6D0B0  中\r\n\r\n实际上文件二进制内容是完全一样的。\r\n\r\n问题来了：\r\n1，程序怎么知道输入法给自己的是什么编码呢？ \r\n2，显示器又怎么知道给出的待输出二进制是什么编码呢？\r\n对于输入法而言，它会把你的输入按照系统编码进行转码，然后传给程序。\r\n对于显示器而言，\r\n3，修改系统默认编码会有什么影响？ 比如上述文本，在utf8下输入中文“中”，对应的二进制肯定会发生变化。\r\n对于应用程序而言，读取不同编码格式，显示的时候需要怎么处理呢？\r\n4，wchar和编码显示有何关系？\r\n\r\n	2018-10-12 18:53:03.388774	f
346	115	Issue	5	https://www.quora.com/Why-doesnt-Microsoft-use-UTF-8-on-Windows-10\r\n这篇文章提及，windows内部使用的是utf-16编码，但是code page是什么意思呢？linux也有code page的概念么？\r\n\r\nhttps://zh.wikipedia.org/wiki/代码页\r\n\r\n内码页就是显示器设置的，你给显示器的二进制，显示器怎么显示就取决于内码页。\r\n可以转换内码页，但是不知道能否有函数指定某个字符使用什么内码页显示。\r\n\r\nwindows内部使用的编码跟内码页没关系。你可以使用各种方式来保存文件。但显示的时候需处理	2018-10-13 12:40:45.121404	f
342	115	Issue	5	输入使用的系统默认的编码格式，就是说在文本编辑器中使用的编码格式是固定的。\r\n如果你想把gbk的编码转为utf8的，需要自行处理。\r\n\r\n输出终端有自己默认的编码格式，如果你给出的字符不是对应格式的，则无法正确显示。\r\nwindows窗口应该也有指定的字符编码。比如cmd窗口 chcp 65001 就是utf8编码\r\n\r\n显示器是不管编码的，输出终端管编码。显示器只是根据终端驱动给出的字库进行显示。不过有一点终端根据二进制编码找字库，这一步对于不同的编码是否也不一样呢？\r\n终端知道编码和二进制值，只要字库提供各种编码对应的字库就可以了。\r\n\r\n所以如果你输入是gbk编码，在程序中你需要转为unicode编码，再然后可以根据unicode编码转化为big5编码，从而在默认big5编码的终端上显示出来。\r\n	2018-10-12 21:11:32.469814	f
344	115	Issue	5	当我在一个ansi类型的txt文件 和 在一个utf类型的txt文件中各写入同样字符时，最终保存的二进制内容不一样。\r\n这个不一样是谁做的呢？ 输入到记事本的时候，记事本根据文件编码类型进行了转换么？ 应该是这样的。	2018-10-12 22:02:20.958082	f
347	121	Issue	5	还有一种解决方案是创建对象时分裂，但是这样开始性能很慢，不利于测试。	2018-10-16 09:46:07.327316	f
348	121	Issue	5	pg_num  320\r\n\r\nhex: 140\r\n\r\nseed + 320\r\nseed: 1  001  141 281 3C1 501 641 781 8C1 A01 B41 C81 DC1 F01 \r\n \r\n给出一个函数，计算hash值情况，然后创建pg。 可提供参数，允许pool支持提前创建，这样可加快实际执行速度。\r\n参数限制预创建的目录总数，这样就基本可以控制一个pool的对象总数。\r\n\r\n1，首先根据pg_num计算出总的深度\r\npg_num 4096，则其深度为4，在原有基础上+2，也就是深度为6.\r\n\r\n2，循环计算6层目录\r\nseed： 000001 001001 002001 003001 004001\r\n\r\n\r\n依赖还是要充足，分析清楚pg到底是如何分裂的。\r\n比如求模大于pg_num求模,则split_bits为 p-1，否则为p\r\n\r\n假设pg_num从100，扩充到150，哪些pg需要分裂呢？ childpg的计算。\r\n\r\n102增加到104，split 的pg分别是 21.26，21.27\r\n\r\n26：0010 0110   66：0110 0110\r\n27：0010 0111   67：0110 0111\r\n\r\n为啥不是0000 0110呢？ 为什么不是2和3呢？\r\n\r\n2 | 0100 0000 < 0110 0100\r\n2 | 1000 0000 > 0110 1000\r\n\r\n所以2被干掉了。请参考函数is_split,找到符合>= old_pg_num && < pg_num,且seed计算后仍然为本seed的数值，作为child pgs。\r\n\r\n也就是说分裂的seed满足这样的条件：其二进制的低位与parent是一致的。\r\n\r\n这样就好办了。对于26，只需创建如下目录：\r\n\r\n6\r\n2 6 E\r\n就可以满足分裂要求了。要么在本层不会分裂，就会进入下一层。\r\n\r\n参考函数col_split_level\r\n转移就是把path的hash值符合child seed且大于原inbits的转移出来。\r\n所以上述就算有6/3目录，也不符合转移的条件。\r\n\r\npg分裂是根据二进制数值来计算的，pg seed是根据十进制计算的。	2018-10-16 16:09:50.413146	f
349	120	Issue	5	解决filestore目录预分裂在pg split时的bug。	2018-10-18 07:11:08.048266	f
350	121	Issue	1	问题原因分析：\r\npg分裂时计算方式，如pg 1.26，当新建pg数量大于102时，则其会分裂出1.66.\r\n也就是说是在高位扩展的方式实现pg的分裂的。\r\n0010 0110 (26)  第一次扩展就是 0110 0110 (66)\r\n\r\n这也是为什么filestore需要将数据根据hash反序存放，其目的就是达到在pg分裂时仅move目录即可。\r\n\r\n上次修改pg分裂打破了该规则，导致数据根本没法正常转移到分裂的pg。因而出现了\r\n1，在当前pg下的对象hash在新的osdmap下已经不属于该pg了，hash check失败\r\n2，根据新的osdmap，定位之前创建的对象，如果对象在新的pg就无法找到对应的对象\r\n等问题。\r\n\r\n解决方案：\r\n\r\n仍然使用预分裂的方式，避免在后期转移大量文件。\r\n目前结构按hash组织，避免打破上述规则。\r\n\r\n比如23.1A1，预分裂后目录结构为：\r\n1\r\nA\r\n0 1 ...F \r\n\r\n假设某次分裂出23.3A1， 则只需转移数据 1/A/3 目录即可，其他数据仍然留在当前pg。\r\n	2018-10-18 07:54:42.542507	f
351	121	Issue	1	实际上数据也是按照二进制放的，参考函数 ceph_stable_mod.\r\n假设pg_num是140，按10进制计算，位数为140(8C)的对象应该放入pg.0\r\n但是按照二进制算 8C 1000 1100 按照函数ceph_stable_mod算，应该放入pg.C.\r\n也就是说ceph使用的是二进制求模运算。	2018-10-18 17:33:28.265453	f
355	127	Issue	1	在切换到下一个period时，重置marker位置。但是重置可能失败。\r\n应该在marker中记录同步位置，参考社区修改：574ff5f5df62a0a1e9a8ff7e4a87cd65cc952d7e	2018-10-20 09:44:24.239268	f
358	133	Issue	5	私有云的缺点：\r\n1，资源整合弱\r\n2，技术实力弱\r\n3，运维效率底下	2018-10-23 09:39:23.799489	f
360	134	Issue	5	NoQ.beoYENxSW_860 [writefull 0~4194048] v233'6003 uv6003 ondisk = 0) v7 ==== 223+0+0 (2953448851 0 0) 0x7f0c3ac73300 con 0x7f0c520c1600\r\n    -4> 2018-10-24 14:26:54.363392 7f0c3c1fb700  1 -- 192.168.13.120:0/4184383355 <== osd.2 192.168.13.119:6800/47746 14980 ==== osd_op_reply(187355 8a333bb8-7fb4-4bfe-840d-490f87f2502b.40647.37__shadow_myobjects8418.BVNAk9fihrpnTH2xW8IFnOIK9JcSPbn_1076 [writefull 0~4194048] v233'5972 uv5972 ondisk = 0) v7 ==== 224+0+0 (3079957286 0 0) 0x7f0c37473600 con 0x7f0c520c1a80\r\n    -3> 2018-10-24 14:26:54.374741 7f0c38afc700  1 -- 192.168.13.120:0/4184383355 <== osd.7 192.168.13.120:6804/47448 11860 ==== osd_op_reply(187380 8a333bb8-7fb4-4bfe-840d-490f87f2502b.40647.37__shadow_myobjects8494.0-neB8QEGmQ3MvjH2MX5ys0HfAnCkwC_964 [writefull 0~4194048] v233'5834 uv5834 ondisk = 0) v7 ==== 223+0+0 (1919885020 0 0) 0x7f0c33073600 con 0x7f0c520c2080\r\n    -2> 2018-10-24 14:26:54.374935 7f0c527fd700  1 -- 192.168.13.120:0/3752582948 <== osd.13 192.168.13.118:6812/47074 188 ==== osd_op_reply(188 realms.1bfb4d43-57f9-461f-ba11-8779cd840e21.control [watch ping cookie 139691342021376] v0'0 uv1 ondisk = 0) v7 ==== 171+0+0 (1674671842 0 0) 0x7f0b91015300 con 0x7f0c6cc3c700\r\n    -1> 2018-10-24 14:26:54.383316 7f0c3c1fb700  1 -- 192.168.13.120:0/4184383355 <== osd.2 192.168.13.119:6800/47746 14981 ==== osd_op_reply(187401 8a333bb8-7fb4-4bfe-840d-490f87f2502b.40647.37__shadow_myobjects8418.BVNAk9fihrpnTH2xW8IFnOIK9JcSPbn_1076 [write 4194048~256] v233'5973 uv5973 ondisk = 0) v7 ==== 224+0+0 (458386884 0 0) 0x7f0c37473600 con 0x7f0c520c1a80\r\n\r\n\r\n为啥不是一次性写入4MB？	2018-10-24 14:59:28.279043	f
363	134	Issue	5	从代码分析，当chunk size与stripe size相等的时候，不可能出现覆盖写的情况。	2018-10-25 19:16:48.278968	f
365	137	Issue	5	政治与人际关系\r\n政治与权力\r\n政治与斗争\r\n\r\n政是政策？ 治是治理？	2018-10-26 06:34:32.221484	f
368	134	Issue	5	xfs在频繁创建文件，删除文件之后形成的空洞也是个大问题。	2018-10-27 07:52:33.905798	f
369	140	Issue	5	流程:研发在feature合入之后，自发现问题单也需提单，但不必转给测试。特性或重要bugfix需review，review记录到版本svn。	2018-10-30 08:50:11.376526	f
372	140	Issue	5	貌似delete obj bypass gc也有问题	2018-10-30 18:17:42.136213	f
404	150	Issue	5	2018-11-09 21:16:51.425939 7fb37fbff700  4 rgw realm watcher: Disconnected watch on realms.8527beb0-c88c-4b34-9cd8-fe7eae7ca6a5.control\r\n2018-11-09 21:16:56.897957 7fb4eb3fe700 -1 RGWWatcher::handle_error cookie 140415140703360 err (107) Transport endpoint is not connected\r\n2018-11-09 21:16:56.898023 7fb4eb3fe700  2 removed watcher, disabling cache\r\n2018-11-09 21:16:59.284277 7fb4eb3fe700 -1 RGWWatcher::handle_error cookie 140415140704256 err (107) Transport endpoint is not connected\r\n2018-11-09 21:17:02.796462 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:17:06.565509 7fb4eb3fe700 -1 RGWWatcher::handle_error cookie 140415140699776 err (107) Transport endpoint is not connected\r\n2018-11-09 21:17:10.045663 7fb4eb3fe700 -1 RGWWatcher::handle_error cookie 140415140701568 err (107) Transport endpoint is not connected\r\n2018-11-09 21:17:12.388277 7fb4eb3fe700 -1 RGWWatcher::handle_error cookie 140415140700672 err (107) Transport endpoint is not connected\r\n2018-11-09 21:17:18.315045 7fb4eb3fe700 -1 RGWWatcher::handle_error cookie 140415140702464 err (107) Transport endpoint is not connected\r\n2018-11-09 21:17:24.796573 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:17:27.189282 7fb4eb3fe700 -1 RGWWatcher::handle_error cookie 140415140698880 err (107) Transport endpoint is not connected\r\n2018-11-09 21:17:27.190580 7fb4eb3fe700 -1 RGWWatcher::handle_error cookie 140415140697984 err (107) Transport endpoint is not connected\r\n2018-11-09 21:17:46.796697 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:18:08.796818 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:18:30.796926 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:18:52.797028 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:18:53.792040 7fb37fbff700  4 rgw realm watcher: Disconnected watch on realms.8527beb0-c88c-4b34-9cd8-fe7eae7ca6a5.control\r\n2018-11-09 21:18:56.984523 7fb4da7ff700  0 ERROR: register_watch() returned ret=-110\r\n2018-11-09 21:19:14.797137 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:19:36.797241 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:19:58.797350 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:20:20.797458 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:20:42.797564 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:21:04.797674 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:21:26.797779 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:21:48.797886 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:21:59.883048 7fb4eb3fe700 -1 RGWWatcher::handle_error cookie 140415140701568 err (107) Transport endpoint is not connected\r\n2018-11-09 21:22:10.797989 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:22:32.798082 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:22:54.798188 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:23:16.798288 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:23:38.798400 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:24:00.798521 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:24:22.798626 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:24:44.798732 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:25:06.798847 7fb4e5bfd700  2 RGWDataChangesLog::ChangesRenewThread: start\r\n2018-11-09 21:25:12.519799 7fb4eb3fe700 -1 RGWWatcher::handle_error cookie 140415140697984 err (107) Transport endpoint is not connected\r\n	2018-11-10 14:45:35.167165	f
398	148	Issue	5	1，情绪，情感本身应该作为理性的一部分，大脑存在的非理性部分也是既定事实\r\n2，连结与银行存款的比喻很贴切。\r\n3，情绪，水桶的比喻也非常贴切。	2018-11-05 17:10:36.350764	f
403	141	Issue	5	1，文档\r\n2，问题单继续处理	2018-11-09 07:08:27.036826	f
406	162	Issue	6		2018-11-14 03:37:30.129135	f
412	148	Issue	6	【要点1】“联结-断裂-重新联结”.在亲密的关系中，我们要做的不是绝对避免断裂，而是在断裂后努力重建联结，父母要主动与孩子重建联结。\r\n\r\n【要点2】父母与孩子之间良好的亲子关系就像一条“隐形脐带”，为孩子源源不断地输送了心理营养，使孩子拥有足够的安全感。\r\n\r\n【要点3】孩子说“妈妈，你走开”，真是想法却是“我想让你知道，此刻我很难过”。此时的孩子是在用“气话”和“哭闹”来表达自己糟糕的心情和感受。\r\n\r\n【要点4】当孩子出现三种负情绪：生气/愤怒，害怕/恐惧，伤心/悲伤，这是孩子的情绪水桶满了，当孩子在父母理解接纳的情况下大哭一场之后，他的情绪自然会恢复平静。\r\n\r\n【7个小游戏】\r\n# 爱的香香\r\n# 爱抱宝贝的机器人\r\n# 遥控器游戏\r\n# 枕头大战\r\n# 爱的帐篷\r\n# 爱的暗号\r\n# 小猫上树\r\n\r\n\r\n	2018-11-14 04:18:07.144087	f
501	4	Issue	5	从抓包的结果看：\r\ntcp请求可以进入半连接状态，即server可成功收到SYNC并发送ACK。\r\n但是server全连接队列满了，recv-q 129, 无法进入accept连接。\r\n\r\n问题的根因还在于accept为啥没有取走任何连接？	2018-12-18 13:46:22.268282	f
502	4	Issue	5		2018-12-18 13:47:14.772045	f
517	4	Issue	5	https://stackoverflow.com/questions/27395496/socet-recv-hangs-when-server-crashes\r\n\r\nread可能在极端情况下卡死，但是select在这种情况下同样获取不到数据，但是可定义超时时间，从而服务端可主动关闭。	2018-12-24 18:59:14.655066	f
518	4	Issue	5		2018-12-24 19:17:33.138122	f
352	121	Issue	1	参考get_split_bits函数：\r\nsplit_bits的含义就是从此之后在左边以二进制扩展1的数据都属于本pg。\r\n对于pg_num 1111 1010 (250)\r\n\r\npg 1011 1010 的split_bits就是8\r\npg 0111 1011 的split_bits就是7	2018-10-18 17:58:00.164931	f
353	121	Issue	1	还有一个问题，revise bit用来干啥的？	2018-10-19 07:43:08.184308	f
443	171	Issue	5	multipart在对象ESIXT的时候改变head对象名，这样不合适吧，在分片上传失败的情况下，这些head对象岂不是无法找到。\r\n\r\n不过这问题可能只会导致head残留，但是abort和complete multipart都没问题，应该都是根据meta对象的属性记录来遍历的。\r\nmeta bi存在的意义似乎只在于quota统计。	2018-11-17 16:06:53.016782	f
354	127	Issue	1	es zone全量同步实质上做完了，但是就是没有输出 done over all的日志。\r\n\r\nes返回了大量429错误，这里可能需要做下流控。控制每秒发出的请求数量。\r\n\r\n如何控制es不返回429？ fullsync位置因为错误无法更新。但是既然最终同步成功，那fullsync位置还是有机会往后走的？否则怎么会同步成功呢？\r\n\r\n这问题并非必现，有时可以进入正常的增量同步状态(incremental)	2018-10-19 20:39:13.387683	f
356	130	Issue	1	多故障域，一个故障域不可用影响其他故障域问题。\r\n\r\n对于集群元数据，可以建立跨越故障域的元数据故障域。就像mon一样。\r\n建议在此类场景下，每个环境使用一个独立的SSD或小盘建立元数据集群。\r\n\r\n可靠性是相对的。	2018-10-22 11:30:09.254359	f
357	133	Issue	5	另外把计算资源比喻水电是非常不合适的，在没水的情况下，实际上我们是可以去超市买水的。\r\n\r\n但是存储的数据不是可以买来的，你可以买硬件，但是买不来数据。	2018-10-23 08:55:23.453279	f
359	134	Issue	5	分析频繁删除场景下的性能。kworker占用大量cpu。	2018-10-24 14:49:35.55343	f
361	135	Issue	5	https://bean-li.github.io/disk-cache-policy/\r\n\r\n\r\n可以看到Disk Cache Policy 是 Disk’s Default 。这个default值可以分成以下情况：\r\n\r\nFor virtual disks containing SATA disks ， Enabled\r\n\r\nFor virtual disks containing SAS disks ， Disabled\r\n\r\n可以通过如下命令将Disk Cache Policy的值改成 Disable	2018-10-25 12:58:37.24758	f
362	134	Issue	5	rgw超时自杀，但是rados op超时这种情况应该排除。以免影响其他故障域。	2018-10-25 16:03:36.32275	f
366	137	Issue	5	在总体上讲，政治是上层建筑领域中各种权力主体维护自身利益的特定行为以及由此结成的特定关系。\r\n\r\n马克思认为，“政治是经济的最集中的表现”，“政治就是各阶级之间的斗争”，“政治就是参与国家事务，给国家定方向，确定国家活动的形式、任务和内容”，“政治权力不过是一个阶级用以压迫另一个阶级的有组织的暴力”。\r\n\r\n西方的政治学家为政治下过许多定义，例如：\r\n①认为政治是国家的活动，是治理国家，是夺取或保存权力的行为。\r\n②认为政治是权力斗争，是人际关系中的权力现象。\r\n③认为政治是人们在安排公共事务中表达个人意志和利益的一种活动，政治的目标是制定政策，也就是处理公共事务。\r\n④认为政治是制定和执行政策的过程。\r\n⑤认为政治是一种社会的利益关系，是对社会价值的权威性分配。\r\n⑥一群人借以控制另外一群人的按照权力组织的关系和安排。\r\n⑦“政治”是指规则制定、维系或修正（即以和平的方式讨论）的特定方式。	2018-10-26 06:37:25.272679	f
367	138	Issue	5	约几个人开怀畅谈？ 让人展现自己。\r\n聊天不需要总是特别理性，人际交往更多的是情感倾诉之类的。 我貌似很少做情感倾诉。内向的人多理性。\r\n\r\n5，让自己变成一个有情商的人？ 什么是情商？\r\n6，如何寻找聊天话题，以不至于把天聊死？	2018-10-26 07:06:04.889774	f
371	140	Issue	5	在多版本产生delete marker的情况下，如果是null版本，应该做删除rados对象的操作。	2018-10-30 18:00:26.04397	f
373	140	Issue	5	把ceph master的所有multisite的问题单分析一遍	2018-10-30 18:32:41.531916	f
370	140	Issue	5	写与删除并发场景下可能有点问题，因为我们流程是：\r\n1，get\r\n2，change bi\r\n3，delete\r\n\r\n这个过程中，bi可能发送变化。可以考虑使用epoch等来发现这种问题。\r\n如果第二步失败，说明出现了冲突情况。 这是对于put操作可执行撤销。\r\n对于delete操作可直接取消操作。\r\n\r\ndelete也有问题，假设delete与put并发，最后执行的是delete，则put的版本可能就残留了。这时应该撤销delete操作。	2018-10-30 17:45:39.601636	f
446	107	Issue	5	知道什么是合适的是人的一个分界点\r\n理解何等规模的系统运作，看清事物本质是另一个分界点\r\n理解人性的善与恶，恶的强烈与善的坚韧\r\n看懂事物的发展变化是另一个分界点	2018-11-18 07:30:27.929936	f
450	175	Issue	5	研究双活模块，增加对cr的动态检测，如果是异常情况（没阻塞，但是就是不跑），同步rgw可异常退出。	2018-11-24 15:25:00.344906	f
452	175	Issue	5	日志上也可增强，输出当前执行的cr执行历史	2018-11-27 09:49:57.095586	f
460	182	Issue	6	课程列表\r\n第1课：全脑早教概述，掌握大脑的设计图\r\n第2课：拿到打开大脑的钥匙\r\n第3课：语言能力\r\n第4课：理解能力\r\n第5课：表达能力\r\n第6课：数学启蒙\r\n第7课：思考能力\r\n第8课：质疑能力\r\n第9课：情商能力\r\n第10课：社交能力\r\n第11课：自控力\r\n第12课：专注力\r\n第13课：记忆力\r\n第14课：计划力&整理能力\r\n第15课：感知力\r\n第16课：观察力\r\n第17课：想象力&创造力	2018-11-28 13:47:35.732125	f
462	183	Issue	5	前端增加判断，如果队列满，则accept请求，但是直接给客户端返错。\r\n\r\n改法：\r\n在dequeue超时的情况下，使用临时request先accept，然后直接fcgi finish。抛弃请求。	2018-11-28 14:30:57.129624	f
463	139	Issue	5	1，每个模块都需要人深入了解，每个特性设计都需要仔细review，每个bug都需要深入review和测试。\r\n否则，架构慢慢腐化，bug越来越深。\r\n\r\n2，自动化测试绝非可选项。兵马未动，粮草先行。自动化测试就是应该在开发之前进行规划的。\r\n\r\n3，review看什么？ 一方面软件的特性犹如一张网，看一滴水下去影响了哪些线。从架构上，从与其他特性的交织上，从dfx特性上，从代码实现上。各种层面去review。\r\n\r\n4，风险控制与运维报告	2018-12-01 08:05:28.292962	f
464	149	Issue	5	分层，去状态化。 微服务架构。	2018-12-01 09:37:12.600947	f
465	184	Issue	5	最近杀球明显好很多，杀球平一般是退的不够或挥拍太慢。\r\n前场准备时拍子应该提前准备好。\r\n手臂手腕放松，随时准备挥拍击球。\r\n\r\n姿势不标准，重心不稳则失误多。所以业余的速度跟专业的差很远。专业发力基本功好，打完一拍之后重心各方面调整好。\r\n不够放松则速度无法提升，容易失误。\r\n专业双打杀球好多不侧身的，杀完双脚是水平站位。	2018-12-01 16:23:08.153376	f
451	175	Issue	5	wait_for_child是主动调用的，可阻塞parent\r\ninterval_wait 就是协程睡眠了。\r\nsleep 是主动等待唤醒，比如生产者和消费者模型中，没事干时就会sleep。\r\n\r\nio block比较常见点，在wait或流控的时候都会使用该标记。\r\n\r\n断言：如果协程不在调度范围，那么其应该处于阻塞状态。\r\n\r\ncontext_stacks包含所有stack， scheduled-stacks包含所有可调度的stack。	2018-11-27 09:05:20.397049	f
422	171	Issue	5	http://tracker.ceph.com/issues/20861\r\n客户端调用多次multipart complete，具体为什么导致问题还得分析。\r\n\r\ngc在后端删除，必须确保rgw不会写入重复的对象。否则gc可能把覆盖写入的正常rados对象给删除了。\r\n\r\n还有断言multipart时，原始对象不存在或orig_size == 0显然是不合适的,multipart可能出现重试的情况，这时bi可能有重复的key。\r\n\r\n复现该问题：\r\n不对，错误需要注入在bi写失败上，这样在老版本才会把对象加入gc。\r\n\r\n注意以前版本如果发现完全一样的多版本对象，是会改变对象名字，重新写的。因而也不存在覆盖写的情况！！！！\r\n所以这块暂时无需调整，但是在析构函数中删除对象这块是需处理的。\r\n详细请参考RGWPutObj的重试代码	2018-11-16 15:57:06.768074	f
397	141	Issue	5	计划周一周二完成bug修复，周三可以check文档，过评审。	2018-11-05 07:00:11.50388	f
399	149	Issue	5	软件架构发展：CS BS SOA MSA \r\nhttps://gitbook.cn/books/5a8d689decd7eb74c19ba962/index.html\r\n\r\n<pre><code class="text">\r\n库是工具箱。\r\n\r\n框架是一套通用的解决方案。\r\n\r\n架构是高度抽象的需求，是系统中的不变量。\r\n\r\n平台是所有可能做的事的集合。\r\n</code></pre>\r\n	2018-11-06 18:47:28.698485	f
400	149	Issue	5	例如ceph rgw架构。\r\n\r\n数据处理是广义上的，不仅是处理图片等。还有比如查询某个前缀的对象个数。对象名包含某个字符的个数等。\r\n或者在某段时间内，某个bucket写入的对象个数等\r\n\r\n所以使用一个强大的DB是非常需要的。数据处理定义专门的rest接口。	2018-11-07 08:06:21.398655	f
401	149	Issue	5		2018-11-07 08:10:04.322823	f
402	149	Issue	5	软件架构需要对齐: 1,公司战略，软件的发展方向。 2，人力匹配\r\n架构有点没法一步到位，是逐步改进优化的。\r\n当然如果能思考清除未来5年趋势，你可以设计5年架构规划	2018-11-09 06:45:09.392476	f
405	148	Issue	6		2018-11-14 03:32:48.358539	f
415	157	Issue	5	任务1：完善规格限制，补充acl，user quota部分，同时可分享相关知识。	2018-11-14 09:36:30.859039	f
417	167	Issue	5	initiatives ：方案，倡议	2018-11-15 16:25:30.13536	f
419	169	Issue	5	https://linux.cn/article-9535-1.html  \r\n通过S3A支持hadoop大数据	2018-11-15 17:55:37.503554	f
421	171	Issue	5	在非分片上传大对象的时候，一个请求处理大量数据，可能每个rados请求没超过120s超时，但是请求整体超过600s，rgw挂掉\r\n\r\n应该reset timer。	2018-11-16 14:53:19.317292	f
423	172	Issue	6		2018-11-16 16:11:59.098537	f
424	146	Issue	6	美丽不是一件小事\r\n美丽是让所有人都见证你将自己的美好活出来的大事	2018-11-16 18:26:02.325876	f
454	178	Issue	6	【要点1】\r\n情绪脑vs理智脑--情绪脑也叫本能系统，它负责产生快乐、愤怒、恐惧等情绪，这一类情绪有助于我们回避危险、适应环境。\r\n理智脑是人类特有的大脑结构，主管理性思考、分析与控制。\r\n\r\n【要点2】\r\n负情绪vs内分泌--情绪会引起内分泌系统的相应变化，这里先讲负情绪对内分泌的影响。\r\n大量研究发现，如果负情绪不能及时平静下来，那么持续的负情绪就会造成内分泌系统产生与压力相关的荷尔蒙，而如果过多的压力荷尔蒙在大脑中停留时间过长，就会形成有害的大脑化学环境，影响大脑的健康发育。\r\n\r\n【要点3】\r\n正情绪vs负情绪--2015年哈佛大学儿童发展中心一份研究报告指出，健康的情绪管理，不是没有负情绪，而是在负情绪的同时，拥有平衡的、甚至更多的正情绪。\r\n因此，我们除了帮助孩子应对负情绪外，也需要重视不断加强正情绪。\r\n\r\n【要点4】\r\n1、养育着作为“外部调节器”，为孩子起到两个作用：\r\na.调节并减缓负情绪\r\nb.激发正情绪\r\n2、怎样发挥“外部调节器”功能？\r\n第一步，大人主动支持，主动提供有效的安慰。\r\n第二步，引导孩子认识情绪。\r\n第三步，通过理解还在的语言，帮助孩子引入理智脑。\r\n	2018-11-28 09:05:18.660977	f
509	4	Issue	5	通过lsof -i -a -p 命令查看，发现连接只剩单边的，rgw到nginx。\r\n\r\n另外一端已经关闭。\r\n问题：\r\n1，对端关闭的时候，read不会返回错误吗？\r\n2，对端关闭的情况下，本端为啥长时间不关闭？ 从netstat看也看到有数据需发送。send-q为空	2018-12-22 13:36:53.197008	f
444	171	Issue	5	http://tracker.ceph.com/issues/11749  这问题不可忽略，还是得解决。\r\n\r\n由于multipart通过对象名检查是否冲突的机制仍然存在，所以仍然需要后删除head对象，先删除其他对象。\r\ngc不会对该机制造成影响，因为gc的对象在没删除的时候，multipart仍然可检测到该对象。\r\n\r\n且采用gc机制该问题自然解决了，因为对象没有立即删除。不过最安全的还是后删除head。gc可后增加head对象。\r\n\r\n不过这机制真他妈复杂，软件中的统一模型，设计非常重要。 社区rgw已然腐烂。\r\n	2018-11-17 16:16:26.116705	f
447	173	Issue	5	合适的点怎么把握：良知？独立与互赖。	2018-11-18 07:35:26.533116	f
448	171	Issue	5	在写bi超时之后，可能出现这种现象，即对象的bi存在，但是数据体应该超时出错给gc掉了。\r\n以前失败只会是bi写冲突，现在还有超时，所以出现了对象大量残留。	2018-11-18 07:59:41.351286	f
449	4	Issue	5	测试方法，gdb卡住rgw一段时间，或在rgw处理中增加sleep，观察多久rgw能恢复。\r\n或者把队列搞的非常浅，tcp接收队列也搞的非常浅，观察在其满时的现象。	2018-11-22 08:44:06.759992	f
510	103	Issue	5	先从认知上理解事物，了解其本质和运转机理，为什么而存在等。\r\n\r\n其次采用分治方法，将复杂事物划分为各个部分，然后就是解决具体的每个问题了。	2018-12-23 20:55:38.635695	f
516	4	Issue	5		2018-12-24 18:56:13.202681	f
522	4	Issue	5	关于iptbales tcp-flag的解释https://serverfault.com/questions/375423/tcp-flags-in-iptables-whats-the-difference-between-rst-syn-and-rst-and-syn-rst\r\n\r\n--tcp-flag FIN,ACK FIN,ACK用于拦截FIN包	2018-12-25 17:42:23.47972	f
523	4	Issue	5	accept的socket是否会继承listen的socket，不一定，所以最好还是额外设置下	2018-12-26 08:49:33.004095	f
527	214	Issue	5	持戒护念，一日三省，以中庸之道，达至臻境界。依存有度，能看世间真情(情况的情)。\r\n	2018-12-28 06:59:39.731567	f
413	161	Issue	6	【要点1】自信与掌控感--自信是一种“我能行，我能客服阻力、做成我想做的事”的感觉，或者成为“掌控感”。孩子的健康成长不能缺少掌控感，掌控感是自信的基本要素。因此，要建立孩子的自信心，就要在日常生活中尽量保护孩子的掌控感\r\n\r\n【要点2】“抱”与“推”--在孩子退缩时先“抱一抱”他（肢体抚慰与言语安慰），让孩子知道我们会及时保护他，孩子确定自己是安全的，他才能主动探索外面的世界，并在内心逐渐形成自信心。\r\n\r\n【7个小游戏】\r\n# 情绪雕像-父母形容自己的内心从变弱到变强的过程，让孩子感同身受。\r\n# 超级力量-父母把自己的鼓励与支持化作孩子能听懂的语言，让孩子看到。\r\n# 一指禅-让孩子充分体验掌控感\r\n# 冲关夺宝-释放紧张情绪，让孩子找回掌控感（控制自己的情绪）\r\n# 宝宝抱抱-让孩子在开心的玩耍过程中通过控制大人，感受到自己的力量。\r\n# 人体播放器-孩子按哪里，父母就发出搞笑的声音，既增加亲密，又增加乐趣。\r\n# 斗牛-鼓励孩子充分展示自己的力量，并最终战胜大人。\r\n\r\n  	2018-11-14 04:29:42.073206	f
414	162	Issue	6	【要点1】孩子们的恐惧感来自于对现实事务的恐惧和想像中的恐。这些恐惧大多数是暂时的，随着年龄的成长会自然消失。\r\n\r\n【要点2】恐惧有益--恐惧或害怕，使我们每个人与身俱来的一项本能，是一项重要的生存保障。\r\n\r\n【要点3】可预期性--对于即将在孩子生活中出现的新事物，我们可以带孩子先去看一看，摸一摸，了解与认识，从不熟悉到慢慢熟悉。\r\n\r\n【要点4】支持性保护--父母一方面理解和接纳孩子的害怕情绪，以此来保护孩子的心里感受；另一方面，对于不得不经历的挑战，不完全逃避，找适合自己孩子的方式，一点点去适应。\r\n\r\n【5个小游戏】\r\n# 抓床下的鳄鱼--带着孩子把想象中的恐惧“外化”并“具体化”，用重视的态度、轻松的游戏，化解孩子内心的恐惧情绪。\r\n# “弟弟别怕，姐姐保护你”--角色互换，现实中“强大”的成人，在游戏里化身“弱小”的弟弟，化解孩子因为害怕而产生的羞愧感和无助感，也让孩子通过“保护弱小”的游戏心生新的勇气。作重要的是，大人滑稽的慌张动作，给孩子带来欢乐，让“害怕”变成好玩的事\r\n# 表情包-让容易精湛、敏感的还在得到充分的放松。\r\n# 压路机-增加亲子之间的亲密和信任，同时又增加一些小刺激的欢乐游戏。\r\n# 坦克大战--让孩子充分展现力量，在笑声中获得满满的成就感。\r\n\r\n\r\n\r\n\r\n\r\n	2018-11-14 04:42:47.378839	f
416	164	Issue	5	同时使用ACL、Bucket Policy\r\n如果ACL和Bucket Policy同时使用， 则ACL对某个账户的授权结果allow，可以被Bucket Policy的显示 Deny覆盖。\r\n\r\n如果Bucket Policy和IAM Policy同时使用，同样遵循explicit deny>allow>default deny的规则。\r\n\r\n\r\nacl不支持 explicit deny，acl只能配置允许访问，不能显示的拒绝访问。\r\npolicy支持	2018-11-14 12:15:12.036927	f
418	168	Issue	5	<pre>\r\nFusionStorage，9000 和UDS的区别\r\nfusionstorage设计是面对云数据中心未来的存储服务而设计的，他有几个要点:\r\n1,    适配云化环境，有良好的扩展伸缩能力\r\n2， 适配未来云化环境下的自动资源分发以及资源管理需求。\r\n3， 由于企业的云数据中心主要承载企业业务，因此对性能时延也有一定的要求，所以fusionstorage设计采用了支持IB组网，支持SSD cache加速等提高性能的设计。\r\n4， 数据需要有强一致性，任何时刻的数据必须保证一致性以及可靠性。（为了性能fusionstorage采用多副本跨界点分布等方式来保证数据可靠性）UDS的设计是面对对象存储的需求，他的特点就是要求容量非常大，价格低，高并发，但是时延要求不高（基于互联网传输），最后他要直面个人用户而不仅仅是企业用户，所以并发量非常大。\r\nOceanStor 9000的目标是面对高性能计算，大吞吐量的数据处理，大数据处理等企业存储需求。\r\n</pre>	2018-11-15 16:51:42.215688	f
420	171	Issue	5	显然通过挂掉服务的方式来检查死锁或避免过载都是不合适的。\r\nrgw应该要有过载保护。	2018-11-16 14:52:37.195359	f
425	146	Issue	6	美好的形象不仅仅是美丽那么简单，\r\n它需要对自己的热爱和欣赏，\r\n它需要融合你的过去、现在和梦想，\r\n它需要心灵的纯净和心态的从容，\r\n还需要品味的提升和修养，\r\n它是身心灵的和谐，\r\n它是表达出最美好的你自己......	2018-11-16 18:29:23.832502	f
429	146	Issue	6	胡冬寅十月读书（15-20）\r\n\r\n书名：《成就最美好的自己》\r\n\r\n  摘录（请让我知道一个真实的你-气质定位）：\r\n气质定位就是让见到你的人能够清晰地接收到由你自己散发出来的、关于你是一个怎样的人的美好信息，这个信息的传递既适合你要见到的人，也适合你自己的表达能力，它会让你自在而又自信，并且激发见到你的人对你的尊敬和喜爱。所以，气质定位里有对不同场景的定位描述，但他们都是你-真实而又美好的你，一个最好的你！\r\n做一个有气质的人需要-真实、有美感、表里如一、在家在外如一。气质绝非面具，是从里到外散发出来的韵致。\r\n气质不是一蹴而就的，有气质的人能够自省，对自己有要求才有进步，一生都不放松。\r\n\r\n感悟心得：做到有气质，不是为了达到某种目的而展现出来的姿态，需要接受自己真实的模样，并对自己有要求，不断进步，深入灵魂。	2018-11-16 21:09:00.821766	f
426	146	Issue	6	胡冬寅十月读书（1-7）\r\n\r\n书名：《成就最美好的自己》\r\n\r\n  摘录1：玛亚对美的理解极其深刻，她能够透视美在个人身上的存在，她懂得找寻个人的美，并且将那久被遗忘、躲在角落的美引发出来。\r\n\r\n感悟心得1：以前的自己因着藏在心底的自卑，觉得自己不美，麦姐和Joy便是将我那久被遗忘、躲在角落的美引发出来的人，让我切身感受到自己美好的样子，也让我对美有了不同于以前的理解。每个人都是独特的，都有着自己最美好的状态，当我们对待美的理解变化了，也就能够更好的发现自己、接纳自己。\r\n\r\n  摘录2（写在前面的话）：美丽不是一件小事，美丽是让所有人都见证你将自己的美好活出来的大事。我们的形象，以及我们对待自己形象的态度真的就是我们人生的写照。什么是优雅？优雅是打不败的状态，是随时随地都能持守的美好。一个最好的你，看起来应该是在所有场合都衣着举止得体，都是被尊重、被喜爱的！\r\n\r\n感悟心得2：认真的对待自己的形象，衣着举止得体，展现出随时随地都能持守的美好，将自己的美好活出来，这是我正在乃至终身需要去修炼的功课。	2018-11-16 18:30:19.319994	f
485	199	Issue	5	培养兴趣的起初可能是通过 好奇心，成就感，价值认同等方式来的。\r\n随着不断的深入，可能慢慢不需要别人的鼓励与肯定了，自己逐步窥探其中门径，逐步体会领域，创新变化的乐趣。	2018-12-05 07:57:41.261328	f
513	4	Issue	5	https://blog.csdn.net/dog250/article/details/81697403\r\n\r\n这篇文章讲述了可能一段处于fin-wait-1，另一端establish的情况。tcp假连接。	2018-12-24 18:53:17.005106	f
428	146	Issue	6	书名：《成就最美好的自己》\r\n\r\n  摘录（请让我知道一个真实的你-风格测试）：\r\n人人都想拥有自己独特的风格，风格由你的身、心组成，只是隐而未现，你不能发现，是因为你对自己的了解、接受、表达都还不足够。\r\n打开自己的心扉，坦言自己喜欢的一切以及惧怕的一切，因为你的风格一定是丰富的组合，而不是单一、一成不变的单调形象。你会发现一个新的我，一个完整的自我。没有自我的人，不会有风格。梳理内心是形象设计的第一步。\r\n要记住，寻找自我风格是为了自身的建设和完整，不是为了虚荣。你将得到的风格是属于你个人的，自在的，你才能驾驭的游刃有余。\r\n\r\n感悟心得：\r\n寻找风格是一个寻找自我的过程，观察自己的事业、生活、婚姻、学习成长，感知自己的快乐、痛苦、幸福等情绪，梳理自己的内心，了解原本的自己以及自我的需求，坦然接纳真实的自我，进而会更加有力量去进行自身的建设和完善，展现出独一无二的自己。	2018-11-16 21:08:22.456587	f
431	146	Issue	6	胡冬寅十月读书（33-48）\r\n\r\n书名：《成就最美好的自己》\r\n\r\n  摘录（体型-无论你是纤、婷端、端、盈，都应学会欣赏自己）：\r\n  我发现她冷暖两色都可以驾驭，她喜欢穿黑白两色相间的几何图案的裙子，典型的冬季型，使她看起来很power，很利落清洁，与她的直短发相得益彰，也将她的知性衬托的很到位；但是，她也穿大地色的服饰，她穿起典型秋季型咖啡色的卡丁衫来，显得特别温柔、文雅......我明白这些都是因为她有发自内心的爱和喜乐。她的身心都散发着人们称之为自信的气质，使她的言行举止充满了得体的悠然，也使她的体形和丰盈的内心浑然一体，成为一种美妙的承载。我清楚，那并非一般人认为的自信，因为自信的焦点还是在自己身上，但是信心是一种更大的恩赐。\r\n  感恩、爱、不嫉妒、喜乐，这就是你必须学习操练具备的。不论是谁，只要你爱美、希望自己美，它们会组成你美丽的信心。\r\n\r\n感悟心得：不论自己的体形是纤、婷、端、盈，我们都必须学习感恩、爱、不嫉妒、喜乐，不断操练，最终具备，成长为一个拥有信心的美丽女人。	2018-11-16 21:10:06.410132	f
430	146	Issue	6	胡冬寅十月读书（21-32）\r\n\r\n书名：《成就最美好的自己》\r\n\r\n  摘录（体型-无论你是纤、婷端、端、盈，都应学会欣赏自己）：\r\n《风中的杰奎琳》是一副摄影名作，我深深地照片中的杰奎琳吸引。吸引我的是她在不经意的回首中那份信心，她挺拔的身姿和摆动的胳膊出奇地美丽，尽管胸部小的像个刚发育的孩子，却充满了独特的性感，这性感源于对生命的接受和欣赏......倘若还存留一丝自己造的厌憎和不满，就无法拥有这份美丽。\r\n女人，尽管都爱美，但少有人能够为自己的生命感恩，这个起点的缺乏，会使她们一生对美的追求都有偏离。\r\n\r\n感悟心得：魅力的完全绽放，需要自我接纳，心怀感恩；当我学会欣赏自己原本的样子，不再与自己为敌，油然而生一种自在而又舒坦的感觉，这便是生命的奇妙，学会欣赏，美就在心中生根发芽，终有一天长成大树。	2018-11-16 21:09:29.772045	f
432	146	Issue	6	胡冬寅十月读书（49-62）\r\n\r\n书名：《成就最美好的自己》\r\n\r\n  摘录（色彩-你能驾驭的颜色比你知道的还多）：       \r\n  颜色与人的关系绝不只是与肤色合适与否的问题，颜色与人的真正关系是内心、性格和气质的关系。\r\n  颜色会因为性情、年龄、环境、事由、时间段、款式、材质、使用部位等不同而改变它与人之间的关系，将这些考虑进去后，你会发现你以为不能用的颜色原来可以如此好看，你的选择原来可以如此广阔而又微妙。。。\r\n\r\n感悟心得：了解自我的色彩是为了更好的运用色彩，而不是为了把自己框定在一个既定的范围，当我们深层次理解色彩与人的关系，颜色也可以丰富在我们身上进行表达，而不在是限制。	2018-11-16 21:11:11.848944	f
433	146	Issue	6	胡冬寅十月读书（63-68））\r\n\r\n书名：《成就最美好的自己》\r\n\r\n  摘录（妆容-护肤：一堂专属于你的皮肤保养课）：\r\n  肤色，均匀光洁很重要，学会护养，学会真正实用的个人化妆术，是很享受很快乐的事，也是女性的一种修养，它能培养你从容细致的女性特质。\r\n  很多人问我有没有最简便的、最省时间的皮肤保养方法？我说：没有！世界上从来没有一样美好的事物是无需付出代价的。美丽属于愿意为美丽付出代价的女人，这代价中最重要的就是时间，因为这象征着坚持，坚持才能持守终身的美丽。     \r\n\r\n感悟心得：护肤，贵在坚持，就像吃饭刷牙一样，需要内化成为一种习惯，然而这种习惯的养成并不容易，需要投入时间和精力，我们一旦坚持，时间会将最好的结果回馈给我们。	2018-11-16 21:11:48.083867	f
434	146	Issue	6	胡冬寅十月读书（69-74）\r\n\r\n书名：《成就最美好的自己》\r\n\r\n  摘录（妆容-美妆：把修养和信心描画在脸上）：\r\n  一张化过妆的脸，给自己和给他人的感觉都会更加安心。你只要试过就会明白那种安心的感觉，你不必为自己脸上的任何瑕疵担忧他人的看法，观者也不必为你脸上裸呈的瑕疵付出怜悯、安慰的义务。你的妆容甚至代表你的涵养，代表你将自己的隐私管理得当。\r\n\r\n感悟心得:精致的妆容如同干净整洁的房间带给我的感觉，会让我安心自在。每天为自己画个精致的妆，心情愉悦的拥抱生活和工作！	2018-11-16 21:12:19.533979	f
435	146	Issue	6	胡冬寅十月读书（75-84）\r\n\r\n书名：《成就最美好的自己》\r\n\r\n  摘录（管理你的衣橱-整理衣橱前先要明白的事情）：\r\n衣橱整理可以发现一个人在犯些什么错误，错误就是你购买收藏了多少不适合自己的衣物，你保留了多少已经无法穿着旧物，当然其中也包括“新的旧衣服”\r\n不穿的衣服是每个女人都要付出的学费，这笔学费付过之后，才能获得有魅力的、有生命力的衣橱。\r\n衣橱整理，是一个祝福，是帮助你结束不该再犯的错误，并且找回原本就该属于你的美丽。\r\n如果你想买一件便宜衣服，它必须看起来很贵。如果你想买一件很贵的衣服，它必须物有所值。\r\n\r\n\r\n感悟心得：衣橱就如我们的身体，当觉得那里出了问题时，需要给衣橱来个专业的诊断，找对病症，对症下药的去“医治”，结束我们曾经犯错误的方式，然后一点点的去建设属于我们怦然心动的衣橱。	2018-11-16 21:13:27.570433	f
436	146	Issue	6	胡冬寅十一月读书（85-91）\r\n\r\n书名：《成就最美好的自己》\r\n\r\n管理你的衣橱-衣橱里的经典收藏（经典款式：衣橱主干）\r\n\r\n  摘录：\r\n打开你的衣橱，你最需要的会是什么？是随手拿出来穿都不会出错的衣服。\r\n你是否拥有最适合你的衣橱主干，有一个最好的检验方法就是：第一，你的每种经典基本款完全可以互相搭配。第二，你的主干衣橱会使你出席任何场合时（不知道其他人怎么穿，不知道场面到底有多大）显得优雅得体，并且使你感到自在，还使得他人对你微笑。\r\n\r\n感悟心得：建立属于自己风格的衣橱主干，每个早晨都不再手忙脚乱，穿衣变成一件简单且高效的事情，那将是一种美好而幸福的体验	2018-11-16 21:14:14.809847	f
437	146	Issue	6	胡冬寅十一月读书（91-95）\r\n\r\n书名：《成就最美好的自己》\r\n\r\n管理你的衣橱-衣橱里的经典收藏（礼服和晚装：衣橱光芒）\r\n\r\n  摘录：\r\n当人们看到你的光芒时，不会有一丝想要模仿的意念，因为那就是你的，不可替代，唯有你能够驾驭！这才是该属于你的惊艳之作。\r\n最适合的颜色+最适合的特殊面料+最精到的裁剪+最具独特气质的风格语言=你的个人光芒\r\n\r\n感悟心得：找到属于自己的惊艳之作，散发出属于自己的光芒，嗯，一定能够有那么一件衣服在等着自己去发现，充满期待~	2018-11-16 21:14:46.096251	f
438	171	Issue	5	multipart不一样主要在于其操作分为多个且是客户端发起的，客户端可能发出完全重复请求。\r\n非multipart对象残留可以通过丢入gc的方式处理掉。但是multipart如果对象名完全一样，丢入gc处理不合适。\r\n\r\n在前端读取manifest，然后在rgw合并成一个manifest，这些都没原子性保护。	2018-11-17 07:49:35.332356	f
439	171	Issue	5	目前multipart中间的part是跟版本没关系的。只有最后完成时有版本号。支持重复执行，加上版本号看看。	2018-11-17 08:11:01.125596	f
440	171	Issue	5	multipart的分片head对象名字应该通过get_part函数获取，目前能正确，纯属巧合。	2018-11-17 08:37:45.633789	f
441	171	Issue	5	在两个地方注入测试：\r\n1，在put完成 wait_pending_front中测试，观察对象总数和rados对象是否残留\r\n2，在bi写入注入失败，看对象数量和rados对象是否残留	2018-11-17 13:47:57.329457	f
442	171	Issue	5	还发现一个问题：以前分片上传 分片第一个对象总是使用obj名称定位，这样总会定位到第一个对象？\r\n\r\n不对， index_hash_source就是给bs用的，其他对象就算赋值了也没关系，不会使用。	2018-11-17 15:06:32.78793	f
489	165	Issue	5	有些任务可以交由其他人来push完成。\r\n组织也许只有一个leader + 几个成员。但是有些任务可交给其他成员负责，否则所有事情一个人trace会力不从心。\r\n\r\n比如近期把培训任务交给天伟负责感觉就好很多。	2018-12-06 14:08:57.842512	f
455	172	Issue	6	【要点1】\r\n*分离焦虑在所难免。*分离焦虑始于一岁左右，但在幼儿园阶段表现的尤为明显，因为幼儿园期间孩子第一次真正走出家庭、步入新环境，我们也希望孩子能够顺利地度过这个阶段。\r\n*没有任何养育方法能让孩子的亲子分离过程轻松简单。*\r\n因此我们要正确预测到：还在在跟我们分别的时候，一定会大哭；面对孩子大哭的时候，我们自己也很可能产生负情绪，如烦躁（这孩子怎么这么不懂事，跟你说了妈妈一会儿就回来）或者内疚（宝宝好可怜，妈妈对不起你）。\r\n*我们要想帮助孩子，那么首先要处理好自己内心的情绪。*\r\n\r\n【要点2】\r\n*虽有分离，亦有重逢。*要想帮孩子适应分离，就必须让孩子在完整的过程中获得完整的体验：完整的过程是既有分离又有重逢，那么相应的完整体验就是分离是的难过，和重逢时的快乐。\r\n*因此，我们不能只关注如何跟孩子分离，还必须话心思、花精力来跟孩子快乐重逢。*\r\n\r\n【要点3】\r\n*重逢时，重联结与掌控感--重点来谈幼儿园阶段孩子的“藏猫猫”游戏。*\r\n很多专业人士认为，藏猫猫游戏中所包含的元素，跟“分离与重逢”的生活主题直接相关。孩子藏猫猫的过程中，其实一遍又一遍地体验“我藏起来了，爸爸妈妈找不到我；我出来了，爸爸妈妈找到我了”这样的过程。\r\n这个游戏不仅直接涉及到“分离与重逢”这个重要主题，而且孩子是具备掌控力的乙方--在这个游戏中，由孩子控制“分离与重逢”的节奏。这对于孩子获得心理平衡由着重要的意义。\r\n\r\n	2018-11-28 09:29:24.69731	f
456	178	Issue	6		2018-11-28 11:15:34.680677	f
457	148	Issue	6		2018-11-28 11:16:08.420295	f
458	161	Issue	6		2018-11-28 11:16:46.404963	f
459	162	Issue	6		2018-11-28 11:32:13.751752	f
461	182	Issue	6	左右脑\r\n左脑：严谨的老学究\r\n\r\n全脑启蒙要点之一：\r\n先对右脑“投其所好”，在引导孩子使用左脑	2018-11-28 14:26:16.408737	f
470	149	Issue	5	zone元数据实际上只与同步rgw有关系。可以分离出来。	2018-12-01 18:58:27.37356	f
472	149	Issue	5	架构有点不得不考虑的是随着云化的不断增强，新的软件产品可能是云平台的一部分。\r\n软件厂商应该可以快速的接入到云平台。以利用平台统一的管理和运维。	2018-12-01 19:19:23.621843	f
473	185	Issue	5	1，力都是从脚到核心，到肩部，大臂，小臂，手。以及连接关节。\r\n2，如果需要最大的挥速，最好把每部分都加速起来。当一节完成加速时，其他节都是放松的。但是能借到速度，击打完球后即可收回，发力高效干净利落。不要过度发力，发力距离也不必过长。过度发力通常意味着不够放松，不放松加速效果必然不好。\r\n3，击球点，每次都应该是差不多的。\r\n4，显然不起跳的高远球侧身也不必那么多，不然不是扭腿么。需要侧身的球通常都是要起跳的，整个身体有一个扭转。	2018-12-02 12:50:25.109504	f
475	165	Issue	5	任务管理，还有重要方面就是工作遗漏，比如要出版本了，再去执行社区bugfix同步显然是不合适的。\r\n	2018-12-03 07:10:15.340783	f
488	200	Issue	5	一个zone对应一个集群？\r\n不是这样的，zone的概念是区域，一个区域理论上可以有多个集群。\r\n\r\n但是rgw的placement对应的是pool。必然与集群耦合。\r\n这中间少了一层集群。\r\n\r\n在rgw的配置项中，应该有个列表，zone名称，对应的集群列表。\r\n\r\nzonegroup是一组有同步关系的zone，不同zonegroup没同步关系。\r\n\r\n\r\n公有云一般试用方式是选择区域。但是区域内怎么部署上层不感知。\r\n\r\n在multisite设计中每个rgw角色对等的，所以社区定义zone概念就是rgw instance的集合。但是我们实际用的时候是分离的，zone的信息中只看到了同步rgw。\r\n\r\n按照当前的思路走下去，业务根本不必感知zone，业务rgw与zone关联变弱。\r\n那么如何支持将bucket创建在指定zone呢？\r\n\r\nzone元数据同步这块能够改进？\r\n是否搞成同步执行模式，在同步rgw挂掉的时候，找到master先完成元数据同步？\r\n\r\n长期来看，必须支持自己的sdk，我们可以保持与s3兼容，但是有些地方可能不得不扩展。比如像区域定义这些。私有云客户如何灵活使用多站点？\r\n\r\n支持单个对象的存储类型，Amazon如何控制单个对象的存储类型？\r\n\r\n我目前感觉，如果不充分熟悉s3，并结合我们产品的最终形态考量。\r\n仅仅是剥离librgw的接口抽象这工作将难以进行。\r\n对象存储的概念都是来源于s3，设计上无法脱离。\r\n\r\n其实我们的目标是剥离出强依赖librados的部分作为librgw。\r\n在切换版本之后，我们仍然可以工作，而且只需编译rgw相关部分。\r\n可独立出包。\r\n\r\n抽离rgw与rados强关联部分为librgw_rados，使得在切换rados版本时，只需升级librgw_rados即可。librgw_rados模块由rados引擎组统一维护.\r\n\r\nrgw可考虑使用静态编译，编成独立程序。\r\n现在比较难搞的是cls这块，只有切换DB，重新设计rgw元数据才好解决。	2018-12-06 12:25:44.099952	f
480	197	Issue	5	做精品，需要有切入点，这切入点通常是技术变革，新的论文，新的技术推出的时候。这时创业公司存在机会从一点很强做到单品很强。\r\n\r\n做生态必须得有内容，有数据，否则不具备粘性。像亚马逊，阿里和腾讯是生态的杰出代表。 百度从形态上还是一个单品。苹果是那极端的例子，苹果是生态和产品一手抓的。\r\n\r\n巨大的变革，指数级别的增长，新生的生态，燃爆的技术点。是这个时代的明星。\r\n\r\n\r\n	2018-12-04 13:09:59.443697	f
482	198	Issue	5	例子：\r\n目标机器：目标-计划-执行-优化\r\n堆积知识：一个知识点，一个问题，一步一步走下去。\r\n软件稳定的方法：不断补充的自动化测试	2018-12-04 13:16:31.891795	f
479	186	Issue	5	技术竞争力\r\n1，难点技术\r\n\r\n多数据中心\r\n海量小文件\r\nbucket支持海量数据\r\n无感扩容\r\n数据检索\r\n\r\n2，交付能力\r\n架构松耦合具备良好扩展性，快速集成能力\r\n自动化测试覆盖，软件版本快速稳定\r\n\r\n3，基础能力\r\n存储基本功能\r\n性能提升（升级rados）\r\n\r\n4，差异化定位\r\n  定位市场，出于对市场差异的认知，确定产品差异技术点.比如华为手机定位的变化。\r\n  \r\n5，进入门槛\r\n  进入门槛一方面是资质类的，另一些是由于先入完成了圈地导致的。\r\n  先入企业掌握了数据，引导了用户认知，导致其他对手难以进入。不过2B产品在这面与2C产品可能不太一样。	2018-12-04 12:45:51.382752	f
483	186	Issue	5	国毅提出的想法是做行业生态，结合上游企业，做行业解决方案。	2018-12-04 15:46:47.828873	f
484	186	Issue	5	最终结果可能是大而不强，技术平平。\r\n\r\n公司策略如果是通过业务扩展来获取融资，与通过技术创新获取融资是不一样的。\r\n从目前情况来看我们可能难以在技术创新上得以发展，最终业务玩的好可能就是宏杉的情况。\r\n了解宏杉和深信服，如果没有革新，也许他们就是我们的未来。	2018-12-04 15:47:13.851809	f
486	199	Issue	5	羽毛球我喜欢研究发力，但羽毛球还有很多其他方面，装备，场地，赛事，人物，技术流派，策略等。\r\n软件我喜欢研究架构，但是软件还有开发，测试，语言，平台，工程，项目管理，产品，行业等等。\r\n\r\n想成专业人士，那就不仅是看电影精彩的部分，还得搞清拍摄过程各种细节。\r\n\r\n每个环节其实都可以很有趣，不要限制自己于固定环节。	2018-12-05 08:29:01.942178	f
487	149	Issue	5	*架构设计需要有整体格局* 不能搞盲人摸象式的设计	2018-12-06 11:39:30.034726	f
490	195	Issue	5	rgw committer要求：\r\n1，责任心和认真细致的精神\r\n2，掌握rgw大部分模块原理及实现\r\n3，设计并实现至少一个rgw重要功能\r\n4，掌握公司编程规范\r\n5，掌握提交要求(涉及文档，提交规范，测试规范等)	2018-12-06 14:13:20.516925	f
491	207	Issue	5	第一点的补充：虽然前中场发力可能没手臂打开的过程，但是最终效果手臂还是打开的。所以挥拍举拍的空间仍然要有。\r\n保持身体的平衡。	2018-12-08 21:02:49.649326	f
494	209	Issue	5	在objecter增加注入测试，验证watch/notify超时情况下。最终rgw是否能够更新period。\r\n观察是否reload	2018-12-13 14:43:38.509542	f
498	4	Issue	5	请求在nginx未阻塞，如何证明？\r\n\r\ncurl请求在100多s之后仍然能结束，返回502错误。\r\n重启nginx，超时现象仍然不会消失。\r\n看来唯有重启rgw才能拯救了。\r\n\r\nnginx停了一个晚上 rgw都没恢复。\r\n\r\n从2个角度分析问题：\r\n1，read系统调用什么情况下会一直卡住\r\n2，从网络协议上排查是否存在这种可能性	2018-12-17 16:19:37.120649	f
514	4	Issue	5		2018-12-24 18:55:30.844873	f
515	4	Issue	5		2018-12-24 18:55:48.71135	f
466	184	Issue	5	移动三要素：\r\n1，启动步\r\n2，节奏，前场步伐快，杀球回动快，高远回动慢等，要有这种节奏意识。\r\n3，步伐搭配，第一步小，最后一步大。利用击球力量来回动，反弹第一步。\r\n\r\n手上功夫：\r\n1，松握紧打\r\n2，长甩短抖\r\n       逐节发力，其实大臂用不了多少力。大臂运动到位，小臂手腕甩起来。\r\n3，正侧反背\r\n4，肘在上方\r\n体会甩，啪啪的感觉。\r\n5，慢甩试试\r\n\r\n反手功夫：\r\n转换握拍\r\n侧身\r\n迅速回动\r\n抬肘\r\n\r\n节奏：\r\n高远慢回，杀球和网前快速准备\r\n对方出球，我发小跳启动\r\n借势回第一步。\r\n预判球线路，在自己步伐最快到达的地方击球\r\n\r\n有了启动步和侧身，步伐明显上升一个层次。打球有了一种节奏感。\r\n\r\n策略\r\n\r\n新问题：\r\n挥拍太慢，有些球来不及打。导致不流畅。错过最佳击球点。身前球有时候举拍太慢\r\n步伐上接靠边杀球要用跨步，拍子伸直了打。\r\n羽毛球就是玩节奏，步伐手法与球速的完美匹配，移动到合适的地方，协调的完成击球。\r\n\r\n有时候步伐沉重不是步伐问题，是身体疲惫，无法调动状态。\r\n\r\n挥拍过程中肩膀和手都是刚性的，蹬地加速收腹加速肩膀，光这个速度算上球拍应该足以把球打到中场。这时小臂还是折叠状态，此时打开小臂进一步加速，最后握紧完成传递。\r\n\r\n问题：引拍的目的是为了加大进程，让拍在大臂固定时有一个速度，很简单你不引拍试下球拍加速不起来，实际击球点在上方夹角80左右。\r\n\r\n问题2:你试下不蹬地，跳不起来。如果你只用小腿，一会就累的不行。步伐的发力主要在髋部和核心力量上。	2018-12-01 16:23:34.693671	f
467	184	Issue	5	高远和杀球本周终于有点感觉了，放松手腕。不必提前太多引拍，否则中间得减速。小臂内旋，手腕抓紧。杀球与高远类似，因为击球点不一样，手臂打直的点不一样，杀球更靠前，所以杀球的引拍可以比高远小点\r\n\r\n羽毛球发力的核心就是松紧松，想像整个人都舒展，手臂完全放松，加速击球瞬间紧，然后又松的过程，简直爽爆了。\r\n\r\n整个手臂放松\r\n不同的角度打开手臂\r\n回环引拍\r\n狂练吧\r\n\r\n所有球的击球都是干净利落的，准备姿势是协调动作的，击球瞬间停顿，也就是闪腕，可以让球出去速度很快且不容易出界，短促击球初速度快且没有加速度。\r\n\r\n抖腕闪腕并非指手腕发力，手腕是放松的，实际是大臂小臂拉动手腕，手指抓紧的过程。\r\n\r\n回环引拍是一个过程，不要先引到一半，尤其是平抽挡，先拉好则击球方向已经确定。\r\n\r\n	2018-12-01 16:23:47.620071	f
468	184	Issue	5	反手拇指顶压力不够，可能是展腕练习太少，手指无力。\r\n曲指发力和拳握是一回事吗？感受拍面形变是什么感觉\r\n\r\n反手的核心在于手臂是展开运动，想借助手臂力量，则手臂运动方向要注意。与正手一样，正手手臂不升值则力量来源于小臂旋转和抖腕的力量。在击球瞬间手臂是完全打开的。\r\n\r\n手臂是垂直打开的，不是水平运动\r\n\r\n准备姿势重心在双脚，注意准备握拍总是在同一高度，在转身架拍或下蹲架拍时，基本不用调整则拍就在正确位置。\r\n\r\n如何好球都是良好架拍开始的，架拍合适了说明步伐到位了，并且完成了全身的发力的准备。没有步伐就没有发力就是这个道理。为什么状态不好，腿跑不动时必然球打不好就是这道理。\r\n\r\n架拍除了高远的侧身，反手的转身，还有前场的弓箭步，中场的下蹲等。看别人打球看的是什么，是因果。\r\n\r\n发力总是大端带动小端，但是技术难点在小端。在甩动的最后环节，甩到位之后停住，小端要握紧屏住。发力时全身的平衡也非常重要。\r\n\r\n高远击球瞬间除了内旋还有手腕外展，变成拳握，以便更好的握紧球拍发力以及收拍，看林丹，傅海峰等杀球慢动作便知。\r\n\r\n还有网前球正反手统一使用斜面握拍更好发力。其实每个点击球握拍都有点区别，反手上方网前大拇指顶宽面好发力。但是侧面和下方顶宽面不好发力\r\n\r\n发力细节的掌握，其他就是练了。\r\n\r\n宁可打不到球，也要按标准做动作，这点非常重要，不要总是用错误方式弥补前面的错误。\r\n	2018-12-01 16:24:03.5366	f
469	149	Issue	5	将MOS产品分为业务类模块和接口类模块，业务类模块包括：RGW主业务模块，后端处理模块、同步处理模块、后处理模块。这几个模块仍使用J版本的框架进行编写、实现和编译。即将这几个模块作为一个独立的产品进行编译和打包。这样一来，变化最大的业务类模块可以后续一直独立在J版本的框架上独立发展，跟社区完全没有关系。 要达到这一目标，需要用第三方DB把目前用到的rados的cls模块给剥离出来，这个是最终的一道门槛。\r\n\r\n\r\n\r\n接口类模块，即librgw.so，这个动态库主要完成了RGW业务与RADOS之间进行交互逻辑的封装，它跟随社区版本进行升级。由于只提供了对接rados的处理，所以后续跟随社区rados升级是很容易的事情。该动态库需要跟引擎平台（引擎平台跟随ceph大版本升级）一起编译，是引擎平台的代码的一部分。librgw.so跟MOS业务类模块之间只通过头文件进行感知，通过动态链接的方式进行调用。	2018-12-01 18:55:10.908476	f
471	149	Issue	5	考虑点：\r\n1，有状态，无状态\r\n2，有cache，无cache\r\n3，CAP\r\n4，share nothing， share storage\r\n5，performance sensible	2018-12-01 19:02:49.985926	f
474	186	Issue	5	开发自测框架也要搞起来，另外软件内部的打桩测试，以及各种手段应该加入，确保所有出现的问题都可以使用用例覆盖。\r\n所有调用底层模块的函数都应该可以模拟。\r\n\r\n为什么自验证流于形式，难以全面？笨马战法。战略正确，有确切的方法不断前进。\r\n自验做不起来一个原因就是没有好的框架来做这个事。\r\n\r\n代码review做不起来，是因为分工，安排上存在问题。\r\n核心员工可留作开发核心特性，review方案和代码。\r\n中层员工完成中等特性设计，代码开发\r\n初级员工完成特性优化，bugfix等。\r\n	2018-12-02 14:13:50.936038	f
476	194	Issue	5	checklist：\r\n1，需求说明\r\n2，原理，模块设计\r\n3，使用文档\r\n4，规格\r\n5，命令参数\r\n6，review\r\n7，计划点，检查点，任务详细计划。	2018-12-03 12:38:14.918886	f
477	195	Issue	5	项目经理职责：\r\n1，跟踪项目任务，推动项目进展\r\n2，确定项目变更，确认各种是否合规，了解项目风险。	2018-12-03 12:45:34.835705	f
478	196	Issue	5	项目经理应该有个任务表，任务应该做到不遗漏，可跟踪可执行。\r\n1 根据目标列举所有任务\r\n\r\n2 完成任务分配，人与任务的匹配\r\n\r\n3 确定每个任务的执行标准，每个任务做完善\r\n软件开发每个环节的任务，需求分析，方案设计，代码开发，review，测试，文档等。\r\n不求面面俱到，但是每步做到位才是最快的方式。\r\n\r\n4 跟踪进度风险，时间，协调解决难题	2018-12-04 06:17:19.184877	f
481	129	Issue	5	建立测试用例，自动化测试，这一个笨方法。	2018-12-04 13:12:10.89551	f
564	214	Issue	5	看风云变幻，听潮起潮落。\r\n不同层次的人看到的世界不一样，大脑中运行的程序逻辑不一样。	2019-01-14 06:55:09.66683	f
492	208	Issue	5	2018-12-11 16:16:19.543752 7f5d32377700  5  reset timeout for put obj testobj5221\r\n2018-12-11 16:17:52.987317 7f5d32377700  1 throttle(objecter_ops 0x7f5dcbd95268) get throttle timeout\r\n2018-12-11 16:17:52.987499 7f5d32377700  0 ERROR: write_meta complete failed -110\r\n2018-12-11 16:17:52.987585 7f5d32377700  3 NOTE: put failed, add gc obj test3:testobj5221.G8IEZwyBlY6kIS42sbYcN2Tazj7-3hu\r\n\r\n2018-12-11 16:18:20.535090 7f5d32377700  3 req 1246:120.992756:s3:PUT /test3/testobj5221:put_obj:test3/testobj5221null :completing\r\n2018-12-11 16:18:20.535401 7f5d32377700  3 req 1246:120.993067:s3:PUT /test3/testobj5221:put_obj:test3/testobj5221null :op status=-110\r\n2018-12-11 16:18:20.535424 7f5d32377700  3 req 1246:120.993090:s3:PUT /test3/testobj5221:put_obj:test3/testobj5221null :http status=408\r\n2018-12-11 16:18:20.535453 7f5d32377700  2 ====== req done req=0x7f5c50ca01a0 obj=test3/testobj5221null op status=-110 op name=put_obj http_status=408 ======\r\n2018-12-11 16:18:20.535772 7f5d32377700  1 heartbeat_map reset_timeout 'RGWProcess::m_tp thread 0x7f5d32377700' had timed out after 120\r\n2018-12-11 16:18:20.535804 7f5d32377700  1 heartbeat_map reset_timeout 'RGWProcess::m_tp thread 0x7f5d32377700' had suicide timed out after 120\r\n\r\n\r\n#7  0x00007f5dde223ff5 in ceph::HeartbeatMap::_check (this=0x7f5dcbc4b160, h=0x7f5c68850040, who=0x7f5dde5e33ce "reset_timeout", now=1544516300) at common/HeartbeatMap.cc:86\r\n#8  0x00007f5dde2241f3 in ceph::HeartbeatMap::reset_timeout (this=0x7f5dcbc4b160, h=0x7f5c68850040, grace=60, suicide_grace=0) at common/HeartbeatMap.cc:96\r\n#9  0x00007f5dde3dd586 in ThreadPool::worker (this=0x7f5dcbc25070, wt=0x7f5da1037d60) at common/WorkQueue.cc:148\r\n\r\n在程序运行慢的时候仍然会出现。reset 超时之后，仍然有几步get state，修改bi等。\r\n	2018-12-11 15:39:03.556738	f
493	200	Issue	5	还有一个思路就是让rgw使用rados的c接口，rados不暴漏除接口之外的其他common类。\r\n社区版本rgw下面增加了service，这里也可关注下。\r\nrgw工程做相应调整。	2018-12-12 13:26:32.731375	f
495	4	Issue	5	Thread 683 (Thread 0x7f0622bfc700 (LWP 4889)):\r\n#0  0x00007f06625dd7fd in read () from /lib64/libpthread.so.0\r\n#1  0x00007f06629f5ba9 in OS_Read () from /var/lib/ceph/lib/libfcgi.so.0\r\n#2  0x00007f06629f4193 in ?? () from /var/lib/ceph/lib/libfcgi.so.0\r\n#3  0x00007f06629f4757 in FCGX_Accept_r () from /var/lib/ceph/lib/libfcgi.so.0\r\n#4  0x00007f066cfd6287 in RGWFCGXProcess::run (this=0x7f0652825a00) at rgw/rgw_fcgi_process.cc:110\r\n#5  0x00007f066cfe8dee in RGWProcessControlThread::entry (this=<optimized out>) at rgw/rgw_process.h:270\r\n#6  0x00007f06625d6e25 in start_thread () from /lib64/libpthread.so.0\r\n#7  0x00007f0661bdebad in clone () from /lib64/libc.so.6	2018-12-17 09:11:26.062187	f
496	4	Issue	5	[root@localhost ceph]# netstat -anp | grep 1233\r\ntcp      129      0 0.0.0.0:1233            0.0.0.0:*               LISTEN      4670/radosgw        \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55624         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55792         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56732         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56212         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56158         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56316         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56364         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56368         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55798         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56318         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55864         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56600         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56536         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56384         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55932         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55866         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55788         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56370         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55818         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55860         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55808         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55626         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56752         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55810         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55562         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56530         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55962         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55894         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55976         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56304         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56584         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55630         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55980         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56344         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56534         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56346         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56532         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56540         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56270         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55934         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55942         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55790         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55344         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55814         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55312         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56302         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55282         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55816         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55856         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55796         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55628         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56338         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56266         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56262         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55806         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55958         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56762         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56306         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55858         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56838         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55944         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56528         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56068         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56878         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56222         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55448         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56264         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55606         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55940         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56854         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56268         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55974         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:55634         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56836         SYN_RECV    -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:56586         SYN_RECV    -                   \r\ntcp        0   1265 127.0.0.1:55626         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0   1264 127.0.0.1:55980         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:56318         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55854         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56560         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp      921      0 127.0.0.1:1233          127.0.0.1:59726         CLOSE_WAIT  -                   \r\ntcp        0    920 127.0.0.1:56264         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp      921      0 127.0.0.1:1233          127.0.0.1:59714         CLOSE_WAIT  -                   \r\ntcp        0    913 127.0.0.1:54864         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    920 127.0.0.1:56838         127.0.0.1:1233          ESTABLISHED 45709/nginx: worker \r\ntcp        0   1264 127.0.0.1:56600         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56664         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56166         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    921 127.0.0.1:55346         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56356         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56676         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56650         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56170         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56354         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:55162         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56314         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:56854         127.0.0.1:1233          ESTABLISHED 45709/nginx: worker \r\ntcp        0   1265 127.0.0.1:55170         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56144         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp      921      0 127.0.0.1:1233          127.0.0.1:59708         CLOSE_WAIT  -                   \r\ntcp        0    921 127.0.0.1:55630         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp      921      0 127.0.0.1:1233          127.0.0.1:59712         CLOSE_WAIT  -                   \r\ntcp        0   1264 127.0.0.1:56836         127.0.0.1:1233          ESTABLISHED 45709/nginx: worker \r\ntcp      921      0 127.0.0.1:1233          127.0.0.1:60094         CLOSE_WAIT  -                   \r\ntcp        0      1 127.0.0.1:55800         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0    920 127.0.0.1:55810         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp     1265      0 127.0.0.1:1233          127.0.0.1:60148         CLOSE_WAIT  -                   \r\ntcp        0   1264 127.0.0.1:55974         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:56270         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56020         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp     1265      0 127.0.0.1:1233          127.0.0.1:60144         CLOSE_WAIT  -                   \r\ntcp        0    920 127.0.0.1:56384         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:55160         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56626         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56016         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56742         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56632         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55986         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55802         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56162         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56024         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    921 127.0.0.1:55342         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0   1264 127.0.0.1:56262         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:54858         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:55852         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:55836         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0    921 127.0.0.1:55236         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:55080         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56012         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    921 127.0.0.1:55098         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:55606         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56358         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56348         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    577 127.0.0.1:56316         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:55136         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56604         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:55816         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0      1 127.0.0.1:55824         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56782         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:55866         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0   1264 127.0.0.1:56752         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56146         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:56346         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:55268         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0   1264 127.0.0.1:56158         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0    920 127.0.0.1:55856         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0    920 127.0.0.1:56534         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0    600 127.0.0.1:54856         127.0.0.1:1233          ESTABLISHED 45699/nginx: worker \r\ntcp        0      1 127.0.0.1:56776         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55964         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56546         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:55858         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0    920 127.0.0.1:56212         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56352         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:55944         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56004         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56000         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56656         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:55976         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55848         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56616         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:55282         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56772         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56164         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:54928         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56738         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:54574         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    600 127.0.0.1:55894         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0    920 127.0.0.1:56732         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56662         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56362         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56640         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    921 127.0.0.1:54866         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:54576         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0   1264 127.0.0.1:55958         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0    921 127.0.0.1:54686         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0   1264 127.0.0.1:55940         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56602         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56734         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56360         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56636         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    921 127.0.0.1:55422         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56668         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56630         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56160         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56740         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55804         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:55992         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55846         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:55862         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56880         127.0.0.1:1233          SYN_SENT    45709/nginx: worker \r\ntcp        0   1264 127.0.0.1:55792         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0    920 127.0.0.1:56344         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp     1265      0 127.0.0.1:1233          127.0.0.1:60142         CLOSE_WAIT  -                   \r\ntcp        0      1 127.0.0.1:56008         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55998         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:56306         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56658         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56736         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:56370         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55828         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56142         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:56304         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56002         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:55790         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56778         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    921 127.0.0.1:55240         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56624         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56310         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56672         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:56364         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56748         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56646         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:55338         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:54684         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      0 127.0.0.1:1233          127.0.0.1:60190         ESTABLISHED 4670/radosgw        \r\ntcp        0      1 127.0.0.1:56638         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:56586         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0    577 127.0.0.1:55788         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    920 127.0.0.1:55864         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0      1 127.0.0.1:55996         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56312         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55832         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:55982         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:56532         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55838         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56674         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56654         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56014         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:55798         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0   1265 127.0.0.1:55300         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56018         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55990         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55840         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56784         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56350         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:55278         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp     1265      0 127.0.0.1:1233          127.0.0.1:59718         CLOSE_WAIT  -                   \r\ntcp        0      1 127.0.0.1:56148         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56168         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:55860         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp      921      0 127.0.0.1:1233          127.0.0.1:59514         CLOSE_WAIT  -                   \r\ntcp        0   1264 127.0.0.1:56762         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56542         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56620         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    921 127.0.0.1:55424         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    920 127.0.0.1:56530         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55842         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0   1265 127.0.0.1:55298         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0   1264 127.0.0.1:56302         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56642         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    921 127.0.0.1:55628         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:55960         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    913 127.0.0.1:55624         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56320         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55844         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56780         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    921 127.0.0.1:54932         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:55296         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56800         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    600 127.0.0.1:55096         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0   1264 127.0.0.1:56584         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56744         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp     1265      0 127.0.0.1:1233          127.0.0.1:60146         CLOSE_WAIT  -                   \r\ntcp        0      1 127.0.0.1:55820         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56610         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    600 127.0.0.1:56338         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56666         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:56540         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0    920 127.0.0.1:56266         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55984         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55834         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0   1265 127.0.0.1:54360         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    881 127.0.0.1:56068         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:55794         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56628         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:54976         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:55312         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:54930         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    920 127.0.0.1:55932         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0   1264 127.0.0.1:55942         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56612         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    921 127.0.0.1:55304         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56652         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:55808         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0   1264 127.0.0.1:56368         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56644         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    920 127.0.0.1:55796         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0    920 127.0.0.1:56268         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0    920 127.0.0.1:55934         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56606         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55850         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0   1264 127.0.0.1:56222         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0    921 127.0.0.1:55164         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp      921      0 127.0.0.1:1233          127.0.0.1:59710         CLOSE_WAIT  -                   \r\ntcp        0      1 127.0.0.1:56010         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55994         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56022         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55830         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp     1265      0 127.0.0.1:1233          127.0.0.1:59690         CLOSE_WAIT  -                   \r\ntcp        0   1265 127.0.0.1:54502         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    600 127.0.0.1:55334         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0   1265 127.0.0.1:55344         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0   1265 127.0.0.1:55448         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56308         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56678         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp     1265      0 127.0.0.1:1233          127.0.0.1:60072         CLOSE_WAIT  -                   \r\ntcp        0    921 127.0.0.1:55302         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:55526         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:55228         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0   1264 127.0.0.1:56536         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker \r\ntcp        0   1264 127.0.0.1:55814         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56026         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56648         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp     1265      0 127.0.0.1:1233          127.0.0.1:59944         CLOSE_WAIT  -                   \r\ntcp        0    881 127.0.0.1:55294         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56786         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55826         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56618         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0   1265 127.0.0.1:55562         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:55340         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56634         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp     1265      0 127.0.0.1:1233          127.0.0.1:59700         CLOSE_WAIT  -                   \r\ntcp        0    921 127.0.0.1:55238         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0   1265 127.0.0.1:55604         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56750         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56746         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56660         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp      921      0 127.0.0.1:1233          127.0.0.1:60092         CLOSE_WAIT  -                   \r\ntcp        0   1265 127.0.0.1:55634         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    921 127.0.0.1:55336         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0      1 127.0.0.1:56670         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56006         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56608         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56804         127.0.0.1:1233          SYN_SENT    45709/nginx: worker \r\ntcp        0      1 127.0.0.1:56774         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp      921      0 127.0.0.1:1233          127.0.0.1:59716         CLOSE_WAIT  -                   \r\ntcp        0   1264 127.0.0.1:55818         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56806         127.0.0.1:1233          SYN_SENT    45709/nginx: worker \r\ntcp        0      1 127.0.0.1:56802         127.0.0.1:1233          SYN_SENT    45709/nginx: worker \r\ntcp        0    577 127.0.0.1:56528         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    577 127.0.0.1:54830         127.0.0.1:1233          FIN_WAIT1   -                   \r\ntcp        0    920 127.0.0.1:55806         127.0.0.1:1233          ESTABLISHED 45716/nginx: worker \r\ntcp      921      0 127.0.0.1:1233          127.0.0.1:59354         CLOSE_WAIT  -                   \r\ntcp        0      1 127.0.0.1:56614         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55822         127.0.0.1:1233          SYN_SENT    45716/nginx: worker \r\ntcp        0      1 127.0.0.1:56562         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:56544         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp      913      0 127.0.0.1:1233          127.0.0.1:59698         CLOSE_WAIT  -                   \r\ntcp        0      1 127.0.0.1:55946         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0      1 127.0.0.1:55988         127.0.0.1:1233          SYN_SENT    45702/nginx: worker \r\ntcp        0    600 127.0.0.1:56878         127.0.0.1:1233          ESTABLISHED 45709/nginx: worker \r\ntcp        0    920 127.0.0.1:55962         127.0.0.1:1233          ESTABLISHED 45702/nginx: worker	2018-12-17 09:11:41.566922	f
497	4	Issue	5	nginx error log:\r\n\r\n2018/12/14 17:59:38 [error] 13641#0: *377504589 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 192.168.12.179, server: , request: "GET / HTTP/1.1", upstream: "fastcgi://127.0.0.1:1233", host: "192.168.12.179:8080"\r\n2018/12/14 18:01:03 [error] 13636#0: *377504641 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 192.168.12.179, server: , request: "GET / HTTP/1.1", upstream: "fastcgi://127.0.0.1:1233", host: "192.168.12.179:8080"\r\n2018/12/14 18:01:21 [error] 13634#0: *377504956 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 192.168.12.179, server: , request: "GET / HTTP/1.1", upstream: "fastcgi://127.0.0.1:1233", host: "192.168.12.179:8080"\r\n2018/12/14 18:02:47 [error] 13636#0: *377505330 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 192.168.12.179, server: , request: "GET / HTTP/1.1", upstream: "fastcgi://127.0.0.1:1233", host: "192.168.12.179:8080"\r\n2018/12/14 18:03:34 [error] 13631#0: *377505618 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 192.168.12.179, server: , request: "GET / HTTP/1.1", upstream: "fastcgi://127.0.0.1:1233", host: "192.168.12.179:8080"\r\n2018/12/14 18:04:33 [error] 13631#0: *377505936 recv() failed (104: Connection reset by peer) while reading response header from upstream, client: 192.168.12.179, server: , request: "GET / HTTP/1.1", upstream: "fastcgi://127.0.0.1:1233", host: "192.168.12.179:8080"\r\n	2018-12-17 11:56:57.632263	f
499	135	Issue	5	近线SAS和SATA默认cache都是打开的，按下面说法主要是很大的性能提升。\r\n\r\n\r\nRE: PERC 9 and 'disk cache policy'\r\nIf I use OpenManage to create a RAID6 virtual disk using the wizard in advanced mode the default for "Disk Cache Policy" is Enabled.\r\nThat sounds normal. As you noted previously, the default is to disable disk cache for SAS drives. The drive you are using is not a SAS drive, it is a Near Line SAS drive.\r\n\r\nEnabling or disabling disk cache on a SATA or near line SAS spindle drive can have very noticeable performance impacts due to the slow access times. The performance difference is not as noticeable on SAS drives which typically have much faster access times. SATA and near line SAS drives for our servers are usually 7200 RPM. Supported SAS drives are generally 10k RPM or faster.\r\n\r\nYou should notice a performance increase by enabling disk cache. You can make the determination whether or not the performance increase/decrease of enabling/disabling disk cache is worth increased/decreased risk to your data.\r\n\r\nThanks\r\n\r\nDaniel Mysinger\r\nDell EMC, Enterprise Engineer	2018-12-18 10:29:37.723471	f
500	135	Issue	5	NL-SAS是采用了SAS的磁盘接口和SATA的盘体的综合体。SAS是Serial Attach SCSI（串行SCSI），SATA是串行ATA。\r\n\r\nSAS 向下兼容SATA，SCSI硬盘一般在10Krpm 或15krpm ，而ATA硬盘在7.2Krpm 左右。最初的SAS 1.0标准提供了300MB/s，当前已经推出的SAS 2.0规范中，速度已经提高到了600MB/s.SAS被期望最终能够达到1200MB/S。	2018-12-18 10:32:43.196716	f
503	4	Issue	5	模拟测试很长时间才accept一次，队列虽然经常是满的，但是仍然有变化。最终还是会慢慢降下来	2018-12-18 14:23:31.845668	f
504	4	Issue	5		2018-12-18 18:19:58.728088	f
505	4	Issue	5	在正常的fcgi accept路径上不accept，增加sleep 1，会出现使用tmp句柄一直出于read状态的现象。且tcpdump现象与499出错时类似\r\n\r\n另外再做一个尝试，正常就用tmp来accept，看是否存在问题。\r\n	2018-12-18 19:52:32.829027	f
506	4	Issue	5	卡住并不一定因为队列满了，实际队列没满的时候也可能出现。\r\n而且一旦出现这种情况就会卡住，很难退出。\r\n\r\n尝试重复init，以及减少fcgi_finish_r都没用。\r\n\r\n问题并非必现，但是概率还是非常高的。\r\n\r\n下一步计划：编译fcgi来定位	2018-12-20 19:29:12.124248	f
507	211	Issue	5	目前MOS 数据管理系统设计中并非基于多站点，只能各自登陆站点，查看用户在一个zone内的使用情况	2018-12-21 07:17:33.338988	f
508	211	Issue	5	S3及各种存储功能\r\n多站点\r\n多故障域\r\n多版本\r\n异构存储\r\n数据检索\r\n数据处理\r\nQos	2018-12-21 07:21:47.742984	f
511	213	Issue	5		2018-12-23 21:06:41.435874	f
512	214	Issue	5	头条的视频还停留在分享阶段。观看效果以及分析方面都不深入。\r\n\r\n可以考虑做一款专业偏向的视频网站。或者武侠类VR游戏。	2018-12-23 21:48:45.029522	f
519	4	Issue	5	加大tcp连接队列来解决该问题可能不现实。\r\n\r\n这个问题的原因到底是：\r\n1，tcp连接丢在队列太长时间没处理(因为后端慢，那么需定位后端问题，这里可增加日志辅助定位)\r\n2，tcp连接没法成功处理，因为队列已满\r\n\r\n如果是2，那么加大队列可解决问题。如果是1则仍然有问题。\r\n这2种原因肯定是都有的，如果1没问题，那就不存在2.\r\n所以解决可以从2方面着手。\r\n\r\n明天按正常方案验证:\r\n1,正常接收请求，但是调整接收请求的速度使得可能让tcp队列满而hang， usleep(1)\r\n2，增大接收队列，观察是否可解决该问题。\r\n\r\n	2018-12-24 19:38:09.922472	f
520	4	Issue	5	Tcp keepalive设置：https://hengyunabc.github.io/why-we-need-heartbeat/	2018-12-25 07:07:34.511434	f
521	4	Issue	5		2018-12-25 12:38:46.63948	f
524	4	Issue	5	该问题最终通过设置tcp keepalive解决，但更好的办法应该是服务器在应用层有超时机制。	2018-12-27 11:28:01.597349	f
525	215	Issue	5		2018-12-27 11:51:58.270878	f
533	218	Issue	5	https://www.jianshu.com/p/cccfb481d548	2018-12-30 13:37:00.061026	f
538	149	Issue	5	架构还必须考虑的是版本变迁计划，升级，水平扩展。	2019-01-02 06:33:15.249773	f
542	215	Issue	5	能否考虑将现有的小文件合并运行于当前的pool，这样可保持兼容性。\r\n另外通过合并转移到其他pool，也可以解决扩容如何使用的问题。	2019-01-05 13:48:21.411691	f
529	216	Issue	5	估计要在v6版本了。此时框架也基本成型。rgw依赖三类接口，分别可用不同组件来实现。\r\n服务分离。除了三类接口外。\r\nrgw本身也需要分层：业务处理层， 存储中间层(封装gc如何在存储层实现，提供接口等)， 存储底层。 \r\n\r\n年初规划，年底放出测试。基本节奏。	2018-12-29 09:13:51.162003	f
544	224	Issue	5	多个人，犹如一个人一样。一台并行执行的机器。\r\n捅刀子是为了发现问题。\r\n坚持效率\r\n\r\n开哪些会？解决哪些问题？\r\n\r\n1，周例会\r\n对齐整体进展情况，每个人汇报工作。其他人给出评价，主要是捅刀子。\r\n\r\n2，晨会\r\n晨会一方面中期发现风险，尽早调整。一是方案上的风险，一是进度上的风险。\r\n另外临时出现的问题，以及idea的沟通\r\n\r\n3，技术探讨会\r\n\r\n讲究效率，如何讲究效率\r\n拒绝人生攻击\r\n维持持续的酸痛感。\r\n	2019-01-06 08:27:20.171971	f
545	225	Issue	5	我主要保留角色：\r\n2，3，6 \r\n\r\n1给梁\r\n4给廖\r\n5给黎忠\r\n\r\n因时间关系，我确实没他们做得好。	2019-01-06 20:46:11.316259	f
548	227	Issue	5	经常有听见下属抱怨上级：“你不信任我！你要是信任我就应该不要来管我，放手让我去干！把这事全交给我去干。。。。”\r\n\r\n　　其实，信和任是两个不同的词。信是相信，但任是委任。相信一个人但未必会委任一个人去做一件事。就像我们相信诸葛亮有非凡的才华，但不会委任他给你当开刀手术医生一样。\r\n\r\n　　同样，委任一个人一件事，也不能完全不顾不问的等待结果。那是非常错误的。作为领导的职责就是要确保事情有结果和部属有成长！分配工作后不闻不问是领导人的失职。检查工作进展，完善工作方法和信不信任没有关系。\r\n\r\n　　“用人不疑，疑人不用”是较低水平的管理方法，是种无奈！而“用人要疑，疑人要用”才是更高境界！	2019-01-06 21:38:53.99845	f
550	133	Issue	5	为什么有公交车，的士，高铁了。我们还要买私家车？ 私有云需做出高端和差异化。	2019-01-06 21:52:08.098759	f
552	224	Issue	5	周例会\r\n1，气氛不活跃，只是在同步信息。\r\n2，未来一周的任务安排\r\n3，同步项目信息，一些POC信息，公司信息\r\n4，周例会主持人机制，其他人发言太少\r\n5，写周报，了解其他组近期计划。没有统一任何跟踪\r\n6，周一下午开？开会之前刷新任务进度，利用好禅道工具\r\n7，没有紧迫感，项目延期，任务延期严重。\r\n8，周例会内容，哪些固定议题，哪些临时议题。提前发会议通知，确定议程。讨论小组之间任务，过下任务。\r\n9，会议结论没有按时发布。\r\n\r\n晨会：\r\n1，没定期召开。\r\n2，晨会没有充分暴露问题。---问题尽量通过更详细的设计来解决\r\n3，进度与问题两个方面的内容，有意识的捅刀子\r\n\r\n评审会：\r\n1，大方案TMG更早介入\r\n2，缺乏版本评审计划\r\n3，设计文档模板不是很好\r\n4，review人员需提前review，提出意见，意见需记录下来\r\n5，POC特性也要评审，也需慎重对待\r\n\r\n专题会：\r\n1，开得太少，没有识别出来关键问题，如何及时发起\r\n2，结论做的不够好，需要会议纪要	2019-01-07 14:16:43.349045	f
553	225	Issue	5	目前职责：\r\n1，项目整体管理\r\n2，架构看护以及改进\r\n3，重大bugfix\r\n4，人员招聘，培训	2019-01-08 08:24:21.868699	f
554	216	Issue	5	而且最好能提供+n操作，就是在原来的value上做运算，而不是只set value。\r\n	2019-01-08 08:38:23.406778	f
555	230	Issue	5	原则：\r\n1，能在rgw层实现的功能，不要在cls去实现。	2019-01-10 07:21:05.589848	f
558	216	Issue	5	基于通用key-value接口来实现元数据管理，并由此推演其他模块是否能正确运行。\r\n重写rgw代码：\r\n1，前端s3解析与执行模块。\r\n2，后端异步处理模块（实际执行的也是s3逻辑，gc等）\r\n   通用模型，可提供遍历，计算，处理，转移，删除等后端操作。但是只需遍历一次。\r\n\r\n3，双活同步管理模块\r\n   采用push模式，方便监控管理，简化代码逻辑。\r\n\r\n4，公共存储接口层\r\n   易于拓展，充分解耦。	2019-01-11 07:17:45.36892	f
561	232	Issue	5		2019-01-11 07:55:34.386879	f
539	215	Issue	5	pg预分裂导致pg creating过程变慢，在原故障域内创建大量pg的pool。可能导致集群大量请求卡住，无法使用。\r\nrgw metadata修改发给master执行，同步采用异步方式，并且OM没有等待所有节点同步完成。造成om对操作结果的误判。	2019-01-03 14:40:31.499451	f
565	215	Issue	5	store_marker也有缺陷，该cr被返回之后，实际执行的顺序是不确定的。可能导致rados存储的marker并非最新，但是内存里面又是最新的。\r\n把watch/notify关闭之后，也许对这里有帮助。	2019-01-15 07:44:21.215021	f
596	262	Issue	5	每个个体知识面要求都非常高。\r\n既要懂社交，管理，做事，还得会观察，甄别。\r\n\r\n很多人看不到因而无话可说，但是看得到的人可能都是话题。比如吃饭，聊文化，聊过往都是可以聊的，都可以了解一个人。	2019-02-12 10:33:14.487451	f
597	263	Issue	5	要理解中国企业管理，就得深入了解中国人。中国文化。\r\n文化是怎么形成的？ 	2019-02-12 14:16:35.226776	f
598	216	Issue	5		2019-02-15 09:41:30.39026	f
600	216	Issue	5	就算使用backfill方式仍然无法解决osd节点重启引起的io中断问题。只要一个bs对象在恢复，整体业务就被中断。	2019-02-15 09:45:51.508895	f
601	260	Issue	5	经阅读代码确定，在mon处理boot消息时，没有延迟osd up的机制。	2019-02-15 12:06:06.536701	f
540	122	Issue	5	分治，合理划分人和事。\r\n另外就是强力的trace，确保目标机器的作用。\r\n\r\n思考的广度，以及对于问题重要性的理解。	2019-01-04 09:40:25.773036	f
526	211	Issue	5	一个realm对应多个zonegroup，一个zonegroup对应多个zone\r\n一个zone对应一个集群，如果有多个集群，可使用多个zone。\r\n一个集群内有多个故障域，呈现出不同的pool。\r\nbucket物理上属于zone，归属上属于user。\r\nuser和bucket在zonegroup内唯一。\r\n\r\nzone只定义资源关系，并不关心资源如何使用。zone的新增和删除理论上不影响业务rgw。\r\n而zone状态变更之后，同步rgw可以重启以加载。\r\n\r\n-placement概念可保留，placement是真正决定如何使用集群的。-\r\n\r\nbucket的index后面会增加一个meta，其中可记录每个bs的range等信息，另外还可以加个信息，就是bs存在哪个pool。\r\nbucket默认会选取一个index pool，选取多个data pool。理论上可支持index pool变更。\r\n\r\n对于pool可以做不同抽象，pool可以是rados的pool，也可以是其他的pool，如nas，公有云，光盘存储。\r\n对于这点似乎没有问题， pool就是资源存放的容器。\r\n\r\n有个概念storage_class,其实对应的就是一类pool。可以根据pool的type划分storage class。\r\n\r\n资源还有另一种方式抽象，就是站点。可利用多站点来保留多份数据。\r\npool也是跨站点的。通过站点和pool来支持数据流转。区别在于pool方式元数据我们仍然保留。\r\n站点方式元数据在不同站点各有一份。\r\n\r\n\r\n\r\n\r\n	2018-12-27 15:04:40.68545	f
528	211	Issue	5	定义一个多站点框架，其实不论对象存储还是块存储都需要。而且可以抽象出来，其实逻辑是接近的。\r\n外部只要注入一个log entry，提供fullsync接口，以及处理log entry的接口即可。\r\n\r\n框架要求：\r\n1，支持Qos\r\n2，支持站点单向同步，双向同步\r\n3，需要同步的资源，自行注册\r\n4，支持站点添加，删除，选举等等\r\n5，提供接口查询当前站点信息等\r\n6，提供同步接口\r\n\r\n\r\nMongoShake rotter等开源产品.\r\n\r\n这里有点比较复杂的是meta和data之间存在依赖关系。\r\n如果支持同步方式，可较好处理这一问题。而且有些操作需考虑一致性问题。\r\n理论上是否支持在一个zone删除一个bucket，但是另一个zone保留？	2018-12-28 07:24:50.366833	f
530	216	Issue	5	只有kv接口，如何玩转bucket index。尤其是后续考虑支持range方式。\r\n配额的统计肯定得分开。\r\n\r\n框架还一个局限就是同步按照bs。这些bs对象的遍历，这样对于支持range方式的bi不是很合适。\r\n设计range分裂。同步的单位是bucket。这并不影响同步效率。\r\n\r\n正好元数据格式调整。\r\nV6：\r\npool抽象，支持storage class\r\nrgw与rados解耦，抽离接口\r\nbucket index支持海量数据\r\n\r\n	2018-12-29 12:30:47.146556	f
531	216	Issue	5	基于多版本机制，使得设计保持一致性。在list输出结果时做特殊处理。gc定期清理删除的版本，或者多出的版本。\r\n\r\nput操作步骤：\r\n1，写入数据\r\n2，写入bilog\r\n3，写入bi (key:obj_instance)  instance：reverse time + random\r\n4，cache写入配额变更\r\n5，写入datalog\r\n\r\ndelete：\r\n1，写入bilog\r\n2，写入bi（delete marker），同步时需检查对端是否有delete marker\r\n3，cache更新配额\r\n4，写入datalog	2018-12-29 13:51:52.749029	f
532	217	Issue	5	http://network.51cto.com/art/201409/450885.htm	2018-12-30 13:26:07.181131	f
534	219	Issue	5	linux signal：用于进程间通知。需要注意\r\n1，信号处理函数应该可重入\r\n2，阻塞式系统调用在被信号中断时会返回，应用需处理该错误。\r\n\r\n\r\n应用程序该如何使用信号？\r\n应用程序捕获信号通常为了优雅的退出，或采用某些特殊行为（哪些？）\r\n所以问题变为：哪些场景下程序需正常按步骤退出？\r\n进程在操作系统申请的资源都会被系统释放，但是有些不一定。比如使用第三方的资源，如共享内存，如rgw使用rados的锁。\r\n打开的文件，socket都会被系统关闭。\r\n	2018-12-31 14:27:21.041835	f
535	219	Issue	5		2018-12-31 15:26:13.426559	f
537	216	Issue	5	rados omap接口支持cmp，在比较失败的时候撤销操作。支持多个key操作。 \r\n这样range split的算法就可以实现了。在发现range变更时，返回错误，加载range配置。\r\n如果正在split中，则新增的key需额外计录，以方便汇入split的key	2019-01-02 06:21:47.767856	f
536	221	Issue	5	面试失误总结：\r\n1，因为人力不够，或给的钱不够，找勉强凑合的。\r\n2，没有考察人实际的工作量和难度。造成对能力的错误认识。\r\n3，没有很好的考察德行。\r\n\r\n经验：面试这块，要尽量避免招到能力一般但是其他方面奇葩的人。这种人不稳定。	2018-12-31 22:39:07.972888	f
541	215	Issue	5	还有两个老的：\r\n1，扩容场景\r\n2，单bucket海量文件场景\r\n3，海量小文件场景(已经在优化)\r\n4，在线升级(rgw无状态，只有元数据部分影响升级，但元数据上可保持兼容，metadata，bi各种元数据模块要设计好)，服务可在线增加。	2019-01-05 12:46:55.793295	f
556	230	Issue	5	场景1：在非多版本删除时，增加后端任务。将超过x天的残留bi给清除掉。\r\n\r\n合适做法应该是根据同步位置来清理，根据bilog及其实例，识别删除操作，然后理清delete flag的key	2019-01-10 09:45:51.328878	f
546	225	Issue	5		2019-01-06 21:22:34.388917	f
547	227	Issue	5	什么叫从“做事用人”到“用人做事”？做事用人是事情已经想清楚了，找一个合适的人来干。相信很多人还在这个阶段。越往后走，会接触到“用人做事”，这事儿怎么干你也没搞清楚，你根本不是这方面的专家，但要找到最有可能把这个事情想清楚和做出来的人，让他来带一个合适的组织。	2019-01-06 21:30:57.18792	f
549	227	Issue	5	确定合适的战略，找牛逼的人。	2019-01-06 21:47:27.781796	f
551	228	Issue	5	工作划分：例会，晨会转移出去。	2019-01-07 09:01:55.70096	f
557	216	Issue	5	在多个rgw并发时，如何根据先后顺序，实现冲突检查。mtime字段可作为比较，尤其是将mtime作为key之后。\r\n\r\n尤其是非多版本下的处理	2019-01-10 17:45:00.061687	f
559	227	Issue	5	了解人：\r\n1，了解一个人的价值观，是否开放进取，是否因循守旧。对于合作是什么态度。\r\n2，如何看待自己可能存在的思维漏洞，能否经常自省，如何完善自己的逻辑机器。\r\n3，能否看到别人的长处，善于合作。\r\n4，是否内心足够强大\r\n\r\n去伪：\r\n1，是否纸上谈兵，思路很好，但从未执行过\r\n2，是否面面俱到，但浮于表面。	2019-01-11 07:44:20.494019	f
560	232	Issue	5		2019-01-11 07:53:08.692752	f
562	191	Issue	5	双打三板斧：\r\n封网，分球，杀点	2019-01-11 10:19:36.022811	f
563	190	Issue	5	握拍位置不仅取决于前后场，而取决于身体与球的距离。\r\n后场的近身球也可以采用高位握拍	2019-01-11 10:21:23.154184	f
566	215	Issue	5	placement变更引起rgw reload，导致业务中断的解决方案\r\n\r\n如何看待placement：placement是storage_class之上的一层，根据业务灵活的配置zone的空间使用。使得用户可自定义bucket元数据，数据，冷数据等具体storage_class分别使用怎样的策略存放。\r\n\r\n调整：\r\n1，将placement信息放在zone param中，zonegroup无需placement信息。\r\n不同的zone可自行决定如何放置数据。这样是合理的，实际上我们不同zone之间数据存在差异，可自行安排数据放置策略。且支持在线修改placement。\r\n\r\n（解决bucket在不同zone之间要求使用同样placement的问题，目前没有做zone之间的placement管理）\r\n\r\n2，支持user default placement，这样placement可对用户透明，用户甚至不必感知placement的存在。\r\n3，在placement信息变更时，不必更新realm period，也不必执行reload操作，避免引起业务中断。\r\n\r\n	2019-01-15 09:01:59.116801	f
567	216	Issue	5	可分析下TiKv以及cockroachdb如何实现range split。\r\n\r\n引入DB也没关系，但是kv接口层仍然需要。 逻辑层也仍然需要。	2019-01-15 13:34:35.816995	f
571	216	Issue	5	1，解决bi问题\r\n2，改进写入模型，支持批量写入。\r\n能否将小文件合并做到IO路径上？写入时合并，后台支持gc。现在的IO模型支持起来可能有点麻烦。\r\n或分配一个rados对象做追加写。\r\n\r\n一个bucket实例共用一个对象。每次使用前分配一下空间，然后写入。问题主要在于一致性。\r\n一个对象写入时，分配了空间，但是写失败了。\r\n\r\n这里搞不好真不适合使用数据库，数据库的操作比如在key里面修改value的局部，但是并发冲突的时候，其实我们希望的是操作A基于操作B的结果来修改。	2019-01-17 06:57:41.539155	f
572	215	Issue	5	海量小文件问题 （梁欣鑫）\r\n免归档 （归档有哪些要求，归档策略）（按年按文件类型，压缩归档，冷存储，公有云）(马四)\r\n免备份 （备份策略，备份隔离，备份域(故障域)，过期拷贝？）(马四)\r\n降低二级存储的成本（去重，压缩，冷池休眠）(马四)\r\n大容量支持（10PB规模如何支持）（多集群，多故障域）（谢锐）\r\nTF对接性能问题 （延迟敏感性应用）\r\n\r\n内部：\r\n多站点 （马四，刘一阳）\r\n解耦 （谢锐）\r\nbucket海量数据 （不排序/优化bs性能？）（谢锐）\r\n数据处理 （马四，刘一阳）\r\nES检索 （马四）	2019-01-18 04:11:50.147303	f
568	216	Issue	5	rados接口不支持+/-运算。如何实现数量统计？还有多rgw下如何为bilog编号？\r\n\r\n还有一种玩法就是支持多集群，rgw元数据沿用当前方案。 但是数据全部放到新的pool上。只封装读写接口给rgw。\r\n元数据采用SSD集群。在目前的代码上支持range的index。搞不好修修补补还能玩。\r\n\r\n说白了就是把ceph加cls当作数据库来玩了。\r\n\r\n其实这种框架与原计划并不冲突。至少迈出了第一步。rgw在pool管理上需独立出来。\r\n并且将rgw原先的meta一堆乱七八糟的pool都汇总。\r\n	2019-01-15 14:11:15.473987	f
588	253	Issue	5	大规模下如何保障可用性？ 对象存储设计成可用性优先是非常合适的。以便应层出不穷的故障。\r\n大规模下的性能分析？\r\n大规模下的问题跟踪，风险发现？\r\n对于大规模分布式系统，这种有复杂度的。系统内部的可见性尤为重要。\r\n\r\n离线修复数据。	2019-01-30 11:48:06.291777	f
569	216	Issue	5	方案x：\r\n在线分裂，支持将前部x万数据抽取分裂。\r\n0，设置原range, pre_split\r\n1，批量读取x万key\r\n2，批量写入到new range\r\n3，刷新range列表\r\n4，设置原range，complete split，刷新统计信息。\r\n在split期间可在原range读取，但是不能写入。\r\n\r\n批量导入的key不记录bilog。\r\n有个问题，像小文件合并的方案其实有个假定：bucket shard不会分裂。\r\n	2019-01-16 07:20:31.847885	f
570	215	Issue	5	分发与汇聚：\r\nbucket上保留有源站点信息，同时也有同步到哪些站点的信息。\r\n\r\n通过这些信息，可以在站点之间实现自动数据拉取与回源。	2019-01-16 08:38:22.605939	f
573	215	Issue	5	\r\nbucket海量数据\r\nbucket可扩展（支持跨pool，灵活使用）\r\n多站点\r\n多版本（做数据保护）\r\n\r\n归档策略\r\n可扩展\r\n\r\n海量小文件问题 （梁欣鑫）\r\n免归档 （归档有哪些要求，归档策略）（按年按文件类型，压缩归档，冷存储，公有云）(马四)\r\n免备份 （备份策略，备份隔离，备份域(故障域)，过期拷贝？）(马四)\r\n降低二级存储的成本（去重，压缩，冷池休眠）(马四)\r\n大容量支持（10PB规模如何支持）（多集群，多故障域）（谢锐）\r\n方案1：使用站点来扩展\r\n  1，限制站点规模，比如一个站点规模正好在5PB。\r\n  2，每个站点各自建业务rgw\r\n  3，每个站点对应一个集群。\r\n方案2：使用多集群扩展\r\n  1，rgw支持多集群，一个站点对应多个集群\r\n方案3：使用多故障域扩展\r\n  1，rgw支持多故障域\r\n  \r\nTF对接性能问题 （延迟敏感性应用）\r\n\r\n内部：\r\n多站点 （马四，刘一阳）\r\n解耦 （谢锐）\r\n方案1：将rgw对rados接口依赖进行封装。使得后续可使用其他系统进行替代。\r\n       难度在于如果统一为kv接口，不提供cls后端逻辑，则业务层实现需进行大调整。\r\n\t   或提供通用的后端kv逻辑，以减轻前端保障数据一致性的压力。\r\n\t   \r\n方案2：数据pool使用统一平台，元数据先使用当前版本顶上。\r\n       要求rgw支持多集群\r\n\t   缺点：rgw元数据部分没解耦。\r\n\t   \r\n方案3：重新抽象接口，元数据选用其他分布式kv数据库。\r\n       \r\n\r\nbucket海量数据 （不排序/优化bs性能？）（谢锐）\r\n方案1：提供不排序的list接口，不支持目录功能。\r\n       bs接口建议调用rest admin接口，尽量从cache获取信息。\r\n\t   \r\n\t   shard的问题主要在于扩展性。当bucket数据规模增大之后，shard无法在线增加。\r\n\t   支持hash shard分裂？如何做二次定位。\r\n\t   \r\n方案2：元数据基于其他分布式kv系统\r\n方案3：在rados cls基础上改造，支持range index？\r\n方案4：将ceph改造为kv系统，支持局部恢复。oid对应于表的分片。\r\n\t   \r\n数据处理 （马四，刘一阳）\r\nES检索 （马四）\r\n\r\n	2019-01-18 06:52:01.244566	f
574	154	Issue	5	1，降低硬件耦合，SSD故障不会影响到所有相关的HDD\r\n2，使用大文件，恢复和scrub等速度更快\r\n3，在POC测试时更加灵活(目前bcache使用并未缓存数据)\r\n\r\n4，filestore预分裂，创建pg太慢，对其他pool造成影响。\r\n	2019-01-18 11:26:34.966665	f
575	215	Issue	5	1，优化gc效率，支持快速的数据删除。\r\n  rados能否提供batch delete接口？\r\n2，恢复Qos\r\n	2019-01-21 07:25:00.968826	f
445	107	Issue	5	积木思考法（理清系统的组织架构）：拆分系统每个组件，以独立与关联的方式分解系统。\r\n人体层次组织思维	2018-11-18 07:24:22.22783	f
576	103	Issue	5	案例学习也是非常重要的部分\r\n学习是在*重构*与*延展*自己的知识。	2019-01-21 20:53:09.973148	f
577	216	Issue	5	在rados提供的接口与bi之间增加一层index，用于扩展支持range index。以支持list请求比较多的场景。\r\n\r\n当然采用专业的数据库也许是更长远之计。凡是皆有利弊，当然还需深入分析。	2019-01-21 21:06:42.84203	f
578	215	Issue	5	1，v5架构所有对象丢入gc不是很合适，且默认gc shard很少，删除大量对象时gc压力非常大。\r\n2，uage，notify等shard也太少，不利于不同osd分担\r\n3，最好将元数据独立故障域。\r\n4，同步和后端rgw没必要使用rgw cache，尤其是同步rgw，同步状态刷新非常快。\r\n5，quota-thread并非每个rgw都需要，只有业务rgw是需要。\r\n	2019-01-25 13:11:31.42012	f
580	137	Issue	5	政治，权力，控制，人心，帮派。\r\n李斯为何在与赵高的斗争中败下阵来？\r\n项羽为何失败？\r\n\r\n政治的逻辑与核心是什么？	2019-01-27 21:16:12.126223	f
581	137	Issue	5	民主制在哪些情况下合适？\r\n如何与初级员工？中层，以及高层打交道。	2019-01-27 21:17:06.672627	f
582	251	Issue	5	心理上要有打多拍的准备，这样就总是放松的迎接下一回合。快速放松就能快速准备好下一回合。	2019-01-27 22:04:27.808166	f
583	251	Issue	5	http://bbs.badmintoncn.com/thread-395619-2-1.html	2019-01-27 22:07:01.541031	f
584	239	Issue	5	为什么动作要规范，因为受限于人体特征，动作是有限制的。\r\n比如击球，有些动作就非常别扭。	2019-01-27 22:09:42.600213	f
585	254	Issue	5	软件实现功能这没啥可说的。\r\n但是软件的成败并非完全取决于功能，尤其是软件变大变复杂之后。\r\n考虑几个问题：\r\n1，软件如何扩展？\r\n2，软件如何升级？\r\n3，软件的风险如何控制？\r\n3.1 如何快速定位问题\r\n3.2 如何快速恢复\r\n4，软件的鲁棒性怎样？	2019-01-28 08:34:11.945328	f
586	255	Issue	5		2019-01-28 08:43:55.787924	f
587	256	Issue	5	这个还是有风险的，如果pg无法计算一些interval，那有些修改将被忽视。\r\n甚至可能无法完成恢复。	2019-01-30 09:44:26.065725	f
579	215	Issue	5	1，http的Date可在nginx和rgw日志中输出，方便定位问题。\r\n2，后端rgw可以部署在任意服务器上，并且最好支持服务发现。以方便业务rgw调用服务。	2019-01-25 13:12:02.69985	f
589	260	Issue	5	tell osd在线修改参数，能否tell osd重启\r\n能否批量修改配置\r\n\r\n\r\n问题：\r\n大量osdmap把系统盘空间撑爆	2019-02-08 11:39:38.38705	f
591	259	Issue	5	对象存储有一点非常适合于分布式，就是系统出现异常时，几乎不会影响新对象的写入。\r\n而块存储，因为其空间分配的分散性影响非常大。	2019-02-08 12:57:50.127773	f
590	260	Issue	5	mark osd lost +  osd_find_best_info_ignore_history_les\r\n舍弃数据修复。\r\n\r\npg层面可支持舍弃部分数据。而不是坏了一点就把整个抛弃的设计思路。\r\n\r\n系统是向前发展和生长的。记忆也会丢失。但我们仍然能追寻蛛丝脉络。\r\n\r\n老的链接逐步断开，新的连接在快速的建立。\r\n	2019-02-08 12:46:14.237208	f
592	260	Issue	5	monitor key数量正常，但是占用几十G空间。使用mon_compact_on_start可恢复。	2019-02-08 19:00:46.450686	f
602	260	Issue	5	时间不一致 对于rgw的影响是真正后写的对象，可能成为历史版本。但是不会出现两个zone版本顺序不一样的问题。	2019-02-15 12:34:20.423089	f
593	133	Issue	5	数据才是核心，很自然的一点。我们会把核心数据放在私有云上，而非核心数据放在公有云上。\r\n对企业而言什么是核心数据？规律，结论，客户信息，企业机器运转的核心数据。 \r\n而生产过程数据，量大且价值低，可放在公有云上。\r\n\r\n私有云的核心是数据的绝对安全可靠。非常高的可用性以及稳定性。\r\n\r\n把公有云与私有云的关系，对比为餐馆吃饭与家里请厨师做饭是不合适的。\r\n数据是企业的命根，而吃饭显然在当下不具备这个特点。	2019-02-10 23:03:04.41117	f
594	255	Issue	5	马云需要直接管理上万人么，不，他可能只需管理10来个人。	2019-02-12 10:12:39.929956	f
595	138	Issue	5	每个人都有其苦恼，也有其欢乐，有其生长环境的痛。朋友是交心的。如果同时有相近的价值观，就可能成为至交。\r\n有人麻木，有人没看到人心。这些人还停留在做事阶段。\r\n\r\n做事也分很多阶段，无法克己的人，就没法走出原生环境的伤。这些伤在非高知，优渥，开明的家庭里都是存在的。\r\n	2019-02-12 10:19:33.400805	f
599	216	Issue	5	对于非多版本的bucket支持indexes模式。这样就算bucket shard不多，仍然可支持海量数据。\r\n而且这种模式的价值应该还是比较明显的。	2019-02-15 09:44:34.398102	f
603	265	Issue	5	方案1：\r\n1，先提供工具将V3的bi，结合head object在新的pool中产生V5的BI\r\n重点是1，验证manifest。 2，产生合适的manifest。\r\n\r\n2，停止rgw，等待工具处理完近期写入的新对象。然后将原index pool rename为index_bk,\r\n将新的pool rename为index pool。\r\n3，升级rgw和osd等到V5版本\r\n4，启动服务。	2019-02-16 09:04:53.20044	f
623	279	Issue	5	如果ClientIP与VIP相同，则RS无法完成数据包发送，因根据转发规则，其转发给lo。\r\n所以DS无法作为系统的客户端。	2019-02-23 09:12:17.661491	f
605	271	Issue	5	避免循环同步仍然是需要实现的。\r\n可以使用其他语言实现，同步只是其中一个服务。\r\n\r\n重点要搞清楚元数据那块，是否存在风险。\r\n\r\n如何切换zone的角色。	2019-02-16 14:43:48.201119	f
610	265	Issue	5	再验证一个地方，将v5的manifest prefix中的版本去掉。并且修改rados对象名字，看能否正常读取数据。\r\n这里验证没有问题。	2019-02-18 15:45:14.909043	f
607	268	Issue	5	损坏的osd有33，91，115， 155， 165\r\n其中165报错为 Corruption： checksum mismatch\r\n其他报错为 Corruption：bad record length\r\n对应的host为：node.(num % 15 + 3).\r\n因为第0的节点编号是node3.\r\n\r\nnode6, node4, node13, node8, node3\r\n	2019-02-18 09:24:51.162899	f
616	276	Issue	5	https://mp.weixin.qq.com/s/8QdKMhvyeDnv_Vv8LnBgJw\r\n\r\n加入pg中文社区	2019-02-20 09:02:09.252205	f
617	268	Issue	5	系统日志中未见leveldb明显错误	2019-02-20 14:27:21.86108	f
619	279	Issue	5	<pre><code class="text">\r\n在分析数据包流向前，需要厘清一个容易产生疑惑的要点：在VS/DR模式下，TCP连接是客户端和RS之间建立的，\r\nDirector只是负责改造、转发建立TCP连接时的数据包给后端RealServer；当TCP连接建立完成后，\r\n就有了客户端和服务端(RS)的概念，这时客户端将直接和RS进行数据通信，而Director已经退出舞台，\r\n不再负责改造、转发请求数据包，直到关闭连接时。也就是说，Director改造、\r\n转发的数据包只有客户端发送的和tcp连接建立、关闭相关的syn、ack和fin包，\r\n其它数据包和它无关(网络状况良好的情况下，共转发syn+ack、fin+ack共4个包)。\r\n可以想象，这样的Director相比NAT模式，性能高的不是一点点。\r\n</code></pre>\r\n\r\n这个如何做到？Client发送数据的目标地址总是VIP，如何透过DS？\r\n难道路由器还可以保持单次会话的状态？\r\n	2019-02-21 19:34:22.23693	f
620	271	Issue	5	IDEA：搞一个分布式的raft元数据同步模块。实现元数据的同步。\r\n元数据操作都丢给该同步模块。彻底解决元数据的一致性问题。	2019-02-22 13:56:24.376366	f
622	279	Issue	5	DS发给RMAC的包，由于其目标IP为VIP。因而RMAC网卡会转发该数据包。在RS上其转发是给本地的lo网卡（VIP配置在lo网卡上的情况）。 lo网卡处理完数据之后发给源MAC(这里是RMAC)。数据包再经由RMAC网卡发出去。\r\n\r\n这里RMAC的作用有点像路由器。根据上述流程可推断：如果nginx只监听RIP，则无法正常处理消息。	2019-02-23 09:09:53.78936	f
625	271	Issue	5	另外真正大规模是需要考虑同城多站，以及非同城情况的。\r\n高可靠情况下。同城多站之间存在容灾关系。公有云没有暴漏这层情况。\r\n\r\n这块需求还是摸摸，一个区域内站点怎么管理的。	2019-02-23 14:59:31.818577	f
626	281	Issue	5	8个incomplete，确认下bi对应的pool。	2019-02-24 15:28:20.871634	f
629	240	Issue	5	1，测试框架先行\r\n没有好用的测试框架，研发的bug用例就不能立即补充，bug也没法充分自验证。\r\n2，每个bug都应该有对应的用例\r\n3，如果系统需要测试随机碰撞发现问题，说明很多地方不在控制范围内。应该采用更透明方式测试。\r\n4，测试是渗透于架构与开发过程中的。\r\n5，大特性分迭代交付\r\n6，谁开发谁维护，模块特性解耦，任务解耦。\r\n7，平台与业务关注点与变化周期都不一样，应该采用分离策略。\r\n8，设计review相当于对设计进行测试，验证其是否合适，可行。\r\n9，代码review相当于初步的白盒测试。\r\n10，采用服务模型，可以按服务来解耦。\r\n11，设计应该综合考虑测试，运维，监控，升级，性能，可靠性，可用性，一致性，扩展性，功能，人力安排等等。不要随意假设，忽略一些小部件。	2019-02-26 07:03:53.500046	f
630	216	Issue	5	1，rados提供kv接口，在此kv基础上实现多站点元数据一致性保障，可在此基础上实现raft。\r\n好处是该服务可以无状态化。坏处是性能可能受影响。单独实现的话需考虑如何通知到，以避免使用rados的\r\nwatch/notify接口。 etcd都帮搞定了。\r\n\r\n2，同步代码，同步状态管理。zone配置仍然放在本地。zone给哪些zone同步也在本地配置。zone有哪些placement都属于zone固有信息。而且这些信息不必缓存，直接在后端获取。可避免使用rados watch/notify机制\r\n\r\n3，s3服务。s3服务是独立的，她与同步的关系仅在于datalog与bilog。\r\n\r\n4，后端服务，能够看到客户端看不到的变量，以辅助管理\r\n\r\n\r\n	2019-02-26 15:17:24.920043	f
631	216	Issue	5	etcd至少要做到孤立节点可读。否则多数据中心网络异常后，s3服务可能受到影响。\r\n\r\n同时如果把奇节点丢在其中一个数据中心。则需有机制强行恢复。\r\n比如在目标站点拉起一个节点，从而可形成多数派。\r\n\r\n	2019-02-27 14:52:18.094191	f
720	348	Issue	5	真相可能掌握在更有权力和资本的人手中，他们让机器运行算法以获得更好的信息，进而改变了当下。 \r\n弱势群体的机会在于运用廉价的数据，更好的算法得到更好的结果。 这就是当下社会情况。\r\n\r\n如果没法操控好机器，就可能被其他人取代，但这模式不会变。弱势群体利用更好的算法，更差的机器才能颠覆。	2019-04-24 09:31:28.437139	f
613	214	Issue	5	如果把人简化点比喻成软件。\r\n身体就是硬件\r\n心智观念认知就是操作系统\r\n技能经验就是服务软件。\r\n\r\n一个人要达成目标，尤其是需要多人完成的目标。是需要具备不少能力的。\r\n我们可以通过人达成的成就来反推。\r\n\r\n1，空有认知，没有身体力行，无法验证。\r\n2，身体如高配的跑车，然而不运行起来也没用，\r\n心智认知最明显的就是对于时间和情绪控制方面。\r\n操作系统可能还不错，但是在空转。\r\n3，还有硬件牛逼，操作系统飞快的。但是不跑服务，无法展示其他人以价值。\r\n这种是潜力股，但是能否发挥出来有风险。	2019-02-19 10:00:11.972777	f
614	240	Issue	5	任何系统都可能存在bug。重要的是问题可以不断收敛。\r\n\r\n自动化测试就是解决这个问题的呆办法。没有这个复杂系统都玩不起来。\r\n而且系统设计之初就应该为测试，升级，监控，运维留好后路。合理的抽象与模块划分。否则等着的就是今夜无眠。	2019-02-19 12:34:32.97667	f
615	268	Issue	5	1,osd db什么时候出现异常的。\r\n从日志无法分析出来，日志中都没有Corruption信息，这个信息是打印在屏幕上的。\r\n\r\n<pre><code class="text">\r\n2019-01-29 11:01:14.809009 7f9633f2c900  1 journal _open /var/lib/ceph/data/ceph-91/journal fd 4: 5368709120 bytes, block size 4096 bytes, directio = 0, aio = 0\r\n2019-01-29 11:01:14.809036 7f9633f2c900  1 journal close /var/lib/ceph/data/ceph-91/journal\r\n2019-01-29 11:01:14.809054 7f9633f2c900  0 probe_block_device_fsid /var/lib/ceph/data/ceph-91/journal is filestore, 173ad517-b782-45ca-a5ed-d5437b23e37f\r\n2019-02-05 09:46:25.652868 7f837e147900  0 SandStone MOS V5.2.1 (6421a98067919427dba833a42dde26151dc61cfb), process ceph-osd, pid 9791\r\n2019-02-05 09:46:25.676240 7f837e147900  0 filestore(/var/lib/ceph/data/ceph-91) backend generic (magic 0x58465342)\r\n2019-02-05 09:46:25.676637 7f837e147900  0 genericfilestorebackend(/var/lib/ceph/data/ceph-91) detect_features: FIEMAP ioctl is disabled via 'filestore fiemap' config option\r\n2019-02-05 09:46:25.676643 7f837e147900  0 genericfilestorebackend(/var/lib/ceph/data/ceph-91) detect_features: SEEK_DATA/SEEK_HOLE is disabled via 'filestore seek data hole' config option\r\n2019-02-05 09:46:25.676661 7f837e147900  0 genericfilestorebackend(/var/lib/ceph/data/ceph-91) detect_features: splice is supported\r\n2019-02-05 09:46:25.903040 7f837e147900  0 genericfilestorebackend(/var/lib/ceph/data/ceph-91) detect_features: syncfs(2) syscall fully supported (by glibc and kernel)\r\n2019-02-05 09:46:25.904898 7f837e147900 -1 filestore(/var/lib/ceph/data/ceph-91) Error initializing leveldb : Corruption: bad record length\r\n</code></pre>\r\n\r\n可能情况是这些osd一直hang在那里，中间输出的超短启动日志是om调用ceph-osd  get fsid产生的。\r\n\r\n问题是当时osd到底是hang住了，还是om没有尝试拉起呢？\r\n可以确定的是这十多天osd没有启动过，没有走到mount加载filestore过程。\r\n\r\n可以确定的现象是所有这些osd所在host都出现了内存不够的问题。\r\n	2019-02-20 07:10:41.503892	f
618	216	Issue	5	1，支持pool概念抽象\r\n2，使用placement来灵活配置pool的使用，存储策略\r\n3，支持数据流转的抽象（同步，备份，归档都是将数据从一个bucket实例转移到另一个bucket实例）\r\n流转的Qos，监控，压缩都是通用的。\r\n4，元数据分离\r\n5，多站点的元数据同步\r\n\r\nrgw工程依赖问题，在解耦之后可能仍然无法解决，common部分难以剥离。\r\n最彻底的方式就是重新实现rgw。	2019-02-21 10:33:48.011067	f
628	283	Issue	5	大型网站的域名访问是如何做负载分担的？\r\n分析阿里云的sdk看看	2019-02-25 10:38:20.982317	f
621	271	Issue	5	多版本频繁修改system对象需修改。\r\n\r\n关闭同步rgw的cache不合适，会导致元数据更新无法同步给业务rgw。\r\n这里将同步rgw使用system object的地方做修改。从而减少watch/notify的发出。\r\n\r\n这里遗留一个问题：目前同步状态在内存中没有cache，每次bs同步都得读取bs当前同步状态。\r\n后续设计新同步模型的时候需考虑这点。	2019-02-22 16:58:19.512567	f
634	240	Issue	5	设计对于测试的考量：https://segmentfault.com/a/1190000007866223	2019-03-01 14:12:33.190209	f
624	271	Issue	5	未来的同步框架。可考虑做分离式设计。元数据做成同步模式的。业务rgw 作为follow。\r\n\r\n而数据同步跟普通的数据读写并无差异，就是根据binlog来同步。只是需检查依赖的元数据是否已经同步。\r\n实现这个框架。\r\n\r\n	2019-02-23 12:34:37.467171	f
627	283	Issue	5	12.2 HTTP重定向\r\n\r\nWeb服务器可通过Http响应头信息中的Location标记来返回一个新的URL，浏览器自动去访问这个新的URL。\r\n\r\n实现：可以通过Web应用程序代码实现你想到的调度策略，如可根据请求的URL的不同来进行合理的过滤和转移。\r\n\r\nhttps://www.zhihu.com/question/22610352\r\n\r\n不过这种与endpoint管理不一样。	2019-02-25 10:31:19.991725	f
637	221	Issue	5	1，是否健康\r\n2，是否柔软，谦逊\r\n3，是否坚定，触之不动\r\n4，是否快乐。\r\n\r\n跟定输入，验证输出。面试就是x/y = f(x),重点就是f。\r\n\r\n就像一个不倒翁一样。你不推它，是感知不到的。	2019-03-03 22:04:46.519077	f
639	280	Issue	5	在日常交流中，融入思考与情感。如何做到时刻在当下？君子如何好人，看到别人的兴趣，保持好奇心。唯有热爱，让人保持热忱。	2019-03-03 23:22:07.291639	f
641	294	Issue	5		2019-03-05 07:51:48.868359	f
642	215	Issue	5	placement与pool作为资源管理的抽象，应该作为独立层次管理。\r\nbucket是数据集合的抽象，是逻辑单位。placement的定位就是bucket使用pool的管理方式。	2019-03-05 12:21:51.210662	f
643	155	Issue	5	Martin Fowler\r\n\r\nOne of the differences between building\r\narchitecture and software architecture is\r\nthat a lot of decisions about a building\r\nare hard to change. It is hard to go back\r\nand change your basement, though it is\r\npossible.\r\nThere is no theoretical reason that anything is hard to change about software.\r\nIf you pick any one aspect of software\r\nthen you can make it easy to change,\r\nbut we don’t know how to make everything easy to change. Making something\r\neasy to change makes the overall system\r\na little more complex, and making\r\neverything easy to change makes the entire system very complex. Complexity is\r\nwhat makes software hard to change.\r\nThat, and duplication.\r\n\r\nSoftware is not limited by physics, like\r\nbuildings are. It is limited by imagination, by design, by organization. In\r\nshort, it is limited by properties of people, not by properties of the world. “We\r\nhave met the enemy, and he is us.”	2019-03-05 13:00:54.807084	f
645	214	Issue	5	好的生活不是躺尸，而是尝遍乐趣，积极享受，同时也好好休整。\r\n就像打羽毛球一样，你不是站在那里，漫不经心，那样的生活不会有意思，也没法调整好自己。\r\n你要认真的打球，赢了能兴高采烈。输了也能坦然面对。重要的是你在经历这一切，与朋友一共成长与体验。\r\n\r\n能克服自己的心魔，跨越自我意识障碍。\r\n同时看到自己的思维盲区，积极与同样认真有趣的人合作。	2019-03-06 19:25:17.980727	f
632	287	Issue	5	1，查看几张网卡。\r\nlspci | grep -i eth\r\n<pre><code class="text">\r\n01:00.0 Ethernet controller: Broadcom Limited NetXtreme BCM5720 Gigabit Ethernet PCIe\r\n01:00.1 Ethernet controller: Broadcom Limited NetXtreme BCM5720 Gigabit Ethernet PCIe\r\n02:00.0 Ethernet controller: Broadcom Limited NetXtreme BCM5720 Gigabit Ethernet PCIe\r\n02:00.1 Ethernet controller: Broadcom Limited NetXtreme BCM5720 Gigabit Ethernet PCIe\r\n04:00.0 Ethernet controller: Intel Corporation 82598EB 10-Gigabit AF Dual Port Network Connection (rev 01)\r\n04:00.1 Ethernet controller: Intel Corporation 82598EB 10-Gigabit AF Dual Port Network Connection (rev 01)\r\n</code></pre>\r\n\r\n或cat /proc/net/dev\r\n<pre><code class="text">\r\nnter-|   Receive                                                |  Transmit\r\n face |bytes    packets errs drop fifo frame compressed multicast|bytes    packets errs drop fifo colls carrier compressed\r\n  eth0: 2209785591 26605292    0 117493    0     0          0   5223710 569323943 1725958    0    0    0     0       0          0\r\n  eth1:    1690      10    0    0    0     0          0        10     2742      31    0    0    0     0       0          0\r\n  eth2:       0       0    0    0    0     0          0         0        0       0    0    0    0     0       0          0\r\n  eth3:       0       0    0    0    0     0          0         0        0       0    0    0    0     0       0          0\r\n  eth4:       0       0    0    0    0     0          0         0        0       0    0    0    0     0       0          0\r\n  eth5: 3440060985213 3794627140    0 117420    0     0          0     12166 10756198412767 8245868156    0    0    0     0       0          0\r\n    lo: 3170789494359 776063107    0    0    0     0          0         0 3170789494359 776063107    0    0    0     0       0          0\r\n</code></pre>\r\n\r\n	2019-02-28 10:29:07.413913	f
633	287	Issue	5	如果一个网卡上配置多个ip，会在/etc/sysconfig/network-script/下面创建多个ifcfg配置文件。\r\n且device使用的不是eth0， 而是eth0:21 这种形式。\r\n\r\n另外ip addr命令看到的不是物理状态。通过配置ifcfg，然后ifup是可以将其显示状态改为up的。	2019-03-01 07:28:15.426074	f
636	292	Issue	5	9，人都喜欢权力，同时模糊责任。 权力的本质就是选择决定的能力。能者居之，意思就是让具备选择决定能力的人来做决策，同时应该尽量避免独裁，独裁者成功与其能力成正比。	2019-03-03 21:51:00.526613	f
638	221	Issue	5	1，认知\r\n保守与否，价值观怎样，可以问时事。\r\n\r\n2，目标\r\n结合结论，来看一个人的能力。\r\n\r\n3，情感\r\n可以聊加班，以及一些其他事情来点火。不点火放不出怪兽。\r\n\r\n另外可以看看：\r\n经验与能力	2019-03-03 22:11:20.175929	f
640	293	Issue	5	晚上也有系统给我产生价值。就像构建一个机器人给自己赚钱一样。想想都激动。	2019-03-05 07:35:11.921991	f
644	155	Issue	5	事物复杂是因为其存在依赖与关联。有些关联很密切，有些比较稀松。\r\n软件就是用函数表达这种关联。 相关的一些函数组成模块，相关的服务组成进程。\r\n\r\n除了研究执行体之外，软件最多的都是涉及交互，互斥，数据共享。 对于状态的处理有cache，与非cache模式，有状态与无状态之别。\r\n数据有share或者not share的模型。	2019-03-05 13:08:00.363449	f
635	290	Issue	5	工程产品需要考虑各种实际场景，考虑人性，业务，考虑事务发展的趋势与阶段。考虑成本，同时还有选择，谨慎的运用权力。	2019-03-03 21:45:07.498795	f
646	222	Issue	5	缺点：\r\n1，做事缺乏计划，主动性不够\r\n2，执行推动力弱\r\n3，责任心缺乏\r\n4，细节考虑不够\r\n5，偏忧虑型风格\r\n\r\n优点：\r\n1，有框架思维能力，能从基本上确立制度。\r\n2，有开放创新能力，可以想出一些Idea	2019-03-07 10:05:03.904285	f
647	227	Issue	5	1，采用严要求，以及有点小痛感的压力，给于其时间调整，不行就滚蛋\r\n2，找有兴趣有能力的人，且有德之人(依道而行谓之德)，给于高工资。	2019-03-07 10:08:52.538132	f
649	240	Issue	5	张瑞关于设计的观点：\r\n1，元数据是核心，精简元数据设计\r\n2，理解设计需解决的问题所处的层次，带来的产品亮点，未来架构演进之后设计是否报废，设计就是要做精品的路子\r\n3，实现方案有很多种，关键是理解清楚问题，以及考虑方案的额外增益\r\n4，保持特性的弹性，配置化，可在线配置》离线配置\r\n5，细节不可随便遗漏：应用场景分析，端到端的IO流程，异常场景，关键算法，资源占用等都得考虑。\r\n\r\n张瑞在细节与周全上还是考虑的比较多的。	2019-03-07 13:11:22.042111	f
651	107	Issue	5	原则：\r\n1，如果你毫无计划的在做一件事，说明你缺乏这方面的系统思维，机器尚未建立起来。	2019-03-07 13:16:24.20492	f
652	216	Issue	5	解决rgw bi恢复卡住业务，以及bucket list慢的思路。\r\n方案X：\r\n将bi独立成服务。\r\n支持配置多组bi服务，但是一个bucket只落在其中一个。\r\nbi服务的逻辑是采用批量写入key到一个rados对象（对，同一时间只写一个rados对象）。\r\n在内存中维持level 0的rados bi对象。当然如果内存足够，其他level也是可以加载到内存的。\r\n\r\n当然也可以每个bucket搞N个shard，然后写到1万数据，就启动合并。并切换一组。\r\n\r\n一方面由于L0的key写入量在一段时间范围内，不需要全量恢复所有key\r\n另外后端合并后写入到新的rados obj。而不去修改还有的rados obj。 \r\n然后通过内存加速index。\r\n\r\n还有一种思路，ceph支持range index。\r\n\r\n\r\n\r\n	2019-03-07 16:18:17.585398	f
650	240	Issue	5	软件开发有大技术点：设计，代码编写，测试，review，解bug等专项技能。\r\n\r\n设计关乎认知否？of course，对系统的认知理解，从不同层次看待问题设计是不一样的。	2019-03-07 13:13:25.950595	f
653	299	Issue	5	高压之下，如烈日炎炎。要知道避暑。 吃吃西瓜？\r\n夜幕降临，要能安歇。为来日做好准备。\r\n\r\n忧思过度，嫉妒，纵欲，暴躁，愤怒这些情绪就像雾霾，沙尘暴，冰雨等灾害天气。伤害的是自己和身边的人。\r\n\r\n积极应对，才能从容每一天。不让自己在烈日下烤死，或者在外乡流浪。 外乡真有那么好么，尤其是自己并未发生改变的时候。老人说先在家里做好事情，再出去	2019-03-08 08:22:08.589407	f
656	296	Issue	5	与客户聊产品功能体验\r\n与投资者聊产品远景，发展规划\r\n与员工聊技术\r\n与供应商聊对其需求，价格。	2019-03-08 11:51:36.653883	f
667	313	Issue	6	本月共有4个假期时间，其中1个小长假，3个正常周末\r\n# 4月5日-4月7日：清明/叁物园亲子活动/房间已预订共14人（姐姐家3人、二哥家3人、自己家4人、二嫂同事家4人）/计划4月5日早上出发，4月6日下午返深\r\n# 4月13日-4月14日：周六在家打扫除/周日安排各自社交活动\r\n# 4月20日-4月21日：周六带谢震去周边公园玩耍/周日阅读思考写作休息\r\n# 4月27日-4月28日：周六链接一个人/周日安排第一次家庭会议\r\n	2019-03-18 08:15:55.498657	f
721	350	Issue	5		2019-04-25 06:45:05.692857	f
655	290	Issue	5	科学研究的是 z(x) = y(x) + a(x) + b(x) + ... + k \r\n当然一切结函数，工程本身也被研究。\r\n\r\n工程关心的是：\r\n1，y(x)各个子函数具体实现方案，基于计算，存储，网络资源等更好无误的实现。\r\n2，参数优化，根据当前条件，参数调整到哪种程度。\r\n3，如何监控，运维。\r\n4，成本与时间。	2019-03-08 09:33:19.419415	f
658	39	Issue	5	又走回在线合并的思路。\r\n离线合并代价太高，且gc问题对于对象存储可能不严重。在线合并更合适。\r\n\r\n并且可以根据bs来分配大对象，在IO路径上将请求也做合并，包括数据请求与bi的请求。	2019-03-08 14:32:27.45799	f
660	298	Issue	5	如果不考虑ACL，其实写可以优化，多版本写入的读可以优化掉。\r\n\r\n或者做垂直优化，让user或user的bucket跟rgw服务建立关系。然后针对user/bucket加载元数据，读操作也会受益。性能刚刚的。\r\n\r\n像头条这种写少读多的场景更为合适，不过经过cdn之后，也许其读写也是相近的。\r\n接口不受严格限制之后，好处与坏处同样明显。像阿里oss这种提供域名服务的，万一挂了该如何处理。	2019-03-08 14:51:09.17245	f
654	299	Issue	5	就像打羽毛球一样，除了击球一刹那，平时都在有条不紊，放松的安排工作与调整。\r\n\r\n原则：\r\n1，正常情况下，人应该是放松且开心的。\r\n2，犹豫不决，问题困扰的情况下，人仍然可以放松平静，因为改进提升自己的机会来了。这与积极思考并无矛盾，而且心态稳定有利于思考。	2019-03-08 09:27:21.181148	f
659	298	Issue	5	是可以考虑只缓存必要字段到数据库或ES，从而实现快速list，以及按照prefix查找，全文检索等的。\r\n\r\n比如文件名，创建时间，ETG，大小，TAG等，这些加起来不会超过100字节的话，可加载到内存中加速读取。\r\n	2019-03-08 14:47:52.232726	f
657	298	Issue	5	1，支持复杂查询，高频查询。\r\n2，解决海量小文件问题\r\n3，解决bi恢复卡住业务的问题。\r\n   精简元数据，实际上可以做到非常小的。\r\n4，支持接入多家公有云。\r\n5，优化IO模型，更方便支持小文件优化写入\r\n6，多版本必须开启，去掉ACL。从而减少写入放大，减少写入时读操作。\r\n7，bs以及一些元数据可考虑策略cache，从而减少读请求。\r\n8，垂直优化空间还是非常大的。	2019-03-08 11:53:20.306327	f
662	302	Issue	5	1，动机\r\n  解决计算机资料阅读的困难\r\n  解决英语邮件沟通以及听讲座的问题\r\n2，计划\r\n  按照每年一个版本\r\n  2019：解决英语读写问题\r\n  2020：解决英语听说交流问题\r\n  \r\n3，执行\r\n  指导思想：建立体系，学以致用\r\n  读写问题：\r\n  1，词汇量问题，按照通常说法，词汇量达到2-3万就非常不错了。这阶段目标假设是常用1万单词。\r\n我现在的单词量估计3k左右。需要每天记20个单词，一年可达标。\r\n  2，语法问题，这个记忆量不大，应该可完成。\r\n  体系：就是建立好词根，单词的关联关系。 语法规则集。\r\n	2019-03-09 15:53:22.472878	f
663	303	Issue	5	1，词根含义存在变化衍生的情况\r\n2，在专业领域词根可能不一样。\r\n比如sol与heli， anim与bi	2019-03-12 10:22:29.52602	f
664	298	Issue	5	还有在小文件写入上，可以通过合并写入，有望极大提升性能	2019-03-12 12:48:04.791428	f
661	280	Issue	5	完成英语与数学学习的思路整理，建立起日常生活工作与英语，数学的联系。\r\n完成数据库基础知识巩固\r\n建立更加完善的产品体系思维，提升打造产品的综合能力。\r\n\r\n用数学的方式思考问题，用英语扩展视野。最终我的目标是能科学，严谨的研究问题，得出规律和结论。not 直觉。\r\n当然直觉与经验很重要，但我们需要抓紧本质并且严谨，利用公开的数据和研究成功。\r\n\r\n\r\n	2019-03-09 15:15:06.05778	f
665	163	Issue	5	分布式系统的短板分析。\r\n延时与吞吐量多角度分析\r\n并发冲突。性能跟踪以及统计。统计每个io的延时。	2019-03-15 16:50:42.513945	f
666	154	Issue	5	目前考虑在线合并方案。\r\n有几个问题：1，EC pool不支持overwrite。因而针对ec pool的情况，可能还是得使用tier的方式。\r\n2，bi的cache可以使用osd在filestore cache，既可以加速bucket list性能，也可以加快bi对象的恢复。\r\n3，大对象gc可以把同osd的合并做offload，利用clonerange等rados接口。\r\n4，还有一个必须优化的就是元数据规模，这个也是2的前提。\r\n\r\n顺序写，offload等性能优化手段。减少网络交互以及IO次数	2019-03-15 16:56:05.115983	f
668	314	Issue	6	一、自己定下这个2020年完成职业转型的目标后，我就在思考我该从哪里入手呢？\r\n首先我想到的是，弄清楚这个问题，我可能需要一些专业的知识，专业的工具，专业的人，再加上自己思考和选择。\r\n\r\n二、我究竟该通过什么方式去了解这些专业的知识、专业的工具，如果去接触到这些专业的人呢？\r\n* 网上查询，然后自己学习，可能会花费我大量的时间，容易中途放弃\r\n* 报名一些课程，通过集中式学习，然后用于分析自己，也许是一条不错的路径\r\n* 我身边有没有这样的专业人士，通过他们提供一些前期免费的服务，我先微信问问吧\r\n\r\n三、那种方式操作起来最简单，我先行动起来？\r\n* 第一种对我来说有点难度，不容易出结果，同时容易中途放弃；\r\n* 第二种花费太多的金钱，可能试错成本会很高，不适合轻易做决定；\r\n* 第三种最容易有反馈结果，也就是发条微信的时间，简单易行，就从这个方式开始吧	2019-03-18 08:50:56.768734	f
672	315	Issue	6		2019-03-18 11:59:55.042963	f
674	254	Issue	5	软件工程研究的核心问题是：如何在生命周期内有质量，有效率的适应环境变化。	2019-03-23 14:41:02.687317	f
669	314	Issue	6	思考完这些问题后，我梳理了深圳圈的所有人，选定了小章鱼先进行了解，理由如下：\r\n* 小章鱼上过职业规划生涯的相关专业课程\r\n* 小章鱼是一个自带能量的人，她身上有我所欣赏的能力\r\n* 小章鱼个人的职业发展比较成功\r\n\r\n2019年2月28日微信进行了沟通，咨询咨询职业生涯规划课程内容\r\n\r\n2019年3月1日进行了回复：\r\n一、解答生涯规划的课程，小章鱼上了新精英课程，详细情况如下：\r\n# 基础班：都要上，基础的工具、逻辑，基本知识等\r\n# 咨询实践班（咨询方向）：针对未来做咨询方向的人，把在基础班学到的知识，在实际的咨询中进行利用、演练，写咨询报告等\r\n# 企业版权课（培训方向）：企业做对接，怎么用职业生涯规划里面的工具，帮助企业中不同阶段的员工渡过解决他们不同阶段的问题\r\n**结论：如果不是未来想要从事这个方向的话，上职业生涯规划课程成本太大没有必要，可以找到付费或公益的职业规划师，找到相应的答案，解决自己的问题即可*\r\n二、通过初步微信沟通，小章鱼答应可以先了解一下我的情况，再帮我推荐相应的职业生涯规划师做进一步的咨询\r\n* 小章鱼建议面聊后，初步了解情况，看能否答疑解惑\r\n* 根据初步的了解再定向推荐职业生涯规划师\r\n*初步约定下周见面了解 \r\n\r\n\r\n2019年3月4日发送“咨询信息收纳表给我”\r\n\r\n2019年3月5日约定见面时间3月6日中午\r\n\r\n2016年3月6日早上反馈“咨询信息收纳表”给小章鱼\r\n\r\n2019年3月6日中午如约见面\r\n\r\n\r\n\r\n	2019-03-18 09:32:26.191999	f
670	315	Issue	6	时间：2小时（2019年3月6日12:00-14:00）\r\n地点：南山科技园醉翁亭\r\n内容：职业生涯规划咨询\r\n人物：胡冬寅、张雨晨（小章鱼）\r\n需要准备的资料：咨询信息收纳表\r\n谈话框架如下：\r\n简单讲述职业生涯规划的流程-通过做职业生涯规划毕业案例导致自己对职业生涯产生担忧-自己如何利用职业生涯规划里面的工具帮自己解决自己的职业规划-简单了解我的情况-表示如果有需要可以推荐相关职业规划咨询师给我-抛出自己的保险营销团队招合伙人的橄榄枝-告知可以参加相关的活动进行了解\r\n\r\n\r\n\r\n	2019-03-18 10:37:28.453257	f
671	315	Issue	6	我从中得到的资讯和收获\r\n一、关于职业生涯规划，包含了以下方面的问题（需要弄清楚自己究竟是属于哪个方面的疑惑）：\r\n职业选择与定位\r\n职场适应\r\n职业能力探索\r\n职业决策\r\n职业方向重定向\r\n职业倦怠\r\n职业晋升\r\n跳槽\r\n职业人际关系处理\r\n职场压力面对\r\n工作与生活平衡\r\n生涯愿景与生涯平衡\r\n\r\n二、职业转型的口诀\r\n转岗不转行\r\n转行不转岗\r\n探索的步骤依是向上看、向内看、向左右看、向外面看\r\n向上看即从该职位的上升渠道看有没有可能（比如会计往上是主管会计-总账会计-财务总理-财务总监）\r\n向内看即从专业知识领域的通道有没有可能（比如会计会计从业资格证-初级会计师-中级会计师-高级会计师-注册税务师-注册会计师-国际注册会计师）\r\n向左右看即看同一行业的其他岗位是否有合适的（比如培训岗等）\r\n如果再没有合适的才向外看，向其他行业和其他岗位探索，但往往会比较累\r\n\r\n三、看一个行业是否符合自己可以通过人事网书四个方面去一步步验证\r\n人：可以约该行业该公司最优秀的人出来，了解他的想法和工作状态\r\n事：通过查看关于该公司负面评价来了解\r\n网：通过官方网站去了解该公司的相关产品\r\n书：通过书本的系统知识来判断\r\n\r\n四、通过小章鱼的分享有以下几点的收获\r\n对于自己从事的岗位不管喜欢与否，都有做好的能力\r\n女人到了35岁，男人到了40岁，都会遇到家庭与事业平衡的问题，如果能够提前规避，就不至于面临两难的选择\r\n从大的层面来说一个人的信仰和善心也会对一个人的事业产生重要的影响\r\n主动链接身边的人，帮助人和被帮助都是一种幸运\r\n有工具有方法然后就是去行动，如果不行动，什么都没有\r\n对保险行业有了更多的认识，也提供了进一步了解的可能性\r\n\r\n	2019-03-18 11:51:54.148905	f
673	212	Issue	5	计算机的本质就是逻辑，此外还有信息部分。其中信息表示部分就是数据结构，而逻辑部分就是算法。\r\n计算机与数学一脉相承。 所以数学能运用的地方，计算机都能用到。\r\n\r\n计算机与数学的区别在于信息部分，信息包含了两部分：存储与传输。\r\n\r\n计算机：计算 + 信息\r\n信息：存储 + 网络\r\n\r\n\r\n而涉及事物的地方，就与相关的专业发生关系。 如工程，社交，人体设计，美工等等。这些都是交叉学科了。	2019-03-21 20:49:12.680532	f
675	244	Issue	5	问题分类：\r\n1，补\r\n2，找，探索发现类问题\r\n3，编，开放型创新型问题\r\n\r\n探索分析法\r\n分治	2019-03-23 15:13:51.151381	f
676	303	Issue	5	英语单词的发展就是不断组合创新的过程。\r\n通常词根组成必须考虑的要素：发音，拼写(像形)，含义衍生。音，形，义三位一体。\r\n比如辅音和元音的组合使用。符合发音习惯。几乎每个语言都如此。\r\n\r\n	2019-03-24 08:37:29.139776	f
679	302	Issue	5	学英语就是一个典型例子，记住的东西总是会忘。人总是习惯做好一些准备，然后开始一些事情。\r\n而现实通常是来不及的，有了一定基础了，just do it。	2019-03-24 14:25:35.797862	f
678	272	Issue	5	人对于数据的运用还处在很初期的阶段， 每个人都需要一个随身导师。\r\n\r\n要么用脑，要么用体力。关键是体力有些问题还解决不了	2019-03-24 14:09:23.630098	f
684	323	Issue	5	产品的本质就是解决客户的问题，提升客户的综合能力。\r\n工程的本质就是如何在有限资源下最大效率，质量的完成产品	2019-03-25 23:37:26.719905	f
685	324	Issue	5	顺丰可以支持整池扩容。\r\n\r\n总结一下对于产品而言，你看重什么，你觉得问题是什么真的至关重要。有些特性真的没那么重要，真正打攻坚战就看出来了。	2019-03-26 13:56:40.221008	f
686	326	Issue	6	胡冬寅的时间安排\r\n3月30日\r\n# 6:00-8:30学习跑步洗漱早餐 \r\n# 8:30-9:30陪谢震\r\n# 9:30-18:00陪购\r\n# 18:00-21:00吃晚餐陪谢震哄睡\r\n# 21:00-22:00跑步洗漱\r\n# 22:00-23:00梳理自己的疑问，看看周日去看房和约人需要弄清楚哪些方面的问题并文字话记录下来\r\n	2019-03-29 07:29:09.269981	f
687	326	Issue	6	3月31日\r\n# 6:00-9:00学习跑步洗漱早餐打扫卫生洗衣服\r\n# 9:00-18:00看装修带谢震出去玩，查看晚上见面有哪些地方方便\r\n# 18:00-20:00约见红花姐姐\r\n# 20:00-21:00陪谢震\r\n# 21:00-22:00跑步洗漱\r\n# 22:00-23:00学习及讨论下周活动及安排\r\n	2019-03-29 07:34:52.955316	f
689	163	Issue	5	插曲一：Profiler 是如何工作的？\r\n\r\nProfiler 会启动你的程序，然后通过配置操作系统，来定期中断程序，然后进行采样。比如发送 SIGPROF 信号给被分析的进程，这样进程就会被暂停，然后切换到 Profiler 中进行分析。Profiler 则取得被分析的程序的每个线程的当前位置等信息进行统计，然后恢复程序继续执行。\r\n\r\n这个用来做静态模块分析。\r\n但是动态的，请求类型汇总，请求延时跟踪得另外做。\r\n也就是说能够得到所有输入下的性能图。	2019-03-29 13:05:11.358646	f
690	116	Issue	5	最好单独给nginx tmp挂一个分区。避免将操作系统盘撑满。	2019-03-30 12:56:48.284958	f
691	326	Issue	6	周末活动安排总结\r\n已完成活动：陪购、带谢震出去玩、约见红花姐\r\n未完成活动：看装修、大扫除、学习和跑步以及知识整理及梳理\r\n\r\n后期活动安排需注意：\r\n# 如果是外出类型的活动，一般时间不好控制，当天避免安排两件活动，专心做好一件事情即可\r\n# 关于讨论的主题我们需要提前思考和事后总结，避免晚上思考太多而推迟睡眠，影响第二天的安排\r\n# 生活中我们要怀着一颗慢下来的心态，专注于我们自己生活的每一个片段，每一分每秒都是我们自己的生活\r\n# 重要的事情按照自己既定的节奏来，一步一个脚印做好重要但不紧急的事情\r\n\r\n	2019-04-01 12:55:11.526864	f
723	355	Issue	5	beas的假设：1，对于启迪场景，数据资源是企业的核心资源，数据的使用必须受控且有偿。因而统一存储并非常态。\r\n            2，即便对于单一数据源场景，beas作为中间件也能发挥其价值。beas的核心价值在于加速查询分析，其后可能延申到智能查询。	2019-04-25 17:00:06.52191	f
724	358	Issue	5	程序员应该学会用数学知识来描述其算法。\r\n用架构知识描述其设计\r\n用工程描述其实现	2019-04-26 06:58:12.976285	f
728	356	Issue	5	Access Schema： X Y N\r\nConstraint Index： x y  count\r\n\r\nN = Max(count(Y) group by X)\r\ncount = count(x,y) group by (x,y)\r\n\r\n也就是说N是表示对于一个具体x，y最多存在多少种情况。\r\ncount是对于具体的x，y。 实际上有多少条记录。\r\n	2019-04-26 15:06:05.09006	f
648	221	Issue	5	硬件篇\r\n1，观察人的身形，精神面貌，眼神\r\n2，你有哪些业余兴趣爱好？如何锻炼身体？\r\n3，逻辑思维能力\r\n\r\n操作系统\r\n管理：\r\n1，你怎样管理你的时间？\r\n2，你一般如何调整心态？\r\n3，你觉得生活哪些方面有压力，会对哪些事情焦虑？\r\n4，如果你负责一件事情，一般会如何做？（管理与执行）\r\n5，是否足够坚韧，克服困难。\r\n6，是否具备逻辑，科学严谨。\r\n\r\n自我认知：\r\n1，你认为你有哪些优点与缺点？ \r\n   有人马虎但积极，有人细心但是苛求，有人框架思维细节不够，有人擅长规划但不能执行，有人热情但情绪化，有人勇敢尝试有人固执保守。\r\n   有人有责任心，有人开放，有爱。有人宣称自己有爱，缺无责任心，有人宣称自己开放，却不思进去。有人说自己科学严谨，但做事并不细心认真。\r\n   有人热衷抱怨不思改进。\r\n\r\n   这里主要看能否认清自己，以及是否有逻辑。\r\n\r\n2，你的人生偶像是谁？\r\n\r\n升级更新：\r\n1，数学，英语基础 （与研究能力有关系，这个通常通过毕业学校可以看出基本）\r\n2，业余时间提升自己的方法？\r\n\r\n\r\n服务能力篇（看看他的产品逻辑是否完善）：\r\n1，你热爱什么工作？之前做的比较有成就感的事情是什么？\r\n2，描述你做成了哪些有一定难度的事？难在哪里？\r\n3，认识行业关键能力，工程能力， 需求分析，设计，代码编写， review，测试方法\r\n4，对于每个小部件是否有研究。练习程度是否够？\r\n5，建议都给一个开放式的编程题做。\r\n6，专业基础知识，计算，存储，网络，工具组件等\r\n\r\n外交综合篇 (看稳定性，延展性如何)\r\n1，来公司的诉求与动机是什么？\r\n2，考虑工作的出发点，行业/平台/薪资/领导风格\r\n3, 家庭情况，已婚/单身/小孩，生活压力怎样，另一半做什么？\r\n4，一般多久会与朋友聊聊天？（交往面等）\r\n\r\n对人的诊断。	2019-03-07 10:25:16.630307	f
693	272	Issue	5	通过计算，解决问题。\r\n计算与思考是与造物主(如果存在的话)最亲近的方式。	2019-04-04 20:51:07.06618	f
677	272	Issue	5	我相信爱，包容，开放，虚心\r\n我相信梦想，同时也接受现实\r\n我相信我可以改变，以拥有创造与精神的力量。\r\n\r\n如果能爱别人，那么就能接受别人，包容别人，看到别人遭受的痛苦，同时也能指出更好的路。\r\n\r\n那些震撼人心的，美妙的人和事才是最为宝贵的。\r\n消除工作中重复的部分，让自己享受美妙的生活。\r\n\r\n我们对于自己严格要求也是因为爱，我们热爱自己的事业，就像自己的孩子一样。我们以身作则，并能真正的享受这一切。\r\n我们在从事怎样的行业，我们在辅助别人少走弯路。让企业正确的决策，使其发挥更大的社会价值。安静的死亡与有序的重生。\r\n\r\n我帮人修复其逻辑机器，如果其还没逻辑机器，我可以给它建议。就像医生医人，我们医心，人心和企业的心。\r\n我需经过刻苦而积极的思考，只能做到这些吧	2019-03-24 13:57:01.723681	f
680	302	Issue	5	不要去专门学习工具，你要做的是理解工具的精髓，能解决什么问题。 在实际使用中理解它，掌握它，改进它。\r\n重要的是建立联系，运用起来。	2019-03-24 14:37:38.073171	f
681	103	Issue	5	不要去学习一个工具。我记不住这些东西。我可以告诉你我的理解。\r\n工具需要的是一个使用手册，查多了就自然缓存了。	2019-03-24 14:44:28.495524	f
682	321	Issue	5		2019-03-24 19:24:58.972114	f
683	323	Issue	5	找到目标客户，定义好解决的问题，以科学严谨的方式提供产品。\r\n\r\nor\r\n\r\n定义好解决的问题，寻找客户\r\n\r\n这两种方式是同源的，核心都是解决客户的问题，一个是从自己内部出发，一个是从外部出发	2019-03-25 23:35:53.024524	f
688	163	Issue	5	如果将程序看为复合函数。性能分析有2个维度：\r\n1，横向，可以了解在某一个场景下，每个模块的时间占用情况。\r\n2，纵向，分析某一个输入下，函数的一次运行，每个关键函数的执行时间消耗。（相当于延时分析）\r\n\r\n尤其是针对异常性能的纵向分析，可以了解系统发生了哪些奇异事件。\r\n\r\n性能的奇异事件，应该也是监控的一部分。	2019-03-29 12:04:32.564567	f
692	103	Issue	5	学习从热爱与明确目标开始的。打羽毛球就是其中典型。包括学习计算机知识。以前都做了很多年，但是没啥长进。\r\n有了热爱，有了目标，就会有目标机器，就开始总结原则，规律。并加以锻炼，然后水平才获得较大提升。	2019-04-03 07:08:06.781485	f
695	272	Issue	5	我对一切触及本质的问题都比较感兴趣，终究是因为我想了解复杂系统的运转规律。\r\n政经法，文史哲，古今人与事。\r\n对于建立系统，以及优化系统也充满兴趣。	2019-04-04 21:57:58.806734	f
698	280	Issue	5	提升3倍方法: 精力管理*时间管理*效率。\r\n\r\n这里提升指的是达到目标的能力。	2019-04-07 06:41:50.498672	f
700	332	Issue	5	共识算法与数据同步算法确实不一样。共识算法的基础是对等角色。而数据同步算法其角色不必对等。	2019-04-09 15:01:39.408918	f
701	334	Issue	5	深度思考，而不是浮在表面上的，搜搜问题，检查下基本代码逻辑等。这些是具体工作。\r\n\r\n深度思考是要想清楚一些核心基本问题。理清整体脉络。是用来改进机器的。而不是运转机器的。	2019-04-09 16:25:46.256886	f
694	293	Issue	5	另外系统可以有一个强大的仿真方法。比如针对某个输入或一组输入。我们通过记录每个函数的返回值。可以通过特定方式注入，然后模拟出来在该系列输入下，软件的行为。由此问题基本上是必现的。\r\n\r\n还有些模块可能具备累计效应，运行N多天才累计出问题。能否搞个时间模拟器，10分钟模拟出一天的效果。\r\n\r\n性能波动分析与疑难bug定位是消耗时间最多的地方。得有一个黑匣子(比如用数据库实现)，来分析系统的疑难问题。\r\n运用切片编程技术，实现黑匣子	2019-04-04 21:21:21.37795	f
696	329	Issue	5	三杰和陈平确实挺有意思。情商高的人洞悉人性，善于扑捉人情变化。阴谋搞短期战术，阳谋搞长期战略。\r\n\r\nhttps://www.zhihu.com/question/20764782，这里面提及的萧何有点意思，刘邦越败越强。\r\n\r\n刘邦 政治外交权术用人都玩的比较6，且利益分配搞得不错。	2019-04-04 23:06:55.732699	f
697	329	Issue	5	关于男女：https://www.douban.com/note/154731196/	2019-04-04 23:08:28.387731	f
699	215	Issue	5	1，如果在meta同步尚未完成的情况下，切换master会导致bucket始终无法同步。原因可能是触发bucket同步之后，其向新的master，也就是自己同步。这样必然同步失败。\r\n2，在一端删除bucket时，另一站点的数据没法正常删除。	2019-04-09 07:47:28.498816	f
702	216	Issue	5	最近思路;分2层，第一层仍然使用hash。第二层使用range index（或hash index加内存排序)。第二层放在一个rados对象+多个附属对象上。\r\n附属对象的作用是降低恢复成本。同时使用range方式。附属对象还可以缩小查找范围。\r\n\r\n用cls和附属对象实现一个range index。可定义每个index比如1万个key。	2019-04-15 08:35:34.796068	f
703	21	Issue	5	[root@wade3hao74b2 ceph]# xfs_db -r -c "sb 0" -c "p" -c "freesp -s " /dev/sdd\r\n\r\n   from      to extents  blocks    pct\r\n      1       1    2004    2004   0.01\r\n      2       3     507    1297   0.01\r\n      4       7    1020    5474   0.02\r\n      8      15    4020   51071   0.20\r\n     16      31 1124566 25807052  99.77\r\n\r\n比如这种情况\r\n[root@wade3hao74b2 ceph]# xfs_info /dev/sdd\r\nmeta-data=/dev/sdd               isize=2048   agcount=4, agsize=15262412 blks\r\n         =                       sectsz=512   attr=2, projid32bit=1\r\n         =                       crc=0        finobt=0\r\ndata     =                       bsize=4096   blocks=61049646, imaxpct=25\r\n         =                       sunit=0      swidth=0 blks\r\nnaming   =version 2              bsize=4096   ascii-ci=0 ftype=0\r\nlog      =internal               bsize=4096   blocks=29809, version=2\r\n         =                       sectsz=512   sunit=0 blks, lazy-count=1\r\nrealtime =none                   extsz=4096   blocks=0, rtextents=0\r\n\r\ninode是2048，64个inodesize就是32个block。上述磁盘没有连续的32个block了。因而无法分配inode。报空间不够的错误。	2019-04-15 08:50:08.677897	f
704	336	Issue	5		2019-04-15 14:07:56.791527	f
705	336	Issue	5		2019-04-15 14:08:26.870096	f
706	240	Issue	5	机器：\r\n为何存在，目的是什么？\r\n是否合适？\r\n适用场景？\r\n优缺点分析，核心缺陷？\r\n在哪些情况下发生变化？\r\n涉及哪些外部交互？\r\n故障场景？\r\n是否会升级?\r\n出问题如何分析？	2019-04-15 14:24:43.591964	f
707	274	Issue	5	数据挖掘就是人提供了算法，参数。现有计算机系统基本都是这种模型的。\r\nAI是提供了通用基础算法，然后利用输入，输出训练具体算法。这就是学习。\r\n	2019-04-16 12:24:30.771947	f
709	341	Issue	5	beas将metadata，constraint index，sampling的数据在本地化存储。\r\n利用这些数据可生成查询计划。	2019-04-22 12:52:55.022819	f
710	341	Issue	5	目前看不到核心重点，以及难点在哪里?\r\n\r\n查询引擎如何高效的使用索引数据？\r\n现在的查询引擎如何运用采样或索引数据，来制定查询计划？\r\n以后是否需支持分布式？TiDB的计算架构？整体的存储计算架构。	2019-04-22 13:07:06.909384	f
711	341	Issue	5	需求：\r\n索引数据是怎样存储的？\r\nmetadata如何存储，是建同样的表么？如何区分不同库的不同表？\r\n采样数据是什么样的？怎么存储？\r\n字段可在线增加么？索引字段变更？\r\n\r\n	2019-04-22 13:11:13.25566	f
712	340	Issue	5	win10-ubuntu: xierui/xierui\r\npostgresql: xierui/Anew***422	2019-04-22 14:33:28.860757	f
714	342	Issue	5	R={x | x不属于x }，然后现在问R是否属于R。如果R不属于R，那么根据定义，R属于R；如果R属于R，那么根据定义，R不属于R。\r\n\r\n| 后面可理解为一种关系: x不属于x 对应于 x不属于自己理发的人	2019-04-23 10:41:18.587824	f
715	341	Issue	5	1，整体模块架构\r\n2，整体进程架构，以及交互\r\n3，配置管理\r\n4，日志管理\r\n5，系统内部状态监控\r\n6，cache设计\r\n7，元数据存储，索引，数据存储结构\r\n8，内部管理\r\n9，通信模块\r\n10，核心算法\r\n11.工具	2019-04-23 13:48:20.901958	f
716	341	Issue	5	我也认为对象数据库是一个失败的尝试：\r\nhttps://zh.wikipedia.org/wiki/%E5%AF%B9%E8%B1%A1%E6%95%B0%E6%8D%AE%E5%BA%93	2019-04-23 14:10:25.375228	f
717	341	Issue	5	BgWriter和WalWriter工作模式都有点奇怪，在其异常时，postgres进程又能自行做这些工作。\r\nPGarch比较好理解，通过保存全量的wal日志来追踪所有的数据修改，然后实现任意时间点的数据恢复。	2019-04-23 15:01:52.311819	f
708	280	Issue	5	我相信每个人都有无限潜能\r\n我相信每个人都可以过得更好\r\n\r\nso：\r\n我选择乐观，而不是悲观\r\n我选择开放，而不是封闭\r\n我选择按计划自律生活，而不是随心所欲\r\n我选择接收现实并着手改变，而不是防御\r\n我选择有趣，而不是boring\r\n\r\n世界是逻辑的，以目标逻辑机器的方式运作自己的系统。\r\n人生是一种旅途，体验各种感觉。\r\n没有所谓的价值与对错，只有适合当下的选择。生存或死亡都是选择。但不能南辕北辙。\r\n\r\n3.0版本，个人角色是高级软件工程师。把4台机器运转好。\r\n3.0版本，我想重构自己的思维模式，从数学基础来思考问题，而不是从一个形式到另一个形式的关联分析与归纳。\r\n明确算法理论与工程实现。算法理论是经骨，工程实现是皮肉。	2019-04-21 14:54:32.678506	f
718	346	Issue	5	牛顿和莱布尼茨的时代真是牛逼。微积分和数理逻辑的起源都在那个时候。符号化，证明是这一切的根源。哲学促进了科学的发展。\r\n\r\n而欧洲那时候需要数学也是因为资本主义的发展需要。。。	2019-04-24 06:48:56.206361	f
289	39	Issue	5	有一点不明白的是为什么filestore放置的时候，采用hash的反序？ \r\nhash根据取模运算之后，hash的后几位决定了在那个pg，在pg内部后几位是非常接近的。为什么还要反序呢？\r\n这样岂不是会加深目录层次？\r\n\r\n反序是为了方便pg分裂，pg分裂的时候需根据hash来分割对象。	2018-08-17 15:25:06.242833	f
719	347	Issue	5	比如面试时，我想知道一个人的交通信息，一个人的犯罪信息。提交的代码量，参与项目的情况。 最终得到一个值是否通过面试。\r\n\r\n这就是一套算法。	2019-04-24 09:23:39.658886	f
770	359	Issue	5		2019-05-07 09:18:33.949761	f
740	359	Issue	5	Schema使用例子：\r\n存在一张学生日志记录表，其中日志中有日期，天气，作者，事件等信息。\r\n另外还有一张表记录了某个学生请假的情况，有学生，请假，日期。\r\n\r\n现在想分析学生请假与下雨的关系。\r\n这样可使用schema：日期->天气\r\n学生日志记录表可抽取 日期|天气的子表。其记录数量远小于学生日志记录表。\r\n\r\n由此说来存在子表通常更可能出现在表设计没有充分分解的情况。如果将日志记录表拆开。\r\n日期，作者，事件\r\n日期，天气\r\n这样就不存在问题。	2019-04-28 12:11:31.220642	f
713	342	Issue	5	第一次数学危机起源于根号2，结束于无理数的定义。\r\n第二次数学危机是关于无限分割空间和时间的。实际上我们知道对2无线分割，比如1+1/2+1/4 好像可以无限加下去，应该是个无穷大的数。然后实际上不可能超过2.\r\n第二次数据危机的解决与级数和微积分相关。\r\nhttps://zh.wikipedia.org/wiki/%E6%9E%81%E9%99%90_(%E6%95%B0%E5%AD%A6)\r\n\r\n第三次数据危机\r\nhttps://baike.baidu.com/item/ZF%E5%85%AC%E7%90%86%E7%B3%BB%E7%BB%9F\r\n\r\n我没理解罗素悖论的本质。一个难题是如何将现实中的问题抽象的逻辑问题？\r\n\r\n罗素悖论的逻辑描述：（？？？怎么抽象的）\r\n如果存在一个集合A={x | x∉ A }，那么A∈A是否成立？如果它成立，那么x∈A，不满足A的特征性质。如果它不成立，A就满足了特征性质。\r\n\r\nhttps://baike.baidu.com/item/ZF%E5%85%AC%E7%90%86%E7%B3%BB%E7%BB%9F\r\n(8)正则公理：也叫基础公理。所有集都是良基集。说明一个集合的元素都具有最小性质，例如，不允许出现x属于x的情况。\r\n准确的定义：“对任意非空集合x，x至少有一元素y使x∩y为空集。”\r\n以上8条公理组成了ZF公理系统，再加上选择公理，则组成了ZFC公理系统。\r\n\r\n这里理解吧，如果性质定义了一个集合。朴素集合论认为元素要么属于集合，要么不属于集合。\r\n罗素悖论的意思是存在性质，使得一个元素既无法属于集合，也没法不属于集合。 就是说性质描述可能存在矛盾。\r\n\r\n那么这个矛盾一定是自己导致的吗？ 自我相关导致的？\r\n\r\n\r\n<pre><code class="text">\r\n理发师悖论可以表达成集合论的形式，就是罗素悖论。R={x | x不属于x }，然后现在问R是否属于R。\r\n如果R不属于R，那么根据定义，R属于R；如果R属于R，那么根据定义，R不属于R。基于这两种不同的数学哲学基础，\r\n面对悖论问题时，可以得出很不相同的分析方式和解决方式。一百年前出现罗素悖论的时候，\r\n数学家们普通接受“发现”的数学哲学观点，当数学出现悖论的时候，就觉得天塌下来了：我的上帝，\r\n是不是客观真理出问题了，或者上帝旨意出问题了？如果是以维氏“发明”的数学哲学观点，\r\n就觉得没有什么大不了的，根本不是客观真理出问题了，而是数学家主观观念出问题了。数学家构造的规则矛盾了，\r\n在矛盾的地方再构造一个新规则就是了。举个例子，就像一开始根据乘法来定义除法a/b=c iff a=b*c，就会得出0/0=2=3这样的矛盾。\r\n怎么解决这里的矛盾呢？难道要取消所有的除法？当然不是了，只需要在矛盾的地方重新定义一下：0不能作除数。瞧，问题就解决了。\r\n\r\n作者：庄朝晖\r\n链接：https://www.zhihu.com/question/20511488/answer/128130551\r\n来源：知乎\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\r\n</code></pre>\r\n\r\n	2019-04-23 07:00:36.45853	f
722	353	Issue	5		2019-04-25 09:27:07.899128	f
725	359	Issue	5		2019-04-26 08:47:07.111387	f
726	361	Issue	5	SysCache很简单就是一个数组，定长的。\r\nVFS时一个LRU链表，用来管理VfdCache。\r\nRelCache是用hash表来存的。因为变化少，且不必排序。\r\n共享缓存区采用hash加freelist来管理\r\n本地缓冲池也采用hash管理，利用文件块信息来创建和管理。	2019-04-26 09:00:00.414462	f
727	360	Issue	5	比如一个问题，我在内存中缓存了schema，但是在另外一个pg实例中删除了。可能导致查询计划无效。这时pg是返回错误吗？还是修改查询计划？\r\n\r\ncache的作用在于减少查询，如果要加表锁，实际操作仍然需在下面执行的。	2019-04-26 09:12:04.353944	f
729	355	Issue	5	Executor要考虑迭代算子\r\n基于结果的缓存，物化视图，从而对于后续查询可以优化。 比如查询a>1,与后续查询a>2， 就存在重用情况。	2019-04-26 15:08:09.253913	f
743	366	Issue	5		2019-04-28 14:09:55.226877	f
731	359	Issue	5	目前bounded query是只考虑等值条件的。实际上bounded query是思想就是index，只是这个index可能不那么显而易见。 其实有一个合适的DBA，识别出索引就可以解决这个问题。\r\n自动索引技术。\r\n\r\nno，等值是在传递条件。但bounded本身是索引。而且Access Schema如何跨table还是一个复杂的问题。\r\n\r\nc1->c2,c2->c3. 可以推导出c1->c3.\r\n\r\n等值条件对于bound，就是范围是有影响的。即便不是等值条件，Schema也有其存在价值。	2019-04-27 09:04:47.209947	f
732	356	Issue	5	在同一个表传递schema的时候存在放大的情况是指\r\nc1=1，c1->c2,c2->c3 求笛卡尔积，则最终结果还得使用c1=1来约束，否则就存在放大的情况。	2019-04-27 11:59:05.290744	f
734	359	Issue	5	实际上AccessSchema就是大表中存在的一个小表。而且这个表上应该建index。所谓constraint index其实就是小表的内容。\r\n对于beas而言，甚至可以把常用的表即便没有AccessSchema拉取到本地。而AccessSchema本身就是一个小表。\r\n\r\n这样就比较好举例了，比如在日志中收集每天的天气信息。这样就可以形成一个小表。	2019-04-28 06:40:52.429021	f
735	76	Issue	5	总结：在该次重构中，存在2个大问题。\r\n1，重构机会难得，但是未能做彻底，虽然有时间上的约束，但是考虑不全面才是根因。\r\n比如元数据规模缩减，多站点重构，关于bucket跨pool的抽象处理等\r\n\r\n2，未考虑由此带来的安装，升级，以及性能上的深刻影响。\r\n这点就显得在工程上不是很专业了。一个大的改动如果不深入分析每个地方的影响显然是不合适的。	2019-04-28 07:30:40.822788	f
736	240	Issue	5	当对当前工程改动或设计子模块时，理应从各种维度去分析，而不是像哲学思考一样快刀斩乱麻，还得考虑各个相关部分如何做。（请参考BI改造任务的总结）。\r\n所以实际上事情还是非常多的。而且得对现在系统有非常深入的理解。\r\n\r\n模块拆分与特性树：欧博与yy让我见识到对单个任务“分解与合作”的玩法。我之前更喜欢由每个人持续完成一个任务，但是这样一方面任务太大，一个人可能难以完成且缺乏讨论。\r\n\r\n工程有趣在于其考虑实用性，效率，以及可发展性等等涉及人与资源方面的考量。而科学更侧重问题的解决算法。	2019-04-28 07:41:53.638802	f
737	359	Issue	5	1，AccessSchema相当于子表，这样理解则可以看AccessSchema看成一种特别的RelSchema，而ConstraintIndex其实就AccessSchema的内容。\r\n  这样可以整体将其看成一张表。\r\n2，AccessSchema上可能需要建立X上的索引，方便查找。\r\n3，主键到其他字段存在Schema，PrimaryKey→Y, 1,而PrimayKey本身有索引。\r\n4，C1->C2,C2→C3,在什么情况下考虑提前生成C1→C3,自动过程还是手动。\r\n5，对于频繁访问的某个表，对于beas也可以加载以获取加速。\r\n6，AccessSchema的访问统计，自动淘汰	2019-04-28 07:54:12.602087	f
745	122	Issue	5	还有非常重要的是：任务划分，另外团队中是否有人掉队也是需考虑的。\r\n任务划分有时候需独立，但重大任务需要协作，并做内部分工，且需要更多人参与讨论。\r\n\r\n管理需发挥集体智慧。\r\n\r\n当一个任务中，有人在理解执行上掉队了，可能就无法发挥很好的价值。这是作为leader需要关注的。\r\n\r\n现实情况人不合适，完不成任务就干掉，换其他人 不一定很合适。\r\n尤其是团队内部，要区分其可能跟上与完全没法胜任的情况。	2019-04-28 14:19:36.417911	f
748	367	Issue	5	beas的执行框架，日志系统，以及后续延展有更大的空间，否则你穿上pg的架子，最终受其影响必然很大。	2019-04-29 07:19:56.663317	f
746	364	Issue	5	1，buffer与事务并发控制的锁有何关系？\r\n  没有关系，锁是通过LockTag定位的，锁存储与记录没任何关系。 这是pg单实例运行决定的。\r\n\r\n2，脏buffer是整体写回么\r\n  这个估计是的。不过通常空间分配是追加的，除非空洞情况。这也有vacuum来处理。\r\n\r\n3，如何通知buffer失效。\r\n不存在，buffer本身就在共享内存中。本地缓冲区仅用于本地临时可见的表。\r\n\r\n4，为什么关闭表需写回脏页？放在后面由WalWriter写回不行么？WalWriter挂掉的情况？\r\n\r\n5，进程挂掉时，如何保证所有状态的正常清理，如锁，buffer的pin，lock	2019-04-28 14:24:45.023461	f
749	367	Issue	5	把beas丢到其他框架，需考虑其框架是否满足pg的发展要求。\r\n而自定义beas框架，同样也需搞清楚beas需要的架构是什么？\r\n\r\n在其他框架上做，实现上阻碍：\r\n1，不改动pg函数，而是新增函数。显然做不到，至少得在原来逻辑上加不同分支吧\r\n2，要在pg内注册大量的勾子与新增定义。而将pg定义为子模块，则实现一个wrapper层就可以了。\r\n\r\n感觉将beas包pg，这样修改的侵入式应该更低，也更可控。\r\n1，线程模型，执行模型可控\r\n2，调度过程可控	2019-04-29 07:45:02.265066	f
773	373	Issue	5	是否存在在beas中使用pg中特定的MemoryContext来分配内存的情况\r\n是否存在在beas中创建pg的新的MemoryContext情况？\r\n\r\n应该都不存在。	2019-05-07 18:25:10.498289	f
730	359	Issue	5	索引存在的关系：\r\n\r\n显式关系：\r\nX->常量  N\r\nX->Y     N\r\nX1->X2   N (同一个表)\r\n\r\n隐式关系：\r\nX1->X2\r\nX->Y,Y->Z => X->Z\r\n\r\n操作：\r\n1，查找从表A字段x出发到表B存在关系\r\n2，从表A出发到表B存在的关系（约束：表A的查询需在B之前）\r\n\r\n举例：\r\n1，直接查找 \r\nC1->B2. 查找C1，B3 where C1=1 and C1=B2\r\n\r\n2，根据表内的隐式关系\r\nC2->B2, 查找C1，B3 where C1=1 and C3=B2\r\n可利用C1->C2，C2->B2的关系, Fetch B时使用C2->B2?\r\n不这个逻辑是错误的，Schema的含义就是constraint index，要使用index必须有等值条件。\r\n\r\n我们是通过等值条件来搜索索引。这点不论有没constraint index都是一样的。（我们的目标就是看是否所有的等值条件都有索引） （*其实非等值条件也是可以考虑的*）\r\n\r\n\r\n \r\n	2019-04-27 07:54:12.186091	f
733	356	Issue	5	存在主键的情况，主键对于其他列都是以1 bounded的。\r\nconstraint index实际上是表，而非索引。	2019-04-27 13:45:26.655018	f
761	373	Issue	5	pg内存管理分析：\r\npg内存被memcontext接管，可以定义一个模块。定义初始化函数注入函数指针。这样可间接使用pg的内存管理机制。\r\npg有palloc，repalloc，pfree等函数。 也可注入jemalloc函数等。以中间件的方式使用内存。\r\n\r\n*内存管理主要2问题：\r\n1，如何在并发，多核，以及不同使用场景(分配的大小，以及分配释放的特征)等情况下高效的管理内存\r\n2，如何避免内存泄漏*\r\n\r\n高效率的分配，以及内存泄漏检测jemalloc和tcmalloc都有现成的。\r\n有种场景是可以利用利用率来换取内存分配速度。比如常见的freelist内存池管理。	2019-05-05 07:23:26.546895	f
738	361	Issue	5	SysCache缓存了所有系统表元组，其中每个表的元组在内存中为CatCache结构管理。\r\n系统表本身是用cachedesc结构来描述的，存在静态数组cacheinfo中，CatCahce中的Cat可能是Cataog的简写。\r\nSysCache中的具体元组不是一次性加载的，随着系统运行加载。\r\n\r\nCatCache是用hash组织其中的元组的，同一个桶内用双向链表组织。\r\nCatCache中的元组结构体为CatCTup。\r\n\r\n查找：CatCache中的元组，其hash值可以从最多4个key组合计算而来。\r\n\r\nRelCache的管理更为简单，因为其变化更少。直接根据oid Hash查找即可。\r\n\r\n*Cache的同步都是在事务完成之后进行的，有个问题，如果其他postgres用到了对应的数据，是否都需要在加锁成功(假设资源先被其他事务占据)之后刷新Cache？*\r\n\r\n这个是有处理的，参考AcceptInvalidationMessages调用的地方就明白了	2019-04-28 08:56:46.924991	f
739	361	Issue	5		2019-04-28 09:07:33.351868	f
741	359	Issue	5	根据beas面临的io特征，考虑AccessSchema，以及索引的组织。 更夸张点，AccessSchema是否可以其他方式存储。而非pg的数据组织方式。\r\nAccessSchema是否采用全内存组织？	2019-04-28 12:36:01.840401	f
742	355	Issue	5	beas是做到pg内，还是pg外？ 如果算子类本身就是pg的扩展，那么是否需要抽象成与pg无关，这似乎不是很有必要。\r\n虽然号称解耦，但逻辑上本身就有耦合性。	2019-04-28 13:54:11.938912	f
744	357	Issue	5	这是一个很大的问题，其实之前在华为工作就有这点，每个人的信息量不一样，当我们不具备或不去收集需要进行决策的信息时，我们就没法深入讨论，也就没法跟着团队一同往前走。\r\n最终效果可能就变成了只能做些局部功能。	2019-04-28 14:14:51.278163	f
747	368	Issue	5		2019-04-28 15:06:23.082001	f
752	115	Issue	5	例子1：\r\nLinux上vim保存文件默认使用utf8，编译时指定使用GB2312 ，则输出为乱码：\r\n[root@iZwz9h8nr0sr6y7lz3hih4Z c_code]# gcc -o test test.c -fexec-charset=GB2312 \r\n[root@iZwz9h8nr0sr6y7lz3hih4Z c_code]# ./test\r\nא¹򯜚\r\n\r\n	2019-04-29 14:59:32.905424	f
753	280	Issue	5	成为一个真正的程序员（Coder），而不是码农。	2019-04-29 15:04:14.489883	f
756	375	Issue	5		2019-05-04 04:36:29.613162	f
758	375	Issue	5		2019-05-04 04:39:11.151195	f
763	378	Issue	5		2019-05-05 16:52:09.001205	f
760	373	Issue	5	内存管理：\r\n1，每次执行做一次内存分配，还是所有内存都初始化分配好？\r\n是否考虑采用jemalloc？似乎没必要，目前是单进程模型。\r\n\r\nmysql内存管理分析\r\n\r\n2，对于后续的内存加速这块，对于内存分配的要求。\r\n这个应该是必须的，内存用来加速分析应该是典型场景了。但是对于pg，这个是不是得搞共享内存了。\r\n\r\nredis内存管理分析。\r\n\r\n\r\n	2019-05-05 06:53:21.016394	f
765	370	Issue	5	E8. 蕴含等值式 \r\n理解：很重要的逻辑等价式，证明可以通过真值表验证。\r\n\r\nE8. A→B╞╡¬A∨B \r\n\r\n\r\nE17.等价等值式II \r\n理解：如果两个命题等价：要么这两个命题都成立，要么这两个命题都不成立。\r\n\r\nE17. A↔B╞╡(A∧B)∨(¬A∧¬B)\r\n\r\n	2019-05-06 19:58:11.226519	f
767	353	Issue	5	可以看到的是，如果仅通过形式系统本身的公理 \\ 规则，是很难（或者说不可能）在有限的步骤内判定一个命题公式是否是该形式系统内的定理的；PC 系统也是如此。而同构的方式可以很好的解决这个问题。 PC 系统本身也具有自己的同构系统：真值函数运算系统。因此，判定 PC 系统中的命题公式是否为定理就非常简单了：我们只需要用真值表判断命题公式对应的真值函数是否是重言式，就可以判断该命题公式是否是 PC 中的定理。 而利用真值表计算代替使用PC系统自身元素推演，就像是利用数论解决MIU系统的难题一样，有一个最大的优势：前者的计算都是可以在有限步骤内完成的。\r\n\r\nMIU那个神奇的例子，居然通过数字化310，可证明MU不属于符号系统MIU。	2019-05-06 20:10:10.730279	f
750	359	Issue	5	1，通过Admin Tool/PGSql发起CreateAccessConstraint的DDL命令\r\n2，Parser解析CreateAccessConstraint命令\r\n3，执行CreateAccessConstraint命令\r\n  3.1 检验AccessConstraint对应的表和字段合法性\r\n  3.2 在AccessSchema系统表中存储AccessConstraint\r\n  3.3 创建ConstraintIndex表，并在其上建立基于X（X可能是多列）的索引，并用源表数据填充其内容\r\n  3.4 更新AccessSchemaCache\r\n4，返回DDL执行结果\r\n\r\n待确定：\r\n1，AccessConstraint支持跨表，跨库（暂不支持）\r\n2，C1->C2,C2→C3,在什么情况下考虑提前生成C1→C3,自动过程还是手动。（最小系统先不考虑）\r\n3，对于频繁访问的某个表，对于beas也可以加载以获取加速。（最小系统先不考虑）\r\n4，AccessSchema的访问统计，自动淘汰。（最小系统先不考虑）\r\n\r\n子功能拆分：\r\n1，支持创建Access Schema命令\r\n涉及模块：Parser，Utility， Command，Catelog， Cache\r\n输入：SQL字符串\r\n输出：执行结果\r\n任务描述：\r\n解析SQL字符串\r\n CreateAccessSchema的执行，包括语义合法性检查，创建ConstraintIndex表，以及索引等。\r\n AccessSchemaCache的更新\r\n异常场景：\r\nSQL命令格式错误，返回错误\r\nSQL命令内容错误，如表或字段非法等，返回错误\r\n技术点：\r\n    ConstraintIndex内容加载的时机，以及状态管理。\r\n\r\n2，查询某个表或表字段（可能多个），是否存在对应的AccessSchema\r\n涉及模块：AccessSchemaCache，Catelog\r\n输入：表，字段\r\n输出：对应的AccessConstraint描述符列表\r\n任务描述：\r\n     1，从AccessSchemaCache中找出相关表的所有存在的AccessSchema\r\n     2，找出某个字段存在的AccessSchema\r\n异常场景：\r\n技术点：\r\n   组织方式\r\n\r\n3，提供接口，支持向ConstraintIndex中插入或删除数据\r\n涉及模块：DML\r\n输入：SQL\r\n输出：执行结果\r\n任务描述：\r\n     1，在数据变化时，根据变化情况更新ConstaintIndex。\r\n技术点：\r\n    这里源表的update，需根据old tuple/new tuple一起刷新ConstraintIndex	2019-04-29 14:05:09.504529	f
751	373	Issue	5	1，字符编码问题\r\n2，字符串提供的功能，比如搜索？查找，判断是否为数字，转换等等\r\n3，内存管理考虑的重点是减少内存拷贝且安全的使用？	2019-04-29 14:40:29.265288	f
754	368	Issue	5	https://www.toutiao.com/a6672612422768919054/?tt_from=weixin&utm_campaign=client_share&wxshare_count=1&timestamp=1556530757&app=news_article&utm_source=weixin&utm_medium=toutiao_ios&req_id=2019042917391601002905119484405E5&group_id=6672612422768919054\r\n\r\n一些比较形象的比喻	2019-04-29 15:30:06.608038	f
771	373	Issue	1	内存管理：\r\nbeas的内存使用存在两种情况，1是beas内使用，pg释放。2是beas使用，beas释放。\r\n原则上在beas内可释放的内存，不能延迟到pg释放。\r\n\r\n因而这里有两种MemAllocator，一种是PgAllocator，另一种是BeasAllocator。\r\n在调用内存管理接口时，根据需要传入不同的Allocator。\r\n\r\nbeas内存管理不做类pg上下文管理，pg调用beas函数之前需切换好上下文。\r\n\r\n需考虑共享内存的情况，比如在多个beas实例共享，同步数据等。\r\n\r\n字符串：\r\nSds将内存分配从字符串中剥离出来。封装字符串结构，除了封装字符串的特定优化操作外，\r\n其他字符串函数面向C字符串，从而避免使用时需额外从char *转换到Sds。	2019-05-07 14:50:49.704577	f
755	345	Issue	5	1：A = {y为自己 | Q(y) } 给自己理发的人。\r\n2：Q(x) = x不属于A\r\n\r\n从这个定义看本身就蕴含矛盾。\r\n如果理发师M属于A，则Q(x)为真，M不应该属于A。\r\n如果从2出发，理发师M不属于A。Q(x)为真，则可推出理发师M属于A。\r\n从理发师角度出发上述可描述为：\r\n1：A = {x | Q(x)} \r\n2: Q(x) = x不属于A\r\n这是给自己理发的人的精确描述，假设岛上所有人均可能是理发师。\r\nA就是描述所有给自己理发的人。Q(x)描述的命题为给x理发。\r\n理发师的描述为：\r\nA = { x | 存在y，满足Q(y) }，理发师至少给某个人理发，可以是自己也可以是别人。\r\n给自己理发的人：\r\nB = {x | Q(x)} \r\nB属于A	2019-05-02 19:07:01.980005	f
757	375	Issue	5		2019-05-04 04:37:57.415766	f
759	372	Issue	5	2，提前半小时准备入睡，所以最晚时间是10：30\r\n3，不要过度运动，过度饮食，否则长期无法恢复。\r\n4，不要在家里安排个人学习，家里可安排交流类，放假期间可安排交际等等。	2019-05-05 06:36:08.71394	f
768	346	Issue	5	数理逻辑，形式逻辑是其他一切，包括集合论的基础，凡是涉及符号系统，以及证明类。都与数理逻辑有关系。\r\n所以数理逻辑是离散数学的第一章	2019-05-06 20:22:52.515745	f
762	373	Issue	5	这个c的字符串库应该可以满足要求：\r\nhttps://github.com/antirez/sds\r\n调研清楚，看是否满足要求，这里涉及一次类型转换。\r\n\r\n*动态字符串，主要解决char*没有记录字符串长度引起的低效，以及越界问题。*\r\nhttps://stackoverflow.com/questions/4688041/good-c-string-library\r\n好像sds比bstring更受欢迎，基本确定就基于sds了。	2019-05-05 09:14:26.401778	f
764	373	Issue	5	在使用pg过程中，内存分配在使用上存在哪些坑。\r\nMemoryContext释放也有讲究，有的是reset，有的内存是直接释放的。意外情况具体指什么呢？ pg出错跳转有何特别？\r\n\r\n梳理清理事务执行期间相关的MemoryContext。\r\n\r\nfree之后自动将指针置为空。增加内存泄漏的自动检测？\r\n\r\n议题：\r\n1，有没必要设计内存泄露检测机制\r\n2，有没必要设计打桩，以验证程序在内存不足时的行为。\r\n3, pg内存分配\r\n  pg的内存接口在palloc.h中，其中使用palloc与MemoryContextAlloc的都有\r\n  而MemmoryContext的管理主要在memutils.h中\r\n\r\n4，一种内存分配方式够用么？是否提供多种抽象？有default，但是也可以没有？\r\n5，短期内存的分配与使用。\r\n  常用内存分配算法有堆内存分配，伙伴算法，slab算法\r\n6，内存对齐\r\n7，在没有额外支持情况下，仅仅靠对malloc接口封装，可能难以支持内存池管理的扩展需求，\r\n还是这些扩展需求放到上层来实现。	2019-05-05 17:17:28.112476	f
772	366	Issue	1	目前看工作量过大，主要是pg无法作为独立的库，其中有大量的全局变量等。	2019-05-07 14:56:02.809029	f
769	359	Issue	5	按照最新讨论AccessSchema不能存为\r\nX，Y， count。  还要包含X，Y对应的tupleid。否则在没Cover住的情况下，其他列获取效率就比较低了。\r\n这时存在4种扫描方式：\r\n1，全表扫描\r\n2，利用条件，下推做全表扫描（比如仅有条件a=1）\r\n3，利用原表的索引（a上建立了索引）\r\n4，利用tupleid（这是最高效的方式，因此需记录tupleid）\r\n\r\n那么问题来了，X，Y对应的tupleid有多个，如何存储于检索，另外如何在表存在多个schema时，避免冗余存储？\r\n\r\n另外一个问题是跨表跨库的AccessSchema.\r\nR1(w,x),R2(w,y)\r\nAccessSchema存储为（W，X，Y，R1_tpuleids，R2_tupeids, count）,这样count不是针对x，y。如果在x，y上执行count，需额外执行一次计数操作。\r\n\r\n	2019-05-07 08:58:55.525271	f
804	398	Issue	5	https://segmentfault.com/a/1190000008949574\r\n\r\nextern关键词，可以扩大声明的作用范围。\r\n也可以把extern加在变量定义前面，但这没什么卵用。默认就是extern的。\r\nextern "C" 中的extern显然也没什么卵用，这是一个固定用法，告诉编译器用C方式编译代码。	2019-05-14 15:15:19.854608	f
806	397	Issue	5	宏定义：编译期间替换。\r\n\r\n宏定义做符号替换，不会实际运算。\r\n预编译的宏是需在编译期间就确定的，比如struct A##x，如果x是变量就没法编译通过。	2019-05-14 18:26:38.360529	f
807	371	Issue	5	数学通过符号抽象，通过演绎证明，等价转换去理解复杂事务。	2019-05-14 18:35:30.859089	f
774	373	Issue	5	问题1：根据内部使用与外部使用分2套接口函数，还是统一使用一套接口函数？\r\n问题2：是否需要提供Reset等接口？如何看待宿主与beas关系？\r\n  对于beas而言，需要的部分是内存分配。宿主需要有最终释放内存的能力。\r\n  增加Reset接口是对这种能力的一种约束。\r\n  问题2.1 PG是如何管理内存的，在何时reset。怎么切换MemoryContext？什么情况下提前释放MemoryContext。\r\n问题3：context，尤其是具体类型的context，是由宿主来管理的。beas提供的是算法，而数据的主体在宿主中。\r\n比如CurMemoryAllocator这种显然不合适，greenplum可能没这个概念。然后对接greenplum相关分配内存都得修改？\r\n只能让宿主提供具体实现。\r\n  \r\n  问题3.1，如果beas需要根据需求，将不同的内存挂在具有不同生命周期的MemoryContext上，则必须感知不同的MemoryContext。\r\n而问题是在不同系统中，不同的管理方式对应的MemoryContext是不一样的。\r\n           一种解决方法是增加约束：beas只能在当前上下文分配外部的内存。\r\n           二是beas根据自身需要，不得已情况下定义不同类型的宿主Allocator，让宿主决定如何具体实现。	2019-05-08 15:15:24.23602	f
775	369	Issue	5	模式与实现分离，不要随意为了实现而变更设计，这样就会犯理论上的错误。\r\n\r\n给问题一个明确的定义，甚至一个理论上的定义。然后再按层次分解问题。	2019-05-08 15:27:02.433122	f
811	402	Issue	5		2019-05-16 08:19:51.748535	f
813	402	Issue	5	安全函数是否需考虑 拷贝或cat的源与目的存在内存重叠的情况\r\nbstring的拷贝也是用memcpy实现的，要不要考虑memmove的场景。	2019-05-16 09:37:25.459067	f
779	384	Issue	5	BSP，Hadoop，Spark，Orca，GreenPlum，Flink，Calcite，NLP(自然语言->SQL)\r\n\r\nRedshift（也是基于pg，提供行存和列存等等），GreenPlum 数仓产品\r\n\r\nHive，HAWQ， SparkSql\r\n\r\nGreenPlumDB缩写为GPDB	2019-05-09 17:49:06.649144	f
782	384	Issue	5	https://db-engines.com/en/ranking\r\n\r\n数据库产品真实五花八门。\r\n\r\n即便是同一种类型的也有很多款	2019-05-09 20:11:35.652805	f
783	373	Issue	5	不修改sds，新增将一段内存转换为sds的接口。原先sds跟内存相关的接口屏蔽掉。\r\nsds是一个结构体。当然也是一个char *，sds使用时当作char *完全没问题。唯一需注意的是释放的时候。\r\n\r\n如果sds之外，提供一组字符串安全操作的函数。	2019-05-10 06:55:14.593076	f
786	386	Issue	5	在Constraint Index中存储tid/rowid主要是解决数据变更时，刷新CI的问题？\r\n另外存储tid/rowid可提供一种新的数据检索方式。	2019-05-11 03:56:18.568084	f
788	373	Issue	5	cmMalloc需要换个名字，可参考tcmalloc，jemalloc。\r\n\r\n要不叫hb，host-based，意思是这个内存是在宿主上管理的。	2019-05-13 06:45:03.940915	f
792	390	Issue	5		2019-05-13 08:03:44.247709	f
794	392	Issue	5	例如\r\n\r\n<pre><code class="cpp">\r\n#define BSTRING_VAR(T, s) struct BString#T *sh = (void *)(s);\r\nstatic inline size_t bstringLen(const BString s)\r\n{\r\n    db_uint8 type = (db_uint8)(s[0]);\r\n\tswitch (type)\r\n\t{\r\n\t    case BSTRING_TYPE_8:\r\n\t    {\r\n\t\t\tBSTRING_VAR(8,s);\r\n\t\t\treturn sh->len;\r\n\t    }\r\n\t\tcase BSTRING_TYPE_16:\r\n\t    {\r\n\t\t\tBSTRING_VAR(16,s);\r\n\t\t\treturn sh->len;\r\n\t    }\r\n\t\tcase BSTRING_TYPE_32:\r\n\t    {\r\n\t\t\tBSTRING_VAR(32,s);\r\n\t\t\treturn sh->len;\r\n\t    }\r\n\t\tcase BSTRING_TYPE_64:\r\n\t    {\r\n\t\t\tBSTRING_VAR(64,s);\r\n\t\t\treturn sh->len;\r\n\t    }\r\n\t\t\r\n\t}\r\n\t\r\n    return 0;    \r\n}\r\n</code></pre>\r\n\r\n没法写成：\r\n\r\n<pre><code class="cpp">\r\n    db_uint8 type = 8 * (1 << (db_uint8)(s[0]));\r\n    BSTRING_VAR(type, s);\r\n    return sh->len;\r\n</code></pre>\r\n\r\n\r\n	2019-05-13 13:15:26.282445	f
797	394	Issue	6	    这次活动姐姐、文萁还有谢锐，以及妈妈们都积极参与进来了，首先得对她们表示感谢！\r\n    完成好过完美，以前的自己总是迟迟不开始，总觉得一切准备的不够完美，如今在慢慢克服这一心理坎，凡事给自己一个期限，到了期限不管准备成什么样子，就先去执行，事情总是在行动的过程中一步步完善起来的。\r\n    这是一个好的开头，珍惜我们还住在一起，还有这样的便利表达自己想法的时候，尽可能的把真实的自己展现给家人，用行动告诉家人我已经长大，她们可以放心了，告诉她们不管在怎样的环境中，我都有能力把自己过好！\r\n	2019-05-14 12:40:42.819711	f
799	395	Issue	6		2019-05-14 12:45:21.89503	f
802	393	Issue	5	Merge commit \r\nA merge commit is created for every merge, and merging is allowed as long as there are no conflicts. \r\n\r\nMerge commit with semi-linear history \r\nA merge commit is created for every merge, but merging is only allowed if fast-forward merge is possible. This way you could make sure that if this merge request would build, after merging to target branch it would also build. \r\nWhen fast-forward merge is not possible, the user is given the option to rebase. \r\n\r\n根因在这里，第一种只要没冲突就可以合入，第二种每次都得rebase。	2019-05-14 14:39:29.20171	f
809	396	Issue	6	2019年5月14日\r\n最近几天谢震有些微烧，但观察精神状态还好，持续留意他的状态吧，希望这种状态最近能够好转\r\n现在的他，已经能听懂我说的很多话，比如把苹果扔在地上，我让他捡起来，不吃的苹果可以放在桌上，他会照做\r\n乐于晚上跟我在房间打会球，会很开心地笑，模仿我的各种打球动作\r\n只要我说看书，他一定是很感兴趣的，小脑袋里面不知道紫想些什么，会很认真的指着书上的物品，嗯嗯呀呀的发着音，虽然我并不知道他实际想要表达的是什么，但我在用心的回应着他，用我理解的方式在告诉他妈妈眼中看到的世界。\r\n\r\n他有着他的小脾气，会表达着他的各种想法，这个阶段的他正在全然的吸收着这个世界带给他的一切，慢慢地他会有跟多的自我意识，希望他能够喜欢这个全新的世界	2019-05-15 12:54:25.01727	f
814	393	Issue	5	https://www.lefer.cn/posts/42401/\r\n\r\n当然基于原始仓库的master拉分支比自己仓库的master分支更好。	2019-05-17 11:40:30.478204	f
817	362	Issue	5	XLOG是redo日志，但是pg让人需要地方记录整个事务块的状态，以便在异常时，考虑整个事务的回滚等操作。CLOG就是干这个的。	2019-05-17 15:56:29.616758	f
818	403	Issue	5		2019-05-17 16:10:31.536589	f
820	322	Issue	5	1，正手不会发力\r\n2，正手能发力，都不够放松和伸展，球速不快\r\n3，正手发力非常好，反手能打主动球\r\n4，正手发力无可挑剔，可以回各种被动球。步伐完全能跟上。 反手可以打被动球。	2019-05-18 20:32:49.772494	f
823	405	Issue	5		2019-05-20 08:20:30.825176	f
821	404	Issue	5	pg或其他系统当前使用的存储架构。\r\n细节，每个字段的长度，极端场景。\r\nx到y的数量就是1的情况。但是x存在大量重复。还有情况是x不存在重复。\r\n\r\n\r\n	2019-05-20 07:03:29.398995	f
776	369	Issue	5	问题1：根据内部使用与外部使用分2套接口函数，还是统一使用一套接口函数？\r\n问题2：是否需要提供Reset等接口？如何看待宿主与beas关系？\r\n  对于beas而言，需要的部分是内存分配。宿主需要有最终释放内存的能力。\r\n  增加Reset接口是对这种能力的一种约束。\r\n  问题2.1 PG是如何管理内存的，在何时reset。怎么切换MemoryContext？什么情况下提前释放MemoryContext。\r\n问题3：context，尤其是具体类型的context，是由宿主来管理的。beas提供的是算法，而数据的主体在宿主中。\r\n比如CurMemoryAllocator这种显然不合适，greenplum可能没这个概念。然后对接greenplum相关分配内存都得修改？\r\n只能让宿主提供具体实现。\r\n  \r\n  问题3.1，如果beas需要根据需求，将不同的内存挂在具有不同生命周期的MemoryContext上，则必须感知不同的MemoryContext。\r\n而问题是在不同系统中，不同的管理方式对应的MemoryContext是不一样的。\r\n           一种解决方法是增加约束：beas只能在当前上下文分配外部的内存。\r\n           二是beas根据自身需要，不得已情况下定义不同类型的宿主Allocator，让宿主决定如何具体实现。除了当前上下文，可能\r\n 还需要一个常驻内存的。\r\n\r\n问题4，共享内存管理，beas自身会涉及管理共享内存吗？如果涉及，需额外设计一套共享内存管理机制。从逻辑上说共享内存分配可以与堆\r\n上的内存分配独立开。	2019-05-08 15:44:06.637243	f
777	382	Issue	5	改变下视角：将内存按照生命周期与使用方式来分类。\r\nMemTypeLocal ->  beas内使用且beas能控制其释放。\r\nMemTypeRequest -> 跟具体某次执行相关，beas作为中间件时执行主体不在beas，则由外部实现。beas无法完全控制其释放。\r\nMemTypeProcess -> 进程全局存在的，beas作为中间件时，进程主体不在beas，则由外部实现。beas无法完全控制其释放。\r\nMemTypeInstance -> 跨进程的，如共享内存。如无需对pg可见，可在beas内分配与释放。\r\n\r\n分类确实可以让我们可以更清楚的看问题。\r\n变量的生命周期其实也不能作为接口使用的参考，beas内的变量其生命周期也可能是request级别的，而非函数级别，当然这样用非常危险。另外Process级别的实际用的也是Local。\r\n如果将其本质描述为“由调用者管理内存的内存使用方式”。 调用者并不定是outer，也可能边界发生变化而转为inner。	2019-05-09 11:57:52.666624	f
778	385	Issue	5	测试点1：sdsnewlen原来计算ReqType时不包含头部长度，现在包含了。	2019-05-09 16:40:32.885929	f
780	384	Issue	5	<pre><code class="text">\r\n然后，我们来看看为什么要ETL？\r\n    在我看来，有两个原因。\r\n    一：性能  将需要分析的数据从OLTP中抽离出来，使分析和事务处理不冲突。咦？这不是数据仓库的效果吗？是了，\r\n数据仓库，大多数情况下，也就是通过ETL工具来生成地。\r\n    二：控制  用户可以完全控制从OLTP中抽离出来的数据，拥有了数据，也就拥有了一切。\r\n    嗯，OLAP分析，数据挖掘等等等……。\r\n--------------------- \r\n作者：tiger119 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/tiger119/article/details/1482555 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！\r\n</code></pre>\r\n	2019-05-09 19:54:29.439685	f
781	384	Issue	5	<pre><code class="text">\r\n作者：浙江智臾科技有限公司\r\n链接：https://www.zhihu.com/question/67356221/answer/488694086\r\n来源：知乎\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\r\n\r\n前面说了AWS相比于Greenplum，架构上的一些缺陷。再来说说Greenplum和Redshift这类MPP数据仓库面对PB级数据时，架构上一些共同的局限性。\r\n（1）在节点层面对数据进行distribution的局限性。如果采用even distribution，也就是说简单的round robin，能把每个节点的资源都充分的利用起来，\r\n但是对于较小的query和计算任务，也需要发送到所有的节点来完成，浪费集群的资源，增加任务的延迟。如果按某一个业务字段来distribution数据，\r\n譬如测试案例中的日期字段或股票代码字段，那么当query限定为某一个日期或某一只股票时，所有的计算都到一个节点上，不能把集群的所有资源调动起来。\r\n（2）leader节点限制整个集群的并发性能。MPP数据仓库通过leader节点连接客户端和数据节点，leader节点成为系统的瓶颈所在，抑制了系统的并发性能。\r\n（3）增加数据节点时，数据的resharding非常耗时。基于分布式文件系统构建的数据仓库，在架构上能很好的避免MPP的上述局限性。\r\nDolphinDB就是建立在分布式文件系统之上的分布式时序数据库（可以看成是分布式OLAP系统），在时序类数据的写入性能和查询计算性能上，\r\n跟Redshift和Greenplum相比（也是列式存储模式），性能优势在一个数量级左右。如果你的数据量非常大，实时性要求高，而且你的数据一旦写入后，\r\n不再需要更新或删除部分行，或者说这样的操作非常低频，譬如金融市场的行情数据，物联网产生的数据，DolphinDB是一个很好的选择。\r\n</code></pre>\r\n	2019-05-09 19:59:49.079461	f
784	384	Issue	5	数据领域无外乎两个问题：1，存储形态。 2，计算形态。\r\n\r\n数据分布	2019-05-11 03:45:28.593997	f
785	386	Issue	5	如果X->Y只有N种，但是TID到X只有一种，那Constraint Index的规模也是非常大的。	2019-05-11 03:49:56.133595	f
787	387	Issue	5	2，为什么使用状态机模型，而不是功能机？或者其他描述？\r\n3，在最初最简单的时候，图灵是如何看到其图灵机定义的巨大意义的？也即为什么他会认为机器计算方向的前途？	2019-05-12 20:00:07.228294	f
790	382	Issue	5		2019-05-13 06:56:13.296376	f
789	373	Issue	5	sds可能不满足我们的要求，sds返回的是字符串位置，这要求释放的一方必须调用sds的释放方式。\r\n而beas的内存管理存在多种形式。把sds当作void *来看待。把sds当作char*看待，你仍然无法直接用c字符串函数处理。因为需要修改头部。\r\n\r\nsds基于常用字符串接口之上再做一层封装。	2019-05-13 06:53:42.162241	f
791	390	Issue	5		2019-05-13 08:01:13.473417	f
793	390	Issue	5		2019-05-13 08:07:01.083237	f
795	394	Issue	6		2019-05-14 12:18:47.062171	f
796	394	Issue	6	看到身边有人在持续举行家庭会议这件事情，触动了我，也和家人表达了类似的想法，但迟迟都未行动\r\n由于在讨论中姐姐和文萁出现了对抗的情绪，我灵机一动，想到了下午凑在一起举行一次家庭活动吧，叫做择日不如撞日，初衷是想借母亲节这一话题，缓解文萁和姐姐的情绪对抗，也给自己一个机会表达一下对自己母亲的感谢。\r\n平日里，习惯于把感情埋藏在心里的我们，有些心里话还真不知道怎么去表达，没有机会我们要创造机会，正所谓自己想要什么就去种什么样的种子吧，我也希望自己和母亲能够彼此心里敞亮，而不是各自有各自的心结，我希望她在余生里面都能够平和喜乐地生活，享受属于自己的幸福。\r\n	2019-05-14 12:35:03.779043	f
798	394	Issue	6		2019-05-14 12:44:25.412943	f
800	326	Issue	6		2019-05-14 12:47:02.752196	f
801	182	Issue	6		2019-05-14 12:55:36.393854	f
803	397	Issue	5	 inline 关键字实际上仅是 *建议内联并不强制内联*\r\n gcc中O0优化时是不内联的，即使是O2以上，如果该函数被作为函数指针赋值，那么他也不会内联，也必须产生函数实体，以获得该函数地址。经测试c文件中的仅inline函数即使Os优化也不内联，因为没有static，编译认他是全局的，因此像普通函数一样编译了，本c文件也一样通过 bl inline_func 这样的方式调用，不像网上别人说的，本c会内联，其他c文件则通过bl inline_func 方式。加入static 后则内联了。（Os优化等级测试）\r\n    *所以在头文件中用inline时务必加入static*，否则当inline不内联时就和普通函数在头文件中定义一样，当多个c文件包含时就会重定义。所以加入static代码健壮性高，如果都内联了实际效果上是一样的。（gcc下验证过O0级别includes.h中仅定义inline的函数，编译失败，Os编译成功）\r\n--------------------- \r\n作者：求知君 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/huanghui167/article/details/41346663 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！	2019-05-14 14:55:29.279468	f
805	399	Issue	5		2019-05-14 15:24:17.94711	f
808	402	Issue	5	C11 标准的安全函数在glibc是不支持的，有人实现了对应版本https://github.com/rurban/safeclib\r\ngcc默认的C标准目前还是C89/C90的。\r\n\r\n\r\nLinux / glibc维护者拒绝添加安全功能，认为您应该保持字符串的长度并使用memcpy。感觉这想法是对的，字符串其本质就是内存片段。	2019-05-15 12:40:16.448363	f
810	402	Issue	5	strncpy也是不安全的 \r\nhttps://blog.csdn.net/gexiaobaohelloworld/article/details/27567673	2019-05-15 12:58:58.068265	f
812	402	Issue	5	C的内存操作函数就是一坨屎，各种没有参数检查，以及越界检查	2019-05-16 08:20:30.292039	f
815	362	Issue	5	一组包围在 BEGIN 和 COMMIT 语句中间的语句有时候被称做事务块\r\n每个 SQL 语句当做在一个被执行的事务来看待	2019-05-17 15:30:32.103585	f
816	362	Issue	5	隔离级别:\r\n1,脏读，读到未提交的数据\r\n2，不可重复读，在一个事务内，多次读取记录的内容不一致\r\n3，幻读，一个事务内，多次读取，记录条数不一样，出现了新删除与插入记录。	2019-05-17 15:36:54.629111	f
819	368	Issue	5	1.1 接球准备时，身体放松，压低重心。\r\n1.2 抬起脚跟，或小跳调整，伸展身体，架拍并放松手臂手腕。\r\n    自己应该能感受到自己的发力形态。\r\n1.3 根据对方站位，调整发力方向与力度\r\n\r\n站位原则：\r\n1，根据对方击球地点，双打时如果一前一后。则偏向补充己方进攻球员的前方。\r\n2，积极补位，尤其是己方进攻时\r\n3，进攻与防守的轮转。\r\n4，网前站位应该压低身体，随时准备扑球。\r\n\r\n业务选手一般不太会调整自己的站位，以及准备动作，当对方球速快时，就会进入不会打球的状态。	2019-05-18 20:30:29.561016	f
827	404	Issue	5	Mysql binlog是一种逻辑复制方式，基于innodb的redo日志可实现物理复制，但这并非mysq官方复制方式。有其他团队做这个\r\nhttps://www.jianshu.com/p/68e3a4e5ef8a	2019-05-21 13:24:31.210732	f
828	406	Issue	5	还是ubuntu的包管理牛逼，轻轻松松找到合适的源	2019-05-21 14:33:18.533263	f
824	404	Issue	5	问题的关键点是如何在众多的tuples中找到某个更新的tuple，并将其删除。如何数量众多，不至于全部加载。组织方式。\r\n不查找，或以追加方式。因为平时并无查找需求（lsm-tree查找不快，但是扫描应该没问题）。\r\n访问模式：\r\n1，扫描，全读\r\n2，插入，删除\r\n\r\ntupleid基本是定长存储，这是其中一个特征。\r\n\r\ntupleid有两个作用：\r\n1，根据其刷新ac\r\n2，提供tid的索引能力	2019-05-20 12:42:35.149842	f
830	406	Issue	5	1，继续分析下二进制结构\r\n2，binlog机制缺陷分析\r\n3，innodb redo日志格式分析，pg xlog分析。	2019-05-21 18:43:17.288594	f
852	425	Issue	5	pg 逻辑复制的全量同步过程描述：\r\nhttps://juejin.im/entry/5a77f70f5188257a604971dc	2019-05-27 20:58:14.978286	f
858	436	Issue	5	要了解正则表达式的原理，需要先了解一些计算机语言文法的基础知识。\r\n\r\n一个文法可以用一个四元来定义，G = {Vt，Vn，S，P}\r\n\r\n其中Vt是一个非空有限的符号集合，它的每个元素成为终结符号。Vn也是一个非空有限的符号集合，它的每个元素称为非终结符号，并且Vt∩Vn=Φ。S∈Vn，称为文法G的开始符号。P是一个非空有限集合，它的元素称为产生式。所谓产生式，其形式为α→β，α称为产生式的左部，β称为产生式的右部，符号“→”表示“定义为”，并且α、β∈(Vt∪Vn)*，α≠ε，即α、β是由终结符和非终结符组成的符号串。开始符S必须至少在某一产生式的左部出现一次。\r\n\r\n文法可推导的语言标记为L(G)。	2019-06-02 20:00:31.611062	f
859	438	Issue	5	索引不支持同步删除，通过vacuum来删除。因而am没提供单个删除命令。\r\n\r\n理解bitmap scan：\r\nhttp://francs3.blog.163.com/blog/static/405767272011665227181/\r\n1，如果过滤数据需多重处理\r\n2，如果过滤的数据量占比很大\r\n这时bitmap scan优于seq scan和index scan。\r\n\r\n传统的index在insert的时候也是需要scan位置的，scan有两种形式，找到（match）与找到起始位置。\r\nac的区别在于找到时，运用count++。找不到时使用count=1.	2019-06-04 12:22:19.044624	f
825	404	Issue	5	PG的ha实现方式，删除，更新操作如何同步？\r\n还有情况是Y变了，但是T不变的情况？ 数据库一定会为更新操作生成新的tid么？\r\n列式存储，去掉重复列。\r\n内存结构也得考虑用hash查找，否则怎么找？\r\n\r\n逻辑流复制：\r\n<pre><code class="text">\r\n逻辑流复制利用索引的方式优化传输数据的效率，它们可以按表为单位定制。大致分为三种情况:\r\n\r\n如果修改的表有 primary key, 则表的变化的逻辑数据只会包括该表变化的列和pk列数据，如果 pk 列被修改，则还会输出老的 pk 列数据。\r\n如果修改的表没有 primary key，则可以使用 alter table 指定一个 REPLICA index，同时需要这个索引列为非空，其产生的效果和 1 相同。\r\n如果修改的表不满足上面的两个条件，而又要做同步，可以使用 alter table 设置这个表的 REPLICA IDENTITY 为 FULL。于是系统在表修改时会记录修改行的所有列，不会做任何的优化。\r\n很明显，给对应的表设置 PK 或指定索引，在数据同步时效率更高。我们可以安需定制同步策略。在实现功能的过程中需要考虑这部分变化。\r\n</code></pre>\r\n\r\n所以记录的不一定是tid。但可能确实需要一个唯一确定的，要么就是全列。\r\n	2019-05-20 15:16:15.326848	f
829	406	Issue	5		2019-05-21 15:14:07.922248	f
832	408	Issue	6	设计师在装修过程中可能会做哪些工作：\r\n量房拍照，收集信息\r\n协助梳理居住需求，讨论生活场景\r\n根据实际情况，确定设计构想的前瞻度\r\n与委托人配合，对各种方案思路的可行性进行验证\r\n根据双方确定的平面布置方案，进行深化设计\r\n协助控制预算，协助挑选施工方与供应商\r\n确定设计方案，列出采买清单，协助安排施工、采买、安装的时间节点\r\n开工后与施工方保持沟通，及时协商解决意外方案变动和偶发状况\r\n协助进行家具电器、灯具光源、补充配件的安装调试，以及参与其他约定的工作事项	2019-05-22 04:15:51.641498	f
834	408	Issue	6	我们需要一个什么样的家\r\n先了解一下自己的生活习惯是有很必要的。看看这些习惯当中， 哪些是因为条件所限， 被迫潜移默化形成的， 哪些是因为自己觉舒服自在而长久保持的。这无疑也是一项非常有意义的工作。\r\n\r\n有哪些习惯的需求\r\n胡冬寅：\r\n\r\n\r\n谢锐：\r\n\r\n\r\n谢震：\r\n 	2019-05-22 04:32:20.170853	f
826	404	Issue	5	binlog的具体格式，在mysql不同版本的实现。\r\nhttps://dev.mysql.com/doc/internals/en/rows-event.html\r\n这篇介绍了大体格式，但是具体操作类型的日志没细说。另外旧记录如何表示也没说明\r\n\r\nhttps://blog.csdn.net/yanzongshuai/article/details/79686867\r\n此文介绍了insert/update/delete事件的binlog数据格式。\r\n*参考此文章，以及binlog -H可以详细分析数据格式*\r\nheader\r\nfor(row events)\r\nfooter\r\n\r\n问题：\r\n1，binlog中是通过where条件来表示update和delete影响的列么？\r\n<pre><code class="text">\r\nUPDATE_ROWS_EVENT不仅包含行修改后的值，也包括修改前的值；DELETE_ROWS_EVENT仅仅记录删除行的主键值。\r\n</code></pre>\r\n这个描述是啥意思？update不记录相关行的主键么？ delete不是用where条件来记录的？\r\n\r\nhttps://dzone.com/articles/identifying-useful-info-mysql\r\n看这篇文章，应该是用where条件表示的，但是每列的值都有。\r\n那么我们怎么知道哪个是主键呢？	2019-05-21 07:28:56.583369	f
831	408	Issue	6	室内设计，必须是基于真实需求，从现实条件的制约中去组合调配设计要素，并最终做出权衡取舍\r\n我们可以用温度、气味、触觉来评判居家环境，必要的时候，我们甚至可以假装自己是失聪者，用触觉、嗅觉、听觉、皮肤感觉来感受居室空间的动线情况、声音分布、空气流通、物品摆放、以及用身体的移动来感受动线走向\r\n\r\n花点时间了解一下自己的生活习惯，看看这些习惯中，哪些是因为条件所限，被迫潜移默化形成到的，哪些是因为自己觉得舒服自在而长久保持的\r\n装修过程中，你需要投入多少资金预算和时间精力，有相当一部分因素，在你选房买房的阶段就已经决定了\r\n楼位和户型朝向\r\n是否有外墙保温层\r\n入户门品质\r\n窗户是中空玻璃平开窗（包括内开内倒窗）还是单层玻璃推拉窗\r\n晴天正午阳光直射区域及有效直射的时长\r\n以上会影响到家中夏季空调耗电读书、冬季供暖期室内实际温度，房间的落灰层度、客厅和卧室隔离户外噪音的情况，从而在不经意间影响到实际生活品质\r\n\r\n装修的主要工序：\r\n拆除清运\r\n水电管线改造及完工确认\r\n墙体新砌及坑洞补平\r\n防水施工及闭水试验\r\n瓷砖铺贴及地面找平\r\n石膏板吊顶及轻质隔墙施工、其他现场木作\r\n墙面基层处理\r\n室内门及门套的现场制作或厂家定制\r\n柜体制作或厂家定制（包括橱柜）\r\n喷刷墙漆\r\n厨卫及阳台吊顶（除石膏板吊顶外的其他做法）\r\n安装室内门\r\n铺贴壁纸壁布\r\n铺设地板与踢脚线\r\n安装合金推拉门\r\n安装开关面板\r\n安装定制家具和相关电器设施\r\n调试安装灯具光源\r\n安装卫浴洁具\r\n安装窗帘轨道及窗帘布\r\n其他定制采购部件的协调安装等\r\n添置其他软装陈设及花卉绿植\r\n\r\n入住预算：指最终入职之前的最大入住预算，这不仅包括自购的基础建材、建材辅料、装饰建材。还包括水、电、网、气、风、暖设施，成品家具及配套产品、定制家具和其他定制产品、普通家用电器、只能家具硬件、五金配件、卫浴洁具、开关面板和灯具电料、软装陈设等，以及施工安装费用、设计费、灯具和洁具安装费用、物业押金和其他杂费等\r\n\r\n也就是说，在设定预算时，需要把乔迁之前的所有费用都先考虑进去，得到一个现阶段能拿得出的预算的最	2019-05-22 04:15:11.818283	f
833	409	Issue	6	厨房：\r\n厨余垃圾处理器\r\n洗碗机\r\n五门冰箱\r\n厨房冷霸\r\n\r\n\r\n卫生间：\r\n洗衣机\r\n浴霸或者暖风机\r\n马桶旁边的高压水龙头\r\n\r\n客厅或者卧室：\r\n空调\r\n\r\n	2019-05-22 04:19:22.504797	f
844	386	Issue	5	AccessSchema 可以看成x，y，rowid的三维空间在x，y上的投影。投影使用(x,y，count,tids）来表示。判断x，y是否可建立ac的一个判定方式就是x，y的重复度。\r\ny，x，无穷大 与 x，y，无穷大。 这两种情况都无法缩小数据规模。 \r\nx，y，1 缩小的能力取决于x或y中的一个。\r\n\r\n提前提取的AccessSchema就相当于我们在原始数据上的经验，0\r\n \r\n 在万维世界中，涉及人类活动的部分维度数据空间可能非常小，这是缩小数据规模的核心思想。分析通常做的事情可能就是分析不同维度的关联性。\r\n\r\n这引申出一个问题：数据分析，到底在分析啥？\r\n\r\n数据库的表，只是把事物（通常是人）的多维信息统一表示了。\r\n\r\n实x->m, p->y. 与x->m没有本质区别。比如使用条件x=1 and m = t2.p，这时运用x到m的schema，同时根据等值关系传递可用于access schema的优化。\r\n对于跨表的情况，单独x->y建立不了联系。这就是一个笛卡儿积。但是如果x，m  p，y 且m和p语义相等。则可建立起关系，这相当于提前运用了条件。\r\n建立xm->py的AccessSchema。这样做是有意义的，因为x->m可能无法缩小数据规模。 	2019-05-26 10:28:54.671822	f
846	426	Issue	5	如果将世界以万维矩阵存储下来。人类以及自然活动的轨迹就是这个矩阵中打通的关系。这些关系有的表现为线性，有的表现为树状，有的是图状。\r\n如果这世界是一个旋转矩阵，那么人对因果，规律的认知都是基于过往经验的总结。	2019-05-26 14:12:27.808645	f
835	404	Issue	5	明确一点：\r\n1，redo日志如何记录，在x，y，主键/rowid变更场景时，beas如何处理这些情况\r\n1.1，在update其他列时，rowid或主键是否未变更？尤其是对于pg这种多版本的。\r\n1.2，update y时，x在redo是否体现，rowid如何体现？\r\n1.3，redo日志记录的是主键还是rowid？\r\n2，mysql原生版本是否能基于redo日志复制？是否存在问题？\r\n3，能否采用多层次的树来组织x->y->rowid/主键，并且搜索时基本是基于x，y的	2019-05-22 06:35:52.948492	f
836	404	Issue	5	https://juejin.im/entry/5ba0a254e51d450e735e4a1f\r\n这篇文章介绍了大体框架。	2019-05-22 07:50:16.349222	f
845	386	Issue	5	如果将x，y，tuple看成x，y关于实体rowid(实际上是主键)的投影。那么xm->py就是x，y基于实体m|p 的投影。p与m实体是等价的。\r\nx，y，tupleid    x，y，m。或表示为 x = Ft(y)或 x = Fm(y)。\r\n\r\n还有一种看待该问题的方式：\r\n1，t到x，y的投影\r\nx，y本身并无关系。但t在x，在y上的投影空间都有限。x->y有界。x因条件而有界。\r\n\r\n这地方有个因为，既然x有界，则x->t有界。 t到y则也有界。那么x->y也应该有界。\r\n这种方式存储就跟索引类似了，建立x->t的索引即可。 有了t自然就有了y。\r\n\r\n第三种理解：基于重复度。以及查询条件来自动创建投影。比如x，y均有重复度。且经常利用x或y作为查询条件。\r\n即可根据x，y，t建立子表来加速查询。\r\n\r\nAccessSchema的索引都是去重的，即同一个x不会存多个。\r\n	2019-05-26 12:54:03.977822	f
837	404	Issue	5	mysql物理复制可能要求主备数据库完全一致，并且redo日志中需记录逻辑page才能实现。\r\n\r\n1，mysql的redo是记录整条记录修改的，保护所有列\r\n2，mysql的redo是不含old value的，需通过undo获取。\r\n2.1 delete的undo会记录old value么\r\n3，delete操作记录的是物理信息，即每个page-offset对应的row被删除了。\r\n3.1 是否非叶子部分也会发生变更。	2019-05-22 09:08:54.758911	f
838	404	Issue	5	该方案不可能基于物理复制，所以还是考虑逻辑复制吧。\r\npg在10版本之后才支持逻辑复制。	2019-05-23 06:27:32.265762	f
839	423	Issue	5	1，如何调整wal级别\r\n2，pyhical日志的实现\r\n3，logic日志的实现\r\n4，不同级别的日志记录区别以及代价\r\n5，logic full 是否可行	2019-05-23 15:02:48.406183	f
840	423	Issue	5	XLogInsertRecord分析该函数	2019-05-23 16:30:22.006516	f
841	390	Issue	5	知识除了问题，还有结构，结构不断细化，结构本身就包含知识。执行路径，执行与反馈。\r\n结构包含不同层次，并且可以无限展开。	2019-05-23 20:35:39.980011	f
842	400	Issue	5	常见典型问题：\r\n1，击球后脚步未根据下一个球调整好\r\n2，仓促下打了半场球，发力过程不完整\r\n3，反手被动回球不到位	2019-05-25 06:18:34.668109	f
843	425	Issue	5	物理复制：基于存储管理系统实现的复制\r\n逻辑复制：基于数据库的逻辑变更进行复制，不关心存储细节。	2019-05-25 12:42:51.308528	f
849	425	Issue	5	Mysql复制技术	2019-05-26 14:34:28.160804	f
850	425	Issue	5	PostgreSql复制技术	2019-05-26 14:34:40.930815	f
848	425	Issue	5	Oracle复制技术：\r\n\r\nadvanced replication：\r\nhttps://docs.oracle.com/cd/E11882_01/server.112/e10706.pdf\r\n\r\nstream replication（逻辑复制）：\r\nhttps://www.oracle.com/technetwork/database/twp-streams-replication-11gr1-130056.pdf	2019-05-26 14:34:18.152096	f
847	425	Issue	5	*复制的分类*\r\n\r\nwiki：\r\nReplication in computing involves sharing information so as to ensure consistency between redundant resources, such as software or hardware components, to improve reliability, fault-tolerance, or accessibility.\r\n\r\n复制可以按不同方式划分，由于我们这里主要关注的是数据模型，因而我们考虑根据复制内容来划分的方式。\r\n按这种方式大类可分为物理复制与逻辑复制。\r\n\r\nhttps://www.cnblogs.com/songyuejie/p/4743299.html\r\n远程服务器将获取数据的二进制格式，而不是通过SQL。\r\n\r\nhttp://www.postgres.cn/docs/10/logical-replication.html\r\n逻辑复制是根据复制标识（通常是主键）复制数据对象及其更改的一种方法。 我们使用术语逻辑与物理复制相比，它使用确切的块地址和逐字节复制。\r\n\r\n定义:\r\n物理复制是基于数据物理存储结构实现的复制。数据存储结构并不感知数据的语义。\r\n逻辑复制是基于数据的逻辑结构的复制。逻辑结构在数据库中是指表，记录等信息。\r\n\r\n通过上述定义我们可以看到逻辑复制与物理复制是在系统的不同层次实现的。\r\n逻辑复制在物理复制之上，因而它具备物理复制不具备的一些特点：\r\n1，实现不同版本，跨平台的数据复制。\r\n2，实现异构数据库的复制。\r\n3，实现多master的复制。\r\n	2019-05-26 14:19:41.520165	f
864	440	Issue	5		2019-06-06 13:32:38.361511	f
851	425	Issue	5	https://www.google.com/imgres?imgurl=https%3A%2F%2Fuploads.toptal.io%2Fblog%2Fimage%2F127628%2Ftoptal-blog-image-1543512398486-eaab4770b9aac7e8b7d360ec04489385.png&imgrefurl=https%3A%2F%2Fwww.toptal.com%2Fmysql%2Fmysql-master-slave-replication-tutorial&docid=kwNfoc0eVIVUOM&tbnid=z79gaiZZhvcOeM%3A&vet=10ahUKEwjww6X--rviAhUCzmEKHS4zA2IQMwhGKAIwAg..i&w=1720&h=1234&bih=619&biw=1269&q=binlog%20replication%20implement&ved=0ahUKEwjww6X--rviAhUCzmEKHS4zA2IQMwhGKAIwAg&iact=mrc&uact=8\r\n\r\nbinlog同步过程图。\r\n\r\nGTid顶多解决数据复制的重复执行问题。但是异常场景下如何确保一致性似乎没看提及，比如master挂了，binlog还有一堆没同步。这时去切换slave为master就废了。\r\n\r\nhttps://downloads.mysql.com/presentations/EverythingYouNeedToKnowAboutMySQLGroupReplication-final.pdf\r\nhttps://downloads.mysql.com/presentations/EverythingYouNeedToKnowAboutMySQLGroupReplication-final.pdf	2019-05-27 20:23:48.876137	f
853	404	Issue	5	调研：\r\n1，目录树，zookeeper等存储结构\r\n2，复合索引的存储形式	2019-05-28 06:25:02.136208	f
854	404	Issue	5	1，存储格式\r\n1.1 基于内存索引的实现\r\n以encoding方式将内存中的数据存入磁盘，可能性能会比较差。最好是内存组织本身就利于持久化。\r\n\r\n1.2 基于磁盘索引的实现	2019-05-29 09:18:55.796857	f
855	386	Issue	5	1，论文是在不断扩大适用范围，最终把sql语言给cover住。在没有count的时候，没法处理agg。\r\n   可以从查询树的角度看，如果每个叶子scan能cover，通常整个树是可以cover住的。\r\n2，条件目前考虑是等值的，但是范围的，以及表达式的也可考虑。比如可以推到A+1=B等。\r\n3，AC的应用具备方向性，delivery。论文中可能有routine的概念。在腾飞原型中优化后的sql需防止pg优化器改变顺序。\r\n4，A->B,B->C 得到AC但是需要check exist\r\n5，引入count，重度概念。没有count不仅不能处理agg，连join的结果都是不对的（输出target的条数）\r\n6，JR（join reduce），通过Fetch+，Fetch-，Fetch处理JR之后记录数量的处理问题。\r\nJR能实现以图的概念来理解，就是R1和R2有一样的Path。就是说执行Plan的graph中有重复边。\r\nFetch+ = count(X) * count(Y)\r\nFetch = count(Y)\r\nFetch- = count(X)\r\n7,Bcheck是检查是否有界，BA是bounded attr， BR是bounded attr， BQ是bounded query.\r\n8,如果agg(sub_query),sub_query有界可推出agg有界。如果查询的level0 scan的所有输入bounded，其输出一定bounded么？ 不一定，这才取决于输出的列。可能还跟计算方式有关系。\r\n9，AccessIndex需提供全表扫描，基于x或基于xy的扫描。\r\n10，关联查询的情况\r\nparent SQL->child SQL (父查询的条件作用于子查询，这样会产生相互依赖，但执行时是单向的。子SQL会重复执行)\r\nchild SQL-> parent SQL(子查询的输出作为父查询条件)\r\n11，图的建立过程就是利用rule将点连接起来的过程。rule1：常量，rule2：等价条件， rule3：AccessConstraint...\r\n\r\n\r\n\r\n	2019-05-29 15:09:28.989146	f
856	107	Issue	5	花园系统对待人和事。不仅是新的人和事，当下都如此	2019-06-01 02:54:58.282326	f
364	136	Issue	5	8，个人可以持续增长，但要实现指数增长需要建立与其他人的连接。\r\n9，没有什么比正确的选择更重要，但要会正确的选择必须有丰富的知识。人不能缺乏在政治，历史，经济上的基本知识，如果不具备，你应该找个顾问。\r\n10，有趣的灵魂可以吸引人。\r\n11，想去做的事，如果没有时间表就做不出来。目的性目标感的强弱可能相差上百倍。无动力的人生是如何开启的。\r\n12，没有多少人敢于做前面的石头，人们希望被掌控的人生。人数人掌控多数人的命运。\r\n\r\n以便让自己做更合适的选择。\r\n	2018-10-26 06:13:31.704389	f
857	433	Issue	5		2019-06-01 11:16:13.887608	f
865	442	Issue	5	http://liuyangming.tech/05-2018/MvccAndVacuum.html	2019-06-06 16:08:54.295037	f
866	438	Issue	5	<pre>\r\nBTPageState - tree的每个level都有一个，在build阶段使用\r\nBTWriteState - btree的整体写入情况\r\nlinp0与offset 1是啥关系， offset从1开始。linp从0开始。\r\nItemID对应的就是linp。\r\n\r\nbuild过程是自底向上的，先通过heap tuple构建index tuple，填充level 0.\r\n在level 0产生新的page时，添加到level1，这样递归处理。\r\n最后把每个level的最后一个page向上添加，一直到root，将root加到meta。然后结束。\r\n\r\n对于ac而言，主要在insert时注入参数，表面unique时使用特殊行为（增加count，并且扩展PKs）。\r\n\r\nsmgr与其他模块的关系？\r\n\r\n\r\nBTStackData- search的输出结果，包含搜索路径。\r\n\r\ninsert是找到>=scankey的位置，注意是插入在相等key的最前面的。在_bt_findinsertloc的注释中有解释。\r\n除了scan的时候有move right的处理，实际insert的时候也有。move right之后将释放原page的锁，并移到下一个page\r\n</pre>	2019-06-06 16:10:03.328404	f
861	438	Issue	5	一种思路是ac在btree之上封装一层接口，并且实现多层tree的逻辑。三层。\r\n要考虑mvcc机制如何运用。count值对于不同的事务看到的。\r\nac只有索引，没有heap。对于需要通过heap来触发索引操作，这层关系不存在了，可能不少地方会受到影响。	2019-06-05 15:07:50.117256	f
868	404	Issue	5	Relation:table/view/index都抽象为Relation结构，IndexTuple也是一种Tuple。Index本质上就是有组织结构的数据。只是与Heap的数据组织方式不一样。\r\n这可能也是index与table等都丢到access目录的原因。ac也是一种数据组织方式。\r\n\r\nac模式确定，修改受限的。操作也非常有限。 然后定义一个特别的AcSan即可。PG框架对于可见性实现的约束。或者叫PG的可见性框架。\r\n基于此框架下实现Ac。Ac除了insert，都是HOT。\r\n\r\nAC不存在需更新某个列的情况，除了pk。 \r\n\r\n能否在IndexTuple中放下可见性信息？或者说Ac的事务信息要求怎样的格式。\r\n对于回滚段机制，如何找到delete tuple的老版本？\r\n老版本拷贝到undo，并且记录了tid。新的删除在原记录上标记，并记录newtid。空间回收要等小于删除tid的事务都提交。\r\n除非采用回滚段机制，否则记录2个事务id，可能是必须的。\r\n\r\n要么在Indextuple的头部携带事务可见性信息。pg的可见性并非简单的在头部增加两个tid就搞定了。\r\n在头部还记录了事务信息。 问题变成了如何重用mvcc那套机制。\r\n在pg12上新增am之后，代码变化非常大，对外暴露的是TupleTableSlot，通过这个可以得到HeapTuple，以及MinimalTuple。\r\n但事务这块仍然变化不大。\r\n\r\n	2019-06-10 11:52:39.965698	f
884	449	Issue	5	https://dba.stackexchange.com/questions/119386/understanding-bitmap-heap-scan-and-bitmap-index-scan\r\nbitmap scan使用顺位的bit表示对应的page是否有记录满足要求。\r\n\r\ntidbitmap解释了lossy storage chunk，lossy意思是没有记录到tuple级别。信息有损。对于非常大的表，可能需要使用lossy方式，从而减小bitmap的规模。\r\n\r\nhttps://blog.csdn.net/hmxz2nn/article/details/87788032\r\nbitmap scan的核心价值是在读取大量page时，其可以通过物理顺序读取数据。\r\n在数据量非常少时适合用index，非常多50%+时可能更适合seq scan。\r\n\r\n如果ci采用分离数据存储的方式，实际上无法支持bitmapscan。但是Iot是可以考虑采用bitmapscan的。\r\n不过CI的目标是全内存存储。	2019-06-19 08:58:22.068615	f
883	404	Issue	5	不管怎样，根据其数据特征。\r\nac可以存储为 xy， count， pk。\r\n这三者是分离存储的，对于IoT也是如此。我们没必要为old tuple记录xy，回滚段也可据此设计。这是由语义决定的。\r\n\r\nac的特征是：\r\n1，数据根据x，y聚集\r\n2，数据格式固定， 不存在增加字段，删除字段等场景。\r\n3，查询总是从xy出发，或fullsync\r\n\r\n抽象出ac的价值在于使用特殊存储结构，得到最优的性能。\r\n定义一个普通的表为ac表。在ac表上执行各种操作。\r\n增加ac抽象层也可以，主要是方便同时支持不同的数据组织格式，就像table的组织形式也可不一样。\r\n\r\n需要验证一个问题，没有任何索引可以走索引扫描么？\r\n\r\nvocuum时在ac上执行，然后清理ci的表，并清理其索引。\r\ninsert：\r\n1，找到index记录\r\n2，如果找到，则产生新tuple(count+1)，更新ci表，以及索引\r\n3，如果没找到，则插入表，并增加索引\r\n\r\ndelete：\r\n1，查找index记录\r\n2，如果找到，则产生新的tuple(count-1)，更新ci表，以及索引\r\n3，如果没找到，则打印错误。（这里应该不必退出）\r\n4，如果count为0，则执行删除操作。\r\n	2019-06-17 15:24:03.557021	f
878	404	Issue	5	采用xy索引，count，pk数据存在的问题\r\n1，删除时，由于可能只修改了count。在无法做HOT的时候，需删除xy后再创建。有点多此一举了。\r\nheap页能否配置空置率，针对new tuple对page满的判断不一样。\r\n设置合适的fillfactor，https://stackoverflow.com/questions/45087790/postgres-set-fillfactor-to-50\r\n当xy不存在时，对表写入就是insert。\r\n如果能找到xy，则是update操作。但这个update有点不一样，对于pk其是插入操作。\r\n1.1 如何在heap上调用HOT。\r\n使用heap_update操作。\r\n\r\n2，使用fork实现index？\r\n3，唯一索引的管理如何应对update的情况，实际索引还在，记录只是更新了。\r\n4，分离xy，count pk一致性上是否存在问题。\r\n应该没有问题，事务层面一致性保证。pk可放在第二阶段处理。或第一阶段仅支持内联实现的pk。\r\n5，显然ac更新不存在command，都在一个command内。\r\n6，如果不好在记录中剔除xy，那就考虑用null等值做特殊处理。\r\nAC的relation作为统一的Relation，自然是使用所有列构成TupleDesc，但AcInsert内部接口的实现是可以build我们想要的数据结构的。\r\n7，如何表示获取的记录？pg执行模型中会将记录拷贝出来么？\r\n8，count和pk基于ac的Relation能实现么？另外可以填充隐藏字段以实现特殊功能么？\r\nRelation不仅是描述了一组数据，其中还有锁信息，还有存储信息，因而在storage与access层贯穿其存在。\r\nRelation本来是逻辑结构，但是实际上存储也与之关联。\r\n走heap_create_with_catalog接口就可以。\r\nindex也是一样。本质上就是两个relation，对应于2个oid。\r\n这层接口在ac里面调用确实不合适。这是由ac反向依赖的特点决定的。ac不会做relation一样的操作。因而这些并没关系。\r\n不过话说回来，如果以后ac里面使用多种数据结构，relation结构也不一定符合要求。\r\n\r\n\r\n9，能否针对pk实现限定长度，超出则使用toast或其他方式存。\r\npk存储的一种方式是采用pkv的方式存储。当插入时，优先写入到tuple内，\r\n如果tuple内确实没空间或超过一定长度。可以将其中frozen的pk做转存。\r\npk的可见性问题也可以通过这种方式解决。即可见的pk=当前tuple的pk + frozen的pk。\r\n\r\npg当前的toast机制没法满足要求，toast本质上还是按照事物特性的行来存的，更新时涉及整个字段值。\r\n\r\n\r\n9.1 pk的问题本质上是大字段局部更新的代价问题。\r\n这点也是与存储系统最大的区别，存储系统通常有局部overwrite或append方式修改。\r\n而数据库修改一个bit，可能就得生成新行。放大了X倍。\r\n\r\n10，自己实现的机会点应该主要是数据组织更加紧凑，一些情况下可以避免多次更新。\r\n另外一个机会点是优化事务机制，降低多版本，vacuum带来的影响。\r\n\r\n	2019-06-14 07:13:53.609301	f
882	362	Issue	5	https://wiki.postgresql.org/images/9/97/Concurrency.pdf\r\n官方文档还是很详细的，要仔细看：\r\nhttps://www.postgresql.org/docs/9.1/explicit-locking.html\r\n行锁是可能引起disk io的。\r\n\r\n另外看官方README文档。	2019-06-17 12:29:11.723863	f
885	404	Issue	5	可以在tuple上记录一个反向的\r\n1，在pg原有实现中，增加ac relation，然后把insert的tuple给hack掉。\r\n逻辑调整为先查找tuple，如果存在，则将count修改。否则正常插入。\r\nDelete逻辑调整为查找tuple，如果存在，则将count修改，如果count为0。则删除记录。\r\n2，在scan方式上，采用index scan，并且调整其实现为从index和heap中获取数据。\r\n\r\n\r\n3，数据导入上，构建虚拟数据，导入pg。\r\n增加import命令，支持按照指定数据格式导入数据\r\n\r\n后面再考虑增加ci的heap am组织方式。扩展下am，然后根据am来区分逻辑，这套仍然可用。\r\n\r\n\r\n现在要做的工作，本质上就是利用heap和btree实现iot，这是一种次优的方案。\r\ntai | iat | iot  基于pg实现的3种模式。\r\n\r\ninsert：\r\n1，查找index记录\r\n2，如果找到，则产生新tuple(count+1)，如果是HOT，则更新ci表即可\r\n否则，写入index记录，并且在heap tuple中更新index id。\r\n3，如果没找到，则插入表，并增加索引\r\n\r\ndelete：\r\n1，查找index记录\r\n2，如果找到，则产生新的tuple(count-1)，更新ci表，以及索引\r\n3，如果没找到，则打印错误。（这里应该不必退出）\r\n4，如果count为0，则执行删除操作。\r\n\r\n先做一个简化版本的。\r\n不存在子事务，不存在multitrans，暴力锁定表。\r\n理解vm等机制， 优化内部实现。\r\nac在heap上的格式是确定的，因而可以做很多优化。\r\n要不要考虑下在线vacuum？\r\n\r\n组成新tuple的逻辑可以放到上面，先查找。然后形成新的tuple。\r\n底下ci纯粹实现数据组织与扫描。且这块的代码对于pk也是通用的。\r\nci地位等价于Iot。\r\niat是把部分column分解成index，另外一部分column拆成heap的存储方式。适用于索引变更不频繁，数量变更频繁的场景。\r\nci master table可以用这种存储方式，ci extra table也可组织成这种形式。其他表也可使用。\r\n在第一个版本仅要求在表上建立该索引并指定使用这种存储方式。\r\n\r\nscan上可能不用非常特别的处理，只是需要将原先从index和heap取数据的逻辑调整下。但代码上怎么嵌入是个问题。\r\n\r\n先做一个约束，ci可以对应于一个表，一个不支持index字段变更的表，如果想变更index，可使用delete + insert在上层实现。\r\n虽然有限制，但这个表仍然是很常用的。\r\n\r\nscan期间buffer是pin住的，但不会加lock，由于mvcc，可以支持这种并发。\r\n\r\n1，怎么无缝的对接vacuum\r\n2，对接scan\r\n3，对接analyze	2019-06-20 08:35:08.624431	f
887	438	Issue	5	10，indexOnlyScan没有拷贝数据，如何处理与分裂并发场景。\r\n\r\n1，在indexOnlyScan期间，index page的pin不会释放。直到处理下一个page。\r\n参考StoreIndexTuple其中不会释放锁。\r\n注意区别：index tuple的buffer不会赋给slot，因而根本不会释放\r\nExecStoreTuple中则不一样，当slot->tts_buffer 与当前buffer不一致时就可以释放buffer。\r\n\r\n2，indexscan，当去heap上取数据时，就可以释放index page的pin了。\r\n参考index_getnext，index_fetch_heap\r\n\r\n但是光pin住够么？ 能防止page分裂么？\r\n在buffer的README文章中解释了这种情况，如果page需彻底删除记录，或变更空间。在获取LOCK的同时需检查pin的情况，\r\n如果有pin则应该等待。	2019-06-21 07:21:19.527445	f
888	438	Issue	5	11， order key在index搜索中的作用\r\n12，scankey的结构与具体用法。\r\n13，查询具体如何与scan接上？ 存在哪些修改点。\r\n14，索引读取时，如果读完一个tuple，page被修改怎么处理？\r\n总是一次性读取一个page，请参考_bt_readpage\r\n15，对于中间的page呢？不会也是一次性读取吧\r\n	2019-06-21 09:22:30.123757	f
870	362	Issue	5	并发控制有很多门类：\r\nhttps://www.zhihu.com/question/60278698\r\nhttps://zhuanlan.zhihu.com/p/37087894\r\n《A Critique of ANSI SQL Isolation Levels》中给出了异常操作序列的定义。\r\n\r\n何谓正交，即两种完全不同的维度。这是做纵横向分析必须清晰的。\r\n快照与并发控制什么关系？\r\n直观理解快照必然与时序有关系，也必然产生多个版本。\r\n\r\n锁与多版本就是并发控制领域的一对正交因素。	2019-06-11 12:05:59.227843	f
860	438	Issue	5	找到btree实现的核心点，做好这些就能实现好索引。\r\n\r\n整体介绍的ppt：\r\nhttps://www.pgcon.org/2016/schedule/attachments/423_Btree\r\nREADME\r\n\r\n1，存储形式\r\n1.1 header and special space\r\n1.2 left/right sibling\r\nleft sibling实现反序遍历。\r\n\r\n1.3 high key\r\n1.4 fastroot/root\r\nroot和fastroot信息都保存在meta中，fastroot是当出现大量数据删除时（因为此时每层的rightmost节点不会删除，树的高度永远不会下降），\r\n其直接指向第一个有分叉的节点(或叶子节点)。避免从root一层层往下找，从而实现这种情况下的加速。\r\n\r\n1.5 HOT\r\nhttps://blog.csdn.net/wanghai__/article/details/6340906\r\n就是更新了非索引相关column时，采用HOT方式优化，避免去更新索引。\r\n\r\n2，操作类型\r\n2.1，插入\r\n2.1.1 分裂\r\n2.2，扫描\r\n2.1 扫描额外任务：标记dead，添加miss downlink\r\n2.3，删除，vacuum\r\n2.3.1 vacuum的物理顺序支持\r\n2.3.2 删除page，合并\r\n2.3.3 在tuple删除之后，如果在page内移动tuple，索引如何据此更新。\r\n\r\n3，加锁机制\r\n3.1 vacuum会等到page并没其他锁，且没有pin的时候进行。\r\n3.2 反序扫描时加锁机制，如何防止死锁\r\n如果存在加多个锁的情况，一定是从左到右，从下到上。按照这种顺序去加锁是没问题的。\r\n其他情况都是加单个page的锁。\r\n\r\n3.3 中间节点的加锁机制\r\n对于中间节点，只有分裂与删除时，涉及到修改。这时满足自下而上的操作顺序。\r\n\r\n4，访问顺序\r\n4.1 在分裂以及删除页面时，如何找到其parent\r\n\r\n5，分裂处理\r\n6，合并处理\r\n7，持久化\r\n7.1 mvcc快照\r\n7.2 miss downlink的处理\r\n分裂时每层的操作作为一个原子操作记录wal，但是上层的操作可能尚未完成，这时crash了，就缺乏downlink。\r\n\r\n8，统计信息\r\n9，空间管理\r\n	2019-06-04 13:37:58.74386	f
904	454	Issue	5	行为与index不一样的地方：\r\n1，scan时自行判断可见性\r\n2，最底层tuple为heap tuple。\r\n3，vacuum单独实现，自行根据事务信息来做删除。\r\n4，原表删除时，需调用其删除接口。在indexam增加单条删除接口。\r\n5，插入时，如果有重复值，其行为是增加count。同样删除时其行为是减少count。只有count为0时标记真正删除。\r\n6，它不存储item pointer，因为不需要。而且也没办法存储。\r\n7，与index一样的是不支持update\r\n\r\n问题：如何支持pk？\r\n生成附加字段pkid，pkid在插入时根据规则生成。\r\n然后导数据接口，根据输入的pk，以及查询到的pkid，插入到pkid与pk组成的CI中。\r\n\r\n能否只使用一个Relation？提供不同的获取TupleDesc的方法。应该没有问题，一起都在掌控之中。\r\n\r\n其实ac相当于自行实现的btree index，只是在最底层与接口层做了特殊处理。因为页面结构与btree完全一致，因而可以重用btree的大部分代码。\r\n\r\n存储结构是 x|y|pkid|count，只有最后的count是经常变化的。无论是否想要，count总是存在，这就是CI！\r\n\r\n\r\n想想给外表建本地索引！！\r\n\r\n\r\n	2019-06-26 08:36:00.590042	f
862	439	Issue	5	抛几个问题：\r\n1，索引有mvcc概念么？ 还是都可见。\r\n 索引的可见性是通过tuple来实现的。vacuum的时候根据tuple可见性来清理索引。\r\n mvcc实现了ACID的I。WAL实现了ACID的A，持久化技术实现了D，约束实现了C。\r\n \r\n2，cmin/cmax管理\r\n3，当前系统事务id如何维护，重启之后如何维护？\r\n4，快照如何运用？\r\nhttp://liuyangming.tech/05-2018/MvccAndVacuum.html\r\n快照的本质就是可见性，因而事务隔离的实现就是通过快照。\r\n\r\n\r\n4.1 pg中有哪些快照，具体如何使用？\r\n快照的类型是根据判断函数来的，实际上有些类型的快照根本不需要记录当前系统的事务状态，比如HeapTupleSatisfiesAny与HeapTupleSatisfiesSelf。\r\n\r\n5，如何理解子事务，与事务的区别与关联是什么\r\n6，clog规模如何缩减。\r\n由于pg没有undo机制，事务abort状态记录在clog中，这个状态什么可以被清除呢？\r\n通过frozen机制，每个表都记录了frozen_xid，在该事务之前的clog都应该运用更新到表上，因而在此之前的clog可以清楚。\r\ndatabase据此可计算出最小的frozen_xid。 在vacuum的时候就可以清理在此之后的clog。multitrans等也是这样被清理的。\r\n\r\n7，table的vm机制\r\nhttps://www.postgresql.org/docs/9.5/storage-vm.html\r\n主要是加速可见性判断的，如果一个page所有tuple对所有其他事务可见，则设置标记。用一个bit代表一个page。\r\n\r\n8，pg的隔离级别\r\nhttps://www.postgresql.org/docs/current/transaction-iso.html\r\n中文版\r\nhttp://www.postgres.cn/docs/9.5/transaction-iso.html\r\n\r\n<pre>\r\n如果想保证真正的数学上的可串行化，数据库必须使用谓词锁(predicate lock，SQL Server叫range lock)，\r\n意思是如果一个事务T1正在执行一个查询，该查询的的WHERE子句存在一个条件表达式E1，那么另外一个事务T2 就不能插入或删除任何满足E1的数据行。\r\n例如，一个事务A正在执行一个查询SELECT ... WHERE class = 1，另外一个事务就不能插入、更新或删除任何满足“class=1”的数据行。\r\n只有在A提交以后，B才能进行这样的操作。\r\n</pre>\r\n\r\n总之，可重复读以及串行化级别都存在系列化失败的情况，串行化级别的序列化检查是通过谓词锁来实现的。谓词锁理解是记录了谓词涉及的数据，这并非真的锁，\r\n通过检查数据之间的关系，来发现序列化失败。\r\n\r\n对于可重复读的情况。\r\n如tuple 1，2 被事务1改为1，3\r\n可重复读事务2改为1，4.\r\n事务1提交成功。那么问题来了事务2到底看到的是1，2还是1，3. 按照可重复读应该看到的是未被删除的1，2.然而事务2显然无法更新1，2（只能在1，3基础上更新）. 这里存在矛盾。\r\n因而事务2只能撤销。\r\n\r\n9，事务中断之后如何处理，在断连之后，用户如何感知事务状态？如果用户不abort又将如何？\r\n	2019-06-06 08:48:20.323717	f
869	439	Issue	5		2019-06-11 08:22:48.145827	f
902	438	Issue	5	16，最左边的索引元组处理\r\n<pre><code class="text">\r\n\t/*\r\n\t * Create downlink item for left page (old root).  Since this will be the\r\n\t * first item in a non-leaf page, it implicitly has minus-infinity key\r\n\t * value, so we need not store any actual key in it.\r\n\t */\r\n\tleft_item_sz = sizeof(IndexTupleData);\r\n\tleft_item = (IndexTuple) palloc(left_item_sz);\r\n\tleft_item->t_info = left_item_sz;\r\n\tBTreeInnerTupleSetDownLink(left_item, lbkno);\r\n\tBTreeTupleSetNAtts(left_item, 0);\r\n</code></pre>\r\n	2019-06-25 12:23:35.145391	f
863	439	Issue	5	事务ID回卷问题，pg通过vacuum frozen机制将特别老的事务id改为Frozen的XID。这个选择是有点扯的。扫描大量页面，修改这玩意，还不如使用int64类型来表示。\r\n快照的一致性：通过xmin，xmax，xplist来区分事务对于快照的可见性。\r\nhttp://blog.itpub.net/6906/viewspace-2562652/\r\n\r\npg/innodb/oracle的对比\r\nhttp://www.postgres.cn/downfiles/pg2016conf_day2_s1_pm3.pdf	2019-06-06 09:31:14.851894	f
903	451	Issue	5		2019-06-26 08:13:34.855604	f
909	438	Issue	5	17，索引中非key字段总是排在后面么？\r\n是的，通过这个函数可以看出来 _bt_nonkey_truncate\r\n\r\n18，有可能加隐藏字段么？	2019-06-27 07:48:27.814589	f
906	455	Issue	5	马上问题来了 vm怎么玩？只能舍弃vm。 那vacuum怎么搞？按照index的玩法？增加删除标记？\r\n为什么之前不同步标记index item删除，因为无法标记。\r\nindex现在的vacuum机制是heap把删除的tid保留起来，index vacuum时做全部扫描，然后通过回调机制检查对应htup有没删除，如果删除，则把index page中的一起删除。\r\nac增加了事务信息之后可单独vacuum。\r\n\r\n事务这块的处理。 不支持cid，不支持除了read committed之外的级别，没有谓词锁。\r\n删除可见---\r\n查询可见---\r\n\r\nHeapTupleSatisfiesVisibility\r\n\r\n可以使用	2019-06-26 12:04:51.024008	f
912	455	Issue	5		2019-06-27 10:17:27.56375	f
915	440	Issue	5	SPI：存储过程编程接口\r\nRI：RI trigger(Generic trigger procedures for referential integrity constraint checks.), heap接口中的crosscheck就是给这个用的。	2019-06-28 07:51:30.041978	f
918	455	Issue	5	不支持update，支持删除。\r\n\r\n有个bug，在关闭seqscan之后，删除tuple，虽然没删成功，但是记录不知道为啥不可见了。可能_bt_checkkeys中失败，tuple变成DEAD了。	2019-06-28 14:33:46.972676	f
919	439	Issue	5	为什么需要pg_subtrans？\r\npg_subtrans从数据上解决了父子事务的关系问题。当然可能也有其他方式来记录。\r\n\r\nsavepoint名称会持久化么？如果异常，事务被完全回滚吗？\r\n\r\nmulti trans是解决tuple lock问题的，详解见heap 下的README.tuplock\r\n	2019-06-29 14:32:22.780857	f
871	444	Issue	5		2019-06-11 13:16:01.058232	f
877	444	Issue	5	rebuild_relation这个函数可以好好看看，可以深入理解heap与relation，tuple的关系。\r\n\r\nheap_update执行过程\r\n\r\nExecIndexScan，执行scan找到TupleTableSlot，然后调用ExecUpdate。\r\n\r\n对于ac而言，没有必要。ac可以根据x，y找到tuple，然后调用heap_update这层的方法。	2019-06-13 17:39:10.632212	f
880	444	Issue	5	<pre><code class="text">\r\n * The executor stores tuples in a "tuple table" which is a List of\r\n * independent TupleTableSlots.  There are several cases we need to handle:\r\n *\t\t1. physical tuple in a disk buffer page\r\n *\t\t2. physical tuple constructed in palloc'ed memory\r\n *\t\t3. "minimal" physical tuple constructed in palloc'ed memory\r\n *\t\t4. "virtual" tuple consisting of Datum/isnull arrays\r\n</code></pre>\r\n\r\n\r\nTupleTableSlot在每种scan下的使用。\r\n1，indexscan，属于第一种情况\r\n2，indexonlyscan，属于第四种情况\r\n3，nodescan也是第一种情况\r\n4，dml操作显然属于第二种情况，最终会构造tuple\r\n\r\n什么是minimal tuple？\r\n主要用于hash join等需要产生大量内存记录的情况，去掉了头部的很多信息。	2019-06-14 13:17:09.866162	f
867	404	Issue	5	方案1：\r\nx| y | pk 各使用一层btree。\r\n\r\n方案2：\r\nx y count | pk 使用2层btree。\r\n\r\n方案3：\r\nx y count使用btree，pk使用其他方式存储。\r\n\r\n先按照方案2，往下走看看。\r\npk的存储形式是一个重点，一方面pk个数不确定，另一方面在删除时需要根据pk来查找。\r\n综合上述两种需求，考虑采用index的tid | pk复合键使用btree索引存储。\r\n分裂时如何处理？分裂时其tid被复用。 考虑使用page的lsn或其他page内递增标识。\r\n\r\n这种方案增加了一点约束：tid不能被其他x|y复用，x|y|count不能先于pk删除。 删除时，优先删除pk，然后减少count。如果删除pk成功，减少count失败。\r\n则该条语句需重复执行，重复执行时pk不存在不影响最终成功。\r\n\r\npk的存储可考虑采用表类似vm的机制，使用一种新类型的ForkNumber 。13768 13768_key的形态\r\n\r\n\r\n1，接口定义\r\n1.1，insert(acName, x, y，count，pks)\r\n1.2，delete(acName, x, y，count，pks)\r\n1.3，update(acName, oldx，oldy，oldpk，x, y，pk)\r\n1.4，truncate | clean（acName）\r\n1.5，create(acName,x,y,inlcude_pk)\r\n1.6，drop(acName)\r\n1.7, scan(x) return x | y | count [| pks]\r\n\r\n2, 实现\r\n2.1 create的时候为ac定义索引结构，acName与索引关联.\r\n区别在于ac没有数据实体。同样使用Relation结构管理么？\r\n2.2 count作为covered index的include字段。\r\n2.3 pk作为一个什么类型的字段创建？\r\npk作为原来类型字段创建即可，在逻辑上就是一个简单类型。需要展开是因为物理存储形式决定的。\r\n2.4 count的字段在check之后做修改，然后重新构建tuple后插入。\r\n2.5 delete的时候将index tuple标记为dead。这点与原来btree在scan时标记为DEAD是不一样的。\r\n2.6 vacuum机制上需支持独立vacuum index。\r\n2.7 何时使能AccessConstraint？\r\n2.8 如何处理ac与数据源的数据一致性问题？\r\n2.9 代价评估\r\n2.10 extractor发过来的事务相关的操作，ac需要体现事务性。分析covered index的实现，covered index是通过找到对应的tuple来分析其可见性么？\r\n分析IndexOnlyNext函数。\r\n2.11 一致性的考虑，重复执行某个lsn的log，执行一半异常的情况。count与pk数据一致性。\r\n2.12 即便与数据源存在时差，确保数据的一致性，对于ac仍然有意义。比如批量修改了某个字段，则在该字段上的分析应该在批量生效之后执行。\r\n其意思在于可以确保ac部分在语义上与源库保持一致。\r\n一种方案是index基础上增加可见性处理。另一种自行实现ac，其原型并非covered index，而是IoT。所谓Index必须与原表关联。\r\n2.13 复制，ac的容灾\r\n2.14 升级，与GP对接.如果基于新的AM实现，与GP对接得等到GP升级。\r\n2.15 如果后续形态发生变化，AC的维护方式也会改变。如果constraint index的更新本身包含在源表更新的事务中。\r\n则其是货真价实的index。但以数据抽取方式工作时，其本身需提供事务机制。后续这里会存在事务头部的冗余，但这估计是\r\n不得不走的。\r\n\r\n\r\n	2019-06-10 07:32:27.704135	f
879	444	Issue	5	StoreIndexTuple真的拷贝了所有数据么？ 但是没看到调用memcpy。\r\nDatum看上去更像一个数据指针，当数据并非定长时。\r\n对于非indexonlyscan应该找到tid之后就可以释放buffer了？还是要等scan完成？\r\n_bt_drop_lock_and_maybe_pin，对于ac xs_want_itup这个标记得带上。	2019-06-14 12:26:11.503881	f
873	404	Issue	5	1，CI管理\r\nciCreate：\r\n根据ac中的relfilenode或oid等唯一标识，利用Relation中的结构创建表以及索引。需要的信息是x | y | count | pk等字段信息。\r\nciDrop：\r\n根据ac与ci的表与索引名称关系，找到对应的表和索引，执行删除操作。\r\nciTruncate：\r\n根据ac与ci的表与索引名称关系，找到对应的表和索引，执行truncate操作。\r\n2，数据导入\r\n考虑每个数据源独立进程，否则进程模型可能存在一些问题。\r\n数据写入会做合并，否则额外产生一些中间过程的列。这个合并操作可以在外部实现，也可以在Ac写入接口之上封装实现，但其与AcAmRoutine没关系。\r\nAcTupleOp \r\n{\r\n  Datum *values;\r\n  bool *isnull;\r\n  uint32 count;\r\n  Datum *pks;\r\n  uint32 op_type; //insert or delete\r\n}\r\nciPrepare\r\nciSet\r\nciExec\r\nciSimpleExec  //将上述3个接口融合\r\n3, 数据扫描\r\n提供AcFetch node，在AcAmRoutine基础上封装数据抽取。	2019-06-13 07:16:49.920043	f
874	406	Issue	5	ubuntu上登录mysql：\r\nmysql -uroot -proot 或者\r\nmysql -h localhost -uroot -proot\r\n\r\nshow database;\r\n\r\n查看binlog命令：\r\nmysqlbinlog --base64-output=decode-rows --start-datetime="2019-06-13 11:40:00" -vv /var/log/mysql/mysql-bin.000001\r\nxxd /var/log/mysql/mysql-bin.000004\r\n\r\n	2019-06-13 09:25:24.334918	f
881	444	Issue	5	不管是heap还是index，都强烈的跟Relation关联。\r\n甚至metapage都缓存在relation中。	2019-06-14 16:09:41.400719	f
872	444	Issue	5	heap_fill_tuple(TupleDesc tupleDesc,\r\n\t\t\t\tDatum *values, bool *isnull,\r\n\t\t\t\tchar *data, Size data_size,\r\n\t\t\t\tuint16 *infomask, bits8 *bit)\r\n\r\nDatum从其他数据而来，不同类型的存储形式不一样。\r\nisnull是字段是否为null的数组。\r\n注意对于null的字段Datum仍然是有值的，但是最终在heaptuledata中仅占用bit位。\r\n\r\nfill_val这个函数有点看不懂，从pointer怎么计算出数据长度？\r\n如果是变长 Datum结构的前面部分就包含了数据长度，参考函数inv_write\r\n\r\nbinlog，pg的logic log如何表示空置？\r\n从binlog解析结果看应该也是有null数组，以及列值：\r\n<pre><code class="text">\r\n### UPDATE `testdb`.`tt2`\r\n### WHERE\r\n###   @1=1 /* INT meta=0 nullable=1 is_null=0 */\r\n###   @2=NULL /* STRING(10) meta=65034 nullable=1 is_null=1 */\r\n### SET\r\n###   @1=2 /* INT meta=0 nullable=1 is_null=0 */\r\n###   @2=NULL /* STRING(10) meta=65034 nullable=1 is_null=1 */\r\n\r\n</code></pre>\r\n\r\nbinlog for truncate table\r\n\r\n<pre><code class="text">\r\n#190613 14:20:57 server id 1  end_log_pos 1641 CRC32 0x5ddeceeb \tAnonymous_GTID\tlast_committed=6\tsequence_number=7\trbr_only=no\r\nSET @@SESSION.GTID_NEXT= 'ANONYMOUS'/*!*/;\r\n# at 1641\r\n#190613 14:20:57 server id 1  end_log_pos 1728 CRC32 0xa14a0044 \tQuery\tthread_id=14\texec_time=0\terror_code=0\r\nuse `testdb`/*!*/;\r\nSET TIMESTAMP=1560406857/*!*/;\r\nSET @@session.pseudo_thread_id=14/*!*/;\r\nSET @@session.foreign_key_checks=1, @@session.sql_auto_is_null=0, @@session.unique_checks=1, @@session.autocommit=1/*!*/;\r\nSET @@session.sql_mode=1436549152/*!*/;\r\nSET @@session.auto_increment_increment=1, @@session.auto_increment_offset=1/*!*/;\r\n/*!\\C utf8 *//*!*/;\r\nSET @@session.character_set_client=33,@@session.collation_connection=33,@@session.collation_server=8/*!*/;\r\nSET @@session.lc_time_names=0/*!*/;\r\nSET @@session.collation_database=DEFAULT/*!*/;\r\ntruncate table tt1\r\n/*!*/;\r\nSET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;\r\nDELIMITER ;\r\n# End of log file\r\n/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;\r\n/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;\r\n</code></pre>\r\n\r\n	2019-06-12 09:40:19.033133	f
875	444	Issue	5	Index有哪些列，每个列是什么数据类型在内存中哪里有体现？	2019-06-13 12:10:44.257089	f
886	450	Issue	5	typedef struct HeapTupleData\r\n{\r\n\tuint32\t\tt_len;\t\t\t/* length of *t_data */\r\n\tItemPointerData t_self;\t\t/* SelfItemPointer */\r\n\tOid\t\t\tt_tableOid;\t\t/* table the tuple came from */\r\n#define FIELDNO_HEAPTUPLEDATA_DATA 3\r\n\tHeapTupleHeader t_data;\t\t/* -> tuple header and data */\r\n} HeapTupleData;\r\n\r\n注意page里面并未存放HeapTupleData结构，而是HeapTupleHeaderData开始的格式。\r\n\r\n这里处理就得非常注意了。	2019-06-20 13:25:05.91176	f
822	404	Issue	5	pg存文本字段的上限。文本搜索的实现。\r\n\r\n1，以索引形态存储ci\r\n2，以表形态存储ci\r\n3，列存储技术有没运用空间\r\n\r\n约束列表：\r\n1，x，y只能是单列\r\n\r\n本质上access constaint是一个表，可以在x上建立聚簇索引。\r\n本质上constraint index是一个索引，通过x获取y以及对应的tupleid。\r\n\r\n问题1：大量tupleid如何存储？pg行内存储的最大长度是多少？\r\n  pg约束记录不能超过一个block，默认是8k，否则启用toast机制\r\n\r\n问题2：pg的hash index如何实现？是否适合\r\n  hash index跟常见的hash实现类似\r\n2.1 溢出页内的数据有序么？\r\n  是有序的。\r\n问题3：如果以索引形态存储，是用什么类型的索引？联合索引的用法(能否支持c1c2，从c1找到c2)？还是自定义某个类型索引的一个实现？\r\n问题4：以索引形态存储，其value能否很好的自定义？\r\n问题5：是否考虑采用其他手段如redis给src_tid-> ci_tid的映射。\r\n    一种实现方式是采用pg的hash索引，桶内根据tid排序。 因为没有排序需求，只有根据tid插入，删除。\r\n问题6：如何在beas上实现？放在pg还是beas模块中？\r\n问题7：优化：同一个表上多个access schema如何避免冗余的hash索引？	2019-05-20 07:49:36.905359	f
876	400	Issue	5	跟何大神打球发现问题：\r\n1，出球线路比较单一，且未仔细考虑\r\n慎打斜线杀球\r\n平抽不要抽到别人拍子边\r\n\r\n2，跳球仍然不到位\r\n  原因是局部发力有问题，小臂与手腕手指发力\r\n\r\n3，扑球不够快，手法有问题\r\n\r\n4，后侧步问题大\r\n\r\n5，拍面的控制\r\n反手有两种握拍方式，要看情况运用。	2019-06-13 16:30:30.101717	f
892	451	Issue	5		2019-06-22 12:11:20.929511	f
897	451	Issue	5		2019-06-24 06:51:51.476103	f
894	449	Issue	5	<pre>\r\n\tpostgres.exe!ExecModifyTable(PlanState * pstate) 行 1947\tC\r\n \tpostgres.exe!ExecProcNodeFirst(PlanState * node) 行 445\tC\r\n \tpostgres.exe!ExecProcNode(PlanState * node) 行 247\tC\r\n \tpostgres.exe!ExecutePlan(EState * estate, PlanState * planstate, bool use_parallel_mode, CmdType operation, bool sendTuples, unsigned __int64 numberTuples, ScanDirection direction, _DestReceiver * dest, bool execute_once) 行 1723\tC\r\n \tpostgres.exe!standard_ExecutorRun(QueryDesc * queryDesc, ScanDirection direction, unsigned __int64 count, bool execute_once) 行 364\tC\r\n \tpostgres.exe!ExecutorRun(QueryDesc * queryDesc, ScanDirection direction, unsigned __int64 count, bool execute_once) 行 307\tC\r\n \tpostgres.exe!ProcessQuery(PlannedStmt * plan, const char * sourceText, ParamListInfoData * params, QueryEnvironment * queryEnv, _DestReceiver * dest, char * completionTag) 行 161\tC\r\n \tpostgres.exe!PortalRunMulti(PortalData * portal, bool isTopLevel, bool setHoldSnapshot, _DestReceiver * dest, _DestReceiver * altdest, char * completionTag) 行 1286\tC\r\n \tpostgres.exe!PortalRun(PortalData * portal, long count, bool isTopLevel, bool run_once, _DestReceiver * dest, _DestReceiver * altdest, char * completionTag) 行 799\tC\r\n \tpostgres.exe!exec_simple_query(const char * query_string) 行 1145\tC\r\n \tpostgres.exe!PostgresMain(int argc, char * * argv, const char * dbname, const char * username) 行 4182\tC\r\n \tpostgres.exe!BackendRun(Port * port) 行 4361\tC\r\n \tpostgres.exe!SubPostmasterMain(int argc, char * * argv) 行 4883\tC\r\n \tpostgres.exe!main(int argc, char * * argv) 行 205\tC\r\n\r\n从ExecProcNode进入了scan\r\n \tpostgres.exe!heap_beginscan(RelationData * relation, SnapshotData * snapshot, int nkeys, ScanKeyData * key) 行 1406\tC\r\n \tpostgres.exe!SeqNext(SeqScanState * node) 行 71\tC\r\n \tpostgres.exe!ExecScanFetch(ScanState * node, TupleTableSlot *(*)(ScanState *) accessMtd, bool(*)(ScanState *, TupleTableSlot *) recheckMtd) 行 95\tC\r\n \tpostgres.exe!ExecScan(ScanState * node, TupleTableSlot *(*)(ScanState *) accessMtd, bool(*)(ScanState *, TupleTableSlot *) recheckMtd) 行 162\tC\r\n \tpostgres.exe!ExecSeqScan(PlanState * pstate) 行 129\tC\r\n \tpostgres.exe!ExecProcNodeFirst(PlanState * node) 行 445\tC\r\n \tpostgres.exe!ExecProcNode(PlanState * node) 行 247\tC\r\n>\tpostgres.exe!ExecModifyTable(PlanState * pstate) 行 2025\tC\r\n\r\n\r\n>\tpostgres.exe!heap_delete(RelationData * relation, ItemPointerData * tid, unsigned int cid, SnapshotData * crosscheck, bool wait, HeapUpdateFailureData * hufd, bool changingPart) 行 3064\tC\r\n \tpostgres.exe!ExecDelete(ModifyTableState * mtstate, ItemPointerData * tupleid, HeapTupleData * oldtuple, TupleTableSlot * planSlot, EPQState * epqstate, EState * estate, bool processReturning, bool canSetTag, bool changingPart, bool * tupleDeleted, TupleTableSlot * * epqslot) 行 719\tC\r\n \tpostgres.exe!ExecModifyTable(PlanState * pstate) 行 2170\tC\r\n\r\n查询的执行堆栈。\r\n>\tpostgres.exe!heap_beginscan(RelationData * relation, SnapshotData * snapshot, int nkeys, ScanKeyData * key) 行 1406\tC\r\n \tpostgres.exe!SeqNext(SeqScanState * node) 行 71\tC\r\n \tpostgres.exe!ExecScanFetch(ScanState * node, TupleTableSlot *(*)(ScanState *) accessMtd, bool(*)(ScanState *, TupleTableSlot *) recheckMtd) 行 95\tC\r\n \tpostgres.exe!ExecScan(ScanState * node, TupleTableSlot *(*)(ScanState *) accessMtd, bool(*)(ScanState *, TupleTableSlot *) recheckMtd) 行 145\tC\r\n \tpostgres.exe!ExecSeqScan(PlanState * pstate) 行 129\tC\r\n \tpostgres.exe!ExecProcNodeFirst(PlanState * node) 行 445\tC\r\n \tpostgres.exe!ExecProcNode(PlanState * node) 行 247\tC\r\n \tpostgres.exe!ExecutePlan(EState * estate, PlanState * planstate, bool use_parallel_mode, CmdType operation, bool sendTuples, unsigned __int64 numberTuples, ScanDirection direction, _DestReceiver * dest, bool execute_once) 行 1723\tC\r\n</pre>	2019-06-22 13:33:22.47694	f
899	451	Issue	5		2019-06-24 09:00:15.943711	f
895	451	Issue	5	优先提供一套嵌入pg的算法，确保代码的通用性，同时辅助测试。\r\n\r\n*IOT的核心问题是itempointer会变*。\r\n此处可参考btree的处理在README或代码注释中都有说明。\r\n\r\n_bt_readpage(IndexScanDesc scan, ScanDirection dir, OffsetNumber offnum)\r\n	2019-06-22 13:35:43.91084	f
889	451	Issue	5	CI IOT：\r\n没有left指针，不支持反序扫描。\r\n但是有right指针，以处理分裂完成部分的情况。\r\n也有HIGH KEY，避免每次都去找right sibling。同时high key作为索引的key。\r\n\r\n1，能否证明heap的page 0总是left most节点。\r\n基于两条规则，一是合并总是将右边向左边合并。二是分裂总是从左边向右边分裂。\r\n\r\n2 基于此规则，是否总能找到对应的tuple。\r\n合并：\r\n    删除索引\r\n    对左page加锁。\r\n    对右page加锁。\r\n    将右page数据拷贝到左page。\r\n    修改左page的right sibling。\r\n    释放锁。\r\n    回收右page。\r\n分裂：\r\n    分配右page\r\n    对左page加锁\r\n    将左page的数据拷贝到右page\r\n    修改右page的right sibling\r\n    修改左page的right sibling\r\n    释放page锁\r\n    在索引中插入右page的item\r\n\r\n    注意：除了最后一步，其他步骤是需要确保都成功的。最后一步失败没太大关系，相当于索引更稀疏了些。\r\n\r\n查找：\r\n    根据索引找到page，如果tuple大于page的最大key，则去right sibling查找。\r\n    否则page内执行2分查找。\r\n\r\n3，redo机制是否可用？需要做哪些调整？\r\n主要区别点在于right sibling。\r\n\r\n4，需要给IOT的表的page增加special space，保存right sibling。\r\n具体参考PageInit函数，page的special space是可自定义的。\r\n\r\n5，根据itemid排序处理\r\n在PageAddItemExtended函数上体现的明显，如果指定了插入位置，且并非overwrite的情况。说明就是排序情况了，索引需要挪动记录。\r\n对heap而言是不会这么干的。heap要么不给offset，自动在page内找位置，要么指定位置就一定是overwrite。\r\n\r\n6，加锁的风险\r\nsuper-exclusive lock，为了避免non-full vacuum与indexscan的顺序引入。\r\n-对于ci没必要。ci没有其他index-\r\n这是一个约束。\r\n但ci本身的index维护可能存在该问题	2019-06-22 09:45:09.705511	f
891	451	Issue	5	6，vacuum怎么玩？能兼容吗\r\n首先也是vacuum heap page，但是对于IOT，vacuum是否回收page呢？而且回收page对page的scan顺序应该有所要求？或与右侧合并。\r\nindex vacuum分为2步，第一步根据heap标记index item dead。第二步执行cleanup，清除deap page。\r\n7，analyze怎么玩？\r\n8，HeapTuple这套可以兼容吗？\r\n9，page 0的处理\r\npage 0不需要key，凡是找不到合适page的，都用page 0.\r\n10，不支持table scan的table？\r\nvacuum和analyze根本不用table scan。 \r\nvacuum是直接按照blocknum来的。analyze随机抽取page。\r\n11，AcScan的实现\r\n局部拷贝nodeIndexScan，少数地方还得处理下，比如order，比如实际不带scankey的情况。\r\n但不论如何AcScan出来的结果是按照X，Y有序的。\r\n如果key不好使，就从page 0开始。本质上还是IndexScan。\r\n所以目前可以伪装下，即AcScan总是IndexScan。区别仅在于scan完成后，需从ac page上取出满足条件的所有记录。\r\n\r\ntable scan还是有意义的，可以更多的利用顺序读。分阶段来做吧\r\n\r\n12，对于没有可用条件的情况\r\n_bt_first中有处理，其逻辑是符合ac要求的，从最左或最右边开始扫描。就是index full scan。	2019-06-22 10:22:57.287384	f
890	449	Issue	5	在哪里决定用什么scan的，又是如何将参数带下来。	2019-06-22 10:20:48.736259	f
901	423	Issue	5	page的LSN确保其不会优先于wal进行持久化。	2019-06-25 07:26:38.901917	f
898	451	Issue	5		2019-06-24 08:57:20.568395	f
893	451	Issue	5	约束：\r\n1，不支持反序扫描。 \r\n2，不支持索引。\r\n3，不支持记录级别的锁，即不支持select for share/update语法。\r\n4，不支持谓词锁\r\n5，不支持commandid	2019-06-22 12:47:21.307164	f
896	449	Issue	5	还要分析查询条件是如何获取的。\r\n\r\n<pre><code class="text">\r\n \tpostgres.exe!create_scan_plan(PlannerInfo * root, Path * best_path, int flags) 行 536\tC\r\n \tpostgres.exe!create_plan_recurse(PlannerInfo * root, Path * best_path, int flags) 行 380\tC\r\n \tpostgres.exe!create_plan(PlannerInfo * root, Path * best_path) 行 317\tC\r\n>\tpostgres.exe!standard_planner(Query * parse, int cursorOptions, ParamListInfoData * boundParams) 行 412\tC\r\n \tpostgres.exe!planner(Query * parse, int cursorOptions, ParamListInfoData * boundParams) 行 263\tC\r\n \tpostgres.exe!pg_plan_query(Query * querytree, int cursorOptions, ParamListInfoData * boundParams) 行 832\tC\r\n \tpostgres.exe!pg_plan_queries(List * querytrees, int cursorOptions, ParamListInfoData * boundParams) 行 898\tC\r\n \tpostgres.exe!exec_simple_query(const char * query_string) 行 1073\tC\r\n\r\n</code></pre>\r\n\r\nselect语句的执行主体\r\nExecutePlan\r\n\r\nruntime key的处理：\r\n\r\nExecIndexScan，会提前确定相关的值。\r\n	2019-06-22 13:37:31.325441	f
900	442	Issue	5	\r\nvm机制引入原因：\r\n1，可以避免重复vacuum，frozen\r\n2，index only scan用来判断可见性\r\n\r\n特点：\r\n1，需要与页面的内容修改一起记录wal，保证一致性。\r\n   all_visible_cleared\r\n\r\n2，page上的标记和vm里面的标记应该保持一致性。\r\n\r\nvm并发控制：\r\n1，check page flag\r\n2，pin vm\r\n3，lock buffer\r\n4，lock vm buffer\r\n\r\n2和3顺序不颠倒，主要是因为第2步有IO。\r\n\r\n<pre>\r\n * In heapam.c, whenever a page is modified so that not all tuples on the\r\n * page are visible to everyone anymore, the corresponding bit in the\r\n * visibility map is cleared. In order to be crash-safe, we need to do this\r\n * while still holding a lock on the heap page and in the same critical\r\n * section that logs the page modification. However, we don't want to hold\r\n * the buffer lock over any I/O that may be required to read in the visibility\r\n * map page.  To avoid this, we examine the heap page before locking it;\r\n * if the page-level PD_ALL_VISIBLE bit is set, we pin the visibility map\r\n * bit.  Then, we lock the buffer.  But this creates a race condition: there\r\n * is a possibility that in the time it takes to lock the buffer, the\r\n * PD_ALL_VISIBLE bit gets set.  If that happens, we have to unlock the\r\n * buffer, pin the visibility map page, and relock the buffer.  This shouldn't\r\n * happen often, because only VACUUM currently sets visibility map bits,\r\n * and the race will only occur if VACUUM processes a given page at almost\r\n * exactly the same time that someone tries to further modify it.\r\n</pre>	2019-06-25 07:12:41.004625	f
905	454	Issue	5	实施计划：\r\n1，开发的时候可以基于不带count的，即在某个表上创建ci类型的索引。然后就可以导入数据，查询。查询不经过heap。\r\n后面等元数据模块合入之后，就可以拿到ac的Relation，把特殊行为加进去。并且可以让ac relation兼容index relation，从而ciam可以单独使用。\r\n\r\n2，可以先不支持delete，但需支持scan。而且让其走indexonlyscan。把代价搞低方便调试。indexonlyscan就是最优的。	2019-06-26 09:11:32.426851	f
907	439	Issue	5	<pre><code class="text">\r\n/*\r\n * HeapTupleSatisfiesUpdate\r\n *\r\n *\tThis function returns a more detailed result code than most of the\r\n *\tfunctions in this file, since UPDATE needs to know more than "is it\r\n *\tvisible?".  It also allows for user-supplied CommandId rather than\r\n *\trelying on CurrentCommandId.\r\n *\r\n *\tThe possible return codes are:\r\n *\r\n *\tHeapTupleInvisible: the tuple didn't exist at all when the scan started,\r\n *\te.g. it was created by a later CommandId.\r\n *\r\n *\tHeapTupleMayBeUpdated: The tuple is valid and visible, so it may be\r\n *\tupdated.\r\n *\r\n *\tHeapTupleSelfUpdated: The tuple was updated by the current transaction,\r\n *\tafter the current scan started.\r\n *\r\n *\tHeapTupleUpdated: The tuple was updated by a committed transaction.\r\n *\r\n *\tHeapTupleBeingUpdated: The tuple is being updated by an in-progress\r\n *\ttransaction other than the current transaction.  (Note: this includes\r\n *\tthe case where the tuple is share-locked by a MultiXact, even if the\r\n *\tMultiXact includes the current transaction.  Callers that want to\r\n *\tdistinguish that case must test for it themselves.)\r\n */\r\n</code></pre>\r\n	2019-06-26 18:59:55.450119	f
908	439	Issue	5	10，如果一个事务，涉及多个操作，其中部分写了WAL，部分没有写。事务如何回滚？	2019-06-27 07:47:43.215314	f
910	455	Issue	5		2019-06-27 09:07:21.326816	f
911	455	Issue	5		2019-06-27 10:06:27.318211	f
913	455	Issue	5		2019-06-27 10:17:57.25956	f
922	444	Issue	5	Datum 使用指针存储int64，因而需要使用Datum特定接口来访问int64字段的值。显然对于其他字段也应该使用这种方式，这样更加符合规范。	2019-07-05 15:05:35.321956	f
914	455	Issue	5	隐含字段，header，其起始位置使用itempointer表示。只有需要解析出tuple时才用到。其他时间随着其他字段一起拷贝，管理。\r\n不支持toast index	2019-06-27 12:15:45.105085	f
924	459	Issue	5	<pre><code class="text">\r\nWhen it is necessary to wait for a tuple-level lock to be released, the basic\r\ndelay is provided by XactLockTableWait or MultiXactIdWait on the contents of\r\nthe tuple's XMAX.  However, that mechanism will release all waiters\r\nconcurrently, so there would be a race condition as to which waiter gets the\r\ntuple, potentially leading to indefinite starvation of some waiters.  The\r\npossibility of share-locking makes the problem much worse --- a steady stream\r\nof share-lockers can easily block an exclusive locker forever.  To provide\r\nmore reliable semantics about who gets a tuple-level lock first, we use the\r\nstandard lock manager, which implements the second level mentioned above.  The\r\nprotocol for waiting for a tuple-level lock is really\r\n\r\n     LockTuple()\r\n     XactLockTableWait()\r\n     mark tuple as locked by me\r\n     UnlockTuple()\r\n</code></pre>\r\n\r\n这段意思是由于之前锁唤醒机制的问题（没有等待队列，按序唤醒的机制），因而增加了共享内存中的tuple lock机制。\r\n但是由于冲突的情况通常少，且冲突时进程会等待，因而这种锁不会很多。	2019-07-07 19:33:01.937857	f
917	455	Issue	5	create table test8(x int, y int, z int, count int);\r\ncreate index idx8 on test8(x,y) include(count);\r\n\r\nSET enable_seqscan = OFF;\r\nSET enable_bitmapscan=0;\r\nselect pg_backend_pid();\r\nselect x,y,count from test8;\r\ninsert into test8 values(1,1,1,1);\r\ninsert into test8 values(1,2,2,1);\r\ninsert into test8 values(1,3,3,1);\r\ninsert into test8 values(1,1,11,2);\r\ninsert into test8 values(1,1,111,3);\r\ninsert into test8 values(1,2,22,2);\r\ninsert into test8 values(1,2,222,3);\r\n\r\ntest=# insert into test8 values(1,2,222,3);\r\nINSERT 0 1\r\ntest=# select x,y,count from test8;\r\n x | y | count\r\n---+---+-------\r\n 1 | 1 |     6\r\n 1 | 2 |     6\r\n 1 | 3 |     1\r\n(3 rows)	2019-06-28 14:26:12.017728	f
921	439	Issue	5	12，为什么tuple lock需要持久化? 莫非有事务在重启之后还需执行？\r\n13，key和nokey对于tuple lock有何影响？为什么要区分？	2019-06-30 18:33:40.625548	f
927	347	Issue	5	提供一个通用，方便的数据处理和交易平台。企业或个人参与平台的动力在于其需要别人的数据。\r\n支持大家一起维护数据，共享与使用。数据的引用度，以及评分。\r\n\r\n数据交易的透明化。	2019-07-10 07:57:20.928157	f
931	458	Issue	5	减少\r\n优化\r\n冗余\r\n三大方向。	2019-07-11 07:00:33.703094	f
932	406	Issue	5	cmake 3版本安装：\r\nsudo yum install epel-release\r\nsudo yum install cmake3	2019-07-11 07:27:58.86887	f
933	442	Issue	5	https://blog.csdn.net/pg_hgdb/article/details/79490875\r\nvacuum full：创建一个新的heap，把老的数据导出来，再导入并重建索引。\r\nvacuum：扫描heap，释放可用空间（表尾部占用的空间会被回收）。其中比较大的优化是利用vm来跳过部分page，但跳过page有要求（连续32个page是clean的）。\r\n然后根据删除的tuple的itempointer找到索引，在索引上执行bulkdelete。	2019-07-11 13:35:36.823949	f
937	456	Issue	5	成败论英雄，比赛见输赢，但人生应当豁达，乐观。	2019-07-13 19:01:38.530078	f
944	469	Issue	5	我理解是pg不支持单个进程不做AbortTransaction直接退出的。在退出处理时buffer状态是BM_IO_ERROR。这时读取该buffer的进程需重新加载该buffer。	2019-07-17 08:24:05.311926	f
947	469	Issue	5		2019-07-17 09:04:24.044732	f
949	468	Issue	5	vm处理困难主要在于性能，如果在btree上加锁，找到对应的插入位置，然后释放锁，读取vm。这样原来的buffer其key位置可能发生了变化。\r\nheap不存在这个问题，heap页面被修改之后，大不了recheck一下，看看空间是否足够。\r\n当然btree也可以这么做。释放锁之后，读取vm信息，然后再检查插入位置。\r\n\r\n另外btree的vacuum可以直接从叶子节点开始。\r\n\r\nbtree上的vm还有一点，其中间节点不存在vm，没有tuple 可见信息。\r\n\r\n	2019-07-17 18:35:22.576379	f
952	472	Issue	5		2019-07-18 15:22:01.594539	f
953	472	Issue	5	配置文件位于data目录下，修改后重启server生效。\r\n\r\n关于pg配置：\r\nhttps://blog.csdn.net/tencupofkaiwater/article/details/81069248	2019-07-18 15:22:41.450212	f
972	475	Issue	5	test=# copy ac810 from 'D:\\test600.data' delimiter ',';\r\nCOPY 10000000\r\nTime: 25941.265 ms (00:25.941)\r\ntest=# create table test810(x int, y int, count int);\r\nCREATE TABLE\r\nTime: 1.557 ms\r\ntest=# copy test810 from 'D:\\test600.data' delimiter ',';\r\nCOPY 10000000\r\nTime: 14902.586 ms (00:14.903)\r\ntest=#\r\n\r\n性能相差不到一倍。	2019-07-24 14:14:31.023041	f
920	280	Issue	5	有一天我站在阳台上，站在深圳的阳台与家里的有什么区别吗？\r\n为什么没法放下呢？我又在执著什么？\r\n\r\n成年人的世界多了很多责任，也多了很多世俗与成见。仿佛我们没有退路，竞争似乎在把人逼疯掉。\r\n然而我们似乎忘了自己生活在最好的时代。\r\n\r\n当我打羽毛球时，我想我想要的真的是羽毛球本身吗？不是的，我想要的是一种感觉，是安得倚天剑，是十步一杀人的侠客情怀。\r\n是领悟与获取成就的快乐。在羽毛球运动中我不仅看到了专业，热爱，认真带来的巨大效果，同时也看到唯有千锤百炼才能成为高手。\r\n所以不仅得走在正确的路上，还得不断的练习实践提高。\r\n\r\n但这不意味着"吃得苦中苦，方为人上人",这过程没有所谓的成功，更何谈人上人。这是一个无限的游戏，快乐相伴我们成长。\r\n\r\n德：知道什么是合适的，并按合适的方式生活工作。\r\n智：掌握做事情的方法，技巧。是知识与技能的结合。\r\n体：君子厚积薄发，体魄意志是人的基础。	2019-06-30 09:17:57.391006	f
916	455	Issue	5	CI可见与清理：\r\n\r\n相同key的tuple按序排列。插入时不需要清除。\r\n当count为0时，设置xmax标记。但对于btree这仍然是插入操作。\r\n\r\n\r\n扫描时，同一个key只需找到一个可见的。\r\n如果找到一个可见，但count为0.应该跳过后面的。\r\n或者连第一个都不可见。理论上不存在这种情况（前提条件是不设置xmax），要么就所有都不可见。\r\n\r\n如果xmin HeapTupleIsSurelyDead并且count为0，则可标记为DEAD。\r\n如果同一个key，有前面的key可标记为dead，则后面的key也可以标记为dead。\r\n第一个如何删除呢？\r\n\r\n另外如何支持后序扫描？\r\n\r\n并发控制：如果在一个key的最新版本上冲突，则回滚事务（后续可考虑使用内存锁机制，ac基本上不存在一次update很多行的情况）\r\n          对于update，永远不可能在非最新版本上执行（heap是通过行锁实现的）。ac的逻辑并非针对每行判断是否satisfy update。\r\n后序扫描：暂不支持，要支持后续扫描，则每个版本的可见性要独立出来。这样就需要遍历版本，找到可见版本。\r\n\r\n找到最新版本，并标记为不可见。然后插入新的版本。\r\n将insert和delete的逻辑合并，唯一区别就在于对count的处理上，这个在上层稍作处理。\r\n\r\n\r\n	2019-06-28 10:16:50.371029	f
923	459	Issue	5	1，为什么有default和user不同的lock method？\r\n可能是行为不一样，user的需用户释放\r\n\r\n2，proclock具体是指？\r\n\r\n3，tuple lock放在tuple持久化，内存中记录了啥？如何做死锁监测？\r\n在冲突等待的时候，内存中还是有记录的。\r\n	2019-07-07 19:12:11.69621	f
925	390	Issue	5	激励自己的目标这个一定要看清楚。当我一个人的时候，有空闲的时候我会投入精力去做它么。	2019-07-07 21:46:03.022498	f
926	463	Issue	5		2019-07-10 07:52:18.907389	f
928	347	Issue	5		2019-07-10 07:59:18.113935	f
936	442	Issue	5	vacuum是先清理index，然后回收heap item的。\r\n\r\n使用特殊标志，标记frozen：\r\n#define HEAP_XMIN_FROZEN\t\t(HEAP_XMIN_COMMITTED|HEAP_XMIN_INVALID)	2019-07-13 18:37:24.068984	f
930	458	Issue	5		2019-07-11 06:59:08.58921	f
939	429	Issue	5	搜索技巧：\r\n1，可以带pdf搜文档，论文\r\n2，优先考虑上官网\r\n3，带专业词语搜索，结果会好很多\r\n\r\n工作技巧：\r\n1，如果不能进一步思考，或一团乱麻时。先理清概念，用逻辑方式一步步严密的演绎。	2019-07-13 19:24:02.395625	f
934	438	Issue	5	18，为什么在非mvcc，非wal-logged，以及index-only情况下不能提前释放pin？\r\n\r\n<pre><code class="c">\r\nstatic void\r\n_bt_drop_lock_and_maybe_pin(IndexScanDesc scan, BTScanPos sp)\r\n{\r\n\tLockBuffer(sp->buf, BUFFER_LOCK_UNLOCK);\r\n\r\n\tif (IsMVCCSnapshot(scan->xs_snapshot) &&\r\n\t\tRelationNeedsWAL(scan->indexRelation) &&\r\n\t\t!scan->xs_want_itup)\r\n\t{\r\n\t\tReleaseBuffer(sp->buf);\r\n\t\tsp->buf = InvalidBuffer;\r\n\t}\r\n}\r\n</code></pre>\r\n\r\n其中一个作用可能是killitem（pin），但是这跟index-only似乎没关系。\r\n\r\nhttps://www.postgresql.org/message-id/920499679.2734010.1425495532615.JavaMail.yahoo%40mail.yahoo.com\r\nbtree-nopin有点意思	2019-07-11 18:58:55.980934	f
935	447	Issue	5	对于toast字段，在创建index tuple时会展开。如果记录长度超过index最大size(代码里面是8k)，就会报错。\r\n但是要考虑压缩长度。超过TOAST_INDEX_TARGET后就会压缩。\r\n\r\n实测数据达到8112长度时，index写入会报错，但是错误不是size超过，而是：\r\n<pre><code class="text">\r\ntest=# copy ac12 from 'D:\\test100.data' delimiter ',';\r\nERROR:  could not find a feasible split point for index "ac12"\r\nCONTEXT:  COPY ac12, line 1: "1,11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111..."\r\n</code></pre>\r\n	2019-07-12 15:02:46.968197	f
938	460	Issue	5	我能看到自己身上悲观的情绪，也能看到自己骨子里的散漫与放纵。这与自由相差甚远。\r\n当独自一人时，我们更能看清自己。无数时刻，自己在刷着无聊的文章和视频，玩着游戏与别的。\r\n任凭自己的头脑就如此贫瘠着。我在任何领域都离高手都相差甚远。\r\n\r\n英雄情节？万丈豪情？ no,no 那不是我。狭隘，悲观，消极，散漫是当下的我。\r\n如果你看不到别人的努力和认真，那你不可能是高手。	2019-07-13 19:10:36.770232	f
940	438	Issue	5		2019-07-13 20:32:18.310907	f
941	465	Issue	5		2019-07-13 20:32:18.316395	f
942	466	Issue	5		2019-07-13 20:33:45.925297	f
943	439	Issue	5		2019-07-13 20:33:45.929679	f
973	479	Issue	5	常规测试用例：\r\n如果一个事务内插入100条记录。重复N次，占用的存储空间应该不会增长。\r\n\r\n_bt_vacuum_one_page在执行该函数之后，应该需要重新定位offset，位置可能变化。	2019-07-24 18:26:23.432304	f
969	479	Issue	5	构造一个含各种数据类型，带NULL值，以及存在各种数量，各种插入顺序的表，导入ac，然后对比测试结果。\r\n这个用例可以一直跑下去。直到出错。\r\n\r\n输入：\r\n1，构造一个大表，包含各种数据类型\r\n2，构造各种情况下的数据，包含插入和删除操作。\r\n3，构造比较语句\r\n4，手动触发vacuum\r\n5，手动触发analyze命令\r\n6，vacuum full\r\n\r\n内部任务：\r\n1，配置好vacuum时间，导入ac的同时导入到另外一个表，每次验证都对比查询结果。\r\n2，同步。\r\n\r\n异常：\r\n1，postgres进程被杀死\r\n2，全体被杀死，然后拉起\r\n	2019-07-23 15:03:18.740113	f
929	442	Issue	5	Freezen触发时机：\r\nSelects aggressive "freezing" of tuples. Specifying FREEZE is equivalent to performing VACUUM with the vacuum_freeze_min_age and vacuum_freeze_table_age parameters set to zero.\r\n Aggressive freezing is always performed when the table is rewritten, so this option is redundant when FULL is specified.\r\n\r\n正常情况下Freezen是必须做的，但是有参数可以控制是否做aggressive。\r\naggressive模式下如果遇到锁冲突会等待。通过table age参数控制是否aggressive。\r\ntuple age用来计算tuple是否需要frozen。\r\n相关参数：\r\n<pre><code class="text">\r\ntest=# select name,setting, short_desc  from pg_settings where name like '%freeze%';\r\n                name                 |  setting  |                                  short_desc\r\n-------------------------------------+-----------+-------------------------------------------------------------------------------\r\n autovacuum_freeze_max_age           | 200000000 | Age at which to autovacuum a table to prevent transaction ID wraparound.\r\n autovacuum_multixact_freeze_max_age | 400000000 | Multixact age at which to autovacuum a table to prevent multixact wraparound.\r\n vacuum_freeze_min_age               | 50000000  | Minimum age at which VACUUM should freeze a table row.\r\n vacuum_freeze_table_age             | 150000000 | Age at which VACUUM should scan whole table to freeze tuples.\r\n vacuum_multixact_freeze_min_age     | 5000000   | Minimum age at which VACUUM should freeze a MultiXactId in a table row.\r\n vacuum_multixact_freeze_table_age   | 150000000 | Multixact age at which VACUUM should scan whole table to freeze tuples.\r\n</code></pre>\r\n\r\n\r\nrelation_needs_vacanalyze函数用来计算table是否必须vacuum。\r\n\r\n<pre><code class="c">\r\n\txidForceLimit = recentXid - freeze_max_age;\r\n\tif (xidForceLimit < FirstNormalTransactionId)\r\n\t\txidForceLimit -= FirstNormalTransactionId;\r\n\tforce_vacuum = (TransactionIdIsNormal(classForm->relfrozenxid) &&\r\n\t\t\t\t\tTransactionIdPrecedes(classForm->relfrozenxid,\r\n\t\t\t\t\t\t\t\t\t\t  xidForceLimit));\r\n\tif (!force_vacuum)\r\n\t{\r\n\t\tmultiForceLimit = recentMulti - multixact_freeze_max_age;\r\n\t\tif (multiForceLimit < FirstMultiXactId)\r\n\t\t\tmultiForceLimit -= FirstMultiXactId;\r\n\t\tforce_vacuum = MultiXactIdPrecedes(classForm->relminmxid,\r\n\t\t\t\t\t\t\t\t\t\t   multiForceLimit);\r\n\t}\r\n</code></pre>\r\n\r\n\r\n	2019-07-10 14:03:06.295196	f
945	469	Issue	5	https://postgreshelp.com/operating-system-kill-signals-on-postgresql/\r\n如果是kill -9就直接退出所有进程\r\n\r\n<pre><code class="c">\r\n/*\r\n   * Additionally, for shared-memory-connected workers, just like a\r\n   * backend, any exit status other than 0 or 1 is considered a crash\r\n   * and causes a system-wide restart.\r\n   */\r\n</code></pre>\r\n	2019-07-17 08:47:18.15546	f
946	469	Issue	5		2019-07-17 09:04:19.286478	f
959	473	Issue	5		2019-07-19 08:26:09.124372	f
948	468	Issue	5	把vm加上去，最后需不需要btree代码扣出来再看。\r\n\r\n先用简单做法，在page上增加标记。不过貌似也不算简单。可以随带标记。---------后面如果觉得效率不行，也可以把vm加上去\r\n并且在vacuum的时候可以先加读锁，然后使用写锁。\r\n\r\n貌似可以共用一套逻辑，将ci tuple的删除与frozen使用同一个操作码。（万一不行启用新的操作码也没关系）。\r\n	2019-07-17 09:17:10.232636	f
966	477	Issue	5	人性格的不同，所以关注点不一样，喜欢的点也不一样。有人只喜欢羽毛球场上的部分。有人喜欢研究策略，研究已有选手。 有人喜欢研究装备，参数。有人擅长体能训练。\r\n这就是流派。 江湖就是流派pk，生态就是涉及所有过程的上下游以及支撑体系。	2019-07-19 15:08:10.907063	f
950	468	Issue	5	看看bt build的实现。全量加载数据可以利用内存缓冲。\r\nVACUUM FULL还是得支持，否则空间无法释放。\r\n\r\nvacuum之后，如果page可以释放，那么再pg_class中显示的page数量是否可减小，不能，这个反应的实际page数量。计算的时候要注意这点。\r\nindex页面膨胀代价，测试下插入100万，vacuum再插入100万，ac占用空间应该不会上升。\r\n\r\nrelpages | reltuples       | relallvisible\r\n总页数     总live记录数      非叶子节点总是可见的	2019-07-18 11:51:56.231501	f
951	442	Issue	5	index page空间回收利用：\r\nindex recycle page需要page mark delete的事务id小于RecentGlobalXmin,然而如果近期没有事务则该值不变。会导致index page无法recycle。	2019-07-18 13:41:37.031542	f
955	468	Issue	5	<pre>\r\ntest=# copy ac100 to stdout;\r\n1       2       50005000\r\n1       3       500000500000\r\ntest=# select * from pg_class where relname='ac100';\r\n relname | relnamespace | reltype | reloftype | relowner | relam | relfilenode | reltablespace | relpages | reltuples | relallvisible | reltoastrelid | relhasindex | relisshared | relpersistence | relkind | relnatts | relchecks | relhasoids | relhasrules | relhastriggers | relhassubclass | relrowsecurity | relforcerowsecurity | relispopulated | relreplident | relispartition | relrewrite | relfrozenxid | relminmxid | relacl | reloptions | relpartbound\r\n---------+--------------+---------+-----------+----------+-------+-------------+---------------+----------+-----------+---------------+---------------+-------------+-------------+----------------+---------+----------+-----------+------------+-------------+----------------+----------------+----------------+---------------------+----------------+--------------+----------------+------------+--------------+------------+--------+------------+--------------\r\n ac100   |         2200 |       0 |         0 |       10 |   403 |       16388 |             0 |    12227 |      6114 |             0 |             0 | f           | f           | p              | a       |        3 |         0 | f          | f           | f              | f              | f              | f                   | t              | n            | f              |          0 |   4244967870 |          0 |        |            |\r\n(1 row)\r\n重启后再次vacuum，出现了计算非常不准确的情况，但不是必现的。\r\n</pre>	2019-07-18 18:09:00.481794	f
957	468	Issue	5	IndxAmRoutine在后面会慢慢无法适合AC，其中一个例子就是insert操作无法携带command ID	2019-07-19 07:50:34.213888	f
968	476	Issue	5	tuplesort_sort_memtuples\r\ntuplesort_performsort\r\n	2019-07-22 07:05:15.722939	f
967	475	Issue	5	在内存中sort之后，进行一次合并操作。\r\n\r\n插入过程：\r\n可以给每个页面预留一些空间，以便于增量更新。	2019-07-22 07:00:52.779596	f
954	442	Issue	5	https://www.pgcon.org/2015/schedule/attachments/367_Vacuum.pdf\r\n\r\nExtremely high rates of update transactions,\r\nFOR SHARE LOCK, or concurrent FK checks can cause freeze problems\r\n\r\n<pre><code class="text">\r\nFor each table\r\n‣ Scan heap, remembering tuples to remove\r\n‣ Scan indexes, removing tuples\r\n‣ Remove tuples from heap\r\n‣ If ANALYZE option specified, do analyze. \r\n</code></pre>\r\n\r\n<pre><code class="text">\r\nIt is very difficult to reduce the size of a bloated index. \r\nDon’t let bloat happen, and if it does, reindex\r\n</code></pre>\r\n\r\n<pre><code class="text">\r\nvac_update_datfrozenxid\r\n\r\n• Called by vacuum()\r\n• Updates datfrozenxid and datminmxid\r\n• If new values for either\r\n‣ Truncate Commit LOG files (pg_clog)\r\n‣ Update internal frozen XID and MXID info\r\n‣ MultiXact files (pg_multixact) are truncated during checkpoint\r\n</code></pre>\r\n\r\n<pre><code class="text">\r\n• Long running transactions hurt vacuum\r\n• High transaction rates, use of FOR SHARE LOCK and concurrent FK checks increase the need to FREEZE\r\n• Indexes referencing heavily updated columns prevent HOT\r\n• Make maintenance_work_mem large for vacuum\r\n• It's very difficult to reduce the size of a bloated index\r\n• autovacuum can only do so much\r\n</code></pre>\r\n\r\n\r\n	2019-07-18 16:23:43.71353	f
956	468	Issue	5		2019-07-18 18:09:33.362292	f
960	473	Issue	5		2019-07-19 08:26:13.798636	f
962	332	Issue	5	tikv，spanner需要解决的分布式事务冲突问题，通过时间戳产生数据的唯一版本，然后在冲突时回滚。	2019-07-19 12:51:56.547274	f
961	475	Issue	5	内存中的管理可参考BTSpool，不过需增加累计的处理。\r\n搞清除2个约束条件：一是内存空间，二是记录条数。\r\n\r\n来一批，写满之后刷到临时文件。\r\n再来一批，写满之后刷到临时文件。\r\n全部完成后，排序并构建btree。\r\n\r\n合并count：\r\n1，每个批次都进行合并\r\n2，最终排序时也做相同key的合并。	2019-07-19 09:26:16.436122	f
963	476	Issue	5	tuple sort的算法完全是可以重用的。区别主要在于从sort结果取出来，生成具体的data page的时候，可以进行合并。	2019-07-19 13:53:41.359452	f
964	475	Issue	5	<pre><code class="text">\r\n\t/*\r\n\t * spool2 is needed only when the index is a unique index. Dead tuples are\r\n\t * put into spool2 instead of spool in order to avoid uniqueness check.\r\n\t */\r\n\tBTSpool    *spool2;\r\n</code></pre>\r\n\r\n这个对于ac是不需要的，将所有活着的相同key的tuple合并，实际上可以断言是不存在这种情况的。\r\n对于数据导入的情况，是允许非unique的，在实际写入时合并。	2019-07-19 13:57:47.408868	f
965	475	Issue	5	看来IndexAmRoutine已经包不住了，需要增加一个接口：支持从排序的数据中构建出新的ac存储体（如ci的btree）\r\n\r\n最好在sort的时候就合并，这样可以节省内存空间。即批次的合并。	2019-07-19 14:31:49.259381	f
971	475	Issue	5	将多个批次的内存记录写入到相同文件 显然逻辑上就有错误。\r\n一个批次的内存记录是有序的，除非把原来写入的记录读出并重新排序。\r\n\r\n还有一种办法是不写入文件，先做一次内存compact。然后继续写入。这与加大点内存的效果类似。\r\n\r\nTODO：先作为一个优化点吧，这效果应该不如将index记录瘦身。	2019-07-24 13:55:50.542738	f
970	474	Issue	5	技术债务：\r\n1，事务这块需要完全搞清楚，能否压缩成只需必要字段。\r\n2，并发机制简化是否可行，后续会不会数据来源于本地事务？\r\n\r\nheader优化，主要麻烦在于Satisfy 相关函数。其中使用了cid，并且直接使用HEapTupleHeader结构。\r\n同时HeapTupleSatisfiesVisibility使用函数指针，需根据情况来决定使用了哪个satisfy函数。\r\n\r\n在扫描ac表的时候替换下函数？	2019-07-24 13:51:47.442073	f
958	473	Issue	5	<pre><code class="text">\r\nThe hole in this logic is that there can be multiple active scans with\r\ndifferent values of CurrentCommandId (eg, within a function\r\nCurrentCommandId may be different than it is outside).  If you overwrite\r\ncmin with cmax then you are destroying the information needed by a scan\r\nwith smaller CurrentCommandId than yours.\r\n</code></pre>\r\n\r\n<pre><code class="text">\r\n * We store five "virtual" fields Xmin, Cmin, Xmax, Cmax, and Xvac in three\r\n * physical fields.  Xmin and Xmax are always really stored, but Cmin, Cmax\r\n * and Xvac share a field.  This works because we know that Cmin and Cmax\r\n * are only interesting for the lifetime of the inserting and deleting\r\n * transaction respectively.  If a tuple is inserted and deleted in the same\r\n * transaction, we store a "combo" command id that can be mapped to the real\r\n * cmin and cmax, but only by use of local state within the originating\r\n * backend.  See combocid.c for more details.  Meanwhile, Xvac is only set by\r\n * old-style VACUUM FULL, which does not have any command sub-structure and so\r\n * does not need either Cmin or Cmax.  (This requires that old-style VACUUM\r\n * FULL never try to move a tuple whose Cmin or Cmax is still interesting,\r\n * ie, an insert-in-progress or delete-in-progress tuple.)\r\n</code></pre>\r\n\r\n在一个事务内，scan可能拥有老的CommandID，比如游标操作。这样就存在这种情况：scan到同一个事务在scan开始时对应的CID之后的数据。\r\n\r\n一旦事务结束，Command ID就可以复用了。因而vacuum可以复用该字段。\r\n\r\nCombo CommandID是用来解决在一个事务内同时insert和delete了一个tuple，这时同时需要cmin和cmax的情况。\r\n\r\nAC不存在这个问题，AC的写入删除总是与查询分离的。\r\n\r\n	2019-07-19 08:14:27.962886	f
974	481	Issue	5		2019-07-25 14:45:02.356287	f
985	472	Issue	5	PG日志缺陷：\r\n代码中能看到的pg日志非常少，即便当前日志级别是debug2，debug3级别的日志仍然会处理。\r\nmultitrans为了调试，还专门增加了debug_elog2宏	2019-07-31 15:33:52.443225	f
975	475	Issue	5	使用在原来relation上重建有个问题，就是oid发生了变化，这点可能打破了pg原来的约束。需要看看oid与relfilenode的关系。\r\n\r\n是否需要invalidate relcache呢？ \r\n老的文件没有删除掉？\r\n      删除掉了，在整个重启之后老文件就不见了。\r\n\r\n\r\n\r\n	2019-07-29 06:45:06.502318	f
976	482	Issue	5	多线程模型在这点上相对简单一些，进程收到退出信号后，整体退出。不像pg还考虑共享资源。	2019-07-29 07:29:17.176075	f
977	475	Issue	5	调试过程中出现一个bug：实际数据已经写入了，但是使用copy命令无法读取任何数据。\r\n重启server之后又能看到数据。	2019-07-29 09:29:04.172021	f
978	482	Issue	5	README: Resource Owners 	2019-07-29 15:18:17.359086	f
979	423	Issue	5	注意有些操作是不能rollback的，也就是说只能往前走。比如truncate，请参考RelationTruncate。	2019-07-29 15:28:14.363479	f
980	484	Issue	5	https://madusudanan.com/blog/all-you-need-to-know-about-sorting-in-postgres/	2019-07-29 18:19:57.362655	f
981	479	Issue	5	vacuum，\r\nanalyze，\r\nrebuild，\r\nfullsync，\r\nincsync，\r\ninline vacuum， 构造用例验证膨胀情况，是否能否正常在线vacuum。\r\ndata type，different schema，\r\nfetch with condition，\r\nphycical replica，\r\nlogic replica， \r\nhot standby，\r\nrecovery，\r\nconcurrency，\r\nSSI\r\nfailed condition，比如count为负数导致出错的情况，能否重复执行。\r\nincremental写入时，应该有优化。\r\n\r\n	2019-07-30 15:09:32.929504	f
982	485	Issue	5	没有WAL的table特征：\r\n1，vm信息不准确\r\n2，page没有正确的lsn\r\n3，故障后丢弃数据，且面临index与heap不一致的问题。	2019-07-31 12:50:32.105156	f
983	485	Issue	5	存在的意义：\r\nUnlogged tables are appealing for data that needs to be shared across backends, but which we're willing to lose in the case of a server restart. For example, consider a web application maintaining a table of active user sessions. If the server restarts, we may be willing to lose this data. Everyone will need to log in again, but considering that database crashes are rare, that may not be such a big deal. Unlogged tables also won't be replicated to standby servers, since replication relies on WAL. But, on the plus side, skipping WAL-logging should hopefully yield a significant performance benefit. 	2019-07-31 12:58:47.076897	f
986	479	Issue	5	增加了debug日志，果然好用。\r\n可以看到vacuum online与mark dead，删除老版本都是可以工作的。\r\n但是在线vacuum在大量写入时效果有限，因为当前页面很多record无法清理。但是可以想象在数据分布随机时，应该有不错的效果。 --- 可以使用x万个事务，每次写入相同记录，理论上数据应该不会超过一个页面。\r\nvacuum可以有效的抑制膨胀，但是需要系统事务往前走。\r\n追加写入的优化虽然有，但是效果不好，因为ac总是在一个版本的最原始的位置写入。\r\n	2019-07-31 18:07:29.228128	f
988	289	Issue	5	https://stackoverflow.com/questions/10241957/difference-between-fuzz-testing-and-monkey-test\r\n\r\nUI/Application Exerciser Monkey is a fuzz testing tool. \r\nThe name is probably related to the fact that it behaves as if a monkey uses your application. \r\n\r\nThe bottom line is that Monkey test and Fuzz testing are different names for essentially the same thing. \r\nHowever, there might be one subtle difference: \r\nwhile Fuzz testing is more about using *random data*, Monkey testing is about *random actions*.\r\n\r\n可以结合起来，Monkey testing实际也会用到各种hook，从而构造异常的action。当然也有很多异常是不需要特别构造的。	2019-08-01 14:49:38.719544	f
989	426	Issue	5	知识：\r\n\r\n定义，分类，结构, \r\n关系，过程，并行，\r\n\r\n动作：\r\n分享，同步，一致\r\n\r\n变化，时间，空间	2019-08-01 15:32:22.546175	f
991	479	Issue	5	rebuild之后relfilenode与表oid不一致会不会有问题。	2019-08-02 12:29:53.589671	f
994	446	Issue	5	功能与单元测试：\r\nhttps://wiki.postgresql.org/wiki/Test_Frameworks\r\n\r\n使用regress实现功能测试基本没问题，甚至可以使用extension细化测试。\r\n\r\n进程故障测试可以模拟，当前可使用count为负数构造transaction失败情况。\r\n\r\npostmaster重启故障\r\n\r\n注入故障测试，在指定的点出现PANIC或ERROR。\r\nhttps://www.postgresql.org/message-id/CAMkU=1xEUuBphDwDmB1WjN4+td4kpnEniFaTBxnk1xzHCw8_OQ@mail.gmail.com	2019-08-05 08:53:00.773328	f
993	479	Issue	5	分三步走：\r\n1，继续补充基本功能用例\r\n  recovery and frozen测试，使用复制来测试recovery。\r\n\r\n2，完善page inspect工具\r\n3，在pg上实现一个注入框架	2019-08-05 08:45:44.293509	f
995	469	Issue	5	errfinish：\r\npg当日志出现PANIC以及以上级别错误时，会直接abort子进程，父进程也会因此退出。	2019-08-05 17:53:49.328004	f
984	465	Issue	5	再次解读：\r\npg相关commit：\r\nReduce pinning and buffer content locking for btree scans.\r\n\r\n\r\nSince VACUUM deletes index entries before reclaiming heap tuple line pointers\r\n\r\n1，删除index entry\r\n2，reclaiming heap tuple line pointer\r\n\r\n问题：\r\nheap tuple的line pointer写入新的tuple。但是scan缓存的是老的tuple。\r\n但这问题与上述顺序无关系，如果先reclaiming heap line pointer，这问题就更容易出现了。\r\n\r\nthe super-exclusive lock guarantees that VACUUM can't reclaim for re-use a\r\nline pointer that an indexscanning process might be about to visit.\r\n怎么做到？就是排除当前page被index scan，这就要求index scan不释放pin从而完整这个检查。\r\n\r\nThis guarantee works only for simple indexscans that visit the heap in sync\r\nwith the index scan, not for bitmap scans.\r\n\r\nbitmap scans怎么办？\r\n\r\nWe only need the guarantee\r\nwhen using non-MVCC snapshot rules; when using an MVCC snapshot, it\r\ndoesn't matter if the heap tuple is replaced with an unrelated tuple at\r\nthe same TID, because the new tuple won't be visible to our scan anyway.\r\nTherefore, a scan using an MVCC snapshot which has no other confounding\r\nfactors will not hold the pin after the page contents are read. \r\nMVCC下tid对应的tuple变长其他new tuple也没关系，反正也是看不见的。\r\n但是有例外情况：\r\nThe current reasons for exceptions, where a pin is still needed, are if the\r\nindex is not WAL-logged or if the scan is an index-only scan.\r\n1，index-only scan例外是因为它利用vm判断可见性，可能不会读取heap tuple可见信息\r\n2，not WAL-logged特殊是因为其没有lsn信息，如果释放pin，则_bt_killitems无法根据lsn判断是否可以清除item。\r\n\r\nhttps://www.postgresql.org/message-id/848652045.4044965.1426259305233.JavaMail.yahoo%40mail.yahoo.com\r\n\r\n>>> At some point we could consider building on this patch to\r\n>>> recheck index conditions for heap access when a non-MVCC\r\n>>> snapshot is used, check the visibility map for referenced heap\r\n>>> pages when the TIDs are read for an index-only scan, and/or\r\n>>> *skip LP_DEAD hinting for non-WAL-logged indexes*.  But all those\r\n>>> are speculative future work; this is a conservative\r\n>>> implementation that just didn't modify pinning where there were\r\n>>> any confounding factors.\r\n\r\n_bt_killitems(IndexScanDesc scan)：\r\n>>> If the pin was released after reading the page, then we re-read it.  If it\r\n>>> has been modified since we read it (as determined by the LSN), we dare not\r\n>>> flag any entries because it is possible that the old entry was vacuumed\r\n>>> away and the TID was re-used by a completely different heap tuple.	2019-07-31 14:02:49.71994	f
987	479	Issue	5	Postgresql用例可以使用相对路径的，在regress下的input output目录就是相关用例。	2019-08-01 08:59:57.703077	f
990	438	Issue	5	关于amoptionalkey \r\n\r\nhttps://www.postgresql.org/docs/9.4/index-catalog.html\r\n对比btree其支持full scan，更别说没有first key了。但是没有first key，很可能无法快速找到第一个page，只能遍历时用来过滤。\r\n\r\n_bt_first中有具体逻辑，有针对null情况的优化。\r\n	2019-08-02 08:56:44.773091	f
992	458	Issue	5		2019-08-02 14:43:18.765047	f
\.


--
-- Name: journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.journals_id_seq', 995, true);


--
-- Data for Name: member_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.member_roles (id, member_id, role_id, inherited_from) FROM stdin;
1	1	3	\N
2	2	3	\N
3	3	3	\N
4	4	3	\N
5	5	3	\N
6	6	3	\N
7	7	3	\N
8	8	3	\N
9	9	3	\N
10	10	3	\N
11	11	3	\N
12	12	3	\N
13	13	3	\N
16	16	3	\N
17	17	3	\N
18	18	3	\N
19	19	3	\N
20	20	3	\N
21	21	3	\N
22	22	3	\N
24	24	3	\N
\.


--
-- Name: member_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.member_roles_id_seq', 24, true);


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.members (id, user_id, project_id, created_on, mail_notification) FROM stdin;
1	5	1	2017-09-09 13:44:14.789108	f
2	5	2	2017-09-29 15:10:43.170467	f
3	5	3	2018-09-21 12:40:30.177546	f
4	5	4	2018-09-21 12:43:25.159787	f
5	5	5	2018-10-06 06:52:05.913283	f
6	5	6	2018-10-06 06:55:05.142788	f
7	5	7	2018-10-06 06:58:50.469603	f
8	5	8	2018-10-06 19:30:02.336985	f
9	5	9	2018-10-11 07:38:55.381493	f
10	5	10	2018-10-23 08:46:47.550045	f
11	6	11	2018-11-02 21:17:56.13826	f
12	5	11	2018-11-02 21:44:20.988067	f
13	6	12	2018-11-04 09:26:25.382233	f
16	5	15	2018-12-01 16:16:30.686479	f
17	5	16	2019-02-15 07:00:28.179207	f
18	5	17	2019-02-20 08:44:13.828998	f
19	5	18	2019-03-06 22:42:24.328044	f
20	6	19	2019-03-18 07:36:59.035039	f
21	6	20	2019-03-18 08:22:17.451149	f
22	6	21	2019-03-18 15:34:34.970119	f
24	5	23	2019-05-13 06:55:47.29369	f
\.


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.members_id_seq', 24, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.messages (id, board_id, parent_id, subject, content, author_id, replies_count, last_reply_id, created_on, updated_on, locked, sticky) FROM stdin;
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.news (id, project_id, title, summary, description, author_id, created_on, comments_count) FROM stdin;
1	1	成立共进会	研讨以下几个方面的问题：1，产品路线  2，业界资讯  3，人才发掘  4，体系改进   	不讨论：产品进度，特性开发，bug修复，性能测试等具体任务。\r\n\r\n非官方组织，第一批由公司少数骨干自由加入\r\n\r\n进入标准：发表一个上述主题的演讲，被其他成员认可。	5	2017-11-02 06:58:54.218828	1
2	1	mos组发展建议	讨论人才需求，产品线路，内部流程体系，软件大体分割，组织结构划分等。	软件是有生命的，在不同方向都需要发展，每个方向都有做不完的事情，但是术业有专攻。\r\n\r\n事情有需要做的，有不需要做的，有可以小做的，有需要大做的。\r\n\r\n人可以兼任，但是角色不能缺失。\r\n\r\n行业调研，社区跟踪，创新规划这方面需要一个有经验，有前瞻性的人。  *这是组织的眼睛*\r\n\r\n产品落实，方案设计，软件实现，功能测试，自测(这块完全没做起来)。\r\n集成测试。\r\n文档，安全整改\r\n运维\r\n\r\n这些都是需要的角色。\r\n\r\n我们的招人的目标是找到对我们缺乏角色 正好有兴趣，有志于在这些领域发力的人。\r\n我们需要招的是有追求的人，而不是仅仅完成工作的人。严格工作验收标准。\r\n\r\n让组织进入正向循环，我们不加班，但是要求良好的身体状态，高效的工作。\r\n\r\n我们不仅是一个工作团体，还是一个相互促进的团体，一个让人变得更好的团队。\r\n\r\n我们的使命：用创新存储技术定义美好未来 \r\n	5	2017-11-02 07:24:17.818835	0
\.


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.news_id_seq', 2, true);


--
-- Data for Name: open_id_authentication_associations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.open_id_authentication_associations (id, issued, lifetime, handle, assoc_type, server_url, secret) FROM stdin;
\.


--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.open_id_authentication_associations_id_seq', 1, false);


--
-- Data for Name: open_id_authentication_nonces; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.open_id_authentication_nonces (id, "timestamp", server_url, salt) FROM stdin;
\.


--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.open_id_authentication_nonces_id_seq', 1, false);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members, default_version_id, default_assigned_to_id) FROM stdin;
5	政经法文史哲	记录自己阅读过的经济，政治，法律知识		f	\N	2018-10-06 06:52:05.872179	2019-02-03 17:16:25.760802	zjf	1	23	24	f	\N	\N
11	个人形象	整理个人形象相关知识		t	\N	2018-11-02 21:17:56.088144	2018-11-03 06:13:12.042154	my_show	1	13	14	f	\N	\N
2	s3client	使用go开发一个简单的s3 client,命令行方式，可以在windows和linux上运行。		f	\N	2017-09-29 15:10:43.099959	2018-11-04 08:57:35.201875	s3client	1	9	10	f	\N	\N
10	行业与市场调研	了解市场行情，技术趋势等		f	\N	2018-10-23 08:46:47.501908	2019-02-03 17:16:47.631665	business	1	33	34	f	\N	\N
4	英语学习	为了远离贫乏无趣的垃圾新闻，资讯		t	\N	2018-09-21 12:43:25.125945	2018-11-04 09:06:43.287005	english	1	31	32	f	\N	\N
21	房屋装修知识篇	2019年完成第一套房屋装修\r\n\r\n\r\n\r\n		t	\N	2019-03-18 15:34:34.925627	2019-03-18 15:34:59.894009	family-1	1	21	22	f	\N	\N
1	ceph jewel	mos，对象存储，基于http的restful api，提供对象处理等增值功能	http://ceph.com/	f	\N	2017-09-08 11:35:55.561573	2018-12-08 22:13:03.174772	ceph-jewel	1	7	8	f	\N	\N
9	三人行必有我师	注意自己思维上可能存在的漏洞，同时明白自己存在的局限性。 这样经常自省，同时善于与人合作，借用别人的长处。		f	\N	2018-10-11 07:38:55.35387	2019-02-03 17:15:37.076377	improve	1	11	12	f	\N	\N
8	人，心理，性格	了解关于人的一切		f	\N	2018-10-06 19:30:02.311049	2019-02-03 17:15:52.348994	disposition_psychological	1	15	16	f	\N	\N
7	计算机学习	学习计算机相关知识，包括数学知识等		f	\N	2018-10-06 06:58:50.439351	2018-11-02 21:12:10.930594	algorithm	1	35	36	f	\N	\N
17	SICS	数据库，数据分析加速		t	\N	2019-02-20 08:44:13.769895	2019-04-22 12:51:06.139828	sics	1	5	6	f	\N	\N
18	脑洞想法	描述关于创业的各方面		t	\N	2019-03-06 22:42:24.284928	2019-04-24 09:11:33.087916	trade	1	29	30	f	\N	\N
23	软件工程	任何领域有脉络，也有细节，此工程记录相关的细节		t	\N	2019-05-13 06:55:47.100097	2019-05-13 06:55:47.100097	software_engineering	1	39	40	f	\N	\N
15	羽毛球	记录羽毛球技术理解，通过羽毛球琢磨明白高手之路，不仅在羽毛球，也在其他任何自己想做的事情上。		t	\N	2018-12-01 16:16:30.629822	2019-07-13 19:12:14.732826	badminton	1	25	26	f	\N	\N
3	Linux	我不确定我能做到什么程度，也不确定爱到什么程度。\r\n它就像深山中的美女一样，但是我还没走进美丽的山谷，也无从窥探其美貌。		f	\N	2018-09-21 12:40:30.122716	2018-11-02 21:11:04.466525	linux	1	3	4	f	\N	\N
19	家庭会议及活动安排	讨论关于家庭的大小事件及对假期的各种安排		t	\N	2019-03-18 07:36:58.967809	2019-03-18 07:36:58.967809	family	1	17	18	f	\N	\N
6	思考方法与原则	记录各种思考方法，以及各种观点，作为原则。\r\n\r\n以不断丰富自我这台机器。		f	\N	2018-10-06 06:55:05.113616	2019-02-03 17:16:09.051381	think_idea	1	19	20	f	\N	\N
16	Cuckoo	时间记录		t	\N	2019-02-15 07:00:28.049879	2019-02-15 07:00:28.049879	cuckoo	1	1	2	f	\N	\N
12	谢震成长专辑	1、观察记录谢震成长过程中的日常\r\n2、学习解决育儿过程中遇到的困难\r\n3、记录思考自身在育儿过程中的成长		t	\N	2018-11-04 09:26:25.336824	2018-11-04 09:26:25.336824	child_rearing	1	37	38	f	\N	\N
20	职业转型探索	通过向专业人士进行职业生涯进行咨询及规划\r\n通过行动去探索了解职业能力\r\n通过思考去完成职业方向的重订\r\n\r\n链接身边的人和事，逐步梳理出自己想要的方向		t	\N	2019-03-18 08:22:17.376321	2019-03-18 08:22:17.376321	work	1	27	28	f	\N	\N
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.projects_id_seq', 23, true);


--
-- Data for Name: projects_trackers; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.projects_trackers (project_id, tracker_id) FROM stdin;
1	3
1	4
1	5
1	6
1	7
2	3
2	4
2	6
2	7
1	8
1	9
3	6
3	7
3	8
4	6
4	7
4	8
6	6
6	7
6	8
7	6
7	7
7	8
8	6
8	8
5	6
5	8
9	6
9	8
10	3
10	6
10	8
11	6
11	8
12	8
12	6
15	6
15	8
16	7
17	6
17	7
17	8
18	6
18	8
19	6
19	8
20	6
20	8
21	6
21	8
23	6
23	8
\.


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.queries (id, project_id, name, filters, user_id, column_names, sort_criteria, group_by, type, visibility, options) FROM stdin;
\.


--
-- Name: queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.queries_id_seq', 1, false);


--
-- Data for Name: queries_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.queries_roles (query_id, role_id) FROM stdin;
\.


--
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.repositories (id, project_id, url, login, password, root_url, type, path_encoding, log_encoding, extra_info, identifier, is_default, created_on) FROM stdin;
\.


--
-- Name: repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.repositories_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.roles (id, name, "position", assignable, builtin, permissions, issues_visibility, users_visibility, time_entries_visibility, all_roles_managed, settings) FROM stdin;
2	Anonymous	0	t	2	---\n- :view_messages\n- :view_issues\n- :view_news\n	default	all	all	t	\N
3	队友	1	f	0	---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_own_messages\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n- :manage_wiki\n	default	members_of_visible_projects	own	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
1	Non member	0	t	1	---\n- :add_project\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :delete_own_messages\n- :view_documents\n- :add_documents\n- :edit_documents\n- :view_issues\n- :add_issues\n- :edit_issues\n- :copy_issues\n- :manage_subtasks\n- :add_issue_notes\n- :edit_issue_notes\n- :view_news\n	default	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Data for Name: roles_managed_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.roles_managed_roles (role_id, managed_role_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.schema_migrations (version) FROM stdin;
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
20090214190337
20090312172426
20090312194159
20090318181151
20090323224724
20090401221305
20090401231134
20090403001910
20090406161854
20090425161243
20090503121501
20090503121505
20090503121510
20090614091200
20090704172350
20090704172355
20090704172358
20091010093521
20091017212227
20091017212457
20091017212644
20091017212938
20091017213027
20091017213113
20091017213151
20091017213228
20091017213257
20091017213332
20091017213444
20091017213536
20091017213642
20091017213716
20091017213757
20091017213835
20091017213910
20091017214015
20091017214107
20091017214136
20091017214236
20091017214308
20091017214336
20091017214406
20091017214440
20091017214519
20091017214611
20091017214644
20091017214720
20091017214750
20091025163651
20091108092559
20091114105931
20091123212029
20091205124427
20091220183509
20091220183727
20091220184736
20091225164732
20091227112908
20100129193402
20100129193813
20100221100219
20100313132032
20100313171051
20100705164950
20100819172912
20101104182107
20101107130441
20101114115114
20101114115359
20110220160626
20110223180944
20110223180953
20110224000000
20110226120112
20110226120132
20110227125750
20110228000000
20110228000100
20110401192910
20110408103312
20110412065600
20110511000000
20110902000000
20111201201315
20120115143024
20120115143100
20120115143126
20120127174243
20120205111326
20120223110929
20120301153455
20120422150750
20120705074331
20120707064544
20120714122000
20120714122100
20120714122200
20120731164049
20120930112914
20121026002032
20121026003537
20121209123234
20121209123358
20121213084931
20130110122628
20130201184705
20130202090625
20130207175206
20130207181455
20130215073721
20130215111127
20130215111141
20130217094251
20130602092539
20130710182539
20130713104233
20130713111657
20130729070143
20130911193200
20131004113137
20131005100610
20131124175346
20131210180802
20131214094309
20131215104612
20131218183023
20140228130325
20140903143914
20140920094058
20141029181752
20141029181824
20141109112308
20141122124142
20150113194759
20150113211532
20150113213922
20150113213955
20150208105930
20150510083747
20150525103953
20150526183158
20150528084820
20150528092912
20150528093249
20150725112753
20150730122707
20150730122735
20150921204850
20150921210243
20151020182334
20151020182731
20151021184614
20151021185456
20151021190616
20151024082034
20151025072118
20151031095005
20160404080304
20160416072926
20160529063352
20161001122012
20161002133421
20161010081301
20161010081528
20161010081600
20161126094932
20161220091118
20170207050700
20170302015225
20170309214320
20170320051650
20170418090031
20170419144536
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.settings (id, name, value, updated_on) FROM stdin;
1	default_projects_public	1	2017-09-09 14:01:14.750486
2	default_projects_modules	---\n- issue_tracking\n- time_tracking\n- news\n- documents\n- files\n- wiki\n- repository\n- boards\n- calendar\n- gantt\n	2017-09-09 14:01:14.772669
3	default_projects_tracker_ids	--- []\n	2017-09-09 14:01:14.77768
4	sequential_project_identifiers	0	2017-09-09 14:01:14.78175
5	new_project_user_role_id	3	2017-09-09 14:01:14.785668
6	cross_project_issue_relations	0	2017-09-09 14:23:28.046273
7	link_copied_issue	ask	2017-09-09 14:23:28.050932
8	cross_project_subtasks	tree	2017-09-09 14:23:28.054774
9	issue_group_assignment	0	2017-09-09 14:23:28.058648
10	default_issue_start_date_to_creation_date	1	2017-09-09 14:23:28.062662
11	display_subprojects_issues	1	2017-09-09 14:23:28.066722
12	issue_done_ratio	issue_field	2017-09-09 14:23:28.070438
13	non_working_week_days	--- []\n	2017-09-09 14:23:28.07467
14	issues_export_limit	500	2017-09-09 14:23:28.078853
15	gantt_items_limit	500	2017-09-09 14:23:28.082751
16	parent_issue_dates	derived	2017-09-09 14:23:28.086425
17	parent_issue_priority	derived	2017-09-09 14:23:28.090175
18	parent_issue_done_ratio	derived	2017-09-09 14:23:28.094472
20	issue_list_default_totals	--- []\n	2017-09-09 14:23:28.103609
21	timelog_required_fields	---\n- issue_id\n	2017-09-09 14:27:53.58517
22	enabled_scm	---\n- Subversion\n- Darcs\n- Mercurial\n- Cvs\n- Bazaar\n- Git\n	2017-09-09 14:38:15.079008
23	autofetch_changesets	1	2017-09-09 14:38:15.08596
24	sys_api_enabled	0	2017-09-09 14:38:15.090022
25	repository_log_display_limit	100	2017-09-09 14:38:15.095267
26	commit_logs_formatting	1	2017-09-09 14:38:15.100042
27	commit_ref_keywords	refs,references,IssueID	2017-09-09 14:38:15.104353
28	commit_cross_project_ref	0	2017-09-09 14:38:15.108667
29	commit_logtime_enabled	0	2017-09-09 14:38:15.113626
30	commit_update_keywords	--- []\n	2017-09-09 14:38:15.118447
32	default_language	en	2017-09-09 14:38:43.457353
33	force_default_language_for_anonymous	0	2017-09-09 14:38:43.462013
34	force_default_language_for_loggedin	0	2017-09-09 14:38:43.466133
35	start_of_week		2017-09-09 14:38:43.470558
36	date_format		2017-09-09 14:38:43.475092
37	time_format		2017-09-09 14:38:43.479545
38	timespan_format	decimal	2017-09-09 14:38:43.48442
39	user_format	firstname_lastname	2017-09-09 14:38:43.488857
40	gravatar_enabled	0	2017-09-09 14:38:43.492812
41	gravatar_default		2017-09-09 14:38:43.49745
42	thumbnails_enabled	0	2017-09-09 14:38:43.502039
43	thumbnails_size	100	2017-09-09 14:38:43.506616
44	new_item_menu_tab	2	2017-09-09 14:38:43.511362
31	ui_theme		2017-09-09 14:38:48.30716
46	welcome_text		2017-11-02 07:40:15.962055
47	per_page_options	25,50,100	2017-11-02 07:40:15.966085
48	search_results_per_page	10	2017-11-02 07:40:15.969991
49	activity_days_default	30	2017-11-02 07:40:15.97399
50	host_name	localhost:3000	2017-11-02 07:40:15.977742
51	protocol	http	2017-11-02 07:40:15.981396
52	text_formatting	textile	2017-11-02 07:40:15.985768
53	cache_formatted_text	0	2017-11-02 07:40:15.98951
54	wiki_compression		2017-11-02 07:40:15.993247
55	feeds_limit	15	2017-11-02 07:40:15.996942
45	app_title	奇迹就是能够认真热诚的对待每个人每件事	2018-10-18 07:16:58.000708
19	issue_list_default_columns	---\n- tracker\n- status\n- priority\n- subject\n- updated_on\n- done_ratio\n- due_date\n	2019-05-07 09:21:23.502442
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.settings_id_seq', 55, true);


--
-- Data for Name: time_entries; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) FROM stdin;
\.


--
-- Name: time_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.time_entries_id_seq', 1, false);


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.tokens (id, user_id, action, value, created_on, updated_on) FROM stdin;
181	1	session	4551f60108e035630fbee6e4d1eb92e327fa1a99	2018-10-18 07:15:40.646275	2018-10-22 17:14:33.554011
3	1	feeds	2a6c211249a45edb1a540eaa28129530c060c9f9	2017-09-08 10:13:38.715419	2017-09-08 10:13:38.715419
268	6	session	f7c6be651c8a75a5ae51d576c59ee12404f0f838	2019-04-01 12:41:51.928684	2019-04-01 12:55:11.69253
4	1	session	aa3d688a63d91aff06cc522a504f8d906bf5a5ad	2017-09-08 13:43:26.686953	2017-09-08 14:16:12.231472
138	1	session	d673a10d751a8e71fab299e613c139464abe3223	2018-03-06 15:12:45.853225	2018-03-06 17:50:35.530439
295	6	session	b8f78e5138b3c50e82fff98423175561d4e3e995	2019-05-21 16:12:59.443692	2019-05-22 04:32:35.411699
5	1	session	5eaf00ec5c4624da58278a536516900f6a626e10	2017-09-08 15:48:40.038748	2017-09-08 15:58:54.035176
259	6	session	bb5f86c2219a5e37ec8a66a35c424d8df2f5651e	2019-03-21 10:28:07.187712	2019-03-21 10:28:15.24159
7	5	feeds	ed6985de793bd3605e12f5193a367c20cecc8110	2017-09-09 13:36:32.91414	2017-09-09 13:36:32.91414
303	5	session	c049d9d193a335ed074ce97d5f706219063919c9	2019-06-29 14:14:57.750165	2019-06-29 15:12:19.256891
269	6	session	28105be5315721d6a08928ee60f09dff73c49606	2019-04-01 13:13:49.997551	2019-04-01 13:14:59.096911
304	5	session	d55d1dcfb018a8fb68e0c8853b5c246e2aa46c5b	2019-06-29 15:30:18.563845	2019-06-30 18:39:48.826587
174	1	session	293965a3f710b36ddd930e645973175fcba02a27	2018-10-08 16:55:27.594317	2018-10-09 07:14:45.881231
265	6	session	3eb199c2c96dfd7609c4a8ece11c6e25e139b1fa	2019-03-29 07:10:30.732845	2019-03-29 07:35:41.200962
299	5	session	ce8ea2be0edf415512c4fec982cc464f40eb1506	2019-06-10 06:42:13.858435	2019-06-27 09:07:21.408402
264	6	session	c88b673f49a93cfb5028d15097b94db4b3b205be	2019-03-26 12:44:56.267184	2019-03-26 12:46:52.408066
310	5	session	b00f95b595f6857cf5c504783385007f4baf0d6e	2019-07-13 07:34:31.126517	2019-07-13 20:33:59.078711
308	5	session	23d6e0a90514d173211a7d8f023de0813e6b00cb	2019-07-11 18:57:16.720528	2019-08-07 07:01:26.270281
261	6	session	e0c50092492e28cbaf496592ef0fe12dca40d252	2019-03-22 07:56:19.182351	2019-03-22 08:42:17.655705
16	1	session	5a6651b22876d62abd6f23036f55839c61a9354c	2017-09-09 14:31:12.442175	2017-09-09 14:34:57.143466
112	5	recovery	17fd1586dcac49a6f721116425ac3e4f17c0831a	2018-01-17 09:21:06.971656	2018-01-17 09:21:06.971656
19	1	session	63b0b9167a4c725731126c9bc7e70d0e5a7fb646	2017-09-09 14:37:05.619804	2017-09-09 22:38:36.901998
186	6	feeds	6774209beb571ab9fdac814a925cc4563b4a5a99	2018-11-02 21:03:47.65632	2018-11-02 21:03:47.65632
91	1	session	7c68ac4b530ef2f629743d601ddd1fb038d7e445	2017-11-24 17:56:20.856395	2017-11-24 19:49:00.97245
292	6	session	5721297b86698a00ddd9ba5174bb9048bbeef64c	2019-05-15 12:44:31.368376	2019-05-15 12:54:25.417913
296	6	session	dc14f49f6c071af4e6367f45571097a8c1558425	2019-05-22 12:48:18.336613	2019-05-22 13:01:01.732979
309	5	session	862da05d27e1d2b2f3e2561a06d08253f35d49fd	2019-07-11 21:23:20.733312	2019-07-11 21:24:02.87851
302	5	session	fcfc915bee788c146afebaa797af38358f5bcc84	2019-06-27 10:02:26.477634	2019-06-28 15:29:19.319874
291	6	session	4b07e1bd24f7ee5ad7ecc333ce8f2e47ea298449	2019-05-14 12:12:32.69694	2019-05-14 12:56:40.361423
257	1	session	470e3baeb3687037387bdfff1b50108eecf694e9	2019-03-18 16:50:01.569499	2019-03-19 12:01:29.48565
307	5	session	a14bf2f661b2f26f896caffe28450eb671d6a6ad	2019-07-07 17:53:49.131196	2019-07-07 21:46:05.021729
306	5	session	d1b12c5cc672f6a104b2b253b405397b30869de4	2019-07-03 21:49:13.117066	2019-07-03 22:01:48.361328
305	5	session	ed9abf19348e168ede66ccafb87faecbd7a50690	2019-07-01 07:21:43.776054	2019-07-11 13:35:36.896283
\.


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.tokens_id_seq', 310, true);


--
-- Data for Name: trackers; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.trackers (id, name, is_in_chlog, "position", is_in_roadmap, fields_bits, default_status_id) FROM stdin;
3	Bug	f	1	t	0	17
5	Backport	f	3	t	266	17
4	Feature	f	2	t	256	17
7	Task	f	5	t	0	17
8	Question	f	6	t	253	17
9	运维	f	7	t	249	1
6	Document	f	4	t	0	17
\.


--
-- Name: trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.trackers_id_seq', 9, true);


--
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.user_preferences (id, user_id, others, hide_mail, time_zone) FROM stdin;
2	5	---\n:no_self_notified: true\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n  top: []\n:my_page_settings: {}\n:gantt_zoom: 2\n:gantt_months: 6\n	t	
1	1	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n  top: []\n:my_page_settings: {}\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:gantt_zoom: 2\n:gantt_months: 6\n	t	
3	6	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:gantt_zoom: 2\n:gantt_months: 6\n	t	
\.


--
-- Name: user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.user_preferences_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.users (id, login, hashed_password, firstname, lastname, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd, passwd_changed_on) FROM stdin;
2				Anonymous users	f	1	\N		\N	2017-09-08 09:19:08.610272	2017-09-08 09:19:08.610272	GroupAnonymous	\N		\N	f	\N
3				Non member users	f	1	\N		\N	2017-09-08 09:19:08.634653	2017-09-08 09:19:08.634653	GroupNonMember	\N		\N	f	\N
6	hudongyin	9352cccf310bcb298049d66bd43264f50dc70e21	冬寅	胡	f	1	2019-05-22 12:48:18.332005	zh	\N	2018-11-02 21:03:05.617788	2018-11-02 21:03:05.617788	User	\N	only_my_events	2c9c2daf5128fb4ef19492e31b09364b	f	2018-11-02 21:03:05
4				Anonymous	f	0	\N		\N	2017-09-08 09:32:08.187458	2017-09-08 09:32:08.187458	AnonymousUser	\N	only_my_events	\N	f	\N
5	xierui	2a2d26482c6819a88fb27329084a94869f3ab580	rui	xie	f	1	2019-07-13 07:34:31.115363	zh	\N	2017-09-08 13:40:38.638884	2017-09-08 13:56:54.537329	User	\N	only_my_events	71101b163c545d1a50957a35b34dd9a7	f	2017-09-08 13:40:38
1	admin	9c808d0f454373257c6244edd28f163ccc57ddf1	锐	谢	t	1	2019-05-07 09:19:28.078938	zh	\N	2017-09-08 09:19:05.860956	2017-09-08 10:11:30.688077	User	\N	all	b5aebbc8ff7d41094ded4194fe0fc9a8	f	2017-09-08 10:10:45
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.versions (id, project_id, name, description, effective_date, created_on, updated_on, wiki_page_title, status, sharing) FROM stdin;
1	1	mos3.1.1	对象存储初始版本	\N	2017-09-09 14:07:40.007388	2017-09-09 14:07:40.007388		open	tree
2	1	mos5.1.0	支持es的版本	\N	2017-09-12 07:35:54.380506	2017-09-12 07:35:54.380506		open	tree
3	1	mos3.1.2	前海人寿	\N	2017-10-24 14:49:38.628034	2017-10-24 14:49:38.628034		open	none
4	1	mos	master	\N	2017-10-26 07:06:54.189411	2017-10-26 07:06:54.189411		open	none
5	1	mos3.1.3		\N	2017-11-14 09:39:42.450242	2017-11-14 09:39:42.450242		open	none
\.


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.versions_id_seq', 5, true);


--
-- Data for Name: watchers; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.watchers (id, watchable_type, watchable_id, user_id) FROM stdin;
1	Issue	3	5
2	Issue	12	5
3	News	1	5
4	News	2	5
6	Issue	116	5
\.


--
-- Name: watchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.watchers_id_seq', 14, true);


--
-- Data for Name: wiki_content_versions; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) FROM stdin;
1	1	1	5	\\x68312e2063657068207267772049414d0d0a0d0a68322e20776861742069732049414d0d0a687474703a2f2f646f63732e6177732e616d617a6f6e2e636f6d2f49414d2f6c61746573742f5573657247756964652f696e74726f64756374696f6e2e68746d6c0d0a0d0a415753204964656e7469747920616e6420416363657373204d616e6167656d656e7420e698afe4b880e4b8aae78bace7ab8be79a847765622073657276696365efbc8ce4b88de4bb85e7bb997333e4bdbfe794a8efbc8ce698afe4b880e4b8aae5ae8ce59684e79a84e69d83e99990e7aea1e79086e7b3bbe7bb9fe380820d0a0d0a68332e2049414d2f62756b63657420706f6c696379202f2041434c20636f6d706172650d0a68747470733a2f2f6177732e616d617a6f6e2e636f6d2f636e2f626c6f67732f73656375726974792f69616d2d706f6c69636965732d616e642d6275636b65742d706f6c69636965732d616e642d61636c732d6f682d6d792d636f6e74726f6c6c696e672d6163636573732d746f2d73332d7265736f75726365732f0d0a0d0a41434ce68ea7e588b6e79a84e58aa8e4bd9ce4b99fe6af94e8be83e5b091efbc8ce8808ce4b894e4b88de694afe68c81e58cb9e9858de696b9e5bc8f			2017-10-13 13:02:52.351724	1
2	1	1	5	\\x68312e2063657068207267772049414d0d0a0d0a68322e20776861742069732049414d0d0a687474703a2f2f646f63732e6177732e616d617a6f6e2e636f6d2f49414d2f6c61746573742f5573657247756964652f696e74726f64756374696f6e2e68746d6c0d0a0d0a415753204964656e7469747920616e6420416363657373204d616e6167656d656e7420e698afe4b880e4b8aae78bace7ab8be79a847765622073657276696365efbc8ce4b88de4bb85e7bb997333e4bdbfe794a8efbc8ce698afe4b880e4b8aae5ae8ce59684e79a84e69d83e99990e7aea1e79086e7b3bbe7bb9fe380820d0a0d0a68322e2049414d2f62756b63657420706f6c696379202f2041434c20636f6d706172650d0a68747470733a2f2f6177732e616d617a6f6e2e636f6d2f636e2f626c6f67732f73656375726974792f69616d2d706f6c69636965732d616e642d6275636b65742d706f6c69636965732d616e642d61636c732d6f682d6d792d636f6e74726f6c6c696e672d6163636573732d746f2d73332d7265736f75726365732f0d0a0d0a41434ce68ea7e588b6e79a84e58aa8e4bd9ce4b99fe6af94e8be83e5b091efbc8ce8808ce4b894e4b88de694afe68c81e58cb9e9858de696b9e5bc8f			2017-10-13 13:03:07.11753	2
3	2	2	5	\\xe698af786673e79a84627567efbc8ce98187e588b035313265e79a84e79b98e5b0b1e4bc9ae587bae997aee9a298efbc8ce7bd91e4b88ae4b99fe6b2a1e8afb4e6b885e6a59aefbc8ce4b88de8bf87e58fafe4bba5e8af95e4b880e4b88be68da2e4b880e4b88b6d6b6673e79a84e58f82e695b0e4bc9ae4b88de4bc9ae587bae78eb00d0a0d0ae6a682e5bfb5e4bb8be7bb8defbc9a0d0a68747470733a2f2f656e2e77696b6970656469612e6f72672f77696b692f416476616e6365645f466f726d6174			2017-11-01 07:23:11.577609	1
4	3	3	5	\\x686173682020e59388e5b88cefbc8ce68896e88085e58fabe695a3e58897efbc8ce6b3a8e6848fe8bf99e58faae698afe4b880e4b8aae7ae97e6b395efbc8ce59388e5b88ce7ae97e6b395e5b086e4bbbbe6848fe995bfe5baa6e79a84e4ba8ce8bf9be588b6e580bce698a0e5b084e4b8bae8be83e79fade79a84e59bbae5ae9ae995bfe5baa6e79a84e4ba8ce8bf9be588b6e580bcefbc8ce8bf99e4b8aae5b08fe79a84e4ba8ce8bf9be588b6e580bce7a7b0e4b8bae59388e5b88ce580bce380820d0a687474703a2f2f77696b692e6d62616c69622e636f6d2f77696b692f2545352539332538382545352542382538432545372541452539372545362542332539350d0a0d0ae4b99fe5b0b1e698afe8afb4e68a8ae5afb9e8b1a1e79a846b6579e8aea1e7ae97e5be97e588b068617368e580bce79a84e8bf87e7a88befbc8ce6898de698af68617368e380820d0a0d0a68617368e7a2b0e6929eefbc9a0d0a687474703a2f2f7777772e6a69616e7368752e636f6d2f702f6266316437656565323864300d0a0d0a68617368e7ae97e6b395e79a84e789b9e782b9efbc9ae58d95e59091e680a7efbc8ce99abee58fafe98086efbc8ce68a97e7a2b0e6929ee380820d0a0d0a0d0ae8808c68617368e6a1b6e58899e698afe58fa6e5a496e79a84e6a682e5bfb5e38082e5b19ee4ba8e68617368e8a1a8e79a84e88c83e795b40d0a0d0a6861736820e8a1a8e4b8bbe8a681e4bc98e58abfefbc9ae99a8fe69cbae8afbbe58699e9809fe5baa6e5bfabefbc8ce59ba0e8808ce59ca8e6b5b7e9878fe695b0e68daee4b88ae8bf90e794a8e5b9bfe6b39be380820d0a0d0a68617368e8a1a8e58aa3e58abfefbc9ae9a1bae5ba8fe8afbbe58699e685a2efbc9f20e4b8bae4bb80e4b9886275636b657420696e646578e8a681e794a868617368e696b9e5bc8fe7bb84e7bb87e591a2efbc9f			2017-11-10 12:36:03.388463	1
5	3	3	5	\\x686173682020e59388e5b88cefbc8ce68896e88085e58fabe695a3e58897efbc8ce6b3a8e6848fe8bf99e58faae698afe4b880e4b8aae7ae97e6b395efbc8ce59388e5b88ce7ae97e6b395e5b086e4bbbbe6848fe995bfe5baa6e79a84e4ba8ce8bf9be588b6e580bce698a0e5b084e4b8bae8be83e79fade79a84e59bbae5ae9ae995bfe5baa6e79a84e4ba8ce8bf9be588b6e580bcefbc8ce8bf99e4b8aae5b08fe79a84e4ba8ce8bf9be588b6e580bce7a7b0e4b8bae59388e5b88ce580bce380820d0a687474703a2f2f77696b692e6d62616c69622e636f6d2f77696b692f2545352539332538382545352542382538432545372541452539372545362542332539350d0a0d0ae4b99fe5b0b1e698afe8afb4e68a8ae5afb9e8b1a1e79a846b6579e8aea1e7ae97e5be97e588b068617368e580bce79a84e8bf87e7a88befbc8ce6898de698af68617368e380820d0a0d0a68617368e7a2b0e6929eefbc9a0d0a687474703a2f2f7777772e6a69616e7368752e636f6d2f702f6266316437656565323864300d0a0d0a68617368e7ae97e6b395e79a84e789b9e782b9efbc9ae58d95e59091e680a7efbc8ce99abee58fafe98086efbc8ce68a97e7a2b0e6929ee380820d0a0d0a0d0ae8808c68617368e6a1b6e58899e698afe58fa6e5a496e79a84e6a682e5bfb5e38082e5b19ee4ba8e68617368e8a1a8e79a84e88c83e795b40d0a0d0a6861736820e8a1a8e4b8bbe8a681e4bc98e58abfefbc9a0d0a31efbc8ce695a3e58897e69588e69e9c0d0a2020e5a682e69e9ce68c89e785a7e5898de7bc80e69da5e694bee588b0e4b88de5908ce6a1b6efbc8ce4b880e4b8aae69e81e7abafe4be8be5ad90e698afe68980e69c89e69687e4bbb6e983bde698afe8bf99e7a78de5898de7bc800d0a32efbc8ce99a8fe69cbae8afbbe58699e9809fe5baa6e5bfabefbc8ce59ba0e8808ce59ca8e6b5b7e9878fe695b0e68daee4b88ae8bf90e794a8e5b9bfe6b39be380820d0a0d0a68617368e8a1a8e58aa3e58abfefbc9ae9a1bae5ba8fe8afbbe58699e685a2efbc9f20e4b8bae4bb80e4b9886275636b657420696e646578e8a681e794a868617368e696b9e5bc8fe7bb84e7bb87e591a2efbc9f0d0a5247575261646f733a3a6765745f6275636b65745f696e6465785f6f626a6563740d0a0d0a0d0a436f6e73697374656e742068617368696e6720e79a84e59fbae69cace6809de683b3e5b0b1e698afe5b086e5afb9e8b1a1e5928c20636163686520e983bde698a0e5b084e588b0e5908ce4b880e4b8aa206861736820e695b0e580bce7a9bae997b4e4b8adefbc8ce5b9b6e4b894e4bdbfe794a8e79bb8e5908ce79a84206861736820e7ae97e6b395e380820d0ae4b880e887b4e680a7e59388e5b88ce7ae97e6b395e4b8bbe8a681e4bdbfe794a8e59ca8e58886e5b883e5bc8fe695b0e68daee5ad98e582a8e7b3bbe7bb9fe4b8adefbc8ce68c89e785a7e4b880e5ae9ae79a84e7ad96e795a5e5b086e695b0e68daee5b0bde58fafe883bde59d87e58c80e58886e5b883e588b0e68980e69c89e79a84e5ad98e582a8e88a82e782b9e4b88ae58ebbefbc8ce4bdbfe5be97e7b3bbe7bb9fe585b7e69c89e889afe5a5bde79a84e8b49fe8bdbde59d87e8a1a1e680a7e883bde5928ce689a9e5b195e680a7e380820d0a0d0ae4b880e887b4e680a768617368e79a84e694b9e8bf9befbc9a0d0ae5bc95e585a5e8999ae68b9fe88a82e782b9efbc8ce981bfe5858de68980e69c89e695b0e68daee58f82e4b88ee8bf81e7a7bbe380820d0a			2017-11-10 12:59:13.063024	2
6	4	4	5	\\xe6a8a1e68b9fe8afb7e6b182e8849ae69cacefbc9a0d0a0d0a3c7072653e3c636f646520636c6173733d2274657874223e0d0a23212f62696e2f73680d0a49643d226f425a44394f70564f68713262484568616b5635220d0a4b65793d2248576e6a7866486b4f6a5577754b387a496248375078486e7a626170656b58306e4453457a563151220d0a2349643d22383734374b4341483850484a543343325431454a220d0a234b65793d22594375704a593561363146544f39396531714f493748736672397632563030724735503854756772220d0a0d0a72756e5f636d6428297b0d0a20202020617574683d222f61646d696e2f6c6f672f220d0a2020202075726c3d24310d0a202020206461746556616c75653d2260545a3d474d542064617465202b2725612c2025642025622025592025483a254d3a255320474d542760220d0a2020202023636f6e74656e74547970653d226170706c69636174696f6e2f782d7777772d666f726d2d75726c656e636f646564220d0a20202020737472696e67546f5369676e3d224745545c6e5c6e5c6e247b6461746556616c75657d5c6e247b617574687d220d0a202020206563686f2022247b737472696e67546f5369676e7d220d0a202020207369676e61747572653d606563686f202d656e20247b737472696e67546f5369676e7d207c206f70656e73736c2073686131202d686d616320247b4b65797d202d62696e617279207c20626173653634600d0a202020206563686f202272756e20636d6420247b75726c7d207369676e617475726520efbc9a247b7369676e61747572657d220d0a202020206375726c202d69202d5820474554202d482022446174653a20247b6461746556616c75657d22202d482022417574686f72697a6174696f6e3a2041575320247b49647d3a247b7369676e61747572657d222022247b75726c7d220d0a202020206563686f2022656e6420636d64220d0a7d0d0a0d0a236563686f2024310d0a72756e5f636d642024310d0a3c2f636f64653e3c2f7072653e0d0a0d0a2e2f733361646d696e2e73682022687474703a2f2f31302e31302e312e3135373a383039302f61646d696e2f6c6f672f3f747970653d646174612669643d31303826696e666f26726777782d7a6f6e6567726f75703d64353361656130622d306237362d346330372d393034312d656238316532653365353039220d0a0d0ae8b083e8af95e591bde4bba4			2018-04-14 15:29:28.707809	1
\.


--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.wiki_content_versions_id_seq', 6, true);


--
-- Data for Name: wiki_contents; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.wiki_contents (id, page_id, author_id, text, comments, updated_on, version) FROM stdin;
1	1	5	h1. ceph rgw IAM\r\n\r\nh2. what is IAM\r\nhttp://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html\r\n\r\nAWS Identity and Access Management 是一个独立的web service，不仅给s3使用，是一个完善的权限管理系统。\r\n\r\nh2. IAM/bukcet policy / ACL compare\r\nhttps://aws.amazon.com/cn/blogs/security/iam-policies-and-bucket-policies-and-acls-oh-my-controlling-access-to-s3-resources/\r\n\r\nACL控制的动作也比较少，而且不支持匹配方式		2017-10-13 13:03:07.11753	2
2	2	5	是xfs的bug，遇到512e的盘就会出问题，网上也没说清楚，不过可以试一下换一下mkfs的参数会不会出现\r\n\r\n概念介绍：\r\nhttps://en.wikipedia.org/wiki/Advanced_Format		2017-11-01 07:23:11.577609	1
3	3	5	hash  哈希，或者叫散列，注意这只是一个算法，哈希算法将任意长度的二进制值映射为较短的固定长度的二进制值，这个小的二进制值称为哈希值。\r\nhttp://wiki.mbalib.com/wiki/%E5%93%88%E5%B8%8C%E7%AE%97%E6%B3%95\r\n\r\n也就是说把对象的key计算得到hash值的过程，才是hash。\r\n\r\nhash碰撞：\r\nhttp://www.jianshu.com/p/bf1d7eee28d0\r\n\r\nhash算法的特点：单向性，难可逆，抗碰撞。\r\n\r\n\r\n而hash桶则是另外的概念。属于hash表的范畴\r\n\r\nhash 表主要优势：\r\n1，散列效果\r\n  如果按照前缀来放到不同桶，一个极端例子是所有文件都是这种前缀\r\n2，随机读写速度快，因而在海量数据上运用广泛。\r\n\r\nhash表劣势：顺序读写慢？ 为什么bucket index要用hash方式组织呢？\r\nRGWRados::get_bucket_index_object\r\n\r\n\r\nConsistent hashing 的基本思想就是将对象和 cache 都映射到同一个 hash 数值空间中，并且使用相同的 hash 算法。\r\n一致性哈希算法主要使用在分布式数据存储系统中，按照一定的策略将数据尽可能均匀分布到所有的存储节点上去，使得系统具有良好的负载均衡性能和扩展性。\r\n\r\n一致性hash的改进：\r\n引入虚拟节点，避免所有数据参与迁移。\r\n		2017-11-10 12:59:13.063024	2
4	4	5	模拟请求脚本：\r\n\r\n<pre><code class="text">\r\n#!/bin/sh\r\nId="oBZD9OpVOhq2bHEhakV5"\r\nKey="HWnjxfHkOjUwuK8zIbH7PxHnzbapekX0nDSEzV1Q"\r\n#Id="8747KCAH8PHJT3C2T1EJ"\r\n#Key="YCupJY5a61FTO99e1qOI7Hsfr9v2V00rG5P8Tugr"\r\n\r\nrun_cmd(){\r\n    auth="/admin/log/"\r\n    url=$1\r\n    dateValue="`TZ=GMT date +'%a, %d %b %Y %H:%M:%S GMT'`"\r\n    #contentType="application/x-www-form-urlencoded"\r\n    stringToSign="GET\\n\\n\\n${dateValue}\\n${auth}"\r\n    echo "${stringToSign}"\r\n    signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${Key} -binary | base64`\r\n    echo "run cmd ${url} signature ：${signature}"\r\n    curl -i -X GET -H "Date: ${dateValue}" -H "Authorization: AWS ${Id}:${signature}" "${url}"\r\n    echo "end cmd"\r\n}\r\n\r\n#echo $1\r\nrun_cmd $1\r\n</code></pre>\r\n\r\n./s3admin.sh "http://10.10.1.157:8090/admin/log/?type=data&id=108&info&rgwx-zonegroup=d53aea0b-0b76-4c07-9041-eb81e2e3e509"\r\n\r\n调试命令		2018-04-14 15:29:28.707809	1
\.


--
-- Name: wiki_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.wiki_contents_id_seq', 4, true);


--
-- Data for Name: wiki_pages; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.wiki_pages (id, wiki_id, title, created_on, protected, parent_id) FROM stdin;
1	1	Wiki	2017-10-13 13:02:52.328596	f	\N
2	1	512e盘	2017-11-01 07:23:11.574926	f	\N
3	1	Hash	2017-11-10 12:36:03.385698	f	1
4	1	Rgw_multisite_curl请求	2018-04-14 15:29:28.703562	f	\N
\.


--
-- Name: wiki_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.wiki_pages_id_seq', 4, true);


--
-- Data for Name: wiki_redirects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.wiki_redirects (id, wiki_id, title, redirects_to, created_on, redirects_to_wiki_id) FROM stdin;
\.


--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.wiki_redirects_id_seq', 1, false);


--
-- Data for Name: wikis; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.wikis (id, project_id, start_page, status) FROM stdin;
1	1	Wiki	1
2	2	Wiki	1
3	5	Wiki	1
5	19	Wiki	1
6	20	Wiki	1
\.


--
-- Name: wikis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.wikis_id_seq', 7, true);


--
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) FROM stdin;
1	3	0	3	1	f	f	WorkflowTransition	\N	\N
2	3	0	3	2	f	f	WorkflowTransition	\N	\N
3	3	0	3	3	f	f	WorkflowTransition	\N	\N
4	3	0	4	1	f	f	WorkflowTransition	\N	\N
5	3	0	4	2	f	f	WorkflowTransition	\N	\N
6	3	0	4	3	f	f	WorkflowTransition	\N	\N
10	3	0	13	1	f	f	WorkflowTransition	\N	\N
11	3	0	13	2	f	f	WorkflowTransition	\N	\N
12	3	0	13	3	f	f	WorkflowTransition	\N	\N
13	3	0	14	1	f	f	WorkflowTransition	\N	\N
14	3	0	14	2	f	f	WorkflowTransition	\N	\N
15	3	0	14	3	f	f	WorkflowTransition	\N	\N
16	3	0	17	1	f	f	WorkflowTransition	\N	\N
17	3	0	17	2	f	f	WorkflowTransition	\N	\N
18	3	0	17	3	f	f	WorkflowTransition	\N	\N
19	3	0	18	1	f	f	WorkflowTransition	\N	\N
20	3	0	18	2	f	f	WorkflowTransition	\N	\N
21	3	0	18	3	f	f	WorkflowTransition	\N	\N
22	3	1	3	1	f	f	WorkflowTransition	\N	\N
23	3	1	3	2	f	f	WorkflowTransition	\N	\N
24	3	1	3	3	f	f	WorkflowTransition	\N	\N
25	3	1	4	1	f	f	WorkflowTransition	\N	\N
26	3	1	4	2	f	f	WorkflowTransition	\N	\N
27	3	1	4	3	f	f	WorkflowTransition	\N	\N
31	3	1	13	1	f	f	WorkflowTransition	\N	\N
32	3	1	13	2	f	f	WorkflowTransition	\N	\N
33	3	1	13	3	f	f	WorkflowTransition	\N	\N
34	3	1	14	1	f	f	WorkflowTransition	\N	\N
35	3	1	14	2	f	f	WorkflowTransition	\N	\N
36	3	1	14	3	f	f	WorkflowTransition	\N	\N
37	3	1	16	1	f	f	WorkflowTransition	\N	\N
38	3	1	16	2	f	f	WorkflowTransition	\N	\N
39	3	1	16	3	f	f	WorkflowTransition	\N	\N
40	3	1	17	1	f	f	WorkflowTransition	\N	\N
41	3	1	17	2	f	f	WorkflowTransition	\N	\N
42	3	1	17	3	f	f	WorkflowTransition	\N	\N
43	3	1	18	1	f	f	WorkflowTransition	\N	\N
44	3	1	18	2	f	f	WorkflowTransition	\N	\N
45	3	1	18	3	f	f	WorkflowTransition	\N	\N
46	3	3	4	1	f	f	WorkflowTransition	\N	\N
47	3	3	4	2	f	f	WorkflowTransition	\N	\N
48	3	3	4	3	f	f	WorkflowTransition	\N	\N
52	3	3	13	1	f	f	WorkflowTransition	\N	\N
53	3	3	13	2	f	f	WorkflowTransition	\N	\N
54	3	3	13	3	f	f	WorkflowTransition	\N	\N
55	3	3	14	1	f	f	WorkflowTransition	\N	\N
56	3	3	14	2	f	f	WorkflowTransition	\N	\N
57	3	3	14	3	f	f	WorkflowTransition	\N	\N
58	3	3	16	1	f	f	WorkflowTransition	\N	\N
59	3	3	16	2	f	f	WorkflowTransition	\N	\N
60	3	3	16	3	f	f	WorkflowTransition	\N	\N
61	3	17	3	1	f	f	WorkflowTransition	\N	\N
62	3	17	3	2	f	f	WorkflowTransition	\N	\N
63	3	17	3	3	f	f	WorkflowTransition	\N	\N
64	3	17	4	1	f	f	WorkflowTransition	\N	\N
65	3	17	4	2	f	f	WorkflowTransition	\N	\N
66	3	17	4	3	f	f	WorkflowTransition	\N	\N
67	3	17	13	1	f	f	WorkflowTransition	\N	\N
68	3	17	13	2	f	f	WorkflowTransition	\N	\N
69	3	17	13	3	f	f	WorkflowTransition	\N	\N
70	3	17	14	1	f	f	WorkflowTransition	\N	\N
71	3	17	14	2	f	f	WorkflowTransition	\N	\N
72	3	17	14	3	f	f	WorkflowTransition	\N	\N
73	3	17	16	1	f	f	WorkflowTransition	\N	\N
74	3	17	16	2	f	f	WorkflowTransition	\N	\N
75	3	17	16	3	f	f	WorkflowTransition	\N	\N
76	3	17	17	1	f	f	WorkflowTransition	\N	\N
77	3	17	17	2	f	f	WorkflowTransition	\N	\N
78	3	17	17	3	f	f	WorkflowTransition	\N	\N
79	3	17	18	1	f	f	WorkflowTransition	\N	\N
80	3	17	18	2	f	f	WorkflowTransition	\N	\N
81	3	17	18	3	f	f	WorkflowTransition	\N	\N
82	3	18	4	1	f	f	WorkflowTransition	\N	\N
83	3	18	4	2	f	f	WorkflowTransition	\N	\N
84	3	18	4	3	f	f	WorkflowTransition	\N	\N
88	3	18	6	1	f	f	WorkflowTransition	\N	\N
89	3	18	6	2	f	f	WorkflowTransition	\N	\N
90	3	18	6	3	f	f	WorkflowTransition	\N	\N
91	3	18	7	1	f	f	WorkflowTransition	\N	\N
92	3	18	7	2	f	f	WorkflowTransition	\N	\N
93	3	18	7	3	f	f	WorkflowTransition	\N	\N
94	3	18	8	1	f	f	WorkflowTransition	\N	\N
95	3	18	8	2	f	f	WorkflowTransition	\N	\N
96	3	18	8	3	f	f	WorkflowTransition	\N	\N
97	3	3	15	1	f	f	WorkflowTransition	\N	\N
98	3	3	15	2	f	f	WorkflowTransition	\N	\N
99	3	3	15	3	f	f	WorkflowTransition	\N	\N
100	3	4	6	1	f	f	WorkflowTransition	\N	\N
101	3	4	6	2	f	f	WorkflowTransition	\N	\N
102	3	4	6	3	f	f	WorkflowTransition	\N	\N
103	3	4	7	1	f	f	WorkflowTransition	\N	\N
104	3	4	7	2	f	f	WorkflowTransition	\N	\N
105	3	4	7	3	f	f	WorkflowTransition	\N	\N
106	3	4	8	1	f	f	WorkflowTransition	\N	\N
107	3	4	8	2	f	f	WorkflowTransition	\N	\N
108	3	4	8	3	f	f	WorkflowTransition	\N	\N
109	3	4	11	1	f	f	WorkflowTransition	\N	\N
110	3	4	11	2	f	f	WorkflowTransition	\N	\N
111	3	4	11	3	f	f	WorkflowTransition	\N	\N
112	3	4	15	1	f	f	WorkflowTransition	\N	\N
113	3	4	15	2	f	f	WorkflowTransition	\N	\N
114	3	4	15	3	f	f	WorkflowTransition	\N	\N
115	3	6	9	1	f	f	WorkflowTransition	\N	\N
116	3	6	9	2	f	f	WorkflowTransition	\N	\N
117	3	6	9	3	f	f	WorkflowTransition	\N	\N
118	3	6	10	1	f	f	WorkflowTransition	\N	\N
119	3	6	10	2	f	f	WorkflowTransition	\N	\N
120	3	6	10	3	f	f	WorkflowTransition	\N	\N
121	3	6	11	1	f	f	WorkflowTransition	\N	\N
122	3	6	11	2	f	f	WorkflowTransition	\N	\N
123	3	6	11	3	f	f	WorkflowTransition	\N	\N
124	3	7	8	1	f	f	WorkflowTransition	\N	\N
125	3	7	8	2	f	f	WorkflowTransition	\N	\N
126	3	7	8	3	f	f	WorkflowTransition	\N	\N
127	3	8	9	1	f	f	WorkflowTransition	\N	\N
128	3	8	9	2	f	f	WorkflowTransition	\N	\N
129	3	8	9	3	f	f	WorkflowTransition	\N	\N
130	3	8	10	1	f	f	WorkflowTransition	\N	\N
131	3	8	10	2	f	f	WorkflowTransition	\N	\N
132	3	8	10	3	f	f	WorkflowTransition	\N	\N
133	3	8	11	1	f	f	WorkflowTransition	\N	\N
134	3	8	11	2	f	f	WorkflowTransition	\N	\N
135	3	8	11	3	f	f	WorkflowTransition	\N	\N
136	3	9	10	1	f	f	WorkflowTransition	\N	\N
137	3	9	10	2	f	f	WorkflowTransition	\N	\N
138	3	9	10	3	f	f	WorkflowTransition	\N	\N
139	3	9	12	1	f	f	WorkflowTransition	\N	\N
140	3	9	12	2	f	f	WorkflowTransition	\N	\N
141	3	9	12	3	f	f	WorkflowTransition	\N	\N
142	3	10	9	1	f	f	WorkflowTransition	\N	\N
143	3	10	9	2	f	f	WorkflowTransition	\N	\N
144	3	10	9	3	f	f	WorkflowTransition	\N	\N
145	3	10	12	1	f	f	WorkflowTransition	\N	\N
146	3	10	12	2	f	f	WorkflowTransition	\N	\N
147	3	10	12	3	f	f	WorkflowTransition	\N	\N
148	3	11	9	1	f	f	WorkflowTransition	\N	\N
149	3	11	9	2	f	f	WorkflowTransition	\N	\N
150	3	11	9	3	f	f	WorkflowTransition	\N	\N
151	3	11	10	1	f	f	WorkflowTransition	\N	\N
152	3	11	10	2	f	f	WorkflowTransition	\N	\N
153	3	11	10	3	f	f	WorkflowTransition	\N	\N
154	3	12	1	1	f	f	WorkflowTransition	\N	\N
155	3	12	1	2	f	f	WorkflowTransition	\N	\N
156	3	12	1	3	f	f	WorkflowTransition	\N	\N
157	3	13	1	1	f	f	WorkflowTransition	\N	\N
158	3	13	1	2	f	f	WorkflowTransition	\N	\N
159	3	13	1	3	f	f	WorkflowTransition	\N	\N
160	3	14	1	1	f	f	WorkflowTransition	\N	\N
161	3	14	1	2	f	f	WorkflowTransition	\N	\N
162	3	14	1	3	f	f	WorkflowTransition	\N	\N
163	3	15	1	1	f	f	WorkflowTransition	\N	\N
164	3	15	1	2	f	f	WorkflowTransition	\N	\N
165	3	15	1	3	f	f	WorkflowTransition	\N	\N
166	3	16	1	1	f	f	WorkflowTransition	\N	\N
167	3	16	1	2	f	f	WorkflowTransition	\N	\N
168	3	16	1	3	f	f	WorkflowTransition	\N	\N
169	4	0	1	1	f	f	WorkflowTransition	\N	\N
170	4	0	1	2	f	f	WorkflowTransition	\N	\N
171	4	0	1	3	f	f	WorkflowTransition	\N	\N
172	4	0	17	1	f	f	WorkflowTransition	\N	\N
173	4	0	17	2	f	f	WorkflowTransition	\N	\N
174	4	0	17	3	f	f	WorkflowTransition	\N	\N
175	4	1	1	1	f	f	WorkflowTransition	\N	\N
176	4	1	1	2	f	f	WorkflowTransition	\N	\N
177	4	1	1	3	f	f	WorkflowTransition	\N	\N
178	4	17	12	1	f	f	WorkflowTransition	\N	\N
179	4	17	12	2	f	f	WorkflowTransition	\N	\N
180	4	17	12	3	f	f	WorkflowTransition	\N	\N
181	4	17	13	1	f	f	WorkflowTransition	\N	\N
182	4	17	13	2	f	f	WorkflowTransition	\N	\N
183	4	17	13	3	f	f	WorkflowTransition	\N	\N
184	4	17	16	1	f	f	WorkflowTransition	\N	\N
185	4	17	16	2	f	f	WorkflowTransition	\N	\N
187	4	1	18	3	f	f	WorkflowTransition	\N	\N
188	4	4	12	3	f	f	WorkflowTransition	\N	\N
189	4	6	4	3	f	f	WorkflowTransition	\N	\N
190	4	6	12	3	f	f	WorkflowTransition	\N	\N
191	4	17	4	3	f	f	WorkflowTransition	\N	\N
192	4	17	6	3	f	f	WorkflowTransition	\N	\N
193	4	17	18	3	f	f	WorkflowTransition	\N	\N
194	4	18	4	3	f	f	WorkflowTransition	\N	\N
195	4	18	6	3	f	f	WorkflowTransition	\N	\N
196	5	0	1	3	f	f	WorkflowTransition	\N	\N
197	5	0	17	3	f	f	WorkflowTransition	\N	\N
198	5	1	11	3	f	f	WorkflowTransition	\N	\N
199	5	1	13	3	f	f	WorkflowTransition	\N	\N
200	5	1	17	3	f	f	WorkflowTransition	\N	\N
201	5	11	12	3	f	f	WorkflowTransition	\N	\N
202	5	17	11	3	f	f	WorkflowTransition	\N	\N
203	5	17	13	3	f	f	WorkflowTransition	\N	\N
204	6	0	1	1	f	f	WorkflowTransition	\N	\N
205	6	0	1	2	f	f	WorkflowTransition	\N	\N
206	6	0	1	3	f	f	WorkflowTransition	\N	\N
207	6	1	17	1	f	f	WorkflowTransition	\N	\N
208	6	1	17	2	f	f	WorkflowTransition	\N	\N
209	6	1	17	3	f	f	WorkflowTransition	\N	\N
210	6	4	12	1	f	f	WorkflowTransition	\N	\N
211	6	4	12	2	f	f	WorkflowTransition	\N	\N
212	6	4	12	3	f	f	WorkflowTransition	\N	\N
213	6	17	4	1	f	f	WorkflowTransition	\N	\N
214	6	17	4	2	f	f	WorkflowTransition	\N	\N
215	6	17	4	3	f	f	WorkflowTransition	\N	\N
216	6	0	17	1	f	f	WorkflowTransition	\N	\N
217	6	0	17	2	f	f	WorkflowTransition	\N	\N
218	6	0	17	3	f	f	WorkflowTransition	\N	\N
233	7	0	19	3	f	f	WorkflowTransition	\N	\N
234	7	19	20	3	f	f	WorkflowTransition	\N	\N
235	7	19	24	3	f	f	WorkflowTransition	\N	\N
236	7	20	21	3	f	f	WorkflowTransition	\N	\N
237	7	21	22	3	f	f	WorkflowTransition	\N	\N
238	7	22	23	3	f	f	WorkflowTransition	\N	\N
239	7	23	24	3	f	f	WorkflowTransition	\N	\N
223	8	0	17	3	f	f	WorkflowTransition	\N	\N
224	8	17	4	3	f	f	WorkflowTransition	\N	\N
225	8	4	12	3	f	f	WorkflowTransition	\N	\N
226	8	1	17	3	f	f	WorkflowTransition	\N	\N
227	8	0	1	3	f	f	WorkflowTransition	\N	\N
228	9	0	17	3	f	f	WorkflowTransition	\N	\N
229	9	17	4	3	f	f	WorkflowTransition	\N	\N
230	9	4	12	3	f	f	WorkflowTransition	\N	\N
231	9	1	17	3	f	f	WorkflowTransition	\N	\N
232	9	0	1	3	f	f	WorkflowTransition	\N	\N
\.


--
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.workflows_id_seq', 239, true);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: auth_sources auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (id);


--
-- Name: boards boards_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);


--
-- Name: changes changes_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (id);


--
-- Name: changesets changesets_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.changesets
    ADD CONSTRAINT changesets_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: custom_field_enumerations custom_field_enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_field_enumerations
    ADD CONSTRAINT custom_field_enumerations_pkey PRIMARY KEY (id);


--
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- Name: custom_values custom_values_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_values
    ADD CONSTRAINT custom_values_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: email_addresses email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.email_addresses
    ADD CONSTRAINT email_addresses_pkey PRIMARY KEY (id);


--
-- Name: enabled_modules enabled_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.enabled_modules
    ADD CONSTRAINT enabled_modules_pkey PRIMARY KEY (id);


--
-- Name: enumerations enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.enumerations
    ADD CONSTRAINT enumerations_pkey PRIMARY KEY (id);


--
-- Name: import_items import_items_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.import_items
    ADD CONSTRAINT import_items_pkey PRIMARY KEY (id);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: issue_categories issue_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_categories
    ADD CONSTRAINT issue_categories_pkey PRIMARY KEY (id);


--
-- Name: issue_relations issue_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_relations
    ADD CONSTRAINT issue_relations_pkey PRIMARY KEY (id);


--
-- Name: issue_statuses issue_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_statuses
    ADD CONSTRAINT issue_statuses_pkey PRIMARY KEY (id);


--
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: journal_details journal_details_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.journal_details
    ADD CONSTRAINT journal_details_pkey PRIMARY KEY (id);


--
-- Name: journals journals_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- Name: member_roles member_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.member_roles
    ADD CONSTRAINT member_roles_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_associations open_id_authentication_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.open_id_authentication_associations
    ADD CONSTRAINT open_id_authentication_associations_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_nonces open_id_authentication_nonces_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.open_id_authentication_nonces
    ADD CONSTRAINT open_id_authentication_nonces_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: queries queries_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (id);


--
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: time_entries time_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.time_entries
    ADD CONSTRAINT time_entries_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: trackers trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: watchers watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.watchers
    ADD CONSTRAINT watchers_pkey PRIMARY KEY (id);


--
-- Name: wiki_content_versions wiki_content_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_content_versions
    ADD CONSTRAINT wiki_content_versions_pkey PRIMARY KEY (id);


--
-- Name: wiki_contents wiki_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_contents
    ADD CONSTRAINT wiki_contents_pkey PRIMARY KEY (id);


--
-- Name: wiki_pages wiki_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_pages
    ADD CONSTRAINT wiki_pages_pkey PRIMARY KEY (id);


--
-- Name: wiki_redirects wiki_redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_redirects
    ADD CONSTRAINT wiki_redirects_pkey PRIMARY KEY (id);


--
-- Name: wikis wikis_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wikis
    ADD CONSTRAINT wikis_pkey PRIMARY KEY (id);


--
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- Name: boards_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX boards_project_id ON public.boards USING btree (project_id);


--
-- Name: changeset_parents_changeset_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX changeset_parents_changeset_ids ON public.changeset_parents USING btree (changeset_id);


--
-- Name: changeset_parents_parent_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX changeset_parents_parent_ids ON public.changeset_parents USING btree (parent_id);


--
-- Name: changesets_changeset_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX changesets_changeset_id ON public.changes USING btree (changeset_id);


--
-- Name: changesets_issues_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX changesets_issues_ids ON public.changesets_issues USING btree (changeset_id, issue_id);


--
-- Name: changesets_repos_rev; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX changesets_repos_rev ON public.changesets USING btree (repository_id, revision);


--
-- Name: changesets_repos_scmid; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX changesets_repos_scmid ON public.changesets USING btree (repository_id, scmid);


--
-- Name: custom_fields_roles_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX custom_fields_roles_ids ON public.custom_fields_roles USING btree (custom_field_id, role_id);


--
-- Name: custom_values_customized; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX custom_values_customized ON public.custom_values USING btree (customized_type, customized_id);


--
-- Name: documents_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX documents_project_id ON public.documents USING btree (project_id);


--
-- Name: enabled_modules_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX enabled_modules_project_id ON public.enabled_modules USING btree (project_id);


--
-- Name: groups_users_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX groups_users_ids ON public.groups_users USING btree (group_id, user_id);


--
-- Name: index_attachments_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_attachments_on_author_id ON public.attachments USING btree (author_id);


--
-- Name: index_attachments_on_container_id_and_container_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_attachments_on_container_id_and_container_type ON public.attachments USING btree (container_id, container_type);


--
-- Name: index_attachments_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_attachments_on_created_on ON public.attachments USING btree (created_on);


--
-- Name: index_attachments_on_disk_filename; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_attachments_on_disk_filename ON public.attachments USING btree (disk_filename);


--
-- Name: index_auth_sources_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_auth_sources_on_id_and_type ON public.auth_sources USING btree (id, type);


--
-- Name: index_boards_on_last_message_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_boards_on_last_message_id ON public.boards USING btree (last_message_id);


--
-- Name: index_changesets_issues_on_issue_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_changesets_issues_on_issue_id ON public.changesets_issues USING btree (issue_id);


--
-- Name: index_changesets_on_committed_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_changesets_on_committed_on ON public.changesets USING btree (committed_on);


--
-- Name: index_changesets_on_repository_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_changesets_on_repository_id ON public.changesets USING btree (repository_id);


--
-- Name: index_changesets_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_changesets_on_user_id ON public.changesets USING btree (user_id);


--
-- Name: index_comments_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_comments_on_author_id ON public.comments USING btree (author_id);


--
-- Name: index_comments_on_commented_id_and_commented_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_comments_on_commented_id_and_commented_type ON public.comments USING btree (commented_id, commented_type);


--
-- Name: index_custom_fields_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_custom_fields_on_id_and_type ON public.custom_fields USING btree (id, type);


--
-- Name: index_custom_fields_projects_on_custom_field_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_custom_fields_projects_on_custom_field_id_and_project_id ON public.custom_fields_projects USING btree (custom_field_id, project_id);


--
-- Name: index_custom_fields_trackers_on_custom_field_id_and_tracker_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_custom_fields_trackers_on_custom_field_id_and_tracker_id ON public.custom_fields_trackers USING btree (custom_field_id, tracker_id);


--
-- Name: index_custom_values_on_custom_field_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_custom_values_on_custom_field_id ON public.custom_values USING btree (custom_field_id);


--
-- Name: index_documents_on_category_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_documents_on_category_id ON public.documents USING btree (category_id);


--
-- Name: index_documents_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_documents_on_created_on ON public.documents USING btree (created_on);


--
-- Name: index_email_addresses_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_email_addresses_on_user_id ON public.email_addresses USING btree (user_id);


--
-- Name: index_enumerations_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_enumerations_on_id_and_type ON public.enumerations USING btree (id, type);


--
-- Name: index_enumerations_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_enumerations_on_project_id ON public.enumerations USING btree (project_id);


--
-- Name: index_issue_categories_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_categories_on_assigned_to_id ON public.issue_categories USING btree (assigned_to_id);


--
-- Name: index_issue_relations_on_issue_from_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_relations_on_issue_from_id ON public.issue_relations USING btree (issue_from_id);


--
-- Name: index_issue_relations_on_issue_from_id_and_issue_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_issue_relations_on_issue_from_id_and_issue_to_id ON public.issue_relations USING btree (issue_from_id, issue_to_id);


--
-- Name: index_issue_relations_on_issue_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_relations_on_issue_to_id ON public.issue_relations USING btree (issue_to_id);


--
-- Name: index_issue_statuses_on_is_closed; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_statuses_on_is_closed ON public.issue_statuses USING btree (is_closed);


--
-- Name: index_issue_statuses_on_position; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_statuses_on_position ON public.issue_statuses USING btree ("position");


--
-- Name: index_issues_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_assigned_to_id ON public.issues USING btree (assigned_to_id);


--
-- Name: index_issues_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_author_id ON public.issues USING btree (author_id);


--
-- Name: index_issues_on_category_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_category_id ON public.issues USING btree (category_id);


--
-- Name: index_issues_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_created_on ON public.issues USING btree (created_on);


--
-- Name: index_issues_on_fixed_version_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_fixed_version_id ON public.issues USING btree (fixed_version_id);


--
-- Name: index_issues_on_parent_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_parent_id ON public.issues USING btree (parent_id);


--
-- Name: index_issues_on_priority_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_priority_id ON public.issues USING btree (priority_id);


--
-- Name: index_issues_on_root_id_and_lft_and_rgt; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_root_id_and_lft_and_rgt ON public.issues USING btree (root_id, lft, rgt);


--
-- Name: index_issues_on_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_status_id ON public.issues USING btree (status_id);


--
-- Name: index_issues_on_tracker_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_tracker_id ON public.issues USING btree (tracker_id);


--
-- Name: index_journals_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_journals_on_created_on ON public.journals USING btree (created_on);


--
-- Name: index_journals_on_journalized_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_journals_on_journalized_id ON public.journals USING btree (journalized_id);


--
-- Name: index_journals_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_journals_on_user_id ON public.journals USING btree (user_id);


--
-- Name: index_member_roles_on_inherited_from; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_member_roles_on_inherited_from ON public.member_roles USING btree (inherited_from);


--
-- Name: index_member_roles_on_member_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_member_roles_on_member_id ON public.member_roles USING btree (member_id);


--
-- Name: index_member_roles_on_role_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_member_roles_on_role_id ON public.member_roles USING btree (role_id);


--
-- Name: index_members_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_members_on_project_id ON public.members USING btree (project_id);


--
-- Name: index_members_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_members_on_user_id ON public.members USING btree (user_id);


--
-- Name: index_members_on_user_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_members_on_user_id_and_project_id ON public.members USING btree (user_id, project_id);


--
-- Name: index_messages_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_messages_on_author_id ON public.messages USING btree (author_id);


--
-- Name: index_messages_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_messages_on_created_on ON public.messages USING btree (created_on);


--
-- Name: index_messages_on_last_reply_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_messages_on_last_reply_id ON public.messages USING btree (last_reply_id);


--
-- Name: index_news_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_news_on_author_id ON public.news USING btree (author_id);


--
-- Name: index_news_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_news_on_created_on ON public.news USING btree (created_on);


--
-- Name: index_projects_on_lft; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_projects_on_lft ON public.projects USING btree (lft);


--
-- Name: index_projects_on_rgt; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_projects_on_rgt ON public.projects USING btree (rgt);


--
-- Name: index_queries_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_queries_on_project_id ON public.queries USING btree (project_id);


--
-- Name: index_queries_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_queries_on_user_id ON public.queries USING btree (user_id);


--
-- Name: index_repositories_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_repositories_on_project_id ON public.repositories USING btree (project_id);


--
-- Name: index_roles_managed_roles_on_role_id_and_managed_role_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_roles_managed_roles_on_role_id_and_managed_role_id ON public.roles_managed_roles USING btree (role_id, managed_role_id);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_settings_on_name ON public.settings USING btree (name);


--
-- Name: index_time_entries_on_activity_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_time_entries_on_activity_id ON public.time_entries USING btree (activity_id);


--
-- Name: index_time_entries_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_time_entries_on_created_on ON public.time_entries USING btree (created_on);


--
-- Name: index_time_entries_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_time_entries_on_user_id ON public.time_entries USING btree (user_id);


--
-- Name: index_tokens_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_tokens_on_user_id ON public.tokens USING btree (user_id);


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_user_preferences_on_user_id ON public.user_preferences USING btree (user_id);


--
-- Name: index_users_on_auth_source_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_users_on_auth_source_id ON public.users USING btree (auth_source_id);


--
-- Name: index_users_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_users_on_id_and_type ON public.users USING btree (id, type);


--
-- Name: index_users_on_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_users_on_type ON public.users USING btree (type);


--
-- Name: index_versions_on_sharing; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_versions_on_sharing ON public.versions USING btree (sharing);


--
-- Name: index_watchers_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_watchers_on_user_id ON public.watchers USING btree (user_id);


--
-- Name: index_watchers_on_watchable_id_and_watchable_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_watchers_on_watchable_id_and_watchable_type ON public.watchers USING btree (watchable_id, watchable_type);


--
-- Name: index_wiki_content_versions_on_updated_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_wiki_content_versions_on_updated_on ON public.wiki_content_versions USING btree (updated_on);


--
-- Name: index_wiki_contents_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_wiki_contents_on_author_id ON public.wiki_contents USING btree (author_id);


--
-- Name: index_wiki_pages_on_parent_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_wiki_pages_on_parent_id ON public.wiki_pages USING btree (parent_id);


--
-- Name: index_wiki_pages_on_wiki_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_wiki_pages_on_wiki_id ON public.wiki_pages USING btree (wiki_id);


--
-- Name: index_wiki_redirects_on_wiki_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_wiki_redirects_on_wiki_id ON public.wiki_redirects USING btree (wiki_id);


--
-- Name: index_workflows_on_new_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_workflows_on_new_status_id ON public.workflows USING btree (new_status_id);


--
-- Name: index_workflows_on_old_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_workflows_on_old_status_id ON public.workflows USING btree (old_status_id);


--
-- Name: index_workflows_on_role_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_workflows_on_role_id ON public.workflows USING btree (role_id);


--
-- Name: index_workflows_on_tracker_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_workflows_on_tracker_id ON public.workflows USING btree (tracker_id);


--
-- Name: issue_categories_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX issue_categories_project_id ON public.issue_categories USING btree (project_id);


--
-- Name: issues_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX issues_project_id ON public.issues USING btree (project_id);


--
-- Name: journal_details_journal_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX journal_details_journal_id ON public.journal_details USING btree (journal_id);


--
-- Name: journals_journalized_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX journals_journalized_id ON public.journals USING btree (journalized_id, journalized_type);


--
-- Name: messages_board_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX messages_board_id ON public.messages USING btree (board_id);


--
-- Name: messages_parent_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX messages_parent_id ON public.messages USING btree (parent_id);


--
-- Name: news_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX news_project_id ON public.news USING btree (project_id);


--
-- Name: projects_trackers_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX projects_trackers_project_id ON public.projects_trackers USING btree (project_id);


--
-- Name: projects_trackers_unique; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX projects_trackers_unique ON public.projects_trackers USING btree (project_id, tracker_id);


--
-- Name: queries_roles_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX queries_roles_ids ON public.queries_roles USING btree (query_id, role_id);


--
-- Name: time_entries_issue_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX time_entries_issue_id ON public.time_entries USING btree (issue_id);


--
-- Name: time_entries_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX time_entries_project_id ON public.time_entries USING btree (project_id);


--
-- Name: tokens_value; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX tokens_value ON public.tokens USING btree (value);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: versions_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX versions_project_id ON public.versions USING btree (project_id);


--
-- Name: watchers_user_id_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX watchers_user_id_type ON public.watchers USING btree (user_id, watchable_type);


--
-- Name: wiki_content_versions_wcid; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wiki_content_versions_wcid ON public.wiki_content_versions USING btree (wiki_content_id);


--
-- Name: wiki_contents_page_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wiki_contents_page_id ON public.wiki_contents USING btree (page_id);


--
-- Name: wiki_pages_wiki_id_title; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wiki_pages_wiki_id_title ON public.wiki_pages USING btree (wiki_id, title);


--
-- Name: wiki_redirects_wiki_id_title; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wiki_redirects_wiki_id_title ON public.wiki_redirects USING btree (wiki_id, title);


--
-- Name: wikis_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wikis_project_id ON public.wikis USING btree (project_id);


--
-- Name: wkfs_role_tracker_old_status; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wkfs_role_tracker_old_status ON public.workflows USING btree (role_id, tracker_id, old_status_id);


--
-- PostgreSQL database dump complete
--

