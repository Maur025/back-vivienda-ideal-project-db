-- CREATE DATABASE viviendaIdealDb;

USE viviendaIdealDb;

INSERT INTO cities(name)
VALUES ('La Paz'),
       ('Cochabamba'),
       ('Santa Cruz'),
       ('Sucre');

INSERT INTO branches(name, address, phone, city_id)
VALUES ('Sucursal La Paz', 'direccion en la paz', '12345678', (SELECT id FROM cities WHERE cities.name = 'La Paz')),
       ('Sucursal Cochabamba', 'direccion en cochabamba', '87654321',
        (SELECT id FROM cities WHERE cities.name = 'Cochabamba')),
       ('Sucursal Santa Cruz', 'direccion en santa cruz', '88877766',
        (SELECT id FROM cities WHERE cities.name = 'Santa Cruz')),
       ('Sucursal Sucre', 'direccion en sucre', '11122233',
        (SELECT id FROM cities WHERE cities.name = 'Sucre'));

INSERT INTO client_types(name, code)
VALUES ('Arrendatario', 'ARRENDATARIO'),
       ('Comprador', 'COMPRADOR'),
       ('Propietario', 'PROPIETARIO');

INSERT INTO contract_states(name, code)
VALUES ('Activo', 'ACTIVO'),
       ('Vencido', 'VENCIDO'),
       ('Cancelado', 'CANCELADO');

INSERT INTO payment_methods(name, code)
VALUES ('Deposito', 'DEPOSITO'),
       ('Transferencia bancaria', 'TRANSFERENCIA');

INSERT INTO contract_types(name, code)
VALUES ('Venta', 'VENTA'),
       ('Alquiler', 'ALQUILER');

INSERT INTO property_types(name, code)
VALUES ('Casa', 'CASA'),
       ('Departamento', 'DEPARTAMENTO'),
       ('Tienda', 'TIENDA'),
       ('Terreno', 'TERRENO');

INSERT INTO clients(name, document, email, phone, address)
VALUES ('María Fernanda López', '7896543', 'maria.lopez@example.com', '+591 71234567', 'Av. Busch #123, La Paz'),
       ('Carlos Andrés Rivera', '6543210', 'carlos.rivera@example.com', '+591 76543210',
        'Calle 21 de Calacoto #456, La Paz'),
       ('Ana Gabriela Suárez', '9874561', 'ana.suarez@example.com', '+591 79874561', 'Av. Beni #789, Santa Cruz'),
       ('Luis Eduardo Pérez', '1122334', 'luis.perez@example.com', '+591 70011223', 'Calle Aroma #321, Cochabamba'),
       ('Paola Milena Vargas', '3344556', 'paola.vargas@example.com', '+591 72123456', 'Calle Libertad #101, Tarija'),
       ('Jorge Alejandro Gutiérrez', '5566778', 'jorge.gutierrez@example.com', '+591 74567890',
        'Av. Circunvalación #99, Oruro'),
       ('Valeria del Carmen Soto', '9988776', 'valeria.soto@example.com', '+591 73456789', 'Calle Ayacucho #56, Sucre'),
       ('Ricardo Iván Mendoza', '4455667', 'ricardo.mendoza@example.com', '+591 79001122',
        'Av. San Martín #11, Potosí'),
       ('Laura Patricia Rojas', '2233445', 'laura.rojas@example.com', '+591 70123456', 'Calle Junín #78, Cobija'),
       ('Sebastián Nicolás Romero', '6677889', 'sebastian.romero@example.com', '+591 77654321',
        'Calle Independencia #33, Trinidad');

INSERT INTO properties(name, description, price,
                       available, city_id, branch_id, client_id, property_type_id)
