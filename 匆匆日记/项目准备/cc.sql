-- MySQL Script generated by MySQL Workbench
-- Mon Mar 21 21:26:17 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ccDiary
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ccDiary
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ccDiary` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ccDiary` ;

-- -----------------------------------------------------
-- Table `ccDiary`.`t_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccDiary`.`t_user` (
  `user_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `user_name` VARCHAR(45) NOT NULL COMMENT '用户名，需要转码',
  `user_sex` TINYINT(1) NULL COMMENT '性别yes为男\n',
  `user_tel` INT NULL COMMENT '电话号码11位（待修改）		',
  `user_password` VARCHAR(45) NULL COMMENT '密文密码',
  `user_image` VARCHAR(45) NULL COMMENT '头像URL',
  PRIMARY KEY (`user_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ccDiary`.`t_accessory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccDiary`.`t_accessory` (
  `accessory_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `accessory_pic` VARCHAR(45) NULL COMMENT '',
  `accessory_avi` VARCHAR(45) NULL COMMENT '',
  `accessory_sound` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`accessory_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ccDiary`.`t_collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccDiary`.`t_collection` (
  `collection_id` INT NOT NULL COMMENT '',
  `t_user_user_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`collection_id`)  COMMENT '',
  INDEX `fk_t_collection_t_user1_idx` (`t_user_user_id` ASC)  COMMENT '',
  CONSTRAINT `fk_t_collection_t_user1`
    FOREIGN KEY (`t_user_user_id`)
    REFERENCES `ccDiary`.`t_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ccDiary`.`t_diary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccDiary`.`t_diary` (
  `diary_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `diary_title` VARCHAR(45) NULL COMMENT '需要做字数限制		',
  `diary_detail` VARCHAR(45) NULL COMMENT '正文字数上限',
  `diary_bgcolor` INT NULL COMMENT '数字表示对应的颜色',
  `diary_textcolor` INT NULL COMMENT '数字表示对应的颜色\n',
  `diary_textfont` INT NULL COMMENT '',
  `diary_time` VARCHAR(45) NULL COMMENT '',
  `diary_weather` INT NOT NULL COMMENT '数字代表本地天气',
  `diary_type` TINYINT(1) NOT NULL COMMENT 'yes为公开日记\n',
  `t_accessory_accessory_id` INT NOT NULL COMMENT '',
  `t_user_user_id` INT NOT NULL COMMENT '',
  `t_collection_collection_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`diary_id`)  COMMENT '',
  INDEX `fk_t_diary_t_accessory1_idx` (`t_accessory_accessory_id` ASC)  COMMENT '',
  INDEX `fk_t_diary_t_user1_idx` (`t_user_user_id` ASC)  COMMENT '',
  INDEX `fk_t_diary_t_collection1_idx` (`t_collection_collection_id` ASC)  COMMENT '',
  CONSTRAINT `fk_t_diary_t_accessory1`
    FOREIGN KEY (`t_accessory_accessory_id`)
    REFERENCES `ccDiary`.`t_accessory` (`accessory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_diary_t_user1`
    FOREIGN KEY (`t_user_user_id`)
    REFERENCES `ccDiary`.`t_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_diary_t_collection1`
    FOREIGN KEY (`t_collection_collection_id`)
    REFERENCES `ccDiary`.`t_collection` (`collection_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ccDiary`.`t_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccDiary`.`t_comment` (
  `comment_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `t_commentcol` VARCHAR(45) NULL COMMENT '',
  `t_user_user_id` INT NOT NULL COMMENT '',
  `t_diary_diary_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`comment_id`)  COMMENT '',
  INDEX `fk_t_comment_t_user1_idx` (`t_user_user_id` ASC)  COMMENT '',
  INDEX `fk_t_comment_t_diary1_idx` (`t_diary_diary_id` ASC)  COMMENT '',
  CONSTRAINT `fk_t_comment_t_user1`
    FOREIGN KEY (`t_user_user_id`)
    REFERENCES `ccDiary`.`t_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_comment_t_diary1`
    FOREIGN KEY (`t_diary_diary_id`)
    REFERENCES `ccDiary`.`t_diary` (`diary_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ccDiary`.`t_message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccDiary`.`t_message` (
  `recomment_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `recomment_image` VARCHAR(45) NULL COMMENT '',
  `recomment_word` VARCHAR(45) NULL COMMENT '',
  `recommen_time` VARCHAR(20) NULL COMMENT '',
  `t_user_user_id1` INT NOT NULL COMMENT '',
  `t_comment_comment_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`recomment_id`)  COMMENT '',
  INDEX `fk_t_message_t_user2_idx` (`t_user_user_id1` ASC)  COMMENT '',
  INDEX `fk_t_message_t_comment1_idx` (`t_comment_comment_id` ASC)  COMMENT '',
  CONSTRAINT `fk_t_message_t_user2`
    FOREIGN KEY (`t_user_user_id1`)
    REFERENCES `ccDiary`.`t_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_message_t_comment1`
    FOREIGN KEY (`t_comment_comment_id`)
    REFERENCES `ccDiary`.`t_comment` (`comment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ccDiary`.`t_capsule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccDiary`.`t_capsule` (
  `capsule_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `capsule_detail` VARCHAR(45) NULL COMMENT '胶囊字数未定',
  `capsule_time` VARCHAR(45) NULL COMMENT '',
  `t_user_user_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`capsule_id`)  COMMENT '',
  INDEX `fk_t_capsule_t_user1_idx` (`t_user_user_id` ASC)  COMMENT '',
  CONSTRAINT `fk_t_capsule_t_user1`
    FOREIGN KEY (`t_user_user_id`)
    REFERENCES `ccDiary`.`t_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
