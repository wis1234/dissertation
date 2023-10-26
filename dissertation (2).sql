-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 24 oct. 2023 à 14:35
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dissertation`
--

-- --------------------------------------------------------

--
-- Structure de la table `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ac_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speciality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bulletin1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bulletin2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `certificates`
--

INSERT INTO `certificates` (`id`, `user_id`, `ac_year`, `ac_level`, `mat`, `exam_type`, `field`, `speciality`, `description`, `bulletin1`, `bulletin2`, `created_at`, `updated_at`, `firstname`, `lastname`, `email`, `phone`) VALUES
(1, 1, '2022-2023', 'Licence 1', '17104018', NULL, 'Sciences Economiques', 'Economie Appliquée', 'you', 'bulletin1/AiuJ190CMSAjmYP44kLzO1EC6eWJSZQ9Zlu0shT1.jpg', 'bulletin2/nzhVkUJQdvIRX5NfcNpyICI0uc4nFNuh3cuHNQLV.jpg', '2023-10-24 09:56:51', '2023-10-24 09:56:51', 'Emma', 'Smith', 'emm@example.com', '1234567890'),
(2, 1, '2022-2023', 'Licence 1', '17104018', NULL, 'Sciences Economiques', 'Economie Appliquée', 'you 2', 'bulletin1/40kpJrsKHKRTJlQtH2S2sOGizMxqPIyeR5kSx0fR.jpg', 'bulletin2/GzxVv7PC25PHEXFMHwwWPDZpkzSVgWN6FdI3BZC1.jpg', '2023-10-24 10:02:01', '2023-10-24 10:02:01', 'Emma', 'Smith', 'emm@example.com', '1234567890');

-- --------------------------------------------------------

