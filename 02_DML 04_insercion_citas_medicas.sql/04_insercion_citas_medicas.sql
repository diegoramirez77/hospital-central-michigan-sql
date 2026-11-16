
-- =============================================
-- PASO 4: INSERTAR CITAS MEDICAS
-- =============================================

INSERT INTO CITA
(ID_Cita, Cedula_Paciente, Cedula_Medico, ID_Consultorio,
 ID_Turno, Fecha_Hora, Estado, Motivo_Consulta, Observaciones)
VALUES ('CIT001', '2000000001', '1000000001', 'CON001',
        'TUR001', TIMESTAMP '2026-11-16 08:30:00',
        'ATENDIDA', 'Dolor en el pecho',
        'Se realiza valoracion cardiologica');

INSERT INTO CITA
(ID_Cita, Cedula_Paciente, Cedula_Medico, ID_Consultorio,
 ID_Turno, Fecha_Hora, Estado, Motivo_Consulta, Observaciones)
VALUES ('CIT002', '2000000002', '1000000002', 'CON002',
        'TUR002', TIMESTAMP '2026-11-17 09:00:00',
        'PROGRAMADA', 'Control de crecimiento',
        'Consulta de seguimiento pediatrico');

INSERT INTO CITA
(ID_Cita, Cedula_Paciente, Cedula_Medico, ID_Consultorio,
 ID_Turno, Fecha_Hora, Estado, Motivo_Consulta, Observaciones)
VALUES ('CIT003', '2000000003', '1000000003', 'CON003',
        'TUR003', TIMESTAMP '2026-11-18 10:00:00',
        'CANCELADA', 'Erupcion en la piel',
        'El paciente cancelo la cita');

INSERT INTO CITA
(ID_Cita, Cedula_Paciente, Cedula_Medico, ID_Consultorio,
 ID_Turno, Fecha_Hora, Estado, Motivo_Consulta, Observaciones)
VALUES ('CIT004', '2000000004', '1000000004', 'CON004',
        'TUR004', TIMESTAMP '2026-11-19 08:30:00',
        'NO ASISTIO', 'Dolor de cabeza',
        'El paciente no se presento');

INSERT INTO CITA
(ID_Cita, Cedula_Paciente, Cedula_Medico, ID_Consultorio,
 ID_Turno, Fecha_Hora, Estado, Motivo_Consulta, Observaciones)
VALUES ('CIT005', '2000000005', '1000000005', 'CON005',
        'TUR005', TIMESTAMP '2026-11-20 09:30:00',
        'ATENDIDA', 'Migraña recurrente',
        'Se realiza evaluacion neurologica');

INSERT INTO CITA
(ID_Cita, Cedula_Paciente, Cedula_Medico, ID_Consultorio,
 ID_Turno, Fecha_Hora, Estado, Motivo_Consulta, Observaciones)
VALUES ('CIT006', '2000000001', '1000000004', 'CON004',
        'TUR004', TIMESTAMP '2026-11-19 10:00:00',
        'ATENDIDA', 'Control medico general',
        'Paciente presenta evolucion favorable');

INSERT INTO CITA
(ID_Cita, Cedula_Paciente, Cedula_Medico, ID_Consultorio,
 ID_Turno, Fecha_Hora, Estado, Motivo_Consulta, Observaciones)
VALUES ('CIT007', '2000000002', '1000000001', 'CON001',
        'TUR001', TIMESTAMP '2026-11-16 10:00:00',
        'PROGRAMADA', 'Revision cardiovascular',
        'Pendiente de valoracion');

INSERT INTO CITA
(ID_Cita, Cedula_Paciente, Cedula_Medico, ID_Consultorio,
 ID_Turno, Fecha_Hora, Estado, Motivo_Consulta, Observaciones)
VALUES ('CIT008', '2000000003', '1000000003', 'CON003',
        'TUR003', TIMESTAMP '2026-11-18 11:00:00',
        'ATENDIDA', 'Revision dermatologica',
        'Se realiza control de piel');

INSERT INTO CITA
(ID_Cita, Cedula_Paciente, Cedula_Medico, ID_Consultorio,
 ID_Turno, Fecha_Hora, Estado, Motivo_Consulta, Observaciones)
VALUES ('CIT009', '2000000004', '1000000005', 'CON005',
        'TUR005', TIMESTAMP '2026-11-20 10:30:00',
        'PROGRAMADA', 'Revision neurologica',
        'Cita de seguimiento');

INSERT INTO CITA
(ID_Cita, Cedula_Paciente, Cedula_Medico, ID_Consultorio,
 ID_Turno, Fecha_Hora, Estado, Motivo_Consulta, Observaciones)
VALUES ('CIT010', '2000000005', '1000000002', 'CON002',
        'TUR002', TIMESTAMP '2026-11-17 11:00:00',
        'ATENDIDA', 'Consulta pediatrica general',
        'Se registra evolucion del paciente');

COMMIT;


-- VERIFICAR LAS CITAS INSERTADAS
SELECT * FROM CITA
ORDER BY ID_Cita;
