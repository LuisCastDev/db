-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2021 a las 18:45:27
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hqservices`
--
CREATE DATABASE IF NOT EXISTS `hqservices` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hqservices`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GuardarUser` ()  SQL SECURITY INVOKER
SELECT * FROM usuarios$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analisis`
--

CREATE TABLE `analisis` (
  `id_analisis` int(11) NOT NULL,
  `nombre_analisis` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `analisis`
--

INSERT INTO `analisis` (`id_analisis`, `nombre_analisis`) VALUES
(1, 'EXAMEN DE ORINA'),
(2, 'TIPIFICACION'),
(3, 'COPROLOGICO'),
(4, 'PRUEBA ANTIGENICA C19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ars`
--

CREATE TABLE `ars` (
  `id_ars` int(26) NOT NULL,
  `nombre_ars` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `id_col_laboratorio` int(11) NOT NULL,
  `id_paciente` int(26) NOT NULL,
  `estado_laboratorio` int(11) NOT NULL,
  `fecha_visita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `laboratorio`
--

INSERT INTO `laboratorio` (`id_col_laboratorio`, `id_paciente`, `estado_laboratorio`, `fecha_visita`) VALUES
(1, 0, 0, '2021-11-30'),
(2, 6, 2, '2021-11-30'),
(3, 0, 0, '2021-11-30'),
(4, 6, 3, '2021-11-30'),
(5, 6, 1, '2021-11-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `odontologia`
--

CREATE TABLE `odontologia` (
  `id_col_odontologia` int(11) NOT NULL,
  `id_paciente` int(26) NOT NULL,
  `estado_odontologia` int(1) NOT NULL,
  `fecha_visita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `odontologia`
--

INSERT INTO `odontologia` (`id_col_odontologia`, `id_paciente`, `estado_odontologia`, `fecha_visita`) VALUES
(1, 0, 0, '2021-11-15'),
(2, 2, 2, '2021-11-15'),
(3, 0, 0, '2021-11-22'),
(4, 1, 2, '2021-11-22'),
(5, 3, 2, '2021-11-22'),
(6, 2, 2, '2021-11-22'),
(7, 4, 2, '2021-11-22'),
(8, 0, 0, '2021-11-22'),
(9, 1, 2, '2021-11-22'),
(10, 0, 0, '2021-11-22'),
(11, 2, 2, '2021-11-22'),
(12, 0, 0, '2021-11-24'),
(13, 6, 2, '2021-11-24'),
(14, 0, 0, '2021-11-24'),
(15, 1, 2, '2021-11-24'),
(16, 0, 0, '2021-11-25'),
(17, 1, 2, '2021-11-25'),
(18, 0, 0, '2021-11-26'),
(19, 6, 1, '2021-11-26'),
(20, 0, 0, '2021-11-29'),
(21, 2, 1, '2021-11-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(26) NOT NULL,
  `nombre_paciente` varchar(256) NOT NULL,
  `apellido_paciente` varchar(256) DEFAULT NULL,
  `telefono_paciente` varchar(256) NOT NULL,
  `fecha_n_paciente` date NOT NULL,
  `alergia_paciente` varchar(256) NOT NULL,
  `tipo_sangre_paciente` varchar(256) NOT NULL,
  `padecimiento_paciente` varchar(256) NOT NULL,
  `ocupacion_paciente` varchar(256) NOT NULL,
  `sexo_paciente` varchar(256) NOT NULL,
  `ars_paciente` varchar(256) NOT NULL,
  `direccion_paciente` varchar(256) NOT NULL,
  `cedula_paciente` varchar(256) NOT NULL,
  `fecha_registro_paciente` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `nombre_paciente`, `apellido_paciente`, `telefono_paciente`, `fecha_n_paciente`, `alergia_paciente`, `tipo_sangre_paciente`, `padecimiento_paciente`, `ocupacion_paciente`, `sexo_paciente`, `ars_paciente`, `direccion_paciente`, `cedula_paciente`, `fecha_registro_paciente`) VALUES
(6, 'Rosa', 'Mendosa', '8092996584', '1990-05-23', 'ninguna', 'A Positivo', 'ninguno', 'dostora', 'Femenino', 'No Asegurado', 'Avenida Mella #59', '402-11734659-11', '2021-11-21'),
(17, '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '2021-11-30'),
(18, 'Abraham', 'Upia', '849-498-2469', '1999-02-05', 'Ninguna', 'A Negativo', 'Ninguno', 'Ingeniero', 'Masculino', 'No Asegurado', 'Santiago', '401-0221231-2', '2021-11-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_analisis`
--

CREATE TABLE `paciente_analisis` (
  `id_paciente` int(11) NOT NULL,
  `id_analisis` varchar(30) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `fecha_analisis` date NOT NULL,
  `id_col_laboratorio` int(11) NOT NULL,
  `id_paciente_analisis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente_analisis`
--

INSERT INTO `paciente_analisis` (`id_paciente`, `id_analisis`, `estado`, `fecha_analisis`, `id_col_laboratorio`, `id_paciente_analisis`) VALUES
(0, '', 'pendiente', '2021-11-30', 0, 1),
(6, 'EXAMEN COPROLOGICO', 'completado', '2021-11-30', 2, 2),
(6, 'HEMOGOBLINA GLUCOSIDADA', 'cancelado', '2021-11-30', 2, 3),
(0, '', 'pendiente', '2021-11-30', 0, 4),
(6, 'TIPIFICACION', 'pendiente', '2021-11-30', 4, 5),
(6, 'EXAMEN DE ORINA', 'completado', '2021-11-30', 4, 6),
(6, 'PRUEBA ANTIGENICA CV-19', 'pendiente', '2021-11-30', 4, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba_covid`
--

CREATE TABLE `prueba_covid` (
  `id_prueba_covid` int(11) NOT NULL,
  `id_analisis` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `resultado` varchar(20) NOT NULL,
  `nombre_paciente` varchar(40) NOT NULL,
  `apellido_paciente` varchar(40) NOT NULL,
  `edad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rayos_x`
--

CREATE TABLE `rayos_x` (
  `id_col_rayosx` int(11) NOT NULL,
  `id_paciente` int(26) NOT NULL,
  `estado_rayosx` int(1) NOT NULL,
  `fecha_visita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rayos_x`
--

INSERT INTO `rayos_x` (`id_col_rayosx`, `id_paciente`, `estado_rayosx`, `fecha_visita`) VALUES
(1, 0, 0, '2021-11-15'),
(2, 3, 2, '2021-11-15'),
(3, 0, 0, '2021-11-22'),
(4, 2, 2, '2021-11-22'),
(5, 2, 2, '2021-11-22'),
(6, 1, 2, '2021-11-22'),
(7, 0, 0, '2021-11-22'),
(8, 2, 2, '2021-11-22'),
(9, 0, 0, '2021-11-22'),
(10, 1, 2, '2021-11-22'),
(11, 0, 0, '2021-11-23'),
(12, 3, 2, '2021-11-23'),
(13, 0, 0, '2021-11-26'),
(14, 14, 1, '2021-11-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(26) NOT NULL,
  `nombre_rol` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sonografia`
--

CREATE TABLE `sonografia` (
  `id_col_sonografia` int(11) NOT NULL,
  `id_paciente` int(26) NOT NULL,
  `estado_sonografia` int(1) NOT NULL,
  `fecha_visita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sonografia`
--

INSERT INTO `sonografia` (`id_col_sonografia`, `id_paciente`, `estado_sonografia`, `fecha_visita`) VALUES
(1, 0, 0, '2021-11-26'),
(2, 1, 2, '2021-11-26'),
(3, 4, 2, '2021-11-26'),
(4, 0, 0, '2021-11-26'),
(5, 2, 2, '2021-11-26'),
(6, 0, 0, '2021-11-27'),
(7, 4, 2, '2021-11-27'),
(8, 3, 1, '2021-11-27'),
(9, 4, 1, '2021-11-27'),
(10, 0, 0, '2021-11-29'),
(11, 1, 1, '2021-11-29'),
(12, 0, 0, '2021-11-30'),
(13, 18, 2, '2021-11-30'),
(14, 0, 0, '2021-12-01'),
(15, 18, 2, '2021-12-01'),
(16, 6, 2, '2021-12-01'),
(17, 6, 2, '2021-12-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sonografia_abdominal`
--

CREATE TABLE `sonografia_abdominal` (
  `id_sonografia_abdominal` int(11) NOT NULL,
  `id_tipo_sonografia` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `edad` int(4) NOT NULL,
  `morfologia` varchar(100) NOT NULL,
  `lesionesFocales` varchar(100) NOT NULL,
  `medidaHigado` varchar(100) NOT NULL,
  `viasBiliares` varchar(100) NOT NULL,
  `vesiculaForma` varchar(100) NOT NULL,
  `vesiculaSituacion` varchar(100) DEFAULT NULL,
  `vesiculaPared` varchar(100) DEFAULT NULL,
  `vesiculaLongitud` varchar(100) DEFAULT NULL,
  `vesiculaAncho` varchar(100) DEFAULT NULL,
  `vesiculaLitos` varchar(100) DEFAULT NULL,
  `vesiculaPolipos` varchar(256) DEFAULT NULL,
  `pancreasForma` varchar(100) NOT NULL,
  `pancreasSituacion` varchar(100) NOT NULL,
  `pancreasCabeza` varchar(100) NOT NULL,
  `pancreasCuerpo` varchar(100) NOT NULL,
  `pancreasCola` varchar(100) NOT NULL,
  `pancreasContorno` varchar(100) NOT NULL,
  `pancreasEcogenicidad` varchar(100) NOT NULL,
  `rinondVisualiza` varchar(100) DEFAULT NULL,
  `rinondForma` varchar(100) DEFAULT NULL,
  `rinondContornos` varchar(100) DEFAULT NULL,
  `rinondRelacion` varchar(100) DEFAULT NULL,
  `rinondEvidencia` varchar(100) DEFAULT NULL,
  `rinondLitiasis` varchar(100) DEFAULT NULL,
  `rinondTumoraciones` varchar(100) DEFAULT NULL,
  `rinonlVisualiza` varchar(100) DEFAULT NULL,
  `rinonlForma` varchar(100) DEFAULT NULL,
  `rinonlContornos` varchar(100) DEFAULT NULL,
  `rinonlRelacion` varchar(100) DEFAULT NULL,
  `rinonlEvidencia` varchar(100) DEFAULT NULL,
  `rinonlLitiasis` varchar(100) DEFAULT NULL,
  `rinonlTumoraciones` varchar(100) DEFAULT NULL,
  `bazoVisualiza` varchar(100) DEFAULT NULL,
  `bazoForma` varchar(100) DEFAULT NULL,
  `bazoEcotextura` varchar(100) DEFAULT NULL,
  `bazoTumoraciones` varchar(100) DEFAULT NULL,
  `bazoLongitud` varchar(100) DEFAULT NULL,
  `bazoAncho` varchar(100) DEFAULT NULL,
  `aortaDiametro` varchar(100) NOT NULL,
  `aortaValor` varchar(100) NOT NULL,
  `conclusiones` text NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sonografia_abdominal`
--

INSERT INTO `sonografia_abdominal` (`id_sonografia_abdominal`, `id_tipo_sonografia`, `id_paciente`, `nombre`, `apellido`, `edad`, `morfologia`, `lesionesFocales`, `medidaHigado`, `viasBiliares`, `vesiculaForma`, `vesiculaSituacion`, `vesiculaPared`, `vesiculaLongitud`, `vesiculaAncho`, `vesiculaLitos`, `vesiculaPolipos`, `pancreasForma`, `pancreasSituacion`, `pancreasCabeza`, `pancreasCuerpo`, `pancreasCola`, `pancreasContorno`, `pancreasEcogenicidad`, `rinondVisualiza`, `rinondForma`, `rinondContornos`, `rinondRelacion`, `rinondEvidencia`, `rinondLitiasis`, `rinondTumoraciones`, `rinonlVisualiza`, `rinonlForma`, `rinonlContornos`, `rinonlRelacion`, `rinonlEvidencia`, `rinonlLitiasis`, `rinonlTumoraciones`, `bazoVisualiza`, `bazoForma`, `bazoEcotextura`, `bazoTumoraciones`, `bazoLongitud`, `bazoAncho`, `aortaDiametro`, `aortaValor`, `conclusiones`, `fecha`) VALUES
(1, 1, 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-25'),
(2, 1, 3, 'Luis', 'Estrella', 0, 'NORMAL', 'NO SE VISUALIZAN', '12', 'DILATADAS.', 'DE FORMA PIRIFORME', 'NORMAL', '1212', '1212', '121', 'NO SE VISUALIZAN ', 'AUSENTES.', 'DE FORMA NORMAL', '', '121', '121', '', ' REGULARES, ', '', ' SE VISUALIZA NORMAL', ' IRREGULAR ', ' REGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE ', ' SOLIDAS.', ' SE VISUALIZA NORMAL ', ' IRREGULAR', ' REGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE', ' SOLIDAS.', ' SE VISUALIZA NORMAL ', ' REGULAR ', ' HOMOGENEA', ' AUSENTES', 'klkl', '121', ' DENTRO DE LOS LIMITES NORMALES ', '121', 'qwwewqdsadsadsad', '2021-11-25'),
(3, 1, 4, 'Julissa', 'Pina', 0, 'NORMAL', 'LIQUIDA', '2323', 'DILATADAS.', 'DE FORMA SEPTADA', 'NORMAL', '323', '323', '323', 'NO SE VISUALIZAN ', 'AUSENTES.', 'DE FORMA NORMAL', '', '323', '32323', '2323', ' REGULARES, ', 'HETEROGENEA', ' NO SE VISUALIZA', ' IRREGULAR ', ' REGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE ', ' SOLIDAS.', ' NO SE VISUALIZA ', ' IRREGULAR', ' IRREGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE', ' SOLIDAS.', ' SE VISUALIZA NORMAL ', ' REGULAR ', ' HETEROGENEA', ' AUSENTES', '232', '2323', ' DENTRO DE LOS LIMITES NORMALES ', '233', 'dfsdfsfsdfsdf', '2021-11-25'),
(4, 1, 6, 'Rosa', 'Mendosa', 31, 'NORMAL', 'NO SE VISUALIZAN', '', 'DILATADAS.', 'DE FORMA PIRIFORME', 'NORMAL', '232', '1212', '232', 'NO SE VISUALIZAN ', 'AUSENTES.', 'DE FORMA NORMAL', '', '3232', '3232', '2323', ' REGULARES, ', 'HOMOGENEA', ' SE VISUALIZA NORMAL', '', ' REGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE ', ' SOLIDAS.', ' SE VISUALIZA NORMAL ', ' IRREGULAR', ' REGULAR ', ' CONSERVADA ', ' NO ', ' SEVERA', ' SOLIDAS.', ' NO SE VISUALIZA ', ' REGULAR ', ' HOMOGENEA', ' AUSENTES', '232', '2321', ' DENTRO DE LOS LIMITES NORMALES ', '2323', 'sadaadasdas', '2021-11-25'),
(5, 1, 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-26'),
(6, 1, 1, 'Elenmanuel', 'Estrella', 0, 'NORMAL', 'LIQUIDA', '', 'DILATADAS.', 'DE FORMA SEPTADA', 'NORMAL', '1212', '2112', '1221', 'SE VISUALIZAN', 'PRESENTES.', 'DE FORMA NORMAL', '', '1212', '1212', '21212', ' REGULARES, ', 'HOMOGENEA', ' SE VISUALIZA NORMAL', ' IRREGULAR ', ' REGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE ', ' SOLIDAS.', ' NO SE VISUALIZA ', ' IRREGULAR', ' REGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE', ' SOLIDAS.', ' SE VISUALIZA NORMAL ', ' REGULAR ', ' HOMOGENEA', ' IRREGULAR', '1212', '21', ' DENTRO DE LOS LIMITES NORMALES ', '1212', 'dadadasdasd', '2021-11-26'),
(7, 1, 4, 'Julissa', 'Pina', 0, 'NORMAL', 'NO SE VISUALIZAN', '1212', 'DILATADAS.', 'DE FORMA PIRIFORME', 'ANORMAL', '1212', '1212', '1212', 'NO SE VISUALIZAN ', 'PRESENTES.', 'DE FORMA NORMAL', '', '121', '12', '1212', ' REGULARES, ', 'HOMOGENEA', ' NO SE VISUALIZA', ' IRREGULAR ', ' REGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE ', ' SOLIDAS.', ' SE VISUALIZA NORMAL ', ' IRREGULAR', ' REGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE', ' SOLIDAS.', ' SE VISUALIZA NORMAL ', ' REGULAR ', ' HOMOGENEA', ' AUSENTES', '12122', '122', ' DENTRO DE LOS LIMITES NORMALES ', '1212', 'sadsadasd', '2021-11-26'),
(8, 1, 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-27'),
(9, 1, 2, 'Ericcson', 'Castilo', 0, 'HETEROGENEA', 'LIQUIDA', '12', 'DILATADAS.', 'DE FORMA SEPTADA', 'ANORMAL', '12', '212', '212', 'NO SE VISUALIZAN ', 'PRESENTES.', 'DE FORMA NORMAL', '', '212', '212', '12', ' REGULARES, ', 'HOMOGENEA', ' SE VISUALIZA NORMAL', ' IRREGULAR ', ' REGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE ', ' SOLIDAS.', ' SE VISUALIZA NORMAL ', '', ' REGULAR ', ' CONSERVADA ', ' SI ', ' PRESENTE', ' SOLIDAS.', ' SE VISUALIZA NORMAL ', ' REGULAR ', ' HETEROGENEA', ' AUSENTES', '21', '212', ' DENTRO DE LOS LIMITES NORMALES ', '1212', 'sdsdasdasdassdasdsa', '2021-11-27'),
(10, 1, 0, '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-12-01'),
(11, 1, 18, 'Abraham', 'Upia', 22, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-12-01'),
(12, 1, 18, 'Abraham', 'Upia', 22, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-12-01'),
(13, 1, 6, 'Rosa', 'Mendosa', 31, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-12-01'),
(14, 1, 6, 'Rosa', 'Mendosa', 31, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-12-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sonografia_obstetrica`
--

CREATE TABLE `sonografia_obstetrica` (
  `id_sonografia_obstetrica` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `feto` varchar(100) NOT NULL,
  `posicion` varchar(100) NOT NULL,
  `dorso` varchar(100) NOT NULL,
  `peso` varchar(100) NOT NULL,
  `columna` varchar(100) NOT NULL,
  `estomago` varchar(100) NOT NULL,
  `rinones` varchar(100) NOT NULL,
  `vejiga` varchar(100) NOT NULL,
  `cabeza` varchar(100) NOT NULL,
  `fcf` varchar(100) NOT NULL,
  `placenta` varchar(100) NOT NULL,
  `grado` varchar(100) NOT NULL,
  `cordon` varchar(100) NOT NULL,
  `liquido` varchar(100) NOT NULL,
  `cervix` varchar(100) NOT NULL,
  `sexo` varchar(100) NOT NULL,
  `conclusiones` varchar(100) NOT NULL,
  `fpp` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `id_tipo_sonografia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sonografia_obstetrica`
--

INSERT INTO `sonografia_obstetrica` (`id_sonografia_obstetrica`, `id_paciente`, `nombre`, `apellido`, `edad`, `feto`, `posicion`, `dorso`, `peso`, `columna`, `estomago`, `rinones`, `vejiga`, `cabeza`, `fcf`, `placenta`, `grado`, `cordon`, `liquido`, `cervix`, `sexo`, `conclusiones`, `fpp`, `fecha`, `id_tipo_sonografia`) VALUES
(2, 4, 'Julissa', 'wdsfsfsdf', '0', 'GEMELAR', 'CEFÁLICO', 'POSTERIOR IZQUIERDO', '1', 'POCO VALORABLE', 'POCO VALORABLE', 'NO SE VISUALIZAN', 'NO SE VISUALIZAN', 'POCO VALORABLE', '12', 'FUNDICA', 'CERO', 'NORMAL', 'AUSEMNTE', 'ABIERTO', 'MASCULINO', 'asdasdasdasd', '1999-02-01', '2021-11-16', 2),
(3, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-21', 2),
(4, 0, 'Rosa', 'Grajales', '31', 'GEMELAR', 'CEFÁLICO', 'POSTERIOR DERECHO', '6', 'POCO VALORABLE', 'POCO VALORABLE', 'NO SE VISUALIZAN', 'NO SE VISUALIZAN', 'POCO VALORABLE', '7', 'FUNDICA', 'CERO', 'NORMAL', 'AUSEMNTE', 'ABIERTO', 'MASCULINO', 'asdasdsad', '5498-02-04', '2021-11-21', 2),
(5, 6, 'Rosa', 'Grajales', '31', 'ÚNICO', 'CEFÁLICO', 'POSTERIOR DERECHO', '7', 'POCO VALORABLE', 'POCO VALORABLE', 'NO SE VISUALIZAN', 'NO SE VISUALIZAN', 'POCO VALORABLE', '10', 'FUNDICA', 'CERO', 'NORMAL', 'AUSEMNTE', 'ABIERTO', 'MASCULINO', '', '1947-02-05', '2021-11-21', 2),
(6, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-22', 2),
(7, 4, 'Julissa', 'Pina', '0', 'ÚNICO', 'CEFÁLICO', 'POSTERIOR DERECHO', '12', 'POCO VALORABLE', 'POCO VALORABLE', 'NO SE VISUALIZAN', 'NO SE VISUALIZAN', 'POCO VALORABLE', '12', 'FUNDICA', 'CERO', 'NORMAL', 'NORMAL', 'ABIERTO', 'MASCULINO', 'Todo bien y yo que me alegro', '2021-11-22', '2021-11-22', 2),
(8, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-24', 2),
(9, 6, 'Rosa', 'Mendosa', '31', 'GEMELAR', 'CEFÁLICO', 'POSTERIOR DERECHO', '1212', 'POCO VALORABLE', 'POCO VALORABLE', 'NO SE VISUALIZAN', 'NO SE VISUALIZAN', 'POCO VALORABLE', '122', 'ANTERIOR CORPORAL', 'UNO', 'NORMAL', 'AUSEMNTE', 'ABIERTO', 'MASCULINO', 'fdsfsdfsdfsdf', '2021-11-11', '2021-11-24', 2),
(10, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-24', 2),
(11, 6, 'Rosa', 'Mendosa', '31', 'GEMELAR', 'CEFÁLICO', 'POSTERIOR IZQUIERDO', '2212', 'POCO VALORABLE', 'POCO VALORABLE', 'NO SE VISUALIZAN', 'NO SE VISUALIZAN', 'POCO VALORABLE', '212', 'ANTERIOR CORPORAL', 'CERO', 'NORMAL', 'AUSEMNTE', 'ABIERTO', 'MASCULINO', 'fdgfgdfgdgdgdgfgdgf', '2021-11-18', '2021-11-24', 2),
(12, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-11-27', 2),
(13, 4, 'Julissa', 'Pina', '0', 'ÚNICO', 'CEFÁLICO', 'POSTERIOR DERECHO', '12', 'MORFOLOGICAMENTE NORMAL', 'POCO VALORABLE', 'NO SE VISUALIZAN', 'NO SE VISUALIZAN', 'POCO VALORABLE', '212', 'FUNDICA', 'CERO', 'NORMAL', 'AUSEMNTE', 'ABIERTO', 'MASCULINO', 'sdsadasdasdsad', '2021-11-02', '2021-11-27', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_sonografias`
--

CREATE TABLE `tipos_sonografias` (
  `id_tipo_sonografia` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `contraseña` varchar(256) NOT NULL,
  `rol` varchar(32) NOT NULL,
  `estado` varchar(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `usuario_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `contraseña`, `rol`, `estado`, `fecha_registro`, `usuario_email`) VALUES
(1, 'Elenmanuel', '123456', 'administrador', 'Activo', '2021-11-26', 'elen14@gmail.com'),
(2, 'Ericcson', '1234', 'Rayos X', 'Activo', '2021-11-26', 'eric23@gmail.com');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistalabanalisisasegnoaseg`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistalabanalisisasegnoaseg` (
`OrinaNoAseg` bigint(21)
,`OrinaAseg` bigint(21)
,`TipNoAseg` bigint(21)
,`TipAseg` bigint(21)
,`CropNoAseg` bigint(21)
,`CropAseg` bigint(21)
,`COVIDNoAseg` bigint(21)
,`COVIDAseg` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistalaboratorio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistalaboratorio` (
`Name_exp_1` bigint(21)
,`Name_exp_2` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vistalabanalisisasegnoaseg`
--
DROP TABLE IF EXISTS `vistalabanalisisasegnoaseg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistalabanalisisasegnoaseg`  AS SELECT (select count(0) AS `ReportAnalisisOrina` from (`paciente_analisis` join `pacientes` on(`paciente_analisis`.`id_paciente` = `pacientes`.`id_paciente`)) where `paciente_analisis`.`id_analisis` = 'EXAMEN DE ORINA' and `pacientes`.`ars_paciente` = 'No Asegurado') AS `OrinaNoAseg`, (select count(0) AS `ReportAnalisisOrina` from (`paciente_analisis` join `pacientes` on(`paciente_analisis`.`id_paciente` = `pacientes`.`id_paciente`)) where `paciente_analisis`.`id_analisis` = 'EXAMEN DE ORINA' and `pacientes`.`ars_paciente` <> 'No Asegurado') AS `OrinaAseg`, (select count(0) AS `ReportAnalisisTipificacion` from (`paciente_analisis` join `pacientes` on(`paciente_analisis`.`id_paciente` = `pacientes`.`id_paciente`)) where `paciente_analisis`.`id_analisis` = 'TIPIFICACIÓN' and `pacientes`.`ars_paciente` = 'No Asegurado') AS `TipNoAseg`, (select count(0) AS `ReportAnalisisTipificacion` from (`paciente_analisis` join `pacientes` on(`paciente_analisis`.`id_paciente` = `pacientes`.`id_paciente`)) where `paciente_analisis`.`id_analisis` = 'TIPIFICACIÓN' and `pacientes`.`ars_paciente` <> 'No Asegurado') AS `TipAseg`, (select count(0) AS `ReportAnalisisCropolo` from (`paciente_analisis` join `pacientes` on(`paciente_analisis`.`id_paciente` = `pacientes`.`id_paciente`)) where `paciente_analisis`.`id_analisis` = 'EXAMEN COPROLÓGICO' and `pacientes`.`ars_paciente` = 'No Asegurado') AS `CropNoAseg`, (select count(0) AS `ReportAnalisisCropolo` from (`paciente_analisis` join `pacientes` on(`paciente_analisis`.`id_paciente` = `pacientes`.`id_paciente`)) where `paciente_analisis`.`id_analisis` = 'EXAMEN COPROLÓGICO' and `pacientes`.`ars_paciente` <> 'No Asegurado') AS `CropAseg`, (select count(0) AS `ReportAnalisisCOVID` from (`paciente_analisis` join `pacientes` on(`paciente_analisis`.`id_paciente` = `pacientes`.`id_paciente`)) where `paciente_analisis`.`id_analisis` = 'PRUEBA ANTIGENICA CV-19' and `pacientes`.`ars_paciente` = 'No Asegurado') AS `COVIDNoAseg`, (select count(0) AS `ReportAnalisisCOVID` from (`paciente_analisis` join `pacientes` on(`paciente_analisis`.`id_paciente` = `pacientes`.`id_paciente`)) where `paciente_analisis`.`id_analisis` = 'PRUEBA ANTIGENICA CV-19' and `pacientes`.`ars_paciente` <> 'No Asegurado') AS `COVIDAseg` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistalaboratorio`
--
DROP TABLE IF EXISTS `vistalaboratorio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistalaboratorio`  AS SELECT (select count(0) AS `reportLabAseg` from (`paciente_analisis` join `pacientes` on(`paciente_analisis`.`id_paciente` = `pacientes`.`id_paciente`)) where `pacientes`.`ars_paciente` = 'No Asegurado') AS `Name_exp_1`, (select count(0) AS `reportLabAseg` from (`paciente_analisis` join `pacientes` on(`paciente_analisis`.`id_paciente` = `pacientes`.`id_paciente`)) where `pacientes`.`ars_paciente` <> 'No Asegurado') AS `Name_exp_2` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `analisis`
--
ALTER TABLE `analisis`
  ADD PRIMARY KEY (`id_analisis`),
  ADD UNIQUE KEY `id_analisis` (`id_analisis`);

--
-- Indices de la tabla `ars`
--
ALTER TABLE `ars`
  ADD PRIMARY KEY (`id_ars`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`id_col_laboratorio`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `odontologia`
--
ALTER TABLE `odontologia`
  ADD PRIMARY KEY (`id_col_odontologia`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_paciente_2` (`id_paciente`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_paciente_2` (`id_paciente`),
  ADD KEY `id_paciente_3` (`id_paciente`);

--
-- Indices de la tabla `paciente_analisis`
--
ALTER TABLE `paciente_analisis`
  ADD PRIMARY KEY (`id_paciente_analisis`),
  ADD KEY `id_paciente_analisis` (`id_paciente_analisis`);

--
-- Indices de la tabla `prueba_covid`
--
ALTER TABLE `prueba_covid`
  ADD PRIMARY KEY (`id_prueba_covid`);

--
-- Indices de la tabla `rayos_x`
--
ALTER TABLE `rayos_x`
  ADD PRIMARY KEY (`id_col_rayosx`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `sonografia`
--
ALTER TABLE `sonografia`
  ADD PRIMARY KEY (`id_col_sonografia`),
  ADD UNIQUE KEY `id_col_sonografia` (`id_col_sonografia`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_col_sonografia_2` (`id_col_sonografia`);

--
-- Indices de la tabla `sonografia_abdominal`
--
ALTER TABLE `sonografia_abdominal`
  ADD PRIMARY KEY (`id_sonografia_abdominal`);

--
-- Indices de la tabla `sonografia_obstetrica`
--
ALTER TABLE `sonografia_obstetrica`
  ADD PRIMARY KEY (`id_sonografia_obstetrica`);

--
-- Indices de la tabla `tipos_sonografias`
--
ALTER TABLE `tipos_sonografias`
  ADD PRIMARY KEY (`id_tipo_sonografia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `analisis`
--
ALTER TABLE `analisis`
  MODIFY `id_analisis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ars`
--
ALTER TABLE `ars`
  MODIFY `id_ars` int(26) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `id_col_laboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `odontologia`
--
ALTER TABLE `odontologia`
  MODIFY `id_col_odontologia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(26) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `paciente_analisis`
--
ALTER TABLE `paciente_analisis`
  MODIFY `id_paciente_analisis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `prueba_covid`
--
ALTER TABLE `prueba_covid`
  MODIFY `id_prueba_covid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rayos_x`
--
ALTER TABLE `rayos_x`
  MODIFY `id_col_rayosx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(26) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sonografia`
--
ALTER TABLE `sonografia`
  MODIFY `id_col_sonografia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `sonografia_abdominal`
--
ALTER TABLE `sonografia_abdominal`
  MODIFY `id_sonografia_abdominal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `sonografia_obstetrica`
--
ALTER TABLE `sonografia_obstetrica`
  MODIFY `id_sonografia_obstetrica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tipos_sonografias`
--
ALTER TABLE `tipos_sonografias`
  MODIFY `id_tipo_sonografia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
