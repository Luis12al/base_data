-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2024 a las 20:32:58
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
-- Estructura de tabla para la tabla `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `people_id` int(11) DEFAULT NULL,
  `main_phone` varchar(255) DEFAULT NULL,
  `secondary_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `residence_address` varchar(255) DEFAULT NULL,
  `municipality` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `township_commune` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contractor`
--

CREATE TABLE `contractor` (
  `contractor_id` int(11) NOT NULL,
  `people_id` int(11) DEFAULT NULL,
  `entity` varchar(255) DEFAULT NULL,
  `contract_type` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `main_activity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `differential_focus_id`
--

CREATE TABLE `differential_focus_id` (
  `differential_focus_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `focus_name` enum('reintegrado','desmovilizado','extrema pobreza','poblacion victima del conflicto armado','poblacion LGBTIQ','personas en condicion de discapacidad','mujeres cabeza de familia','adultos mayores','ninos ninas y adolecentes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educational_levels`
--

CREATE TABLE `educational_levels` (
  `educational_levels_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `level_name` enum('universitaria','tecnica o tecnologica','secundaria incompleta','secundaria completa','primaria incompleta','primaria completa','ninguna') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emergency`
--

CREATE TABLE `emergency` (
  `emergency_id` int(11) NOT NULL,
  `people_id` int(11) DEFAULT NULL,
  `blood_type` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `activity_type` varchar(255) DEFAULT NULL,
  `contact_relationship` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_private_sector`
--

CREATE TABLE `employee_private_sector` (
  `private_employment_id` int(11) NOT NULL,
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
  `marital_statuses_id` int(11) NOT NULL,
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
-- Estructura de tabla para la tabla `occupations`
--

CREATE TABLE `occupations` (
  `occupations_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ods`
--

CREATE TABLE `ods` (
  `ods_id` int(11) NOT NULL,
  `meta_id` int(11) NOT NULL,
  `ods_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `people_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `gender` enum('Masculino','Femenino','Otro','Prefiero no decirlo') NOT NULL,
  `occupation_id` int(11) NOT NULL,
  `educational_level_id` int(11) NOT NULL,
  `marital_status_id` int(11) DEFAULT NULL,
  `differential_focus_id` int(11) NOT NULL,
  `age_group` enum('Adultos mayores (60 o mas años)','Adultez media','Adultos Jovenes','Niños') NOT NULL,
  `urban_area` longtext NOT NULL,
  `rural_area` varchar(255) NOT NULL,
  `sisben_id` int(11) NOT NULL
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
  `Population_id` int(11) NOT NULL,
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
  `program_id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL,
  `program_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `public_sector_employee`
--

CREATE TABLE `public_sector_employee` (
  `public_employment_id` int(11) NOT NULL,
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
-- Estructura de tabla para la tabla `sisben`
--

CREATE TABLE `sisben` (
  `sisben_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `description` int(11) NOT NULL
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
  `Training_id` int(11) NOT NULL,
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
-- Indices de la tabla `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `fk_contact_people` (`people_id`);

--
-- Indices de la tabla `contractor`
--
ALTER TABLE `contractor`
  ADD PRIMARY KEY (`contractor_id`),
  ADD KEY `fk_contractor_people` (`people_id`);

--
-- Indices de la tabla `differential_focus_id`
--
ALTER TABLE `differential_focus_id`
  ADD PRIMARY KEY (`differential_focus_id`),
  ADD UNIQUE KEY `people_id` (`people_id`);

--
-- Indices de la tabla `educational_levels`
--
ALTER TABLE `educational_levels`
  ADD PRIMARY KEY (`educational_levels_id`) USING BTREE,
  ADD UNIQUE KEY `un` (`people_id`);

--
-- Indices de la tabla `emergency`
--
ALTER TABLE `emergency`
  ADD PRIMARY KEY (`emergency_id`),
  ADD KEY `fk_emergency_people` (`people_id`);

--
-- Indices de la tabla `employee_private_sector`
--
ALTER TABLE `employee_private_sector`
  ADD PRIMARY KEY (`private_employment_id`),
  ADD KEY `fk_private_sector_people` (`people_id`);

--
-- Indices de la tabla `entrepreneur`
--
ALTER TABLE `entrepreneur`
  ADD PRIMARY KEY (`entrepreneurship_id`),
  ADD KEY `fk_entrepreneur_people` (`people_id`);

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
  ADD PRIMARY KEY (`marital_statuses_id`),
  ADD UNIQUE KEY `people_id` (`people_id`);

--
-- Indices de la tabla `meta_type`
--
ALTER TABLE `meta_type`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indices de la tabla `occupations`
--
ALTER TABLE `occupations`
  ADD PRIMARY KEY (`occupations_id`),
  ADD UNIQUE KEY `people_id` (`people_id`);

--
-- Indices de la tabla `ods`
--
ALTER TABLE `ods`
  ADD PRIMARY KEY (`ods_id`),
  ADD UNIQUE KEY `meta_id` (`meta_id`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`people_id`),
  ADD KEY `fk_people_sisben` (`sisben_id`),
  ADD KEY `fk_people_differential_focus_id` (`differential_focus_id`),
  ADD KEY `fk_people_educational_level_id` (`educational_level_id`),
  ADD KEY `fk_people_marital_status_id` (`marital_status_id`),
  ADD KEY `fk_people_occupation_id` (`occupation_id`);

--
-- Indices de la tabla `plan_desarrollo`
--
ALTER TABLE `plan_desarrollo`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indices de la tabla `population`
--
ALTER TABLE `population`
  ADD PRIMARY KEY (`Population_id`),
  ADD KEY `fk_population_people` (`people_id`);

--
-- Indices de la tabla `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`program_id`),
  ADD UNIQUE KEY `sector_id` (`sector_id`);

--
-- Indices de la tabla `public_sector_employee`
--
ALTER TABLE `public_sector_employee`
  ADD PRIMARY KEY (`public_employment_id`),
  ADD KEY `fk_public_sector_people` (`people_id`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`sector_id`),
  ADD UNIQUE KEY `plan_id` (`plan_id`);

--
-- Indices de la tabla `sisben`
--
ALTER TABLE `sisben`
  ADD PRIMARY KEY (`sisben_id`),
  ADD UNIQUE KEY `people_id` (`people_id`);

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
  ADD PRIMARY KEY (`Training_id`),
  ADD UNIQUE KEY `people_id` (`people_id`,`educational_levels_id`),
  ADD KEY `fk_training_to_educational_levels` (`educational_levels_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `educational_levels`
--
ALTER TABLE `educational_levels`
  MODIFY `educational_levels_id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `marital_statuses`
--
ALTER TABLE `marital_statuses`
  MODIFY `marital_statuses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `meta_type`
--
ALTER TABLE `meta_type`
  MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `occupations`
--
ALTER TABLE `occupations`
  MODIFY `occupations_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ods`
--
ALTER TABLE `ods`
  MODIFY `ods_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `people_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT de la tabla `plan_desarrollo`
--
ALTER TABLE `plan_desarrollo`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `program`
--
ALTER TABLE `program`
  MODIFY `program_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `sector_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sisben`
--
ALTER TABLE `sisben`
  MODIFY `sisben_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `strategic_line`
--
ALTER TABLE `strategic_line`
  MODIFY `line_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

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
-- Filtros para la tabla `ods`
--
ALTER TABLE `ods`
  ADD CONSTRAINT `fk_ods_to_meta` FOREIGN KEY (`meta_id`) REFERENCES `meta_type` (`meta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `fk_people_educational_level_id` FOREIGN KEY (`educational_level_id`) REFERENCES `educational_levels` (`educational_levels_id`),
  ADD CONSTRAINT `fk_people_educational_levels` FOREIGN KEY (`educational_level_id`) REFERENCES `educational_levels` (`educational_levels_id`),
  ADD CONSTRAINT `fk_people_to_differential_focus` FOREIGN KEY (`differential_focus_id`) REFERENCES `differential_focus_id` (`people_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_people_to_marital_status` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_statuses` (`marital_statuses_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_people_to_occupation` FOREIGN KEY (`occupation_id`) REFERENCES `occupations` (`occupations_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_people_to_sisben` FOREIGN KEY (`sisben_id`) REFERENCES `sisben` (`sisben_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_training_to_educational_levels` FOREIGN KEY (`educational_levels_id`) REFERENCES `educational_levels` (`educational_levels_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
