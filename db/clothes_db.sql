-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2022 a las 18:36:21
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clothes_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Buzos    '),
(194, 'Camisas'),
(4, 'Gorros '),
(195, 'Pantalones'),
(198, 'Remeras'),
(7, 'Zapatillas  ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL,
  `talle` varchar(45) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `id_categoria_fk` varchar(45) NOT NULL,
  `imagen` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `nombre`, `precio`, `talle`, `descripcion`, `id_categoria_fk`, `imagen`) VALUES
(1, 'Buzo Fearless', '$13500', 'XXL', 'Buzo 100% frisa ideal para el invierno', 'Camisas', NULL),
(457, 'Gorro Adidas ', '$5000', 'Unico', 'Gorro abrigado para el invierno!', 'Buzos    ', NULL),
(458, 'Campera Negra', '$55000', 'XXL', 'Campera negra abrigada talle oversize para el frio', 'Buzos    ', NULL),
(460, 'Campera Argentina 2017', '$6000', 'L', 'Campera Argentina usada por Messi en el 2016', 'Buzos', 'img/products/634b67911421f.jpg'),
(462, 'Buzo Adidas Classic', '$15000', 'XXL', 'Buzo ADIDAS Clásico Temporada 2022 Oversized perfecto para el verano', 'Buzos    ', 'img/products/634b6d8258c20.jpg'),
(466, 'Pantalon Cargo', '$10000', 'L', 'Pantalón cargo de algodón ultimo modelo', 'Pantalones', 'img/products/634c9fb883510.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'hola@hola.com', '$2y$10$uTTQGfLB7KX.c8YzZDP7y.N5d7Mzes3EtYT1m9.9GaLuVbOL0ELQe'),
(2, 'admin@admin.com', '$2y$10$HNNbI/ticrsLe1PQDPnY8ud/mNKJscUiAGsMzCa0uQvc8jTaTcaPG');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria_fk` (`id_categoria_fk`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categories` (`nombre_categoria`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
