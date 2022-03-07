-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Jan-2022 às 05:22
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pessoa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `id_user_avaliado` int(11) NOT NULL,
  `id_user_avaliador` int(10) UNSIGNED NOT NULL,
  `pontuacao` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrouses`
--

CREATE TABLE `carrouses` (
  `id` int(11) NOT NULL,
  `imagen_carousel` varchar(220) NOT NULL,
  `nome` varchar(220) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `carrouses`
--

INSERT INTO `carrouses` (`id`, `imagen_carousel`, `nome`) VALUES
(1, 'slide1.jpg', 'Curso um'),
(2, 'slide2.jpg', 'Curso dois'),
(3, 'slide3.jpg', 'Artigo um'),
(4, 'slide4.jpg', 'Artigo dois');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`, `created`, `modified`) VALUES
(1, 'Campinas', '2017-02-15 20:17:12', NULL),
(2, '24 de Outubro', '2017-02-15 20:17:28', NULL),
(3, 'Flamboyant', '2022-01-27 17:30:42', '2022-01-27 17:30:42'),
(4, 'Eldorado', '2022-01-27 17:30:42', '2022-01-27 17:30:42'),
(5, 'Achei Park RV', '2022-01-27 17:31:52', '2022-01-27 17:31:52'),
(6, 'Achei Park JH', '2022-01-27 17:31:52', '2022-01-27 17:31:52'),
(7, 'Achei Park JL', '2022-01-27 17:31:52', '2022-01-27 17:31:52');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `de` int(11) DEFAULT 0,
  `para` int(11) DEFAULT 0,
  `msg` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('V','NV') COLLATE utf8_unicode_ci DEFAULT 'NV',
  `updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `foto` varchar(240) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `comentario` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_created` timestamp NULL DEFAULT current_timestamp(),
  `data_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `segmento` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `fone1` varchar(20) NOT NULL,
  `fone2` varchar(20) NOT NULL,
  `fone3` varchar(20) NOT NULL,
  `email` varchar(220) NOT NULL,
  `site` varchar(50) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `situacao_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `subcategoria_id` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`id`, `nome`, `segmento`, `endereco`, `telefone`, `fone1`, `fone2`, `fone3`, `email`, `site`, `imagem`, `situacao_id`, `categoria_id`, `subcategoria_id`, `modified`, `created`) VALUES
