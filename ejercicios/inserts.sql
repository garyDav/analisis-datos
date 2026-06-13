-- Insertar 50 registros en la tabla user
-- 5 choferes, 40 pasajeros, 5 administradores

INSERT INTO user (nombre, apellido, correo, contra, tipo, fecha) VALUES
-- CHOFERES (5)
('Juan', 'Pérez', 'juan.perez@example.com', 'pass123', 'chofer', '2026-06-01 08:00:00'),
('Miguel', 'Rodriguez', 'miguel.rodriguez@example.com', 'pass456', 'chofer', '2026-06-01 08:15:00'),
('Carlos', 'Morales', 'carlos.morales@example.com', 'pass789', 'chofer', '2026-06-01 08:30:00'),
('Luis', 'García', 'luis.garcia@example.com', 'pass012', 'chofer', '2026-06-01 08:45:00'),
('Diego', 'López', 'diego.lopez@example.com', 'pass345', 'chofer', '2026-06-01 09:00:00'),
-- ADMINISTRADORES (5)
('María', 'González', 'maria.gonzalez@example.com', 'admin123', 'administrador', '2026-06-02 10:00:00'),
('Laura', 'Fernández', 'laura.fernandez@example.com', 'admin456', 'administrador', '2026-06-02 10:15:00'),
('Patricia', 'Torres', 'patricia.torres@example.com', 'admin789', 'administrador', '2026-06-02 10:30:00'),
('Sandra', 'Ramírez', 'sandra.ramirez@example.com', 'admin012', 'administrador', '2026-06-02 10:45:00'),
('Rosa', 'Mendez', 'rosa.mendez@example.com', 'admin345', 'administrador', '2026-06-02 11:00:00'),
-- PASAJEROS (40)
('Ana', 'Soto', 'ana.soto@example.com', 'pass111', 'pasajero', '2026-06-03 09:00:00'),
('Jorge', 'Reyes', 'jorge.reyes@example.com', 'pass222', 'pasajero', '2026-06-03 09:15:00'),
('Fernando', 'Castro', 'fernando.castro@example.com', 'pass333', 'pasajero', '2026-06-03 09:30:00'),
('Roberto', 'Vargas', 'roberto.vargas@example.com', 'pass444', 'pasajero', '2026-06-03 09:45:00'),
('Manuel', 'Flores', 'manuel.flores@example.com', 'pass555', 'pasajero', '2026-06-03 10:00:00'),
('Gonzalo', 'Silva', 'gonzalo.silva@example.com', 'pass666', 'pasajero', '2026-06-03 10:15:00'),
('Andrés', 'Ruiz', 'andres.ruiz@example.com', 'pass777', 'pasajero', '2026-06-03 10:30:00'),
('Ricardo', 'Campos', 'ricardo.campos@example.com', 'pass888', 'pasajero', '2026-06-03 10:45:00'),
('Sergio', 'Herrera', 'sergio.herrera@example.com', 'pass999', 'pasajero', '2026-06-03 11:00:00'),
('Raúl', 'Medina', 'raul.medina@example.com', 'pass1010', 'pasajero', '2026-06-03 11:15:00'),
('Cristina', 'Vega', 'cristina.vega@example.com', 'pass1111', 'pasajero', '2026-06-04 08:00:00'),
('Daniela', 'Ortega', 'daniela.ortega@example.com', 'pass1212', 'pasajero', '2026-06-04 08:15:00'),
('Elena', 'Navarro', 'elena.navarro@example.com', 'pass1313', 'pasajero', '2026-06-04 08:30:00'),
('Francisca', 'Peralta', 'francisca.peralta@example.com', 'pass1414', 'pasajero', '2026-06-04 08:45:00'),
('Gabriela', 'Castillo', 'gabriela.castillo@example.com', 'pass1515', 'pasajero', '2026-06-04 09:00:00'),
('Hilda', 'Molina', 'hilda.molina@example.com', 'pass1616', 'pasajero', '2026-06-04 09:15:00'),
('Irene', 'Quintero', 'irene.quintero@example.com', 'pass1717', 'pasajero', '2026-06-04 09:30:00'),
('Juana', 'Salazar', 'juana.salazar@example.com', 'pass1818', 'pasajero', '2026-06-04 09:45:00'),
('Karina', 'Tapia', 'karina.tapia@example.com', 'pass1919', 'pasajero', '2026-06-04 10:00:00'),
('Lorena', 'Urbina', 'lorena.urbina@example.com', 'pass2020', 'pasajero', '2026-06-04 10:15:00'),
('Marcela', 'Valencia', 'marcela.valencia@example.com', 'pass2121', 'pasajero', '2026-06-05 08:00:00'),
('Nilda', 'Zapata', 'nilda.zapata@example.com', 'pass2222', 'pasajero', '2026-06-05 08:15:00'),
('Olga', 'Aguilar', 'olga.aguilar@example.com', 'pass2323', 'pasajero', '2026-06-05 08:30:00'),
('Paulina', 'Benítez', 'paulina.benitez@example.com', 'pass2424', 'pasajero', '2026-06-05 08:45:00'),
('Queta', 'Carrasco', 'queta.carrasco@example.com', 'pass2525', 'pasajero', '2026-06-05 09:00:00'),
('Roxana', 'Díaz', 'roxana.diaz@example.com', 'pass2626', 'pasajero', '2026-06-05 09:15:00'),
('Silvia', 'Espinoza', 'silvia.espinoza@example.com', 'pass2727', 'pasajero', '2026-06-05 09:30:00'),
('Tania', 'Fuentes', 'tania.fuentes@example.com', 'pass2828', 'pasajero', '2026-06-05 09:45:00'),
('Úrsula', 'Gómez', 'ursula.gomez@example.com', 'pass2929', 'pasajero', '2026-06-05 10:00:00'),
('Valentina', 'Hidalgo', 'valentina.hidalgo@example.com', 'pass3030', 'pasajero', '2026-06-05 10:15:00'),
('Ximena', 'Iglesias', 'ximena.iglesias@example.com', 'pass3131', 'pasajero', '2026-06-06 08:00:00'),
('Yolanda', 'Jiménez', 'yolanda.jimenez@example.com', 'pass3232', 'pasajero', '2026-06-06 08:15:00'),
('Zulema', 'Klimt', 'zulema.klimt@example.com', 'pass3333', 'pasajero', '2026-06-06 08:30:00');

