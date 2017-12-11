-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 11 Gru 2017, 12:32
-- Wersja serwera: 10.1.26-MariaDB
-- Wersja PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `api_db`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `ID` int(10) NOT NULL,
  `nazwa` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `mail` varchar(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `uprawnienia` int(1) NOT NULL,
  `haslo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`ID`, `nazwa`, `mail`, `uprawnienia`, `haslo`) VALUES
(13, 'ala11', 'ala11@gmail.com', 1, '$2y$10$uLvNZ165drKPAktjWTUqBuhF3wBMvknn3fvpdm/dfk/WytKnlyeCG'),
(15, 'agnieszka', 'goldmannagnieszka@gmail.com', 1, '$2y$10$7y5MMtqjZbpIQ.ixOQsH7Or8eVgKKh44aCGwuvrib89Ottda2xO6u'),
(16, 'krystian', 'krystianlipiec@gmail.com', 0, '$2y$10$ga1Y9cjpbyawe4N7olDdxel1JwEttyfZomPAyb0z/jvbEIDPvoMoq');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
