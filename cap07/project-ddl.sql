-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8 ;
USE `project` ;

-- -----------------------------------------------------
-- Table `project`.`tipos_de_produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project`.`tipos_de_produtos` ;

CREATE TABLE IF NOT EXISTS `project`.`tipos_de_produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`fabricantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project`.`fabricantes` ;

CREATE TABLE IF NOT EXISTS `project`.`fabricantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project`.`produtos` ;

CREATE TABLE IF NOT EXISTS `project`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `designacao` VARCHAR(50) NOT NULL,
  `composicao` VARCHAR(50) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `id_tipo_de_produto` INT NOT NULL,
  `id_fabricante` INT NOT NULL,
  PRIMARY KEY (`id`, `id_tipo_de_produto`, `id_fabricante`),
  INDEX `fk_produto_tipos_de_produto1_idx` (`id_tipo_de_produto` ASC),
  INDEX `fk_produto_fabricante1_idx` (`id_fabricante` ASC),
  CONSTRAINT `fk_produto_tipos_de_produto1`
    FOREIGN KEY (`id_tipo_de_produto`)
    REFERENCES `project`.`tipos_de_produtos` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_fabricante1`
    FOREIGN KEY (`id_fabricante`)
    REFERENCES `project`.`fabricantes` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project`.`clientes` ;

CREATE TABLE IF NOT EXISTS `project`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `codigo_postal` VARCHAR(10) NOT NULL,
  `localidade` VARCHAR(50) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`registros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project`.`registros` ;

CREATE TABLE IF NOT EXISTS `project`.`registros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`, `id_cliente`),
  INDEX `fk_registro_cliente_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_registro_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `project`.`clientes` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`registro_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project`.`registro_produto` ;

CREATE TABLE IF NOT EXISTS `project`.`registro_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `id_registro` INT NOT NULL,
  `id_produto` INT NOT NULL,
  PRIMARY KEY (`id`, `id_registro`, `id_produto`),
  INDEX `fk_registro_produto_produto1_idx` (`id_produto` ASC),
  INDEX `fk_registro_produto_registro1_idx` (`id_registro` ASC),
  CONSTRAINT `fk_registro_produto_registro1`
    FOREIGN KEY (`id_registro`)
    REFERENCES `project`.`registros` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_registro_produto_produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `project`.`produtos` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`medicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project`.`medicos` ;

CREATE TABLE IF NOT EXISTS `project`.`medicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `crm` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`.`receitas_medicas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project`.`receitas_medicas` ;

CREATE TABLE IF NOT EXISTS `project`.`receitas_medicas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  `id_medicos` INT NOT NULL,
  `id_registro_produto` INT NOT NULL,
  PRIMARY KEY (`id`, `id_medicos`, `id_registro_produto`),
  INDEX `fk_receitas_medicas_medicos1_idx` (`id_medicos` ASC),
  INDEX `fk_receitas_medicas_registro_produto1_idx` (`id_registro_produto` ASC),
  CONSTRAINT `fk_receitas_medicas_medicos1`
    FOREIGN KEY (`id_medicos`)
    REFERENCES `project`.`medicos` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_receitas_medicas_registro_produto1`
    FOREIGN KEY (`id_registro_produto`)
    REFERENCES `project`.`registro_produto` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