-- Insertar 5 registros en la tabla chofer
-- Los id_user corresponden a los 5 primeros usuarios (choferes)
INSERT INTO chofer (id_user, ci, categoria, descripcion, celular, fecha_nac, img, fecha) VALUES
(1, '1234567', 'A', 'Chofer experimentado, 15 años de experiencia', 7012345, '1985-03-15', 'path/img-chofer-1.png', '2026-06-01 08:00:00'),
(2, '2345678', 'A', 'Chofer certificado, excelente servicio al cliente', 7023456, '1988-07-22', 'path/img-chofer-2.png', '2026-06-01 08:15:00'),
(3, '3456789', 'B', 'Chofer responsable, ruta local', 7034567, '1990-11-08', 'path/img-chofer-3.png', '2026-06-01 08:30:00'),
(4, '4567890', 'A', 'Chofer de larga distancia, rutas internacionales', 7045678, '1982-05-30', 'path/img-chofer-4.png', '2026-06-01 08:45:00'),
(5, '5678901', 'B', 'Chofer local, conoce todas las rutas', 7056789, '1992-09-18', 'path/img-chofer-5.png', '2026-06-01 09:00:00');

-- Insertar 5 registros en la tabla bus
INSERT INTO bus (placa, marca, num, color, capacidad, tipo, img, fecha) VALUES
('LP-1001', 'Mercedes-Benz', '001', 'Blanco', 50, 'Turismo', 'path/img-bus-1.png', '2026-06-01 10:00:00'),
('LP-1002', 'Volvo', '002', 'Azul', 45, 'Ejecutivo', 'path/img-bus-2.png', '2026-06-01 10:15:00'),
('LP-1003', 'Scania', '003', 'Rojo', 55, 'Turismo', 'path/img-bus-3.png', '2026-06-01 10:30:00'),
('LP-1004', 'MAN', '004', 'Verde', 40, 'Ejecutivo', 'path/img-bus-4.png', '2026-06-01 10:45:00'),
('LP-1005', 'Iveco', '005', 'Gris', 48, 'Turismo', 'path/img-bus-5.png', '2026-06-01 11:00:00');

