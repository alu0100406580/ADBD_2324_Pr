
-- Data for table viveros.VIVERO
INSERT INTO viveros.VIVERO (idVIVERO, nombre, zonavivero) VALUES (1, 'v_tenerife', 1);
INSERT INTO viveros.VIVERO (idVIVERO, nombre, zonavivero) VALUES (2, 'v_hierro', 2);
INSERT INTO viveros.VIVERO (idVIVERO, nombre, zonavivero) VALUES (3, 'v_gomera', 3);
INSERT INTO viveros.VIVERO (idVIVERO, nombre, zonavivero) VALUES (4, 'v_lanzarote', 4);
INSERT INTO viveros.VIVERO (idVIVERO, nombre, zonavivero) VALUES (5, 'v_fuerteventura', 5);

-- Data for table viveros.ZONA
INSERT INTO viveros.ZONA (idZONA, nombre, idvivero, latitud, longitud) VALUES (1, 'z_tenerife', 1, '-16.013021', '21.41231');
INSERT INTO viveros.ZONA (idZONA, nombre, idvivero, latitud, longitud) VALUES (2, 'z_hierro', 2, '-17.013021', '22.41231');
INSERT INTO viveros.ZONA (idZONA, nombre, idvivero, latitud, longitud) VALUES (3, 'z_gomera', 3, '-18.013021', '23.41231');
INSERT INTO viveros.ZONA (idZONA, nombre, idvivero, latitud, longitud) VALUES (4, 'z_lanzarote', 4, '-19.013021', '24.41231');
INSERT INTO viveros.ZONA (idZONA, nombre, idvivero, latitud, longitud) VALUES (5, 'z_fuerteventura', 5, '-20.013021', '25.41231');


-- Data for table viveros.PRODUCTO
INSERT INTO viveros.PRODUCTO (idPRODUCTO, nombre, descripcion, caracteristicas_especiales, cantidad) VALUES (1, 'ficus_tenerife', 'planta verde', 'planta verde fuego', 30);
INSERT INTO viveros.PRODUCTO (idPRODUCTO, nombre, descripcion, caracteristicas_especiales, cantidad) VALUES (2, 'ficus_hierro', 'planta verde', 'planta amarilla', 15);
INSERT INTO viveros.PRODUCTO (idPRODUCTO, nombre, descripcion, caracteristicas_especiales, cantidad) VALUES (3, 'ficus_gomera', 'planta verde', 'planta moteada', 4);
INSERT INTO viveros.PRODUCTO (idPRODUCTO, nombre, descripcion, caracteristicas_especiales, cantidad) VALUES (4, 'ficus_lanzarote', 'planta verde', 'planta azulada', 3);
INSERT INTO viveros.PRODUCTO (idPRODUCTO, nombre, descripcion, caracteristicas_especiales, cantidad) VALUES (5, 'ficus_fuerteventura', 'planta verde', 'planta magenta', 0);

-- Data for table viveros.EMPLEADO
INSERT INTO viveros.EMPLEADO (idEMPLEADO, nombre, Apellido) VALUES (1, 'Jose', 'Ortiga');
INSERT INTO viveros.EMPLEADO (idEMPLEADO, nombre, Apellido) VALUES (2, 'Luis', 'Peralta');
INSERT INTO viveros.EMPLEADO (idEMPLEADO, nombre, Apellido) VALUES (3, 'Manolo', 'Lama');
INSERT INTO viveros.EMPLEADO (idEMPLEADO, nombre, Apellido) VALUES (4, 'Sergio', 'Peinado');
INSERT INTO viveros.EMPLEADO (idEMPLEADO, nombre, Apellido) VALUES (5, 'Lorenzo', 'Artiles');

-- Data for table viveros.CLIENTE
INSERT INTO viveros.CLIENTE (idCLIENTE, nombre, apellido) VALUES (1, 'Anselmo', 'Rodriguez');
INSERT INTO viveros.CLIENTE (idCLIENTE, nombre, apellido) VALUES (2, 'Jose Luis', 'Artiles');
INSERT INTO viveros.CLIENTE (idCLIENTE, nombre, apellido) VALUES (3, 'Manuel', 'Gutierrez');
INSERT INTO viveros.CLIENTE (idCLIENTE, nombre, apellido) VALUES (4, 'Laura', 'Artiles');
INSERT INTO viveros.CLIENTE (idCLIENTE, nombre, apellido) VALUES (5, 'Cristina', 'Garcia');