VALUES ('Casa familiar en Calacoto', 'Hermosa casa de 2 plantas con jardín y garaje.', 125000.00, true,
        (SELECT id FROM cities WHERE name = 'La Paz'), (SELECT id FROM branches WHERE name = 'Sucursal La Paz'),
        (SELECT id FROM clients WHERE document = '6543210'),
        (SELECT id FROM property_types WHERE code = 'CASA')),

       ('Departamento céntrico', 'Departamento moderno de 3 habitaciones en el centro de la ciudad.', 95000.00, true,
        (SELECT id FROM cities WHERE name = 'Cochabamba'),
        (SELECT id FROM branches WHERE name = 'Sucursal Cochabamba'),
        (SELECT id FROM clients WHERE document = '7896543'),
        (SELECT id FROM property_types WHERE code = 'DEPARTAMENTO')),

       ('Tienda comercial en El Prado', 'Local amplio ideal para negocios de comida o ropa.', 45000.00, false,
        (SELECT id FROM cities WHERE name = 'La Paz'), (SELECT id FROM branches WHERE name = 'Sucursal La Paz'),
        (SELECT id FROM clients WHERE document = '3344556'),
        (SELECT id FROM property_types WHERE code = 'TIENDA')),

       ('Terreno en zona industrial', 'Terreno de 500 m2 ideal para almacenes.', 78000.00, true,
        (SELECT id FROM cities WHERE name = 'Santa Cruz'), (SELECT id FROM branches WHERE name = 'Sucursal Santa Cruz'),
        (SELECT id FROM clients WHERE document = '1122334'),
        (SELECT id FROM property_types WHERE code = 'TERRENO')),

       ('Casa estilo colonial', 'Casa antigua restaurada con acabados coloniales.', 140000.00, false,
        (SELECT id FROM cities WHERE name = 'Sucre'), (SELECT id FROM branches WHERE name = 'Sucursal Sucre'),
        (SELECT id FROM clients WHERE document = '9874561'),
        (SELECT id FROM property_types WHERE code = 'CASA')),

       ('Departamento con vista', 'Piso alto con vista panorámica y excelente iluminación.', 120000.00, true,
        (SELECT id FROM cities WHERE name = 'Cochabamba'), (SELECT id FROM branches WHERE name = 'Sucursal Cochabamba'),
        (SELECT id FROM clients WHERE document = '5566778'),
        (SELECT id FROM property_types WHERE code = 'DEPARTAMENTO')),

       ('Tienda en galería comercial', 'Local de 30 m2 en galería transitada, incluye estantería.', 30000.00, true,
        (SELECT id FROM cities WHERE name = 'La Paz'),
        (SELECT id FROM branches WHERE name = 'Sucursal La Paz'), (SELECT id FROM clients WHERE document = '9988776'),
        (SELECT id FROM property_types WHERE code = 'TIENDA')),

       ('Terreno agrícola', 'Terreno fértil de 1 hectárea con acceso a agua.', 65000.00, false,
        (SELECT id FROM cities WHERE name = 'Sucre'), (SELECT id FROM branches WHERE name = 'Sucursal Sucre'),
        (SELECT id FROM clients WHERE document = '4455667'),
        (SELECT id FROM property_types WHERE code = 'TERRENO')),

       ('Casa con piscina', 'Amplia casa con piscina y quincho, ideal para familia grande.', 185000.00, true,
        (SELECT id FROM cities WHERE name = 'Santa Cruz'), (SELECT id FROM branches WHERE name = 'Sucursal Santa Cruz'),
        (SELECT id FROM clients WHERE document = '2233445'),
        (SELECT id FROM property_types WHERE code = 'CASA')),

       ('Departamento amoblado', 'Departamento totalmente amoblado listo para habitar.', 99000.00, true,
        (SELECT id FROM cities WHERE name = 'Cochabamba'), (SELECT id FROM branches WHERE name = 'Sucursal Cochabamba'),
        (SELECT id FROM clients WHERE document = '6677889'),
        (SELECT id FROM property_types WHERE code = 'DEPARTAMENTO'));

INSERT INTO agents (name, email, phone, branch_id)
VALUES ('Andrés Quiroga', 'andres.quiroga@viviendaideal.bo', '+591 71001234',
        (SELECT id FROM branches WHERE name = 'Sucursal La Paz')),
       ('Marcela Pinto', 'marcela.pinto@viviendaideal.bo', '+591 76543210',
        (SELECT id FROM branches WHERE name = 'Sucursal Cochabamba')),
       ('Rodrigo Gutiérrez', 'rodrigo.gutierrez@viviendaideal.bo', '+591 72233445',
        (SELECT id FROM branches WHERE name = 'Sucursal Santa Cruz')),
       ('Vanessa Ortiz', 'vanessa.ortiz@viviendaideal.bo', '+591 73456789',
        (SELECT id FROM branches WHERE name = 'Sucursal Sucre')),
       ('Sofía Aguilar', 'sofia.aguilar@viviendaideal.bo', '+591 70987654',
        (SELECT id FROM branches WHERE name = 'Sucursal La Paz'));

