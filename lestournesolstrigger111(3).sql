-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 03 avr. 2023 à 20:36
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `lestournesolstrigger111`
--

-- --------------------------------------------------------

--
-- Structure de la table `approvisionner`
--

DROP TABLE IF EXISTS `approvisionner`;
CREATE TABLE IF NOT EXISTS `approvisionner` (
  `ReferenceProduit` char(6) COLLATE utf8_bin NOT NULL,
  `DateApprovisionnement` datetime NOT NULL,
  `QtAppro` int(11) DEFAULT NULL,
  PRIMARY KEY (`ReferenceProduit`,`DateApprovisionnement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `NumeroFournisseur` int(11) NOT NULL,
  `NomFournisseur` char(30) COLLATE utf8_bin DEFAULT NULL,
  `RueFournisseur` char(50) COLLATE utf8_bin DEFAULT NULL,
  `CpFournisseur` char(6) COLLATE utf8_bin DEFAULT NULL,
  `VilleFournisseur` char(30) COLLATE utf8_bin DEFAULT NULL,
  `PaysFournisseur` char(20) COLLATE utf8_bin DEFAULT NULL,
  `NumeroIntracom` char(14) COLLATE utf8_bin DEFAULT NULL,
  `DelaiLivraison` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumeroFournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`NumeroFournisseur`, `NomFournisseur`, `RueFournisseur`, `CpFournisseur`, `VilleFournisseur`, `PaysFournisseur`, `NumeroIntracom`, `DelaiLivraison`) VALUES
(1, 'Horticulteur Partenaire Lafare', '15, rue des blancs Manteaux', '95430', 'Butry/Oise', 'France', 'FR19235947CF72', 5),
(2, 'T NIEUW BAS', 'Hogeweg 1455', '4512BA', 'NIEUWAAL', 'Pays Bas', 'NL124589660J78', 23);

-- --------------------------------------------------------

--
-- Structure de la table `vegetaux`
--

DROP TABLE IF EXISTS `vegetaux`;
CREATE TABLE IF NOT EXISTS `vegetaux` (
  `ReferenceProduit` char(6) COLLATE utf8_bin NOT NULL,
  `DesignationProduit` char(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ReferenceProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `vegetaux`
--

INSERT INTO `vegetaux` (`ReferenceProduit`, `DesignationProduit`) VALUES
('ASP001', 'Abeilles sauvages sur phacélie à feuille de tanaisie'),
('BLE001', 'Bleuet'),
('CDN001', 'Cactus de Noël'),
('CDP001', 'Cardamine des près'),
('FDB001', 'Fleur de bourrache'),
('IDA001', 'Iris d\'Algérie'),
('JDB001', 'Jacinthe des bois'),
('LDN001', 'Lis du Nil'),
('OPJ001', 'Oiseau de paradis jaune, oiseau de aparadis mexicain'),
('PAM001', 'Pavot d\'Amérique'),
('TER001', 'TERRE de BRUYERE');

-- --------------------------------------------------------

--
-- Structure de la table `vegetauxachetes`
--

DROP TABLE IF EXISTS `vegetauxachetes`;
CREATE TABLE IF NOT EXISTS `vegetauxachetes` (
  `ReferenceProduit` char(6) COLLATE utf8_bin NOT NULL,
  `QuantiteEnStockMax` int(11) DEFAULT NULL,
  `QuantiteEnStock` int(11) DEFAULT NULL,
  `StockSecurite` int(11) DEFAULT NULL,
  `PrixAchat` float(7,2) DEFAULT NULL,
  `NumeroFournisseur` int(11) DEFAULT NULL,
  PRIMARY KEY (`ReferenceProduit`),
  KEY `FK_VegetauxAchetes_Fournisseur` (`NumeroFournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `vegetauxachetes`
--

INSERT INTO `vegetauxachetes` (`ReferenceProduit`, `QuantiteEnStockMax`, `QuantiteEnStock`, `StockSecurite`, `PrixAchat`, `NumeroFournisseur`) VALUES
('ASP001', 150, 1, 30, 6.53, 1),
('CDN001', 110, 90, 20, 6.43, 1),
('CDP001', 90, 60, 30, 5.99, 1),
('FDB001', 90, 50, 20, 5.83, 1),
('JDB001', 80, 30, 20, 4.89, 1),
('LDN001', 70, 30, 20, 7.89, 2),
('OPJ001', 70, 30, 20, 7.83, 2),
('PAM001', 60, 30, 20, 5.89, 2);

-- --------------------------------------------------------

--
-- Structure de la table `vegetauxproduits`
--

DROP TABLE IF EXISTS `vegetauxproduits`;
CREATE TABLE IF NOT EXISTS `vegetauxproduits` (
  `ReferenceProduit` char(6) COLLATE utf8_bin NOT NULL,
  `CoutDeProduction` float(7,2) DEFAULT NULL,
  PRIMARY KEY (`ReferenceProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `vegetauxproduits`
--

INSERT INTO `vegetauxproduits` (`ReferenceProduit`, `CoutDeProduction`) VALUES
('BLE001', 8.90),
('IDA001', 6.95),
('TER001', 6.86);

-- --------------------------------------------------------

--
-- Structure de la table `vendre`
--

DROP TABLE IF EXISTS `vendre`;
CREATE TABLE IF NOT EXISTS `vendre` (
  `ReferenceProduit` char(6) COLLATE utf8_bin NOT NULL,
  `DateVente` datetime NOT NULL,
  `Quantitevendue` int(11) DEFAULT NULL,
  PRIMARY KEY (`ReferenceProduit`,`DateVente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `vendre`
--

INSERT INTO `vendre` (`ReferenceProduit`, `DateVente`, `Quantitevendue`) VALUES
('ASP001', '2023-04-03 20:17:22', 1),
('ASP001', '2023-04-03 22:34:54', 138);

--
-- Déclencheurs `vendre`
--
DROP TRIGGER IF EXISTS `MAJProduit`;
DELIMITER $$
CREATE TRIGGER `MAJProduit` AFTER INSERT ON `vendre` FOR EACH ROW BEGIN

DECLARE qteStock int ;
DECLARE qteStockMax int;
DECLARE StockSecurite int;
DECLARE qteAppro int;
update vegetauxachetes set QuantiteEnStock=QuantiteEnStock - New.Quantitevendue WHERE ReferenceProduit= new.ReferenceProduit;
SELECT QuantiteEnStockMax,QuantiteEnStock,StockSecurite INTO qteStockMax, qteStock, StockSecurite from vegetauxachetes where ReferenceProduit= new.ReferenceProduit;
IF qteStock <= StockSecurite THEN 
SET qteAppro = qteStockMax - qteStock;
INSERT INTO approvisionner (QtAppro, DateApprovisionnement, ReferenceProduit) VALUES (qteAppro,NOW(), NEW.ReferenceProduit);
END IF;
END
$$
DELIMITER ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `approvisionner`
--
ALTER TABLE `approvisionner`
  ADD CONSTRAINT `FK_approvisionner` FOREIGN KEY (`ReferenceProduit`) REFERENCES `vegetauxachetes` (`ReferenceProduit`);

--
-- Contraintes pour la table `vegetauxachetes`
--
ALTER TABLE `vegetauxachetes`
  ADD CONSTRAINT `FK_VegetauxAchetes_Fournisseur` FOREIGN KEY (`NumeroFournisseur`) REFERENCES `fournisseur` (`NumeroFournisseur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_vegetauxachetes_vegetaux` FOREIGN KEY (`ReferenceProduit`) REFERENCES `vegetaux` (`ReferenceProduit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vegetauxproduits`
--
ALTER TABLE `vegetauxproduits`
  ADD CONSTRAINT `FK_vegetauxproduits_vegetaux` FOREIGN KEY (`ReferenceProduit`) REFERENCES `vegetaux` (`ReferenceProduit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vendre`
--
ALTER TABLE `vendre`
  ADD CONSTRAINT `FK_vendre` FOREIGN KEY (`ReferenceProduit`) REFERENCES `vegetauxachetes` (`ReferenceProduit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
