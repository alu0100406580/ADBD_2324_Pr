SET session_replication_role = 'replica';
SET session_replication_role = 'origin';
SET session_replication_role = DEFAULT;
SET session_replication_role = 'origin';

-- -----------------------------------------------------
-- Schema viveros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS viveros;
SET search_path = viveros;

-- -----------------------------------------------------
-- Table viveros.ZONA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS viveros.ZONA (
  idZONA serial PRIMARY KEY,
  nombre TEXT NULL,
  idvivero INT NULL,
  latitud TEXT NULL,
  longitud TEXT NULL
);

-- -----------------------------------------------------
-- Table viveros.PRODUCTOAZONA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS viveros.PRODUCTOAZONA (
  idPRODUCTOAZONA serial PRIMARY KEY,
  idzona INT NULL
);

-- -----------------------------------------------------
-- Table viveros.CLIENTE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS viveros.CLIENTE (
  idCLIENTE serial PRIMARY KEY,
  nombre TEXT NULL,
  apellido TEXT NULL
);

-- -----------------------------------------------------
-- Table viveros.PRODUCTO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS viveros.PRODUCTO (
  idPRODUCTO serial PRIMARY KEY,
  nombre TEXT NOT NULL,
  descripcion TEXT NULL,
  caracteristicas_especiales TEXT NULL,
  cantidad INT NOT NULL
);

-- -----------------------------------------------------
-- Table viveros.PEDIDO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS viveros.PEDIDO (
  idPEDIDO serial PRIMARY KEY,
  clienteid INT NULL,
  empleadoID INT NULL,
  fechapedido TIMESTAMP NULL,
  descripcion TEXT NULL,
  producto INT NULL,
  cantidad TEXT NULL
);

-- -----------------------------------------------------
-- Table viveros.CLIENTETAJINASTEPLUS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS viveros.CLIENTETAJINASTEPLUS (
  idfidelizacion serial PRIMARY KEY,
  clienteid INT NULL,
  volumencomprastajinaste INT NULL,
  responsableid INT NULL,
  bonificacion INT NULL
);

-- -----------------------------------------------------
-- Table viveros.EMPLEADO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS viveros.EMPLEADO (
  idEMPLEADO serial PRIMARY KEY,
  nombre TEXT NULL,
  Apellido TEXT NULL
);

-- -----------------------------------------------------
-- Table viveros.HISTORICOEMPLEADO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS viveros.HISTORICOEMPLEADO (
  idHISTORICOEMPLEADO serial PRIMARY KEY,
  empleadoID INT NULL,
  viveroID INT NULL,
  fechainicio TIMESTAMP NULL,
  fechafin TIMESTAMP NULL,
  zonaID INT NULL
);

-- -----------------------------------------------------
-- Table viveros.VIVERO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS viveros.VIVERO (
  idVIVERO serial PRIMARY KEY,
  nombre TEXT NULL,
  zonavivero INT NULL
);

-- Agregamos una secuencia para la columna idZONA (equivalente a AUTO_INCREMENT en MySQL):
CREATE SEQUENCE viveros.zona_id_seq START 1;

-- Definimos la columna idZONA como serial (equivalente a AUTO_INCREMENT en MySQL):
SELECT setval('viveros.zona_id_seq', (SELECT max(idZONA) FROM viveros.ZONA));

-- Crear índice y clave foránea
CREATE INDEX fk_vivero_idx ON viveros.ZONA (idvivero);
ALTER TABLE viveros.ZONA ADD CONSTRAINT fk_vivero
  FOREIGN KEY (idvivero)
  REFERENCES viveros.VIVERO (idVIVERO)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- Agregamos una secuencia para la columna idCLIENTE (equivalente a AUTO_INCREMENT en MySQL):
CREATE SEQUENCE viveros.cliente_id_seq START 1;

-- Definimos la columna idCLIENTE como serial (equivalente a AUTO_INCREMENT en MySQL):
SELECT setval('viveros.cliente_id_seq', (SELECT max(idCLIENTE) FROM viveros.CLIENTE));

-- Agregamos una secuencia para la columna idPRODUCTO (equivalente a AUTO_INCREMENT en MySQL):
CREATE SEQUENCE viveros.producto_id_seq START 1;

-- Definimos la columna idPRODUCTO como serial (equivalente a AUTO_INCREMENT en MySQL):
SELECT setval('viveros.producto_id_seq', (SELECT max(idPRODUCTO) FROM viveros.PRODUCTO));

-- Agregamos una secuencia para la columna idPEDIDO (equivalente a AUTO_INCREMENT en MySQL):
CREATE SEQUENCE viveros.pedido_id_seq START 1;

-- Definimos la columna idPEDIDO como serial (equivalente a AUTO_INCREMENT en MySQL):
SELECT setval('viveros.pedido_id_seq', (SELECT max(idPEDIDO) FROM viveros.PEDIDO));

-- Crear índices y claves foráneas
CREATE INDEX fk_PEDIDO_1_idx ON viveros.PEDIDO (clienteid);
CREATE INDEX fk_PEDIDO_3_idx ON viveros.PEDIDO (producto);
CREATE INDEX fk_PEDIDO_2_idx ON viveros.PEDIDO (empleadoID);

