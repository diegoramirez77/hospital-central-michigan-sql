
-- =============================================
-- SCRIPT DML
-- HOSPITAL CENTRAL DE MICHIGAN
-- PASO 1: TABLAS PRINCIPALES
-- =============================================

-- 1. INSERTAR EPS
INSERT INTO EPS (NIT, Nombre, Telefono, Direccion, Email)
VALUES ('900100001', 'SALUD TOTAL', '6015551001',
        'Calle 10 # 20-30', 'contacto@saludtotal.com');

INSERT INTO EPS (NIT, Nombre, Telefono, Direccion, Email)
VALUES ('900100002', 'NUEVA EPS', '6015551002',
        'Carrera 15 # 40-20', 'contacto@nuevaeps.com');

INSERT INTO EPS (NIT, Nombre, Telefono, Direccion, Email)
VALUES ('900100003', 'SALUD VIDA', '6015551003',
        'Avenida 5 # 12-40', 'contacto@saludvida.com');


-- 2. INSERTAR MEDICOS
INSERT INTO MEDICO (Cedula, Nombre, Apellidos, Tarjeta_Profesional, Email)
VALUES ('1000000001', 'Carlos', 'Ramirez', 'TP-MED-001',
        'carlos.ramirez@hospital.com');

INSERT INTO MEDICO (Cedula, Nombre, Apellidos, Tarjeta_Profesional, Email)
VALUES ('1000000002', 'Laura', 'Martinez', 'TP-MED-002',
        'laura.martinez@hospital.com');

INSERT INTO MEDICO (Cedula, Nombre, Apellidos, Tarjeta_Profesional, Email)
VALUES ('1000000003', 'Andres', 'Gomez', 'TP-MED-003',
        'andres.gomez@hospital.com');

INSERT INTO MEDICO (Cedula, Nombre, Apellidos, Tarjeta_Profesional, Email)
VALUES ('1000000004', 'Maria', 'Lopez', 'TP-MED-004',
        'maria.lopez@hospital.com');

INSERT INTO MEDICO (Cedula, Nombre, Apellidos, Tarjeta_Profesional, Email)
VALUES ('1000000005', 'Jorge', 'Castro', 'TP-MED-005',
        'jorge.castro@hospital.com');


-- 3. INSERTAR ESPECIALIDADES
INSERT INTO ESPECIALIDAD
(Codigo, Nombre, Descripcion, Nivel_Complejidad, Duracion_Promedio_Cita)
VALUES ('ESP001', 'Cardiologia', 'Atencion de enfermedades del corazon',
        'Alta', 40);

INSERT INTO ESPECIALIDAD
(Codigo, Nombre, Descripcion, Nivel_Complejidad, Duracion_Promedio_Cita)
VALUES ('ESP002', 'Pediatria', 'Atencion medica infantil',
        'Media', 30);

INSERT INTO ESPECIALIDAD
(Codigo, Nombre, Descripcion, Nivel_Complejidad, Duracion_Promedio_Cita)
VALUES ('ESP003', 'Dermatologia', 'Atencion de enfermedades de la piel',
        'Media', 30);

INSERT INTO ESPECIALIDAD
(Codigo, Nombre, Descripcion, Nivel_Complejidad, Duracion_Promedio_Cita)
VALUES ('ESP004', 'Medicina General', 'Atencion medica general',
        'Baja', 20);

INSERT INTO ESPECIALIDAD
(Codigo, Nombre, Descripcion, Nivel_Complejidad, Duracion_Promedio_Cita)
VALUES ('ESP005', 'Neurologia', 'Atencion de enfermedades del sistema nervioso',
        'Alta', 45);

COMMIT;


-- VERIFICAR LOS REGISTROS INSERTADOS
SELECT * FROM EPS;
SELECT * FROM MEDICO;
SELECT * FROM ESPECIALIDAD;
