CREATE DATABASE IF NOT EXISTS `country_driveway` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `country_driveway`;

CREATE TABLE `accounts` (
  `user_id`           int             PRIMARY KEY     AUTO_INCREMENT,
  `newsletter_id_fk`  int,
  `user_role_id_fk`   int,
  `preferred_name`    varchar(50)     NOT NULL,
  `email`             varchar(255)    NOT NULL        UNIQUE,
  `member_date`       date            NOT NULL,
  `password`          varchar(255)    NOT NULL
);

CREATE TABLE `newsletter_frequency` (
  `newsletter_id`     int             PRIMARY KEY     AUTO_INCREMENT,
  `news_frequency`    enum('n','w','m')     NOT NULL
);

CREATE TABLE `roles` (
  `user_role_id`      int             PRIMARY KEY     AUTO_INCREMENT,
  `user_level`        enum('m','a')       NOT NULL
);

ALTER TABLE `accounts` ADD FOREIGN KEY (`newsletter_id_fk`) REFERENCES `newsletter_frequency` (`newsletter_id`);

ALTER TABLE `accounts` ADD FOREIGN KEY (`user_role_id_fk`) REFERENCES `roles` (`user_role_id`);
