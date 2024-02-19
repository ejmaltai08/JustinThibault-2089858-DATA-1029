CREATE Database library2;

CREATE TABLE IF NOT EXISTS `authors` (
  `au_id` tinyint,
  `au_fname` varchar(50) DEFAULT NULL,
  `au_lname` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `contract` text,
  `email` varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `authors` (`au_id`, `au_fname`, `au_lname`, `phone`, `address`, `city`, `state`, `country`, `zip`, `contract`, `email`) VALUES
(1, 'LeBlanc', 'Louis', '+14862568954', '17 Rue Perle', 'Toronto', 'Ontario', 'Canada', 'R5Y8Y1', 230, 'Louis.Leblanc@gmail.com'),
(2, 'Smith', 'James', '+14862534554', '1750 Avenue Horne', 'Montreal', 'Quebec', 'Canada', 'H2L2X7', 30, 'James.Smith@hotmail.com'),
(3, 'Savoie', 'Mark', '+14862644789', '818 Rue Quartier', 'Moncton', 'New Brunswick', 'Canada', 'E8I 5T7', 182, 'M.Savoie01@gmail.ca');

CREATE TABLE  IF NOT EXISTS  `employees` (
  `emp_id` tinyint,
  `emp_name` varchar(50) DEFAULT NULL,
  `salary` smallint,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `job_id` smallint,
  `pub_id` smallint,
  `email` varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `employees` (`emp_id`, `emp_name`, `salary`, `fname`, `lname`, `job_id`, `pub_id`, `email`) VALUES
(1, 'Stephane', '30', 'Holland' , 'Jean', '1789', '45', 'Jean.Holland@gmail.com'),
(2, 'Stephane', '30', 'Coulomb', 'Janick', '456', '178', 'Janick.Coulomb@gmail.com'),
(3, 'Hugo', '45', 'Bouchard', 'Serge', '05', '179', 'sergebouchard05@hotmail.fr'),
(4, 'Hugo', '45', 'Pitre', 'Mario', '15', '178' , 'MarioPitre15@hotmail.fr'),
(5, 'Jean', '50' 'Bellavance', 'Jess', '1423', '17', 'Jss.Bell@gmail.ca'),
(6,'Jean', '50', 'Girard', 'Pierre', '1234', '17', 'Pierre.G@gmail.ca');

CREATE TABLE   IF NOT EXISTS  `jobs` (
  `job_id` tinyint,
  `job_desc` varchar(50) DEFAULT NULL,
  `min_lvl` enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR') DEFAULT NULL,
  `max_lvl` enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `jobs` (`job_id`, `job_desc`, `min_lvl`, `max_lvl`) VALUES
(1, 'Webeditor', 'INTERMEDIARE', 'SEINIOR'),
(2, 'Correcteur', 'STAGIAIRE', 'SEINIOR'),
(3, 'Webmaster', 'INTERMEDIARE', 'SEINIOR');

CREATE TABLE  IF NOT EXISTS  `publishers` (
  `pub_id` tinyint,
  `pub_name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `email` varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `publishers` (`pub_id`, `pub_name`, `city`, `state`, `country`, `email`) VALUES
(1, '17', 'Paris', 'France', 'France', 'Paris.Publishers@hotmail.fr'),
(2, '178', 'Moncton', 'New Brunswick', 'Canada', 'MonctonNB.publishers@gmail.ca');

CREATE TABLE  IF NOT EXISTS  `sales` (
  `stor_id` tinyint,
  `ord_num` tinyint,
  `title_id` smallint,
  `ord_date` datetime,
  `qty` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `sales` (`stor_id`, `ord_num`, `title_id`, `ord_date`, `qty`, `paytemrs`) VALUES
(1, 1, 11, '2023-12-05', 2),
(1, 2, 4, '2013-02-05', 2);


CREATE TABLE   IF NOT EXISTS  `stores` (
  `stor_id` tinyint,
  `stor_name` varchar(50) DEFAULT NULL,
  `stor_address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `stores` (`stor_id`, `stor_name`, `stor_address`, `city`, `state`, `country`) VALUES
(1, 'abdel', '187 Rue Jean Drapeaux', 'Québec', 'Québec', 'Canada'),
(2, 'Le passage', '232 Botsford St,', 'Dieppe', 'Nouveau Brunswick', 'Canada');

CREATE TABLE  IF NOT EXISTS  `titles` (
  `title_id` tinyint,
  `title` varchar(100) DEFAULT NULL,
  `type` enum("Roman","Politique","Science","Histoire"),
  `pub_id` smallint,
  `price` float DEFAULT NULL,
  `advance` float DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `pubdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `titles` (`title_id`, `title`, `type`, `pub_id`, `price`, `advance`, `royalty`, `ytd_sales`, `notes`, `pubdate`) VALUES
(1, 'The Canadian Constitution', 'poche', 1, 19, 3, 3, 3, 'Constitution canadienne sous forme de livre de poche', '2014-01-09'),
(2, 'Pour le liberalisme Communautaire', 'business', 2, 23, 2, 1, 3, 'Doctrine politique de Paul Barthelemy Biya ', '2010-01-01'),
(3, 'Introduction a l\'Algorithmique', 'Informatique', 2, 24, 2, 3, 3, 'Pour se familiariser au domaine de la programmation independamment du langage', '1994-01-08'),
(4, 'Php and Mysql', 'Informatique', 3, 65, 20, 40, 20, 'Web database application with Php and Mysql', '2004-03-10'),
(5, 'The Armour of Light', 'roman', 3, 49, 2, 3.4, 3.1, 'American love story', '1914-03-02'),
(6, 'The Seven Sisters Tome 1Maia Story', 'roman', 3, 19, 2, 2.4, 1.1, 'American adventure story', '1934-03-02'),
(7, 'Histoire de la Méchante Reine', 'roman', 4, 9, 2, 3.4, 3.1, 'Fairest of All : A Tale of the Wicked Queen', '1934-04-04');

CREATE TABLE  IF NOT EXISTS  `Redaction` (
  `au_id` tinyint,
  `title_id` tinyint,
  `au_ord` tinyint,
  `royality` float
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `Redaction`(`au_id`, `title_id`, `au_ord`, `royality`) VALUES
(1, 1, 587, 6097.99),
(2, 2, 456, 5236.20),
(3, 3, 123, 1563.69);

ALTER TABLE `authors`
  ADD PRIMARY KEY (`au_id`);
  
  
  ALTER TABLE `publishers`
  ADD PRIMARY KEY (`pub_id`);
  
  
  ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY (`job_id`),
  ADD KEY (`pub_id`);
  
  
  ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);
  
  
  ALTER TABLE `stores`
  ADD PRIMARY KEY (`stor_id`);
  
  
  ALTER TABLE `sales`
  ADD PRIMARY KEY (`ord_num`),
  ADD KEY (`stor_id`),
  ADD KEY (`title_id`);
  
  
  ALTER TABLE `titles`
  ADD PRIMARY KEY (`title_id`),
  ADD KEY (`pub_id`);
  
  
  ALTER TABLE `Redaction`
  ADD KEY (`au_id`),
  ADD KEY (`title_id`);
  
  
  ALTER TABLE `Redaction`
  ADD CONSTRAINT `fk_Redaction_authors` FOREIGN KEY (`au_id`) REFERENCES `authors` (`au_id`),
  ADD CONSTRAINT `fk_Redaction_title` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`);
  
  
  ALTER TABLE `titles`
  ADD CONSTRAINT `fk_titles_publishers` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`);
  
  
  ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_stores` FOREIGN KEY (`stor_id`) REFERENCES `stores` (`stor_id`),
  ADD CONSTRAINT `fk_sales_titles` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`);
  
  
  ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_jobs` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  ADD CONSTRAINT `fk_employees_publishers` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`);