-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Oca 2021, 21:47:06
-- Sunucu sürümü: 10.4.17-MariaDB
-- PHP Sürümü: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `satisvestok`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `Id` int(11) NOT NULL,
  `Adi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`Id`, `Adi`, `ParentId`) VALUES
(1, 'Bilgisayar', 0),
(2, 'Küçük Ev Aletleri', 0),
(3, 'Ütü', 2),
(4, 'Elektrik Süpürgesi', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri`
--

CREATE TABLE `musteri` (
  `Id` int(11) NOT NULL,
  `AdiSoyadi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Telefon` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adres` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `musteri`
--

INSERT INTO `musteri` (`Id`, `AdiSoyadi`, `Telefon`, `Adres`) VALUES
(2, 'Ahmet Dursun', '5413967678', 'orda biryerde'),
(3, 'Kazım Baş', '5544465566', 'eee'),
(4, 'Gürkan', 'Öz', '444ddd'),
(40, 'df', 'f', 'ff');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel`
--

CREATE TABLE `personel` (
  `Id` int(11) NOT NULL,
  `AdiSoyadi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `personel`
--

INSERT INTO `personel` (`Id`, `AdiSoyadi`, `Email`) VALUES
(1, 'Berke Güneş', 'berkeleexd@gmail.com'),
(2, 'Selim Savaş', 'selimsavas16@gmail.com'),
(4, 'Satış Personeli', 'satispersonel@gmail.com'),
(9, 'ziya gül', 'ewq'),
(10, '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `satis`
--

CREATE TABLE `satis` (
  `Id` int(11) NOT NULL,
  `UrunId` int(11) DEFAULT NULL,
  `MusteriId` int(11) DEFAULT NULL,
  `Tarih` date DEFAULT NULL,
  `Adet` int(11) DEFAULT NULL,
  `PersonelId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `satis`
--

INSERT INTO `satis` (`Id`, `UrunId`, `MusteriId`, `Tarih`, `Adet`, `PersonelId`) VALUES
(2, 2, 2, '2021-01-19', 1, 1),
(3, 2, 3, '2021-01-20', 1, 1),
(4, 1, 2, '2021-01-21', 5, 1),
(5, 1, 3, '2021-01-21', 3, 1),
(6, 1, 4, '2021-01-21', 5, 1),
(7, 2, 3, '2021-01-22', 3, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stok`
--

CREATE TABLE `stok` (
  `Id` int(11) NOT NULL,
  `UrunId` int(11) DEFAULT NULL,
  `PersonelId` int(11) DEFAULT NULL,
  `Tarih` date DEFAULT NULL,
  `Adet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `stok`
--

INSERT INTO `stok` (`Id`, `UrunId`, `PersonelId`, `Tarih`, `Adet`) VALUES
(1, 1, 1, '2021-01-13', 4),
(14, 1, 2, '2021-01-13', 6),
(15, 1, 2, '2021-01-13', 5),
(16, 1, 2, '2021-01-13', 5),
(17, 2, 4, '2021-01-16', 32),
(18, 2, 4, '2021-01-16', 5),
(19, 2, 1, '2021-01-17', 5),
(20, 2, 1, '2021-01-19', -1),
(21, 2, 1, '2021-01-20', -1),
(22, 1, 1, '2021-01-21', -5),
(23, 1, 1, '2021-01-21', -3),
(24, 1, 1, '2021-01-21', -5),
(25, 1, 1, '2021-01-22', 5),
(26, 2, 1, '2021-01-22', 3),
(27, 2, 1, '2021-01-22', -3),
(28, 1, 2, '2021-01-22', 3),
(29, 1, 2, '2021-01-22', 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `Id` int(11) NOT NULL,
  `Adi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `KategoriId` int(11) DEFAULT NULL,
  `Tarih` date DEFAULT NULL,
  `Fiyat` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`Id`, `Adi`, `KategoriId`, `Tarih`, `Fiyat`) VALUES
(1, 'Acer A315', 1, '2021-01-22', '30'),
(2, 'Fakir Ütü', 3, '2021-01-22', '44'),
(6, 'Asus ROG', 1, '2021-01-22', '4000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yetkiler`
--

CREATE TABLE `yetkiler` (
  `Id` int(11) NOT NULL,
  `Adi` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yetkiler`
--

INSERT INTO `yetkiler` (`Id`, `Adi`) VALUES
(1, 'admin'),
(2, 'Satış Elemanı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yonetici`
--

CREATE TABLE `yonetici` (
  `Id` int(11) NOT NULL,
  `YetkiId` int(11) DEFAULT NULL,
  `PersonelId` int(11) DEFAULT NULL,
  `Sifre` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yonetici`
--

INSERT INTO `yonetici` (`Id`, `YetkiId`, `PersonelId`, `Sifre`) VALUES
(1, 1, 1, 'kamyon'),
(2, 1, 2, '123'),
(3, 2, 4, '123');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `musteri`
--
ALTER TABLE `musteri`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `satis`
--
ALTER TABLE `satis`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `yetkiler`
--
ALTER TABLE `yetkiler`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `yonetici`
--
ALTER TABLE `yonetici`
  ADD PRIMARY KEY (`Id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `musteri`
--
ALTER TABLE `musteri`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Tablo için AUTO_INCREMENT değeri `personel`
--
ALTER TABLE `personel`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `satis`
--
ALTER TABLE `satis`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `stok`
--
ALTER TABLE `stok`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `yetkiler`
--
ALTER TABLE `yetkiler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `yonetici`
--
ALTER TABLE `yonetici`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
