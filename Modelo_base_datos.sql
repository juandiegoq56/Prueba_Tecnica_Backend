-- MySQL Script generated by MySQL Workbench
-- Sun Jan 28 16:54:43 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Modelo_base_datos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Modelo_base_datos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Modelo_base_datos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Modelo_base_datos` ;

-- -----------------------------------------------------
-- Table `Modelo_base_datos`.`Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modelo_base_datos`.`Autores` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `biografia` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Modelo_base_datos`.`Colaboradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modelo_base_datos`.`Colaboradores` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Modelo_base_datos`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modelo_base_datos`.`Usuarios` (
  `id` INT NOT NULL,
  `nombre_usuario` VARCHAR(255) NULL DEFAULT NULL,
  `correo_electronico` VARCHAR(255) NULL DEFAULT NULL,
  `contrasena` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Modelo_base_datos`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modelo_base_datos`.`Videos` (
  `id` INT NOT NULL,
  `autor_id` INT NULL DEFAULT NULL,
  `colaborador_id` INT NULL DEFAULT NULL,
  `titulo` VARCHAR(255) NULL DEFAULT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `fecha_subida` DATE NULL DEFAULT NULL,
  `duracion` INT NULL DEFAULT NULL,
  `colaborador_vistas_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `autor_id` (`autor_id` ASC) VISIBLE,
  INDEX `colaborador_id` (`colaborador_id` ASC) VISIBLE,
  INDEX `colaborador_vistas_id` (`colaborador_vistas_id` ASC) VISIBLE,
  CONSTRAINT `Videos_ibfk_1`
    FOREIGN KEY (`autor_id`)
    REFERENCES `Modelo_base_datos`.`Autores` (`id`),
  CONSTRAINT `Videos_ibfk_2`
    FOREIGN KEY (`colaborador_id`)
    REFERENCES `Modelo_base_datos`.`Colaboradores` (`id`),
  CONSTRAINT `Videos_ibfk_3`
    FOREIGN KEY (`colaborador_vistas_id`)
    REFERENCES `Modelo_base_datos`.`Colaboradores` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Modelo_base_datos`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modelo_base_datos`.`Comentarios` (
  `id` INT NOT NULL,
  `usuario_id` INT NULL DEFAULT NULL,
  `video_id` INT NULL DEFAULT NULL,
  `texto` TEXT NULL DEFAULT NULL,
  `fecha_comentario` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `usuario_id` (`usuario_id` ASC) VISIBLE,
  INDEX `video_id` (`video_id` ASC) VISIBLE,
  CONSTRAINT `Comentarios_ibfk_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `Modelo_base_datos`.`Usuarios` (`id`),
  CONSTRAINT `Comentarios_ibfk_2`
    FOREIGN KEY (`video_id`)
    REFERENCES `Modelo_base_datos`.`Videos` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Modelo_base_datos`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modelo_base_datos`.`Reviews` (
  `id` INT NOT NULL,
  `usuario_id` INT NULL DEFAULT NULL,
  `video_id` INT NULL DEFAULT NULL,
  `calificacion` INT NULL DEFAULT NULL,
  `comentario` TEXT NULL DEFAULT NULL,
  `fecha_review` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `usuario_id` (`usuario_id` ASC) VISIBLE,
  INDEX `video_id` (`video_id` ASC) VISIBLE,
  CONSTRAINT `Reviews_ibfk_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `Modelo_base_datos`.`Usuarios` (`id`),
  CONSTRAINT `Reviews_ibfk_3`
    FOREIGN KEY (`video_id`)
    REFERENCES `Modelo_base_datos`.`Videos` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;