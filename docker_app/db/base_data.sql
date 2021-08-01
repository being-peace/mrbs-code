-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Erstellungszeit: 01. Aug 2021 um 22:31
-- Server-Version: 8.0.26
-- PHP-Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mrbs`
--

--
-- Daten für Tabelle `mrbs_area`
--

INSERT INTO `mrbs_area` (`id`, `disabled`, `area_name`, `sort_key`, `timezone`, `area_admin_email`, `resolution`, `default_duration`, `default_duration_all_day`, `morningstarts`, `morningstarts_minutes`, `eveningends`, `eveningends_minutes`, `private_enabled`, `private_default`, `private_mandatory`, `private_override`, `min_create_ahead_enabled`, `min_create_ahead_secs`, `max_create_ahead_enabled`, `max_create_ahead_secs`, `min_delete_ahead_enabled`, `min_delete_ahead_secs`, `max_delete_ahead_enabled`, `max_delete_ahead_secs`, `max_per_day_enabled`, `max_per_day`, `max_per_week_enabled`, `max_per_week`, `max_per_month_enabled`, `max_per_month`, `max_per_year_enabled`, `max_per_year`, `max_per_future_enabled`, `max_per_future`, `max_secs_per_day_enabled`, `max_secs_per_day`, `max_secs_per_week_enabled`, `max_secs_per_week`, `max_secs_per_month_enabled`, `max_secs_per_month`, `max_secs_per_year_enabled`, `max_secs_per_year`, `max_secs_per_future_enabled`, `max_secs_per_future`, `max_duration_enabled`, `max_duration_secs`, `max_duration_periods`, `custom_html`, `approval_enabled`, `reminders_enabled`, `enable_periods`, `periods`, `confirmation_enabled`, `confirmed_default`, `times_along_top`, `default_type`) VALUES
(1, 0, 'Test', 'Test', 'Europe/London', NULL, 1800, 3600, 0, 7, 0, 18, 30, 0, 0, 0, 'none', 0, 0, 0, 604800, 0, 0, 0, 604800, 0, 1, 0, 5, 0, 10, 0, 50, 0, 100, 0, 7200, 0, 36000, 0, 90000, 0, 360000, 0, 360000, 0, 7200, 2, NULL, 0, 1, 0, '[\"Period 1\",\"Period 2\"]', 1, 1, 0, 'I');


--
-- Daten für Tabelle `mrbs_room`
--

INSERT INTO `mrbs_room` (`id`, `disabled`, `area_id`, `room_name`, `sort_key`, `description`, `capacity`, `room_admin_email`, `invalid_types`, `custom_html`) VALUES
(1, 0, 1, 'E-Up', 'E-Up', '', 0, '', NULL, NULL),
(2, 0, 1, 'ION', 'ION', '', 0, '', NULL, NULL),
(3, 0, 1, 'Lupo', 'Lupo', '', 0, '', NULL, NULL),
(4, 0, 1, 'Volvo', 'Volvo', '', 0, '', NULL, NULL);

--
-- Daten für Tabelle `mrbs_users`
--

INSERT INTO `mrbs_users` (`id`, `level`, `name`, `display_name`, `password_hash`, `email`, `timestamp`, `last_login`, `reset_key_hash`, `reset_key_expiry`) VALUES
(1, 2, 'admin', 'admin', '$2y$10$zFIq60dpGRGMmf6wFIlCcOloI9JLY/ygI3Q/KV/0prU1lQi2WC2xu', '', '2021-08-01 22:02:59', 1627856055, NULL, 0),
(2, 1, 'test', 'test', '$2y$10$ht00KbBu7uGpK2iEBWH7UOEzHo3OW4qHJjAcJpb1wtT1h8.ortP.m', '', '2021-08-01 22:30:13', 0, NULL, 0);

--
-- Daten für Tabelle `mrbs_repeat`
--

INSERT INTO `mrbs_repeat` (`id`, `start_time`, `end_time`, `rep_type`, `end_date`, `rep_opt`, `room_id`, `timestamp`, `create_by`, `modified_by`, `name`, `type`, `description`, `rep_interval`, `month_absolute`, `month_relative`, `status`, `reminded`, `info_time`, `info_user`, `info_text`, `ical_uid`, `ical_sequence`) VALUES
(1, 1627804800, 1627810200, 1, 1631174400, '0', 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0),
(2, 1627804800, 1627810200, 1, 1631174400, '0', 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0);

--
-- Daten für Tabelle `mrbs_entry`
--

INSERT INTO `mrbs_entry` (`id`, `start_time`, `end_time`, `entry_type`, `repeat_id`, `room_id`, `timestamp`, `create_by`, `modified_by`, `name`, `type`, `description`, `status`, `reminded`, `info_time`, `info_user`, `info_text`, `ical_uid`, `ical_sequence`, `ical_recur_id`, `allow_registration`, `registrant_limit`, `registrant_limit_enabled`, `registration_opens`, `registration_opens_enabled`, `registration_closes`, `registration_closes_enabled`) VALUES
(1, 1627804800, 1627810200, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210801T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(2, 1627891200, 1627896600, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210802T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(3, 1627977600, 1627983000, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210803T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(4, 1628064000, 1628069400, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210804T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(5, 1628150400, 1628155800, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210805T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(6, 1628236800, 1628242200, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210806T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(7, 1628323200, 1628328600, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210807T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(8, 1628409600, 1628415000, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210808T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(9, 1628496000, 1628501400, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210809T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(10, 1628582400, 1628587800, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210810T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(11, 1628668800, 1628674200, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210811T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(12, 1628755200, 1628760600, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210812T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(13, 1628841600, 1628847000, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210813T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(14, 1628928000, 1628933400, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210814T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(15, 1629014400, 1629019800, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210815T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(16, 1629100800, 1629106200, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210816T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(17, 1629187200, 1629192600, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210817T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(18, 1629273600, 1629279000, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210818T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(19, 1629360000, 1629365400, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210819T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(20, 1629446400, 1629451800, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210820T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(21, 1629532800, 1629538200, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210821T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(22, 1629619200, 1629624600, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210822T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(23, 1629705600, 1629711000, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210823T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(24, 1629792000, 1629797400, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210824T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(25, 1629878400, 1629883800, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210825T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(26, 1629964800, 1629970200, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210826T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(27, 1630051200, 1630056600, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210827T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(28, 1630137600, 1630143000, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210828T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(29, 1630224000, 1630229400, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210829T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(30, 1630310400, 1630315800, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210830T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(31, 1630396800, 1630402200, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210831T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(32, 1630483200, 1630488600, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210901T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(33, 1630569600, 1630575000, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210902T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(34, 1630656000, 1630661400, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210903T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(35, 1630742400, 1630747800, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210904T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(36, 1630828800, 1630834200, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210905T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(37, 1630915200, 1630920600, 1, 1, 1, '2021-08-01 22:20:46', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210906T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(38, 1631001600, 1631007000, 1, 1, 1, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210907T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(39, 1631088000, 1631093400, 1, 1, 1, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210908T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(40, 1631174400, 1631179800, 1, 1, 1, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3ec8efe-57c8715f@localhost', 0, '20210909T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(41, 1627804800, 1627810200, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210801T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(42, 1627891200, 1627896600, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210802T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(43, 1627977600, 1627983000, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210803T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(44, 1628064000, 1628069400, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210804T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(45, 1628150400, 1628155800, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210805T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(46, 1628236800, 1628242200, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210806T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(47, 1628323200, 1628328600, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210807T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(48, 1628409600, 1628415000, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210808T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(49, 1628496000, 1628501400, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210809T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(50, 1628582400, 1628587800, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210810T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(51, 1628668800, 1628674200, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210811T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(52, 1628755200, 1628760600, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210812T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(53, 1628841600, 1628847000, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210813T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(54, 1628928000, 1628933400, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210814T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(55, 1629014400, 1629019800, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210815T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(56, 1629100800, 1629106200, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210816T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(57, 1629187200, 1629192600, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210817T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(58, 1629273600, 1629279000, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210818T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(59, 1629360000, 1629365400, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210819T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(60, 1629446400, 1629451800, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210820T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(61, 1629532800, 1629538200, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210821T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(62, 1629619200, 1629624600, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210822T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(63, 1629705600, 1629711000, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210823T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(64, 1629792000, 1629797400, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210824T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(65, 1629878400, 1629883800, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210825T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(66, 1629964800, 1629970200, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210826T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(67, 1630051200, 1630056600, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210827T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(68, 1630137600, 1630143000, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210828T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(69, 1630224000, 1630229400, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210829T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(70, 1630310400, 1630315800, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210830T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(71, 1630396800, 1630402200, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210831T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(72, 1630483200, 1630488600, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210901T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(73, 1630569600, 1630575000, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210902T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(74, 1630656000, 1630661400, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210903T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(75, 1630742400, 1630747800, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210904T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(76, 1630828800, 1630834200, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210905T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(77, 1630915200, 1630920600, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210906T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(78, 1631001600, 1631007000, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210907T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(79, 1631088000, 1631093400, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210908T080000Z', 0, 0, 0, 1209600, 0, 0, 0),
(80, 1631174400, 1631179800, 1, 2, 2, '2021-08-01 22:20:47', 'admin', '', 'Test', 'I', '', 0, NULL, NULL, NULL, NULL, 'MRBS-61071e3f0284d-ebc70683@localhost', 0, '20210909T080000Z', 0, 0, 0, 1209600, 0, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
