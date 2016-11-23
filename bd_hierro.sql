-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2016 a las 17:35:35
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_hierro`
--
CREATE DATABASE IF NOT EXISTS `bd_hierro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `bd_hierro`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_incidencias`
--

DROP TABLE IF EXISTS `tbl_incidencias`;
CREATE TABLE `tbl_incidencias` (
  `id_incidencia` int(4) NOT NULL,
  `descripcion_incidencia` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio_incidencia` date NOT NULL,
  `fecha_final_incidencia` date NOT NULL,
  `estado_incidencias` tinyint(1) NOT NULL,
  `nombre_usuario` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_recursos` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_recursos`
--

DROP TABLE IF EXISTS `tbl_recursos`;
CREATE TABLE `tbl_recursos` (
  `id_recursos` int(4) NOT NULL,
  `nombre_recursos` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_recursos` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_recursos` tinyint(1) NOT NULL,
  `descripcion_recursos` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_reservas` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_recursos`
--

INSERT INTO `tbl_recursos` (`id_recursos`, `nombre_recursos`, `foto_recursos`, `estado_recursos`, `descripcion_recursos`, `numero_reservas`) VALUES
(1, 'Aula de teoria 1', 'aula1.jpg', 0, 'Aula 1 (Proyector)', 1),
(2, 'Aula de teoria 2', 'aula2.jpg', 0, 'Aula 2 (Pizarra tactil)', 8),
(3, 'Aula de teoria 3', 'aula3.jpg', 0, 'Aula 3 (Piano)', 4),
(4, 'Aula de teoria 4', 'aula4.jpg', 0, 'Aula 4 (20 alumnos)', 2),
(5, 'Aula de informatica 1', 'aula5.jpg', 0, 'Aula 5 (20 ordenadores)', 1),
(6, 'Aula de informatica 2', 'aula6.jpg', 0, 'Aula 6 (10 ordenadores)', 8),
(7, 'Despacho 1', 'despt1.jpg', 0, 'Despacho de entrevista (5 pers)', 3),
(8, 'Despacho 2', 'despt2.jpg', 0, 'Despacho de entrevista (2 pers)', 2),
(9, 'Sala de reuniones', 'sala.jpg', 0, 'Sala de reuniones 1', 1),
(10, 'Proyector', 'proyector.jpg', 0, 'Proyector portatil ', 9),
(11, 'Carro de portatiles', 'carro.jpg', 0, 'Carro de 15 portatiles', 3),
(12, 'Portatil 1', 'portatil1.jpg', 0, 'i3', 2),
(13, 'Portatil 2', 'portatil2.jpg', 0, 'i5', 2),
(14, 'Portatil 3', 'portatil3.jpg', 0, 'i7', 1),
(15, 'Movil 1', 'movil1.jpg', 0, 'Samsung Galaxy S5', 8),
(16, 'Movil 2', 'movil2.jpg', 0, 'Nokia 5310', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reservas`
--

DROP TABLE IF EXISTS `tbl_reservas`;
CREATE TABLE `tbl_reservas` (
  `id_reserva` int(4) NOT NULL,
  `nombre_usuario` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio_reserva` date NOT NULL,
  `fecha_final_reserva` date NOT NULL,
  `id_recursos` int(4) NOT NULL,
  `hora_inicio_reserva` time NOT NULL,
  `hora_final_reserva` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_reservas`
--

INSERT INTO `tbl_reservas` (`id_reserva`, `nombre_usuario`, `fecha_inicio_reserva`, `fecha_final_reserva`, `id_recursos`, `hora_inicio_reserva`, `hora_final_reserva`) VALUES
(24, 'David', '2016-11-26', '2016-11-27', 1, '00:00:00', '00:00:00'),
(23, 'David', '2016-10-31', '2016-11-01', 1, '00:00:00', '00:00:00'),
(22, 'David', '2016-11-01', '2016-11-02', 1, '00:00:00', '00:00:00'),
(21, 'David', '2016-11-24', '2016-11-24', 1, '00:00:00', '00:00:00'),
(20, 'David', '2016-11-23', '2016-11-23', 1, '00:00:00', '00:00:00'),
(19, 'David', '2016-11-22', '2016-11-23', 1, '00:00:00', '00:00:00'),
(18, 'David', '2016-11-22', '2016-11-23', 1, '00:00:00', '00:00:00'),
(17, 'David', '2016-11-22', '2016-11-22', 1, '00:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
CREATE TABLE `tbl_usuarios` (
  `nombre_usuario` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_usuario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_usuario` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_usuario` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'usuario'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`nombre_usuario`, `password_usuario`, `foto_usuario`, `estado_usuario`) VALUES
('Agnes', 'asdASD123', 'agnes.jpg', 'usuario'),
('David', 'asdASD123', 'david.jpg', 'administrador'),
('Ignasi', 'asdASD123', 'ignas.jpg', 'usuario'),
('Sergio', 'asdASD123', 'sergio.jpg', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_incidencias`
--
ALTER TABLE `tbl_incidencias`
  ADD PRIMARY KEY (`id_incidencia`);

--
-- Indices de la tabla `tbl_recursos`
--
ALTER TABLE `tbl_recursos`
  ADD PRIMARY KEY (`id_recursos`);

--
-- Indices de la tabla `tbl_reservas`
--
ALTER TABLE `tbl_reservas`
  ADD PRIMARY KEY (`id_reserva`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`nombre_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_incidencias`
--
ALTER TABLE `tbl_incidencias`
  MODIFY `id_incidencia` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_recursos`
--
ALTER TABLE `tbl_recursos`
  MODIFY `id_recursos` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `tbl_reservas`
--
ALTER TABLE `tbl_reservas`
  MODIFY `id_reserva` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
