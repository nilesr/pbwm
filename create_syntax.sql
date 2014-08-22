# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: niles.mooo.com (MySQL 5.5.38-0ubuntu0.12.04.1)
# Database: pbwm
# Generation Time: 2014-08-22 19:50:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Chat_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Chat_channels`;

CREATE TABLE `Chat_channels` (
  `channel_name` text NOT NULL,
  `channel_banlist` text NOT NULL,
  `channel_is_locked` int(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Chat_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Chat_messages`;

CREATE TABLE `Chat_messages` (
  `Timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `Message` text NOT NULL,
  `Username` text NOT NULL,
  `Message_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Channel` text NOT NULL,
  `Special_type` int(1) unsigned DEFAULT '0',
  PRIMARY KEY (`Message_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Comments`;

CREATE TABLE `Comments` (
  `Post_ID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Poster` text NOT NULL,
  `Post_time` int(10) unsigned NOT NULL,
  `Parent_post_id` int(4) unsigned NOT NULL,
  `Comment_data` text NOT NULL,
  `Likes_this` text NOT NULL,
  PRIMARY KEY (`Post_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Following
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Following`;

CREATE TABLE `Following` (
  `Username` text NOT NULL,
  `Follows` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Login_Logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Login_Logs`;

CREATE TABLE `Login_Logs` (
  `Time` int(10) unsigned NOT NULL DEFAULT '0',
  `Username` text NOT NULL,
  `IP_Address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Pending_email_validation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Pending_email_validation`;

CREATE TABLE `Pending_email_validation` (
  `Username` text NOT NULL,
  `Password` text NOT NULL,
  `Salt` text NOT NULL,
  `Email` text NOT NULL,
  `Registration_key` text NOT NULL,
  UNIQUE KEY `Username` (`Username`(20)),
  UNIQUE KEY `Email` (`Email`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Pending_password_reset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Pending_password_reset`;

CREATE TABLE `Pending_password_reset` (
  `Username` text NOT NULL,
  `token` text NOT NULL,
  `timestamp` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PendingUsers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PendingUsers`;

CREATE TABLE `PendingUsers` (
  `Token` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `Username` text NOT NULL,
  `can_delete_users` int(1) unsigned NOT NULL DEFAULT '0',
  `can_view_administrative_panel` int(1) unsigned NOT NULL DEFAULT '0',
  `can_impersonate` int(1) unsigned NOT NULL DEFAULT '0',
  `can_generate_reports` int(1) unsigned NOT NULL DEFAULT '0',
  `can_send_messages_with_increased_priority` int(1) unsigned NOT NULL DEFAULT '0',
  `can_view_chat_admin_panel` int(1) unsigned NOT NULL DEFAULT '0',
  `can_ban_people_from_chat` int(1) unsigned NOT NULL DEFAULT '0',
  `can_clear_chat` int(1) unsigned NOT NULL DEFAULT '0',
  `can_alert_chat` int(1) unsigned NOT NULL DEFAULT '0',
  `can_lock_chat` int(1) unsigned NOT NULL DEFAULT '0',
  `can_talk_through_lock` int(1) unsigned NOT NULL DEFAULT '0',
  `is_distinguished_in_chat` int(1) unsigned NOT NULL DEFAULT '0',
  `can_erase_chat_messages` int(1) unsigned NOT NULL DEFAULT '0',
  `can_rename_account` int(1) unsigned NOT NULL DEFAULT '0',
  `can_edit_chat_messages` int(1) unsigned NOT NULL DEFAULT '0',
  `profile_picture_has_border` int(1) unsigned NOT NULL DEFAULT '0',
  `can_send_mass_messages` int(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Posts`;

CREATE TABLE `Posts` (
  `Post_ID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Poster` text NOT NULL,
  `Time_Of_Posting` int(10) unsigned NOT NULL,
  `Post_Contents` text NOT NULL,
  `privacy_settings` int(1) unsigned NOT NULL,
  `Likes_This` text NOT NULL,
  PRIMARY KEY (`Post_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Private_Messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Private_Messages`;

CREATE TABLE `Private_Messages` (
  `To` text NOT NULL,
  `From` text NOT NULL,
  `Missive` text NOT NULL,
  `Priority` int(1) unsigned NOT NULL DEFAULT '0',
  `Mail_ID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Read` int(1) unsigned NOT NULL DEFAULT '0',
  `Deleted` int(1) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Mail_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Profile_pictures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Profile_pictures`;

CREATE TABLE `Profile_pictures` (
  `type` char(4) DEFAULT NULL,
  `Username` text NOT NULL,
  `Data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Profiles`;

CREATE TABLE `Profiles` (
  `Username` text NOT NULL,
  `Profile` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `Token` text NOT NULL,
  `Username` text NOT NULL,
  `Timestamp` int(10) unsigned NOT NULL,
  `Chat_channel_in` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `Username` text NOT NULL,
  `css_is_custom` int(1) NOT NULL DEFAULT '0',
  `css_path` text,
  `css_theme` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `Username` text NOT NULL,
  `Password` text NOT NULL,
  `Salt` text NOT NULL,
  `Email` text NOT NULL,
  `Emails_sent_since_last_login` int(1) unsigned NOT NULL DEFAULT '0',
  `Chat_color` text,
  `Send_notification_emails` int(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `Username` (`Username`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

