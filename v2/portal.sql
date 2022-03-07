

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `portal`
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
-- Índices para tabela `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Index 2` (`de`),
  ADD KEY `Index 3` (`para`);

--
-- Índices para tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Index 2` (`id_post`),
  ADD KEY `Index 3` (`id_usuario`);

--
-- Índices para tabela `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_curtidas_post` (`id_usuario`,`id_post`),
  ADD KEY `Index 2` (`id_usuario`,`id_post`),
  ADD KEY `FK_curtidas_posts` (`id_post`);

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
-- AUTO_INCREMENT de tabela `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de tabela `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
