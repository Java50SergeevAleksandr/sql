CREATE TABLE IF NOT EXISTS public.car_owners
(
    id bigint NOT NULL,
    name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    city character varying COLLATE pg_catalog."default",
    email character varying COLLATE pg_catalog."default",
    phone character varying COLLATE pg_catalog."default",
    birth_date date,
    CONSTRAINT car_owners_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.car_owners
    OWNER to postgres;
	
	
	
	CREATE TABLE IF NOT EXISTS public.models
(
    
    name character varying COLLATE pg_catalog."default" NOT NULL,
	year integer NOT NULL,
    company character varying COLLATE pg_catalog."default" NOT NULL,
    engine_capacity integer,
    engine_power integer,
    birth_date date,
    CONSTRAINT models_pkey PRIMARY KEY (name, year)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.models
    OWNER to postgres;
	
	
	
	CREATE TABLE IF NOT EXISTS public.cars
(
    
    "number" character varying COLLATE pg_catalog."default" NOT NULL,
	color character varying COLLATE pg_catalog."default" NOT NULL,
	kilometers integer NOT NULL,
	state character varying COLLATE pg_catalog."default" NOT NULL,
    model_name character varying COLLATE pg_catalog."default" NOT NULL,
    model_year integer,
    owner_id bigint,
    CONSTRAINT "number-pk" PRIMARY KEY ("number"),
	CONSTRAINT "model-fk" FOREIGN KEY (model_name, model_year)
		REFERENCES public.models (name, year) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION,
	CONSTRAINT "owner-fk" FOREIGN KEY (owner_id)
		REFERENCES public.car_owners (id) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION	
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cars
    OWNER to postgres;
	
	
	
	
	CREATE TABLE IF NOT EXISTS public.trade_deals
(
    
	id bigint NOT NULL,
	date date NOT NULL,
    car_number character varying COLLATE pg_catalog."default" NOT NULL,
	owner_id bigint ,
    
    CONSTRAINT id_pk PRIMARY KEY (id),
	CONSTRAINT car_fk_1 FOREIGN KEY (car_number)
		REFERENCES public.cars ("number") MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION,
	CONSTRAINT owner_fk_2 FOREIGN KEY (owner_id)
		REFERENCES public.car_owners (id) MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION	
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.trade_deals
    OWNER to postgres;