INSERT INTO visits(visit_date, property_id, client_id, agent_id, code)
VALUES ('2025-07-01 10:00:00',
        (SELECT id FROM properties WHERE name = 'Casa familiar en Calacoto'),
        (SELECT id FROM clients WHERE document = '6543210'),
        (SELECT id FROM agents WHERE email = 'andres.quiroga@viviendaideal.bo'), '0001'),

       ('2025-07-01 15:30:00',
        (SELECT id FROM properties WHERE name = 'Departamento céntrico'),
        (SELECT id FROM clients WHERE document = '7896543'),
        (SELECT id FROM agents WHERE email = 'marcela.pinto@viviendaideal.bo'), '0002'),

       ('2025-07-02 09:00:00',
        (SELECT id FROM properties WHERE name = 'Terreno en zona industrial'),
        (SELECT id FROM clients WHERE document = '1122334'),
        (SELECT id FROM agents WHERE email = 'rodrigo.gutierrez@viviendaideal.bo'), '0003'),

       ('2025-07-02 11:00:00',
        (SELECT id FROM properties WHERE name = 'Casa con piscina'),
        (SELECT id FROM clients WHERE document = '2233445'),
        (SELECT id FROM agents WHERE email = 'vanessa.ortiz@viviendaideal.bo'), '0004'),

       ('2025-07-03 14:45:00',
        (SELECT id FROM properties WHERE name = 'Departamento amoblado'),
        (SELECT id FROM clients WHERE document = '6677889'),
        (SELECT id FROM agents WHERE email = 'marcela.pinto@viviendaideal.bo'), '0005');

INSERT INTO feedbacks(comment, rating, date, visit_id)
VALUES ('La casa estaba en buenas condiciones, aunque la zona es un poco ruidosa.', 4,
        '2025-07-01',
        (SELECT id FROM visits WHERE code = '0001')),

       ('Muy buena ubicación, el edificio se veía limpio y bien mantenido.', 5,
        '2025-07-01',
        (SELECT id FROM visits WHERE code = '0002')),

       ('Me gustó el diseño interior, pero el precio está elevado.', 3,
        '2025-07-01',
        (SELECT id FROM visits WHERE code = '0002')),

       ('El terreno es amplio pero está algo alejado del centro.', 4,
        '2025-07-02',
        (SELECT id FROM visits WHERE code = '0003')),

       ('Excelente opción, la casa está lista para habitar.', 5,
        '2025-07-02',
        (SELECT id FROM visits WHERE code = '0004')),

       ('Muy bonito pero no está completamente amoblado como se prometía.', 3,
        '2025-07-03',
        (SELECT id FROM visits WHERE code = '0005'));

INSERT INTO client_client_types (client_id, client_type_id)
VALUES
    -- Todos son PROPIETARIOS
    ((SELECT id FROM clients WHERE document = '7896543'),
     (SELECT id FROM client_types WHERE code = 'PROPIETARIO')),

    ((SELECT id FROM clients WHERE document = '6543210'),
     (SELECT id FROM client_types WHERE code = 'PROPIETARIO')),

    ((SELECT id FROM clients WHERE document = '9874561'),
     (SELECT id FROM client_types WHERE code = 'PROPIETARIO')),

    ((SELECT id FROM clients WHERE document = '1122334'),
     (SELECT id FROM client_types WHERE code = 'PROPIETARIO')),

    ((SELECT id FROM clients WHERE document = '3344556'),
     (SELECT id FROM client_types WHERE code = 'PROPIETARIO')),

    ((SELECT id FROM clients WHERE document = '5566778'),
     (SELECT id FROM client_types WHERE code = 'PROPIETARIO')),

    ((SELECT id FROM clients WHERE document = '9988776'),
     (SELECT id FROM client_types WHERE code = 'PROPIETARIO')),

    ((SELECT id FROM clients WHERE document = '4455667'),
     (SELECT id FROM client_types WHERE code = 'PROPIETARIO')),

    ((SELECT id FROM clients WHERE document = '2233445'),
     (SELECT id FROM client_types WHERE code = 'PROPIETARIO')),

    ((SELECT id FROM clients WHERE document = '6677889'),
     (SELECT id FROM client_types WHERE code = 'PROPIETARIO')),

    -- Clientes con tipo adicional: COMPRADOR
    ((SELECT id FROM clients WHERE document = '7896543'),
     (SELECT id FROM client_types WHERE code = 'COMPRADOR')),

    ((SELECT id FROM clients WHERE document = '3344556'),
     (SELECT id FROM client_types WHERE code = 'COMPRADOR')),

    ((SELECT id FROM clients WHERE document = '4455667'),
     (SELECT id FROM client_types WHERE code = 'COMPRADOR')),

    -- Clientes con tipo adicional: ARRENDATARIO
    ((SELECT id FROM clients WHERE document = '6543210'),
     (SELECT id FROM client_types WHERE code = 'ARRENDATARIO')),

    ((SELECT id FROM clients WHERE document = '9988776'),
     (SELECT id FROM client_types WHERE code = 'ARRENDATARIO')),

    ((SELECT id FROM clients WHERE document = '2233445'),
     (SELECT id FROM client_types WHERE code = 'ARRENDATARIO'));

