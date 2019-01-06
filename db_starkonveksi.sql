-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2018 at 12:05 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_starkonveksi`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`nama`,`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`user_id`, `nama`, `email`, `password`, `status`) VALUES
(1, 'Bernard Mauri', 'mauridsantos70@gmail.com', '57d008a62bec98fd65e769f677448a61', 1);

-- --------------------------------------------------------

--
-- Table structure for table `informasi`
--

CREATE TABLE IF NOT EXISTS `informasi` (
  `informasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  PRIMARY KEY (`informasi_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `informasi`
--

INSERT INTO `informasi` (`informasi_id`, `nama`, `slug`, `isi`) VALUES
(1, 'Tentang Kami', 'tentang-kami', 'INilah tentang kami'),
(2, 'FAQ', 'faq', 'Ini adalah isi dari slug.'),
(3, 'Cara Pengiriman', 'cara-pengiriman', 'Ini adalah cara pengiriman untuk transaksi di toko online kami.'),
(4, 'Kebijakan Privasi', 'kebijakan-privasi', 'Kebijakan privasi anda saat menggunakan layanan di toko online kami.');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `kategori_id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(250) NOT NULL,
  `deskripsi` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `nama`, `deskripsi`, `status`) VALUES
(1, 'Noken', 'Noken', 1),
(2, 'Koteka', 'Koteka', 1);

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE IF NOT EXISTS `konfirmasi` (
  `pesanan_id` int(5) NOT NULL,
  `metode_pembayaran` varchar(30) NOT NULL,
  `no_rekening` int(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_bayar` int(20) NOT NULL,
  `cek` tinyint(1) NOT NULL,
  UNIQUE KEY `pesanan_id` (`pesanan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`pesanan_id`, `metode_pembayaran`, `no_rekening`, `nama`, `tanggal`, `jumlah_bayar`, `cek`) VALUES
(1, 'Transfer e-banking', 2147483647, 'Gatot Subroto', '2013-06-12', 200000, 1),
(2, 'Transfer ATM', 0, 'Gaston Castano', '0000-00-00', 0, 0),
(23, 'Transfer ATM', 11111111, 'Andy Murray', '2013-07-04', 12000000, 1),
(35, 'Transfer ATM', 2147483647, 'kenji', '2018-10-31', 400000, 1),
(36, 'Transfer ATM', 2147483647, 'suares', '2018-11-01', 400000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
  `provinsi_id` int(2) NOT NULL,
  `kota_id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `ongkos_kirim` int(10) NOT NULL,
  PRIMARY KEY (`kota_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`provinsi_id`, `kota_id`, `nama`, `ongkos_kirim`) VALUES
(1, 1, 'Jakarta Pusat', 13000),
(3, 2, 'Bandung', 13500),
(4, 3, 'Semarang', 10000),
(1, 4, 'Jakarta Barat', 20000),
(1, 5, 'Jakarta Utara', 25000),
(1, 6, 'Jakarta Selatan', 17500),
(1, 7, 'Jakarta Timur', 18500),
(2, 8, 'Tangerang', 19500),
(3, 9, 'Bekasi', 10000),
(3, 10, 'Bogor', 23000),
(6, 11, 'Surabaya', 13000),
(5, 12, 'Bantul', 10000),
(5, 13, 'Sleman', 12000),
(7, 14, 'Denpasar', 20000),
(7, 15, 'Kuta', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `pelanggan_id` int(5) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kota_id` int(5) NOT NULL,
  `provinsi_id` int(2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `key` varchar(50) NOT NULL,
  PRIMARY KEY (`pelanggan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`pelanggan_id`, `email`, `password`, `nama`, `alamat`, `kota_id`, `provinsi_id`, `status`, `key`) VALUES
(2, 'snellkenji@gmail.com', 'takupas', 'kenjiro snell', 'padang bulan', 1, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE IF NOT EXISTS `pesanan` (
  `pesanan_id` int(5) NOT NULL AUTO_INCREMENT,
  `pelanggan_id` int(5) NOT NULL,
  `alamat` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `kode_pos` int(6) NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl` date NOT NULL,
  `jam` time NOT NULL,
  `kota_id` int(3) NOT NULL,
  `provinsi_id` int(2) NOT NULL,
  PRIMARY KEY (`pesanan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`pesanan_id`, `pelanggan_id`, `alamat`, `kode_pos`, `total`, `status`, `tgl`, `jam`, `kota_id`, `provinsi_id`) VALUES
(1, 2, 'Jl. Tengiri Raya No.1 Yogyakarta 55581', 15810, 200000, 'Dikirim', '2013-06-01', '09:17:17', 6, 1),
(2, 2, 'Jl. Tengiri Raya No.1 Yogyakarta 55581', 43220, 500000, 'Lunas', '2013-06-07', '09:18:24', 4, 1),
(18, 2, 'Jl. S. Parman No. 3', 15834, 100000, 'Baru', '2013-06-28', '21:38:09', 6, 1),
(23, 3, 'Jl Gatot Subroto Km 2', 23330, 150000, 'Ditutup', '2013-07-02', '22:19:43', 12, 5),
(22, 2, 'Jl. S. Parman No. 3', 15334, 30000, 'Baru', '2013-07-04', '22:15:02', 6, 1),
(33, 7, 'ssdasdasd', 121212, 212740, 'Baru', '2013-07-16', '00:30:03', 1, 1),
(34, 7, 'ttest', 13213, 424610, 'Baru', '2013-07-17', '13:37:50', 1, 1),
(35, 2, 'padang bulan', 99332, 386240, 'Lunas', '2018-10-31', '04:24:52', 1, 1),
(36, 2, 'padang bulan', 99332, 195850, 'Lunas', '2018-11-01', '04:01:22', 1, 1),
(37, 2, 'padang bulan', 99332, 193120, 'Baru', '2018-11-01', '06:16:20', 1, 1),
(38, 2, 'padang bulan', 99332, 189420, 'Baru', '2018-11-01', '06:21:20', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_detail`
--

CREATE TABLE IF NOT EXISTS `pesanan_detail` (
  `pesanan_id` int(5) NOT NULL,
  `produk_id` int(5) NOT NULL,
  `jumlah` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan_detail`
--

INSERT INTO `pesanan_detail` (`pesanan_id`, `produk_id`, `jumlah`) VALUES
(1, 1, 90),
(1, 4, 2),
(1, 2, 3),
(2, 6, 1),
(2, 1, 1),
(7, 1, 6),
(9, 5, 1),
(9, 11, 1),
(9, 9, 1),
(12, 11, 1),
(13, 8, 1),
(18, 14, 1),
(18, 11, 1),
(19, 14, 1),
(19, 11, 1),
(20, 14, 1),
(20, 11, 1),
(21, 14, 1),
(21, 11, 1),
(22, 14, 1),
(22, 11, 1),
(23, 10, 1),
(24, 10, 2),
(34, 8, 1),
(34, 10, 1),
(33, 10, 1),
(32, 12, 1),
(31, 16, 1),
(35, 14, 2),
(36, 15, 1),
(37, 14, 1),
(38, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `produk_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `feature` tinyint(1) NOT NULL,
  `harga` float NOT NULL,
  `berat` float NOT NULL,
  `stok` int(5) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`produk_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `nama`, `deskripsi`, `gambar`, `kategori_id`, `feature`, `harga`, `berat`, `stok`, `status`) VALUES
(7, 'Sprei Star Vanity Rose', 'Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux ', 'VanityRose_221112081155_ll.jpg', 0, 0, 220000, 0.78, 10, 1),
(13, 'Noken Kulit Kayu', '																				Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux 																				', '1.jpg', 1, 1, 185000, 0.34, 10, 1),
(14, 'Noken Raju', '																				Bekas dari kelurahan. Dulu dipakai oleh gubernur Jenderal Van Hottman.																				', 'noken-5.jpg', 1, 1, 190000, 0.24, 10, 1),
(15, 'Koteka Ukiran', '																				Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux  Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux Deskripsi singkat Kaos Linux 																				', 'pasar-souvenir-hamadi+-koteka.jpg', 1, 1, 190000, 0.45, 10, 1),
(16, 'Noken Sentani', '																				Sarung bantal ini adalah sarung bantal unik berwarna ungu dengan desain bunga yang menarik																				', 'Noken+Tas+Papua+7.jpg', 2, 1, 90000, 0.5, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produk_review`
--

CREATE TABLE IF NOT EXISTS `produk_review` (
  `review_id` int(3) NOT NULL AUTO_INCREMENT,
  `pelanggan_id` int(5) NOT NULL,
  `isi` longtext NOT NULL,
  `produk_id` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `produk_review`
--

INSERT INTO `produk_review` (`review_id`, `pelanggan_id`, `isi`, `produk_id`, `status`, `tanggal`, `jam`) VALUES
(1, 2, 'Ting ting ting', 16, 0, '2013-06-19', '14:17:35'),
(2, 3, 'Agak lama sih proses pengiriminannya, tapi bagus kok barangnya', 16, 1, '2013-06-23', '14:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE IF NOT EXISTS `provinsi` (
  `provinsi_id` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`provinsi_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`provinsi_id`, `nama`) VALUES
(1, 'DKI Jakarta'),
(2, 'Banten'),
(3, 'Jawa Barat'),
(4, 'Jawa Tengah'),
(5, 'DI Yogyakarta'),
(6, 'Jawa Timur'),
(7, 'Bali');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('7c915834b35515f5739d8acac248a86c', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3', 1541242956, 'a:1:{s:9:"user_data";s:0:"";}');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
