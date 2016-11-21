-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2016 a las 17:12:45
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_incidencias`
--

CREATE TABLE `tbl_incidencias` (
  `id_incidencia` int(4) NOT NULL,
  `descripcion_incidencia` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio_incidencia` date NOT NULL,
  `fecha_final_incidencia` date NOT NULL,
  `estado_incidencias` tinyint(1) NOT NULL,
  `nombre_usuario` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_recursos` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_recursos`
--

CREATE TABLE `tbl_recursos` (
  `id_recursos` int(4) NOT NULL,
  `nombre_recursos` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_recursos` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_recursos` tinyint(1) NOT NULL,
  `descripcion_recursos` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_reservas` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_recursos`
--

INSERT INTO `tbl_recursos` (`id_recursos`, `nombre_recursos`, `foto_recursos`, `estado_recursos`, `descripcion_recursos`, `numero_reservas`) VALUES
(1, 'au_teoria1', 'aula1.jpg', 0, 'aula 1 (Proyector)', 0),
(2, 'au_teoria2', 'aula2.jpg', 0, 'aula 2 (Pizarra tactil)', 0),
(3, 'au_teoria3', 'aula3.jpg', 0, 'aula 3 (Piano)', 0),
(4, 'au_teoria4', 'aula4.jpg', 0, 'aula 4 (20 alumnos)', 0),
(5, 'au_info1', 'aula5.jpg', 0, 'aula 5 (20 ordenadores)', 0),
(6, 'au_info2', 'aula6.jpg', 0, 'aula 6 (10 ordenadores)', 0),
(7, 'despt1', 'despt1.jpg', 0, 'despacho de entrevista (5 pers', 0),
(8, 'despt2', 'despt2.jpg', 0, 'despacho de entrevista (2 pers', 0),
(9, 'sala_reuni', 'sala.jpg', 0, '', 0),
(10, 'proyector', 'proyector.jpg', 0, 'proyector portatil ', 0),
(11, 'carro', 'carro.jpg', 0, 'carro de 15 portatiles', 0),
(12, 'portatil1', 'portatil1.jpg', 0, 'i3', 0),
(13, 'portatil2', 'portatil2.jpg', 0, 'i5', 0),
(14, 'portatil3', 'portatil3.jpg', 0, 'i7', 0),
(15, 'mobil1', 'mobil1.jpg', 0, 'Samsung S5', 0),
(16, 'mobil2', 'mobil2.jpg', 0, 'Nokia 5310', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reservas`
--

CREATE TABLE `tbl_reservas` (
  `id_reserva` int(4) NOT NULL,
  `nombre_usuario` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio_reserva` date NOT NULL,
  `fecha_final_reserva` date NOT NULL,
  `id_recursos` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `nombre_usuario` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_usuario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_usuario` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`nombre_usuario`, `password_usuario`, `foto_usuario`) VALUES
('Agnes', 'asdASD123', 'agnes.jpg'),
('David', 'asdASD123', 'david.jpg'),
('Ignasi', 'asdASD123', 'ignas.jpg'),
('Sergio', 'asdASD123', 'sergio.jpg');

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
  MODIFY `id_reserva` int(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