-- Data for table viveros.PRODUCTOAZONA
INSERT INTO viveros.PRODUCTOAZONA (idPRODUCTOAZONA, idzona) VALUES (1, 1);
INSERT INTO viveros.PRODUCTOAZONA (idPRODUCTOAZONA, idzona) VALUES (2, 2);
INSERT INTO viveros.PRODUCTOAZONA (idPRODUCTOAZONA, idzona) VALUES (3, 3);
INSERT INTO viveros.PRODUCTOAZONA (idPRODUCTOAZONA, idzona) VALUES (4, 4);
INSERT INTO viveros.PRODUCTOAZONA (idPRODUCTOAZONA, idzona) VALUES (5, 5);

-- Data for table viveros.HISTORICOEMPLEADO
INSERT INTO viveros.HISTORICOEMPLEADO (idHISTORICOEMPLEADO, empleadoID, viveroID, fechainicio, fechafin, zonaID) VALUES (1, 1, 1, '2020-01-01', NULL, 1);
INSERT INTO viveros.HISTORICOEMPLEADO (idHISTORICOEMPLEADO, empleadoID, viveroID, fechainicio, fechafin, zonaID) VALUES (2, 2, 2, '2020-02-08', NULL, 2);
INSERT INTO viveros.HISTORICOEMPLEADO (idHISTORICOEMPLEADO, empleadoID, viveroID, fechainicio, fechafin, zonaID) VALUES (3, 3, 4, '2020-04-11', NULL, 4);
INSERT INTO viveros.HISTORICOEMPLEADO (idHISTORICOEMPLEADO, empleadoID, viveroID, fechainicio, fechafin, zonaID) VALUES (4, 4, 3, '2020-10-09', NULL, 3);
INSERT INTO viveros.HISTORICOEMPLEADO (idHISTORICOEMPLEADO, empleadoID, viveroID, fechainicio, fechafin, zonaID) VALUES (5, 5, 5, '2020-06-04', NULL, 5);

-- Data for table viveros.PEDIDO
INSERT INTO viveros.PEDIDO (idPEDIDO, clienteid, empleadoID, fechapedido, descripcion, producto, cantidad) VALUES (1, 1, 1, '2018-12-17', 'ficus fuerteventura', 5, 2);
INSERT INTO viveros.PEDIDO (idPEDIDO, clienteid, empleadoID, fechapedido, descripcion, producto, cantidad) VALUES (2, 1, 1, '2018-12-17', 'ficus tenerife', 1, 3);
INSERT INTO viveros.PEDIDO (idPEDIDO, clienteid, empleadoID, fechapedido, descripcion, producto, cantidad) VALUES (3, 2, 2, '2020-08-08', 'ficus gomera', 3, 2);
INSERT INTO viveros.PEDIDO (idPEDIDO, clienteid, empleadoID, fechapedido, descripcion, producto, cantidad) VALUES (4, 2, 2, '2020-08-08', 'ficus tenerife', 1, 3);
INSERT INTO viveros.PEDIDO (idPEDIDO, clienteid, empleadoID, fechapedido, descripcion, producto, cantidad) VALUES (5, 2, 2, '2020-08-08', 'ficus lanzarote', 4, 1);

-- Data for table viveros.CLIENTETAJINASTEPLUS
INSERT INTO viveros.CLIENTETAJINASTEPLUS (idfidelizacion, clienteid, volumencomprastajinaste, responsableid, bonificacion) VALUES (1, 2, 20, 1, 10);
INSERT INTO viveros.CLIENTETAJINASTEPLUS (idfidelizacion, clienteid, volumencomprastajinaste, responsableid, bonificacion) VALUES (2, 3, 40, 3, 15);
INSERT INTO viveros.CLIENTETAJINASTEPLUS (idfidelizacion, clienteid, volumencomprastajinaste, responsableid, bonificacion) VALUES (3, 1, 10, 1, 5);

