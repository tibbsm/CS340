-- Data Definiton Queries for Project
-- By Marc TIbbs
--
--
-- Table structure for table `student`
--
CREATE TABLE `student` (
	`stu_id` int(11) NOT NULL,
	`stu_fname` varchar(100) NOT NULL,
	`stu_lname` varchar(100) NOT NULL,
	`stu_email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `student`
--
ALTER TABLE `student`
	ADD PRIMARY KEY (`stu_id`);

--
-- Table structure for table `class`
--
CREATE TABLE `class` (
	`cla_id` int(11) NOT NULL,
	`cla_title` varchar(100) NOT NULL,
	`cla_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `class`
--
ALTER TABLE `class`
	ADD PRIMARY KEY (`cla_id`);


--
-- Table structure for table `group`
--
CREATE TABLE `group` (
	`gro_id` int(11) NOT NULL,
	`gro_name` varchar(100) NOT NULL DEFAULT 'Class Name Group'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `group`
--
ALTER TABLE `group`
	ADD PRIMARY KEY (`gro_id`);

--
-- Table structure for table `resource`
--
CREATE TABLE `resource` (
	`res_id` int(11) NOT NULL,
	`res_title` varchar(100) NOT NULL,
	`res_author` varchar(100),
	`res_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
	ADD PRIMARY KEY (`res_id`);

--
-- Table structure for table `student_class`
--
CREATE TABLE `student_class` (
	`stu_id` int(11) NOT NULL,
	`cla_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for table `student_class`
--
ALTER TABLE `student_class`
	ADD CONSTRAINT `student_class_ibfk_1` FOREIGN KEY (`stu_id`) 
REFERENCES `student` (`stu_id`),
	ADD CONSTRAINT `student_class_ibfk_2` FOREIGN KEY (`cla_id`) 
	REFERENCES `class` (`cla_id`);

--
-- Indexes for table `student_class`
--
ALTER TABLE `student_class`
	ADD PRIMARY KEY (`stu_id`, `cla_id`);

--
-- Table structure for table `student_group`
--
CREATE TABLE `student_group` (
	`stu_id` int(11) NOT NULL,
	`gro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for table `student_group`
--
ALTER TABLE `student_group`
	ADD CONSTRAINT `student_group_ibfk_1` FOREIGN KEY (`stu_id`) 
REFERENCES `student` (`stu_id`),
	ADD CONSTRAINT `student_group_ibfk_2` FOREIGN KEY (`gro_id`) 
	REFERENCES `group` (`gro_id`);

--
-- Indexes for table `student_group`
--
ALTER TABLE `student_group`
	ADD PRIMARY KEY (`stu_id`, `gro_id`);

--
-- Table structure for table `class_resource`
--
CREATE TABLE `class_resource` (
	`res_id` int(11) NOT NULL,
	`cla_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for table `class_resource`
--
ALTER TABLE `class_resource`
	ADD CONSTRAINT `class_resource_ibfk_1` FOREIGN KEY (`res_id`) 
REFERENCES `resource` (`res_id`),
	ADD CONSTRAINT `class_resource_ibfk_2` FOREIGN KEY (`cla_id`) 
	REFERENCES `class` (`cla_id`);

--
-- Indexes for table `class resource`
--
ALTER TABLE `class_resource`
	ADD PRIMARY KEY (`cla_id`, `res_id`);


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

INSERT INTO `group` (`gro_id`, `gro_name`) VALUES
(1, 'Algorithms for Beginners Website'),
(2, 'Library of Algorithms');

-- 
-- Dumping data for table `resource`
-- 

INSERT INTO `resource` (`res_id`, `res_title`, `res_author`, `res_url`) VALUES
(1, 'Algorithmist', 'Larry', 'http://www.algorithmist.com/index.php/Main_Page'),
(2, 'The Design of Approximation Algorithms', 'D. Williamson and D. Shmoys', 'http://www.designofapproxalgs.com');

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

-- 
-- Dumping data for table `class_resource`
-- 

INSERT INTO `class_resource` (`cla_id`, `res_id`) VALUES
(1, 1),
(2, 2);