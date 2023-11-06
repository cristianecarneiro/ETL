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
-- Schema rsalbums
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`artists` (
  `sp_artistid` VARCHAR(45) NOT NULL,
  `sp_artistname` VARCHAR(45) NULL,
  `sp_followers` INT NULL,
  `sp_popularity` INT NULL,
  PRIMARY KEY (`sp_artistid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`albums` (
  `sp_albumid` VARCHAR(45) NOT NULL,
  `sp_albumname` VARCHAR(45) NULL,
  `sp_releasedate` DATETIME NULL,
  `sp_totaltracks` INT NULL,
  `artists_sp_artistid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sp_albumid`, `artists_sp_artistid`),
  INDEX `fk_albums_artists1_idx` (`artists_sp_artistid` ASC) VISIBLE,
  CONSTRAINT `fk_albums_artists1`
    FOREIGN KEY (`artists_sp_artistid`)
    REFERENCES `mydb`.`artists` (`sp_artistid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tracks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tracks` (
  `sp_trackid` VARCHAR(45) NOT NULL,
  `sp_trackname` VARCHAR(45) NULL,
  `albums_sp_albumid` VARCHAR(45) NOT NULL,
  `albums_artists_sp_artistid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sp_trackid`, `albums_sp_albumid`, `albums_artists_sp_artistid`),
  INDEX `fk_tracks_albums1_idx` (`albums_sp_albumid` ASC, `albums_artists_sp_artistid` ASC) VISIBLE,
  CONSTRAINT `fk_tracks_albums1`
    FOREIGN KEY (`albums_sp_albumid`)
    REFERENCES `mydb`.`albums` (`sp_albumid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`500best`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`500best` (
  `sp_albumid` VARCHAR(45) NOT NULL,
  `rs_toprankingorder` INT NULL,
  `rs_albumname` VARCHAR(45) NULL,
  `rs_artist` VARCHAR(45) NULL,
  `rs_year` DATETIME NULL,
  `albums_sp_albumid` VARCHAR(45) NOT NULL,
  `albums_artists_sp_artistid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sp_albumid`, `albums_sp_albumid`, `albums_artists_sp_artistid`),
  INDEX `fk_500best_albums1_idx` (`albums_sp_albumid` ASC) VISIBLE,
  CONSTRAINT `fk_500best_albums1`
    FOREIGN KEY (`albums_sp_albumid`)
    REFERENCES `mydb`.`albums` (`sp_albumid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`50horrible`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`50horrible` (
  `sp_albumid` VARCHAR(45) NOT NULL,
  `rs_horriblerankingorder` INT NULL,
  `rs_albumname` VARCHAR(45) NULL,
  `rs_artist` VARCHAR(45) NULL,
  `rs_year` DATETIME NULL,
  `albums_sp_albumid` VARCHAR(45) NOT NULL,
  `albums_artists_sp_artistid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sp_albumid`, `albums_sp_albumid`, `albums_artists_sp_artistid`),
  INDEX `fk_50horrible_albums1_idx` (`albums_sp_albumid` ASC, `albums_artists_sp_artistid` ASC) VISIBLE,
  CONSTRAINT `fk_50horrible_albums1`
    FOREIGN KEY (`albums_sp_albumid`)
    REFERENCES `mydb`.`albums` (`sp_albumid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
