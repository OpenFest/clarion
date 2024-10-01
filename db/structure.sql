SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: call_for_participations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.call_for_participations (
    id integer NOT NULL,
    conference_id integer,
    opens_at timestamp with time zone,
    closes_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: call_for_participations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.call_for_participations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: call_for_participations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.call_for_participations_id_seq OWNED BY public.call_for_participations.id;


--
-- Name: conference_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conference_translations (
    id bigint NOT NULL,
    conference_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying,
    description text
);


--
-- Name: conference_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conference_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conference_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conference_translations_id_seq OWNED BY public.conference_translations.id;


--
-- Name: conferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conferences (
    id integer NOT NULL,
    title character varying,
    email character varying NOT NULL,
    description text,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    call_for_papers_open boolean,
    host_name character varying,
    planned_cfp_end_date date,
    vote_data_endpoint character varying,
    number_of_ballots_cast integer,
    vote_data_updated_at timestamp with time zone
);


--
-- Name: conferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conferences_id_seq OWNED BY public.conferences.id;


--
-- Name: conflict_counts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conflict_counts (
    id integer NOT NULL,
    left_id integer,
    right_id integer,
    number_of_conflicts integer
);


--
-- Name: conflict_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conflict_counts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conflict_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conflict_counts_id_seq OWNED BY public.conflict_counts.id;


--
-- Name: event_type_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_type_translations (
    id bigint NOT NULL,
    event_type_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying,
    description text
);


--
-- Name: event_type_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_type_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_type_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_type_translations_id_seq OWNED BY public.event_type_translations.id;


--
-- Name: event_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_types (
    id integer NOT NULL,
    conference_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    description text,
    minimum_length integer,
    maximum_length integer
);


--
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_types_id_seq OWNED BY public.event_types.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id integer NOT NULL,
    title character varying NOT NULL,
    subtitle character varying,
    length integer NOT NULL,
    language character varying DEFAULT 'bg_BG'::character varying NOT NULL,
    abstract text NOT NULL,
    description text NOT NULL,
    notes text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    acceptance_notification_sent_at timestamp with time zone,
    event_type_id integer,
    conference_id integer,
    track_id integer,
    number_of_votes integer,
    rank integer
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feedbacks (
    id integer NOT NULL,
    feedback_receiving_type character varying NOT NULL,
    feedback_receiving_id integer NOT NULL,
    author_email character varying,
    rating integer NOT NULL,
    comment text NOT NULL,
    ip_address character varying,
    session_id character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.feedbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- Name: hall_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hall_translations (
    id bigint NOT NULL,
    hall_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying
);


--
-- Name: hall_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hall_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hall_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hall_translations_id_seq OWNED BY public.hall_translations.id;


--
-- Name: halls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.halls (
    id integer NOT NULL,
    conference_id integer,
    name character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: halls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.halls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: halls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.halls_id_seq OWNED BY public.halls.id;


--
-- Name: participations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.participations (
    id integer NOT NULL,
    participant_id integer,
    event_id integer,
    approved boolean DEFAULT false,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: personal_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personal_profiles (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    organisation character varying,
    public_email character varying,
    picture character varying,
    mobile_phone character varying,
    biography text,
    github character varying,
    twitter character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    user_id integer,
    conference_id integer
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp with time zone,
    remember_created_at timestamp with time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp with time zone,
    confirmation_sent_at timestamp with time zone,
    unconfirmed_email character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    admin boolean DEFAULT false NOT NULL,
    language character varying,
    owner boolean DEFAULT false NOT NULL
);


--
-- Name: participants; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.participants AS
 SELECT users.id AS participant_id,
    users.email AS personal_email,
    users.language,
    participations.id AS participation_id,
    personal_profiles.id AS personal_profile_id,
    personal_profiles.id,
    personal_profiles.first_name,
    personal_profiles.last_name,
    personal_profiles.organisation,
    personal_profiles.public_email,
    personal_profiles.picture,
    personal_profiles.mobile_phone,
    personal_profiles.biography,
    personal_profiles.github,
    personal_profiles.twitter,
    personal_profiles.created_at,
    personal_profiles.updated_at,
    personal_profiles.user_id,
    personal_profiles.conference_id
   FROM ((((public.users
     JOIN public.participations ON ((users.id = participations.participant_id)))
     JOIN public.events ON ((events.id = participations.event_id)))
     JOIN public.conferences ON ((events.conference_id = conferences.id)))
     LEFT JOIN public.personal_profiles ON (((personal_profiles.conference_id = events.conference_id) AND (personal_profiles.user_id = users.id))));


--
-- Name: participations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.participations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: participations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.participations_id_seq OWNED BY public.participations.id;


--
-- Name: personal_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personal_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personal_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personal_profiles_id_seq OWNED BY public.personal_profiles.id;


--
-- Name: propositions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.propositions (
    id integer NOT NULL,
    proposer_id integer,
    proposable_type character varying,
    proposable_id integer,
    status integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    confirmed_at timestamp with time zone
);


--
-- Name: propositions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.propositions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: propositions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.propositions_id_seq OWNED BY public.propositions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: slots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.slots (
    id integer NOT NULL,
    hall_id integer,
    starts_at timestamp with time zone NOT NULL,
    ends_at timestamp with time zone NOT NULL,
    event_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: slots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.slots_id_seq OWNED BY public.slots.id;


--
-- Name: track_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.track_translations (
    id bigint NOT NULL,
    track_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying,
    description text
);


--
-- Name: track_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.track_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: track_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.track_translations_id_seq OWNED BY public.track_translations.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tracks (
    id integer NOT NULL,
    name text,
    color character varying NOT NULL,
    conference_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    description text,
    css_class character varying,
    css_style text,
    foreground_color character varying
);


--
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tracks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tracks_id_seq OWNED BY public.tracks.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: volunteer_team_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.volunteer_team_translations (
    id bigint NOT NULL,
    volunteer_team_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying,
    description text
);


--
-- Name: volunteer_team_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.volunteer_team_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteer_team_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.volunteer_team_translations_id_seq OWNED BY public.volunteer_team_translations.id;


--
-- Name: volunteer_teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.volunteer_teams (
    id integer NOT NULL,
    conference_id integer,
    color character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: volunteer_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.volunteer_teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteer_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.volunteer_teams_id_seq OWNED BY public.volunteer_teams.id;


--
-- Name: volunteer_teams_volunteers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.volunteer_teams_volunteers (
    volunteer_id integer NOT NULL,
    volunteer_team_id integer NOT NULL
);


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name character varying,
    picture_id character varying,
    email character varying,
    unique_id character varying,
    phone character varying,
    tshirt_size character varying,
    tshirt_cut character varying,
    food_preferences character varying,
    previous_experience text,
    notes text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    conference_id integer,
    language character varying,
    volunteer_team_id bigint,
    confirmation_token character varying,
    confirmed_at timestamp with time zone,
    approved_at timestamp with time zone,
    terms_accepted boolean DEFAULT false
);


--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: volunteerships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.volunteerships (
    id integer NOT NULL,
    volunteer_team_id integer,
    volunteer_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: volunteerships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.volunteerships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteerships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.volunteerships_id_seq OWNED BY public.volunteerships.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: call_for_participations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.call_for_participations ALTER COLUMN id SET DEFAULT nextval('public.call_for_participations_id_seq'::regclass);


--
-- Name: conference_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_translations ALTER COLUMN id SET DEFAULT nextval('public.conference_translations_id_seq'::regclass);


--
-- Name: conferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conferences ALTER COLUMN id SET DEFAULT nextval('public.conferences_id_seq'::regclass);


--
-- Name: conflict_counts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conflict_counts ALTER COLUMN id SET DEFAULT nextval('public.conflict_counts_id_seq'::regclass);


--
-- Name: event_type_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_type_translations ALTER COLUMN id SET DEFAULT nextval('public.event_type_translations_id_seq'::regclass);


--
-- Name: event_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_types ALTER COLUMN id SET DEFAULT nextval('public.event_types_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- Name: hall_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hall_translations ALTER COLUMN id SET DEFAULT nextval('public.hall_translations_id_seq'::regclass);


--
-- Name: halls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.halls ALTER COLUMN id SET DEFAULT nextval('public.halls_id_seq'::regclass);


--
-- Name: participations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participations ALTER COLUMN id SET DEFAULT nextval('public.participations_id_seq'::regclass);


--
-- Name: personal_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_profiles ALTER COLUMN id SET DEFAULT nextval('public.personal_profiles_id_seq'::regclass);


--
-- Name: propositions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.propositions ALTER COLUMN id SET DEFAULT nextval('public.propositions_id_seq'::regclass);


--
-- Name: slots id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slots ALTER COLUMN id SET DEFAULT nextval('public.slots_id_seq'::regclass);


--
-- Name: track_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track_translations ALTER COLUMN id SET DEFAULT nextval('public.track_translations_id_seq'::regclass);


--
-- Name: tracks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracks ALTER COLUMN id SET DEFAULT nextval('public.tracks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: volunteer_team_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteer_team_translations ALTER COLUMN id SET DEFAULT nextval('public.volunteer_team_translations_id_seq'::regclass);


--
-- Name: volunteer_teams id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteer_teams ALTER COLUMN id SET DEFAULT nextval('public.volunteer_teams_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Name: volunteerships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteerships ALTER COLUMN id SET DEFAULT nextval('public.volunteerships_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: call_for_participations call_for_participations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.call_for_participations
    ADD CONSTRAINT call_for_participations_pkey PRIMARY KEY (id);


--
-- Name: conference_translations conference_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_translations
    ADD CONSTRAINT conference_translations_pkey PRIMARY KEY (id);


--
-- Name: conferences conferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conferences
    ADD CONSTRAINT conferences_pkey PRIMARY KEY (id);


--
-- Name: conflict_counts conflict_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conflict_counts
    ADD CONSTRAINT conflict_counts_pkey PRIMARY KEY (id);


--
-- Name: event_type_translations event_type_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_type_translations
    ADD CONSTRAINT event_type_translations_pkey PRIMARY KEY (id);


--
-- Name: event_types event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: hall_translations hall_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hall_translations
    ADD CONSTRAINT hall_translations_pkey PRIMARY KEY (id);


--
-- Name: halls halls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.halls
    ADD CONSTRAINT halls_pkey PRIMARY KEY (id);


--
-- Name: participations participations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participations
    ADD CONSTRAINT participations_pkey PRIMARY KEY (id);


--
-- Name: personal_profiles personal_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_profiles
    ADD CONSTRAINT personal_profiles_pkey PRIMARY KEY (id);


--
-- Name: propositions propositions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.propositions
    ADD CONSTRAINT propositions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: slots slots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT slots_pkey PRIMARY KEY (id);


--
-- Name: track_translations track_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track_translations
    ADD CONSTRAINT track_translations_pkey PRIMARY KEY (id);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: volunteer_team_translations volunteer_team_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteer_team_translations
    ADD CONSTRAINT volunteer_team_translations_pkey PRIMARY KEY (id);


--
-- Name: volunteer_teams volunteer_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteer_teams
    ADD CONSTRAINT volunteer_teams_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- Name: volunteerships volunteerships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteerships
    ADD CONSTRAINT volunteerships_pkey PRIMARY KEY (id);


--
-- Name: feedbacks_polymorphic_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX feedbacks_polymorphic_index ON public.feedbacks USING btree (feedback_receiving_type, feedback_receiving_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_call_for_participations_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_call_for_participations_on_conference_id ON public.call_for_participations USING btree (conference_id);


--
-- Name: index_conference_translations_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conference_translations_on_conference_id ON public.conference_translations USING btree (conference_id);


--
-- Name: index_conference_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conference_translations_on_locale ON public.conference_translations USING btree (locale);


--
-- Name: index_conferences_on_host_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conferences_on_host_name ON public.conferences USING btree (host_name);


--
-- Name: index_conflict_counts_on_left_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conflict_counts_on_left_id ON public.conflict_counts USING btree (left_id);


--
-- Name: index_conflict_counts_on_left_id_and_right_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_conflict_counts_on_left_id_and_right_id ON public.conflict_counts USING btree (left_id, right_id);


--
-- Name: index_conflict_counts_on_right_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conflict_counts_on_right_id ON public.conflict_counts USING btree (right_id);


--
-- Name: index_event_type_translations_on_event_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_type_translations_on_event_type_id ON public.event_type_translations USING btree (event_type_id);


--
-- Name: index_event_type_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_type_translations_on_locale ON public.event_type_translations USING btree (locale);


--
-- Name: index_event_types_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_types_on_conference_id ON public.event_types USING btree (conference_id);


--
-- Name: index_events_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_conference_id ON public.events USING btree (conference_id);


--
-- Name: index_events_on_event_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_event_type_id ON public.events USING btree (event_type_id);


--
-- Name: index_events_on_track_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_track_id ON public.events USING btree (track_id);


--
-- Name: index_feedbacks_on_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_feedbacks_on_session_id ON public.feedbacks USING btree (session_id);


--
-- Name: index_hall_translations_on_hall_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hall_translations_on_hall_id ON public.hall_translations USING btree (hall_id);


--
-- Name: index_hall_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hall_translations_on_locale ON public.hall_translations USING btree (locale);


--
-- Name: index_halls_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_halls_on_conference_id ON public.halls USING btree (conference_id);


--
-- Name: index_participations_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_participations_on_event_id ON public.participations USING btree (event_id);


--
-- Name: index_participations_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_participations_on_participant_id ON public.participations USING btree (participant_id);


--
-- Name: index_personal_profiles_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_personal_profiles_on_conference_id ON public.personal_profiles USING btree (conference_id);


--
-- Name: index_personal_profiles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_personal_profiles_on_user_id ON public.personal_profiles USING btree (user_id);


--
-- Name: index_propositions_on_proposable_type_and_proposable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_propositions_on_proposable_type_and_proposable_id ON public.propositions USING btree (proposable_type, proposable_id);


--
-- Name: index_propositions_on_proposer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_propositions_on_proposer_id ON public.propositions USING btree (proposer_id);


--
-- Name: index_slots_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_slots_on_event_id ON public.slots USING btree (event_id);


--
-- Name: index_slots_on_hall_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_slots_on_hall_id ON public.slots USING btree (hall_id);


--
-- Name: index_track_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_track_translations_on_locale ON public.track_translations USING btree (locale);


--
-- Name: index_track_translations_on_track_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_track_translations_on_track_id ON public.track_translations USING btree (track_id);


--
-- Name: index_tracks_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tracks_on_conference_id ON public.tracks USING btree (conference_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_volunteer_team_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteer_team_translations_on_locale ON public.volunteer_team_translations USING btree (locale);


--
-- Name: index_volunteer_team_translations_on_volunteer_team_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteer_team_translations_on_volunteer_team_id ON public.volunteer_team_translations USING btree (volunteer_team_id);


--
-- Name: index_volunteer_teams_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteer_teams_on_conference_id ON public.volunteer_teams USING btree (conference_id);


--
-- Name: index_volunteers_on_approved_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_approved_at ON public.volunteers USING btree (approved_at);


--
-- Name: index_volunteers_on_conference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_conference_id ON public.volunteers USING btree (conference_id);


--
-- Name: index_volunteers_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_confirmation_token ON public.volunteers USING btree (confirmation_token);


--
-- Name: index_volunteers_on_confirmed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_confirmed_at ON public.volunteers USING btree (confirmed_at);


--
-- Name: index_volunteers_on_unique_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_volunteers_on_unique_id ON public.volunteers USING btree (unique_id);


--
-- Name: index_volunteers_on_volunteer_team_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteers_on_volunteer_team_id ON public.volunteers USING btree (volunteer_team_id);


--
-- Name: index_volunteerships_on_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteerships_on_volunteer_id ON public.volunteerships USING btree (volunteer_id);


--
-- Name: index_volunteerships_on_volunteer_team_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteerships_on_volunteer_team_id ON public.volunteerships USING btree (volunteer_team_id);


--
-- Name: volunteer_id_volunteer_team_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX volunteer_id_volunteer_team_id ON public.volunteer_teams_volunteers USING btree (volunteer_id, volunteer_team_id);


--
-- Name: volunteer_team_id_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX volunteer_team_id_volunteer_id ON public.volunteer_teams_volunteers USING btree (volunteer_team_id, volunteer_id);


--
-- Name: event_type_translations fk_rails_0780c81500; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_type_translations
    ADD CONSTRAINT fk_rails_0780c81500 FOREIGN KEY (event_type_id) REFERENCES public.event_types(id) ON DELETE CASCADE;


--
-- Name: events fk_rails_09a69315a8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_09a69315a8 FOREIGN KEY (conference_id) REFERENCES public.conferences(id);


--
-- Name: propositions fk_rails_159b16b3e2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.propositions
    ADD CONSTRAINT fk_rails_159b16b3e2 FOREIGN KEY (proposer_id) REFERENCES public.users(id);


--
-- Name: volunteer_teams_volunteers fk_rails_1d14d32041; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteer_teams_volunteers
    ADD CONSTRAINT fk_rails_1d14d32041 FOREIGN KEY (volunteer_id) REFERENCES public.volunteers(id) ON DELETE CASCADE;


--
-- Name: volunteers fk_rails_1d27129278; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT fk_rails_1d27129278 FOREIGN KEY (conference_id) REFERENCES public.conferences(id);


--
-- Name: call_for_participations fk_rails_202626e398; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.call_for_participations
    ADD CONSTRAINT fk_rails_202626e398 FOREIGN KEY (conference_id) REFERENCES public.conferences(id) ON DELETE CASCADE;


--
-- Name: track_translations fk_rails_2b6e3a02c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track_translations
    ADD CONSTRAINT fk_rails_2b6e3a02c0 FOREIGN KEY (track_id) REFERENCES public.tracks(id) ON DELETE CASCADE;


--
-- Name: volunteer_team_translations fk_rails_2c67cd6b12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteer_team_translations
    ADD CONSTRAINT fk_rails_2c67cd6b12 FOREIGN KEY (volunteer_team_id) REFERENCES public.volunteer_teams(id) ON DELETE CASCADE;


--
-- Name: slots fk_rails_2cf5cf431b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT fk_rails_2cf5cf431b FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE SET NULL;


--
-- Name: volunteer_teams_volunteers fk_rails_3395318008; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteer_teams_volunteers
    ADD CONSTRAINT fk_rails_3395318008 FOREIGN KEY (volunteer_team_id) REFERENCES public.volunteer_teams(id) ON DELETE CASCADE;


--
-- Name: halls fk_rails_35c078cf97; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.halls
    ADD CONSTRAINT fk_rails_35c078cf97 FOREIGN KEY (conference_id) REFERENCES public.conferences(id) ON DELETE CASCADE;


--
-- Name: volunteers fk_rails_3d28a8e84e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT fk_rails_3d28a8e84e FOREIGN KEY (volunteer_team_id) REFERENCES public.volunteer_teams(id);


--
-- Name: conflict_counts fk_rails_40c977aa14; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conflict_counts
    ADD CONSTRAINT fk_rails_40c977aa14 FOREIGN KEY (left_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: slots fk_rails_444cf55335; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT fk_rails_444cf55335 FOREIGN KEY (hall_id) REFERENCES public.halls(id) ON DELETE CASCADE;


--
-- Name: personal_profiles fk_rails_445f9e31fe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_profiles
    ADD CONSTRAINT fk_rails_445f9e31fe FOREIGN KEY (conference_id) REFERENCES public.conferences(id);


--
-- Name: conference_translations fk_rails_5320210ed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conference_translations
    ADD CONSTRAINT fk_rails_5320210ed2 FOREIGN KEY (conference_id) REFERENCES public.conferences(id) ON DELETE CASCADE;


--
-- Name: events fk_rails_75f14fef31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_75f14fef31 FOREIGN KEY (event_type_id) REFERENCES public.event_types(id);


--
-- Name: tracks fk_rails_9529c3a5ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT fk_rails_9529c3a5ed FOREIGN KEY (conference_id) REFERENCES public.conferences(id) ON DELETE CASCADE;


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: volunteerships fk_rails_9aba272a7d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteerships
    ADD CONSTRAINT fk_rails_9aba272a7d FOREIGN KEY (volunteer_team_id) REFERENCES public.volunteer_teams(id);


--
-- Name: volunteer_teams fk_rails_a006c125b0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteer_teams
    ADD CONSTRAINT fk_rails_a006c125b0 FOREIGN KEY (conference_id) REFERENCES public.conferences(id) ON DELETE CASCADE;


--
-- Name: volunteerships fk_rails_a1a3689a5c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.volunteerships
    ADD CONSTRAINT fk_rails_a1a3689a5c FOREIGN KEY (volunteer_id) REFERENCES public.users(id);


--
-- Name: hall_translations fk_rails_a48a7b4254; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hall_translations
    ADD CONSTRAINT fk_rails_a48a7b4254 FOREIGN KEY (hall_id) REFERENCES public.halls(id) ON DELETE CASCADE;


--
-- Name: participations fk_rails_bae88c7ffa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participations
    ADD CONSTRAINT fk_rails_bae88c7ffa FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: personal_profiles fk_rails_bd5acbc3c6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_profiles
    ADD CONSTRAINT fk_rails_bd5acbc3c6 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: participations fk_rails_c246cbdecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participations
    ADD CONSTRAINT fk_rails_c246cbdecd FOREIGN KEY (participant_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: event_types fk_rails_d849567746; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT fk_rails_d849567746 FOREIGN KEY (conference_id) REFERENCES public.conferences(id) ON DELETE CASCADE;


--
-- Name: events fk_rails_dea4df4d73; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_dea4df4d73 FOREIGN KEY (track_id) REFERENCES public.tracks(id);


--
-- Name: conflict_counts fk_rails_e311b61878; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conflict_counts
    ADD CONSTRAINT fk_rails_e311b61878 FOREIGN KEY (right_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20241001115434'),
('20240923061535'),
('20240418161417'),
('20240418144517'),
('20240219234146'),
('20240219195550'),
('20240219195549'),
('20240219191236'),
('20190505111757'),
('20190505111117'),
('20190504165744'),
('20190428101041'),
('20171022182011'),
('20161015023007'),
('20161012185931'),
('20161011005420'),
('20161011005219'),
('20161010170711'),
('20161010163747'),
('20160705153038'),
('20151021190854'),
('20151021185100'),
('20151021183039'),
('20151021162134'),
('20151020071227'),
('20151018212026'),
('20151018211712'),
('20151018211611'),
('20151018105933'),
('20151018105806'),
('20151018105303'),
('20150901091814'),
('20150901074818'),
('20150819213202'),
('20150819205900'),
('20150815030159'),
('20150814204500'),
('20150814203341'),
('20150814202053'),
('20150805161830'),
('20150729145831'),
('20150729135818'),
('20150729135346'),
('20150719170422'),
('20150719114546'),
('20150712103000'),
('20150530182857'),
('20150530182514'),
('20150530181525'),
('20150524160616'),
('20150420154042'),
('20150417004249'),
('20150417002233'),
('20150417002119'),
('20150416234411'),
('20150416232523'),
('20150408205015'),
('20150408204855'),
('20150408204739'),
('20141105100827'),
('20141105100105'),
('20141014181014'),
('20141013134153'),
('20141012110528'),
('20141012101004'),
('20141012100900'),
('20141010142514'),
('20140906151433'),
('20140906151300'),
('20140902144335'),
('20140901103859'),
('20140831121527'),
('20140810174338'),
('20140810172123'),
('20140810162730'),
('20140807104059'),
('20140807103805'),
('20140807103632'),
('20140728105159');

