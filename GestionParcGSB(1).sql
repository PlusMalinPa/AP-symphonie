-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 22 avr. 2025 à 09:56
-- Version du serveur : 10.3.39-MariaDB-0+deb10u1
-- Version de PHP : 8.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `GestionParcGSB`
--

-- --------------------------------------------------------

--
-- Structure de la table `Entretient`
--

CREATE TABLE `Entretient` (
  `idEntretient` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `cout` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Passer`
--

CREATE TABLE `Passer` (
  `idVehicule` int(11) NOT NULL,
  `idEntretient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Vehicule`
--

CREATE TABLE `Vehicule` (
  `idVehicule` int(11) NOT NULL,
  `marque` varchar(50) NOT NULL,
  `modele` varchar(50) NOT NULL,
  `immatriculation` int(11) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `statut` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Visiteur`
--

CREATE TABLE `Visiteur` (
  `idVisiteur` int(11) NOT NULL,
  `idVehicule` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `dureeAffectation` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Entretient`
--
ALTER TABLE `Entretient`
  ADD PRIMARY KEY (`idEntretient`);

--
-- Index pour la table `Passer`
--
ALTER TABLE `Passer`
  ADD KEY `idVehicule` (`idVehicule`),
  ADD KEY `idEntretient` (`idEntretient`);

--
-- Index pour la table `Vehicule`
--
ALTER TABLE `Vehicule`
  ADD PRIMARY KEY (`idVehicule`);

--
-- Index pour la table `Visiteur`
--
ALTER TABLE `Visiteur`
  ADD PRIMARY KEY (`idVisiteur`),
  ADD KEY `idVehicule` (`idVehicule`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Entretient`
--
ALTER TABLE `Entretient`
  MODIFY `idEntretient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Vehicule`
--
ALTER TABLE `Vehicule`
  MODIFY `idVehicule` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Visiteur`
--
ALTER TABLE `Visiteur`
  MODIFY `idVisiteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Passer`
--
ALTER TABLE `Passer`
  ADD CONSTRAINT `Passer_ibfk_1` FOREIGN KEY (`idVehicule`) REFERENCES `Vehicule` (`idVehicule`),
  ADD CONSTRAINT `Passer_ibfk_2` FOREIGN KEY (`idEntretient`) REFERENCES `Entretient` (`idEntretient`);

--
-- Contraintes pour la table `Visiteur`
--
ALTER TABLE `Visiteur`
  ADD CONSTRAINT `Visiteur_ibfk_1` FOREIGN KEY (`idVehicule`) REFERENCES `Vehicule` (`idVehicule`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
