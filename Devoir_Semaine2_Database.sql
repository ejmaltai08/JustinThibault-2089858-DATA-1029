-- Create the database
CREATE DATABASE IF NOT EXISTS library;
USE library;

-- Set SQL mode and other configurations
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Create the publishers table
CREATE TABLE IF NOT EXISTS `publishers` (
  `pub_id` int(11) NOT NULL,
  `pub_name` varchar(55) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data into the publishers table
INSERT INTO `publishers` (`pub_id`, `pub_name`, `city`, `state`, `country`) VALUES
(1, 'Harmattan', 'Paris', NULL, 'France'),
(2, 'Eyrolles', 'Lyon', NULL, 'France'),
(3, 'Macmillan', 'Londres', NULL, 'Royaume-Unis'),
(4, 'Boreal', 'Montreal', 'Quebec', 'Canada'),
(5, 'Disney', 'Anaheim', 'Californie', 'Etats-Unis');

-- Create the titles table
CREATE TABLE IF NOT EXISTS `titles` (
  `title_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `pub_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `advance` float DEFAULT NULL,
  `royalty` float DEFAULT NULL,
  `ytd_sales` float DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `pubdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data into the titles table
INSERT INTO `titles` (`title_id`, `title`, `type`, `pub_id`, `price`, `advance`, `royalty`, `ytd_sales`, `notes`, `pubdate`) VALUES
(1, 'The Canadian Constitution', 'poche', 1, 19, 3, 3, 3, 'Constitution canadienne sous forme de livre de poche', '2014-01-09'),
(2, 'Pour le liberalisme Communautaire', 'Politique', 2, 23, 2, 1, 3, 'Doctrine politique de Paul Barthelemy Biya ', '2010-01-01'),
(3, 'Introduction a l\'Algorithmique', 'Informatique', 2, 24, 2, 3, 3, 'Pour se familiariser au domaine de la programmation independamment du langage', '1994-01-08'),
(4, 'Php and Mysql', 'Informatique', 3, 65, 20, 40, 20, 'Web database application with Php and Mysql', '2004-03-10'),
(5, 'The Armour of Light', 'roman', 3, 49, 2, 3.4, 3.1, 'American love story', '1914-03-02'),
(6, 'The Seven Sisters Tome 1Maia Story', 'roman', 3, 19, 2, 2.4, 1.1, 'American adventure story', '1934-03-02'),
(7, 'Histoire de la Méchante Reine', 'roman', 4, 9, 2, 3.4, 3.1, 'Fairest of All : A Tale of the Wicked Queen', '1934-04-04'),
(8, 'Computer science ', 'computer', 4, 13, 10, 3, 2, 'Computer science from zero to hero', '2013-02-03'),
(9, 'Master Computers and network  ', 'Informatique', 4, 13, 10, 3, 2, 'Master Computer science ', '2023-01-03'),
(10, 'Sur de soi  ', 'Psychologie', 4, 13, 10, 3, 2, 'Psy de poche ', '1998-02-03'),
(11, 'Bus de la STM ', 'Transport', 2, 1, 1, 1, 3, 'Comprendre', '2008-02-03');

-- Add primary key and foreign key constraints
ALTER TABLE `publishers` ADD PRIMARY KEY (`pub_id`);
ALTER TABLE `titles` ADD PRIMARY KEY (`title_id`), ADD KEY `fk_titles_publishers` (`pub_id`);
ALTER TABLE `publishers` MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
ALTER TABLE `titles` MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

-- Add foreign key constraint
ALTER TABLE `titles` ADD CONSTRAINT `fk_titles_publishers` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`);

-- Commit the changes
COMMIT;

-- Exercice 1
SELECT title, price
FROM titles
WHERE title LIKE '%computer%';

-- Exercice 2
SELECT title, price
FROM titles
WHERE title LIKE '% computer %';

-- Exercice 3
SELECT title, price
FROM titles
WHERE SUBSTRING(identifier, 1, 2) IN ('SU', 'BU');

-- Exercice 4
SELECT title, price
FROM titles
WHERE SUBSTRING(identifier, 1, 2) NOT IN ('SU', 'BU');

-- Exercice 5
SELECT title, price
FROM titles
WHERE NOT (title LIKE 'S%' OR title LIKE 'B%') AND SUBSTRING(title, 2, 1) = 'o';

-- Exercice 6
SELECT title, price
FROM titles
WHERE NOT (title LIKE 'S%' OR title LIKE 'B%') AND SUBSTRING(title, 3, 1) = 'f';

-- Exercice 7
SELECT title, price
FROM titles
WHERE SUBSTRING(title, 1, 1) IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