INSERT INTO contracts (start_date, end_date, total, contract_state_id, property_id, client_contrating_id,
                       client_obligor_id, agent_id, contract_type_id, contract_number)
VALUES
-- VENTA: Carlos compra a María en La Paz (Sucursal La Paz)
('2025-06-01', '2025-06-01', 125000.00,
 (SELECT id FROM contract_states WHERE code = 'ACTIVO'),
 (SELECT id FROM properties WHERE name = 'Casa familiar en Calacoto'),
 (SELECT id FROM clients WHERE document = '6543210'), -- comprador
 (SELECT id FROM clients WHERE document = '7896543'), -- propietario
 (SELECT id FROM agents WHERE email = 'andres.quiroga@viviendaideal.bo'),
 (SELECT id FROM contract_types WHERE code = 'VENTA'), 'C-0001'),

-- ALQUILER: Paola alquila una tienda de Jorge en La Paz
('2025-06-10', '2026-06-10', 36000.00,
 (SELECT id FROM contract_states WHERE code = 'ACTIVO'),
 (SELECT id FROM properties WHERE name = 'Tienda comercial en El Prado'),
 (SELECT id FROM clients WHERE document = '3344556'), -- arrendataria
 (SELECT id FROM clients WHERE document = '5566778'), -- propietario
 (SELECT id FROM agents WHERE email = 'andres.quiroga@viviendaideal.bo'),
 (SELECT id FROM contract_types WHERE code = 'ALQUILER'), 'C-0002'),

-- VENTA: Ricardo compra un terreno a Luis en Santa Cruz
('2025-05-15', '2025-05-15', 78000.00,
 (SELECT id FROM contract_states WHERE code = 'ACTIVO'),
 (SELECT id FROM properties WHERE name = 'Terreno en zona industrial'),
 (SELECT id FROM clients WHERE document = '4455667'), -- comprador
 (SELECT id FROM clients WHERE document = '1122334'), -- propietario
 (SELECT id FROM agents WHERE email = 'rodrigo.gutierrez@viviendaideal.bo'),
 (SELECT id FROM contract_types WHERE code = 'VENTA'), 'C-0003'),

-- VENTA: Ana vende casa colonial a Valeria en Sucre (propiedad de Ana)
('2025-03-01', '2025-03-01', 140000.00,
 (SELECT id FROM contract_states WHERE code = 'CANCELADO'),
 (SELECT id FROM properties WHERE name = 'Casa estilo colonial'),
 (SELECT id FROM clients WHERE document = '9988776'), -- compradora
 (SELECT id FROM clients WHERE document = '9874561'), -- propietaria
 (SELECT id FROM agents WHERE email = 'vanessa.ortiz@viviendaideal.bo'),
 (SELECT id FROM contract_types WHERE code = 'VENTA'), 'C-0004'),

-- ALQUILER: Laura alquila tienda a Valeria en La Paz
('2025-01-01', '2025-12-31', 30000.00,
 (SELECT id FROM contract_states WHERE code = 'VENCIDO'),
 (SELECT id FROM properties WHERE name = 'Tienda en galería comercial'),
 (SELECT id FROM clients WHERE document = '2233445'), -- arrendataria
 (SELECT id FROM clients WHERE document = '9988776'), -- propietaria
 (SELECT id FROM agents WHERE email = 'andres.quiroga@viviendaideal.bo'),
 (SELECT id FROM contract_types WHERE code = 'ALQUILER'), 'C-0005'),

