-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Paź 2017, 20:07
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
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `ID` int(10) NOT NULL,
  `Tytul` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Autor` varchar(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `RokWydania` year(4) NOT NULL,
  `Gatunek` varchar(20) NOT NULL,
  `Opis` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `Cena` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`ID`, `Tytul`, `Autor`, `RokWydania`, `Gatunek`, `Opis`, `Cena`) VALUES
(18, 'Ostatni policjant', 'Winters Ben', 2017, 'thriller', '„Ostatni policjant” to fascynująca opowieść kryminalna, której akcja rozgrywa się w przededniu totalnej katastrofy. Do Ziemi zbliża się asteroida i nic już nie da się zrobić, by uniknąć zderzenia. Świat pogrąża się w chaosie, następuje niespotykany kryzys ekonomiczny, wojsko wprowadza stan wyjątkowy i patroluje ulice, by powstrzymać armagedon. Szerzy się przestępczość, fanatyzm religijny, panika. I tylko detektyw Hank Palace jak co dnia prowadzi drobiazgowe śledztwo, by poznać prawdę, która nikogo innego już nie obchodzi.', 22.39),
(19, 'Pierwszy śnieg', 'Nesbo Jo', 2017, 'thriller', 'Detektyw Harry Hole bada sprawę zaginięcia kobiety, której szalika użyto do przystrojenia ulepionego przed jej domem bałwana. ', 29.9),
(20, 'Królowa', 'Cherezińska Elżbieta', 2016, 'historyczna', 'Powieść Elżbiety Cherezińskiej, której „Królowa” jest drugą częścią (po „Hardej”) ma wielu bohaterów, z Bolesławem Chrobrym na czele, i jedną, największą ze wszystkich, heroiną – Świętosławą, królową i matką królów. Władczynię przebiegłą i zuchwałą, mądrą choć nie znającą liter, krzewiącą chrześcijaństwo, a w głębi duszy pozostającą poganka, pełną miłosci dla tych, których kochała i nienawiści dla nieprzyjaciół, tyleż wielkoduszną, ile okrutną. Islandzkie sagi utrwaliły ją jako Sigridę Storradę (Dumną) i był to celny przydomek, gdyż „święte – powiada autorka – miała tylko imię, a całą siebie wykuła z najszlachetniejszej stali”.', 30.5),
(21, 'Jeszcze jeden oddech', 'Kalanithi Paul', 2016, 'biografia', 'Poruszająca historia genialnego neurochirurga, który pewnego dnia stał się pacjentem. Opowieść o odchodzeniu w zgodzie z sobą i ze światem.', 48.99),
(22, 'Gra o tron', 'Martin George', 2016, 'fantasy', 'W Zachodnich Krainach o ośmiu tysiącach lat zapisanej historii widmo wojen i katastrofy nieustannie wisi nad ludźmi. Zbliża się zima, lodowate wichry wieją z północy, gdzie schroniły się wyparte przez ludzi pradawne rasy i starzy bogowie. Zbuntowani władcy na szczęście pokonali szalonego Smoczego Króla, Aerysa Targaryena, zasiadającego na Żelaznym Tronie Zachodnich Krain, lecz obalony władca pozostawił po sobie potomstwo, równie szalone jak on sam... Tron objął Robert - najznamienitszy z buntowników. Minęły już lata pokoju i oto możnowładcy zaczynają grę o tron.', 39.21),
(23, 'Kiedy pada deszcz', 'De Jong Lisa', 2015, 'romans', 'Odkąd sięgam pamięcią, Beau Bennett był moim najlepszym przyjacielem. Kochałam się w nim, zanim wszystko się zawaliło. Teraz chłopak chce ode mnie czegoś więcej, ale nie jestem w stanie mu tego dać. Wszystko się zmieniło. Chciałabym móc powiedzieć mu dlaczego, ale nie potrafię. Nie wiedziałam, jak bardzo go potrzebuję, póki nie wyjechał na studia, a ja zostałam kompletnie sama.\r\n\r\n\"Pewnego dnia do miasta zawitał Asher Hunt. Chłopak z ciemnymi, urzekającymi oczyma i zarozumiałym uśmieszkiem tchnął życie w to, co ze mnie pozostało. Pomógł mi zapomnieć o bólu, który więził mnie już od tak dawna.\r\n\r\nByłam zraniona. Zostałam ocalona. Odzyskałam nadzieję.\r\n\r\nTamtej nocy myślałam, że to koniec mojej historii, jednak teraz wiem, że był to jej nowy początek. Przynajmniej dopóki pewien sekret nie wywrócił mojego świata do góry nogami… Ponownie. Jedna noc na zawsze zmieniła moje życie.\"', 23.88),
(24, 'Metro 2033', 'Glukhovsky Dmitry', 2015, 'fantasy', 'Rok 2033. Świat po zagładzie nuklearnej. Ocalali walczą o przetrwanie w sieci moskiewskiego metra. Ich los trafia w ręce młodego Artema.', 25.4),
(25, 'Rozmowy z katem', 'Moczarski Kazimierz', 2009, 'literatura faktu', 'Przez dziewięć miesięcy 1949 roku w jednej celi więziennej przebywali wspólnie: Kazimierz Moczarski, bohater Armii Krajowej, i generał SS Jurgen Stroop, kat warszawskiego getta. Stalinowska brutalność i brak skrupułów postawiły między nimi znak równości. Moczarski, rozmawiając ze Stroopem systematycznie przez kilka miesięcy, zdołał stworzyć jedyny w swoim rodzaju portret osobowości totalitarnej, a zapamiętując wypowiedzi współwięźnia, zachował zgromadzony materiał do późniejszej publikacji. Stworzony w ten sposób wizerunek kata zapada w pamięć bodaj równie mocno jak okoliczności, w których powstawał.', 25.5),
(26, 'Był sobie pies', 'Cameron Bruce', 2017, 'przygodowa', 'Oto pełna głębokich uczuć i zdumiewająca opowieść o oddanym psie, który życiową misją czyni wpajanie swoim właścicielom znaczenia miłości i pogody ducha. To powołanie wypełnia na przestrzeni... kilku żyć.\r\nBailey jest zszokowany – po krótkim i smętnym życiu, jakiego doświadczył w postaci bezpańskiego kundla odradza się w ciele niesfornego szczeniaka. Kiedy trafia pod opiekę ośmiolatka Ethana, który kocha go całym sercem, odkrywa nowe oblicze – dobrego, poczciwego psiaka. Jednak życie u uwielbianej rodziny to nie koniec przygód Baileya. Ponownie odradza się w postaci kolejnego psa!', 22.98);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD KEY `ID` (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
