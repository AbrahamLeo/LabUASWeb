-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2023 at 04:59 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas`
--

-- --------------------------------------------------------

--
-- Table structure for table `checklist`
--

CREATE TABLE `checklist` (
  `id` int(11) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `toilet_id` int(11) NOT NULL,
  `kloset` varchar(10) DEFAULT NULL,
  `wastafel` varchar(10) DEFAULT NULL,
  `lantai` varchar(10) DEFAULT NULL,
  `dinding` varchar(10) DEFAULT NULL,
  `kaca` varchar(10) DEFAULT NULL,
  `bau` varchar(10) DEFAULT NULL,
  `sabun` varchar(10) DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checklist`
--

INSERT INTO `checklist` (`id`, `tanggal`, `toilet_id`, `kloset`, `wastafel`, `lantai`, `dinding`, `kaca`, `bau`, `sabun`, `users_id`) VALUES
(1, '2023-01-01 10:05:44', 1, 'Bersih', 'Bersih', 'Bersih', 'Bersih', 'Bersih', 'Tidak', 'Ada', 1),
(2, '2023-01-02 10:07:26', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, '2023-01-01 10:08:30', 3, 'Kotor', 'Bersih', 'Bersih', 'Bersih', 'Kotor', 'Ya', 'Ada', 1),
(4, '2023-01-02 07:08:30', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, '2023-01-08 00:00:00', 2, 'Bersih', 'Bersih', 'Rusak', 'Bersih', 'Bersih', 'Ya', 'Ada', 2),
(6, '2023-01-09 00:00:00', 4, 'Bersih', 'Bersih', 'Bersih', 'Bersih', 'Bersih', 'Tidak', 'Habis', 2),
(7, '2023-01-09 14:16:04', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(8, '2023-01-08 06:26:50', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `toilet`
--

CREATE TABLE `toilet` (
  `id` int(11) NOT NULL,
  `lokasi` varchar(45) DEFAULT NULL,
  `keterangan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toilet`
--

INSERT INTO `toilet` (`id`, `lokasi`, `keterangan`) VALUES
(1, 'Office', 'Sudah'),
(2, 'Factory 1', 'Sudah'),
(3, 'Factory 2', 'Sudah'),
(4, 'Security', 'Sudah'),
(5, 'Office', 'Belum'),
(6, 'Factory 1', 'Belum'),
(7, 'Factory 2', 'Belum'),
(8, 'Security', 'Belum');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `stat` varchar(10) DEFAULT NULL,
  `rol` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `pass`, `nama`, `email`, `stat`, `rol`) VALUES
(1, 'Abraham Leo', 'bramleo19', 'Abraham', 'bramleo1969@gmail.com', 'Aktif', 'Admin'),
(2, 'Bram', 'bram', 'Bram', 'bramleo190401@gmail.com', 'Non Aktif', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checklist`
--
ALTER TABLE `checklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_checklist_toilet_idx` (`toilet_id`),
  ADD KEY `fk_checklist_users1_idx` (`users_id`);

--
-- Indexes for table `toilet`
--
ALTER TABLE `toilet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checklist`
--
ALTER TABLE `checklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `toilet`
--
ALTER TABLE `toilet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checklist`
--
ALTER TABLE `checklist`
  ADD CONSTRAINT `fk_checklist_toilet` FOREIGN KEY (`toilet_id`) REFERENCES `toilet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_checklist_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
