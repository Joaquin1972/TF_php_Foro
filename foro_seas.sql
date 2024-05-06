-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-04-2024 a las 17:15:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `foro_seas`
--
CREATE DATABASE IF NOT EXISTS `foro_seas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `foro_seas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `comentario` longtext NOT NULL,
  `fecha_comentario` datetime NOT NULL,
  `id_tema` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `comentarios`:
--   `id_tema`
--       `temas` -> `id_tema`
--   `id_usuario`
--       `usuarios` -> `id_usuario`
--

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `comentario`, `fecha_comentario`, `id_tema`, `id_usuario`) VALUES
(63, 'Recomiendo coros 200', '2024-04-15 07:40:13', 47, 6),
(64, 'Buenas son las asics 3000', '2024-04-15 15:02:57', 46, 6),
(65, 'Sin problemas con el fenix 600, ademas vale para triatlon', '2024-04-15 18:06:01', 47, 16),
(66, 'Yo solo confio en GARMIN 500', '2024-04-16 18:55:48', 47, 3),
(75, 'Series de 200 y 400 a tope', '2024-04-17 16:14:33', 39, 3),
(76, 'sufriendo', '2024-04-17 17:11:33', 50, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

DROP TABLE IF EXISTS `temas`;
CREATE TABLE `temas` (
  `id_tema` int(11) NOT NULL,
  `tema` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `temas`:
--   `id_usuario`
--       `usuarios` -> `id_usuario`
--

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`id_tema`, `tema`, `fecha`, `id_usuario`) VALUES
(36, 'Maratón de Zaragoza 2024', '2024-04-13', 3),
(39, 'Entrenamiento para mejorar velocidad', '2024-04-13', 3),
(40, 'Trabajo de gymnasio más adecuado', '2024-04-13', 4),
(45, 'Como entrenar cuestas', '2024-04-13', 4),
(46, 'Que zapatillas recomendais', '2024-04-13', 5),
(47, 'Relojes GPS', '2024-04-14', 2),
(48, 'Pinché en la maraton, que me paso?', '2024-04-15', 6),
(50, 'Entrenar en cinta los días de cierzo, ¿lo hacéis?', '2024-04-16', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` text NOT NULL,
  `pw` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `usuarios`:
--

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `pw`, `email`) VALUES
(1, 'admin', '1234', 'jsalvador72@gmail.com'),
(2, 'Pedro', '12345678', 'pedro@gmail.com'),
(3, 'Luis', '12345678', 'luis@gmail.com'),
(4, 'Pepe', '12345678', 'antonio@hotmail.com'),
(5, 'Maria', '12345678', 'maria@yahoo.es'),
(6, 'alberto', '12345678', 'alberot@gmail.com'),
(15, 'Luis12', '12345678', 'luis12@gmail.com'),
(16, 'Pili', '12345678', 'pili@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_tema` (`id_tema`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`id_tema`),
  ADD KEY `FK_id_user` (`id_usuario`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `temas`
--
ALTER TABLE `temas`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `temas` (`id_tema`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `temas`
--
ALTER TABLE `temas`
  ADD CONSTRAINT `temas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
