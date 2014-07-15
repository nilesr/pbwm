-- --------------------------------------------------------
-- Host:                         wintercress.roaming.niles.mooo.com
-- Server version:               5.5.37-0ubuntu0.12.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for pbwm
CREATE DATABASE IF NOT EXISTS `pbwm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pbwm`;


-- Dumping structure for table pbwm.Chat_channels
CREATE TABLE IF NOT EXISTS `Chat_channels` (
  `channel_name` text NOT NULL,
  `channel_banlist` text NOT NULL,
  `channel_is_locked` int(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.Chat_messages
CREATE TABLE IF NOT EXISTS `Chat_messages` (
  `Timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `Message` text NOT NULL,
  `Username` text NOT NULL,
  `Message_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Channel` text NOT NULL,
  `Special_type` int(1) unsigned DEFAULT '0',
  PRIMARY KEY (`Message_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.Comments
CREATE TABLE IF NOT EXISTS `Comments` (
  `Post_ID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Poster` text NOT NULL,
  `Post_time` int(10) unsigned NOT NULL,
  `Parent_post_id` int(4) unsigned NOT NULL,
  `Comment_data` text NOT NULL,
  `Likes_this` text NOT NULL,
  PRIMARY KEY (`Post_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.Following
CREATE TABLE IF NOT EXISTS `Following` (
  `Username` text NOT NULL,
  `Follows` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.Login_Logs
CREATE TABLE IF NOT EXISTS `Login_Logs` (
  `Time` int(10) unsigned NOT NULL DEFAULT '0',
  `Username` text NOT NULL,
  `IP_Address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.PendingUsers
CREATE TABLE IF NOT EXISTS `PendingUsers` (
  `Token` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.Pending_email_validation
CREATE TABLE IF NOT EXISTS `Pending_email_validation` (
  `Username` text NOT NULL,
  `Password` text NOT NULL,
  `Salt` text NOT NULL,
  `Email` text NOT NULL,
  `Registration_key` text NOT NULL,
  UNIQUE KEY `Username` (`Username`(20)),
  UNIQUE KEY `Email` (`Email`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.Pending_password_reset
CREATE TABLE IF NOT EXISTS `Pending_password_reset` (
  `Username` text NOT NULL,
  `token` text NOT NULL,
  `timestamp` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
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

-- Data exporting was unselected.


-- Dumping structure for table pbwm.Posts
CREATE TABLE IF NOT EXISTS `Posts` (
  `Post_ID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Poster` text NOT NULL,
  `Time_Of_Posting` int(10) unsigned NOT NULL,
  `Post_Contents` text NOT NULL,
  `privacy_settings` int(1) unsigned NOT NULL,
  `Likes_This` text NOT NULL,
  PRIMARY KEY (`Post_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.Private_Messages
CREATE TABLE IF NOT EXISTS `Private_Messages` (
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

-- Data exporting was unselected.


-- Dumping structure for table pbwm.Profiles
CREATE TABLE IF NOT EXISTS `Profiles` (
  `Username` text NOT NULL,
  `Profile` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.Profile_pictures
CREATE TABLE IF NOT EXISTS `Profile_pictures` (
  `type` char(4) NOT NULL DEFAULT '',
  `Username` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `Token` text NOT NULL,
  `Username` text NOT NULL,
  `Timestamp` int(10) unsigned NOT NULL,
  `Chat_channel_in` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `Username` text NOT NULL,
  `css_is_custom` int(1) NOT NULL DEFAULT '0',
  `css_path` text,
  `css_theme` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table pbwm.users
CREATE TABLE IF NOT EXISTS `users` (
  `Username` text NOT NULL,
  `Password` text NOT NULL,
  `Salt` text NOT NULL,
  `Email` text NOT NULL,
  `Emails_sent_since_last_login` int(1) unsigned NOT NULL DEFAULT '0',
  `Chat_color` text,
  UNIQUE KEY `Username` (`Username`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

