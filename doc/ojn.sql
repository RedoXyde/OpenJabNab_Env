-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';

SET NAMES utf8mb4;

CREATE DATABASE `ojn` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ojn`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `settings` blob,
  `status` varchar(16) COLLATE utf8_bin DEFAULT 'User',
  `lastip` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `ads_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `ads_translation` (
  `ad_id` int(11) NOT NULL,
  `language` varchar(16) NOT NULL DEFAULT '',
  `content` text,
  PRIMARY KEY (`ad_id`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `bad_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `account` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `beta` (
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugin` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mac`,`plugin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `bootcode` (
  `version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `bootcode_bunny` (
  `version` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `report` text COLLATE utf8mb4_unicode_ci,
  KEY `couple` (`version`,`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `bunny` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) DEFAULT NULL,
  `mac` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `settings` blob,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `chat_row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text COLLATE utf8mb4_unicode_ci,
  `user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `crash` (
  `date` datetime DEFAULT NULL,
  `text` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `debug` (
  `date` datetime DEFAULT NULL,
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dump` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `demo` (
  `username` varchar(64) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `don` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT 'donation',
  `value` decimal(6,2) DEFAULT NULL,
  `remain` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed` int(11) DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annotation` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `geo` (
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `longitude` decimal(8,5) DEFAULT NULL,
  `latitude` decimal(8,5) DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `code` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` datetime DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `username` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genuine` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `gift_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `username` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `ideas` (
  `idea` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `language` (
  `code` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `language` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `public` int(2) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `news_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news` int(11) DEFAULT NULL,
  `language` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news` (`news`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `no_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `account` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `plugins` (
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installed_at` datetime DEFAULT NULL,
  `version` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `changed` int(3) DEFAULT NULL,
  `premium` int(2) DEFAULT NULL,
  `display` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `premium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` decimal(6,2) DEFAULT NULL,
  `remain` decimal(6,2) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `search` (
  `word` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last` datetime DEFAULT NULL,
  `searched` int(11) DEFAULT NULL,
  `language` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `results` int(11) DEFAULT NULL,
  PRIMARY KEY (`word`,`language`),
  UNIQUE KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `sentence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sentence` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `web` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sentence` (`sentence`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `silent` (
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `silent_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sound` tinyint(2) DEFAULT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loading` tinyint(2) DEFAULT '0',
  `finish` tinyint(2) DEFAULT '0',
  `bootcode` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac` (`mac`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `stats_actions` (
  `date` datetime DEFAULT NULL,
  `single` int(11) DEFAULT NULL,
  `double` int(11) DEFAULT NULL,
  `rfid` int(11) DEFAULT NULL,
  `ears` int(11) DEFAULT NULL,
  `voice` int(11) DEFAULT '0',
  `record` int(11) DEFAULT NULL,
  `api` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `stats_color` (
  `date` datetime DEFAULT NULL,
  `black` int(11) DEFAULT NULL,
  `white` int(11) DEFAULT NULL,
  `red` int(11) DEFAULT NULL,
  `yellow` int(11) DEFAULT NULL,
  `green` int(11) DEFAULT NULL,
  `cyan` int(11) DEFAULT NULL,
  `blue` int(11) DEFAULT NULL,
  `violet` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `stats_sleep` (
  `date` datetime DEFAULT NULL,
  `sleep` int(11) DEFAULT NULL,
  `awake` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `status_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_boot` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bytecode_revision` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wifi_ssid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wifi_key0` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wifi_auth` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wifi_crypt` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_dhcp` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_mask` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_gateway` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_dns` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_url` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwd` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proxy_enabled` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proxy_ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proxy_port` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `status_running` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_boot` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_mode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_mask` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_gateway` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_dns` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sResource` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gItState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gSleepState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gStreamingState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gProcessingState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gProcessingWaitState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gBusyState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `run` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debug` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debugvol` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bench` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recGain` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wifi_channel` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `status_shortconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_boot` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bench` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bytecode_revision` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_url` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rssi` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `status_silent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_mode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sResource` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gItState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gSleepState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gStreamingState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gProcessingState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gProcessingWaitState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gBusyState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sound` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `run` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `tester` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `plugin` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`,`plugin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `translation` (
  `sentence_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) COLLATE utf8_bin NOT NULL DEFAULT '',
  `translation` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` int(11) DEFAULT NULL,
  PRIMARY KEY (`sentence_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `translator` (
  `login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `v1ping` (
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last` datetime DEFAULT NULL,
  PRIMARY KEY (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `version` (
  `plugin` varchar(64) NOT NULL,
  `version` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`plugin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `voice_words` (
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `word` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `mac` (`mac`) USING BTREE,
  KEY `word` (`word`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


CREATE TABLE `voter` (
  `email` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `ztamp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) DEFAULT NULL,
  `serial` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `settings` blob,
  `account_id` int(11) DEFAULT NULL,
  `accounts` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- 2019-06-17 19:40:11
