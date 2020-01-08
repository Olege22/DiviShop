-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 12 2018 г., 00:32
-- Версия сервера: 5.6.37
-- Версия PHP: 7.1.7

-- DROP base IF EXISTS `GU`;
-- create database GU;
-- CREATE DATABASE IF NOT EXISTS 'GU';
DROP DATABASE IF EXISTS `GU`;
-- select 'GU';

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `GU`
--
CREATE DATABASE `GU` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci; -- IF NOT EXISTS 
USE `GU`;

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

DROP TABLE IF EXISTS `basket`;
CREATE TABLE `basket` (
  `id` int(11) NOT NULL,
  `ID_UUID` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `prim` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `status` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `foto_category` varchar(500) NOT NULL,
  `description_category` varchar(1000) NOT NULL,
  `UUID_categiry` varchar(250) NOT NULL,
  `id_pages` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `status`, `name`, `parent_id`, `foto_category`, `description_category`, `UUID_categiry`, `id_pages`) VALUES
(1, '1', 'Товары для серфинга', 0, '', '', '', 6),
(2, '1', 'Товары для дайвинга', 0, '', '', '', 8),
(7, '1', 'Гидрокостюмы', 1, 'images/serf/gidro.png', '', '', 10),
(8, '1', 'Доски', 1, 'images/serf/doska.png', '', '', 11),
(9, '1', 'Аксессуары', 1, 'images/serf/aksessuar.png', '', '', 12),
(10, '1', 'Кайтсерфы', 1, 'images/serf/jacknife_boards.png', '', '', 13),
(11, '1', 'Чехлы', 1, 'images/serf/salmon pink.png', '', '', 14),
(12, '1', 'Маски', 2, 'images/diving/mask.png', '', '', 15),
(13, '1', 'BCD куртки', 2, 'images/diving/seacsub-ego.png', '', '', 18),
(14, '1', 'Компьтеры', 2, 'images/diving/cressi-giotto.png', '', '', 19),
(15, '1', 'Подводные аппараты', 2, 'images/diving/seadoo-aquaranger.png', '', '', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id_good` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `foto` varchar(250) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view` int(4) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `short_description` text NOT NULL,
  `ID_UUID` varchar(250) NOT NULL DEFAULT 'SELECT UUID()'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id_good`, `name`, `price`, `id_category`, `status`, `foto`, `date`, `view`, `description`, `short_description`, `ID_UUID`) VALUES
(1, 'Good 1', 100, 7, 1, 'images/Livello29.png', '2017-11-01 18:57:45', 131, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.\r\n            <br><br>\r\n            There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.\r\n            <br>\r\n            - 6.1 oz. 100% preshrunk heavyweight cotton<br>\r\n            - Shoulder-to-shoulder taping<br>\r\n            - Double-needle sleeves and bottom hem\r\n            <br><br>\r\n            It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Краткое описание', '95be1414-c337-11e7-84ca-00ffc5973b63'),
(2, 'Good 2', 120, 7, 1, 'images/Livello29.png', '2017-11-02 18:57:45', 89, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.\r\n            <br><br>\r\n            There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.\r\n            <br>\r\n            - 6.1 oz. 100% preshrunk heavyweight cotton<br>\r\n            - Shoulder-to-shoulder taping<br>\r\n            - Double-needle sleeves and bottom hem\r\n            <br><br>\r\n            It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'краткое описние', '95be16b0-c337-11e7-84ca-00ffc5973b64'),
(3, 'Good 3', 48, 7, 2, 'images/Livello25.png', '2017-07-04 18:57:45', 15, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be17f4-c337-11e7-84ca-00ffc5973b65'),
(4, 'Good 4', 100500, 8, 2, 'images/Livello26.png', '2017-10-10 18:57:45', 48, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. \r\n\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. \r\n- 6.1 oz. 100% preshrunk heavyweight cotton\r\n- Shoulder-to-shoulder taping\r\n- Double-needle sleeves and bottom hem \r\n\r\nIt uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be192f-c337-11e7-84ca-00ffc5973b66'),
(5, 'Good 5', 2001, 8, 4, 'images/Livello27.png', '2017-11-02 18:57:45', 50, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1a5e-c337-11e7-84ca-00ffc5973b67'),
(6, 'Good 6', 1020, 9, 2, 'images/Livello28.png', '2017-11-01 18:57:45', 40, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1b8d-c337-11e7-84ca-00ffc5973b68'),
(7, 'Good 7', 1, 12, 2, 'images/shop.png', '2017-11-02 18:57:45', 22, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1cbc-c337-11e7-84ca-00ffc5973b69'),
(8, 'Good 8', 800, 12, 1, 'images/shop.png', '2017-11-02 18:57:45', 358, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br><br>             There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.             <br>             - 6.1 oz. 100% preshrunk heavyweight cotton<br>             - Shoulder-to-shoulder taping<br>             - Double-needle sleeves and bottom hem             <br><br>             It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. When an unknown printer took a galley of type.', '95be1deb-c337-11e7-84ca-00ffc5973b61');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `url` varchar(250) NOT NULL,
  `paarent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `name`, `url`, `paarent_id`) VALUES
(1, 'Главная страница', '', 0),
(2, 'О Магазине', 'info/', 1),
(3, 'Каталог', 'catalog', 1),
(4, 'Статьи', 'article', 1),
(5, 'Контакты', 'contact', 1),
(6, 'Товары для серфинга', 'serf', 3),
(8, 'Товары для дайвинга', 'diving', 3),
(10, 'Гидрокостюмы', 'gidro', 6),
(11, 'Доски', 'doska_serf', 6),
(12, 'Аксессуары', 'acsessuar', 6),
(13, 'Кайтсерфы', 'kitesurfers', 6),
(14, 'Чехлы', 'case', 6),
(15, 'Маски', 'mask', 8),
(18, 'BCD куртки', 'seacsub-ego', 8),
(19, 'Компьтеры', 'cressi_giotto', 8),
(20, 'Подводные аппараты', 'seadoo-aquaranger', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `id_user` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `prim` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id_user`, `login`, `pass`, `prim`) VALUES
(1, 'user', '$2y$10$mBPas3uNzVeY0AYq4MWu7es7BfLAmI6j4r8fjmkaNRGeupNax69ZO', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users_auth`
--

DROP TABLE IF EXISTS `users_auth`;
CREATE TABLE `users_auth` (
  `id_user` int(11) NOT NULL,
  `id_user_session` int(11) NOT NULL,
  `hash_cookie` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `prim` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_auth`
--

INSERT INTO `users_auth` (`id_user`, `id_user_session`, `hash_cookie`, `date`, `prim`) VALUES
(1, 268, 'f99a328eac4acd366068eeef9cb2df2b41f7307af8a2d49dd701f6de8a2d026d', '2018-03-12', '1520803933.1744115205957740041493');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`),
  ADD KEY `id_pages` (`id_pages`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id_good`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `users_auth`
--
ALTER TABLE `users_auth`
  ADD PRIMARY KEY (`id_user_session`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id_good` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users_auth`
--
ALTER TABLE `users_auth`
  MODIFY `id_user_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`id_pages`) REFERENCES `pages` (`id`);

--
-- Ограничения внешнего ключа таблицы `users_auth`
--
ALTER TABLE `users_auth`
  ADD CONSTRAINT `users_auth_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
