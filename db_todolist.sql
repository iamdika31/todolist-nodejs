-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01 Jan 2020 pada 16.08
-- Versi Server: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_todolist`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_task`
--

CREATE TABLE `list_task` (
  `id_task` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `namaTugas` varchar(100) NOT NULL,
  `urgensi` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `list_task`
--

INSERT INTO `list_task` (`id_task`, `tanggal`, `namaTugas`, `urgensi`) VALUES
(2, '2020-01-07', 'Membeli popok', 2),
(10, '2020-01-09', 'Les bahasa', 4),
(11, '2020-01-02', 'Menyapu rumah', 3),
(12, '2020-01-07', 'Membeli shampo', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `urgensi`
--

CREATE TABLE `urgensi` (
  `id_urgensi` int(5) NOT NULL,
  `urgensi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `urgensi`
--

INSERT INTO `urgensi` (`id_urgensi`, `urgensi`) VALUES
(1, 'Sangat penting'),
(2, 'Penting'),
(3, 'Sedang'),
(4, 'Biasa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `list_task`
--
ALTER TABLE `list_task`
  ADD PRIMARY KEY (`id_task`);

--
-- Indexes for table `urgensi`
--
ALTER TABLE `urgensi`
  ADD PRIMARY KEY (`id_urgensi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `list_task`
--
ALTER TABLE `list_task`
  MODIFY `id_task` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `urgensi`
--
ALTER TABLE `urgensi`
  MODIFY `id_urgensi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
