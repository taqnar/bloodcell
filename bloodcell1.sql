CREATE TABLE `hospital` (
  `name` varchar(50) NOT NULL,
  `street_address` varchar(100) DEFAULT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `admin` tinyint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

alter table users AUTO_INCREMENT = 1;

CREATE TABLE `requirement` (
  `requirement_id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(45) NOT NULL,
  `by_stander` varchar(45) NOT NULL,
  `blood_group` varchar(5) NOT NULL,
  `quantity` int NOT NULL,
  `type_of_requirement` varchar(20) NOT NULL,
  `hospital` varchar(50) NOT NULL,
  `contact_no` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `closed` tinyint DEFAULT '0',
  PRIMARY KEY (`requirement_id`),
  KEY `requirement_hospital_idx` (`hospital`),
  CONSTRAINT `requirement_hospital` FOREIGN KEY (`hospital`) REFERENCES `hospital` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

alter table requirement Auto_increment = 1;

CREATE TABLE `donor` (
  `donor_id` int NOT NULL AUTO_INCREMENT,
  `university_reg_no` varchar(15) NOT NULL,
  `name` varchar(45) NOT NULL,
  `year_of_admission` int NOT NULL,
  `dept` varchar(45) NOT NULL,
  `phone_no` decimal(10,0) NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `height` int NOT NULL,
  `weight` int NOT NULL,
  `mail_id` varchar(45) NOT NULL,
  `last_donation` date NOT NULL,
  PRIMARY KEY (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

alter table donor Auto_increment = 1;

CREATE TABLE `donations` (
  `requirement_id` int NOT NULL,
  `donor_id` int NOT NULL,
  `date_of_donation` date NOT NULL,
  PRIMARY KEY (`requirement_id`,`donor_id`),
  KEY `donation_idx` (`donor_id`),
  CONSTRAINT `donation_donor` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`donor_id`),
  CONSTRAINT `donation_requirement` FOREIGN KEY (`requirement_id`) REFERENCES `requirement` (`requirement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

ALTER TABLE requirement ADD COLUMN donorsAssigned INT NULL DEFAULT 0 AFTER closed;




