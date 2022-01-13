-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema secao03
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema secao03
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `secao03` DEFAULT CHARACTER SET utf8 ;
USE `secao03` ;

-- -----------------------------------------------------
-- Table `secao03`.`tipos_de_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `secao03`.`tipos_de_produto` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `secao03`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `secao03`.`produtos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  `preco` DECIMAL NOT NULL,
  `codigo_tipo` INT NOT NULL,
  `codigo1` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_produtos_tipos_de_produto_idx` (`codigo1` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_tipos_de_produto`
    FOREIGN KEY (`codigo1`)
    REFERENCES `secao03`.`tipos_de_produto` (`codigo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `secao03`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `secao03`.`pacientes` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `data_de_nascimento` DATE NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `secao03`.`professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `secao03`.`professores` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `telefone` INT(10) NOT NULL,
  `nome` CHAR(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `secao03`.`turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `secao03`.`turmas` (
  `codigo` INT NOT NULL,
  `capacidade` INT NOT NULL,
  `codigo_professor` VARCHAR(100) NOT NULL,
  `codigo1` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_turmas_professores1_idx` (`codigo1` ASC) VISIBLE,
  CONSTRAINT `fk_turmas_professores1`
    FOREIGN KEY (`codigo1`)
    REFERENCES `secao03`.`professores` (`codigo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
