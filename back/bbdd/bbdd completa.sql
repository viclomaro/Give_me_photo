-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para appfotografia
CREATE DATABASE IF NOT EXISTS `appfotografia` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `appfotografia`;

-- Volcando estructura para tabla appfotografia.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) NOT NULL,
  `duracion` int(11) NOT NULL,
  `nivel` enum('iniciacion','medio','avanzado') NOT NULL,
  `precio` decimal(6,0) unsigned NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla appfotografia.cursos: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
REPLACE INTO `cursos` (`id`, `titulo`, `duracion`, `nivel`, `precio`, `descripcion`, `imagen`) VALUES
	(1, 'Curso tecnicas basicas', 20, 'iniciacion', 70, 'Técnicas Y Herramientas Básicas De Fotografía es una formación que pretende ayudarte a dominar y controlar todo tipo de cámaras digitales y desenvolvernos en cualquier situación de iluminación, bien sea controlada o no, por nosotros.', 'assets/images/cursos/curso_iniciacion_1.jpg'),
	(2, 'Curso tecnicas de iluminacion', 30, 'medio', 80, 'Con este curso online aprenderás los conceptos relacionados a la composición fotográfica, como la regla de los dos tercios, el punto de vista, entre otros. Aprenderás desde lo básico hasta temas más avanzados.', 'assets/images/cursos/curso_medio_1.jpg'),
	(3, 'Curso fotografia macro', 15, 'medio', 50, 'El mundo de lo pequeño, muy pequeño; el detalle. La fotografía tipo «Macro», como la llamamos habitualmente es un reto por lo delicado de la técnica y lo imprevisto del entorno. Gracias a este taller aprenderás no sólo a fotografiar insectos o plantas, la macro va mucho más allá, buscando las texturas, explorando recovecos…', 'assets/images/cursos/curso_medio_2.jpg'),
	(4, 'Curso fotografia viaje y paisaje', 20, 'avanzado', 100, 'Si te gusta la fotografía seguro que más de una vez te has quedado prendado de un precioso paisaje y has querido captarlo con tu cámara. La fotografía de paisajes es una de las temáticas más queridas por los fotógrafos, y existen muchísimas formas de llevarla a cabo. En este curso vamos a repasar los principales puntos para poder realizarla: desde el equipo necesario, hasta los mejores consejos, técnicas y trucos de procesado.', 'assets/images/cursos/curso_avanzado_1.jpg'),
	(5, 'Curso composicion de fotografia', 40, 'avanzado', 80, ' Todas las pautas de composición fotográfica que necesitas para que tus fotografías puedan contar una historia que evoque la emoción del momento, tanto aquellas reglas que son más conocidas como aquellas que no lo son tanto.', 'assets/images/cursos/curso_avanzado_2.jpg'),
	(6, 'Curso fotografia basico', 20, 'iniciacion', 60, 'Con este curso online aprenderás los conceptos relacionados a la composición fotográfica, como la regla de los dos tercios, el punto de vista, entre otros. Aprenderás desde lo básico hasta temas más avanzados.', 'assets/images/cursos/curso_iniciacion_2.jpg'),
	(7, 'Curso fotografia blanco y negro', 15, 'iniciacion', 50, 'En este curso podrás aprender cómo tomar fotografías con tu cámara para sacarle el mejor partido a todas las funciones que ignorás del modo manual. Podrás utilizar los conocimientos que adquieras para fotografiar a nivel profesional o para guardar tus recuerdos.', 'assets/images/cursos/curso_iniciacion_3.jpg'),
	(8, 'Curso fotografia nocturna', 30, 'medio', 70, 'Al realizar este curso aprenderás a utilizar las diferentes funciones de tu cámara como el Modo Dual, aperturas, ISO y Shutter. También aprenderás a mejorar y personalizar tus fotos con los programas de Photoshop y Lightroom, explorarás su diferentes funciones y aprenderás a diferenciar los sutiles pero importantes detalles en las fotos artísticas.', 'assets/images/cursos/curso_medio_3.jpg'),
	(9, 'Curso fotografia artistica', 20, 'avanzado', 80, 'Actualmente la fotografía está considerada como un arte más, esto es, la cámara fotográfica al igual que el pincel y el lienzo se ha convertido en una herramienta imprescindible para que muchos artistas expresen sus emociones. Pero al igual que la mayoría del arte contemporáneo en la fotografía la idea que se vende es incluso más importante que la propia obra. Es decir, que la idea de la obra prevalece sobre sus aspectos formales. Este Master ofrece la formación necesaria para especializarse como fotógrafo artístico profesional.', 'assets/images/cursos/curso_avanzado_6.jpg');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;

