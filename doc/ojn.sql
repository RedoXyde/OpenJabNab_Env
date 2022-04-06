SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `settings` blob DEFAULT NULL,
  `status` varchar(16) COLLATE utf8_bin DEFAULT 'User',
  `lastip` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `bad_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `account` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


SET NAMES utf8mb4;

CREATE TABLE `beta` (
  `plugin_name` varchar(50) NOT NULL,
  `bunny_mac` varchar(12) DEFAULT NULL,
  `user_name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `bunny` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) DEFAULT NULL,
  `mac` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `settings` blob DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `lastlocate` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `debug` (
  `date` datetime DEFAULT NULL,
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dump` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `demo` (
  `username` varchar(64) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `don` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` decimal(6,2) DEFAULT NULL,
  `txn_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed` int(11) DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annotation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `geo` (
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `longitude` decimal(8,5) DEFAULT NULL,
  `latitude` decimal(8,5) DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `code` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `username` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txn_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `gift_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `username` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


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
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `news_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news` int(11) DEFAULT NULL,
  `language` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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


CREATE TABLE `paypal_txn` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Donation ID',
  `date` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT 'Donation date',
  `txn_id` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT 'Transaction ID (from Paypal)',
  `txn_date` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT 'Donation date (from Paypal)',
  `txn_gross` float NOT NULL COMMENT 'Donation Gross (from Paypal)',
  `txn_fee` float NOT NULL COMMENT 'Donation Fee (from Paypal)',
  `txn_currency` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'EUR' COMMENT 'Donation Currency (from Paypal)',
  `pay_email` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Payer email (from Paypal)',
  `pay_id` varchar(25) CHARACTER SET utf8 NOT NULL COMMENT 'Payer ID (from Paypal)',
  `type` varchar(25) CHARACTER SET utf8 NOT NULL DEFAULT 'donation' COMMENT 'Donation Type (Invoice field from Paypal) donation/premium/code',
  `username` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Donator Username (Custom field from Paypal)',
  `note` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Note (Memo field from Paypal)',
  `raw` text CHARACTER SET utf8 NOT NULL COMMENT 'Raw POST Data from Paypal notify_url call',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `plugins` (
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installed_at` datetime DEFAULT NULL,
  `version` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `changed` int(3) DEFAULT NULL,
  `premium` int(2) DEFAULT NULL,
  `display` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `premium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` int(11) NOT NULL,
  `txn_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `search` (
  `word` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last` datetime DEFAULT NULL,
  `searched` int(11) DEFAULT NULL,
  `language` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `results` int(11) DEFAULT NULL,
  PRIMARY KEY (`word`,`language`),
  UNIQUE KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `sentence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sentence` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `web` tinyint(2) DEFAULT 1,
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
  `active` tinyint(2) DEFAULT 1,
  PRIMARY KEY (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `silent_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mac` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sound` tinyint(2) DEFAULT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loading` tinyint(2) DEFAULT 0,
  `finish` tinyint(2) DEFAULT 0,
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
  `voice` int(11) DEFAULT 0,
  `record` int(11) DEFAULT NULL,
  `api` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `stats_sleep` (
  `date` datetime DEFAULT NULL,
  `sleep` int(11) DEFAULT NULL,
  `awake` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `status_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `mac` varchar(12) DEFAULT NULL,
  `date_boot` varchar(32) DEFAULT NULL,
  `bytecode_revision` varchar(32) DEFAULT NULL,
  `wifi_ssid` varchar(64) DEFAULT NULL,
  `wifi_key0` varchar(64) DEFAULT NULL,
  `wifi_auth` varchar(32) DEFAULT NULL,
  `wifi_crypt` varchar(32) DEFAULT NULL,
  `net_dhcp` varchar(32) DEFAULT NULL,
  `net_ip` varchar(32) DEFAULT NULL,
  `net_mask` varchar(32) DEFAULT NULL,
  `net_gateway` varchar(32) DEFAULT NULL,
  `net_dns` varchar(32) DEFAULT NULL,
  `server_url` varchar(32) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `proxy_enabled` varchar(32) DEFAULT NULL,
  `proxy_ip` varchar(32) DEFAULT NULL,
  `proxy_port` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `status_running` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `mac` varchar(12) DEFAULT NULL,
  `date_boot` varchar(32) DEFAULT NULL,
  `connection_mode` varchar(32) DEFAULT NULL,
  `net_ip` varchar(32) DEFAULT NULL,
  `net_mask` varchar(32) DEFAULT NULL,
  `net_gateway` varchar(32) DEFAULT NULL,
  `net_dns` varchar(32) DEFAULT NULL,
  `sState` varchar(32) DEFAULT NULL,
  `sResource` varchar(32) DEFAULT NULL,
  `gItState` varchar(32) DEFAULT NULL,
  `gSleepState` varchar(32) DEFAULT NULL,
  `gStreamingState` varchar(32) DEFAULT NULL,
  `gProcessingState` varchar(32) DEFAULT NULL,
  `gProcessingWaitState` varchar(32) DEFAULT NULL,
  `gBusyState` varchar(32) DEFAULT NULL,
  `run` varchar(32) DEFAULT NULL,
  `debug` varchar(32) DEFAULT NULL,
  `debugvol` varchar(32) DEFAULT NULL,
  `bench` varchar(32) DEFAULT NULL,
  `recGain` varchar(32) DEFAULT NULL,
  `server` varchar(32) DEFAULT NULL,
  `wifi_channel` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `status_shortconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `mac` varchar(12) DEFAULT NULL,
  `date_boot` varchar(32) DEFAULT NULL,
  `bench` varchar(32) DEFAULT NULL,
  `bytecode_revision` varchar(32) DEFAULT NULL,
  `server_url` varchar(32) DEFAULT NULL,
  `rssi` varchar(16) DEFAULT NULL,
  `channel` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `status_silent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `mac` varchar(12) DEFAULT NULL,
  `connection_mode` varchar(32) DEFAULT NULL,
  `sState` varchar(32) DEFAULT NULL,
  `sResource` varchar(32) DEFAULT NULL,
  `gItState` varchar(32) DEFAULT NULL,
  `gSleepState` varchar(32) DEFAULT NULL,
  `gStreamingState` varchar(32) DEFAULT NULL,
  `gProcessingState` varchar(32) DEFAULT NULL,
  `gProcessingWaitState` varchar(32) DEFAULT NULL,
  `gBusyState` varchar(32) DEFAULT NULL,
  `sound` varchar(32) DEFAULT NULL,
  `run` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `translation` (
  `sentence_id` int(11) NOT NULL DEFAULT 0,
  `language` varchar(3) COLLATE utf8_bin NOT NULL DEFAULT '',
  `translation` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` int(11) DEFAULT NULL,
  PRIMARY KEY (`sentence_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `translator` (
  `login` varchar(255) DEFAULT NULL,
  `language` varchar(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `version` (
  `plugin` varchar(64) NOT NULL,
  `version` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`plugin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `voice_words` (
  `mac` varchar(12) DEFAULT NULL,
  `word` varchar(64) DEFAULT NULL,
  KEY `mac` (`mac`) USING BTREE,
  KEY `word` (`word`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `ztamp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) DEFAULT NULL,
  `serial` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `settings` blob DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `accounts` text COLLATE utf8_bin DEFAULT NULL,
  `lastshow` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
