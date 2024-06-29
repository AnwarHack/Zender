SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `source` tinyint(4) NOT NULL,
  `event` tinyint(4) NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `did` tinytext NOT NULL,
  `gateway` int(11) NOT NULL,
  `mode` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `name` tinytext NOT NULL,
  `contacts` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `commissions`;
CREATE TABLE `commissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `did` tinytext NOT NULL,
  `original_amount` float NOT NULL,
  `commission_amount` float NOT NULL,
  `currency` tinytext NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `groups` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `deleted`;
CREATE TABLE `deleted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `did` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `did` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `random_send` tinyint(4) NOT NULL,
  `random_min` int(11) NOT NULL,
  `random_max` int(11) NOT NULL,
  `limit_status` tinyint(4) NOT NULL,
  `limit_interval` tinyint(4) NOT NULL,
  `limit_number` int(11) NOT NULL,
  `packages` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_sms` tinyint(4) NOT NULL,
  `global_device` tinyint(4) NOT NULL,
  `global_priority` tinyint(4) NOT NULL,
  `global_slots` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` float NOT NULL,
  `online_id` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `online_status` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `gateways`;
CREATE TABLE `gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `callback` tinyint(4) NOT NULL,
  `callback_id` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pricing` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `keys`;
CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `secret` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rtl` tinyint(4) NOT NULL,
  `iso` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `languages` (`id`, `rtl`, `iso`, `order`, `name`, `create_date`) VALUES
(1, 2,  'US', 1,  'English',  '2021-11-05 17:39:09');

DROP TABLE IF EXISTS `marketing`;
CREATE TABLE `marketing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `users` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `did` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `package` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_limit` int(11) NOT NULL,
  `receive_limit` int(11) NOT NULL,
  `ussd_limit` int(11) NOT NULL,
  `notification_limit` int(11) NOT NULL,
  `contact_limit` int(11) NOT NULL,
  `device_limit` int(11) NOT NULL,
  `key_limit` int(11) NOT NULL,
  `webhook_limit` int(11) NOT NULL,
  `action_limit` int(11) NOT NULL,
  `scheduled_limit` int(11) NOT NULL,
  `wa_send_limit` int(11) NOT NULL,
  `wa_receive_limit` int(11) NOT NULL,
  `wa_account_limit` int(11) NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `footermark` tinyint(4) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `packages` (`id`, `send_limit`, `receive_limit`, `ussd_limit`, `notification_limit`, `contact_limit`, `device_limit`, `key_limit`, `webhook_limit`, `action_limit`, `scheduled_limit`, `wa_send_limit`, `wa_receive_limit`, `wa_account_limit`, `name`, `price`, `footermark`, `hidden`, `create_date`) VALUES
(1, 1000, 250,  0,  0,  50, 3,  5,  5,  0,  0,  0,  0,  0,  'Starter',  0,  1,  2,  '2020-04-09 02:26:47'),
(2, 3000, 1500, 0,  0,  3000, 30, 10, 5,  0,  0,  0,  0,  0,  'Professional', 12, 2,  2,  '2020-04-20 22:35:58'),
(3, 10000,  7000, 0,  0,  300,  50, 25, 15, 0,  0,  0,  0,  0,  'Enterprise', 30, 2,  2,  '2020-04-20 22:36:33');

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `logged` tinyint(4) NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pages` (`id`, `roles`, `slug`, `logged`, `name`, `content`, `create_date`) VALUES
(3, '1',  'about',  2,  'About',  '&lt;p&gt;The growth of virtual items and microtransactions have been enormous over the last few years. The prices for these items or microtransactions are often twice the price of the game itself. We understand people want these\r\n    exclusive in-game rewards, but we also see how they are too expensive for many. Therefore we came up with the idea, {system_site_name}.\r\n&lt;/p&gt;\r\n&lt;p&gt;We started providing a service directly targeted towards the game Counter-Strike: Global Offensive, however, we quickly came to realize this had the potential to reach a much broader audience. Now we have expanded our service\r\n    for not only gamers, but also others that want gift cards to shop at their favorite place, cryptocurrencies to start their crypto adventure, or just direct PayPal cash to spend on whatever you want.&lt;/p&gt;\r\n&lt;p&gt;We’re excited for what the future has to bring, and we will continuously be pushing out updates and new features to keep {system_site_name} the leading platform in the GPT industry\r\n&lt;/p&gt;\r\n&lt;p&gt;The growth of virtual items and microtransactions have been enormous over the last few years. The prices for these items or microtransactions are often twice the price of the game itself. We understand people want these\r\n    exclusive in-game rewards, but we also see how they are too expensive for many. Therefore we came up with the idea, {system_site_name}.\r\n&lt;/p&gt;',  '2022-01-26 01:12:05'),
(4, '1',  'terms-of-service', 2,  'Terms of Service', '&lt;h3&gt;Terms of Service : &lt;/h3&gt;\r\n  &lt;p&gt;By using {system_site_name} you agree to and are bound by these Terms and Conditions in their entirety and, without reservation, all applicable laws and regulations, and you agree that you are responsible for compliance with\r\n      any applicable laws. These Terms of Service govern your use of this website. If you do not agree with any of these terms, you are prohibited from using {system_site_name}.\r\n  &lt;/p&gt;\r\n\r\n\r\n  &lt;h3&gt;Acceptable use : &lt;/h3&gt;\r\n  &lt;ul&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;You must not use {system_site_name} in any way that can cause damage to {system_site_name} or in any way which is unlawful, illegal, fraudulent or harmful, or in connection with any illegal, fraudulent, or harmful activity.\r\n          &lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;You must not use this website to send any sort of commercial communications.\r\n          &lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;You must not use this website for any purposes related to marketing without the permission of {system_site_name}.&lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;You must not use this website to publish or distribute any material which consists of (or is linked to) any spyware, computer virus, Trojan horse, worm, keylogger, rootkit, or other malicious software.&lt;/p&gt;\r\n      &lt;/li&gt;\r\n  &lt;/ul&gt;\r\n\r\n  &lt;h3&gt;Membership : &lt;/h3&gt;\r\n  &lt;ul&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;Users must be 18 years old and above or 13 years to 18 years old with parental permission. A user between the ages of 13 to 18 certifies that a parent has given permission before signing up. &lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;Users must provide valid and truthful information during all stages. &lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;Users must not create more than one account per person, as having multiple accounts may result in all accounts being suspended and all points forfeited\r\n          &lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;Users must not use a proxy or attempt to mask or reroute their internet connection. That will result in your all accounts being suspended.&lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;Account balance may not be transferred, exchanged, sold, or otherwise change ownership under any circumstances, except by {system_site_name}&lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;We reserve the right to close your account, and forfeit any points, if you have violated our terms of service agreement. &lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;We reserve the right to close your account due to inactivity of 9 or more months. An inactive account is defined as an account that has not earned any gems for 9 or more months&lt;/p&gt;\r\n      &lt;/li&gt;\r\n  &lt;/ul&gt;\r\n\r\n  &lt;h3&gt;Indemnity : &lt;/h3&gt;\r\n  &lt;p&gt;You hereby indemnify {system_site_name} and undertake to keep {system_site_name} indemnified against any losses, damages, costs, liabilities, and/or expenses (including without limitation legal expenses) and any amounts paid by {system_site_name}\r\n      to a third party in settlement of a claim or dispute on the advice of {system_site_name}’s legal advisers) incurred or suffered by {system_site_name} arising out of any breach by you of any provision of these terms and conditions,\r\n      or arising out of any claim that you have breachedany provision of these terms and conditions.\r\n  &lt;/p&gt;\r\n\r\n  &lt;h3&gt;No warranties : &lt;/h3&gt;\r\n  &lt;p&gt;{system_site_name} is provided “as is” without any representations or warranties. {system_site_name} makes no representations or warranties in relation to this website or the information and materials provided on this website.&lt;/p&gt;\r\n  &lt;p&gt;{system_site_name} does not warrant that:&lt;/p&gt;\r\n\r\n  &lt;ul&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;The website will be constantly available, or available at all moving forward.\r\n          &lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;The information on this website is complete, true, or non-misleading.&lt;/p&gt;\r\n      &lt;/li&gt;\r\n  &lt;/ul&gt;\r\n\r\n  &lt;h3&gt;Privacy : &lt;/h3&gt;\r\n  &lt;p&gt;For details about our privacy policy, please refer to the privacy policy section.&lt;/p&gt;\r\n\r\n  &lt;h3&gt;Unenforceable provisions : &lt;/h3&gt;\r\n  &lt;p&gt;If any provision of this website disclaimer is, or is found to be, unenforceable under applicable law, that will not affect the enforceability of the other provisions of this website disclaimer.&lt;/p&gt;\r\n\r\n  &lt;h3&gt;Links : &lt;/h3&gt;\r\n  &lt;p&gt;Responsibility for the content of external links (to web pages of third parties) lies solely with the operators of the linked pages.&lt;/p&gt;\r\n\r\n  &lt;h3&gt;Modifications: &lt;/h3&gt;\r\n  &lt;p&gt;{system_site_name} may revise these terms of use for its website at any time without notice. By using this web site you are agreeing to be bound by the then current version of these terms of service.&lt;/p&gt;\r\n\r\n  &lt;h3&gt;Breaches of these terms and conditions: &lt;/h3&gt;\r\n  &lt;ul&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;{system_site_name} reserves the rights under these terms and conditions to take action if you breach these terms and conditions in any way. &lt;/p&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n          &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n          &lt;p&gt;{system_site_name} may take such action as seems appropriate to deal with the breach, including suspending your access to the website, suspending your earnings made trough {system_site_name},prohibiting you from accessing the\r\n              website, or bringing court proceedings against you.&lt;/p&gt;\r\n      &lt;/li&gt;\r\n  &lt;/ul&gt;', '2022-01-26 01:12:26'),
(5, '1',  'privacy-policy', 2,  'Privacy Policy', '&lt;h3&gt;Your privacy is important to us: &lt;/h3&gt;\r\n&lt;p&gt;Therefore, we guarantee that:&lt;/p&gt;\r\n&lt;ul&gt;\r\n    &lt;li&gt;\r\n        &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n        &lt;p&gt;We do not rent or sell your personal information to anyone.&lt;/p&gt;\r\n    &lt;/li&gt;\r\n    &lt;li&gt;\r\n        &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n        &lt;p&gt;Any personal information you provide will be secured by us.&lt;/p&gt;\r\n    &lt;/li&gt;\r\n    &lt;li&gt;\r\n        &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n        &lt;p&gt;You will be able to erase all the data we have stored on you at any given time. To request data termination, please contact our customer support.&lt;/p&gt;\r\n    &lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;h3&gt;Third-party services: &lt;/h3&gt;\r\n&lt;p&gt;We use third-party services in order to operate our website. Please note that these services may contain links to third-party apps, websites or services that are not operated by us. We make no representation or warranties\r\n    with regard to and are not responsible for the content, functionality, legality, security, accuracy, or other aspects of such third-party apps, websites or services. Note that, when accessing and/or using these third-party\r\n    services, their own privacy policy may apply.&lt;/p&gt;\r\n\r\n&lt;h3&gt;Google Analytics: &lt;/h3&gt;\r\n&lt;p&gt;This website uses Google Analytics, a web analytics service provided by Google, Inc. (“Google”). Google Analytics uses “cookies”, which are text files placed on your computer, to help the website analyze how users use the\r\n    site. The information generated by the cookie about your use of the website will be transmitted to and stored by Google on servers in the United States . In case IP-anonymisation is activated on this website, your IP\r\n    address will be truncated within the area of Member States of the European Union or other parties to the Agreement on the European Economic Area. Only in exceptional cases the whole IP address will be first transferred\r\n    to a Google server in the USA and truncated there. The IP-anonymisation is active on this website. Google will use this information on behalf of the operator of this website for the purpose of evaluating your use of\r\n    the website, compiling reports on website activity for website operators and providing them other services relating to website activity and internet usage. The IP-address, that your Browser conveys within the scope\r\n    of Google Analytics, will not be associated with any other data held by Google. You may refuse the use of cookies by selecting the appropriate settings on your browser, however please note that if you do this you may\r\n    not be able to use the full functionality of {system_site_name}. You can also opt-out from being tracked by Google Analytics with effect for the future by downloading and installing Google Analytics Opt-out Browser Addon\r\n    for your current web browser: https://tools.google.com/dlpage/gaoptout?hl=en.\r\n&lt;/p&gt;\r\n\r\n&lt;h3&gt;Information we collect: &lt;/h3&gt;\r\n&lt;p&gt;Information we collect: &lt;/p&gt;\r\n&lt;ul&gt;\r\n    &lt;li&gt;\r\n        &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n        &lt;p&gt;Google ID (to identify you in our database)&lt;/p&gt;\r\n    &lt;/li&gt;\r\n    &lt;li&gt;\r\n        &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n        &lt;p&gt;Google First &amp;amp; Last name&lt;/p&gt;\r\n    &lt;/li&gt;\r\n    &lt;li&gt;\r\n        &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n        &lt;p&gt;Google Email&lt;/p&gt;\r\n    &lt;/li&gt;\r\n    &lt;li&gt;\r\n        &lt;i class=&quot;fa fa-circle&quot;&gt;&lt;/i&gt;\r\n        &lt;p&gt;Google avatar image&lt;/p&gt;\r\n    &lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;We do not collect passwords or any other sensitive information.&lt;/p&gt;', '2022-01-26 01:13:17');