-- Insertar 50 registros en la tabla viaje
-- Distribución: 10 viajes por chofer, variando buses
INSERT INTO viaje (id_chofer, id_bus, horario, origen, destino, fecha) VALUES
-- Chofer 1 (Juan Pérez)
(1, 1, '06:00', 'La Paz', 'Cochabamba', '2026-06-05 06:00:00'),
(1, 2, '08:30', 'La Paz', 'Santa Cruz', '2026-06-05 08:30:00'),
(1, 3, '10:15', 'La Paz', 'Oruro', '2026-06-05 10:15:00'),
(1, 4, '13:00', 'La Paz', 'Potosí', '2026-06-05 13:00:00'),
(1, 5, '15:45', 'La Paz', 'Cochabamba', '2026-06-05 15:45:00'),
(1, 1, '18:00', 'La Paz', 'Santa Cruz', '2026-06-06 18:00:00'),
(1, 2, '07:30', 'La Paz', 'Oruro', '2026-06-06 07:30:00'),
(1, 3, '09:45', 'La Paz', 'Potosí', '2026-06-06 09:45:00'),
(1, 4, '12:15', 'La Paz', 'Cochabamba', '2026-06-06 12:15:00'),
(1, 5, '14:30', 'La Paz', 'Santa Cruz', '2026-06-06 14:30:00'),
-- Chofer 2 (Miguel Rodriguez)
(2, 2, '06:30', 'Cochabamba', 'La Paz', '2026-06-05 06:30:00'),
(2, 3, '09:00', 'Cochabamba', 'Santa Cruz', '2026-06-05 09:00:00'),
(2, 4, '11:30', 'Cochabamba', 'Oruro', '2026-06-05 11:30:00'),
(2, 5, '14:00', 'Cochabamba', 'Potosí', '2026-06-05 14:00:00'),
(2, 1, '16:15', 'Cochabamba', 'La Paz', '2026-06-05 16:15:00'),
(2, 2, '08:00', 'Cochabamba', 'Santa Cruz', '2026-06-06 08:00:00'),
(2, 3, '10:30', 'Cochabamba', 'Oruro', '2026-06-06 10:30:00'),
(2, 4, '13:00', 'Cochabamba', 'Potosí', '2026-06-06 13:00:00'),
(2, 5, '15:30', 'Cochabamba', 'La Paz', '2026-06-06 15:30:00'),
(2, 1, '17:45', 'Cochabamba', 'Santa Cruz', '2026-06-06 17:45:00'),
-- Chofer 3 (Carlos Morales)
(3, 3, '07:00', 'Santa Cruz', 'La Paz', '2026-06-05 07:00:00'),
(3, 4, '09:30', 'Santa Cruz', 'Cochabamba', '2026-06-05 09:30:00'),
(3, 5, '12:00', 'Santa Cruz', 'Oruro', '2026-06-05 12:00:00'),
(3, 1, '14:30', 'Santa Cruz', 'Potosí', '2026-06-05 14:30:00'),
(3, 2, '16:45', 'Santa Cruz', 'La Paz', '2026-06-05 16:45:00'),
(3, 3, '08:15', 'Santa Cruz', 'Cochabamba', '2026-06-06 08:15:00'),
(3, 4, '11:00', 'Santa Cruz', 'Oruro', '2026-06-06 11:00:00'),
(3, 5, '13:30', 'Santa Cruz', 'Potosí', '2026-06-06 13:30:00'),
(3, 1, '16:00', 'Santa Cruz', 'La Paz', '2026-06-06 16:00:00'),
(3, 2, '18:30', 'Santa Cruz', 'Cochabamba', '2026-06-06 18:30:00'),
-- Chofer 4 (Luis García)
(4, 4, '07:30', 'Oruro', 'La Paz', '2026-06-05 07:30:00'),
(4, 5, '10:00', 'Oruro', 'Cochabamba', '2026-06-05 10:00:00'),
(4, 1, '12:30', 'Oruro', 'Santa Cruz', '2026-06-05 12:30:00'),
(4, 2, '15:00', 'Oruro', 'Potosí', '2026-06-05 15:00:00'),
(4, 3, '17:15', 'Oruro', 'La Paz', '2026-06-05 17:15:00'),
(4, 4, '08:45', 'Oruro', 'Cochabamba', '2026-06-06 08:45:00'),
(4, 5, '11:15', 'Oruro', 'Santa Cruz', '2026-06-06 11:15:00'),
(4, 1, '14:00', 'Oruro', 'Potosí', '2026-06-06 14:00:00'),
(4, 2, '16:30', 'Oruro', 'La Paz', '2026-06-06 16:30:00'),
(4, 3, '19:00', 'Oruro', 'Cochabamba', '2026-06-06 19:00:00'),
-- Chofer 5 (Diego López)
(5, 5, '08:00', 'Potosí', 'La Paz', '2026-06-05 08:00:00'),
(5, 1, '10:30', 'Potosí', 'Cochabamba', '2026-06-05 10:30:00'),
(5, 2, '13:00', 'Potosí', 'Santa Cruz', '2026-06-05 13:00:00'),
(5, 3, '15:30', 'Potosí', 'Oruro', '2026-06-05 15:30:00'),
(5, 4, '17:45', 'Potosí', 'La Paz', '2026-06-05 17:45:00'),
(5, 5, '09:15', 'Potosí', 'Cochabamba', '2026-06-06 09:15:00'),
(5, 1, '11:45', 'Potosí', 'Santa Cruz', '2026-06-06 11:45:00'),
(5, 2, '14:15', 'Potosí', 'Oruro', '2026-06-06 14:15:00'),
(5, 3, '16:45', 'Potosí', 'La Paz', '2026-06-06 16:45:00'),
(5, 4, '19:30', 'Potosí', 'Cochabamba', '2026-06-06 19:30:00');
