-- Creamos el esquema que contendrá la base de datos
CREATE SCHEMA dbcovid;
USE dbcovid;

-- Tabla Centro
-- Catálogo de los centros de vacunación existentes
CREATE TABLE dbcovid.Centro (
  idCentro TINYINT(4) UNSIGNED NOT NULL,
  centro_nombre VARCHAR(150) NOT NULL,
  idMunicipio TINYINT(4) UNSIGNED,
  idDepartamento TINYINT(3) UNSIGNED,
  PRIMARY KEY (idCentro)
);

-- Tabla Sexo
-- Catálogo del tipo de sexo
CREATE TABLE dbcovid.Sexo (
  idSexo TINYINT(2)  NOT NULL,
  sexo_descripcion VARCHAR(10) NOT NULL,
  PRIMARY KEY (idSexo)
);

-- Tabla TipoVacuna
-- Catálogo de los tipos de vacunas contra covid19 utilizados
CREATE TABLE dbcovid.TipoVacuna (
  idTipoVacuna TINYINT(3)  NOT NULL,
  tipovacuna_nombre VARCHAR(30) NOT NULL,
  PRIMARY KEY (idTipoVacuna)
);

-- Tabla Dosis
-- Catálogo del número de dosis aplicada
CREATE TABLE dbcovid.Dosis (
  idDosis TINYINT(2)  NOT NULL,
  dosis_nombre VARCHAR(10) NOT NULL,
  PRIMARY KEY (idDosis)
);

-- Tabla Vacunacion
-- Información de las dosis aplicadas contra covid19
CREATE TABLE dbcovid.Vacunacion (
  idCentro TINYINT(4) UNSIGNED NOT NULL,
  idSexo TINYINT(2) NOT NULL,
  idTipoVacuna TINYINT(3)  NOT NULL,
  idDosis TINYINT(2)  NOT NULL,
  fecha DATE NOT NULL,
  cantidad_aplicaciones INT NOT NULL,
  PRIMARY KEY (idCentro, idSexo, idTipoVacuna, idDosis, fecha )
  ,CONSTRAINT vacu_centro FOREIGN KEY(idCentro) REFERENCES dbcovid.Centro(idCentro)
  ,CONSTRAINT vacu_sexo FOREIGN KEY(idSexo) REFERENCES dbcovid.Sexo(idSexo)    
  ,CONSTRAINT vacu_tipovacuna FOREIGN KEY(idTipoVacuna) REFERENCES dbcovid.TipoVacuna(idTipoVacuna)
  ,CONSTRAINT vacu_dosis FOREIGN KEY(idDosis) REFERENCES dbcovid.Dosis(idDosis)  
);