DROP TABLE IF EXISTS `payouts`;
CREATE TABLE `payouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `currency` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `plugins`;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `quota`;
CREATE TABLE `quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `sent` int(11) NOT NULL,
  `received` int(11) NOT NULL,
  `wa_sent` int(11) NOT NULL,
  `wa_received` int(11) NOT NULL,
  `ussd` int(11) NOT NULL,
  `notifications` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `received`;
CREATE TABLE `received` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `did` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slot` tinyint(4) NOT NULL,
  `phone` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `permissions`) VALUES
(1, 'Default',  '');

DROP TABLE IF EXISTS `scheduled`;
CREATE TABLE `scheduled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `did` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sim` tinyint(4) NOT NULL,
  `mode` tinyint(4) NOT NULL,
  `gateway` int(11) NOT NULL,
  `groups` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `numbers` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `repeat` int(11) NOT NULL,
  `last_send` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_date` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sent`;
CREATE TABLE `sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `did` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway` int(11) NOT NULL,
  `api` tinyint(4) NOT NULL,
  `sim` tinyint(4) NOT NULL,
  `mode` tinyint(4) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `phone` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `status_code` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'site_name',  'Zender'),
(2, 'site_desc',  'Site description'),
(3, 'purchase_code',  ''),
(4, 'default_lang', '1'),
(5, 'registrations',  '1'),
(6, 'mail_function',  '1'),
(7, 'site_mail',  'noreply@yourdomain.com'),
(8, 'smtp_host',  ''),
(9, 'smtp_port',  ''),
(10,  'smtp_username',  ''),
(11,  'smtp_password',  ''),
(12,  'paypal_email', ''),
(16,  'recaptcha_key',  ''),
(17,  'recaptcha_secret', ''),
(18,  'package_name', 'com.zender.gateway'),
(19,  'app_name', 'Zender Gateway'),
(20,  'app_desc', 'The awesome app!'),
(21,  'app_color',  '#003853'),
(25,  'protocol', '1'),
(26,  'paypal_test',  '1'),
(28,  'theme_background', '#003853'),
(29,  'theme_highlight',  '#ffffff'),
(31,  'mollie_key', ''),
(32,  'currency', 'USD'),
(33,  'providers',  'bank'),
(34,  'livechat', '2'),
(35,  'analytics_key',  ''),
(36,  'tawk_id',  ''),
(38,  'sent_limit', '10'),
(39,  'received_limit', '10'),
(42,  'message_min',  '5'),
(43,  'message_max',  '0'),
(44,  'message_mark', 'Sent by Zender'),
(45,  'smtp_secure',  '1'),
(46,  'facebook_id',  ''),
(47,  'facebook_secret',  ''),
(48,  'google_id',  ''),
(49,  'google_secret',  ''),
(50,  'vk_id',  ''),
(51,  'vk_secret',  ''),
(52,  'social_auth',  '2'),
(53,  'social_platforms', 'facebook,google,vk'),
(56,  'homepage', '1'),
(57,  'apk_version',  '1'),
(58,  'freemodel',  '1'),
(59,  'reset_mode', '1'),
(60,  'theme_spinner',  '#ffffff'),
(61,  'admin_api',  '0'),
(62,  'app_icon_remote',  ''),
(63,  'app_splash_remote',  ''),
(64,  'app_logo_remote',  ''),
(65,  'app_loginlogo_remote', ''),
(66,  'app_js', ''),
(67,  'app_css',  ''),
(68,  'app_layout', ''),
(69,  'build_email',  'validemail@gmail.com'),
(70,  'bank_template',  'Hi <strong>{{user.name}}</strong>!\r\nPlease pay <strong>{{order.price}}</strong> in the bank address below:\r\n<code>\r\nBank: BDO UNIBANK, INC.\r\nSwift: BNORPHMM\r\n</code>\r\n1. After paying, please send us the order details with the following format:\r\n<code>\r\nOrder Type: <strong>Package</strong> or <strong>Credits</strong>\r\nOrder Name: <strong>Package name</strong> or <strong>Credits</strong>\r\nAmount: <strong>Month duration</strong> or <strong>Credit amount</strong>\r\n</code>\r\nThen attached the receipt image. Please use your registered email ({{user.email}}) for sending this message.\r\n\r\n2. After we confirm the payment, we will apply your package subscription or credits.\r\n\r\nThank you!'),
(71,  'auth_redirect',  '1'),
(72,  'default_country',  'PH'),
(73,  'default_timezone', 'asia/manila'),
(74,  'mailing_triggers', '0'),
(75,  'recaptcha',  '2'),
(76,  'mailing_address',  ''),
(77,  'wa_server',  ''),
(78,  'wa_port',  '7001'),
(79,  'partner_commission', '5'),
(80,  'partner_minimum',  '50');

DROP TABLE IF EXISTS `shorteners`;
CREATE TABLE `shorteners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `currency` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` tinyint(4) NOT NULL,
  `provider` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `unsubscribed`;
CREATE TABLE `unsubscribed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `phone` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) NOT NULL,
  `email` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `credits` float NOT NULL,
  `earnings` float NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` tinyint(4) NOT NULL,
  `providers` longtext COLLATE utf8mb4_unicode_ci,
  `alertsound` tinyint(4) NOT NULL,
  `suspended` tinyint(4) NOT NULL,
  `timezone` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `formatting` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner` tinyint(4) NOT NULL,
  `confirmed` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ussd`;
CREATE TABLE `ussd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `did` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sim` tinyint(4) NOT NULL,
  `code` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `utilities`;
CREATE TABLE `utilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `os` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package` int(11) NOT NULL,
  `code` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wa_accounts`;