-- VENTA: Sebastián compra departamento en Cochabamba
('2025-06-15', '2025-06-15', 120000.00,
 (SELECT id FROM contract_states WHERE code = 'ACTIVO'),
 (SELECT id FROM properties WHERE name = 'Departamento con vista'),
 (SELECT id FROM clients WHERE document = '6677889'), -- comprador
 (SELECT id FROM clients WHERE document = '5566778'), -- propietario
 (SELECT id FROM agents WHERE email = 'marcela.pinto@viviendaideal.bo'),
 (SELECT id FROM contract_types WHERE code = 'VENTA'), 'C-0006'),

-- VENTA: Ricardo vende terreno agrícola a Laura
('2025-04-01', '2025-04-01', 65000.00,
 (SELECT id FROM contract_states WHERE code = 'CANCELADO'),
 (SELECT id FROM properties WHERE name = 'Terreno agrícola'),
 (SELECT id FROM clients WHERE document = '2233445'), -- compradora
 (SELECT id FROM clients WHERE document = '4455667'), -- propietario
 (SELECT id FROM agents WHERE email = 'vanessa.ortiz@viviendaideal.bo'),
 (SELECT id FROM contract_types WHERE code = 'VENTA'), 'C-0007'),

-- ALQUILER: Sebastián alquila departamento amoblado a Jorge
('2025-07-01', '2026-07-01', 99000.00,
 (SELECT id FROM contract_states WHERE code = 'ACTIVO'),
 (SELECT id FROM properties WHERE name = 'Departamento amoblado'),
 (SELECT id FROM clients WHERE document = '6677889'), -- arrendatario
 (SELECT id FROM clients WHERE document = '5566778'), -- propietario
 (SELECT id FROM agents WHERE email = 'marcela.pinto@viviendaideal.bo'),
 (SELECT id FROM contract_types WHERE code = 'ALQUILER'), 'C-0008'),

-- VENTA: Paola compra casa con piscina a Laura
('2025-02-20', '2025-02-20', 185000.00,
 (SELECT id FROM contract_states WHERE code = 'ACTIVO'),
 (SELECT id FROM properties WHERE name = 'Casa con piscina'),
 (SELECT id FROM clients WHERE document = '3344556'), -- compradora
 (SELECT id FROM clients WHERE document = '2233445'), -- propietaria
 (SELECT id FROM agents WHERE email = 'rodrigo.gutierrez@viviendaideal.bo'),
 (SELECT id FROM contract_types WHERE code = 'VENTA'), 'C-0009'),

-- VENTA: Valeria compra departamento céntrico a Carlos (ejemplo ficticio circular)
('2025-06-01', '2025-06-01', 95000.00,
 (SELECT id FROM contract_states WHERE code = 'ACTIVO'),
 (SELECT id FROM properties WHERE name = 'Departamento céntrico'),
 (SELECT id FROM clients WHERE document = '9988776'), -- compradora
 (SELECT id FROM clients WHERE document = '6543210'), -- propietario
 (SELECT id FROM agents WHERE email = 'marcela.pinto@viviendaideal.bo'),
 (SELECT id FROM contract_types WHERE code = 'VENTA'), 'C-0010');