--
-- Structure de la table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `claimant_firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claimant_lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claimant_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claimant_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speciality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complain_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ecue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ecue_sub` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiche_inscription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_proof` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `complaints`
--

INSERT INTO `complaints` (`id`, `student_id`, `claimant_firstname`, `claimant_lastname`, `claimant_phone`, `claimant_email`, `ac_year`, `ac_level`, `mat`, `field`, `speciality`, `exam_type`, `complain_type`, `ecue`, `ecue_sub`, `fiche_inscription`, `payment_proof`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 14:49:55', '2023-09-04 14:49:55'),
(2, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 14:55:12', '2023-09-04 14:55:12'),
(3, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 15:03:54', '2023-09-04 15:03:54'),
(4, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 15:06:56', '2023-09-04 15:06:56'),
(5, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 15:25:15', '2023-09-04 15:25:15'),
(6, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 15:33:44', '2023-09-04 15:33:44'),
(7, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 15:59:33', '2023-09-04 15:59:33'),
(8, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 16:03:44', '2023-09-04 16:03:44'),
(9, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 16:10:00', '2023-09-04 16:10:00'),
(10, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 16:10:56', '2023-09-04 16:10:56'),
(11, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 16:11:52', '2023-09-04 16:11:52'),
(12, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 16:17:52', '2023-09-04 16:17:52'),
(13, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-04 16:24:08', '2023-09-04 16:24:08'),
(14, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2023-2024', 'Licence 2', '17104018', 'Sciences Economiques', 'Economie et Finance des Collectivités Locales', 'session de rattrapage', 'Omission de note', 'Macro3', 'MACRO', '', '', 'Test purpose', '2023-09-04 16:41:07', '2023-09-04 16:41:07'),
(15, 2, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', '2023-2024', 'Licence 3', '12345678', 'Sciences Economiques', 'Economie et Finance des Collectivités Locales', 'session de rattrapage', 'Contestation de note', 'Macro1', 'Macro', '', '', 'Je ne suis pas d’accord avec ma note', '2023-09-04 17:01:54', '2023-09-04 17:01:54'),
(16, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2023-2024', 'Licence 3', '17104018', 'field', 'Economie et Gestion des Exploitations Agricoles', 'session de rattrapage', 'Omission de note', 'stat', 'mi', '', '', 'go', '2023-09-04 17:30:35', '2023-09-04 17:30:35'),
(17, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2024-2025', 'Licence 3', '17104018', 'field', 'Economie et Finance des Collectivités Locales', 'session de rattrapage', 'Omission de note', 'Macro1', 'Macro', '', '', 'Test purpose', '2023-09-04 18:43:11', '2023-09-04 18:43:11'),
(18, 2, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', '2023-2023', 'Licence 3', '12345678', 'Sciences Economiques', 'Economie et Finance des Collectivités Locales', 'session de rattrapage', 'Omission de note', 'Informatique appliquée', 'Math Info', '', '', 'Test this', '2023-09-04 19:13:18', '2023-09-04 19:13:18'),
(19, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2023-2024', 'Licence 3', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session de rattrapage', 'Omission de note', 'Droit des TICs', 'Droit', '', '', 'Ma note n\'est affichée sur la liste de la délibération.', '2023-09-05 18:43:57', '2023-09-05 18:43:57'),
(20, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2023-2024', 'Licence 3', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session de rattrapage', 'Omission de note', 'Droit des TICs', 'Droit', '', '', 'Ma note n\'est affichée sur la liste de la délibération.', '2023-09-05 18:46:20', '2023-09-05 18:46:20'),
(21, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2024-2925', 'Licence 3', '17104018', 'field', 'Gestion des ressources humaines', 'session normale', 'Contestation de note', 'Comptabilité générale', 'Gestion avancée', '', '', 'Je ne suis pas d’accord avec ma note. Je mérite mieux', '2023-09-06 10:58:28', '2023-09-06 10:58:28'),
(22, 4, 'Epiphane', 'HONVO', '+22966154804', 'honvoeiphane@gmail.com', '2022-2023', 'Licence 1', '13872320', 'field', 'Statistique et Econometrie', 'session normale', 'Omission de note', 'Vfjkvjl\'bj', 'Etcigj', '', '', 'Hggjjjjj', '2023-09-06 17:31:37', '2023-09-06 17:31:37'),
(23, 4, 'Epiphane', 'HONVO', '+22966154804', 'honvoeiphane@gmail.com', '2022-2023', 'Licence 1', '13872320', 'Sciences Economiques', 'Tronc commun de Licence 1', 'session normale', 'Contestation de note', 'Yghnkhhk', 'Ghfhk', '', '', 'Hgjjhjkknbj', '2023-09-06 17:43:16', '2023-09-06 17:43:16'),
(24, 5, 'Rosaline', 'Tchoumado', '69750515', 'tchoumadorrosaline@gmail.com', '2021-2022', 'Licence 3', '19409719', 'Sciences Economiques', 'Comptabilité et Finance', 'session de rattrapage', 'Omission de note', 'Economie', '1', '', '', 'Defaillance', '2023-09-06 18:57:09', '2023-09-06 18:57:09'),
(25, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2023-2024', 'Licence 3', '17104018', 'field', 'Economie et Gestion des Micro-Finances', 'session de rattrapage', 'Omission de note', 'Gdh', 'Bgi', '', '', 'Test', '2023-09-07 19:35:23', '2023-09-07 19:35:23'),
(26, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2023-2024', 'Licence 2', '17104018', 'Sciences Economiques', 'Comptabilité et Finance', 'session de rattrapage', 'Omission de note', 'Anglais', 'Droit', '', '', 'go here', '2023-09-12 08:29:43', '2023-09-12 08:29:43'),
(27, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 2', '17104018', 'Sciences Economiques', 'Economie et Finance des Collectivités Locales', 'session normale', 'Contestation de note', 'Ut', 'Ty', '', '', 'Je ne suis pas d’accord avec ma note', '2023-09-12 09:05:12', '2023-09-12 09:05:12'),
(28, 10, 'De', 'De', '623544525', 'de@gmail.com', '2022-2023', 'Licence 3', '000000', 'field', 'Gestion des ressources humaines', 'session de rattrapage', 'Omission de note', 'Macro', 'ECONOMICS', '', '', 'Je n’ai vu pas vu ma note sur la liste', '2023-09-13 17:10:42', '2023-09-13 17:10:42'),
(29, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 2', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session de rattrapage', 'Omission de note', 'Macro economie avancée de developpement', 'MACRO', '', '', 'wanna give a try to the plateform', '2023-09-18 15:19:09', '2023-09-18 15:19:09'),
(30, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2023-2024', 'Licence 2', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Omission de note', 'statistics', 'ECONOMETRICS', '', '', 'Can\'t see my grade', '2023-09-20 07:35:34', '2023-09-20 07:35:34'),
(31, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'd', 'D', '', '', 'Do it', '2023-09-21 17:05:07', '2023-09-21 17:05:07'),
(32, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'g', 'G', '', '', 'G', '2023-09-21 17:18:27', '2023-09-21 17:18:27'),
(33, 12, 'Mathilde', 'DAAH-HOUEDJI', '53989380', 'mathildedaah@gmail.com', '2022-2023', 'Licence 1', '14272021', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'Anglais', 'Droit', '', '', 'j', '2023-09-21 18:30:51', '2023-09-21 18:30:51'),
(34, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'Anglais', 'Droit', '', '', 'k', '2023-09-26 12:32:11', '2023-09-26 12:32:11'),
(35, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'stat', 'mi', '', '', 'l', '2023-09-26 12:38:23', '2023-09-26 12:38:23'),
(36, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:00:50', '2023-09-30 12:00:50'),
(37, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:07:00', '2023-09-30 12:07:00'),
(38, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:12:21', '2023-09-30 12:12:21'),
(39, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:19:47', '2023-09-30 12:19:47'),
(40, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:23:30', '2023-09-30 12:23:30'),
(41, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:26:39', '2023-09-30 12:26:39'),
(42, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:27:15', '2023-09-30 12:27:15'),
(43, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:31:51', '2023-09-30 12:31:51'),
(44, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:42:38', '2023-09-30 12:42:38'),
(45, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:45:09', '2023-09-30 12:45:09'),
(46, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 12:46:12', '2023-09-30 12:46:12'),
(47, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 13:01:31', '2023-09-30 13:01:31'),
(48, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 13:14:54', '2023-09-30 13:14:54'),
(49, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 13:16:25', '2023-09-30 13:16:25'),
(50, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', '', '', 'j\'ai eu un souci avec ma note', '2023-09-30 13:24:59', '2023-09-30 13:24:59'),
(51, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquee', 'session normale', 'contestation de note', 'Macro-Micro', 'STATS', NULL, 'C:\\Users\\Admin\r\nonaldo Dropbox\\Ronaldo AGBOHOU\\Mon PC (ronaldoagbohou)\\Desktop\\Presentation\r\neset\\assets\\img\\apple-touch-icon.jpeg', 'j\'ai eu un souci avec ma note', '2023-09-30 13:45:59', '2023-09-30 13:45:59'),
(52, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2025-2026', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'stat', 'Macro', NULL, NULL, 'htyydh', '2023-10-16 11:50:06', '2023-10-16 11:50:06'),
(53, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2025-2026', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'stat', 'Macro', NULL, NULL, 'htyydh', '2023-10-16 12:08:51', '2023-10-16 12:08:51'),
(54, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2025-2026', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'stat', 'Macro', NULL, NULL, 'htyydh', '2023-10-16 12:09:56', '2023-10-16 12:09:56'),
(55, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2025-2026', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'stat', 'Macro', NULL, NULL, 'htyydh', '2023-10-16 12:11:45', '2023-10-16 12:11:45'),
(56, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2025-2026', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'stat', 'Macro', NULL, NULL, 'htyydh', '2023-10-16 12:13:05', '2023-10-16 12:13:05'),
(57, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2025-2026', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'stat', 'Macro', 'complaint_files/64iAn59mcl1hxspqjpdgbz9exiNkyWBwkzMO4Tco.jpg', NULL, 'htyydh', '2023-10-16 12:18:54', '2023-10-16 12:18:54'),
(58, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'stat', 'Macro', 'complaint_files/KTOAgjAmJhJ79K4kG5W268SN2RMqDC0hu2WkF90R.jpg', NULL, 'jh', '2023-10-16 17:36:46', '2023-10-16 17:36:46'),
(59, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'ega', 'session normale', 'session normale', 'Macro-Micro', 'jhy', 'complaint_files/TcR3Oy3N3SkmQDwqmOZtUNl3pv5EVenxyjqkFSvE.jpg', NULL, 'j\'ai eu un souci avec ma note', '2023-10-23 00:44:41', '2023-10-23 00:44:41'),
(60, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'ega', 'session normale', 'session normale', 'Macro-Micro', 'jhy', 'complaint_files/CWXJBidCo17N8NmM9O21SGR2gjfgEtzNJCBDJd9i.jpg', NULL, 'j\'ai eu un souci avec ma note', '2023-10-23 00:45:00', '2023-10-23 00:45:00'),
(61, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'ega', 'session normale', 'session normale', 'Macro-Micro', 'jhy', 'complaint_files/n2KZZMBaNYE8YfCV19ANQgvZDxNsDtyjtwinimrA.jpg', NULL, 'j\'ai eu un souci avec ma note', '2023-10-23 00:47:35', '2023-10-23 00:47:35'),
(62, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'ega', 'session normale', 'session normale', 'Macro-Micro', 'jhy', 'complaint_files/bSPCTRyUzib1DLOHEVlUIRXzcAgFeQxmLmTqUh00.jpg', NULL, 'j\'ai eu un souci avec ma note', '2023-10-23 00:50:20', '2023-10-23 00:50:20'),
(63, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'ega', 'session normale', 'session normale', 'Macro-Micro', 'jhy', 'complaint_files/RjJZxqTHXqbyLsQpERftOWp6vH3LRx9HkCedbaxr.jpg', NULL, 'j\'ai eu un souci avec ma note', '2023-10-23 00:51:40', '2023-10-23 00:51:40'),
(64, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'ega', 'session normale', 'session normale', 'Macro-Micro', 'jhy', 'complaint_files/HYIVyHqcke0ZONyWO9mL8lAodWqs0XdIMNVL7DZm.jpg', NULL, 'j\'ai eu un souci avec ma note', '2023-10-23 01:09:53', '2023-10-23 01:09:53'),
(65, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Tronc commun de Licence 1', 'session de rattrapage', 'Omission de note', 'Macro1', 'Droit des affaires-Anglais commerciale', 'complaint_files/8p32OxZYnykLXHZU2VjgaT9wlIRUR5TJBEceQfkC.jpg', NULL, '12', '2023-10-23 01:24:21', '2023-10-23 01:24:21'),
(66, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'Macro1', 'Droit des affaires-Anglais commerciale', 'complaint_files/ReMsA0dEVbBJxgA91OYChxTx5Xh3uxCQirl1bUJ3.jpg', NULL, 'stepping on', '2023-10-23 08:11:07', '2023-10-23 08:11:07'),
(67, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'Anglais commerciale', 'Droit des affaires-Anglais commerciale', 'complaint_files/yz8gNLQVT0hrF5TXIl7Uuc2eqv06WeBx85kLewEH.jpg', NULL, '4', '2023-10-23 09:03:48', '2023-10-23 09:03:48'),
(68, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'Anglais commerciale', 'Droit des affaires-Anglais commerciale', 'complaint_files/RtkK4U89Adt4zUR6EXSMERLwPyKMGlOuTF7rhQH7.jpg', NULL, NULL, '2023-10-23 10:22:04', '2023-10-23 10:22:04'),
(69, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'Anglais commerciale', 'Droit des affaires-Anglais commerciale', 'complaint_files/9dNBxdYyZVIS237E54TiEmtpGKzMrEfBCqXYqctO.jpg', NULL, NULL, '2023-10-23 10:22:19', '2023-10-23 10:22:19'),
(70, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'Anglais commerciale', 'Droit des affaires-Anglais commerciale', 'complaint_files/zzCTHJWos57ZsDLzB6DJcpCzlBuCileccADByCMd.jpg', NULL, NULL, '2023-10-23 10:23:10', '2023-10-23 10:23:10'),
(71, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'Anglais commerciale', 'Droit des affaires-Anglais commerciale', 'complaint_files/ZDkVOajwuz37z76VebsHvKqhlUs2zX5G2dO2dUMJ.jpg', NULL, 'go', '2023-10-23 17:07:15', '2023-10-23 17:07:15'),
(72, 1, 'Emma', 'Smith', '1234567890', 'emm@example.com', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'session normale', 'Contestation de note', 'Anglais commerciale', 'Droit des affaires-Anglais commerciale', 'complaint_files/tzmq9zZLhrCR13vDlK2qT9nXWOPqo1IZUfynuUpd.jpg', NULL, 'kl', '2023-10-23 18:57:24', '2023-10-23 18:57:24');

-- --------------------------------------------------------

--
-- Structure de la table `diplomas`
--

CREATE TABLE `diplomas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speciality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiche_inscription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `diplomas`
--