(1, '<h3>Campinas:Unibrasil<h3>\r\nQuarto\r\n<br>\r\nAté 2 salários: 223,00\r\n<br>\r\nAcima de 2 salários: 335,00\r\n', '', '', '', '', '', '', '', '', '', 1, 1, 1, '2017-02-04 22:55:39', '2017-02-03 00:00:00'),
(2, '<br>Enfermaria\r\n<br>\r\nAté dois salários: 139,00\r\n<br>\r\nAcima de 2 salários: 209,00\r\n<br>\r\nQuarto\r\n<br>\r\nAté dois salários: 173,00\r\n<br>\r\nAcima de 2 salários: 259,00', '', '', '', '', '', '', '', '', '', 1, 1, 8, '2022-01-27 18:28:24', '2022-01-27 18:28:24'),
(3, '<br>Enfermaria\r\n<br>\r\nAté dois salários: 59,00\r\n<br>\r\nAcima de 2 salários: 88,00\r\n<br>\r\nQuarto\r\n<br>\r\nAté dois salários: 79,00\r\n<br>\r\nAcima de 2 salários: 117,00', '', '', '', '', '', '', '', '', '', 1, 1, 15, '2022-01-27 18:53:23', '2022-01-27 18:53:23'),
(15, '<br>Enfermaria\r\n<br>\r\nAté dois salários: 139,00\r\n<br>\r\nAcima de 2 salários: 209,00\r\n<br>\r\nQuarto\r\n<br>\r\nAté dois salários: 173,00\r\n<br>\r\nAcima de 2 salários: 259,00', '', '', '', '', '', '', '', '', '', 1, 3, 10, '2022-01-27 19:00:30', '2022-01-27 19:00:30'),
(16, '<br>Enfermaria\r\n<br>\r\nAté dois salários: 59,00\r\n<br>\r\nAcima de 2 salários: 88,00\r\n<br>\r\nQuarto\r\n<br>\r\nAté dois salários: 79,00\r\n<br>\r\nAcima de 2 salários: 117,00', '', '', '', '', '', '', '', '', '', 1, 3, 17, '2022-01-27 19:00:30', '2022-01-27 19:00:30'),
(17, '<br>Enfermaria\r\n<br>\r\nAté dois salários: 139,00\r\n<br>\r\nAcima de 2 salários: 209,00', '', '', '', '', '', '', '', '', '', 1, 4, 11, '2022-01-27 19:08:10', '2022-01-27 19:08:10'),
(18, '<br>Enfermaria\r\n<br>\r\nAté dois salários: 59,00\r\n<br>\r\nAcima de 2 salários: 88,00\r\n', '', '', '', '', '', '', '', '', '', 1, 4, 18, '2022-01-27 19:08:10', '2022-01-27 19:08:10'),
(19, '<br>\r\nQuarto\r\n<br>\r\nAté dois salários: 223,00\r\n<br>\r\nAcima de 2 salários: 335,00', '', '', '', '', '', '', '', '', '', 1, 2, 2, '2022-01-27 19:21:05', '2022-01-27 19:21:05'),
(20, '<br>Enfermaria\r\n<br>\r\nAté dois salários: 59,00\r\n<br>\r\nAcima de 2 salários: 88,00', '', '', '', '', '', '', '', '', '', 1, 2, 16, '2022-01-27 19:21:05', '2022-01-27 19:21:05'),
(21, '<br>Enfermaria\r\n<br>\r\nAté dois salários: 59,00\r\n<br>\r\nAcima de 2 salários: 88,00\r\n', '', '', '', '', '', '', '', '', '', 1, 5, 19, '2022-01-27 19:27:58', '2022-01-27 19:27:58'),
(22, '<br>Enfermaria\r\n<br>\r\nAté dois salários: 59,00\r\n<br>\r\nAcima de 2 salários: 88,00\r\n\r\n', '', '', '', '', '', '', '', '', '', 1, 6, 20, '2022-01-27 19:30:51', '2022-01-27 19:30:51'),
(25, '<br>\r\nEnfermaria\r\n<br>\r\nAté 2 salários: 139,00\r\n<br>\r\nAcima de 2 salarios:209,00', '', '', '', '', '', '', '', '', '', 1, 5, 12, '2022-01-27 19:57:46', '2022-01-27 19:57:46'),
(26, '<br>\r\nQuarto\r\n<br>\r\nAté 2 salários: 139,00\r\n<br>\r\nAcima de 2 salários: 209,00', '', '', '', '', '', '', '', '', '', 1, 7, 14, '2022-01-27 20:01:21', '2022-01-27 20:01:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `downloads` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `files`
--

INSERT INTO `files` (`id`, `name`, `size`, `downloads`) VALUES
(2, 'digital-ad.zip', 56349, 2),
(14, 'Josy_dias agency Logotipo.png', 14535, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT 0,
  `curtiu` enum('SIM','NAO') COLLATE utf8_unicode_ci DEFAULT 'NAO',
  `id_post` int(11) DEFAULT 0,
  `data_created` timestamp NULL DEFAULT current_timestamp(),
  `data_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `endereco`, `telefone`, `email`, `sexo`) VALUES
(2, 'joselio', 'Desligando sozinho', 'campinas', '192.168.1.1', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `img` varchar(250) COLLATE utf8_unicode_ci DEFAULT '0',
  `legenda` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT 0,
  `data_created` timestamp NULL DEFAULT current_timestamp(),
  `data_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`id`, `img`, `legenda`, `id_usuario`, `data_created`, `data_update`) VALUES
(52, 'Curso-basico-de-php.png', 'test', 21, '2022-01-10 20:29:05', '2022-01-10 20:29:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `seguidores`
--

CREATE TABLE `seguidores` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT 0,
  `id_seguindo` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `seguidores`
--

INSERT INTO `seguidores` (`id`, `id_user`, `id_seguindo`) VALUES
(41, 22, 18);

-- --------------------------------------------------------

--
-- Estrutura da tabela `subcategoria`
--

CREATE TABLE `subcategoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `subcategoria`
--

INSERT INTO `subcategoria` (`id`, `nome`, `categoria_id`, `created`, `modified`) VALUES
(1, 'UNIBRASIL', 1, '2022-01-27 13:54:54', '2022-01-27 13:54:54'),
(10, 'UNIEMPRESA', 3, '2022-01-27 17:46:42', '2022-01-27 17:46:42'),
(2, 'UNIBRASIL', 2, '2022-01-27 17:38:08', '2022-01-27 17:38:08'),
(8, 'UNIEMPRESA', 1, '2022-01-27 17:46:42', '2022-01-27 17:46:42'),
(11, 'UNIEMPRESA', 4, '2022-01-27 17:46:42', '2022-01-27 17:46:42'),
(14, 'UNIEMPRESA', 7, '2022-01-27 17:46:42', '2022-01-27 17:46:42'),
(15, 'UNIFACIL', 1, '2022-01-27 17:51:23', '2022-01-27 17:51:23'),
(16, 'UNIFACIL', 2, '2022-01-27 17:51:23', '2022-01-27 17:51:23'),
(17, 'UNIFACIL', 3, '2022-01-27 17:51:23', '2022-01-27 17:51:23'),
(18, 'UNIFACIL', 4, '2022-01-27 17:51:23', '2022-01-27 17:51:23'),
(19, 'UNIFACIL', 5, '2022-01-27 17:51:23', '2022-01-27 17:51:23'),
(20, 'UNIFACIL', 6, '2022-01-27 17:51:23', '2022-01-27 17:51:23'),
(12, 'UNIEMPRESA', 5, '2022-01-27 19:56:31', '2022-01-27 19:56:31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sugestao`
--

CREATE TABLE `sugestao` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mensagem` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `unimed`
--

CREATE TABLE `unimed` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) NOT NULL,
  `email` varchar(220) NOT NULL,
  `contrato` varchar(220) NOT NULL,
  `sequencia` varchar(220) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `unimed`
--

INSERT INTO `unimed` (`id`, `nome`, `email`, `contrato`, `sequencia`, `created`, `modified`) VALUES
(0, 'sdad', 'sdad', 'sadsad', '', '2022-01-26 16:37:31', NULL),
(1, 'sdasdsad', 'sadas', 'sadsad', '', '2022-01-26 16:37:58', NULL),
(2, 'Campinas:unibrasil', '15.986.565/0001-67', '3055000004', '3055F3', '2022-01-26 16:44:02', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `senha` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` enum('V','C') COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexo` enum('M','F') COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_created` timestamp NULL DEFAULT current_timestamp(),
  `data_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `avatar`, `telefone`, `email`, `senha`, `tipo`, `descricao`, `sexo`, `data_created`, `data_update`) VALUES
(18, 'Josélio Dias Mendonça', '20210825_135242.jpg', '48984723659', 'joseliodm@gmail.com', 'SmRtMTJqZG0=', 'C', 'Analista de sistemas ', 'M', '2022-01-09 23:00:03', '2022-01-12 20:28:35'),
(21, 'test1', NULL, '0', 'teste@gmail.com', 'MTIzNDU2Nzg5', 'C', NULL, 'M', '2022-01-10 19:01:58', '2022-01-10 19:01:58'),
(22, 'Bayer', NULL, '0', 'bayer@bayer.com', 'MTIzNDU2Nzg5', 'C', NULL, 'M', '2022-01-10 19:05:05', '2022-01-10 19:05:05');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user_avaliado`),
  ADD KEY `id_user_avaliador` (`id_user_avaliador`);

--
-- Índices para tabela `carrouses`
--
ALTER TABLE `carrouses`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Index 2` (`de`),
  ADD KEY `Index 3` (`para`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Index 2` (`id_post`),
  ADD KEY `Index 3` (`id_usuario`);

--
-- Índices para tabela `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_curtidas_post` (`id_usuario`,`id_post`),
  ADD KEY `Index 2` (`id_usuario`,`id_post`),
  ADD KEY `FK_curtidas_posts` (`id_post`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Index 2` (`id_usuario`);

--
-- Índices para tabela `seguidores`
--
ALTER TABLE `seguidores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sugestao`
--
ALTER TABLE `sugestao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `carrouses`
--
ALTER TABLE `carrouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de tabela `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `seguidores`
--
ALTER TABLE `seguidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `subcategoria`
--
ALTER TABLE `subcategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de tabela `sugestao`
--
ALTER TABLE `sugestao`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliado` FOREIGN KEY (`id_user_avaliado`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `FK_chat_usuarios` FOREIGN KEY (`de`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `FK_chat_usuarios_2` FOREIGN KEY (`para`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FK_comentarios_posts` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `FK_comentarios_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `FK_curtidas_posts` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `FK_curtidas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK__usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