CREATE TABLE `wa_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `wid` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_chats` tinyint(4) NOT NULL,
  `random_send` tinyint(4) NOT NULL,
  `random_min` int(11) NOT NULL,
  `random_max` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wa_campaigns`;
CREATE TABLE `wa_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `wid` tinytext NOT NULL,
  `type` tinytext NOT NULL,
  `status` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `contacts` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `wa_campaigns`
ADD `processed` int(11) NOT NULL AFTER `contacts`;

DROP TABLE IF EXISTS `wa_groups`;
CREATE TABLE `wa_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `wid` tinytext NOT NULL,
  `gid` tinytext NOT NULL,
  `name` tinytext NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wa_received`;
CREATE TABLE `wa_received` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `wid` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wa_scheduled`;
CREATE TABLE `wa_scheduled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `wid` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `repeat` int(11) NOT NULL,
  `groups` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `numbers` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_send` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_date` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wa_sent`;
CREATE TABLE `wa_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `wid` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `api` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `wa_sent`
ADD `priority` tinyint(4) NOT NULL AFTER `status`;

DROP TABLE IF EXISTS `webhooks`;
CREATE TABLE `webhooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `events` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `size` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wa_servers`;
CREATE TABLE `wa_servers` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` text NOT NULL,
  `url` text NOT NULL,
  `port` tinytext NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE `wa_servers`
ADD `accounts` int NOT NULL AFTER `port`,
ADD `packages` text COLLATE 'utf8mb4_unicode_ci' NOT NULL AFTER `accounts`;

ALTER TABLE `wa_servers`
ADD `secret` text NOT NULL AFTER `id`;

ALTER TABLE `wa_accounts`
ADD `wsid` int NOT NULL AFTER `uid`;

ALTER TABLE `wa_campaigns`
ADD `unique` text COLLATE 'utf8_general_ci' NOT NULL AFTER `wid`;

ALTER TABLE `wa_groups`
ADD `unique` text COLLATE 'utf8_general_ci' NOT NULL AFTER `wid`;

DELETE FROM `settings`
WHERE ((`name` = 'vk_id') OR (`name` = 'vk_secret'));

DELETE FROM `settings`
WHERE ((`name` = 'wa_server') OR (`name` = 'wa_port'));

ALTER TABLE `actions`
ADD `priority` tinyint(4) NOT NULL AFTER `event`;

ALTER TABLE `actions`
ADD `match` tinyint(4) NOT NULL AFTER `priority`;

ALTER TABLE `actions`
ADD `sim` tinyint(4) NOT NULL AFTER `match`;

ALTER TABLE `actions`
ADD `device` text NOT NULL AFTER `sim`,
ADD `account` text NOT NULL AFTER `device`;

ALTER TABLE `transactions`
CHANGE `duration` `duration` int NOT NULL AFTER `currency`;

TRUNCATE TABLE `plugins`;

ALTER TABLE `plugins`
CHANGE `name` `name` text COLLATE 'utf8mb4_unicode_ci' NOT NULL AFTER `id`,
ADD `directory` text COLLATE 'utf8mb4_unicode_ci' NOT NULL AFTER `name`;

ALTER TABLE `transactions`
ADD `txn` text COLLATE 'utf8mb4_unicode_ci' NOT NULL AFTER `provider`;

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `uid` int NOT NULL,
  `data` int NOT NULL,
  `create_date` datetime NOT NULL
) COLLATE 'utf8mb4_unicode_ci';

ALTER TABLE `orders`
CHANGE `data` `data` longtext NOT NULL AFTER `uid`;

DELETE FROM settings WHERE name = 'paypal_email';
DELETE FROM settings WHERE name = 'paypal_test';
DELETE FROM settings WHERE name = 'mollie_key';
DELETE FROM settings WHERE name = 'providers';

INSERT INTO `settings` (`name`, `value`)
VALUES ('offline_payment', '1');

CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` tinytext NOT NULL,
  `task` longtext NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) COLLATE 'utf8mb4_unicode_ci';

ALTER TABLE `visitors`
ADD `ip` tinytext NOT NULL AFTER `id`;

INSERT INTO `settings` (`name`, `value`)
VALUES ('default_scheme', 'light');

ALTER TABLE `users`
ADD `theme_color` tinytext NOT NULL AFTER `language`;

ALTER TABLE `orders`
CHANGE `create_date` `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `data`;