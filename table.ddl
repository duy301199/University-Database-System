<html>
<body>
<?php
CREATE TABLE `Professor` (
`ssn` int(11) NOT NULL,
`name` varchar(50) DEFAULT NULL,
`sex` varchar(50) DEFAULT NULL,
`title` varchar(50) DEFAULT NULL,
`salary` float DEFAULT NULL,
`degrees` varchar(50) DEFAULT NULL,
PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
CREATE TABLE `ProfessorAddress` (
`ssn` int(11) DEFAULT NULL,
`street` varchar(50) DEFAULT NULL,
`city` varchar(50) DEFAULT NULL,
`state` varchar(50) DEFAULT NULL,
`zipcode` int(11) DEFAULT NULL,
KEY `ssn` (`ssn`),
CONSTRAINT `ProfessorAddress_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `Professor`
(`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
CREATE TABLE `ProfessorTelephone` (
`ssn` int(11) DEFAULT NULL,
`areacode` int(11) DEFAULT NULL,
`number` int(11) DEFAULT NULL,
KEY `ssn` (`ssn`),
CONSTRAINT `ProfessorTelephone_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES
`Professor` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
CREATE TABLE `Department` (
`dno` int(11) NOT NULL,
`dname` varchar(50) DEFAULT NULL,
`telephone` int(15) DEFAULT NULL,
`professor_ssn` int(11) DEFAULT NULL,
`location` varchar(50) DEFAULT NULL,
PRIMARY KEY (`dno`),
KEY `professor_ssn` (`professor_ssn`),
CONSTRAINT `Department_ibfk_1` FOREIGN KEY (`professor_ssn`) REFERENCES
`Professor` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
CREATE TABLE `Course` (
`cno` int(11) NOT NULL AUTO_INCREMENT,
`c_title` varchar(50) DEFAULT NULL,
`textbook` varchar(50) DEFAULT NULL,
`units` int(11) DEFAULT NULL,
`dno` int(11) DEFAULT NULL,
PRIMARY KEY (`cno`),
KEY `dno` (`dno`),
CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `Department` (`dno`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
CREATE TABLE `CoursePreq` (
`cno` int(11) DEFAULT NULL,
`pre_req` varchar(20) DEFAULT NULL,
KEY `cno` (`cno`),
CONSTRAINT `CoursePreq_ibfk_1` FOREIGN KEY (`cno`) REFERENCES `Course` (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
CREATE TABLE `Section` (
`sno` int(11) NOT NULL AUTO_INCREMENT,
`cno` int(11) DEFAULT NULL,
`classroom` varchar(50) DEFAULT NULL,
`no_seats` int(100) DEFAULT NULL,
`meeting_days` varchar(50) DEFAULT NULL,
`start_time` varchar(5) DEFAULT NULL,
`end_time` varchar(5) DEFAULT NULL,
`professor_ssn` int(11) DEFAULT NULL,
PRIMARY KEY (`sno`),
KEY `professor_ssn` (`professor_ssn`),
KEY `cno` (`cno`),
CONSTRAINT `Section_ibfk_2` FOREIGN KEY (`professor_ssn`) REFERENCES
`Professor` (`ssn`),
CONSTRAINT `Section_ibfk_3` FOREIGN KEY (`cno`) REFERENCES `Course` (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
CREATE TABLE `Students` (
`id` int(11) NOT NULL,
`fname` varchar(50) DEFAULT NULL,
`lname` varchar(50) DEFAULT NULL,
`address` varchar(50) DEFAULT NULL,
`telephone` int(11) DEFAULT NULL,
`major` varchar(50) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
CREATE TABLE `StudentMinor` (
`id` int(11) DEFAULT NULL,
`minor` varchar(20) DEFAULT NULL,
KEY `id` (`id`),
CONSTRAINT `StudentMinor_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
CREATE TABLE `Enrollment` (
`student_id` int(11) DEFAULT NULL,
`cno` int(11) DEFAULT NULL,
`sno` int(11) DEFAULT NULL,
`grade` varchar(2) DEFAULT NULL,
KEY `student_id` (`student_id`),
KEY `cno` (`cno`),
KEY `sno` (`sno`),
CONSTRAINT `Enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Students`
(`id`),
CONSTRAINT `Enrollment_ibfk_2` FOREIGN KEY (`cno`) REFERENCES `Course` (`cno`),
CONSTRAINT `Enrollment_ibfk_3` FOREIGN KEY (`sno`) REFERENCES `Section` (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
?>
</body>
</html>