INSERT INTO commissions (amount, percentage, contract_id, agent_id)
VALUES
    -- C-0001 (VENTA, 5%)
    (6250.00, 5,
     (SELECT id FROM contracts WHERE contract_number = 'C-0001'),
     (SELECT id FROM agents WHERE email = 'andres.quiroga@viviendaideal.bo')),

    -- C-0002 (ALQUILER, 2%)
    (720.00, 2,
     (SELECT id FROM contracts WHERE contract_number = 'C-0002'),
     (SELECT id FROM agents WHERE email = 'andres.quiroga@viviendaideal.bo')),

    -- C-0003 (VENTA, 4%)
    (3120.00, 4,
     (SELECT id FROM contracts WHERE contract_number = 'C-0003'),
     (SELECT id FROM agents WHERE email = 'rodrigo.gutierrez@viviendaideal.bo')),

    -- C-0004 (VENTA, cancelado, aún se genera comisión parcial del 3%)
    (4200.00, 3,
     (SELECT id FROM contracts WHERE contract_number = 'C-0004'),
     (SELECT id FROM agents WHERE email = 'vanessa.ortiz@viviendaideal.bo')),

    -- C-0005 (ALQUILER, vencido, comisión 2%)
    (600.00, 2,
     (SELECT id FROM contracts WHERE contract_number = 'C-0005'),
     (SELECT id FROM agents WHERE email = 'andres.quiroga@viviendaideal.bo')),

    -- C-0006 (VENTA, 5%)
    (6000.00, 5,
     (SELECT id FROM contracts WHERE contract_number = 'C-0006'),
     (SELECT id FROM agents WHERE email = 'marcela.pinto@viviendaideal.bo')),

    -- C-0007 (VENTA cancelado, comisión parcial 3%)
    (1950.00, 3,
     (SELECT id FROM contracts WHERE contract_number = 'C-0007'),
     (SELECT id FROM agents WHERE email = 'vanessa.ortiz@viviendaideal.bo')),

    -- C-0008 (ALQUILER activo, comisión 3%)
    (2970.00, 3,
     (SELECT id FROM contracts WHERE contract_number = 'C-0008'),
     (SELECT id FROM agents WHERE email = 'marcela.pinto@viviendaideal.bo')),

    -- C-0009 (VENTA, 4%)
    (7400.00, 4,
     (SELECT id FROM contracts WHERE contract_number = 'C-0009'),
     (SELECT id FROM agents WHERE email = 'rodrigo.gutierrez@viviendaideal.bo')),

    -- C-0010 (VENTA, 4%)
    (3800.00, 4,
     (SELECT id FROM contracts WHERE contract_number = 'C-0010'),
     (SELECT id FROM agents WHERE email = 'marcela.pinto@viviendaideal.bo'));

INSERT INTO payments(reference_number, total, date, fee_number, contract_id)
VALUES
    -- C-0001: Venta, contado
    ('P-0001', 125000.00, '2025-06-01', 1,
     (SELECT id FROM contracts WHERE contract_number = 'C-0001')),

    -- C-0002: Alquiler, 12 meses
    ('P-0002', 36000.00, '2025-06-10', 12,
     (SELECT id FROM contracts WHERE contract_number = 'C-0002')),

    -- C-0003: Venta, 3 cuotas
    ('P-0003', 78000.00, '2025-05-15', 3,
     (SELECT id FROM contracts WHERE contract_number = 'C-0003')),

    -- C-0004: Cancelado
    ('P-0004', 140000.00, '2025-03-01', 0,
     (SELECT id FROM contracts WHERE contract_number = 'C-0004')),

    -- C-0005: Alquiler vencido, 12 meses
    ('P-0005', 30000.00, '2025-01-01', 12,
     (SELECT id FROM contracts WHERE contract_number = 'C-0005')),

    -- C-0006: Venta, contado
    ('P-0006', 120000.00, '2025-06-15', 1,
     (SELECT id FROM contracts WHERE contract_number = 'C-0006')),

    -- C-0007: Cancelado
    ('P-0007', 65000.00, '2025-04-01', 0,
     (SELECT id FROM contracts WHERE contract_number = 'C-0007')),

    -- C-0008: Alquiler, 12 meses
    ('P-0008', 99000.00, '2025-07-01', 12,
     (SELECT id FROM contracts WHERE contract_number = 'C-0008')),

    -- C-0009: Venta, 2 cuotas
    ('P-0009', 185000.00, '2025-02-20', 2,
     (SELECT id FROM contracts WHERE contract_number = 'C-0009')),

    -- C-0010: Venta, contado
    ('P-0010', 95000.00, '2025-06-01', 1,
     (SELECT id FROM contracts WHERE contract_number = 'C-0010'));

