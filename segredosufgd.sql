-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Ago-2017 às 05:30
-- Versão do servidor: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `segredosufgd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `inbox`
--

CREATE TABLE `inbox` (
  `id` int(10) UNSIGNED NOT NULL,
  `user` varchar(36) NOT NULL,
  `message` text NOT NULL,
  `image_url` varchar(250) DEFAULT NULL,
  `link` varchar(755) DEFAULT NULL,
  `sent_byuser` datetime NOT NULL,
  `sent` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `inbox`
--

INSERT INTO `inbox` (`id`, `user`, `message`, `image_url`, `link`, `sent_byuser`, `sent`) VALUES
(27, 'Williamsears Admuser', '', NULL, NULL, '2017-07-31 06:09:16', 1),
(25, 'Williamsears Admuser', '', NULL, NULL, '2017-07-31 06:06:22', 1),
(22, 'Williamsears Admuser', 'ta aí???', NULL, NULL, '2017-07-31 02:30:01', 1),
(23, 'Williamsears Admuser', 'shalom', NULL, NULL, '2017-07-31 02:36:18', 1),
(24, 'Williamsears Admuser', 'Esse é um teste', NULL, NULL, '2017-07-31 06:06:30', 1),
(21, 'Williamsears Admuser', 'Ola segredos', NULL, NULL, '2017-07-30 23:44:31', 1),
(20, 'Williamsears Admuser', 'Testando acentos agóra', NULL, NULL, '2017-07-30 23:58:31', 1),
(52, 'Williamsears Admuser', '', '31072017204835.jpg', NULL, '2017-07-31 20:48:28', 1),
(53, 'Williamsears Admuser', '', '31072017204835.jpg', NULL, '2017-07-31 19:40:48', 1),
(54, 'Williamsears Admuser', '', '31072017205201.jpg', NULL, '2017-07-31 20:51:54', 1),
(55, 'Williamsears Admuser', '', '31072017205350.jpg', NULL, '2017-07-31 20:53:42', 1),
(56, 'Williamsears Admuser', '', '31072017213649.jpg', NULL, '2017-07-31 21:36:44', 1),
(57, 'Williamsears Admuser', '', '31072017213823.jpg', NULL, '2017-07-31 21:38:16', 1),
(58, 'Williamsears Admuser', '', '31072017214143.jpg', NULL, '2017-07-31 21:41:34', 1),
(59, 'Williamsears Admuser', '', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20543044_352701538493020_1618523888_o.jpg?oh=cf3f653bdec84a7034a61fdca78835e8&oe=5981EFF2', NULL, '2017-08-01 03:18:35', 1),
(60, 'Williamsears Admuser', '', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20590633_352702165159624_1457401267_o.jpg?oh=b3a8825189c9a76aa676ae5a8fc54065&oe=5982E1B0', NULL, '2017-08-01 03:20:54', 1),
(61, 'Williamsears Admuser', 'Olá, esse é um teste', '', NULL, '2017-08-01 03:22:38', 1),
(62, 'Williamsears Admuser', 'Ola, confesso que http://www.jambo.ninja/assets/jamboninja-da6f4f6a6bf515ed0131a140c0006c0fb7053e1bf42bb12611f8010dd24a05e2.png?fb_ref=Default', '', NULL, '2017-08-01 03:23:35', 1),
(63, 'Williamsears Admuser', 'https://www.facebook.com/sinalamarelo/videos/1260823400631730/?autoplay_reason=gatekeeper&video_container_type=0&video_creator_product_type=2&app_id=2392950137&live_video_guests=0', '', NULL, '2017-08-01 03:27:48', 1),
(64, 'Williamsears Admuser', 'http://www.jambo.ninja/assets/jamboninja-da6f4f6a6bf515ed0131a140c0006c0fb7053e1bf42bb12611f8010dd24a05e2.png', '', 'http://www.jambo.nin', '2017-08-01 03:41:58', 1),
(65, 'Williamsears Admuser', 'https://stackoverflow.com/questions/11078913/how-to-set-max-width-of-an-image-in-css', '', 'https://stackoverflow.com/questions/11078913/how-to-set-max-width-of-an-image-in-css', '2017-08-01 03:44:55', 1),
(66, 'Williamsears Admuser', 'https://www.facebook.com/sinalamarelo/videos/1260823400631730/?autoplay_reason=gatekeeper&video_container_type=0&video_creator_product_type=2&app_id=2392950137&live_video_guests=0', '', 'https://www.facebook.com/sinalamarelo/videos/1260823400631730/?autoplay_reason=gatekeeper&video_container_type=0&video_creator_product_type=2&app_id=2392950137&live_video_guests=0', '2017-08-01 03:49:13', 1),
(67, 'Williamsears Admuser', 'Confesso que: segue o link https://www.facebook.com/sinalamarelo/videos/1260823400631730/?autoplay_reason=gatekeeper&video_container_type=0&video_creator_product_type=2&app_id=2392950137&live_video_guests=0', '', 'https://www.facebook.com/sinalamarelo/videos/1260823400631730/?autoplay_reason=gatekeeper&video_container_type=0&video_creator_product_type=2&app_id=2392950137&live_video_guests=0', '2017-08-01 03:50:13', 1),
(68, 'Williamsears Admuser', 'Confesso que www.facebook.com/sinalamarelo/videos/1260823400631730/?autoplay_reason=gatekeeper&video_container_type=0&video_creator_product_type=2&app_id=2392950137&live_video_guests=0', '', '', '2017-08-01 03:50:52', 1),
(69, 'Williamsears Admuser', 'confesso que www.facebook.com/sinalamarelo/videos/1260823400631730/?autoplay_reason=gatekeeper&video_container_type=0&video_creator_product_type=2&app_id=2392950137&live_video_guests=0', '', '', '2017-08-01 03:51:56', 1),
(70, 'Williamsears Admuser', '', 'https://scontent.xx.fbcdn.net/v/t34.0-12/20158422_10207616882859479_1209350268_n.gif?fallback=1&oh=9c4501c8ccec46907b8aa3aae1a91f47&oe=5982CD60', '', '2017-08-01 03:57:09', 1),
(71, 'Williamsears Admuser', '', 'https://scontent.xx.fbcdn.net/v/t34.0-12/20158422_10207616882859479_1209350268_n.gif?fallback=1&oh=9c4501c8ccec46907b8aa3aae1a91f47&oe=5982CD60', '', '2017-08-01 04:08:42', 1),
(72, 'Williamsears Admuser', '', 'https://scontent.xx.fbcdn.net/v/t34.0-12/17160400_10154290787375849_1726092145_n.gif?fallback=1&oh=fb39ff0ba36e24d02ec427171b2348ef&oe=5982BC69', '', '2017-08-01 04:10:56', 1),
(73, 'Williamsears Admuser', '', 'https://scontent.xx.fbcdn.net/v/t34.0-12/20427772_330619407385797_2002280909_n.gif?fallback=1&oh=bb8d31852b6f68e319603eefd2ae6877&oe=5982BBFE', '', '2017-08-01 04:11:52', 1),
(74, 'Williamsears Admuser', '', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20590713_352712908491883_1392044995_o.jpg?oh=3b83f14ec096643a8c7b4d33b2b2c360&oe=5981CB76', '', '2017-08-01 04:13:52', 1),
(75, 'Williamsears Admuser', 'Confesso que achei isso interessante', '', '', '2017-08-01 04:13:43', 1),
(76, 'Williamsears Admuser', '<<-%->><<-%->>Confesso que achei isso aqui interessante', '', '', '2017-08-01 04:22:33', 1),
(77, 'Williamsears Admuser', '<%>-connect-<%><%>-connect-<%>Olá, essa é uma mensagem pra postar', '', '', '2017-08-01 04:27:44', 1),
(78, 'Williamsears Admuser', '<%>-connect-<%><%>-connect-<%>Confesso que achei isso aqui interessante', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20615508_352717345158106_1290337665_o.jpg?oh=80e197bbe586157e8eb4bb2e5afa3bd2&oe=5982EA0E', '', '2017-08-01 04:29:23', 1),
(79, 'Williamsears Admuser', '<%>-connect-<%>Olá, gostaria de saber se vocês podem publicar isso aqui', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20590541_352718321824675_1475598331_o.jpg?oh=7588b9c8a2a8de853ee3e955cf985ac5&oe=59830C26', '', '2017-08-01 04:33:35', 1),
(80, 'Williamsears Admuser', 'E esse aqui<%>-connect-<%>Gostaria de publicar esses dois textos', '', '', '2017-08-01 04:35:26', 1),
(81, 'Williamsears Admuser', '<%>-connect-<%>Olá, tenho esses dois textos aqui, pode publicar?<%>-connect-<%>E esse aqui também!!', '', '', '2017-08-01 04:40:55', 1),
(82, 'Williamsears Admuser', 'Tenhos esses dois textos<%>-connect-<%>esse é o ultimo', '', '', '2017-08-01 04:43:32', 1),
(83, 'Williamsears Admuser', 'Testado 1<%><%>Testando 2', '', '', '2017-08-01 04:49:41', 1),
(84, 'Williamsears Admuser', '<%><%>Esse é mais um teste', '', '', '2017-08-01 04:56:05', 1),
(85, 'Williamsears Admuser', '<%><%>Este é mais um teste', '', '', '2017-08-01 04:57:45', 1),
(86, 'Williamsears Admuser', '<%><%>ow ow ow ow', '', '', '2017-08-01 04:59:51', 1),
(87, 'Williamsears Admuser', 'hahahhahaa', '', '', '2017-08-01 05:00:48', 1),
(88, 'Williamsears Admuser', 'hahah1<%><%>hahaha2', '', '', '2017-08-01 05:01:11', 1),
(89, 'Williamsears Admuser', 'kkkkkk', '', '', '2017-08-01 05:05:03', 1),
(90, 'Williamsears Admuser', '"Confesso que: Então, será que tem como postar essas duas mensagens?"', '', '', '2017-08-01 05:14:49', 1),
(91, 'Williamsears Admuser', '"Confesso que:  \n									Testandoasfd"								', '', '', '2017-08-01 06:36:57', 1),
(92, 'Williamsears Admuser', '" Confesso que"', '', '', '2017-08-01 07:05:23', 1),
(93, 'Williamsears Admuser', '" Eu tava confesso que"', '', '', '2017-08-01 07:36:10', 1),
(94, 'Williamsears Admuser', '"Confesso que:  \n									De repente eu confesso que ta tudo certo"								', '', '', '2017-08-01 07:39:50', 1),
(95, 'Williamsears Admuser', '"Confesso que: banana fria é bom com alho"', '', '', '2017-08-01 07:43:52', 1),
(96, 'Williamsears Admuser', '"Eu tava confesso que"', '', '', '2017-08-01 09:57:12', 1),
(97, 'Williamsears Admuser', '"Essa é mais uma mensagem"', '', '', '2017-08-01 19:47:42', 1),
(98, 'Williamsears Admuser', '"Confesso que: Voce pode postar isso pra mim"', '', '', '2017-08-01 19:48:09', 1),
(99, 'Williamsears Admuser', '"Confesso que: Esse é o texto da foto"', '', '', '2017-08-01 19:51:40', 1),
(100, 'Williamsears Admuser', '"Confesso que: Esse é o texto da foto"', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20616314_352932468469927_149096631_o.jpg?oh=4b577a53d9630633f972f38aa6bdae95&oe=5983B450', '', '2017-08-01 19:52:16', 1),
(101, 'Williamsears Admuser', '"Confesso que: https://www.facebook.com/Ufgd_segredos_lab"', '', 'https://www.facebook.com/Ufgd_segredos_lab-110013892973368/', '2017-08-01 19:52:54', 1),
(102, 'Williamsears Admuser', '"Confesso que isso e isso"', '', '', '2017-08-01 19:54:10', 1),
(103, 'Williamsears Admuser', '"Oi tudo bem, confesso que"', '', '', '2017-08-01 19:54:38', 1),
(104, 'Williamsears Admuser', '"Confesso que: Oi tudo bem como vai , confesso que"', '', '', '2017-08-01 19:55:01', 1),
(105, 'Williamsears Admuser', '"Confesso que: Oi tudo bem, pode postar isso pra mim?"', '', '', '2017-08-01 19:56:55', 1),
(106, 'Williamsears Admuser', '"Confesso que: http://www.facebook.com/Ufgd_segredos_lab-110013892973368/"', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20629040_352933048469869_70118439_o.jpg?oh=576dc2ad471b72550218688e27545828&oe=5983A871', 'http://www.facebook.com/Ufgd_segredos_lab-110013892973368/', '2017-08-01 19:57:52', 1),
(107, 'Williamsears Admuser', '"Confesso que: this is a message"', '', '', '2017-08-01 20:48:56', 1),
(108, 'Williamsears Admuser', '"Confesso que: Mensagem 1"', '', '', '2017-08-01 21:08:51', 1),
(109, 'Williamsears Admuser', '"Confesso que: Mensagem 2"', '', '', '2017-08-01 21:09:08', 1),
(110, 'Williamsears Admuser', '"Confesso que: Mensagem 3"', '', '', '2017-08-01 21:09:22', 1),
(111, 'Williamsears Admuser', '"Confesso que: Mensagem 1"', '', '', '2017-08-01 21:11:45', 1),
(112, 'Williamsears Admuser', '"Confesso que: Mensagem 3"', '', '', '2017-08-01 21:12:02', 1),
(113, 'Williamsears Admuser', '"Confesso que: Mensagem 4"', '', '', '2017-08-01 21:12:20', 1),
(114, 'Williamsears Admuser', '"Confesso que: Mensagem 5"', '', '', '2017-08-01 21:12:34', 1),
(115, 'Williamsears Admuser', '"Confesso que: Msg1"', '', '', '2017-08-01 21:13:48', 1),
(116, 'Williamsears Admuser', '"Confesso que: Msg2"', '', '', '2017-08-01 21:14:01', 1),
(117, 'Williamsears Admuser', '"Confesso que: Msg3"', '', '', '2017-08-01 21:14:13', 1),
(118, 'Williamsears Admuser', '"Confesso que: Teste de varios cliques"', '', '', '2017-08-01 21:15:17', 1),
(119, 'Williamsears Admuser', '"Confesso que: mensagem mensagem"', '', '', '2017-08-02 03:26:06', 1),
(120, 'Williamsears Admuser', '"Confesso que: essa e oura msg"', '', '', '2017-08-02 03:40:03', 1),
(121, 'Williamsears Admuser', '"Confesso que"', '', '', '2017-08-02 06:30:13', 1),
(122, 'Williamsears Admuser', '"confesso que acho que tava"', '', '', '2017-08-02 06:35:17', 1),
(123, 'Williamsears Admuser', '"Confesso que: Teste de maiuscula"', '', '', '2017-08-02 07:07:35', 1),
(124, 'Williamsears Admuser', '"Confesso que: muitas muitas mensagens"', '', '', '2017-08-02 07:14:54', 1),
(125, 'Williamsears Admuser', '"Confesso que: Oi tudo bem queria ver se is da c certo"', '', '', '2017-08-02 07:16:52', 1),
(126, 'Williamsears Admuser', '"Confesso que: Esse é um teste Com mensagens  e foto"', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20615085_353068805122960_19062731_o.jpg?oh=113febce868c46e0d9a3cab3c14caeda&oe=5983ECDD', '', '2017-08-02 07:17:55', 1),
(127, 'Williamsears Admuser', '"Confesso que: "', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20616291_353069128456261_1641484398_o.jpg?oh=757b2b815419ca8b73ff983fe15b6ba9&oe=5983D1B5', '', '2017-08-02 07:19:57', 1),
(128, 'Williamsears Admuser', '"Confesso que: Foto em um texto"', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20629965_353069221789585_2085615700_o.jpg?oh=bfd1905d7548ca0125c26304b90bbd11&oe=59843CAB', '', '2017-08-02 07:20:42', 1),
(129, 'Williamsears Admuser', '"Confesso que: Foto em um texto"', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20615142_353070198456154_1709401648_o.jpg?oh=bf8bbe0492f0b56dacd5b6f0ecdb7622&oe=59844829', '', '2017-08-02 07:25:14', 1),
(130, 'Williamsears Admuser', '"Confesso que: Foto e texto"', '', '', '2017-08-02 07:27:33', 1),
(131, 'Williamsears Admuser', '"Confesso que: "', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20622947_353070618456112_1384671713_o.jpg?oh=743898ca14d89266daf1daba700c8910&oe=59840F8D', '', '2017-08-02 07:27:42', 1),
(132, 'Williamsears Admuser', '"Confesso que: "', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20615066_353070778456096_972935809_o.jpg?oh=46d2c2cdd3b2075940d79e41449fedb1&oe=5983C291', '', '2017-08-02 07:28:24', 1),
(133, 'Williamsears Admuser', '"Confesso que: foto e textao"', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20598035_353071105122730_1727631016_o.jpg?oh=494f054d210bbd0785c51d3802782c07&oe=59840C04', '', '2017-08-02 07:29:38', 1),
(134, 'Williamsears Admuser', '"Confesso que"', '', '', '2017-08-02 07:32:34', 1),
(135, 'Williamsears Admuser', '"Confes2+2 é 4 4+3 é 6"', '', '', '2017-08-02 07:32:52', 1),
(139, 'Williamsears Admuser', 'Blablablablabla', '', '', '2017-08-02 08:24:21', -1),
(138, 'Williamsears Admuser', 'oi<%><%>oi<%><%>oi<%><%>oi<%><%>blablabla', '', '', '2017-08-02 08:22:17', -1),
(140, 'Williamsears Admuser', '"Confesso que: Oi, tudo bem, como vai"', '', '', '2017-08-02 08:24:51', 1),
(141, 'Williamsears Admuser', '"Confesso que: Deletar linhas"', '', '', '2017-08-02 08:25:56', 1),
(142, 'Williamsears Admuser', '"Confesso que: Mais mensagens kkkkk"', '', '', '2017-08-02 08:37:23', 1),
(143, 'Williamsears Admuser', '"Confesso que: sdfasdfadfs"', '', '', '2017-08-02 08:37:42', 1),
(144, 'Williamsears Admuser', '"Confesso que: adsdadf jaerptjqert 4pyojqy"', '', '', '2017-08-02 09:02:28', 1),
(145, 'Williamsears Admuser', '"Confesso que gostaria de saber qual é od"', 'https://scontent.xx.fbcdn.net/v/t35.0-12/20615445_353102178452956_889686928_o.jpg?oh=1944a01f67423059bb98b6579f9dca5b&oe=5983BC17', '', '2017-08-02 09:08:43', 1),
(146, 'Williamsears Admuser', '"Confesso que: mais um texto mais um texto"', '', '', '2017-08-02 09:09:36', 1),
(147, 'Williamsears Admuser', '"Confesso que: ola"', '', '', '2017-08-02 11:24:33', 1),
(148, 'Williamsears Admuser', '"Confesso que: Ola UFGD esse é um texto"', '', '', '2017-08-02 12:45:51', 1),
(149, 'Williamsears Admuser', '"Confesso que: Pode postar esse texto pra mim?"', '', '', '2017-08-03 00:26:52', 1),
(150, 'Williamsears Admuser', '"Confesso que: Tudo isso de mensagem"', '', '', '2017-08-03 00:28:24', 1),
(151, 'Williamsears Admuser', '"Confesso que: Oi tudo bem"', '', '', '2017-08-03 00:29:44', 1),
(152, 'Ufgd_segredos_lab', '"Confesso que: Oieeee esse é um teste pode postar"', '', '', '2017-08-03 00:45:48', 1),
(153, 'Ufgd_segredos_lab', '"Confesso que: Esse é um texto grandao Texto grandao"', '', '', '2017-08-03 00:46:09', 1),
(154, 'Williamsears Admuser', '"Confesso que: Oi tudo bem, esse é um texto para publicar"', '', '', '2017-08-03 00:54:04', 1),
(155, 'Williamsears Admuser', '"Confesso que: Postar o texto"', '', '', '2017-08-03 00:54:25', 1),
(156, 'Williamsears Admuser', '"Confesso que: Texto grandao para postar"', '', '', '2017-08-03 00:54:36', 1),
(157, 'Williamsears Admuser', '"Confesso que: Mensagem para postar"', '', '', '2017-08-03 00:56:32', 1),
(158, 'Williamsears Admuser', '"Confesso que: mais asdfasdf deoh mdfa´s aeórjimda"', '', '', '2017-08-03 00:56:47', 1),
(159, 'Williamsears Admuser', '"Confesso que: asdfjl asdf awr er"', '', '', '2017-08-03 00:56:59', 1),
(160, 'Williamsears Admuser', '"Confesso que: Maasddasfdfas"', '', '', '2017-08-03 01:00:54', 1),
(161, 'Williamsears Admuser', '"Confesso que: Mais mensagens Publicar mensagens"', '', '', '2017-08-03 01:01:11', 1),
(162, 'Williamsears Admuser', '"Confesso que: This is an example"', '', '', '2017-08-03 01:01:22', 1),
(163, 'Williamsears Admuser', '"Confesso que: Example page"', '', '', '2017-08-03 01:01:34', 1),
(164, 'Williamsears Admuser', '"Confesso que: This is an example Please post this"', '', '', '2017-08-03 01:03:11', 1),
(165, 'William S. Sears', 'Ola<%><%>Ola<%><%>This is a new message<%><%>Post this message in Page\'s Feed<%><%>Post this message in the feed', '', '', '2017-08-03 01:27:52', 1),
(166, 'Guilherme Nunes', '"Confesso que: Test"', '', '', '2017-08-03 01:15:24', 1),
(167, 'Ufgd_segredos_lab', '"Confesso que: Post this message in the feed Post this message in the feed"', '', '', '2017-08-03 01:32:21', 1),
(168, 'William S. Sears', '"Confesso que: This is a new message"', '', '', '2017-08-03 01:32:36', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