ALTER TABLE viveros.PEDIDO ADD CONSTRAINT fk_PEDIDO_1
  FOREIGN KEY (clienteid)
  REFERENCES viveros.CLIENTE (idCLIENTE)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE viveros.PEDIDO ADD CONSTRAINT fk_PEDIDO_2
  FOREIGN KEY (empleadoID)
  REFERENCES viveros.EMPLEADO (idEMPLEADO)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE viveros.PEDIDO ADD CONSTRAINT fk_PEDIDO_3
  FOREIGN KEY (producto)
  REFERENCES viveros.PRODUCTO (idPRODUCTO)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- Agregamos una secuencia para la columna idfidelizacion (equivalente a AUTO_INCREMENT en MySQL):
CREATE SEQUENCE viveros.clientetajinaste_id_seq START 1;

-- Definimos la columna idfidelizacion como serial (equivalente a AUTO_INCREMENT en MySQL):
SELECT setval('viveros.clientetajinaste_id_seq', (SELECT max(idfidelizacion) FROM viveros.CLIENTETAJINASTEPLUS));

-- Crear índices y claves foráneas
CREATE INDEX fk_CLIENTETAJINASTEPLUS_1_idx ON viveros.CLIENTETAJINASTEPLUS (clienteid);
CREATE INDEX fk_EMPLEADO_idx ON viveros.CLIENTETAJINASTEPLUS (responsableid);

ALTER TABLE viveros.CLIENTETAJINASTEPLUS ADD CONSTRAINT fk_CLIENTE
  FOREIGN KEY (clienteid)
  REFERENCES viveros.CLIENTE (idCLIENTE)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE viveros.CLIENTETAJINASTEPLUS ADD CONSTRAINT fk_EMPLEADO
  FOREIGN KEY (responsableid)
  REFERENCES viveros.EMPLEADO (idEMPLEADO)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- Agregamos una secuencia para la columna idEMPLEADO (equivalente a AUTO_INCREMENT en MySQL):
CREATE SEQUENCE viveros.empleado_id_seq START 1;

-- Definimos la columna idEMPLEADO como serial (equivalente a AUTO_INCREMENT en MySQL):
SELECT setval('viveros.empleado_id_seq', (SELECT max(idEMPLEADO) FROM viveros.EMPLEADO));

-- Crear claves foráneas
-- Si deseas agregar claves foráneas en la tabla EMPLEADO, debes definirlas con los nombres apropiados.

-- Agregamos una secuencia para la columna idHISTORICOEMPLEADO (equivalente a AUTO_INCREMENT en MySQL):
CREATE SEQUENCE viveros.historicoempleado_id_seq START 1;

-- Definimos la columna idHISTORICOEMPLEADO como serial (equivalente a AUTO_INCREMENT en MySQL):
SELECT setval('viveros.historicoempleado_id_seq', (SELECT max(idHISTORICOEMPLEADO) FROM viveros.HISTORICOEMPLEADO));

-- Crear índices y claves foráneas
CREATE INDEX viverofk_idx ON viveros.HISTORICOEMPLEADO (viveroID);
CREATE INDEX zonafk_idx ON viveros.HISTORICOEMPLEADO (zonaID);
CREATE INDEX empleadofk_idx ON viveros.HISTORICOEMPLEADO (empleadoID);

ALTER TABLE viveros.HISTORICOEMPLEADO ADD CONSTRAINT empleadofk
  FOREIGN KEY (empleadoID)
  REFERENCES viveros.EMPLEADO (idEMPLEADO)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE viveros.HISTORICOEMPLEADO ADD CONSTRAINT viverofk
  FOREIGN KEY (viveroID)
  REFERENCES viveros.VIVERO (idVIVERO)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE viveros.HISTORICOEMPLEADO ADD CONSTRAINT zonafk
  FOREIGN KEY (zonaID)
  REFERENCES viveros.ZONA (idZONA)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- Agregamos una secuencia para la columna idVIVERO (equivalente a AUTO_INCREMENT en MySQL):
CREATE SEQUENCE viveros.vivero_id_seq START 1;

-- Definimos la columna idVIVERO como serial (equivalente a AUTO_INCREMENT en MySQL):
SELECT setval('viveros.vivero_id_seq', (SELECT max(idVIVERO) FROM viveros.VIVERO));

-- Crear índices y claves foráneas
CREATE INDEX zonaid_idx ON viveros.VIVERO (zonavivero);

ALTER TABLE viveros.VIVERO ADD CONSTRAINT zonaid
  FOREIGN KEY (zonavivero)
  REFERENCES viveros.ZONA (idZONA)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- Agregamos una secuencia para la columna idPRODUCTOAZONA (equivalente a AUTO_INCREMENT en MySQL):
CREATE SEQUENCE viveros.productoazona_id_seq START 1;

-- Definimos la columna idPRODUCTOAZONA como serial (equivalente a AUTO_INCREMENT en MySQL):
SELECT setval('viveros.productoazona_id_seq', (SELECT max(idPRODUCTOAZONA) FROM viveros.PRODUCTOAZONA));

-- Crear índices y claves foráneas
CREATE INDEX ZonaID_idx ON viveros.PRODUCTOAZONA (idzona);

ALTER TABLE viveros.PRODUCTOAZONA ADD CONSTRAINT ProductoID
  FOREIGN KEY (idPRODUCTOAZONA)
  REFERENCES viveros.PRODUCTO (idPRODUCTO)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE viveros.PRODUCTOAZONA ADD CONSTRAINT ZonaID
  FOREIGN KEY (idzona)
  REFERENCES viveros.ZONA (idZONA)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- Restauramos la configuración original de la sesión de PostgreSQL:
RESET search_path;

