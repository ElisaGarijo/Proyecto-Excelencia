-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;



-- -----------------------------------------------------
-- Table `mydb`.`niveles_dificultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`niveles_dificultad` (
  `id_niveles_dificultad` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_niveles_dificultad`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`niveles_interes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`niveles_interes` (
  `id_niveles_interes` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_niveles_interes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id_usuario` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos` VARCHAR(100) NULL DEFAULT NULL,
  `nombre_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `cryp` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_actividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_actividad` (
  `id_tipo_actividad` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_actividad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`asignatura` (
  `id_asignatura` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `profesor` VARCHAR(145) NULL DEFAULT NULL,
  `curso` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_asignatura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actividad` (
  `id_actividad` INT NOT NULL,
  `horas_en_bruto` DOUBLE NULL DEFAULT NULL,
  `horas_diarias` DOUBLE NULL DEFAULT NULL,
  `horas_dia_anterior` DOUBLE NULL DEFAULT NULL,
  `dias_estudio` DOUBLE NULL DEFAULT NULL,
  `k` DOUBLE NULL DEFAULT NULL,
  `tema` INT NOT NULL,
  `tipo_actividad` INT NOT NULL,
  `asignatura` INT NOT NULL,
  PRIMARY KEY (`id_actividad`),
  INDEX `fk_actividad_tipo_actividad1_idx` (`tipo_actividad` ASC),
  INDEX `fk_actividad_asignatura1_idx` (`asignatura` ASC),
  CONSTRAINT `fk_actividad_tipo_actividad1`
    FOREIGN KEY (`tipo_actividad`)
    REFERENCES `mydb`.`tipo_actividad` (`id_tipo_actividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actividad_asignatura1`
    FOREIGN KEY (`asignatura`)
    REFERENCES `mydb`.`asignatura` (`id_asignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `mydb`.`interes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`interes` (
  `id_interes` INT NOT NULL,
  `nivel_interes` INT NOT NULL,
  PRIMARY KEY (`id_interes`),
  INDEX `fk_interes_niveles_interes1_idx` (`nivel_interes` ASC),
  CONSTRAINT `fk_interes_niveles_interes1`
    FOREIGN KEY (`nivel_interes`)
    REFERENCES `mydb`.`niveles_interes` (`id_niveles_interes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`dificultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dificultad` (
  `id_dificultad` INT NOT NULL,
  `nivel_dificultad` INT NOT NULL,
  PRIMARY KEY (`id_dificultad`),
  INDEX `fk_dificultad_niveles_dificultad1_idx` (`nivel_dificultad` ASC),
  CONSTRAINT `fk_dificultad_niveles_dificultad1`
    FOREIGN KEY (`nivel_dificultad`)
    REFERENCES `mydb`.`niveles_dificultad` (`id_niveles_dificultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`valoracion_objetiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`valoracion_objetiva` (
  `id_valoracion_objetiva` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_valoracion_objetiva`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`valoracion_subjetiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`valoracion_subjetiva` (
  `id_valoracion_subjetiva` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_valoracion_subjetiva`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`semana_especial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`semana_especial` (
  `id_semana_especial` INT NOT NULL,
  `fecha_ini` DATE NULL DEFAULT NULL,
  `fecha_fin` DATE NULL DEFAULT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id_semana_especial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instancia_actividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`instancia_actividad` (
  `id_instancia_actividad` INT NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `tiempo_horas` DOUBLE NULL DEFAULT NULL,
  `horas_en_bruto` DOUBLE NULL DEFAULT NULL,
  `dias_de_estudio` DOUBLE NULL DEFAULT NULL,
  `horas_diarias` DOUBLE NULL DEFAULT NULL,
  `horas_dia_anterior` DOUBLE NULL DEFAULT NULL,
  `semana_especial` TINYINT(1) NULL DEFAULT NULL,
  `valoracion_completa` TINYINT(1) NULL DEFAULT NULL,
  `k` DOUBLE NULL DEFAULT NULL,
  `actividad` INT NOT NULL,
  `valoracion_subjetiva` INT NOT NULL,
  `valoracion_objetiva` INT NOT NULL,
  `usuario` INT NOT NULL,
  `dificultad` INT NOT NULL,
  `interes` INT NOT NULL,
  PRIMARY KEY (`id_instancia_actividad`),
  INDEX `fk_instancia_actividad_actividad1_idx` (`actividad` ASC),
  INDEX `fk_instancia_actividad_valoracion_subjetiva1_idx` (`valoracion_subjetiva` ASC),
  INDEX `fk_instancia_actividad_valoracion�������G$_objetiva1_idx` (`valoracion_objetiva` ASC),
  INDEX `fk_instancia_actividad_usuario1_idx` (`usuario` ASC),
  INDEX `fk_instancia_actividad_dificultad1_idx` (`dificultad` ASC),
  INDEX `fk_instancia_actividad_interes1_idx` (`interes` ASC),
  CONSTRAINT `fk_instancia_actividad_actividad1`
    FOREIGN KEY (`actividad`)
    REFERENCES `mydb`.`actividad` (`id_actividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instancia_actividad_valoracion_subjetiva1`
    FOREIGN KEY (`valoracion_subjetiva`)
    REFERENCES `mydb`.`valoracion_subjetiva` (`id_valoracion_subjetiva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instancia_actividad_valoracion_objetiva1`
    FOREIGN KEY (`valoracion_objetiva`)
    REFERENCES `mydb`.`valoracion_objetiva` (`id_valoracion_objetiva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instancia_actividad_usuario1`
    FOREIGN KEY (`usuario`)
    REFERENCES `mydb`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instancia_actividad_dificultad1`
    FOREIGN KEY (`dificultad`)
    REFERENCES `mydb`.`dificultad` (`id_dificultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instancia_actividad_interes1`
    FOREIGN KEY (`interes`)
    REFERENCES `mydb`.`interes` (`id_interes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;