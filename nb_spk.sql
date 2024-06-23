-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Jun 2024 pada 06.08
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nb_spk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alternatif`
--

CREATE TABLE `alternatif` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `institusi` varchar(50) NOT NULL,
  `jk` enum('L','P') NOT NULL DEFAULT 'L'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `alternatif`
--

INSERT INTO `alternatif` (`id`, `nama`, `prodi`, `institusi`, `jk`) VALUES
(7, 'HANIF ISNAIN', 'TEKNIK INFORMATIKA', 'POLTEK HARBER', 'L'),
(22, 'haikal', 'informatika', 'poltek harber', 'L');

-- --------------------------------------------------------

--
-- Struktur dari tabel `alt_nilai`
--

CREATE TABLE `alt_nilai` (
  `id` int(11) NOT NULL,
  `alt_id` int(11) NOT NULL,
  `c1` double NOT NULL,
  `c2` double NOT NULL,
  `c3` double NOT NULL,
  `c4` double NOT NULL,
  `c5` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `alt_nilai`
--

INSERT INTO `alt_nilai` (`id`, `alt_id`, `c1`, `c2`, `c3`, `c4`, `c5`) VALUES
(7, 7, 5, 3, 4, 3, 4),
(18, 22, 5, 4, 5, 2, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `alt_norm`
--

CREATE TABLE `alt_norm` (
  `id` int(11) NOT NULL,
  `alt_id` int(11) NOT NULL,
  `c1` double NOT NULL,
  `c2` double NOT NULL,
  `c3` double NOT NULL,
  `c4` double NOT NULL,
  `c5` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `alt_norm`
--

INSERT INTO `alt_norm` (`id`, `alt_id`, `c1`, `c2`, `c3`, `c4`, `c5`) VALUES
(1, 7, 0.7071067811865475, 0.6, 0.6246950475544243, 0.8320502943378437, 0.7071067811865475),
(2, 22, 0.7071067811865475, 0.8, 0.7808688094430304, 0.5547001962252291, 0.7071067811865475);

-- --------------------------------------------------------

--
-- Struktur dari tabel `alt_norm_terbobot`
--

CREATE TABLE `alt_norm_terbobot` (
  `id` int(11) NOT NULL,
  `alt_id` int(11) NOT NULL,
  `c1` double NOT NULL,
  `c2` double NOT NULL,
  `c3` double NOT NULL,
  `c4` double NOT NULL,
  `c5` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `alt_norm_terbobot`
--

INSERT INTO `alt_norm_terbobot` (`id`, `alt_id`, `c1`, `c2`, `c3`, `c4`, `c5`) VALUES
(1, 7, 3.5355339059327373, 2.4, 2.498780190217697, 1.6641005886756874, 1.414213562373095),
(2, 22, 3.5355339059327373, 3.2, 3.1234752377721215, 1.1094003924504583, 1.414213562373095);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE `hasil` (
  `id` int(11) NOT NULL,
  `alt_id` int(11) NOT NULL,
  `dplus` double NOT NULL,
  `dminus` double NOT NULL,
  `v` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `hasil`
--

INSERT INTO `hasil` (`id`, `alt_id`, `dplus`, `dminus`, `v`) VALUES
(1, 7, 1.0150093115036063, 0.5547001962252291, 0.35337761126758277),
(2, 22, 0.5547001962252291, 1.0150093115036063, 0.6466223887324172);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ideal`
--

CREATE TABLE `ideal` (
  `id` int(11) NOT NULL,
  `flag` enum('A+','A-') NOT NULL DEFAULT 'A+',
  `c1` double NOT NULL,
  `c2` double NOT NULL,
  `c3` double NOT NULL,
  `c4` double NOT NULL,
  `c5` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ideal`
--

INSERT INTO `ideal` (`id`, `flag`, `c1`, `c2`, `c3`, `c4`, `c5`) VALUES
(1, 'A+', 3.5355339059327373, 3.2, 3.1234752377721215, 1.6641005886756874, 1.414213562373095),
(2, 'A-', 3.5355339059327373, 2.4, 2.498780190217697, 1.1094003924504583, 1.414213562373095);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `label` enum('cost','benefit') NOT NULL DEFAULT 'benefit',
  `bobot` int(11) NOT NULL,
  `flag` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id`, `nama`, `label`, `bobot`, `flag`) VALUES
(1, 'IPK', 'benefit', 5, 'c1'),
(2, 'TES PENGETAHUAN UMUM', 'benefit', 4, 'c2'),
(3, 'TES BAHASA INGGRIS', 'benefit', 4, 'c3'),
(4, 'SERTIFIKAT KEAHLIAN', 'benefit', 2, 'c4'),
(5, 'LOMBA', 'benefit', 2, 'c5');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `alt_nilai`
--
ALTER TABLE `alt_nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alt_id` (`alt_id`);

--
-- Indeks untuk tabel `alt_norm`
--
ALTER TABLE `alt_norm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alt_id` (`alt_id`);

--
-- Indeks untuk tabel `alt_norm_terbobot`
--
ALTER TABLE `alt_norm_terbobot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alt_id` (`alt_id`);

--
-- Indeks untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alt_id` (`alt_id`);

--
-- Indeks untuk tabel `ideal`
--
ALTER TABLE `ideal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `alt_nilai`
--
ALTER TABLE `alt_nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `alt_norm`
--
ALTER TABLE `alt_norm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `alt_norm_terbobot`
--
ALTER TABLE `alt_norm_terbobot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ideal`
--
ALTER TABLE `ideal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alt_nilai`
--
ALTER TABLE `alt_nilai`
  ADD CONSTRAINT `alt_nilai_ibfk_1` FOREIGN KEY (`alt_id`) REFERENCES `alternatif` (`id`);

--
-- Ketidakleluasaan untuk tabel `alt_norm`
--
ALTER TABLE `alt_norm`
  ADD CONSTRAINT `alt_norm_ibfk_1` FOREIGN KEY (`alt_id`) REFERENCES `alternatif` (`id`);

--
-- Ketidakleluasaan untuk tabel `alt_norm_terbobot`
--
ALTER TABLE `alt_norm_terbobot`
  ADD CONSTRAINT `alt_norm_terbobot_ibfk_1` FOREIGN KEY (`alt_id`) REFERENCES `alternatif` (`id`);

--
-- Ketidakleluasaan untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`alt_id`) REFERENCES `alternatif` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
