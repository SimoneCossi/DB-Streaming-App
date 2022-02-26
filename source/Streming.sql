-- -----------------------------------------------------
-- Schema databasestreaming
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `databasestreaming` DEFAULT CHARACTER SET utf8mb4 ;
USE `databasestreaming` ;

-- -----------------------------------------------------
-- Table `databasestreaming`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `Cognome` VARCHAR(45) NULL,
  `Nascita` DATE NULL,
  `Email` VARCHAR(45) NULL,
  `CF` VARCHAR(45) NULL,
  `User` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`tipologiaAbbonamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`tipologiaabbonamento` (
  `idtipologiaabbonamento` INT NOT NULL AUTO_INCREMENT,
  `pianoabbonamento` VARCHAR(45) NULL,
  `dispositivi` INT NULL,
  `risoluzione` VARCHAR(45) NULL,
  `prezzo` INT NULL,
  PRIMARY KEY (`idtipologiaabbonamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`abbonamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`abbonamento` (
  `idabbonamento` INT NOT NULL AUTO_INCREMENT,
  `dataattivazione` DATE NULL,
  `datatermine` DATE NULL,
  `sport` ENUM("Si", "No") NULL,
  `cliente_idcliente` INT NOT NULL,
  `Prezzo_finale` INT NULL,
  `tipoabbonamento` INT NOT NULL,
  PRIMARY KEY (`idabbonamento`, `cliente_idcliente`, `tipoabbonamento`),
  INDEX `fk_abbonamento_cliente` (`cliente_idcliente` ASC) ,
  INDEX `fk_abbonamento_tipo` (`tipoabbonamento` ASC) ,
  CONSTRAINT `fk_abbonamento_cliente`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `databasestreaming`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_abb_tipoabb`
    FOREIGN KEY (`tipoabbonamento`)
    REFERENCES `databasestreaming`.`tipologiaabbonamento` (`idtipologiaabbonamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`generefilm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`generefilm` (
  `idgenerefilm` INT NOT NULL,
  `tipocontenuto` VARCHAR(45) NULL,
  PRIMARY KEY (`idgenerefilm`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`tipologiaspettacolo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`tipologiaspettacolo` (
  `idtipologiaspettacolo` INT NOT NULL AUTO_INCREMENT,
  `tipospettacolo` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipologiaspettacolo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`filmdocumentari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`filmdocumentari` (
  `idfilmdocumentari` INT NOT NULL,
  `titolo` VARCHAR(45) NULL,
  `descrizione` VARCHAR(250) NULL,
  `annouscita` VARCHAR(45) NULL,
  `durata` VARCHAR(45) NULL,
  `datainserimento` DATE NULL,
  `permanenzagiorni` INT NULL,
  `idtipologiaspettacolo` INT NOT NULL,
  PRIMARY KEY (`idfilmdocumentari`, `idtipologiaspettacolo`),
  INDEX `fk_filmdocumentari_tipologiaspettacolo1_idx` (`idtipologiaspettacolo` ASC) ,
  CONSTRAINT `fk_filmdocumentari_tipologiaspettacolo1`
    FOREIGN KEY (`idtipologiaspettacolo`)
    REFERENCES `databasestreaming`.`tipologiaspettacolo` (`idtipologiaspettacolo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`attori`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`attori` (
  `idattori` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cognome` VARCHAR(45) NULL,
  `nascita` DATE NULL,
  PRIMARY KEY (`idattori`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`registi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`registi` (
  `idregisti` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cognome` VARCHAR(45) NULL,
  `nascita` DATE NULL,
  PRIMARY KEY (`idregisti`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`lingue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`lingue` (
  `idlingue` INT NOT NULL AUTO_INCREMENT,
  `tipolingua` VARCHAR(45) NULL,
  PRIMARY KEY (`idlingue`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`sottotitoli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`sottotitoli` (
  `idsottotitoli` INT NOT NULL AUTO_INCREMENT,
  `tiposottotitoli` VARCHAR(45) NULL,
  PRIMARY KEY (`idsottotitoli`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`Eventi sportivi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`eventisportivi` (
  `id_eventisportivi` INT NOT NULL AUTO_INCREMENT,
  `titolo` VARCHAR(45) NULL,
  `descrizione` VARCHAR(45) NULL,
  `prezzo` INT NULL,
  `idtipologiaspettacolo` INT NOT NULL,
  PRIMARY KEY (`id_eventisportivi`, `idtipologiaspettacolo`),
  INDEX `fk_eventi sportivi_tipologiaspettacolo1_idx` (`idtipologiaspettacolo` ASC) ,
  CONSTRAINT `fk_eventi sportivi_tipologiaspettacolo1`
    FOREIGN KEY (`idtipologiaspettacolo`)
    REFERENCES `databasestreaming`.`tipologiaspettacolo` (`idtipologiaspettacolo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`registi_has_filmdocumentari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`registi_has_filmdocumentari` (
  `registi_idregisti` INT NOT NULL,
  `filmdocumentari_idfilmdocumentari` INT NOT NULL,
  PRIMARY KEY (`registi_idregisti`, `filmdocumentari_idfilmdocumentari`),
  INDEX `fk_registi_has_filmdocumentari_filmdocumentari1_idx` (`filmdocumentari_idfilmdocumentari` ASC) ,
  INDEX `fk_registi_has_filmdocumentari_registi1_idx` (`registi_idregisti` ASC) ,
  CONSTRAINT `fk_registi_has_filmdocumentari_registi1`
    FOREIGN KEY (`registi_idregisti`)
    REFERENCES `databasestreaming`.`registi` (`idregisti`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registi_has_filmdocumentari_filmdocumentari1`
    FOREIGN KEY (`filmdocumentari_idfilmdocumentari`)
    REFERENCES `databasestreaming`.`filmdocumentari` (`idfilmdocumentari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`attori_has_filmdocumentari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`attori_has_filmdocumentari` (
  `attori_idattori` INT NOT NULL,
  `filmdocumentari_idfilmdocumentari` INT NOT NULL,
  `protagonista` TINYINT NULL,
  PRIMARY KEY (`attori_idattori`, `filmdocumentari_idfilmdocumentari`),
  INDEX `fk_attori_has_filmdocumentari_filmdocumentari1_idx` (`filmdocumentari_idfilmdocumentari` ASC) ,
  INDEX `fk_attori_has_filmdocumentari_attori1_idx` (`attori_idattori` ASC) ,
  CONSTRAINT `fk_attori_has_filmdocumentari_attori1`
    FOREIGN KEY (`attori_idattori`)
    REFERENCES `databasestreaming`.`attori` (`idattori`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_attori_has_filmdocumentari_filmdocumentari1`
    FOREIGN KEY (`filmdocumentari_idfilmdocumentari`)
    REFERENCES `databasestreaming`.`filmdocumentari` (`idfilmdocumentari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`lingue_has_filmdocumentari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`lingue_has_filmdocumentari` (
  `lingue_idlingue` INT NOT NULL,
  `filmdocumentari_idfilmdocumentari` INT NOT NULL,
  PRIMARY KEY (`lingue_idlingue`, `filmdocumentari_idfilmdocumentari`),
  INDEX `fk_lingue_has_filmdocumentari_filmdocumentari1_idx` (`filmdocumentari_idfilmdocumentari` ASC) ,
  INDEX `fk_lingue_has_filmdocumentari_lingue1_idx` (`lingue_idlingue` ASC) ,
  CONSTRAINT `fk_lingue_has_filmdocumentari_lingue1`
    FOREIGN KEY (`lingue_idlingue`)
    REFERENCES `databasestreaming`.`lingue` (`idlingue`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lingue_has_filmdocumentari_filmdocumentari1`
    FOREIGN KEY (`filmdocumentari_idfilmdocumentari`)
    REFERENCES `databasestreaming`.`filmdocumentari` (`idfilmdocumentari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`sottotitoli_has_filmdocumentari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`sottotitoli_has_filmdocumentari` (
  `sottotitoli_idsottotitoli` INT NOT NULL,
  `filmdocumentari_idfilmdocumentari` INT NOT NULL,
  PRIMARY KEY (`sottotitoli_idsottotitoli`, `filmdocumentari_idfilmdocumentari`),
  INDEX `fk_sottotitoli_has_filmdocumentari_filmdocumentari1_idx` (`filmdocumentari_idfilmdocumentari` ASC) ,
  INDEX `fk_sottotitoli_has_filmdocumentari_sottotitoli1_idx` (`sottotitoli_idsottotitoli` ASC) ,
  CONSTRAINT `fk_sottotitoli_has_filmdocumentari_sottotitoli1`
    FOREIGN KEY (`sottotitoli_idsottotitoli`)
    REFERENCES `databasestreaming`.`sottotitoli` (`idsottotitoli`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sottotitoli_has_filmdocumentari_filmdocumentari1`
    FOREIGN KEY (`filmdocumentari_idfilmdocumentari`)
    REFERENCES `databasestreaming`.`filmdocumentari` (`idfilmdocumentari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `databasestreaming`.`generefilm_has_filmdocumentari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databasestreaming`.`generefilm_has_filmdocumentari` (
  `generefilm_idgenerefilm` INT NOT NULL,
  `filmdocumentari_idfilmdocumentari` INT NOT NULL,
  PRIMARY KEY (`generefilm_idgenerefilm`, `filmdocumentari_idfilmdocumentari`),
  INDEX `fk_generefilm_has_filmdocumentari_filmdocumentari1_idx` (`filmdocumentari_idfilmdocumentari` ASC) ,
  INDEX `fk_generefilm_has_filmdocumentari_generefilm1_idx` (`generefilm_idgenerefilm` ASC) ,
  CONSTRAINT `fk_generefilm_has_filmdocumentari_generefilm1`
    FOREIGN KEY (`generefilm_idgenerefilm`)
    REFERENCES `databasestreaming`.`generefilm` (`idgenerefilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_generefilm_has_filmdocumentari_filmdocumentari1`
    FOREIGN KEY (`filmdocumentari_idfilmdocumentari`)
    REFERENCES `databasestreaming`.`filmdocumentari` (`idfilmdocumentari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `databasestreaming`;

DELIMITER $$
USE `databasestreaming` $$
CREATE DEFINER = CURRENT_USER TRIGGER `databasestreaming`.`prezzofinale_trigger` BEFORE UPDATE ON `abbonamento` FOR EACH ROW
BEGIN
	SET new.Prezzo_finale = (SELECT Prezzo from tipologiaabbonamento where idtipologiaabbonamento = tipoabbonamento) + 5 ;
END $$

DELIMITER ;

INSERT INTO `cliente` (`idcliente`, `Nome`, `Cognome`, `Nascita`, `Email`, `CF`, `User`, `Password`) VALUES ('1', 'pino', 'gino', '1999-10-03', '123456789', 'CFRCFRCFRCFR', 'admin', 'admin');
INSERT INTO `cliente` (`idcliente`, `Nome`, `Cognome`, `Nascita`, `Email`, `CF`, `User`, `Password`) VALUES ('2', 'marco', 'dino', '2018-10-02', '123456789', 'CFRCFRCFRCFR', 'admin', 'admin');
INSERT INTO `cliente` (`idcliente`, `Nome`, `Cognome`, `Nascita`, `Email`, `CF`, `User`, `Password`) VALUES ('3', 'stefano', 'cino', '2002-06-12', '123456789', 'CFRCFRCFRCFR', 'admin', 'admin');
INSERT INTO `cliente` (`idcliente`, `Nome`, `Cognome`, `Nascita`, `Email`, `CF`, `User`, `Password`) VALUES ('4', 'giorgia', 'cano', '1995-12-01', '123456789', 'CFRCFRCFRCFR', 'admin', 'admin');
INSERT INTO `cliente` (`idcliente`, `Nome`, `Cognome`, `Nascita`, `Email`, `CF`, `User`, `Password`) VALUES ('5', 'katia', 'cono', '1986-1-12', '123456789', 'CFRCFRCFRCFR', 'admin', 'admin');

INSERT INTO `attori` (`idattori`, `nome`, `cognome`, `nascita`) VALUES ('1', 'gino', 'cameroon', '2018-10-02');
INSERT INTO `attori` (`idattori`, `nome`, `cognome`, `nascita`) VALUES ('2', 'xaon', 'franto', '2018-05-02');
INSERT INTO `attori` (`idattori`, `nome`, `cognome`, `nascita`) VALUES ('3', 'neil', 'armstrong', '1969-07-20');
INSERT INTO `attori` (`idattori`, `nome`, `cognome`, `nascita`) VALUES ('4', 'penelope', 'cruz', '1974-04-28');

INSERT INTO `tipologiaabbonamento` (`idtipologiaabbonamento`, `pianoabbonamento`, `dispositivi`, `risoluzione`, `prezzo`) VALUES ('1', 'Base', '2', 'HD', '7');
INSERT INTO `tipologiaabbonamento` (`idtipologiaabbonamento`, `pianoabbonamento`, `dispositivi`, `risoluzione`, `prezzo`) VALUES ('2', 'Intermedio', '3', 'FullHD', '10');
INSERT INTO `tipologiaabbonamento` (`idtipologiaabbonamento`, `pianoabbonamento`, `dispositivi`, `risoluzione`, `prezzo`) VALUES ('3', 'Premium', '5', '4K', '15');

INSERT INTO `tipologiaspettacolo` (`idtipologiaspettacolo`, `tipospettacolo`) VALUES ('1', 'Film'), ('2', 'Documentari'), ('3', 'Sport') ;

INSERT INTO `eventisportivi` (`id_eventisportivi`, `titolo`, `descrizione`, `prezzo`, `idtipologiaspettacolo`) VALUES ('1', 'Milan Inter', 'Partita calcio serie A', '0', '3');
INSERT INTO `eventisportivi` (`id_eventisportivi`, `titolo`, `descrizione`, `prezzo`, `idtipologiaspettacolo`) VALUES ('2', 'Palermo Inter', 'Partita calcio serie A', '0', '3');
INSERT INTO `eventisportivi` (`id_eventisportivi`, `titolo`, `descrizione`, `prezzo`, `idtipologiaspettacolo`) VALUES ('3', 'Napoli Juventus', 'Partita calcio serie A', '0', '3');
INSERT INTO `eventisportivi` (`id_eventisportivi`, `titolo`, `descrizione`, `prezzo`, `idtipologiaspettacolo`) VALUES ('4', 'Milan Parma', 'Partita calcio serie A', '5', '3');
INSERT INTO `eventisportivi` (`id_eventisportivi`, `titolo`, `descrizione`, `prezzo`, `idtipologiaspettacolo`) VALUES ('5', 'Udinese Sassuolo', 'Partita calcio serie A', '5', '3');

INSERT INTO `filmdocumentari` (`idfilmdocumentari`, `idtipologiaspettacolo`, `titolo`, `descrizione`, `annouscita`, `durata`, `datainserimento`, `permanenzagiorni`) VALUES ('1', '1', 'avatar', 'una nuova specie in un nuovo pianeta: Avatar', '2015', '90 min', '2021-02-01', '30');
INSERT INTO `filmdocumentari` (`idfilmdocumentari`, `idtipologiaspettacolo`, `titolo`, `descrizione`, `annouscita`, `durata`, `datainserimento`, `permanenzagiorni`) VALUES ('2', '1', 'The Mule', 'corriere droga', '2019', '90 min', '2020-02-01', '365');
INSERT INTO `filmdocumentari` (`idfilmdocumentari`, `idtipologiaspettacolo`, `titolo`, `descrizione`, `annouscita`, `durata`, `datainserimento`, `permanenzagiorni`) VALUES ('3', '2', 'Green Book', ' amicizia e lavoro, razzismo', '2019', '90 min', '2021-08-01', '90');
INSERT INTO `filmdocumentari` (`idfilmdocumentari`, `idtipologiaspettacolo`, `titolo`, `descrizione`, `annouscita`, `durata`, `datainserimento`, `permanenzagiorni`) VALUES ('4', '2', 'La marcia dei pinguini', 'Il documentario francese che ha commosso tutto il mondo parla della lotta.', '2005', '90 min', '2021-06-25', '730');
INSERT INTO `filmdocumentari` (`idfilmdocumentari`, `idtipologiaspettacolo`, `titolo`, `descrizione`, `annouscita`, `durata`, `datainserimento`, `permanenzagiorni`) VALUES ('5', '2', 'Inside Job', 'Un documentario sull’Islanda, Paese dei Balocchi fino a qualche tempo fa ', '2010', '90 min', '2019-01-10', '30');
INSERT INTO `filmdocumentari` (`idfilmdocumentari`, `idtipologiaspettacolo`, `titolo`, `descrizione`, `annouscita`, `durata`, `datainserimento`, `permanenzagiorni`) VALUES ('6', '2', 'Amy', 'Uno sguardo commuovente e privatissimo su quella vita sregolata finita nella tragedia che ha caratterizzato Amy Winehouse', '2015', '90 min', '2015-01-01', '5');


INSERT INTO `generefilm` (`idgenerefilm`, `tipocontenuto`) VALUES ('1', 'Horror'),('2','Commedia'),('3','Azione'),('4','Sentimentale');

INSERT INTO `lingue` (`idlingue`, `tipolingua`) VALUES (NULL, 'italiano'), (NULL, 'inglese'),(NULL, 'tedesco'), (NULL,'spagnolo');

INSERT INTO `registi` (`idregisti`, `nome`, `cognome`, `nascita`) VALUES (NULL, 'Martin', 'Scorsese', '1942-11-17'), (NULL, 'Quentin', 'Tarantino', '1963-03-27'),(NULL,'Woody','Allen','1935-12-01');

INSERT INTO `sottotitoli` (`idsottotitoli`, `tiposottotitoli`) VALUES (NULL, 'italiano'), (NULL, 'inglese'),(NULL,'tedesco'),(NULL,'spagnolo');

INSERT INTO `lingue_has_filmdocumentari` (`lingue_idlingue`, `filmdocumentari_idfilmdocumentari`) VALUES ('1', '1'),('2','1'),('1','2');

INSERT INTO `generefilm_has_filmdocumentari` (`generefilm_idgenerefilm`, `filmdocumentari_idfilmdocumentari`) VALUES ('4', '1'),('4','2');

INSERT INTO `registi_has_filmdocumentari` (`registi_idregisti`, `filmdocumentari_idfilmdocumentari`) VALUES ('1', '1'),('2','1');

INSERT INTO `sottotitoli_has_filmdocumentari` (`sottotitoli_idsottotitoli`, `filmdocumentari_idfilmdocumentari`) VALUES ('1', '1'), ('2', '1'),('1','2');

INSERT INTO `attori_has_filmdocumentari` (`attori_idattori`, `filmdocumentari_idfilmdocumentari`, `protagonista`) VALUES ('4', '2', '0');
INSERT INTO `attori_has_filmdocumentari` (`attori_idattori`, `filmdocumentari_idfilmdocumentari`, `protagonista`) VALUES ('1', '1', '1');
INSERT INTO `attori_has_filmdocumentari` (`attori_idattori`, `filmdocumentari_idfilmdocumentari`, `protagonista`) VALUES ('3', '3', '1');

INSERT INTO `abbonamento` (`idabbonamento`, `dataattivazione`, `datatermine`, `sport`, `cliente_idcliente`, `prezzo_finale`, `tipoabbonamento`) VALUES (NULL, '2019-02-01', '2019-02-28', 'Si', '1', '0', '1');
INSERT INTO `abbonamento` (`idabbonamento`, `dataattivazione`, `datatermine`, `sport`, `cliente_idcliente`, `prezzo_finale`, `tipoabbonamento`) VALUES ('2', '2019-02-01', '2019-02-28', 'No', '2', '0', '2');
INSERT INTO `abbonamento` (`idabbonamento`, `dataattivazione`, `datatermine`, `sport`, `cliente_idcliente`, `prezzo_finale`, `tipoabbonamento`) VALUES ('3', '2019-02-01', '2019-02-28', 'Si', '3', '0', '3');
INSERT INTO `abbonamento` (`idabbonamento`, `dataattivazione`, `datatermine`, `sport`, `cliente_idcliente`, `prezzo_finale`, `tipoabbonamento`) VALUES ('4', '2019-02-01', '2019-02-28', 'No', '4', '0', '2');
INSERT INTO `abbonamento` (`idabbonamento`, `dataattivazione`, `datatermine`, `sport`, `cliente_idcliente`, `prezzo_finale`, `tipoabbonamento`) VALUES ('5', '2019-02-01', '2019-02-28', 'Si', '5', '0', '3');
