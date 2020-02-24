-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2020 a las 02:08:01
-- Versión del servidor: 10.4.6-MariaDB-log
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tutorias503`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `img_categoria` text DEFAULT NULL,
  `eliminado_categoria` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `categoria`, `img_categoria`, `eliminado_categoria`) VALUES
(1, 'Matematicas', NULL, '1'),
(2, 'Programacion', NULL, '1'),
(3, 'Electronica', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id_estudiante` int(11) NOT NULL,
  `nombre_estudiante` varchar(50) NOT NULL,
  `apellido_estudiante` varchar(50) NOT NULL,
  `dui_estudiante` varchar(10) NOT NULL,
  `cel_estudiante` varchar(9) NOT NULL,
  `tel_estudiante` varchar(9) NOT NULL,
  `email_estudiante` varchar(50) NOT NULL,
  `nivel_academico` varchar(30) NOT NULL,
  `fecha_nac_estudiante` varchar(10) NOT NULL,
  `password_estudiante` varchar(50) NOT NULL,
  `img_estudiante` text NOT NULL,
  `eliminado_estudiante` enum('0','1') NOT NULL,
  `descripcion_estudiante` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_materia`
--

CREATE TABLE `estudiante_materia` (
  `id_estudiante_materia` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `estado` enum('Cursando','Finalizado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feedback_estudiante`
--

CREATE TABLE `feedback_estudiante` (
  `id_feedback_estudiante` int(11) NOT NULL,
  `id_estudiante_materia` int(11) NOT NULL,
  `id_tutor` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feedback_tutor`
--

CREATE TABLE `feedback_tutor` (
  `id_feedback_tutor` int(11) NOT NULL,
  `id_tutor_materia` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `materia` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `costo` float NOT NULL,
  `eliminado_materia` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `materia`, `descripcion`, `id_categoria`, `costo`, `eliminado_materia`) VALUES
(1, 'Matematica Bachillerato', 'Con estas tutorias seras capas de salir de obtener mejores calificaciones, y sobresalir en matematicas', 1, 15, '1'),
(2, 'PHP', 'Aprenderas a programar backend con el lenguaje PHP', 2, 20, '1'),
(4, 'Arduino', 'Aprenderas a utilizar el microcontrolador arduino para tus proyectos estudiantiles o tambien para automatizar tu hogar', 3, 20, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresia`
--

CREATE TABLE `membresia` (
  `id_membresia` int(11) NOT NULL,
  `nivel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `membresia`
--

INSERT INTO `membresia` (`id_membresia`, `nivel`) VALUES
(1, 'Gratis'),
(2, 'Premium'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores`
--

CREATE TABLE `tutores` (
  `id_tutor` int(11) NOT NULL,
  `nombre_tutor` varchar(50) NOT NULL,
  `apellido_tutor` varchar(50) NOT NULL,
  `dui_tutor` varchar(10) NOT NULL,
  `cel_tutor` varchar(9) NOT NULL,
  `tel_tutor` varchar(9) NOT NULL,
  `email_tutor` varchar(70) NOT NULL,
  `experiencia` text NOT NULL,
  `cv_tutor` varchar(20) DEFAULT NULL,
  `password_tutor` varchar(20) NOT NULL,
  `img_tutor` text DEFAULT NULL,
  `fecha_nac_tutor` varchar(10) NOT NULL,
  `id_membresia` int(11) NOT NULL,
  `eliminado_tutor` enum('0','1') NOT NULL,
  `descripcion_tutor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tutores`
--

INSERT INTO `tutores` (`id_tutor`, `nombre_tutor`, `apellido_tutor`, `dui_tutor`, `cel_tutor`, `tel_tutor`, `email_tutor`, `experiencia`, `cv_tutor`, `password_tutor`, `img_tutor`, `fecha_nac_tutor`, `id_membresia`, `eliminado_tutor`, `descripcion_tutor`) VALUES
(1, 'Marlon', 'Fernandez', '12345678-9', '7649-0659', '7649-0659', 'marlon.fdez77@gmail.com', 'Prueba de administrador', NULL, '12345', NULL, '23-11-1997', 3, '1', 'Prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor_materia`
--

CREATE TABLE `tutor_materia` (
  `id_tutor_materia` int(11) NOT NULL,
  `id_tutor` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tutor_materia`
--

INSERT INTO `tutor_materia` (`id_tutor_materia`, `id_tutor`, `id_materia`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_tutor_materia` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `estudiante_materia`
--
ALTER TABLE `estudiante_materia`
  ADD PRIMARY KEY (`id_estudiante_materia`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `feedback_estudiante`
--
ALTER TABLE `feedback_estudiante`
  ADD PRIMARY KEY (`id_feedback_estudiante`),
  ADD KEY `id_estudiante_materia` (`id_estudiante_materia`),
  ADD KEY `id_tutor` (`id_tutor`);

--
-- Indices de la tabla `feedback_tutor`
--
ALTER TABLE `feedback_tutor`
  ADD PRIMARY KEY (`id_feedback_tutor`),
  ADD KEY `id_tutor_materia` (`id_tutor_materia`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `membresia`
--
ALTER TABLE `membresia`
  ADD PRIMARY KEY (`id_membresia`);

--
-- Indices de la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD PRIMARY KEY (`id_tutor`),
  ADD KEY `id_membresia` (`id_membresia`);

--
-- Indices de la tabla `tutor_materia`
--
ALTER TABLE `tutor_materia`
  ADD PRIMARY KEY (`id_tutor_materia`),
  ADD KEY `id_tutor` (`id_tutor`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_tutor_materia` (`id_tutor_materia`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiante_materia`
--
ALTER TABLE `estudiante_materia`
  MODIFY `id_estudiante_materia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `feedback_estudiante`
--
ALTER TABLE `feedback_estudiante`
  MODIFY `id_feedback_estudiante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `feedback_tutor`
--
ALTER TABLE `feedback_tutor`
  MODIFY `id_feedback_tutor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `membresia`
--
ALTER TABLE `membresia`
  MODIFY `id_membresia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tutores`
--
ALTER TABLE `tutores`
  MODIFY `id_tutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tutor_materia`
--
ALTER TABLE `tutor_materia`
  MODIFY `id_tutor_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante_materia`
--
ALTER TABLE `estudiante_materia`
  ADD CONSTRAINT `estudiante_materia_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_materia_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `feedback_estudiante`
--
ALTER TABLE `feedback_estudiante`
  ADD CONSTRAINT `feedback_estudiante_ibfk_1` FOREIGN KEY (`id_estudiante_materia`) REFERENCES `estudiante_materia` (`id_estudiante_materia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_estudiante_ibfk_2` FOREIGN KEY (`id_tutor`) REFERENCES `tutores` (`id_tutor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `feedback_tutor`
--
ALTER TABLE `feedback_tutor`
  ADD CONSTRAINT `feedback_tutor_ibfk_1` FOREIGN KEY (`id_tutor_materia`) REFERENCES `tutor_materia` (`id_tutor_materia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_tutor_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD CONSTRAINT `tutores_ibfk_1` FOREIGN KEY (`id_membresia`) REFERENCES `membresia` (`id_membresia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tutor_materia`
--
ALTER TABLE `tutor_materia`
  ADD CONSTRAINT `tutor_materia_ibfk_1` FOREIGN KEY (`id_tutor`) REFERENCES `tutores` (`id_tutor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tutor_materia_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_tutor_materia`) REFERENCES `tutor_materia` (`id_tutor_materia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
