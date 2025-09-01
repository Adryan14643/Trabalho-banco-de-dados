-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01/09/2025 às 13:17
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `associacao_adryan`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `associados`
--

CREATE TABLE `associados` (
  `id_associado` int(11) NOT NULL,
  `nome_completo` varchar(255) NOT NULL,
  `e_mail` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `comunidade` varchar(255) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `data_de_associado` date NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `profissao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `associados`
--

INSERT INTO `associados` (`id_associado`, `nome_completo`, `e_mail`, `cpf`, `cidade`, `comunidade`, `cep`, `data_de_associado`, `telefone`, `profissao`) VALUES
(1, 'Luis', 'Luis@gmail.com', '00000000000', 'Luislândia', 'Campos Gerais', '39336000', '2025-08-18', '3899999999', 'trabalhador rural'),
(2, 'Claudio', 'claudio@gmail.com', '00000000000', 'São Francisco', 'Centro', '39300000', '2025-08-22', '3899999999', 'logista'),
(3, 'Davi', 'davi@gmail.com', '00000000000', 'São Francisco', 'Ybaia', '39300000', '2025-02-13', '3899999999', 'pedreiro'),
(4, 'Jose', 'Jose@gmail.com\r\n', '00000000000', 'São Francisco', 'São Lucas', '39300000', '2025-03-05', '3899999999', 'caminhoneiro'),
(5, 'Cesar', 'cesar@gmail.com', '00000000000', 'São Francisco', 'Itasa', '39300000', '2025-07-05', '3899999999', 'servente de pedreiro');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contribuicao`
--

CREATE TABLE `contribuicao` (
  `id_contribuicao` int(11) NOT NULL,
  `data_vencimento` date NOT NULL,
  `valor_pago` float NOT NULL,
  `mes_ano_referencia` date NOT NULL,
  `pendencia` varchar(255) NOT NULL,
  `data_pagamento` date NOT NULL,
  `stats` varchar(255) NOT NULL,
  `id_associado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contribuicao`
--

INSERT INTO `contribuicao` (`id_contribuicao`, `data_vencimento`, `valor_pago`, `mes_ano_referencia`, `pendencia`, `data_pagamento`, `stats`, `id_associado`) VALUES
(1, '2015-10-08', 20, '2010-02-02', 'possui', '2012-07-03', 'não pago', 1),
(2, '2025-11-08', 400, '2009-10-02', 'não possui', '2025-02-03', 'pago', 2),
(3, '2014-01-08', 300, '2010-07-02', 'possui', '2012-02-03', 'pago', 3),
(4, '2000-07-08', 20, '1990-04-02', 'não possui', '2014-02-23', 'pago', 4),
(5, '0000-00-00', 255, '2015-02-02', 'não possui', '2016-04-13', 'pago', 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `associados`
--
ALTER TABLE `associados`
  ADD PRIMARY KEY (`id_associado`);

--
-- Índices de tabela `contribuicao`
--
ALTER TABLE `contribuicao`
  ADD PRIMARY KEY (`id_contribuicao`),
  ADD KEY `id_associado` (`id_associado`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `contribuicao`
--
ALTER TABLE `contribuicao`
  ADD CONSTRAINT `contribuicao_ibfk_1` FOREIGN KEY (`id_associado`) REFERENCES `associados` (`id_associado`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