INSERT INTO `diplomas` (`id`, `user_id`, `firstname`, `lastname`, `email`, `phone`, `ac_year`, `ac_level`, `mat`, `field`, `speciality`, `description`, `fiche_inscription`, `created_at`, `updated_at`) VALUES
(1, 1, 'Emma', 'Smith', 'emm@example.com', '1234567890', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'gr', 'diploma_images/KOW44NjV636haIAz188x9gnUyKPwbc1w0Kws3Tm8.jpg', '2023-10-24 11:12:38', '2023-10-24 11:12:38'),
(2, 1, 'Emma', 'Smith', 'emm@example.com', '1234567890', '2022-2023', 'Licence 1', '17104018', 'Sciences Economiques', 'Economie Appliquée', 'gr', 'diploma_images/b5lHeIRc1zd9uAk53t5TaVP9AQwX4IU0XrO2pZHX.jpg', '2023-10-24 11:13:59', '2023-10-24 11:13:59');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `complaint_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `complaint_id`, `path`, `created_at`, `updated_at`) VALUES
(1, NULL, 'storage/64f60cf5db518_img.jpg', '2023-09-04 15:59:33', '2023-09-04 15:59:33'),
(2, NULL, 'storage/64f60df074920_img.jpg', '2023-09-04 16:03:44', '2023-09-04 16:03:44'),
(3, NULL, 'storage/64f60fd7c8f7c_img.jpg', '2023-09-04 16:11:51', '2023-09-04 16:11:51'),
(4, NULL, 'storage/64f6114046cde_img.jpg', '2023-09-04 16:17:52', '2023-09-04 16:17:52'),
(5, NULL, 'storage/64f612b8afd67_img.jpg', '2023-09-04 16:24:08', '2023-09-04 16:24:08'),
(6, NULL, 'storage/64f616b3759ba_IMG_0035.jpeg', '2023-09-04 16:41:07', '2023-09-04 16:41:07'),
(7, NULL, 'storage/64f61b91dec60_IMG_0035.jpeg', '2023-09-04 17:01:53', '2023-09-04 17:01:53'),
(8, NULL, 'storage/64f6224ba368d_constructions-2.jpg', '2023-09-04 17:30:35', '2023-09-04 17:30:35'),
(9, NULL, 'storage/64f6334ec3f40_IMG_0035.jpeg', '2023-09-04 18:43:10', '2023-09-04 18:43:10'),
(10, NULL, 'storage/64f63a5de03df_camphoto_824023566.jpeg', '2023-09-04 19:13:17', '2023-09-04 19:13:17'),
(11, NULL, 'storage/64f784fd7602f_photo_6030713479423442847_y.jpg', '2023-09-05 18:43:57', '2023-09-05 18:43:57'),
(12, NULL, 'storage/64f7858c34c63_photo_6030713479423442847_y.jpg', '2023-09-05 18:46:20', '2023-09-05 18:46:20'),
(13, NULL, 'storage/64f869647fe25_4E0E5B4A-ADFA-4D12-B4EC-8038B1E78EF7.jpeg', '2023-09-06 10:58:28', '2023-09-06 10:58:28'),
(14, NULL, 'storage/64f8c58950d95_Screenshot_20221129-154102.jpg', '2023-09-06 17:31:37', '2023-09-06 17:31:37'),
(15, NULL, 'storage/64f8c84414bae_1672039417854.jpg', '2023-09-06 17:43:16', '2023-09-06 17:43:16'),
(16, NULL, 'storage/64f8d99460abb_Screenshot_20230906-150016_WhatsApp.jpg', '2023-09-06 18:57:08', '2023-09-06 18:57:08'),
(17, NULL, 'storage/64fa340b3deaa_99cf2f8b-d128-4b95-a2bd-2ef3ddeee841.jpeg', '2023-09-07 19:35:23', '2023-09-07 19:35:23'),
(18, NULL, 'storage/65002f8663978_lyrics.jpg', '2023-09-12 08:29:42', '2023-09-12 08:29:42'),
(19, NULL, 'storage/650037d859fee_CA3C1991-4A94-4137-8FC6-0E2A11AF0A19.jpeg', '2023-09-12 09:05:12', '2023-09-12 09:05:12'),
(20, NULL, 'storage/6501fb1fe7e4f_375D9DE3-0DF9-40AD-9E29-A4CD3CBA3119.jpeg', '2023-09-13 17:10:40', '2023-09-13 17:10:40'),
(21, NULL, 'storage/6508787d157dd_edit.jpeg', '2023-09-18 15:19:09', '2023-09-18 15:19:09'),
(22, NULL, 'storage/650aaed66eaac_photo1.jpg', '2023-09-20 07:35:34', '2023-09-20 07:35:34'),
(23, NULL, 'storage/650c85d2bd8e4_IMG_0112.png', '2023-09-21 17:05:06', '2023-09-21 17:05:06'),
(24, NULL, 'storage/650c88f3a69b9_IMG_0112.png', '2023-09-21 17:18:27', '2023-09-21 17:18:27'),
(25, NULL, 'storage/650c99eb733cb_about.jpg', '2023-09-21 18:30:51', '2023-09-21 18:30:51'),
(26, NULL, 'storage/6512dd5ab095f_breadcrumbs-bg.jpg', '2023-09-26 12:32:10', '2023-09-26 12:32:10'),
(27, NULL, 'storage/6512dece88aec_about.jpg', '2023-09-26 12:38:22', '2023-09-26 12:38:22'),
(28, NULL, 'storage/65181c028688f_img.jpg', '2023-09-30 12:00:50', '2023-09-30 12:00:50'),
(29, NULL, 'storage/65182665bb0e0_img.jpg', '2023-09-30 12:45:09', '2023-09-30 12:45:09'),
(30, NULL, 'storage/651826a47f84c_img.jpg', '2023-09-30 12:46:12', '2023-09-30 12:46:12'),
(31, NULL, 'storage/65182a3b89d36_img.jpg', '2023-09-30 13:01:31', '2023-09-30 13:01:31'),
(32, NULL, 'storage/65182d5e5cd80_img.jpg', '2023-09-30 13:14:54', '2023-09-30 13:14:54'),
(33, NULL, 'storage/65182db986449_img.jpg', '2023-09-30 13:16:25', '2023-09-30 13:16:25'),
(34, NULL, 'storage/652d30fdbddd2_eGraC QR code.jpg', '2023-10-16 11:47:57', '2023-10-16 11:47:57'),
(35, NULL, 'storage/652d317eaa8d3_eGraC QR code.jpg', '2023-10-16 11:50:06', '2023-10-16 11:50:06'),
(36, NULL, 'storage/652d36242022d_eGraC QR code.jpg', '2023-10-16 12:09:56', '2023-10-16 12:09:56'),
(37, NULL, 'storage/652d36912ae7b_eGraC QR code.jpg', '2023-10-16 12:11:45', '2023-10-16 12:11:45'),
(38, NULL, 'storage/652d36e17edc7_eGraC QR code.jpg', '2023-10-16 12:13:05', '2023-10-16 12:13:05');

-- --------------------------------------------------------

--
-- Structure de la table `messages_table`
--

CREATE TABLE `messages_table` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messages_table`
--

