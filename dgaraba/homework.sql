-- phpMyAdmin SQL Dump
-- version 5.0.0-dev
-- https://www.phpmyadmin.net/
--
-- Host: 192.168.30.23
-- Creato il: Apr 18, 2018 alle 23:13
-- Versione del server: 8.0.3-rc-log
-- Versione PHP: 7.2.4-1+0~20180405085422.20+stretch~1.gbpbff9f0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homework`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `facultati`
--

CREATE TABLE `facultati` (
  `id` int(10) NOT NULL,
  `nume` varchar(50) NOT NULL,
  `nume_decan` varchar(20) NOT NULL,
  `prenume_decan` varchar(20) NOT NULL,
  `strada` varchar(100) NOT NULL,
  `telefon` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `grupe`
--

CREATE TABLE `grupe` (
  `id` int(10) NOT NULL,
  `nume` varchar(50) NOT NULL,
  `id_facultate` int(10) NOT NULL,
  `nr_studenti` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `materii`
--

CREATE TABLE `materii` (
  `id` int(10) NOT NULL,
  `denumire` varchar(50) NOT NULL,
  `nume_profesor` varchar(20) NOT NULL,
  `prenume_profesor` varchar(20) NOT NULL,
  `id_grupa` int(10) NOT NULL,
  `aula` varchar(20) NOT NULL,
  `ora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `note`
--

CREATE TABLE `note` (
  `id_student` int(13) NOT NULL,
  `id_materie` int(10) NOT NULL,
  `nota_medie` float NOT NULL,
  `nota_examen` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti`
--

CREATE TABLE `studenti` (
  `idnp` int(13) NOT NULL,
  `nume_student` varchar(20) NOT NULL,
  `prenume_student` varchar(20) NOT NULL,
  `id_grupa` int(10) NOT NULL,
  `data_nasterii` date NOT NULL,
  `data_inmatricularii` date NOT NULL,
  `strada` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefon` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `facultati`
--
ALTER TABLE `facultati`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `grupe`
--
ALTER TABLE `grupe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_facultate` (`id_facultate`);

--
-- Indici per le tabelle `materii`
--
ALTER TABLE `materii`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_grupa` (`id_grupa`);

--
-- Indici per le tabelle `note`
--
ALTER TABLE `note`
  ADD KEY `id_materie` (`id_materie`),
  ADD KEY `id_student` (`id_student`);

--
-- Indici per le tabelle `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`idnp`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_grupa` (`id_grupa`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `facultati`
--
ALTER TABLE `facultati`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `grupe`
--
ALTER TABLE `grupe`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `materii`
--
ALTER TABLE `materii`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `grupe`
--
ALTER TABLE `grupe`
  ADD CONSTRAINT `grupe_ibfk_1` FOREIGN KEY (`id_facultate`) REFERENCES `facultati` (`id`);

--
-- Limiti per la tabella `materii`
--
ALTER TABLE `materii`
  ADD CONSTRAINT `materii_ibfk_1` FOREIGN KEY (`id_grupa`) REFERENCES `grupe` (`id`);

--
-- Limiti per la tabella `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`id_materie`) REFERENCES `materii` (`id`),
  ADD CONSTRAINT `note_ibfk_3` FOREIGN KEY (`id_student`) REFERENCES `studenti` (`idnp`) ON DELETE CASCADE;

--
-- Limiti per la tabella `studenti`
--
ALTER TABLE `studenti`
  ADD CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`id_grupa`) REFERENCES `grupe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
