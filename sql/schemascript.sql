-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema rsdb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema rsalbums
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rsalbums
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rsalbums` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`artists` (
  `sp_artistid` VARCHAR(45) NOT NULL,
  `sp_artistname` VARCHAR(45) NULL,
  `sp_followers` INT NULL,
  `sp_popularit` INT NULL,
  PRIMARY KEY (`sp_artistid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`artists` (
  `sp_artistid` VARCHAR(45) NOT NULL,
  `sp_artistname` VARCHAR(45) NULL,
  `sp_followers` INT NULL,
  `sp_popularit` INT NULL,
  PRIMARY KEY (`sp_artistid`))
ENGINE = InnoDB;

USE `rsalbums` ;

-- -----------------------------------------------------
-- Table `rsalbums`.`artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rsalbums`.`artists` (
  `sp_artistid` VARCHAR(45) NOT NULL,
  `sp_artistname` TEXT NULL DEFAULT NULL,
  `sp_followers` BIGINT NULL DEFAULT NULL,
  `sp_popularity` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`sp_artistid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rsalbums`.`albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rsalbums`.`albums` (
  `sp_albumid` VARCHAR(45) NOT NULL,
  `sp_albumname` TEXT NULL DEFAULT NULL,
  `sp_releasedate` TEXT NULL DEFAULT NULL,
  `sp_totaltracks` BIGINT NULL DEFAULT NULL,
  `artists_sp_artistid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sp_albumid`, `artists_sp_artistid`),
  INDEX `fk_artist` (`artists_sp_artistid` ASC) VISIBLE,
  CONSTRAINT `fk_artist`
    FOREIGN KEY (`artists_sp_artistid`)
    REFERENCES `rsalbums`.`artists` (`sp_artistid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rsalbums`.`rshorrible50`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rsalbums`.`rshorrible50` (
  `index` BIGINT NULL DEFAULT NULL,
  `sp_albumid` TEXT NULL DEFAULT NULL,
  `rs_horriblerankingorder` BIGINT NULL DEFAULT NULL,
  `rs_albumname` TEXT NULL DEFAULT NULL,
  `rs_artist` TEXT NULL DEFAULT NULL,
  `rs_year` DATETIME NULL DEFAULT NULL,
  `album_sp_albumid` VARCHAR(45) NOT NULL,
  INDEX `ix_rshorrible50_index` (`index` ASC) VISIBLE,
  PRIMARY KEY (`album_sp_albumid`),
  CONSTRAINT `fk_rshorrible50_albums1`
    FOREIGN KEY (`album_sp_albumid`)
    REFERENCES `rsalbums`.`albums` (`sp_albumid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rsalbums`.`rstop500`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rsalbums`.`rstop500` (
  `index` BIGINT NULL DEFAULT NULL,
  `sp_albumid` TEXT NULL DEFAULT NULL,
  `rs_toprankingorder` BIGINT NULL DEFAULT NULL,
  `rs_albumname` TEXT NULL DEFAULT NULL,
  `rs_artist` TEXT NULL DEFAULT NULL,
  `rs_year` DATETIME NULL DEFAULT NULL,
  `albums_sp_albumid` VARCHAR(45) NOT NULL,
  INDEX `ix_rstop500_index` (`index` ASC) VISIBLE,
  PRIMARY KEY (`albums_sp_albumid`),
  INDEX `fk_rstop500_albums1_idx` (`albums_sp_albumid` ASC) VISIBLE,
  CONSTRAINT `fk_rstop500_albums1`
    FOREIGN KEY (`albums_sp_albumid`)
    REFERENCES `rsalbums`.`albums` (`sp_albumid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rsalbums`.`tracks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rsalbums`.`tracks` (
  `sp_trackid` TEXT NULL DEFAULT NULL,
  `sp_trackname` TEXT NULL DEFAULT NULL,
  `albums_sp_albumid` VARCHAR(45) NOT NULL,
  INDEX `fk_album` (`albums_sp_albumid` ASC) VISIBLE,
  PRIMARY KEY (`albums_sp_albumid`),
  CONSTRAINT `fk_album`
    FOREIGN KEY (`albums_sp_albumid`)
    REFERENCES `rsalbums`.`albums` (`sp_albumid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
