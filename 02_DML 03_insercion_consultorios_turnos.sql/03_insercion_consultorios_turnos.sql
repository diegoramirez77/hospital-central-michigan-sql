
-- =============================================
-- PASO 3: CONSULTORIOS Y TURNOS
-- =============================================

-- 7. INSERTAR CONSULTORIOS
INSERT INTO CONSULTORIO
(ID_Consultorio, Codigo_Especialidad, Numero, Piso, Capacidad, Equipamiento)
VALUES ('CON001', 'ESP001', 101, 1, 2, 'Electrocardiografo y camilla');

INSERT INTO CONSULTORIO
(ID_Consultorio, Codigo_Especialidad, Numero, Piso, Capacidad, Equipamiento)
VALUES ('CON002', 'ESP002', 102, 1, 3, 'Camilla pediatrica y bascula');

INSERT INTO CONSULTORIO
(ID_Consultorio, Codigo_Especialidad, Numero, Piso, Capacidad, Equipamiento)
VALUES ('CON003', 'ESP003', 201, 2, 2, 'Lampara de examinacion y dermatoscopio');

INSERT INTO CONSULTORIO
(ID_Consultorio, Codigo_Especialidad, Numero, Piso, Capacidad, Equipamiento)
VALUES ('CON004', 'ESP004', 202, 2, 2, 'Camilla y equipo de diagnostico');

INSERT INTO CONSULTORIO
(ID_Consultorio, Codigo_Especialidad, Numero, Piso, Capacidad, Equipamiento)
VALUES ('CON005', 'ESP005', 301, 3, 2, 'Equipo de exploracion neurologica');


-- 8. INSERTAR TURNOS
INSERT INTO TURNO
(ID_Turno, Cedula_Medico, ID_Consultorio, Dia_Semana,
 Hora_Inicio, Hora_Fin, Cupos_Disponibles)
VALUES ('TUR001', '1000000001', 'CON001', 'Lunes',
        TIMESTAMP '2026-11-16 08:00:00',
        TIMESTAMP '2026-11-16 12:00:00', 8);

INSERT INTO TURNO
(ID_Turno, Cedula_Medico, ID_Consultorio, Dia_Semana,
 Hora_Inicio, Hora_Fin, Cupos_Disponibles)
VALUES ('TUR002', '1000000002', 'CON002', 'Martes',
        TIMESTAMP '2026-11-17 08:00:00',
        TIMESTAMP '2026-11-17 12:00:00', 8);

INSERT INTO TURNO
(ID_Turno, Cedula_Medico, ID_Consultorio, Dia_Semana,
 Hora_Inicio, Hora_Fin, Cupos_Disponibles)
VALUES ('TUR003', '1000000003', 'CON003', 'Miercoles',
        TIMESTAMP '2026-11-18 08:00:00',
        TIMESTAMP '2026-11-18 12:00:00', 8);

INSERT INTO TURNO
(ID_Turno, Cedula_Medico, ID_Consultorio, Dia_Semana,
 Hora_Inicio, Hora_Fin, Cupos_Disponibles)
VALUES ('TUR004', '1000000004', 'CON004', 'Jueves',
        TIMESTAMP '2026-11-19 08:00:00',
        TIMESTAMP '2026-11-19 12:00:00', 8);

INSERT INTO TURNO
(ID_Turno, Cedula_Medico, ID_Consultorio, Dia_Semana,
 Hora_Inicio, Hora_Fin, Cupos_Disponibles)
VALUES ('TUR005', '1000000005', 'CON005', 'Viernes',
        TIMESTAMP '2026-11-20 08:00:00',
        TIMESTAMP '2026-11-20 12:00:00', 8);

COMMIT;


-- VERIFICAR LOS REGISTROS
SELECT * FROM CONSULTORIO;
SELECT * FROM TURNO;
