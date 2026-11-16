
-- =============================================
-- PASO 2: TABLAS RELACIONADAS
-- =============================================

-- 4. INSERTAR PACIENTES
INSERT INTO PACIENTE
(Cedula, NIT_EPS, Nombre, Apellidos, Fecha_nacimiento, Telefono)
VALUES ('2000000001', '900100001', 'Ana', 'Torres',
        TO_DATE('15/03/1990','DD/MM/YYYY'), '3105551001');

INSERT INTO PACIENTE
(Cedula, NIT_EPS, Nombre, Apellidos, Fecha_nacimiento, Telefono)
VALUES ('2000000002', '900100002', 'Pedro', 'Gonzalez',
        TO_DATE('20/07/1985','DD/MM/YYYY'), '3105551002');

INSERT INTO PACIENTE
(Cedula, NIT_EPS, Nombre, Apellidos, Fecha_nacimiento, Telefono)
VALUES ('2000000003', '900100001', 'Andrea', 'Lopez',
        TO_DATE('10/11/2000','DD/MM/YYYY'), '3105551003');

INSERT INTO PACIENTE
(Cedula, NIT_EPS, Nombre, Apellidos, Fecha_nacimiento, Telefono)
VALUES ('2000000004', '900100003', 'Luis', 'Hernandez',
        TO_DATE('05/01/1978','DD/MM/YYYY'), '3105551004');

INSERT INTO PACIENTE
(Cedula, NIT_EPS, Nombre, Apellidos, Fecha_nacimiento, Telefono)
VALUES ('2000000005', '900100002', 'Camila', 'Rodriguez',
        TO_DATE('25/09/1995','DD/MM/YYYY'), '3105551005');


-- 5. INSERTAR HISTORIAS CLINICAS
INSERT INTO HISTORIA_CLINICA
(ID_Historia, Cedula_Paciente, Fecha_Creacion, Estado,
 Alergias_Conocidas, Ultima_Actualizacion)
VALUES ('HC001', '2000000001', TIMESTAMP '2026-01-10 08:00:00',
        'Activa', 'Ninguna', TIMESTAMP '2026-01-10 08:00:00');

INSERT INTO HISTORIA_CLINICA
(ID_Historia, Cedula_Paciente, Fecha_Creacion, Estado,
 Alergias_Conocidas, Ultima_Actualizacion)
VALUES ('HC002', '2000000002', TIMESTAMP '2026-01-11 09:00:00',
        'Activa', 'Penicilina', TIMESTAMP '2026-01-11 09:00:00');

INSERT INTO HISTORIA_CLINICA
(ID_Historia, Cedula_Paciente, Fecha_Creacion, Estado,
 Alergias_Conocidas, Ultima_Actualizacion)
VALUES ('HC003', '2000000003', TIMESTAMP '2026-01-12 10:00:00',
        'Activa', 'Ninguna', TIMESTAMP '2026-01-12 10:00:00');

INSERT INTO HISTORIA_CLINICA
(ID_Historia, Cedula_Paciente, Fecha_Creacion, Estado,
 Alergias_Conocidas, Ultima_Actualizacion)
VALUES ('HC004', '2000000004', TIMESTAMP '2026-01-13 11:00:00',
        'Activa', 'Polen', TIMESTAMP '2026-01-13 11:00:00');

INSERT INTO HISTORIA_CLINICA
(ID_Historia, Cedula_Paciente, Fecha_Creacion, Estado,
 Alergias_Conocidas, Ultima_Actualizacion)
VALUES ('HC005', '2000000005', TIMESTAMP '2026-01-14 12:00:00',
        'Activa', 'Ninguna', TIMESTAMP '2026-01-14 12:00:00');


-- 6. INSERTAR CERTIFICACIONES
INSERT INTO CERTIFICACION
(ID_Certificacion, Cedula_Medico, Codigo_Especialidad,
 Fecha_Certificacion, Estado)
VALUES ('CERT001', '1000000001', 'ESP001',
        TO_DATE('10/01/2020','DD/MM/YYYY'), 'Vigente');

INSERT INTO CERTIFICACION
(ID_Certificacion, Cedula_Medico, Codigo_Especialidad,
 Fecha_Certificacion, Estado)
VALUES ('CERT002', '1000000002', 'ESP002',
        TO_DATE('15/02/2021','DD/MM/YYYY'), 'Vigente');

INSERT INTO CERTIFICACION
(ID_Certificacion, Cedula_Medico, Codigo_Especialidad,
 Fecha_Certificacion, Estado)
VALUES ('CERT003', '1000000003', 'ESP003',
        TO_DATE('20/03/2022','DD/MM/YYYY'), 'Vigente');

INSERT INTO CERTIFICACION
(ID_Certificacion, Cedula_Medico, Codigo_Especialidad,
 Fecha_Certificacion, Estado)
VALUES ('CERT004', '1000000004', 'ESP004',
        TO_DATE('25/04/2023','DD/MM/YYYY'), 'Vigente');

INSERT INTO CERTIFICACION
(ID_Certificacion, Cedula_Medico, Codigo_Especialidad,
 Fecha_Certificacion, Estado)
VALUES ('CERT005', '1000000005', 'ESP005',
        TO_DATE('30/05/2020','DD/MM/YYYY'), 'Vigente');

COMMIT;


-- VERIFICAR LOS REGISTROS
SELECT * FROM PACIENTE;
SELECT * FROM HISTORIA_CLINICA;
SELECT * FROM CERTIFICACION;
