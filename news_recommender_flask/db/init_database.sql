-- Database initialization script for LLM-ReadingAid-VisuallyImpaired
-- This script creates the database and all required tables

-- Create database
CREATE DATABASE IF NOT EXISTS `news_recommend` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `news_recommend`;

-- Table structure for table `user`
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `news`
CREATE TABLE IF NOT EXISTS `news` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `time` date NOT NULL,
  `content` text NOT NULL,
  `url` varchar(1000) NOT NULL,
  `news_kind` varchar(100) NOT NULL,
  `abstract` text,
  `lang` varchar(10) NOT NULL DEFAULT 'zh',
  PRIMARY KEY (`newsId`),
  KEY `idx_news_kind` (`news_kind`),
  KEY `idx_time` (`time`),
  KEY `idx_lang` (`lang`),
  KEY `idx_url` (`url`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `preference`
CREATE TABLE IF NOT EXISTS `preference` (
  `preferenceId` int(11) NOT NULL AUTO_INCREMENT,
  `preferenceName` varchar(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `preferenceNameEng` varchar(100) NOT NULL,
  PRIMARY KEY (`preferenceId`),
  KEY `idx_userId` (`userId`),
  CONSTRAINT `fk_preference_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `history`
CREATE TABLE IF NOT EXISTS `history` (
  `historyId` int(11) NOT NULL AUTO_INCREMENT,
  `newId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `viewTime` date NOT NULL,
  PRIMARY KEY (`historyId`),
  KEY `idx_userId` (`userId`),
  KEY `idx_newId` (`newId`),
  KEY `idx_viewTime` (`viewTime`),
  CONSTRAINT `fk_history_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `fk_history_news` FOREIGN KEY (`newId`) REFERENCES `news` (`newsId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

