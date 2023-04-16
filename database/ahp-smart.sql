-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2023 at 04:23 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ahp-smart`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `kode_alternatif` varchar(11) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `kode_alternatif`, `nama`) VALUES
(1, 'A1', 'Dompyong Kulon'),
(2, 'A2', 'Dompyong Wetan'),
(3, 'A3', 'Kalimaro'),
(4, 'A4', 'Kalimekar'),
(5, 'A5', 'Gebang'),
(6, 'A6', 'Gebang Udik'),
(7, 'A7', 'Gebang Ilir'),
(8, 'A8', 'Gebang Mekar'),
(9, 'A9', 'Gebang Kulon'),
(10, 'A10', 'Gagasari'),
(11, 'A11', 'Kalipasung'),
(12, 'A12', 'Playangan'),
(13, 'A13', 'Melakasari');

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_alternatif`, `nilai`) VALUES
(1, 1, 51.23),
(2, 2, 64.09),
(3, 3, 35.92),
(4, 4, 28.46),
(5, 5, 44.99),
(6, 6, 73.59),
(7, 7, 42.43),
(8, 8, 24.11),
(9, 9, 43.52),
(10, 10, 48.78),
(11, 11, 52.03),
(12, 12, 30.5),
(13, 13, 17.23);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `id_kriteria`, `nama_kategori`) VALUES
(1, 0, 'sosial'),
(3, 0, 'Kesehatan'),
(4, 0, 'Pendidikan'),
(5, 0, 'Permukiman'),
(6, 0, 'Ekonomi'),
(7, 0, 'Lingkungan');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `kode_kriteria` varchar(20) NOT NULL,
  `bobot` float DEFAULT NULL,
  `jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `keterangan`, `kode_kriteria`, `bobot`, `jenis`) VALUES
(49, 'Sosial', 'K1', 0.0651, 'Benefit'),
(50, 'Kesehatan', 'K2', 0.3875, 'Benefit'),
(51, 'Pendidikan', 'K3', 0.1629, 'Benefit'),
(52, 'Permukiman', 'K4', 0.0407, 'Benefit'),
(53, 'Ekonomi', 'K5', 0.0975, 'Benefit'),
(54, 'Lingkungan', 'K6', 0.2464, 'Benefit');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_ahp`
--

