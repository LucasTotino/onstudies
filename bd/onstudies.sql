-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/03/2024 às 18:50
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `onstudies`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(1, 'Ciências Exatas'),
(2, 'Humanas'),
(3, 'Ciências da Natureza'),
(4, 'Geografia'),
(5, 'Física'),
(6, 'Linguagens'),
(7, 'Idiomas'),
(8, 'Esportes'),
(9, 'Artes'),
(10, 'Filosofia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `texto` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_usuario`, `id_video`, `texto`) VALUES
(1, 1, 4, 'Ótimo conteúdo!'),
(2, 3, 2, 'Gostei muito da explicação.'),
(3, 2, 5, 'Poderia ser mais claro.'),
(4, 4, 1, 'Parabéns pelo vídeo.'),
(5, 5, 3, 'Não entendi essa parte.'),
(6, 6, 8, 'Excelente explicação!'),
(7, 7, 9, 'Concordo com o ponto levantado.'),
(8, 8, 6, 'Gostaria de mais exemplos práticos.'),
(9, 9, 7, 'Muito informativo.'),
(10, 10, 10, 'Interessante, mas faltou detalhes.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `curtir`
--

CREATE TABLE `curtir` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `curtida` enum('Curtida','Deslike') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `curtir`
--

INSERT INTO `curtir` (`id`, `id_usuario`, `id_video`, `curtida`) VALUES
(1, 1, 3, 'Curtida'),
(2, 2, 1, 'Deslike'),
(3, 3, 4, 'Curtida'),
(4, 4, 2, 'Curtida'),
(5, 5, 5, 'Deslike'),
(6, 6, 7, 'Curtida'),
(7, 7, 9, 'Deslike'),
(8, 8, 6, 'Curtida'),
(9, 9, 8, 'Curtida'),
(10, 10, 10, 'Deslike');

-- --------------------------------------------------------

--
-- Estrutura para tabela `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `materias`
--

INSERT INTO `materias` (`id`, `nome`) VALUES
(1, 'Matemática'),
(2, 'História'),
(3, 'Química'),
(4, 'Geografia'),
(5, 'Física'),
(6, 'Biologia'),
(7, 'Inglês'),
(8, 'Educação Física'),
(9, 'Artes'),
(10, 'Filosofia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `materia_categoria`
--

CREATE TABLE `materia_categoria` (
  `id` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `materia_categoria`
--

INSERT INTO `materia_categoria` (`id`, `id_materia`, `id_categoria`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `publicar`
--

CREATE TABLE `publicar` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `data_publicacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `publicar`
--

INSERT INTO `publicar` (`id`, `id_usuario`, `id_video`, `titulo`, `data_publicacao`) VALUES
(1, 1, 1, 'Introdução à Álgebra', '2023-01-20'),
(2, 2, 3, 'A Era Antiga: Uma Visão Geral', '2023-02-28'),
(3, 3, 5, 'Princípios Básicos de Química', '2023-03-15'),
(4, 4, 2, 'Geografia Humana: Uma Perspectiva Global', '2023-04-02'),
(5, 5, 4, 'Física Quântica Explorada', '2023-05-10'),
(6, 6, 7, 'Biologia Celular', '2023-06-05'),
(7, 7, 9, 'A Importância da Atividade Física', '2023-07-12'),
(8, 8, 6, 'Explorando as Artes Visuais', '2023-08-18'),
(9, 9, 8, 'Linguagem Corporal no Idioma Inglês', '2023-09-25'),
(10, 10, 10, 'Filosofia: Uma Jornada de Reflexão', '2023-10-30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `seguir`
--

CREATE TABLE `seguir` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_seguindo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `seguir`
--

INSERT INTO `seguir` (`id`, `id_usuario`, `id_seguindo`) VALUES
(1, 1, 2),
(3, 2, 5),
(2, 3, 1),
(4, 4, 3),
(5, 5, 1),
(6, 6, 8),
(7, 7, 10),
(8, 8, 6),
(9, 9, 4),
(10, 10, 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `qualificacao` enum('Aluno','Professor','Ambos') NOT NULL,
  `senha` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `data_nascimento`, `qualificacao`, `senha`, `email`, `celular`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`) VALUES
(1, 'Ana Silva', '12345678901', '1990-05-15', 'Aluno', 'senha1', 'ana.silva@hotmail.com', '', '12345-678', 'Rua 1', '1', '', 'Bairro 1', 'Cidade Exemplo', 'UF'),
(2, 'Carlos Oliveira', '98765432101', '1985-08-20', 'Professor', 'senha2', 'usuario2@exemplo.com', '', '12345-678', 'Rua 2', '2', '', 'Bairro 2', 'Cidade Exemplo', 'UF'),
(3, 'Mariana Santos', '45678901234', '1998-02-10', 'Ambos', 'senha3', 'usuario3@exemplo.com', '', '12345-678', 'Rua 3', '3', '', 'Bairro 3', 'Cidade Exemplo', 'UF'),
(4, 'João Pereira', '78901234567', '1995-11-25', 'Aluno', 'senha4', 'usuario4@exemplo.com', '', '12345-678', 'Rua 4', '4', '', 'Bairro 4', 'Cidade Exemplo', 'UF'),
(5, 'Lucia Mendes', '23456789012', '1980-04-03', 'Professor', 'senha5', 'usuario5@exemplo.com', '', '12345-678', 'Rua 5', '5', '', 'Bairro 5', 'Cidade Exemplo', 'UF'),
(6, 'Fernando Souza', '34567890123', '1992-07-18', 'Aluno', 'senha6', 'usuario6@exemplo.com', '', '12345-678', 'Rua 6', '6', '', 'Bairro 6', 'Cidade Exemplo', 'UF'),
(7, 'Beatriz Lima', '56789012345', '1987-12-05', 'Aluno', 'senha7', 'usuario7@exemplo.com', '', '12345-678', 'Rua 7', '7', '', 'Bairro 7', 'Cidade Exemplo', 'UF'),
(8, 'Rafaela Castro', '67890123456', '1999-03-28', 'Professor', 'senha8', 'usuario8@exemplo.com', '', '12345-678', 'Rua 8', '8', '', 'Bairro 8', 'Cidade Exemplo', 'UF'),
(9, 'Paulo Santos', '89012345678', '1993-09-21', 'Ambos', 'senha9', 'usuario9@exemplo.com', '', '12345-678', 'Rua 9', '9', '', 'Bairro 9', 'Cidade Exemplo', 'UF'),
(10, 'Roberto Silva', '01234567890', '1984-06-14', 'Aluno', 'senha10', 'usuario10@exemplo.com', '', '12345-678', 'Rua 10', '10', '', 'Bairro 10', 'Cidade Exemplo', 'UF');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ver`
--

CREATE TABLE `ver` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `tempo_visualizacao` time NOT NULL,
  `data_visualizacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ver`
--

INSERT INTO `ver` (`id`, `id_usuario`, `id_video`, `tempo_visualizacao`, `data_visualizacao`) VALUES
(1, 1, 2, '00:08:30', '2023-01-15'),
(2, 3, 1, '00:12:45', '2023-02-20'),
(3, 2, 4, '00:18:20', '2023-03-10'),
(4, 4, 3, '00:05:40', '2023-04-25'),
(5, 5, 5, '00:10:15', '2023-05-03'),
(6, 6, 6, '00:15:30', '2023-06-18'),
(7, 7, 7, '00:07:20', '2023-07-22'),
(8, 8, 8, '00:11:50', '2023-08-30'),
(9, 9, 9, '00:09:15', '2023-09-12'),
(10, 10, 10, '00:14:40', '2023-10-05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `tempo_do_video` float NOT NULL,
  `qtd_visualizacoes` int(11) DEFAULT 0,
  `qtd_curtidas` int(11) DEFAULT 0,
  `qtd_deslike` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `videos`
--

INSERT INTO `videos` (`id`, `tempo_do_video`, `qtd_visualizacoes`, `qtd_curtidas`, `qtd_deslike`) VALUES
(1, 10.5, 0, 1, 1),
(2, 15.2, 0, 1, 0),
(3, 8, 0, 1, 0),
(4, 20.7, 0, 1, 0),
(5, 12.3, 0, 1, 1),
(6, 18.9, 0, 1, 0),
(7, 25, 0, 1, 0),
(8, 14.5, 0, 1, 0),
(9, 9.8, 0, 1, 1),
(10, 22.1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `video_materia`
--

CREATE TABLE `video_materia` (
  `id` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_video` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `video_materia`
--

INSERT INTO `video_materia` (`id`, `id_materia`, `id_video`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_video` (`id_video`);

--
-- Índices de tabela `curtir`
--
ALTER TABLE `curtir`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_video`),
  ADD KEY `id_video` (`id_video`);

--
-- Índices de tabela `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `materia_categoria`
--
ALTER TABLE `materia_categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_materia` (`id_materia`,`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices de tabela `publicar`
--
ALTER TABLE `publicar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_video`),
  ADD KEY `id_video` (`id_video`);

--
-- Índices de tabela `seguir`
--
ALTER TABLE `seguir`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_seguindo`),
  ADD KEY `id_seguindo` (`id_seguindo`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `ver`
--
ALTER TABLE `ver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_video` (`id_video`);

--
-- Índices de tabela `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `video_materia`
--
ALTER TABLE `video_materia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_materia` (`id_materia`,`id_video`),
  ADD KEY `id_video` (`id_video`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `curtir`
--
ALTER TABLE `curtir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `materia_categoria`
--
ALTER TABLE `materia_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `publicar`
--
ALTER TABLE `publicar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `seguir`
--
ALTER TABLE `seguir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `ver`
--
ALTER TABLE `ver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `video_materia`
--
ALTER TABLE `video_materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id`);

--
-- Restrições para tabelas `curtir`
--
ALTER TABLE `curtir`
  ADD CONSTRAINT `curtir_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `curtir_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id`);

--
-- Restrições para tabelas `materia_categoria`
--
ALTER TABLE `materia_categoria`
  ADD CONSTRAINT `materia_categoria_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `materia_categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

--
-- Restrições para tabelas `publicar`
--
ALTER TABLE `publicar`
  ADD CONSTRAINT `publicar_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `publicar_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id`);

--
-- Restrições para tabelas `seguir`
--
ALTER TABLE `seguir`
  ADD CONSTRAINT `seguir_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `seguir_ibfk_2` FOREIGN KEY (`id_seguindo`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `ver`
--
ALTER TABLE `ver`
  ADD CONSTRAINT `ver_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `ver_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id`);

--
-- Restrições para tabelas `video_materia`
--
ALTER TABLE `video_materia`
  ADD CONSTRAINT `video_materia_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `video_materia_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
