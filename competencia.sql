-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2023 a las 22:39:36
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `competencia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimiento`
--

CREATE TABLE `establecimiento` (
  `Codigo` int(10) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Responsable` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `ServicioCodigo_servicio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manzana`
--

CREATE TABLE `manzana` (
  `Codigo_manzana` int(10) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Localidad` int(10) DEFAULT NULL,
  `Direccion` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manzana_servicio`
--

CREATE TABLE `manzana_servicio` (
  `ManzanaCodigo_manzana` int(10) NOT NULL,
  `ServicioCodigo_servicio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mujeres`
--

CREATE TABLE `mujeres` (
  `Id_mujer` int(10) NOT NULL,
  `Documento` bigint(19) DEFAULT NULL,
  `Tipo_de_documento` varchar(10) DEFAULT NULL,
  `Nombres` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Telefono` bigint(19) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Ocupacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `Id_municipio` int(10) NOT NULL,
  `Servicio` varchar(50) DEFAULT NULL,
  `Infraestructura` varchar(50) DEFAULT NULL,
  `ManzanaCodigo_manzana` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `Codigo_servicio` int(10) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `EstablecimientoCodigo` int(10) NOT NULL,
  `MujeresId_mujer` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `manzana`
--
ALTER TABLE `manzana`
  ADD PRIMARY KEY (`Codigo_manzana`);

--
-- Indices de la tabla `manzana_servicio`
--
ALTER TABLE `manzana_servicio`
  ADD PRIMARY KEY (`ManzanaCodigo_manzana`,`ServicioCodigo_servicio`),
  ADD KEY `FKManzana_Se916422` (`ServicioCodigo_servicio`);

--
-- Indices de la tabla `mujeres`
--
ALTER TABLE `mujeres`
  ADD PRIMARY KEY (`Id_mujer`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`Id_municipio`),
  ADD KEY `FKMunicipio103090` (`ManzanaCodigo_manzana`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`Codigo_servicio`),
  ADD KEY `FKServicio330914` (`EstablecimientoCodigo`),
  ADD KEY `FKServicio423327` (`MujeresId_mujer`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  MODIFY `Codigo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `manzana`
--
ALTER TABLE `manzana`
  MODIFY `Codigo_manzana` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mujeres`
--
ALTER TABLE `mujeres`
  MODIFY `Id_mujer` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `Id_municipio` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `Codigo_servicio` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `manzana_servicio`
--
ALTER TABLE `manzana_servicio`
  ADD CONSTRAINT `FKManzana_Se814087` FOREIGN KEY (`ManzanaCodigo_manzana`) REFERENCES `manzana` (`Codigo_manzana`),
  ADD CONSTRAINT `FKManzana_Se916422` FOREIGN KEY (`ServicioCodigo_servicio`) REFERENCES `servicio` (`Codigo_servicio`);

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `FKMunicipio103090` FOREIGN KEY (`ManzanaCodigo_manzana`) REFERENCES `manzana` (`Codigo_manzana`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `FKServicio330914` FOREIGN KEY (`EstablecimientoCodigo`) REFERENCES `establecimiento` (`Codigo`),
  ADD CONSTRAINT `FKServicio423327` FOREIGN KEY (`MujeresId_mujer`) REFERENCES `mujeres` (`Id_mujer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
