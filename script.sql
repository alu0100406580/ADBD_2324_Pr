
-- -----------------------------------------------------
-- Schema viveros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema viveros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `viveros` ;
USE `viveros` ;

-- -----------------------------------------------------
-- Table `viveros`.`ZONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viveros`.`ZONA` (
  `idZONA` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idZONA`));


-- -----------------------------------------------------
-- Table `viveros`.`VIVERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viveros`.`VIVERO` (
  `idVIVERO` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idVIVERO`),
  UNIQUE INDEX `idVIVERO_UNIQUE` (`idVIVERO` ASC) VISIBLE,
  CONSTRAINT `zonaid`
    FOREIGN KEY (`idVIVERO`)
    REFERENCES `viveros`.`ZONA` (`idZONA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `viveros`.`PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viveros`.`PRODUCTO` (
  `idPRODUCTO` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `caracteristicas_especiales` VARCHAR(45) NULL,
  PRIMARY KEY (`idPRODUCTO`));


-- -----------------------------------------------------
-- Table `viveros`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viveros`.`EMPLEADO` (
  `idEMPLEADO` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`idEMPLEADO`));


-- -----------------------------------------------------
-- Table `viveros`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viveros`.`CLIENTE` (
  `idCLIENTE` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`idCLIENTE`));


-- -----------------------------------------------------
-- Table `viveros`.`PRODUCTOAZONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viveros`.`PRODUCTOAZONA` (
  `idPRODUCTOAZONA` INT NOT NULL AUTO_INCREMENT,
  `PRODUCTOAZONAcol` VARCHAR(45) NULL,
  `cantidad_disponible` VARCHAR(45) NULL,
  PRIMARY KEY (`idPRODUCTOAZONA`),
  CONSTRAINT `ProductoID`
    FOREIGN KEY ()
    REFERENCES `viveros`.`PRODUCTO` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ZonaID`
    FOREIGN KEY ()
    REFERENCES `viveros`.`ZONA` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT ``
    FOREIGN KEY ()
    REFERENCES `viveros`.`EMPLEADO` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `viveros`.`HISTORICOEMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viveros`.`HISTORICOEMPLEADO` (
  `idHISTORICOEMPLEADO` INT NOT NULL,
  `empleadoID` INT NULL,
  `viveroID` INT NULL,
  `fechainicio` DATE NULL,
  `fechafin` DATE NULL,
  `zonaID` INT NULL,
  PRIMARY KEY (`idHISTORICOEMPLEADO`),
  INDEX `empleadofk_idx` (`empleadoID` ASC) VISIBLE,
  INDEX `viverofk_idx` (`viveroID` ASC) VISIBLE,
  INDEX `zonafk_idx` (`zonaID` ASC) VISIBLE,
  CONSTRAINT `empleadofk`
    FOREIGN KEY (`empleadoID`)
    REFERENCES `viveros`.`CLIENTE` (`idCLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `viverofk`
    FOREIGN KEY (`viveroID`)
    REFERENCES `viveros`.`VIVERO` (`idVIVERO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `zonafk`
    FOREIGN KEY (`zonaID`)
    REFERENCES `viveros`.`ZONA` (`idZONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `viveros`.`PEDIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viveros`.`PEDIDO` (
  `idPEDIDO` INT NOT NULL AUTO_INCREMENT,
  `clienteid` INT NULL,
  `empleadoID` INT NULL,
  `fechapedido` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`idPEDIDO`),
  INDEX `fk_PEDIDO_1_idx` (`clienteid` ASC) VISIBLE,
  CONSTRAINT `fk_PEDIDO_1`
    FOREIGN KEY (`clienteid`)
    REFERENCES `viveros`.`CLIENTE` (`idCLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEDIDO_2`
    FOREIGN KEY ()
    REFERENCES `viveros`.`EMPLEADO` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Data for table `viveros`.`VIVERO`
-- -----------------------------------------------------
START TRANSACTION;
USE `viveros`;
INSERT INTO `viveros`.`VIVERO` (`idVIVERO`, `Nombre`) VALUES (, 'vivero1');

COMMIT;

