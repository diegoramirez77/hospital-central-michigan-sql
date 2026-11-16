
-- =============================================
-- VERIFICACION GENERAL DEL SCRIPT DML
-- =============================================

SELECT 'EPS' AS TABLA, COUNT(*) AS TOTAL_REGISTROS FROM EPS
UNION ALL
SELECT 'PACIENTE', COUNT(*) FROM PACIENTE
UNION ALL
SELECT 'HISTORIA_CLINICA', COUNT(*) FROM HISTORIA_CLINICA
UNION ALL
SELECT 'MEDICO', COUNT(*) FROM MEDICO
UNION ALL
SELECT 'ESPECIALIDAD', COUNT(*) FROM ESPECIALIDAD
UNION ALL
SELECT 'CERTIFICACION', COUNT(*) FROM CERTIFICACION
UNION ALL
SELECT 'CONSULTORIO', COUNT(*) FROM CONSULTORIO
UNION ALL
SELECT 'TURNO', COUNT(*) FROM TURNO
UNION ALL
SELECT 'CITA', COUNT(*) FROM CITA
ORDER BY 1;


-- CONSULTA 1: PACIENTES Y SU RESPECTIVA EPS

SELECT
    P.Cedula,
    P.Nombre,
    P.Apellidos,
    E.Nombre AS Nombre_EPS
FROM PACIENTE P
INNER JOIN EPS E
    ON P.NIT_EPS = E.NIT
ORDER BY P.Apellidos;


-- CONSULTA 2: CONSULTORIOS Y SUS ESPECIALIDADES

SELECT
    C.ID_Consultorio,
    C.Numero,
    C.Piso,
    C.Capacidad,
    E.Nombre AS Especialidad
FROM CONSULTORIO C
INNER JOIN ESPECIALIDAD E
    ON C.Codigo_Especialidad = E.Codigo
ORDER BY C.Numero;



-- CONSULTA 3: CITAS, PACIENTES Y MEDICOS

SELECT
    CI.ID_Cita,
    P.Nombre || ' ' || P.Apellidos AS Paciente,
    M.Nombre || ' ' || M.Apellidos AS Medico,
    CI.Fecha_Hora,
    CI.Estado,
    CI.Motivo_Consulta
FROM CITA CI
INNER JOIN PACIENTE P
    ON CI.Cedula_Paciente = P.Cedula
INNER JOIN MEDICO M
    ON CI.Cedula_Medico = M.Cedula
ORDER BY CI.Fecha_Hora;


-- CONSULTA 4: TURNOS, MEDICOS Y CONSULTORIOS

SELECT
    T.ID_Turno,
    M.Nombre || ' ' || M.Apellidos AS Medico,
    C.ID_Consultorio,
    C.Numero,
    T.Dia_Semana,
    T.Hora_Inicio,
    T.Hora_Fin,
    T.Cupos_Disponibles
FROM TURNO T
INNER JOIN MEDICO M
    ON T.Cedula_Medico = M.Cedula
INNER JOIN CONSULTORIO C
    ON T.ID_Consultorio = C.ID_Consultorio
ORDER BY T.ID_Turno;


-- CONSULTA 12
-- Citas de un médico específico con observaciones registradas

SELECT
    M.Cedula,
    M.Nombre || ' ' || M.Apellidos AS Medico,
    P.Nombre || ' ' || P.Apellidos AS Paciente,
    CI.ID_Cita,
    CI.Fecha_Hora,
    CI.Motivo_Consulta,
    CI.Observaciones
FROM CITA CI
INNER JOIN MEDICO M
    ON CI.Cedula_Medico = M.Cedula
INNER JOIN PACIENTE P
    ON CI.Cedula_Paciente = P.Cedula
WHERE M.Cedula = '1000000001'
AND CI.Observaciones IS NOT NULL
ORDER BY CI.Fecha_Hora;



-- CONSULTA 5: PACIENTES AFILIADOS A SALUD TOTAL

SELECT
    P.Cedula,
    P.Nombre,
    P.Apellidos,
    P.Fecha_nacimiento,
    P.Telefono,
    E.Nombre AS Nombre_EPS
FROM PACIENTE P
INNER JOIN EPS E
    ON P.NIT_EPS = E.NIT
WHERE UPPER(E.Nombre) = 'SALUD TOTAL'
ORDER BY P.Apellidos;


-- CONSULTA 6: CITAS CANCELADAS O NO ASISTIDAS

SELECT
    ID_Cita,
    Cedula_Paciente,
    Cedula_Medico,
    Fecha_Hora,
    Estado,
    Motivo_Consulta
FROM CITA
WHERE UPPER(Estado) IN (
    'CANCELADA',
    'CANCELADO',
    'NO ASISTIO',
    'NO ASISTIÓ'
)
ORDER BY Fecha_Hora;


-- CONSULTA 7: ESPECIALIDADES MEDICAS ESPECIFICAS

SELECT
    Codigo,
    Nombre,
    Descripcion,
    Nivel_Complejidad,
    Duracion_Promedio_Cita
FROM ESPECIALIDAD
WHERE UPPER(Nombre) IN (
    'CARDIOLOGIA',
    'PEDIATRIA',
    'DERMATOLOGIA'
)
ORDER BY Nombre;


-- CONSULTA 8: PACIENTES CUYO NOMBRE COMIENZA CON A

SELECT
    Cedula,
    Nombre,
    Apellidos,
    Fecha_nacimiento,
    Telefono
FROM PACIENTE
WHERE UPPER(Nombre) LIKE 'A%'
ORDER BY Nombre;


-- CONSULTA 9: CITAS MEDICAS EN UN RANGO DE FECHAS

SELECT
    ID_Cita,
    Cedula_Paciente,
    Cedula_Medico,
    Fecha_Hora,
    Estado,
    Motivo_Consulta
FROM CITA
WHERE Fecha_Hora BETWEEN
    TIMESTAMP '2026-11-16 00:00:00'
    AND TIMESTAMP '2026-11-20 23:59:59'
ORDER BY Fecha_Hora;


-- CONSULTA 10: PACIENTES ATENDIDOS AFILIADOS A EPS CON SALUD EN SU NOMBRE

SELECT DISTINCT
    P.Cedula,
    P.Nombre,
    P.Apellidos,
    E.Nombre AS Nombre_EPS
FROM PACIENTE P
INNER JOIN EPS E
    ON P.NIT_EPS = E.NIT
INNER JOIN CITA CI
    ON P.Cedula = CI.Cedula_Paciente
WHERE UPPER(E.Nombre) LIKE '%SALUD%'
AND UPPER(CI.Estado) = 'ATENDIDA'
ORDER BY P.Apellidos;



-- PREPARAR UNA CITA SIN TURNO ASOCIADO

UPDATE CITA
SET ID_Turno = NULL
WHERE ID_Cita = 'CIT003';

COMMIT;



-- CONSULTA 11: CITAS DE ESPECIALIDADES SIN TURNO ASOCIADO

SELECT
    CI.ID_Cita,
    CI.Fecha_Hora,
    CI.Estado,
    C.ID_Consultorio,
    E.Nombre AS Especialidad,
    CI.Motivo_Consulta
FROM CITA CI
INNER JOIN CONSULTORIO C
    ON CI.ID_Consultorio = C.ID_Consultorio
INNER JOIN ESPECIALIDAD E
    ON C.Codigo_Especialidad = E.Codigo
WHERE UPPER(E.Nombre) IN (
    'CARDIOLOGIA',
    'PEDIATRIA',
    'DERMATOLOGIA'
)
AND CI.ID_Turno IS NULL
ORDER BY CI.Fecha_Hora;
