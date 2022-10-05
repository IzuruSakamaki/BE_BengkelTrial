-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 05, 2022 at 04:02 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schizumy_bengkelprint`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_mesin`
--

CREATE TABLE `jenis_mesin` (
  `id_mesin` int(1) NOT NULL,
  `nama_mesin` varchar(255) NOT NULL,
  `keterangan_mesin` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_mesin`
--

INSERT INTO `jenis_mesin` (`id_mesin`, `nama_mesin`, `keterangan_mesin`) VALUES
(1, 'Riecat Alfa Gen 1', 'Sebuah mesin yang mampu mencetak lebih dari satu kertas bening berwarna putih modern'),
(2, 'Riecat Alfa Gen 2', 'Sebuah mesin yang mampu mencetak lebih dari satu kertas bening berwarna putih modern'),
(3, 'Riecat Alfa Gen 3', 'Sebuah mesin yang mampu mencetak lebih dari satu kertas bening berwarna putih modern');

-- --------------------------------------------------------

--
-- Table structure for table `log_perbaikan`
--

CREATE TABLE `log_perbaikan` (
  `id_perbaikan` int(11) NOT NULL,
  `serial_number` varchar(14) NOT NULL,
  `nama_sparepart` varchar(255) NOT NULL,
  `tanggal_perbaikan` date NOT NULL,
  `id_teknisi` int(1) NOT NULL,
  `jumlah_sparepart` int(4) NOT NULL,
  `status_perbaikan` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_perbaikan`
--

INSERT INTO `log_perbaikan` (`id_perbaikan`, `serial_number`, `nama_sparepart`, `tanggal_perbaikan`, `id_teknisi`, `jumlah_sparepart`, `status_perbaikan`) VALUES
(1, 'ALF.1234567890', 'Baut Epson L1800', '2021-04-18', 4, 5, 'Selesai'),
(2, 'ALF.1234567890', 'Baut Epson L1800', '2021-04-19', 3, 20, 'Selesai'),
(3, 'ALF.1234567890', 'Capping Station L1800 / 1390', '2021-04-20', 2, 100, 'Selesai'),
(4, 'ALF.1234567890', 'Capping Station L1800 / 1390', '2021-04-21', 1, 12, 'Proses');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_mesin`
--

CREATE TABLE `pesanan_mesin` (
  `serial_number` varchar(14) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `id_mesin` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan_mesin`
--

INSERT INTO `pesanan_mesin` (`serial_number`, `email_user`, `id_mesin`) VALUES
('ALF.1234567890', 'akundummy@gmail.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `teknisi_perbaikan`
--

CREATE TABLE `teknisi_perbaikan` (
  `id_teknisi` int(2) NOT NULL,
  `kota_teknisi` varchar(255) NOT NULL,
  `penanggungjawab_teknisi` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teknisi_perbaikan`
--

INSERT INTO `teknisi_perbaikan` (`id_teknisi`, `kota_teknisi`, `penanggungjawab_teknisi`) VALUES
(1, 'BP Surabaya', 'Adam Malik'),
(2, 'BP Jember', 'Istianingsih'),
(3, 'BP Malang', 'Saifullah'),
(4, 'BP Makassar', 'Andre Moda');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_perbaikan`
--
ALTER TABLE `log_perbaikan`
  ADD PRIMARY KEY (`id_perbaikan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_perbaikan`
--
ALTER TABLE `log_perbaikan`
  MODIFY `id_perbaikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
