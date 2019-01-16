-- Data Definiton Queries for Project
-- By Marc TIbbs
--

--
-- Queries to deal with old tables
--
DROP TABLE IF EXISTS `student_group`;
DROP TABLE IF EXISTS `student_class`;
DROP TABLE IF EXISTS `group`;
DROP TABLE IF EXISTS `resource`;

--
-- Table structure for table `student`
--
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
	`stu_id` int(11) PRIMARY KEY AUTO_INCREMENT,
	`stu_fname` varchar(100) NOT NULL,
	`stu_lname` varchar(100) NOT NULL,
	`stu_email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `class`
--
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
	`cla_id` int(11) PRIMARY KEY AUTO_INCREMENT,
	`cla_title` varchar(100) NOT NULL,
	`cla_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `group`
--
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
	`gro_id` int(11) PRIMARY KEY AUTO_INCREMENT,
	`gro_name` varchar(100) NOT NULL UNIQUE DEFAULT 'Class Name Group',
	`cla_id` int(11) NOT NULL,
	FOREIGN KEY (`cla_id`) REFERENCES `class` (`cla_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `resource`
--
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
	`res_id` int(11) PRIMARY KEY AUTO_INCREMENT,
	`res_title` varchar(100) NOT NULL,
	`res_author` varchar(100),
	`res_url` varchar(200) NOT NULL,
	`cla_id` int(11) NOT NULL,
	CONSTRAINT classresource UNIQUE (`res_title`,`cla_id`),
	FOREIGN KEY (`cla_id`) REFERENCES `class` (`cla_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `student_class`
--
DROP TABLE IF EXISTS `student_class`;
CREATE TABLE `student_class` (
	`stu_id` int(11),
	`cla_id` int(11),
	PRIMARY KEY (`stu_id`,`cla_id`),
	FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE CASCADE,
	FOREIGN KEY (`cla_id`) REFERENCES `class` (`cla_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `student_group`
--
DROP TABLE IF EXISTS `student_group`;
CREATE TABLE `student_group` (
	`stu_id` int(11),
	`gro_id` int(11),
	PRIMARY KEY (`stu_id`, `gro_id`),
	FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE CASCADE,
	FOREIGN KEY (`gro_id`) REFERENCES `group` (`gro_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `student`
--
INSERT INTO `student` (`stu_id`, `stu_fname`, `stu_lname`, `stu_email`) VALUES
(1, 'Bob', 'Knight', 'bobknight@gmail.com'),
(2, 'Phil', 'Knight', 'pknight@nike.com'),
(3, 'Bob', 'Builder', 'bobbuilder@yahoo.com'),
(4, 'Adam', 'Prager', 'adam@aol.com'),
(5, 'Emily', 'Watson', 'ewat13@hotmail.com'),
(6, 'Rachel', 'Nielson', 'rachniel@abc.com');

-- 
-- Dumping data for table `class`
-- 
INSERT INTO `class` (`cla_id`, `cla_title`, `cla_url`) VALUES
(1, 'Intro to Algorithms', 'www.learnalgs.com'),
(2, 'Algorithms II', 'www.advalgos.org');

-- 
-- Dumping data for table `group`
-- 
INSERT INTO `group` (`gro_id`,`gro_name`, `cla_id`) VALUES
(1, 'Algorithms for Beginners Website', 1),
(2, 'Library of Algorithms', 2),
(3, 'Algorithms for Non-Beginners Website', 1),
(4, 'Library of Fun Algorithms', 2);

-- 
-- Dumping data for table `resource`
-- 
INSERT INTO `resource` (`res_id`,`res_title`, `res_author`, `res_url`, `cla_id`) VALUES
(1, 'Algorithmist', 'Larry', 'http://www.algorithmist.com/index.php/Main_Page', 1),
(2, 'The Design of Approximation Algorithms', 'D. Williamson and D. Shmoys', 'http://www.designofapproxalgs.com', 2),
(3, 'Google', 'N/A', 'http://www.google.com', 1),
(4, 'Wiki', 'N/A', 'http://www.wikipedia.com', 2);

-- 
-- Dumping data for table `student_class`
-- 
INSERT INTO `student_class` (`stu_id`, `cla_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 2);

-- 
-- Dumping data for table `student_group`
-- 
INSERT INTO `student_group` (`stu_id`, `gro_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2);