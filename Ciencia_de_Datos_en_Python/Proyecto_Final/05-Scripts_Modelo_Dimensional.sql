DROP TABLE IF EXISTS public.dim_centro;
DROP TABLE IF EXISTS public.dim_sexo;
DROP TABLE IF EXISTS public.dim_tipovacuna;
DROP TABLE IF EXISTS public.dim_dosis;
DROP TABLE IF EXISTS public.dim_tiempo;
DROP TABLE IF EXISTS public.fact_vacunacion;


CREATE TABLE IF NOT EXISTS public.dim_centro(
	centro_key INTEGER PRIMARY KEY,
	centro_dsc VARCHAR(150) NOT NULL,
  	municipio_dsc VARCHAR(150) NOT NULL,
    departamento_dsc VARCHAR(150) NOT NULL
);


CREATE TABLE IF NOT EXISTS public.dim_sexo(
	sexo_key INTEGER PRIMARY KEY,
	sexo_dsc VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.dim_tipovacuna(
	tipovacuna_key INTEGER PRIMARY KEY,
	tipovacuna_dsc VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.dim_dosis(
	dosis_key INTEGER PRIMARY KEY,
	dosis_dsc VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.dim_tiempo(
  	fecha DATE,
	anio INTEGER,
    mes	INTEGER,
    trimestre INTEGER,
    dia	INTEGER,
    semana INTEGER,
    dia_de_la_semana INTEGER,
    es_fin_de_semana INTEGER,
	tiempo_key INTEGER PRIMARY KEY  
);


CREATE TABLE IF NOT EXISTS public.fact_vacunacion(
  	centro_key INTEGER,
	sexo_key INTEGER,
  	tipovacuna_key INTEGER,
    dosis_key INTEGER,
    tiempo_key INTEGER,
    cantidad_aplicaciones INTEGER,
  	PRIMARY KEY (centro_key, sexo_key, tipovacuna_key, dosis_key, tiempo_key)
);
