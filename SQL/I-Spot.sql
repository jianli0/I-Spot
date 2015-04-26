CREATE TABLE `User` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(45) DEFAULT NULL,
  `Firstname` varchar(45) DEFAULT NULL,
  `Lastname` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;


CREATE TABLE `Spot` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Locationname` varchar(45) DEFAULT NULL,
  `Adress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


CREATE TABLE `Information` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Spot` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Content` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Spot` (`Spot`),
  CONSTRAINT `information_ibfk_1` FOREIGN KEY (`Spot`) REFERENCES `Spot` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


CREATE TABLE `Comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Content` varchar(255) DEFAULT NULL,
  `User` int(11) DEFAULT NULL,
  `Info` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `User` (`User`),
  KEY `Info` (`Info`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`User`) REFERENCES `User` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`Info`) REFERENCES `Information` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Share` (
  `User` int(11) NOT NULL,
  `Info` int(11) NOT NULL,
  PRIMARY KEY (`User`,`Info`),
  KEY `Info` (`Info`),
  CONSTRAINT `share_ibfk_1` FOREIGN KEY (`User`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `share_ibfk_2` FOREIGN KEY (`Info`) REFERENCES `Information` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `UserFollowUser` (
  `Following` int(11) NOT NULL,
  `Followed` int(11) NOT NULL,
  PRIMARY KEY (`Following`,`Followed`),
  KEY `Followed` (`Followed`),
  CONSTRAINT `userfollowuser_ibfk_1` FOREIGN KEY (`Following`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userfollowuser_ibfk_2` FOREIGN KEY (`Followed`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `UserSubscribeSpot` (
  `User` int(11) NOT NULL,
  `Spot` int(11) NOT NULL,
  PRIMARY KEY (`User`,`Spot`),
  KEY `Spot` (`Spot`),
  CONSTRAINT `Spot` FOREIGN KEY (`Spot`) REFERENCES `Spot` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `User` FOREIGN KEY (`User`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