-- Volcando estructura para tabla appfotografia.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(60) NOT NULL,
  `telefono` int(9) unsigned NOT NULL DEFAULT 0,
  `fechapedido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario` (`fk_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla appfotografia.pedidos: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
REPLACE INTO `pedidos` (`id`, `direccion`, `telefono`, `fechapedido`, `fk_usuario`) VALUES
	(22, 'madrid', 123456789, '2020-03-28 16:13:28', 19),
	(23, 'madrid', 0, '2020-03-30 10:05:59', 19),
	(38, 'madrid', 123456789, '2020-03-30 15:16:53', 19),
	(39, 'madrid', 123456789, '2020-03-30 19:12:35', 19),
	(40, 'madrid', 123456789, '2020-03-30 20:03:31', 19),
	(41, 'madrid', 123456789, '2020-03-31 12:19:17', 19),
	(42, 'Avda.Cantabria 32', 666123456, '2020-04-02 20:02:30', 21);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

-- Volcando estructura para tabla appfotografia.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` enum('Camaras','Objetivos','Accesorios') NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `resolucion` char(50) DEFAULT NULL,
  `focal` varchar(50) DEFAULT NULL,
  `iso` int(11) DEFAULT NULL,
  `peso` char(50) NOT NULL DEFAULT '0',
  `precio` float unsigned NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `altura` varchar(25) DEFAULT NULL,
  `tecnicanaturaleza` int(1) DEFAULT 0,
  `tecnicanocturna` int(1) DEFAULT 0,
  `tecnicaretrato` int(1) DEFAULT 0,
  `tecnicamacro` int(1) DEFAULT 0,
  `imagen1` varchar(100) NOT NULL,
  `imagen2` varchar(100) NOT NULL,
  `imagen3` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla appfotografia.productos: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
REPLACE INTO `productos` (`id`, `categoria`, `marca`, `modelo`, `resolucion`, `focal`, `iso`, `peso`, `precio`, `stock`, `altura`, `tecnicanaturaleza`, `tecnicanocturna`, `tecnicaretrato`, `tecnicamacro`, `imagen1`, `imagen2`, `imagen3`) VALUES
	(1, 'Camaras', 'Nikon', 'D3500', '24.2MP', '/', 12800, '365 grs', 350, 10, '-', 0, 0, 0, 1, 'assets/images/productos/nikon%20d3500_1.jpg', 'assets/images/productos/nikon%20d3500_2.jpg', 'assets/images/productos/nikon%20d3500_3.jpg'),
	(3, 'Camaras', 'Nikon', 'Coolpix', '16MP', '35-135mm', 6400, '500 grs', 300, 10, '-', 1, 0, 1, 1, 'assets/images/productos/nikon%20coolpix_1.jpg', 'assets/images/productos/nikon%20coolpix_2.jpg', 'assets/images/productos/nikon%20coolpix_3.jpg'),
	(4, 'Camaras', 'Nikon', 'D5600', '24.7MP', '/', 25600, '450 grs', 700, 10, '-', 1, 0, 1, 0, 'assets/images/productos/nikon%20d5600_1.jpg', 'assets/images/productos/nikon%20d5600_2.jpg', 'assets/images/productos/nikon%20d5600_3.jpg'),
	(5, 'Camaras', 'Nikon', 'D750', '24.3MP', '/', 51200, '840 grs', 1200, 10, '-', 1, 1, 1, 1, 'assets/images/productos/nikon%20d750_1.jpg', 'assets/images/productos/nikon%20d750_2.jpg', 'assets/images/productos/nikon%20d750_3.jpg'),
	(6, 'Camaras', 'Canon', 'EOS 2000D', '24.1MP', '/', 6400, '380 grs', 325, 10, '-', 0, 0, 0, 1, 'assets/images/productos/canon%202000d_1.jpg', 'assets/images/productos/canon%202000d_2.jpg', 'assets/images/productos/canon%202000d_3.jpg'),
	(7, 'Camaras', 'Canon', 'EOS 77D', '24.2MP', '/', 25600, '540 grs', 580, 10, '-', 1, 0, 1, 0, 'assets/images/productos/canon%2077d_1.jpg', 'assets/images/productos/canon%2077d_2.jpg', 'assets/images/productos/canon%2077d_3.jpg'),
	(8, 'Camaras', 'Canon', 'EOS 90D', '32.5MP', '/', 521200, '700 grs', 1300, 10, '-', 1, 1, 1, 1, 'assets/images/productos/canon%2090d_1.jpg', 'assets/images/productos/canon%2090d_2.jpg', 'assets/images/productos/canon%2090d_3.jpg'),
	(9, 'Camaras', 'Sony', 'RX10', '20.2MP', '24-200mm', 25600, '760 grs', 599, 10, '-', 1, 0, 1, 1, 'assets/images/productos/sony%20rx10_1.jpg', 'assets/images/productos/sony%20rx10_2.jpg', 'assets/images/productos/sony%20rx10_3.jpg'),
	(10, 'Camaras', 'Sony', 'Alpha 7', '24.3MP', '/', 25600, '415 grs', 799, 10, '-', 1, 1, 1, 0, 'assets/images/productos/sony%20alpha7_1.jpg', 'assets/images/productos/sony%20alpha7_2.jpg', 'assets/images/productos/sony%20alpha7_3.jpg'),
	(11, 'Camaras', 'Sony ', 'Alpha 7s', '12.2MP', '/', 102400, '910 grs', 2000, 10, '-', 1, 1, 1, 1, 'assets/images/productos/sony%20alpha7s_1.jpg', 'assets/images/productos/sony%20alpha7s_2.jpg', 'assets/images/productos/sony%20alpha7s_3.jpg'),
	(12, 'Camaras', 'Olympus', 'M10', '16.1MP', '/', 25600, '340 grs', 580, 10, '-', 1, 0, 1, 0, 'assets/images/productos/olympus%20m10_1.jpg', 'assets/images/productos/olympus%20m10_2.jpg', 'assets/images/productos/olympus%20m10_3.jpg'),
	(13, 'Camaras', 'Panasonic', 'FZ330', '12.1MP', '26-600mm', 6400, '550 grs', 475, 10, '-', 1, 0, 1, 1, 'assets/images/productos/panasonic%20fz330_1.jpg', 'assets/images/productos/panasonic%20fz330_2.jpg', 'assets/images/productos/panasonic%20fz330_3.jpg'),
	(14, 'Objetivos', 'Nikkor', '35', '/', '35mm', 0, '200 grs', 199, 5, '-', 1, 1, 0, 0, 'assets/images/productos/nikkor%2035_1.jpg', 'assets/images/productos/nikkor%2035_2.jpg', 'assets/images/productos/nikkor%2035_3.jpg'),
	(15, 'Objetivos', 'Nikkor', '50', '/', '50mm', 0, '185 grs', 250, 5, '-', 1, 0, 1, 0, 'assets/images/productos/nikkor%2050_1.jpg', 'assets/images/productos/nikkor%2050_2.jpg', 'assets/images/productos/nikkor%2050_3.jpg'),
	(16, 'Objetivos', 'Nikkor', '18-140', '/', '18-140mm', 0, '490 grs', 360, 5, '-', 1, 0, 1, 1, 'assets/images/productos/nikkor%2018-140_1.jpg', 'assets/images/productos/nikkor%2018-140_2.jpg', 'assets/images/productos/nikkor%2018-140_3.jpg'),
	(17, 'Objetivos', 'Canon', '35', '/', '35mm', 0, '210 grs', 250, 5, '-', 1, 1, 0, 0, 'assets/images/productos/canon%2035_1.jpg', 'assets/images/productos/canon%2035_2.jpg', 'assets/images/productos/canon%2035_3.jpg'),
	(18, 'Objetivos', 'Canon', '85', '/', '85mm', 0, '425 grs', 380, 5, '-', 1, 0, 1, 0, 'assets/images/productos/canon%2085_1.jpg', 'assets/images/productos/canon%2085_2.jpg', 'assets/images/productos/canon%2085_3.jpg'),
	(19, 'Objetivos', 'Canon', '18-135', '/', '18-135mm', 0, '454 grs', 400, 5, '-', 1, 0, 1, 1, 'assets/images/productos/canon%2018-135_1.jpg', 'assets/images/productos/canon%2018-135_2.jpg', 'assets/images/productos/canon%2018-135_3.jpg'),
	(20, 'Objetivos', 'Sony', '16-50', '/', '16-50mm', 0, '116 grs', 170, 5, '-', 1, 1, 1, 0, 'assets/images/productos/sony%2016-50_1.jpg', 'assets/images/productos/sony%2016-50_2.jpg', 'assets/images/productos/sony%2016-50_3.jpg'),
	(21, 'Objetivos', 'Sony', '55-210', '/', '55-210 mm', 0, '345 grs', 210, 5, '-', 1, 0, 1, 1, 'assets/images/productos/sony%2055-210_1.jpg', 'assets/images/productos/sony%2055-210_2.jpg', 'assets/images/productos/sony%2055-210_3.jpg'),
	(22, 'Objetivos', 'Olympus', '45', '/', '45mm', 0, '116 grs', 195, 5, '-', 1, 1, 1, 0, 'assets/images/productos/olympus%2045_1.jpg', 'assets/images/productos/olympus%2045_2.jpg', 'assets/images/productos/olympus%2045_3.jpg'),
	(23, 'Accesorios', 'K&F', 'TM2324', '/', '/', 0, '1.36 kgs', 69, 5, '46-156cm', 1, 1, 1, 1, 'assets/images/productos/k_f%20tm2324_1.jpg', 'assets/images/productos/k_f%20tm2324_2.jpg', 'assets/images/productos/k_f%20tm2324_3.jpg'),
	(24, 'Accesorios', 'Newer', 'B234', '/', '/', 0, '1.24 kgs', 26, 5, '56-142cm', 1, 0, 1, 1, 'assets/images/productos/newer%20b234_1.jpg', 'assets/images/productos/newer%20b234_2.jpg', 'assets/images/productos/newer%20b234_3.jpg'),
	(25, 'Accesorios', 'Manfrotto', 'Basic', '/', '/', 0, '0.5 kgs', 17, 5, '42-127cm', 1, 0, 1, 0, 'assets/images/productos/manfrotto%20basic_1.jpg', 'assets/images/productos/manfrotto%20basic_2.jpg', 'assets/images/productos/manfrotto%20basic_3.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla appfotografia.tbi_pedidos_productos
CREATE TABLE IF NOT EXISTS `tbi_pedidos_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pedido` int(11) NOT NULL DEFAULT 0,
  `fk_producto` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_pedido` (`fk_pedido`),
  KEY `fk_cursos` (`fk_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla appfotografia.tbi_pedidos_productos: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tbi_pedidos_productos` DISABLE KEYS */;
REPLACE INTO `tbi_pedidos_productos` (`id`, `fk_pedido`, `fk_producto`) VALUES
	(24, 23, 8),
	(53, 40, 19),
	(54, 41, 1),
	(55, 42, 1),
	(56, 42, 16),
	(57, 42, 23);
/*!40000 ALTER TABLE `tbi_pedidos_productos` ENABLE KEYS */;

-- Volcando estructura para tabla appfotografia.tbi_pedido_cursos
CREATE TABLE IF NOT EXISTS `tbi_pedido_cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_usuario` int(11) NOT NULL,
  `fk_curso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido` (`fk_usuario`),
  KEY `fk_cursos` (`fk_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla appfotografia.tbi_pedido_cursos: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `tbi_pedido_cursos` DISABLE KEYS */;
REPLACE INTO `tbi_pedido_cursos` (`id`, `fecha_compra`, `fk_usuario`, `fk_curso`) VALUES
	(19, '2020-04-01 17:00:22', 19, 1),
	(20, '2020-04-01 17:00:28', 19, 3),
	(21, '2020-04-01 17:00:34', 19, 5),
	(22, '2020-04-02 20:02:46', 21, 1),
	(23, '2020-04-02 20:02:53', 21, 8);
/*!40000 ALTER TABLE `tbi_pedido_cursos` ENABLE KEYS */;

-- Volcando estructura para tabla appfotografia.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `apellidos` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '0',
  `fecharegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla appfotografia.usuarios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
REPLACE INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `fecharegistro`, `password`) VALUES
	(15, 'ana', 'martinez', 'aaa@gmail', '2020-03-25 11:12:18', '$2a$10$hzEGYmee2klvv92HaWx/JeT5neAPRYNo1ScBh1T6prJIbH1xc1iVi'),
	(19, 'victor', 'lopez', 'victor@gmail.com', '2020-03-28 12:44:38', '$2a$10$hrWpdk7WqI3RWIefZPBv3Oet9APiCoRe1/OccsqZbU0UyNjs1.nU.'),
	(21, 'Maria', 'Marin', 'maria@gmail.com', '2020-04-02 20:01:30', '$2a$10$vdhbUja75rpFsz/z2I4oCuj9cwu9nj2DlsS15b5aokxhIOevdg.JO');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