CREATE TABLE `kriteria_ahp` (
  `id_kriteria_ahp` int(11) NOT NULL,
  `id_kriteria_1` int(11) NOT NULL,
  `id_kriteria_2` int(11) NOT NULL,
  `nilai_1` float NOT NULL,
  `nilai_2` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria_ahp`
--

INSERT INTO `kriteria_ahp` (`id_kriteria_ahp`, `id_kriteria_1`, `id_kriteria_2`, `nilai_1`, `nilai_2`) VALUES
(2188, 49, 50, 0.2, 5),
(2189, 49, 51, 0.3333, 3),
(2190, 49, 52, 3, 0.3333),
(2191, 49, 53, 0.3333, 3),
(2192, 49, 54, 0.2, 5),
(2193, 50, 51, 3, 0.3333),
(2194, 50, 52, 5, 0.2),
(2195, 50, 53, 5, 0.2),
(2196, 50, 54, 3, 0.3333),
(2197, 51, 52, 5, 0.2),
(2198, 51, 53, 3, 0.3333),
(2199, 51, 54, 0.3333, 3),
(2200, 52, 53, 0.3333, 3),
(2201, 52, 54, 0.2, 5),
(2202, 53, 54, 0.3333, 3);

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`id_penilaian`, `id_alternatif`, `id_kriteria`, `nilai`) VALUES
(2, 1, 50, 10),
(3, 1, 51, 17),
(4, 1, 52, 26),
(5, 1, 53, 37),
(6, 1, 54, 39),
(8, 2, 50, 9),
(9, 2, 51, 20),
(10, 2, 52, 26),
(11, 2, 53, 37),
(12, 2, 54, 39),
(13, 3, 49, 1),
(14, 3, 50, 11),
(15, 3, 51, 22),
(16, 3, 52, 24),
(17, 3, 53, 33),
(18, 3, 54, 39),
(19, 3, 49, 1),
(20, 3, 50, 11),
(21, 3, 51, 22),
(22, 3, 52, 24),
(23, 3, 53, 33),
(24, 3, 54, 39),
(25, 4, 49, 2),
(26, 4, 50, 11),
(27, 4, 51, 22),
(28, 4, 52, 25),
(29, 4, 53, 50),
(30, 4, 54, 39),
(31, 5, 49, 1),
(32, 5, 50, 12),
(33, 5, 51, 23),
(34, 5, 52, 24),
(35, 5, 53, 51),
(36, 5, 54, 38),
(37, 6, 49, 42),
(38, 6, 50, 9),
(39, 6, 51, 19),
(40, 6, 52, 24),
(41, 6, 53, 51),
(42, 6, 54, 40),
(43, 6, 49, 42),
(44, 6, 50, 9),
(45, 6, 51, 19),
(46, 6, 52, 24),
(47, 6, 53, 51),
(48, 6, 54, 40),
(50, 7, 50, 11),
(51, 7, 51, 17),
(52, 7, 52, 24),
(53, 7, 53, 32),
(54, 7, 54, 39),
(56, 8, 50, 11),
(57, 8, 51, 47),
(58, 8, 52, 25),
(59, 8, 53, 36),
(60, 8, 54, 40),
(61, 9, 49, 2),
(62, 9, 50, 12),
(63, 9, 51, 18),
(64, 9, 52, 24),
(65, 9, 53, 34),
(66, 9, 54, 39),
(67, 10, 49, 1),
(68, 10, 50, 10),
(69, 10, 51, 48),
(70, 10, 52, 24),
(71, 10, 53, 35),
(72, 10, 54, 39),
(73, 11, 49, 1),
(74, 11, 50, 10),
(75, 11, 51, 47),
(76, 11, 52, 24),
(77, 11, 53, 33),
(78, 11, 54, 39),
(79, 12, 49, 2),
(80, 12, 50, 11),
(81, 12, 51, 21),
(82, 12, 52, 24),
(83, 12, 53, 53),
(84, 12, 54, 40),
(85, 13, 49, 43),
(86, 13, 50, 11),
(87, 13, 51, 21),
(88, 13, 52, 25),
(89, 13, 53, 50),
(90, 13, 54, 41),
(91, 1, 49, 44),
(92, 2, 49, 44),
(93, 7, 49, 45),
(94, 8, 49, 46);

-- --------------------------------------------------------

--
-- Table structure for table `sub_kriteria`
--

CREATE TABLE `sub_kriteria` (
  `id_sub_kriteria` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `deskripsi` varchar(225) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_kriteria`
--

INSERT INTO `sub_kriteria` (`id_sub_kriteria`, `id_kriteria`, `deskripsi`, `nilai`) VALUES
(1, 49, 'Gotong royong, Ketersediaan publik, Kelompok olahraga, Fasilitas olahraga, Poskamling, Siskamling, Konflik', 70),
(2, 49, 'Kategori tidak ada 1 (Ketersediaan publik)', 60),
(3, 49, 'Kategori tidak ada 1 (Kelompok olahraga)', 60),
(9, 50, 'Bidan, Dokter, nakes lain, bpjs, Posyandu, Poskesdes', 60),
(10, 50, 'Kategori tidak ada 1 (dokter)', 50),
(11, 50, 'Kategori tidak ada 2 (Dokter, nakes lain)', 40),
(12, 50, 'Kategori tidak ada 2 (Dokter, poskesdes)', 40),
(13, 50, 'Kategori tidak ada 4', 20),
(14, 50, 'Kategori tidak ada 5', 10),
(15, 50, 'Kategori tidak ada semua', 0),
(16, 51, 'SD, SMP, SMA/SMK, PAUD, Paket ABC, Kursus, Taman baca/Perpustakaan desa', 70),
(17, 51, 'Kategori tidak ada 1 (Taman baca/Perpustakaan desa)', 60),
(18, 51, 'Kategori tidak ada 1 (Paket ABC)', 60),
(19, 51, 'Kategori tidak ada 2 (SMK, Taman baca/Perpustakaan desa)', 50),
(20, 51, 'Kategori tidak ada 3 (Paket ABC, Kursus, Taman baca/Perpustakaan desa)', 40),
(21, 51, 'Kategori tidak ada 3 (SMP, Paket, Kursus)', 40),
(22, 51, 'Kategori tidak ada 4 (SMP ,SMK, paket ABC, Taman baca/Perpustakaan desa)', 30),
(23, 51, 'Kategori tidak ada 4 (SMP ,SMK, paket ABC, kursus)', 30),
(24, 52, 'Air Minum, Air mandi dan cuci, jamban, Pembuangan sampah, Sinyal telepon, Internet kantor desa', 60),
(25, 52, 'Kategori tidak ada 1 (Pembuangan sampah)', 50),
(26, 52, 'Kategori tidak ada 2 (Pembuangan sampah, Internet kantor desa)', 40),
(27, 52, 'Kategori tidak ada 3', 30),
(28, 52, 'Kategori tidak ada 4', 20),
(29, 52, 'Kategori tidak ada 5', 10),
(30, 52, 'Kategori tidak ada semua', 0),
(31, 53, 'Kelompok pertokoan, Pasar, Warung kelontong, Penginapan, Pos logistik, Bumdes', 60),
(32, 53, 'Kategori tidak ada 1 (Penginapan)', 50),
(33, 53, 'Kategori tidak ada 2 (Pasar, bumdes)', 40),
(34, 53, 'Kategori tidak ada 2 (Pasar, pos logistik)', 40),
(35, 53, 'Kategori tidak ada 2 (Pasar, Penginapan)', 40),
(36, 53, 'Kategori tidak ada 2 (Pos logistik, penginapan)', 40),
(37, 53, 'Kategori tidak ada 3 (Kelompok pertokoan, Pasar, Bumdes)', 30),
(38, 54, 'Pencemaran, Bencana, Mitigasi', 30),
(39, 54, 'Kategori tidak ada 1 (Mitigasi)', 20),
(40, 54, 'Kategori tidak ada 1 (Bencana)', 20),
(41, 54, 'Kategori tidak ada 2 (Mitigasi, bencana)', 10),
(42, 49, 'Kategori tidak ada 2 ( Kelompok olahraga, konflik)', 50),
(43, 49, 'Kategori tidak ada 2 (Kelompok olahraga, fasilitas olahraga)', 50),
(44, 49, 'Kategori tidak ada 3 (Ketersediaan publik, poskamling, siskamling)', 40),
(45, 49, 'Kategori tidak ada 3 (Ketersediaan Publik, kelompok olahraga, fasilitas olahraga)', 40),
(46, 49, 'Kategori tidak ada 3 (Ketersediaan publik, kelompok olahraga, konflik)', 40),
(47, 51, 'Kategori tidak ada 5 (SMP ,SMK, paket ABC, kursus, Taman baca/Perpustakaan desa)', 20),
(48, 51, 'Kategori tidak ada 6 (SMP ,SMK, Paud, paket ABC, kursus, Taman baca/Perpustakaan desa)', 10),
(49, 51, 'Kategori tidak ada semua', 0),
(50, 53, 'Kategori tidak ada 3 (Penginapan, Pasar, Bumdes)', 30),
(51, 53, 'Kategori tidak ada 3 (Pos logistik, Pasar, Penginapan)', 30),
(52, 54, 'Kategori tidak ada semua', 0),
(53, 53, 'Kategori tidak ada 4 (Pos logistik, Pasar, Penginapan, pertokoan)', 20),
(54, 49, 'Kategori tidak ada semua', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_user_level`, `nama`, `email`, `username`, `password`) VALUES
(1, 1, 'Admin', 'admin@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(7, 2, 'Kepala Kecamatan', 'user@gmail.com', 'camat', 'e0dc1c969db5fa159c0e3ccc290e2314');

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id_user_level` int(11) NOT NULL,
  `user_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id_user_level`, `user_level`) VALUES
(1, 'Administrator'),
(2, 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_alternatif` (`id_alternatif`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `kriteria_ahp`
--
ALTER TABLE `kriteria_ahp`
  ADD PRIMARY KEY (`id_kriteria_ahp`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `nilai` (`nilai`);

--
-- Indexes for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD PRIMARY KEY (`id_sub_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user_level` (`id_user_level`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_user_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `kriteria_ahp`
--
ALTER TABLE `kriteria_ahp`
  MODIFY `id_kriteria_ahp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2203;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  MODIFY `id_sub_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_user_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_3` FOREIGN KEY (`nilai`) REFERENCES `sub_kriteria` (`id_sub_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD CONSTRAINT `sub_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_user_level`) REFERENCES `user_level` (`id_user_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
