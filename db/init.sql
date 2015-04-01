SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- Master

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `col1` INT NOT NULL,
  `col2` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Slave

CREATE SCHEMA IF NOT EXISTS `mydb_read` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb_read` ;

-- -----------------------------------------------------
-- Table `mydb`.`t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb_read`.`ts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `col1` INT NOT NULL,
  `col2` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