INSERT INTO `messages_table` (`id`, `sender_firstname`, `sender_lastname`, `send_phone`, `sender_email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', 'Hint', 'Take care', '2023-09-06 16:04:55', '2023-09-06 16:04:55'),
(2, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', 'Hint', 'Take care', '2023-09-06 16:05:22', '2023-09-06 16:05:22'),
(3, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', 'Hint', 'Take care', '2023-09-06 16:05:23', '2023-09-06 16:05:23'),
(4, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', 'Hint', 'Take care', '2023-09-06 16:05:23', '2023-09-06 16:05:23'),
(5, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', 'Hint', 'Take care', '2023-09-06 16:05:24', '2023-09-06 16:05:24'),
(6, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', 'Hint', 'Take care', '2023-09-06 16:05:24', '2023-09-06 16:05:24'),
(7, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', 'Hint', 'Take care', '2023-09-06 16:05:24', '2023-09-06 16:05:24'),
(8, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', 'Hint', 'Take care', '2023-09-06 16:05:25', '2023-09-06 16:05:25'),
(9, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', 'Hint', 'Take care', '2023-09-06 16:05:25', '2023-09-06 16:05:25'),
(10, 'Dario', 'Isma', '+22996965829', 'darioabissi0@gmail.com', 'Demande d\'information', 'Ksklqklfllsls lslqlsn', '2023-09-06 19:25:54', '2023-09-06 19:25:54'),
(11, 'De', 'De', '623544525', 'de@gmail.com', 'Test', 'This message is for test purpose', '2023-09-13 17:19:17', '2023-09-13 17:19:17'),
(12, 'De', 'De', '623544525', 'de@gmail.com', 'Test', 'This message is for test purpose', '2023-09-13 17:19:53', '2023-09-13 17:19:53'),
(13, 'De', 'De', '623544525', 'de@gmail.com', 'Test', 'This message is for test purpose', '2023-09-13 17:20:04', '2023-09-13 17:20:04'),
(14, 'De', 'De', '623544525', 'de@gmail.com', 'Test', 'This message is for test purpose', '2023-09-13 17:20:08', '2023-09-13 17:20:08'),
(15, 'De', 'De', '623544525', 'de@gmail.com', 'Test', 'This message is for test purpose', '2023-09-13 17:20:11', '2023-09-13 17:20:11'),
(16, 'De', 'De', '623544525', 'de@gmail.com', 'Test', 'This message is for test purpose', '2023-09-13 17:20:13', '2023-09-13 17:20:13'),
(17, 'Ronaldo', 'Agbohou', '97247851', 'ronaldoagbohou@gmail.com', 'A quand la délibération', 'Veuillez me fournir', '2023-09-14 08:49:36', '2023-09-14 08:49:36');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_23_184541_create_students_table', 1),
(6, '2023_08_23_184542_create_teachers_table', 1),
(7, '2023_08_23_184543_create_complaints_table', 1),
(8, '2023_08_23_221047_create_subjects_table', 1),
(9, '2023_09_02_112304_create_messages_table', 1),
(10, '2023_09_04_162144_create_images_table', 2),
(11, '2023_09_22_141537_create_password_resets_table', 3),
(12, '2023_10_18_181741_add_password_reset_columns_to_users', 4),
(13, '2023_10_24_084028_create_transcripts_table', 5),
(14, '2023_10_24_094202_create_certificates_table', 6),
(15, '2023_10_24_100110_add_additional_fields_to_certificates_table', 7),
(16, '2023_10_24_113529_create_diplomas_table', 8);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speciality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transcripts`
--

CREATE TABLE `transcripts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ac_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speciality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiche_inscription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transcripts`
--

INSERT INTO `transcripts` (`id`, `ac_year`, `ac_level`, `mat`, `exam_type`, `field`, `speciality`, `fiche_inscription`, `description`, `created_at`, `updated_at`, `user_id`, `firstname`, `lastname`, `email`, `phone`) VALUES
(1, '2023-2024', 'premiere annee', '17104018', 'session normal', 'Eco', 'EGEA', 'transcript_images/qm1lTbOi73Bo4WsfobnuR44aDYVZcP8MJB6fVG1f.jpg', 'description goes here', '2023-10-24 10:17:02', '2023-10-24 10:17:02', 1, 'Emma', 'Smith', 'emm@example.com', '1234567890'),
(2, '2022-2023', 'Licence 1', '17104018', 'session normale', 'Sciences Economiques', 'Economie Appliquée', 'transcript_images/xXNSDYiuwp8JJbazisA1r2iHMa8dhnJ5IRQkadqq.jpg', 'j', '2023-10-24 10:17:59', '2023-10-24 10:17:59', 1, 'Emma', 'Smith', 'emm@example.com', '1234567890'),
(3, '2022-2023', 'Licence 1', '17104018', 'session normale', 'Sciences Economiques', 'Economie Appliquée', 'transcript_images/GOzY9Wo87Jh669zE8cj1QVX7gLeFGHAWMP6i8zXz.jpg', 'j', '2023-10-24 10:20:20', '2023-10-24 10:20:20', 1, 'Emma', 'Smith', 'emm@example.com', '1234567890');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mat_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_token_hash` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reset_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_code_expiry` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`, `mat_number`, `identifier`, `google_id`, `phone_code`, `secret_key`, `password`, `reset_token_hash`, `reset_token_expires_at`, `created_at`, `updated_at`, `reset_code`, `reset_code_expiry`, `remember_token`) VALUES
(1, 'Emma', 'Smith', 'emm@example.com', '1234567890', '17104018', 'Emma|-_-|64f5faff5207e@ADR0@Smith|_-_|17104018', NULL, NULL, NULL, '$2y$10$rOUJLvR2vhmSWQanX9ssNe7Xzp/64/eNuVCAC5vWV8K9TTsIJvgIe', '41068a0d68e0209121a48256caf340417d3b90b624dbeab62079311be449be89', '2023-09-25 14:47:37', '2023-09-04 14:42:55', '2023-09-04 14:42:55', '', NULL, NULL),
(2, 'Ronaldo', 'Agbohou', 'ronaldoagbohou@gmail.com', '+22967419414', '12345678', 'Ronaldo|-_-|64f61ac818e10@ADR0@Agbohou|_-_|12345678', NULL, NULL, NULL, '$2y$10$QBE6H.LAswhdlCzBhr3Rp.qOx1ccu5jhsSX/jicPmk.GgLFznzJWC', '45aeb3c2b772b7b229879ce0a266b235e749f172e4ee508c712cb6602f9264bd', '2023-10-21 19:15:48', '2023-09-04 16:58:32', '2023-10-23 07:57:53', '769543', '2023-10-23 08:14:06', NULL),
(3, 'DJOKPE', 'Marius', 'Djokpemarius10@gmail.com', '97753419', '8745359', 'DJOKPE|-_-|64f877b485f4c@ADR0@Marius|_-_|8745359', NULL, NULL, NULL, '$2y$10$PB3D1N4OlGSFMBwLin6LH.Rwk8fIxWrP7HjteKs00KQyX/ddxEg8m', NULL, NULL, '2023-09-06 11:59:32', '2023-09-06 11:59:32', '', NULL, NULL),
(4, 'Epiphane', 'HONVO', 'honvoeiphane@gmail.com', '+22966154804', '13872320', 'Epiphane|-_-|64f8c48f8b0bb@ADR0@HONVO|_-_|13872320', NULL, NULL, NULL, '$2y$10$TZWF07pQ0uIQavmH1kUBeuiZ/l.kRCdhFMU5YlWtPjqr2gByqD7a.', '52f35bd6b1cc4b09ecb0f886933b9efab2a3943c4cd8fadf7ef48f8a5355854e', '2023-10-21 12:17:41', '2023-09-06 17:27:27', '2023-09-06 17:27:27', '', NULL, NULL),
(5, 'Rosaline', 'Tchoumado', 'tchoumadorrosaline@gmail.com', '69750515', '19409719', 'Rosaline|-_-|64f8d7548e08f@ADR0@Tchoumado|_-_|19409719', NULL, NULL, NULL, '$2y$10$N/MALRoGp9oaYpBoyJB4OuECHJF6Q0xB3P9HhIA4JuQuBAlEyAcUe', NULL, NULL, '2023-09-06 18:47:34', '2023-09-06 18:47:34', '', NULL, NULL),
(6, 'Boris', 'YEHOUENOU', 'borisyehouenou626@gmail.com', '96546994', '11137719', 'Boris|-_-|64f8d859ace6e@ADR0@YEHOUENOU|_-_|11137719', NULL, NULL, NULL, '$2y$10$ayCIIK/y9VCQpCIiBJ8dy.OW1DXV16WTSGpxz8wYNLftpFvMgXUq2', NULL, NULL, '2023-09-06 18:51:53', '2023-09-06 18:51:53', '', NULL, NULL),
(7, 'Réjuste', 'WENOUMI', 'rejustewenoumi@gmail.com', '94552616', '10375819', 'Réjuste|-_-|64f8d9ff7ce49@ADR0@WENOUMI|_-_|10375819', NULL, NULL, NULL, '$2y$10$GL1m/AqIFDE9tTb8PQTPEeM5ICR1Qlv1lFFiLkxiAXpybVk1V2rKC', NULL, NULL, '2023-09-06 18:58:55', '2023-09-06 18:58:55', '', NULL, NULL),
(8, 'Dario', 'Isma', 'darioabissi0@gmail.com', '+22996965829', '11262840', 'Dario|-_-|64f8dfad74539@ADR0@Isma|_-_|11262840', NULL, NULL, NULL, '$2y$10$9L2ys9YW2Sj9AOkR3yKwj.yltATl51MXzxBOLa81TGbVKuz1Ez89W', NULL, NULL, '2023-09-06 19:23:09', '2023-09-06 19:23:09', '', NULL, NULL),
(10, 'De', 'De', 'ronaldoownpurpose@gmail.com', '623544525', '000000', 'De|-_-|6501fa42dc793@ADR0@De|_-_|000000', NULL, NULL, NULL, '$2y$10$/zC1hvZceeXAnXqP0O.BGuSaQabFIA18du2IWl.MWW/mR5dIyFbiS', NULL, '2023-10-21 12:25:40', '2023-09-13 17:07:06', '2023-10-22 10:45:39', '340370', '2023-10-22 11:15:39', NULL),
(11, 'Gram', 'Francis', 'gra@gmail.com', '65225885', '456789', 'Gram|-_-|6502d50120c7d@ADR0@Francis|_-_|456789', NULL, NULL, NULL, '$2y$10$ELSTJVHs9ZdnRlBV8wNPCeDkDVN9OZJ9VgshU9YgGGCFpvZZpHRtq', NULL, NULL, '2023-09-14 08:40:17', '2023-09-14 08:40:17', '', NULL, NULL),
(12, 'Mathilde', 'DAAH-HOUEDJI', 'mathildedaah@gmail.com', '53989380', '14272021', 'Mathilde|-_-|650c87d3830ee@ADR0@DAAH-HOUEDJI|_-_|14272021', NULL, NULL, NULL, '$2y$10$UZ6hDBSetaTbqagnOcGuVOt4oUebtUuA17kQVFtx7WIkZGSTt2L/i', NULL, NULL, '2023-09-21 17:13:39', '2023-09-21 17:13:39', '', NULL, NULL),
(13, '', '', '', '', '', '', NULL, NULL, NULL, '$2y$10$LLdMETecN9N7EohvHpe9PuLmeL6KKxb8sKQI/J7ziBw2syStdrLzG', NULL, NULL, NULL, NULL, '', NULL, NULL),
(17, 'hero', 'hero', 'nherodion@gmail.com', '5846326561', '154545', 'hero|-_-|652e999b71c61@ADR0@hero|_-_|154545', NULL, NULL, NULL, '$2y$10$OPQmTrORpxkou.LEKcdz8OD90jBgcqxoDs6R0nRbDt.AvGFuTm7NC', '181b1faa770d76effd5f0d772284b449ecdf1b5ae878dd3eb60ad59077ae3471', '2023-10-17 16:49:25', '2023-10-17 13:26:35', '2023-10-17 13:26:35', '', NULL, NULL),
(18, 'hero', 'hero', 'ron2agb2@gmail.com', '123456789', '1234567', 'hero|-_-|652e9bb750a72@ADR0@hero|_-_|1234567', NULL, NULL, NULL, '$2y$10$YGszHbQ0ivvrPsdyuGkBnujhlNKJQt3F4mR5OGz6Cf6XrdhjvSAYm', 'c90c44007ee46a33790a525527727679f45abf7aaeabd56de56a7eb9d4d26c94', '2023-10-17 17:23:46', '2023-10-17 13:35:35', '2023-10-17 13:35:35', '', NULL, NULL),
(19, 'ljxlks', 'lj,clk', 'mkcmkc@gmail.com', 'mkxkc', 'mk,xcm', 'ljxlks|-_-|6531853589089@ADR0@lj,clk|_-_|mk,xcm', NULL, NULL, NULL, '$2y$10$AXUh7PrS1qzUKc1QX.MSFeKY11iCyuOO6OPixnDOMA4laajViCZ/W', NULL, NULL, '2023-10-19 18:36:25', '2023-10-19 18:36:25', '', NULL, NULL),
(20, 'Ronaldo', 'AGBOHOU', 'ronaldo@g.com', '98554477', '11111111', 'Ronaldo|-_-|6535128b6f84c@ADR0@AGBOHOU|_-_|11111111', NULL, NULL, NULL, '$2y$10$djhMhWdSBa5/UqzQEx41TuIFyHi2IXC.8OLOXp8OhQRmfYl2dt0Qm', NULL, NULL, '2023-10-22 11:16:11', '2023-10-22 11:16:11', NULL, NULL, NULL),
(21, 'ù!', '!', 'ronaldo@n.com', '58', '15151515', 'ù!|-_-|6535142d4fb22@ADR0@!|_-_|15151515', NULL, NULL, NULL, '$2y$10$iBhdhd1nJf04SGo592I9kubD6DN.hvbMYXjqLRVxM5aq5CNowog7K', NULL, NULL, '2023-10-22 11:23:09', '2023-10-22 11:23:09', NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificates_user_id_foreign` (`user_id`);

--
-- Index pour la table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaints_student_id_foreign` (`student_id`);

--
-- Index pour la table `diplomas`
--
ALTER TABLE `diplomas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diplomas_user_id_foreign` (`user_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_complaint_id_foreign` (`complaint_id`);

--
-- Index pour la table `messages_table`
--
ALTER TABLE `messages_table`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_user_id_foreign` (`user_id`);

--
-- Index pour la table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subjects_title_unique` (`title`);

--
-- Index pour la table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_user_id_foreign` (`user_id`);

--
-- Index pour la table `transcripts`
--
ALTER TABLE `transcripts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `reset_token_hash` (`reset_token_hash`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pour la table `diplomas`
--
ALTER TABLE `diplomas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `messages_table`
--
ALTER TABLE `messages_table`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transcripts`
--
ALTER TABLE `transcripts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `diplomas`
--
ALTER TABLE `diplomas`
  ADD CONSTRAINT `diplomas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_complaint_id_foreign` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