INSERT INTO payment_plans(amount, date, payment_id)
VALUES
    -- P-0001: contado
    (125000.00, '2025-06-01',
     (SELECT id FROM payments WHERE reference_number = 'P-0001')),

    -- P-0002: alquiler 12 meses de 3000.00
    (3000.00, '2025-06-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2025-07-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2025-08-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2025-09-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2025-10-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2025-11-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2025-12-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2026-01-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2026-02-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2026-03-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2026-04-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),
    (3000.00, '2026-05-10', (SELECT id FROM payments WHERE reference_number = 'P-0002')),

    -- P-0003: 3 cuotas de 26000.00
    (26000.00, '2025-05-15', (SELECT id FROM payments WHERE reference_number = 'P-0003')),
    (26000.00, '2025-06-15', (SELECT id FROM payments WHERE reference_number = 'P-0003')),
    (26000.00, '2025-07-15', (SELECT id FROM payments WHERE reference_number = 'P-0003')),

    -- P-0005: alquiler vencido, 12 cuotas de 2500.00
    (2500.00, '2025-01-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-02-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-03-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-04-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-05-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-06-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-07-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-08-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-09-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-10-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-11-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),
    (2500.00, '2025-12-01', (SELECT id FROM payments WHERE reference_number = 'P-0005')),

    -- P-0006: contado
    (120000.00, '2025-06-15',
     (SELECT id FROM payments WHERE reference_number = 'P-0006')),

    -- P-0008: alquiler 12 meses de 8250.00
    (8250.00, '2025-07-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2025-08-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2025-09-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2025-10-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2025-11-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2025-12-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2026-01-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2026-02-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2026-03-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2026-04-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2026-05-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),
    (8250.00, '2026-06-01', (SELECT id FROM payments WHERE reference_number = 'P-0008')),

    -- P-0009: 2 cuotas de 92500.00
    (92500.00, '2025-02-20', (SELECT id FROM payments WHERE reference_number = 'P-0009')),
    (92500.00, '2025-03-20', (SELECT id FROM payments WHERE reference_number = 'P-0009')),

    -- P-0010: contado
    (95000.00, '2025-06-01',
     (SELECT id FROM payments WHERE reference_number = 'P-0010'));

INSERT INTO pays (amount, balance, date, payment_method_id, payment_plan_id)
VALUES
    -- Pago completo de contado - P-0001
    (125000.00, 0.00, '2025-06-01',
     (SELECT id FROM payment_methods WHERE code = 'TRANSFERENCIA'),
     (SELECT id
      FROM payment_plans
      WHERE date = '2025-06-01'
        AND payment_id = (SELECT id FROM payments WHERE reference_number = 'P-0001'))),

    -- Primeras 2 cuotas pagadas de P-0002 (alquiler)
    (3000.00, 0.00, '2025-06-10',
     (SELECT id FROM payment_methods WHERE code = 'DEPOSITO'),
     (SELECT id
      FROM payment_plans
      WHERE date = '2025-06-10'
        AND payment_id = (SELECT id FROM payments WHERE reference_number = 'P-0002'))),

    (3000.00, 0.00, '2025-07-10',
     (SELECT id FROM payment_methods WHERE code = 'DEPOSITO'),
     (SELECT id
      FROM payment_plans
      WHERE date = '2025-07-10'
        AND payment_id = (SELECT id FROM payments WHERE reference_number = 'P-0002'))),

    -- Pago parcial en P-0003 (venta 3 cuotas)
    (13000.00, 13000.00, '2025-05-15',
     (SELECT id FROM payment_methods WHERE code = 'TRANSFERENCIA'),
     (SELECT id
      FROM payment_plans
      WHERE date = '2025-05-15'
        AND payment_id = (SELECT id FROM payments WHERE reference_number = 'P-0003'))),

    -- Pago completo contado P-0006
    (120000.00, 0.00, '2025-06-15',
     (SELECT id FROM payment_methods WHERE code = 'TRANSFERENCIA'),
     (SELECT id
      FROM payment_plans
      WHERE date = '2025-06-15'
        AND payment_id = (SELECT id FROM payments WHERE reference_number = 'P-0006'))),

    -- 1 pago parcial en P-0008 (alquiler)
    (8250.00, 0.00, '2025-07-01',
     (SELECT id FROM payment_methods WHERE code = 'DEPOSITO'),
     (SELECT id
      FROM payment_plans
      WHERE date = '2025-07-01'
        AND payment_id = (SELECT id FROM payments WHERE reference_number = 'P-0008'))),

    -- Pago completo contado P-0010
    (95000.00, 0.00, '2025-06-01',
     (SELECT id FROM payment_methods WHERE code = 'TRANSFERENCIA'),
     (SELECT id
      FROM payment_plans
      WHERE date = '2025-06-01'
        AND payment_id = (SELECT id FROM payments WHERE reference_number = 'P-0010')));