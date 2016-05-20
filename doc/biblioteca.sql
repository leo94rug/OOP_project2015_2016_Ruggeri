-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2016 at 01:00 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Table structure for table `gruppi`
--

CREATE TABLE `gruppi` (
  `id` int(11) NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gruppi_servizi`
--

CREATE TABLE `gruppi_servizi` (
  `id_gruppo` int(11) NOT NULL,
  `id_servizio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `immagine`
--

CREATE TABLE `immagine` (
  `id` int(11) NOT NULL,
  `id_testo` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `type` varchar(256) NOT NULL,
  `size` int(11) NOT NULL,
  `localfile` varchar(256) NOT NULL,
  `digest` longblob NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_opera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `opera`
--

CREATE TABLE `opera` (
  `id` int(11) NOT NULL,
  `titolo` varchar(256) NOT NULL,
  `descrizione` text NOT NULL,
  `autore` varchar(256) NOT NULL,
  `data_aggiunta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pagina`
--

CREATE TABLE `pagina` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `id_opera` int(11) NOT NULL,
  `id_immagine` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `contenuto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servizi`
--

CREATE TABLE `servizi` (
  `id` int(11) NOT NULL,
  `nome_servizio` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `id_gruppo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gruppi`
--
ALTER TABLE `gruppi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gruppi_servizi`
--
ALTER TABLE `gruppi_servizi`
  ADD UNIQUE KEY `id_gruppo` (`id_gruppo`),
  ADD UNIQUE KEY `id_servizio` (`id_servizio`);

--
-- Indexes for table `immagine`
--
ALTER TABLE `immagine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_testo` (`id_testo`),
  ADD UNIQUE KEY `id_opera` (`id_opera`);

--
-- Indexes for table `opera`
--
ALTER TABLE `opera`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_opera` (`id_opera`);

--
-- Indexes for table `servizi`
--
ALTER TABLE `servizi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_gruppo` (`id_gruppo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gruppi`
--
ALTER TABLE `gruppi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `immagine`
--
ALTER TABLE `immagine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `opera`
--
ALTER TABLE `opera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pagina`
--
ALTER TABLE `pagina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `servizi`
--
ALTER TABLE `servizi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `gruppi`
--
ALTER TABLE `gruppi`
  ADD CONSTRAINT `gruppi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `gruppi_servizi` (`id_gruppo`);

--
-- Constraints for table `immagine`
--
ALTER TABLE `immagine`
  ADD CONSTRAINT `immagine_ibfk_1` FOREIGN KEY (`id_testo`) REFERENCES `pagina` (`id`);

--
-- Constraints for table `opera`
--
ALTER TABLE `opera`
  ADD CONSTRAINT `opera_ibfk_1` FOREIGN KEY (`id`) REFERENCES `immagine` (`id_opera`);

--
-- Constraints for table `pagina`
--
ALTER TABLE `pagina`
  ADD CONSTRAINT `pagina_ibfk_1` FOREIGN KEY (`id_opera`) REFERENCES `opera` (`id`);

--
-- Constraints for table `servizi`
--
ALTER TABLE `servizi`
  ADD CONSTRAINT `servizi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `gruppi_servizi` (`id_servizio`);

--
-- Constraints for table `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`id_gruppo`) REFERENCES `gruppi` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
