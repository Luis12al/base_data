-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-12-2024 a las 22:41:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base_data_people`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `activity_details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contact`
--

CREATE TABLE `contact` (
  `people_id` int(11) DEFAULT NULL,
  `telefono_principal` varchar(15) NOT NULL DEFAULT 'Sin especificar',
  `telefono_secundario` varchar(15) NOT NULL DEFAULT 'Sin especificar',
  `correo_electronico` varchar(255) NOT NULL DEFAULT 'correo@ejemplo.com',
  `direccion_residencia` varchar(255) NOT NULL DEFAULT 'No especificada',
  `municipio` varchar(100) NOT NULL DEFAULT 'No especificado',
  `barrio_vereda` varchar(100) NOT NULL DEFAULT 'No especificado',
  `comuna_corregimiento` varchar(100) NOT NULL DEFAULT 'No especificado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contractor`
--

CREATE TABLE `contractor` (
  `people_id` int(11) DEFAULT NULL,
  `entity` varchar(255) DEFAULT NULL,
  `contract_type` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `main_activity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `differential_focus`
--

CREATE TABLE `differential_focus` (
  `people_id` int(11) NOT NULL,
  `focus_name` enum('reintegrado','desmovilizado','extrema pobreza','poblacion victima del conflicto armado','poblacion LGBTIQ','personas en condicion de discapacidad','mujeres cabeza de familia','adultos mayores','ninos ninas y adolecentes') NOT NULL,
  `grupo_etnico` enum('Negro','Otro','Ninguno','raizal','Afrocolombiano','palanquero (NARP)') NOT NULL DEFAULT 'Ninguno',
  `acreditacion_grupo_etnico` varchar(255) DEFAULT NULL,
  `certificado_discapacidad` tinyint(1) NOT NULL DEFAULT 0,
  `tipo_discapacidad` enum('Física','Auditiva','Visual','Intelectual','Psicológica','Ninguna') NOT NULL DEFAULT 'Ninguna',
  `cuidador_cuidadora` tinyint(1) NOT NULL DEFAULT 0,
  `campesino_campesina` tinyint(1) NOT NULL DEFAULT 0,
  `victima_conflicto` tinyint(1) NOT NULL DEFAULT 0,
  `reincorporacion_reintegracion` tinyint(1) NOT NULL DEFAULT 0,
  `madre_cabeza_familia` tinyint(1) NOT NULL DEFAULT 0,
  `madre_gestante_lactante` tinyint(1) NOT NULL DEFAULT 0,
  `sisben` enum('A','B','C','D','Ninguno') NOT NULL DEFAULT 'Ninguno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educational_levels`
--

CREATE TABLE `educational_levels` (
  `educational_levels_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educational_level_types`
--

CREATE TABLE `educational_level_types` (
  `level_id` int(11) NOT NULL,
  `level_name` enum('universitaria','tecnica o tecnologica','secundaria incompleta','secundaria completa','primaria incompleta','primaria completa','ninguna') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `educational_level_types`
--

INSERT INTO `educational_level_types` (`level_id`, `level_name`) VALUES
(1, 'universitaria'),
(2, 'tecnica o tecnologica'),
(3, 'secundaria completa'),
(4, 'primaria completa'),
(5, 'ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emergency`
--

CREATE TABLE `emergency` (
  `people_id` int(11) DEFAULT NULL,
  `blood_type` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `contact_relationship` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_private_sector`
--

CREATE TABLE `employee_private_sector` (
  `people_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `employment_type` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrepreneur`
--

CREATE TABLE `entrepreneur` (
  `entrepreneurship_id` int(11) NOT NULL,
  `people_id` int(11) DEFAULT NULL,
  `entrepreneurship_name` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `activity_type` varchar(255) DEFAULT NULL,
  `institutional_offer` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `focus_types`
--

CREATE TABLE `focus_types` (
  `focus_id` int(11) NOT NULL,
  `focus_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `focus_types`
--

INSERT INTO `focus_types` (`focus_id`, `focus_name`) VALUES
(8, 'adultos mayores'),
(2, 'desmovilizado'),
(3, 'extrema pobreza'),
(7, 'mujeres cabeza de familia'),
(9, 'ninos ninas y adolecentes'),
(6, 'personas en condicion de discapacidad'),
(5, 'poblacion LGBTIQ'),
(4, 'poblacion victima del conflicto armado'),
(1, 'reintegrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formation_occupations`
--

CREATE TABLE `formation_occupations` (
  `people_id` int(11) NOT NULL,
  `nivel_academico` enum('Primaria','Básica Secundaria','Bachiller','Técnico','Tecnólogo','Profesional','Especialización','Maestría','Doctorado','Ninguno') NOT NULL DEFAULT 'Ninguno',
  `ocupacion` enum('Empleado público','Empleado privado','Desempleado/a','Contratista del Estado','Emprendedor','Actividad informal') NOT NULL DEFAULT 'Desempleado/a',
  `nombre_empresa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicator`
--

CREATE TABLE `indicator` (
  `indicator_id` int(11) NOT NULL,
  `meta_id` int(11) NOT NULL,
  `indicator_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicator_result`
--

CREATE TABLE `indicator_result` (
  `indicator_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `indicator_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marital_statuses`
--

CREATE TABLE `marital_statuses` (
  `people_id` int(11) NOT NULL,
  `status_name` enum('soltero(@)','casado(@)','union libre','viudo(@)','separado(@)') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meta_type`
--

CREATE TABLE `meta_type` (
  `meta_id` int(11) NOT NULL,
  `meta_type_id` int(11) NOT NULL,
  `meta_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ods`
--

CREATE TABLE `ods` (
  `meta_id` int(11) NOT NULL,
  `ods_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `people_id` int(11) NOT NULL,
  `tipo_documento` enum('registro civil','tarjeta de identidad','cedula de ciudadania','cedula de extranjeria','pasaporte','permiso de permanencia temporal') NOT NULL,
  `nombres_completos` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `genero` enum('Masculino','Femenino','Otro','Prefiero no decirlo') NOT NULL,
  `qr_code_path` varchar(255) DEFAULT NULL,
  `lugar_expedicion` varchar(255) DEFAULT NULL,
  `primer_apellido` varchar(255) NOT NULL,
  `segundo_apellido` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people_focus`
--

CREATE TABLE `people_focus` (
  `people_id` int(11) NOT NULL,
  `focus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_desarrollo`
--

CREATE TABLE `plan_desarrollo` (
  `plan_id` int(11) NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `population`
--

CREATE TABLE `population` (
  `people_id` int(11) DEFAULT NULL,
  `ethnic_group` varchar(255) DEFAULT NULL,
  `ethnic_accreditation` varchar(255) DEFAULT NULL,
  `disability` varchar(255) DEFAULT NULL,
  `disability_certificate` tinyint(1) DEFAULT NULL,
  `caregiver` tinyint(1) DEFAULT NULL,
  `peasant` tinyint(1) DEFAULT NULL,
  `conflict_victim` tinyint(1) DEFAULT NULL,
  `reincorporation_reintegration` tinyint(1) DEFAULT NULL,
  `lgtbiqa` varchar(255) DEFAULT NULL,
  `migrant` tinyint(1) DEFAULT NULL,
  `srpa` tinyint(1) DEFAULT NULL,
  `freedom_deprivation` tinyint(1) DEFAULT NULL,
  `mother_head_family` tinyint(1) DEFAULT NULL,
  `pregnant_mother` tinyint(1) DEFAULT NULL,
  `gestation_date` date DEFAULT NULL,
  `sisben` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `program`
--

CREATE TABLE `program` (
  `sector_id` int(11) NOT NULL,
  `program_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `public_sector_employee`
--

CREATE TABLE `public_sector_employee` (
  `people_id` int(11) DEFAULT NULL,
  `entity` varchar(255) DEFAULT NULL,
  `employment_type` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `sector_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `sector_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `strategic_line`
--

CREATE TABLE `strategic_line` (
  `line_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `line_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `training`
--

CREATE TABLE `training` (
  `people_id` int(11) DEFAULT NULL,
  `educational_levels_id` int(11) DEFAULT NULL,
  `technical_title` varchar(255) DEFAULT NULL,
  `professional_title` varchar(255) DEFAULT NULL,
  `postgraduate_degree` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `people_id` (`people_id`);

--
-- Indices de la tabla `contact`
--
ALTER TABLE `contact`
  ADD KEY `fk_contact_people` (`people_id`);

--
-- Indices de la tabla `contractor`
--
ALTER TABLE `contractor`
  ADD KEY `fk_contractor_people` (`people_id`);

--
-- Indices de la tabla `differential_focus`
--
ALTER TABLE `differential_focus`
  ADD UNIQUE KEY `people_id` (`people_id`);

--
-- Indices de la tabla `educational_levels`
--
ALTER TABLE `educational_levels`
  ADD PRIMARY KEY (`educational_levels_id`),
  ADD UNIQUE KEY `un` (`people_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indices de la tabla `educational_level_types`
--
ALTER TABLE `educational_level_types`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `level_name` (`level_name`);

--
-- Indices de la tabla `emergency`
--
ALTER TABLE `emergency`
  ADD KEY `fk_emergency_people` (`people_id`);

--
-- Indices de la tabla `employee_private_sector`
--
ALTER TABLE `employee_private_sector`
  ADD KEY `fk_private_sector_people` (`people_id`);

--
-- Indices de la tabla `entrepreneur`
--
ALTER TABLE `entrepreneur`
  ADD PRIMARY KEY (`entrepreneurship_id`),
  ADD KEY `fk_entrepreneur_people` (`people_id`);

--
-- Indices de la tabla `focus_types`
--
ALTER TABLE `focus_types`
  ADD PRIMARY KEY (`focus_id`),
  ADD UNIQUE KEY `focus_name` (`focus_name`);

--
-- Indices de la tabla `formation_occupations`
--
ALTER TABLE `formation_occupations`
  ADD UNIQUE KEY `people_id` (`people_id`);

--
-- Indices de la tabla `indicator`
--
ALTER TABLE `indicator`
  ADD PRIMARY KEY (`indicator_id`),
  ADD UNIQUE KEY `meta_id` (`meta_id`);

--
-- Indices de la tabla `indicator_result`
--
ALTER TABLE `indicator_result`
  ADD PRIMARY KEY (`indicator_id`),
  ADD UNIQUE KEY `line_id` (`line_id`);

--
-- Indices de la tabla `marital_statuses`
--
ALTER TABLE `marital_statuses`
  ADD UNIQUE KEY `people_id` (`people_id`);

--
-- Indices de la tabla `meta_type`
--
ALTER TABLE `meta_type`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indices de la tabla `ods`
--
ALTER TABLE `ods`
  ADD UNIQUE KEY `meta_id` (`meta_id`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`people_id`),
  ADD KEY `idx_full_name` (`nombres_completos`),
  ADD KEY `idx_gender` (`genero`);

--
-- Indices de la tabla `people_focus`
--
ALTER TABLE `people_focus`
  ADD PRIMARY KEY (`people_id`,`focus_id`),
  ADD KEY `focus_id` (`focus_id`);

--
-- Indices de la tabla `plan_desarrollo`
--
ALTER TABLE `plan_desarrollo`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indices de la tabla `population`
--
ALTER TABLE `population`
  ADD KEY `fk_population_people` (`people_id`);

--
-- Indices de la tabla `program`
--
ALTER TABLE `program`
  ADD UNIQUE KEY `sector_id` (`sector_id`);

--
-- Indices de la tabla `public_sector_employee`
--
ALTER TABLE `public_sector_employee`
  ADD KEY `fk_public_sector_people` (`people_id`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`sector_id`),
  ADD UNIQUE KEY `plan_id` (`plan_id`);

--
-- Indices de la tabla `strategic_line`
--
ALTER TABLE `strategic_line`
  ADD PRIMARY KEY (`line_id`),
  ADD UNIQUE KEY `plan_id` (`plan_id`);

--
-- Indices de la tabla `training`
--
ALTER TABLE `training`
  ADD UNIQUE KEY `people_id` (`people_id`,`educational_levels_id`),
  ADD KEY `fk_training_to_educational_levels` (`educational_levels_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `focus_types`
--
ALTER TABLE `focus_types`
  MODIFY `focus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `indicator`
--
ALTER TABLE `indicator`
  MODIFY `indicator_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `indicator_result`
--
ALTER TABLE `indicator_result`
  MODIFY `indicator_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `meta_type`
--
ALTER TABLE `meta_type`
  MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan_desarrollo`
--
ALTER TABLE `plan_desarrollo`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `sector_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `strategic_line`
--
ALTER TABLE `strategic_line`
  MODIFY `line_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `fk_contact_to_people` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contractor`
--
ALTER TABLE `contractor`
  ADD CONSTRAINT `fk_contractor_to_people` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `differential_focus`
--
ALTER TABLE `differential_focus`
  ADD CONSTRAINT `differential_focus_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `educational_levels`
--
ALTER TABLE `educational_levels`
  ADD CONSTRAINT `educational_levels_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `educational_level_types` (`level_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `educational_levels_ibfk_2` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `emergency`
--
ALTER TABLE `emergency`
  ADD CONSTRAINT `fk_emergency_to_people` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `employee_private_sector`
--
ALTER TABLE `employee_private_sector`
  ADD CONSTRAINT `fk_employee_private_to_people` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entrepreneur`
--
ALTER TABLE `entrepreneur`
  ADD CONSTRAINT `entrepreneur_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `formation_occupations`
--
ALTER TABLE `formation_occupations`
  ADD CONSTRAINT `formation_occupations_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `indicator`
--
ALTER TABLE `indicator`
  ADD CONSTRAINT `fk_indicator_to_meta` FOREIGN KEY (`meta_id`) REFERENCES `meta_type` (`meta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `indicator_result`
--
ALTER TABLE `indicator_result`
  ADD CONSTRAINT `fk_indicator_result_to_line` FOREIGN KEY (`line_id`) REFERENCES `strategic_line` (`line_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `marital_statuses`
--
ALTER TABLE `marital_statuses`
  ADD CONSTRAINT `marital_statuses_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ods`
--
ALTER TABLE `ods`
  ADD CONSTRAINT `fk_ods_to_meta` FOREIGN KEY (`meta_id`) REFERENCES `meta_type` (`meta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `people_focus`
--
ALTER TABLE `people_focus`
  ADD CONSTRAINT `people_focus_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `people_focus_ibfk_2` FOREIGN KEY (`focus_id`) REFERENCES `focus_types` (`focus_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `population`
--
ALTER TABLE `population`
  ADD CONSTRAINT `fk_population_to_people` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `fk_program_to_sector` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`sector_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `public_sector_employee`
--
ALTER TABLE `public_sector_employee`
  ADD CONSTRAINT `fk_public_employee_to_people` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `strategic_line`
--
ALTER TABLE `strategic_line`
  ADD CONSTRAINT `fk_strategic_line_to_plan` FOREIGN KEY (`plan_id`) REFERENCES `plan_desarrollo` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `fk_training_to_educational_levels` FOREIGN KEY (`educational_levels_id`) REFERENCES `educational_levels` (`educational_levels_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
