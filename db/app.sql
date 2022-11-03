-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 03 nov. 2022 à 20:20
-- Version du serveur : 8.0.31-0ubuntu0.22.04.1
-- Version de PHP : 8.1.11

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `app`
--
CREATE DATABASE IF NOT EXISTS `app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `app`;

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `store_id` int NOT NULL,
  `street_number` int DEFAULT NULL,
  `street_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` int NOT NULL,
  `country` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `store_id`, `street_number`, `street_name`, `city`, `postal_code`, `country`) VALUES
(2, 2, 32, 'Bis quai Jean Baptiste Simon', 'Fontaines-sur-Saône', 69270, 'France'),
(3, 3, 1, 'Route du Chateau d\'Eau', 'Gazeran', 78125, 'France'),
(4, 4, 47, 'Avenue de Mocrat', 'Cholet', 49300, 'France'),
(5, 5, 36, 'rue du Journans', 'Ségny', 1170, 'France'),
(6, 6, 20, 'Bd Pierre et Marie Curie', 'Roche-la-Molière', 42230, 'France'),
(7, 7, 5, 'Impasse  Jean Paul Marat', 'Corbas', 69960, 'France');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_date` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `created_date`, `updated_date`, `image_url`) VALUES
(2, NULL, 'Serpents', '2022-10-29 12:41:56', '2022-10-29 12:41:56', NULL),
(3, NULL, 'Lézards', '2022-10-29 12:42:15', '2022-10-29 12:42:15', NULL),
(4, 2, 'Couleuvres', '2022-10-29 12:42:43', '2022-10-29 12:42:43', NULL),
(5, 3, 'Geckos', '2022-10-29 12:43:25', '2022-10-29 12:43:25', NULL),
(6, NULL, 'Amphibiens', '2022-11-01 16:26:16', '2022-11-01 16:26:17', NULL),
(7, 6, 'Grenouilles', '2022-11-01 16:26:47', '2022-11-01 16:26:47', NULL),
(8, NULL, 'Matériel', '2022-11-02 16:52:05', '2022-11-02 16:52:05', NULL),
(9, 8, 'Terrariums', '2022-11-02 16:52:23', '2022-11-02 16:52:23', NULL),
(10, NULL, 'Alimentations', '2022-11-02 16:53:08', '2022-11-02 16:53:08', NULL),
(11, 10, 'Insectes', '2022-11-02 16:53:31', '2022-11-02 16:53:31', NULL),
(12, 2, 'Boas', '2022-11-03 19:35:53', '2022-11-03 19:35:53', NULL),
(13, 10, 'Souris', '2022-11-03 20:04:23', '2022-11-03 20:04:23', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221002121518', '2022-10-02 14:16:21', 1166),
('DoctrineMigrations\\Version20221002134005', '2022-10-02 15:40:22', 214),
('DoctrineMigrations\\Version20221008145304', '2022-10-08 16:55:15', 237),
('DoctrineMigrations\\Version20221019151522', '2022-10-19 17:15:47', 419),
('DoctrineMigrations\\Version20221019154449', '2022-10-19 17:45:05', 233),
('DoctrineMigrations\\Version20221021130211', '2022-10-21 15:02:39', 183),
('DoctrineMigrations\\Version20221101185956', '2022-11-01 20:00:51', 153);

-- --------------------------------------------------------

--
-- Structure de la table `favorite`
--

CREATE TABLE `favorite` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `store_id` int NOT NULL,
  `created_date` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `favorite`
--

INSERT INTO `favorite` (`id`, `user_id`, `store_id`, `created_date`) VALUES
(41, 5, 4, '2022-11-01 13:23:31'),
(45, 7, 2, '2022-11-01 16:23:58'),
(48, 6, 2, '2022-11-02 14:09:11'),
(50, 6, 4, '2022-11-02 14:09:15'),
(55, 5, 5, '2022-11-03 17:31:29'),
(58, 5, 6, '2022-11-03 17:38:44'),
(59, 5, 2, '2022-11-03 17:38:59'),
(60, 10, 4, '2022-11-03 19:39:46');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(3, 7, 'a9F7gaxDeLjtDbmZiK2J', '4uGPRhkwsejtk6zlNiFOcNIlEnhpPxG5zlqO95QhDEk=', '2022-11-03 17:31:49', '2022-11-03 18:31:49');

-- --------------------------------------------------------

--
-- Structure de la table `store`
--

CREATE TABLE `store` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule` json DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_date` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `store`
--

INSERT INTO `store` (`id`, `name`, `slug`, `phone_number`, `schedule`, `description`, `created_date`, `updated_date`, `image_url`, `latitude`, `longitude`) VALUES
(2, 'Bebesaurus', 'Bebesaurus', '0666666666', '{\"1\": \"9h - 12h\", \"2\": \"14h - 18h\"}', NULL, '2022-10-29 14:34:45', '2022-10-29 14:34:45', NULL, 45.826, 4.859),
(3, 'Reptiligne', 'Reptiligne', '0688888888', '{\"1\": \"8h - 13h\", \"2\": \"15h - 17h\"}', NULL, '2022-10-29 14:37:49', '2022-10-29 14:37:49', NULL, 48.714234940896, 1.7611144822939),
(4, 'Serpentard', 'Serpentard', '0622222222', '{\"1\": \"8h - 12h\", \"2\": \"14h - 18h\"}', NULL, '2022-10-29 14:40:00', '2022-10-29 14:40:00', NULL, 47.062, -0.897),
(5, 'Baba la grenouille', 'Baba-la-grenouille', '0618887744', '{\"1\": \"10h - 15h\"}', NULL, '2022-11-01 16:32:29', '2022-11-01 16:32:29', NULL, 46.296187734265, 6.0708046721872),
(6, 'Fauna Tropika', 'Fauna-Tropika', '0683485269', '{\"1\": \"10h - 12h\", \"2\": \"14h - 19h\"}', NULL, '2022-11-02 17:29:30', '2022-11-02 17:29:30', NULL, 45.42, 4.313),
(7, 'Naturareptile', 'Naturareptile', '0677777777', '{\"1\": \"9h - 18h\"}', NULL, '2022-11-03 13:08:52', '2022-11-03 13:08:53', NULL, 45.67233075443, 4.9081219150641);

-- --------------------------------------------------------

--
-- Structure de la table `store_category`
--

CREATE TABLE `store_category` (
  `store_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `store_category`
--

INSERT INTO `store_category` (`store_id`, `category_id`) VALUES
(2, 3),
(2, 5),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 2),
(4, 4),
(4, 12),
(5, 6),
(5, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(7, 8),
(7, 9),
(7, 10),
(7, 11);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_date` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `roles` json NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `last_name`, `first_name`, `user_name`, `phone_number`, `email`, `password`, `created_date`, `updated_date`, `roles`, `is_verified`) VALUES
(5, 'Souss', 'Sorya', 'Admin', NULL, 'admin@mail.com', '$2y$13$PXbFO5Z9VLmFTVRVFTZfR.6iGHwkFMQQqq0ghfhqeWXTrNZ0Lw6aS', '2022-10-21 13:49:56', '2022-10-21 13:49:56', '[\"ROLE_ADMIN\"]', 1),
(6, 'Doe', 'John', 'John', NULL, 'john.doe@mail.fr', '$2y$13$nJ4FscWtFkX9ztsSAgAQUOsls50it4PmwUhBb3hbpmbhgkE4SSVZK', '2022-11-01 15:29:37', '2022-11-01 15:29:38', '[]', 1),
(7, 'Turner', 'Sarah', 'Sarah', NULL, 'sarahturner@mail.com', '$2y$13$3.DPMhvCbCkn5x4YTz3YYOusA8KHzRR/GEs25JMQFxnBD8Zegq0FK', '2022-11-01 15:35:53', '2022-11-01 15:35:53', '[]', 1),
(8, 'Delatour', 'Mike', 'Mike', NULL, 'mikedelatour@mail.com', '$2y$13$eL8JuU7NTDsJtT2p1cG6XeF9w5IY3wSA.ebk4lWWX74ej0QE3a/WS', '2022-11-01 15:42:55', '2022-11-01 15:42:55', '[]', 1),
(9, 'Jedusor', 'Tom', 'Tom', NULL, 'voldemort@mail.fr', '$2y$13$ZoQDefSN7UFbQJ0zlkGVuuY6pXPmXN1bsffwdAfOGHiAQL1amVMPi', '2022-11-01 15:44:51', '2022-11-01 15:44:52', '[]', 1),
(10, 'Delacour', 'Max', 'Max', NULL, 'maxdelacour@mail.com', '$2y$13$C.f03RsJUwuKn03O1S3hje43QYeUkt0dcy0PYtP3pviRP4sosW0qW', '2022-11-03 19:38:38', '2022-11-03 19:38:39', '[]', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4E6F81B092A811` (`store_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_64C19C1727ACA70` (`parent_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_68C58ED9A76ED395` (`user_id`),
  ADD KEY `IDX_68C58ED9B092A811` (`store_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `store_category`
--
ALTER TABLE `store_category`
  ADD PRIMARY KEY (`store_id`,`category_id`),
  ADD KEY `IDX_383B663BB092A811` (`store_id`),
  ADD KEY `IDX_383B663B12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D64924A232CF` (`user_name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `store`
--
ALTER TABLE `store`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81B092A811` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`);

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `FK_68C58ED9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_68C58ED9B092A811` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `store_category`
--
ALTER TABLE `store_category`
  ADD CONSTRAINT `FK_383B663B12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_383B663BB092A811` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
