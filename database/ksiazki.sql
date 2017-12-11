-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 11 Gru 2017, 12:29
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
  `Tytul` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Autor` varchar(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `RokWydania` year(4) NOT NULL,
  `Gatunek` varchar(20) NOT NULL,
  `Opis` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `Cena` float NOT NULL,
  `Promocja` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`ID`, `Tytul`, `Autor`, `RokWydania`, `Gatunek`, `Opis`, `Cena`, `Promocja`) VALUES
(27, 'Ostatni policjant', 'Winters Ben', 2017, 'thriller', '„Ostatni policjant” to fascynująca opowieść kryminalna, której akcja rozgrywa się w przededniu totalnej katastrofy. Do Ziemi zbliża się asteroida i nic już nie da się zrobić, by uniknąć zderzenia. Świat pogrąża się w chaosie, następuje niespotykany kryzys ekonomiczny, wojsko wprowadza stan wyjątkowy i patroluje ulice, by powstrzymać armagedon. Szerzy się przestępczość, fanatyzm religijny, panika. I tylko detektyw Hank Palace jak co dnia prowadzi drobiazgowe śledztwo, by poznać prawdę, która nikogo innego już nie obchodzi.', 22.39, NULL),
(28, 'Pierwszy śnieg', 'Nesbo Jo', 2017, 'thriller', 'Detektyw Harry Hole bada sprawę zaginięcia kobiety, której szalika użyto do przystrojenia ulepionego przed jej domem bałwana.', 29.9, NULL),
(29, 'Królowa', 'Cherezińska Elżbieta', 2016, 'historyczna', 'Powieść Elżbiety Cherezińskiej, której „Królowa” jest drugą częścią (po „Hardej”) ma wielu bohaterów, z Bolesławem Chrobrym na czele, i jedną, największą ze wszystkich, heroiną – Świętosławą, królową i matką królów. Władczynię przebiegłą i zuchwałą, mądrą choć nie znającą liter, krzewiącą chrześcijaństwo, a w głębi duszy pozostającą poganka, pełną miłosci dla tych, których kochała i nienawiści dla nieprzyjaciół, tyleż wielkoduszną, ile okrutną. Islandzkie sagi utrwaliły ją jako Sigridę Storradę (Dumną) i był to celny przydomek, gdyż „święte – powiada autorka – miała tylko imię, a całą siebie wykuła z najszlachetniejszej stali”', 30.5, 1),
(30, 'Jeszcze jeden oddech', 'Kalanithi Paul', 2016, 'biografia', 'Poruszająca historia genialnego neurochirurga, który pewnego dnia stał się pacjentem. Opowieść o odchodzeniu w zgodzie z sobą i ze światem.', 48.99, NULL),
(31, 'Gra o tron', 'Martin George', 1996, 'fantasy', 'W Zachodnich Krainach o ośmiu tysiącach lat zapisanej historii widmo wojen i katastrofy nieustannie wisi nad ludźmi. Zbliża się zima, lodowate wichry wieją z północy, gdzie schroniły się wyparte przez ludzi pradawne rasy i starzy bogowie. Zbuntowani władcy na szczęście pokonali szalonego Smoczego Króla, Aerysa Targaryena, zasiadającego na Żelaznym Tronie Zachodnich Krain, lecz obalony władca pozostawił po sobie potomstwo, równie szalone jak on sam... Tron objął Robert - najznamienitszy z buntowników. Minęły już lata pokoju i oto możnowładcy zaczynają grę o tron.', 39.21, 1),
(32, 'Kiedy pada deszcz', 'De Jong Lisa', 2015, 'przygodowa', 'Odkąd sięgam pamięcią, Beau Bennett był moim najlepszym przyjacielem. Kochałam się w nim, zanim wszystko się zawaliło. Teraz chłopak chce ode mnie czegoś więcej, ale nie jestem w stanie mu tego dać. Wszystko się zmieniło. Chciałabym móc powiedzieć mu dlaczego, ale nie potrafię. Nie wiedziałam, jak bardzo go potrzebuję, póki nie wyjechał na studia, a ja zostałam kompletnie sama.\r\n\"Pewnego dnia do miasta zawitał Asher Hunt. Chłopak z ciemnymi, urzekającymi oczyma i zarozumiałym uśmieszkiem tchnął życie w to, co ze mnie pozostało. Pomógł mi zapomnieć o bólu, który więził mnie już od tak dawna.\r\nByłam zraniona. Zostałam ocalona. Odzyskałam nadzieję.\r\nTamtej nocy myślałam, że to koniec mojej historii, jednak teraz wiem, że był to jej nowy początek. Przynajmniej dopóki pewien sekret nie wywrócił mojego świata do góry nogami… Ponownie. Jedna noc na zawsze zmieniła moje życie.\"\r\n', 23.88, NULL),
(33, 'Metro 2033', 'Glukhovsky Dmitry', 2015, 'fantasy', 'Rok 2033. Świat po zagładzie nuklearnej. Ocalali walczą o przetrwanie w sieci moskiewskiego metra. Ich los trafia w ręce młodego Artema.\r\n', 25.4, NULL),
(34, 'Był sobie pies', 'Cameron Bruce', 2017, 'przygodowa', 'Oto pełna głębokich uczuć i zdumiewająca opowieść o oddanym psie, który życiową misją czyni wpajanie swoim właścicielom znaczenia miłości i pogody ducha. To powołanie wypełnia na przestrzeni... kilku żyć.\r\nBailey jest zszokowany – po krótkim i smętnym życiu, jakiego doświadczył w postaci bezpańskiego kundla odradza się w ciele niesfornego szczeniaka. Kiedy trafia pod opiekę ośmiolatka Ethana, który kocha go całym sercem, odkrywa nowe oblicze – dobrego, poczciwego psiaka. Jednak życie u uwielbianej rodziny to nie koniec przygód Baileya. Ponownie odradza się w postaci kolejnego psa!\r\n', 22.98, 1),
(35, 'Pachnidło. Historia pewnego mordercy', 'Suskind Patrick', 2013, 'thriller', 'XVIII-wieczny Paryż, światowe centrum mody i elegancji, jest miejscem, gdzie żyje bohater tej niezwykłej opowieści – osobliwy karzeł obdarzony niepospolicie wrażliwym zmysłem powonienia. Jan Baptysta Grenouille tworzy eliksiry do produkcji perfum, które są powszechnie uznawane za niedoścignione w swej wyszukanej wytworności. Jednak żadne go nie satysfakcjonują, geniusz zapachów marzy bowiem o wydestylowaniu wonności nad wonnościami z dziewiczego ciała kobiecego. Ta myśl każe mu szukać dziewczyny o idealnym zapachu... ', 30.99, 1),
(36, 'Dziewczyna z pociągu', 'Hawkins Paula', 2016, 'thriller', 'Rachel każdego ranka dojeżdża do pracy tym samym pociągiem. Wie, że pociąg zawsze zatrzymuje się przed tym samym semaforem, dokładnie naprzeciwko szeregu domów.\r\nZaczyna się jej nawet wydawać, że zna ludzi, którzy mieszkają w jednym z nich. Uważa, że prowadzą doskonałe życie. Gdyby tylko mogła być tak szczęśliwa jak oni.\r\nI nagle widzi coś wstrząsającego. Widzi tylko przez chwilę, bo pociąg rusza, ale to wystarcza.\r\nWszystko się zmienia. Rachel ma teraz okazję stać się częścią życia ludzi, których widywała jedynie z daleka. Teraz się przekonają, że jest kimś więcej niż tylko dziewczyną z pociągu.', 27.9, NULL),
(37, 'Igrzyska śmierci', 'Collins Suzanne', 2012, 'fantasy', '\"Igrzyska śmierci\", pierwszy tom bestsellerowej trylogii Suzanne Collins, trafia do kin! To opowieść o świecie Panem rządzonym przez okrutne władze, w którym co roku dwójka nastolatków z każdego z dwunastu dystryktów wyrusza na Głodowe Igrzyska, by stoczyć walkę na śmierć i życie.', 35.66, 1),
(38, 'Wieża jaskółki', 'Sapkowski Andrzej', 2014, 'fantasy', 'Przedostatnia odsłona epopei o świecie wiedźmina i wojnach, jakie nim wstrząsają. W zagubionej wśród bagien chacie pustelnika ciężko ranna Ciri powraca do zdrowia. Jej tropem podążają bezlitośni zabójcy z Nilfgaardu.\r\nTymczasem drużyna Geralta, unikając coraz to nowych niebezpieczeństw, dociera wreszcie do ukrywających się druidów. Czy wiedźminowi uda się odnaleźć Ciri? Jaką rolę odegra osnuta legendą Wieża Jaskółki?', 35.99, NULL),
(39, 'Katarzyna Wielka. Gra o władzę', 'Stachniak Ewa', 2012, 'historyczna', 'Portret jednej z najbardziej bezwzględnych kobiet w historii.\r\nMłodziutka, na pozór niewinna księżniczka Katarzyna przybywa na życzenie carycy Elżbiety do Pałacu Zimowego. Zostaje przedstawiona jako kandydatka na żonę Piotra - następcy rosyjskiego tronu. Wybór ten zdecydowanie nie wszystkim przypada do gustu.\r\nAby przetrwać, musi przyswoić sobie reguły pałacowej gry i pamiętać o jednym: wszyscy oszukują.', 35.9, NULL),
(40, 'Hrabina. Tragiczna historia Elżbiety Batory', 'Johns Rebecca', 2013, 'biografia', 'Oskarżana o czary, morderstwa młodych kobiet, a nawet\r\nkąpiel w ich krwi. Do dziś krążą legendy o jej wyjątkowym okrucieństwie wobec sług, a także licznych kochankach obojga płci.\r\nCzy Elżbieta była bestią wyzutą z ludzkich uczuć,\r\nbrutalnie mordującą niewinne kobiety, aby zachować młodość? A może padła ofiarą politycznych rozgrywek?', 34.55, NULL),
(41, 'Dziewczyny wyklęte', 'Nowak Szymon', 2015, 'biografia', 'Pierwsza na naszym rynku książka o dziewczynach z antykomunistycznego podziemia – o tych bardzo znanych i niemal zupełnie zapomnianych. O tych, które nie zawahały się, by oddać krajowi swą młodość, a niejednokrotnie i życie.', 36.9, 1),
(42, 'Gladiatorka', 'Whitfield Russel', 2010, 'przygodowa', 'W czasach, kiedy Rzymem rządziła dynastia Flawiuszy, a tradycyjne walki gladiatorów coraz rzadziej zaspokajały apetyty żądnej krwi gawiedzi, na arenie pojawił się nowy rodzaj wojownika: gladiator-kobieta.\r\nSpartańska kapłanka Lysandra nigdy nie przypuszczała, że będzie musiała walczyć o swoje życie na arenie. Przewrotny los sprawia jednak, że statek, którym podróżuje, tonie, wyrzucając rozbitków u wybrzeży Azji Mniejszej.\r\nDziewczyna trafia w ręce Lucjusza Balbusa – właściciela jednej z największych szkół dla gladiatorek w Cesarstwie Wschodnim. ', 23.99, NULL),
(43, 'Ludojady z Kumaonu', 'Corbett Jim', 2000, 'przygodowa', 'Siedmiu czworonożnych zabójców. Setki ofiar. Bezkresne przestrzenie podhimalajskich lasów. Dziesięć mrożących krew w żyłach opowieści o tropieniu, podchodzeniu i zabijaniu. A jednocześnie drobiazgowy opis egzotycznej fauny i flory oraz trudów życia indyjskich wieśniaków całkowicie podporządkowanych surowemu prawu dżungli. Jedyny w swoim rodzaju hołd złożony jednocześnie życiu, walce o nie i śmierci.', 30.89, 0),
(44, 'Ostatni policjant', 'Winters Ben', 2013, 'fantasy', 'aaaaa', 23.99, NULL);

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
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
