# Task-Manager-Spring
Чтобы начать работать с этой программой, вам понадобится:
1) MySql Workbench
2) NetBeans IDE 8.2
3) Apache Tomcat 9.0.6

Создание бд в MySql Workbench:
1) CREATE SCHEMA `task-manager-lab` DEFAULT CHARACTER SET utf8;
2) CREATE TABLE `task-manager-lab`.`tasks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `taskName` VARCHAR(45) NOT NULL,
  `taskDescription` VARCHAR(45) NULL,
  `taskDate` DATE NOT NULL,
  `taskTime` TIME NOT NULL,
  `taskContacts` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
