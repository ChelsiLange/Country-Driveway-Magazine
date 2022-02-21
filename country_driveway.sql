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
  `newsletter_id`     int             PRIMARY KEY,
  `news_frequency`    enum('n','w','m')     NOT NULL
);

CREATE TABLE `roles` (
  `user_role_id`      int             PRIMARY KEY,
  `user_level`        enum('m','a')       NOT NULL
);

ALTER TABLE `accounts` ADD FOREIGN KEY (`newsletter_id_fk`) REFERENCES `newsletter_frequency` (`newsletter_id`);

ALTER TABLE `accounts` ADD FOREIGN KEY (`user_role_id_fk`) REFERENCES `roles` (`user_role_id`);


INSERT INTO `accounts` (`user_id`,`preferred_name`, `email`, `member_date`, `password`) VALUES (1,'Name', 'example@example.com', '2022-02-21', 'password');

INSERT INTO `newsletter_frequency` (`newsletter_id`, `news_frequency`) VALUES (1, 'w'), (2, 'm'), (3, 'n');

INSERT INTO `roles` (`user_role_id`, `user_level`) VALUES (1, 'm'), (2, 'a');