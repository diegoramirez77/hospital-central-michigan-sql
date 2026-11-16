CREATE TABLE EPS (
    NIT       VARCHAR2(15),
    Nombre    VARCHAR2(100),
    Telefono  VARCHAR2(15),
    Direccion VARCHAR2(150),
    Email     VARCHAR2(100),
    CONSTRAINT PK_EPS PRIMARY KEY (NIT),
    CONSTRAINT UQ_EPS_NOMBRE UNIQUE (Nombre)
);

CREATE TABLE PACIENTE (
    Cedula           VARCHAR2(10),
    NIT_EPS           VARCHAR2(15),
    Nombre            VARCHAR2(50),
    Apellidos         VARCHAR2(50),
    Fecha_nacimiento  DATE,
    Telefono          VARCHAR2(15),
    CONSTRAINT PK_PACIENTE PRIMARY KEY (Cedula),
    CONSTRAINT FK_PACIENTE_EPS
        FOREIGN KEY (NIT_EPS) REFERENCES EPS (NIT)
);

CREATE TABLE HISTORIA_CLINICA (
    ID_Historia          VARCHAR2(15),
    Cedula_Paciente      VARCHAR2(10),
    Fecha_Creacion       TIMESTAMP,
    Estado               VARCHAR2(20),
    Alergias_Conocidas   VARCHAR2(255),
    Ultima_Actualizacion TIMESTAMP,
    CONSTRAINT PK_HISTORIA_CLINICA PRIMARY KEY (ID_Historia),
    CONSTRAINT UQ_HISTORIA_PACIENTE UNIQUE (Cedula_Paciente),
    CONSTRAINT FK_HISTORIA_PACIENTE
        FOREIGN KEY (Cedula_Paciente) REFERENCES PACIENTE (Cedula)
);

CREATE TABLE MEDICO (
    Cedula              VARCHAR2(10),
    Nombre              VARCHAR2(50),
    Apellidos           VARCHAR2(50),
    Tarjeta_Profesional VARCHAR2(100),
    Email               VARCHAR2(100),
    CONSTRAINT PK_MEDICO PRIMARY KEY (Cedula),
    CONSTRAINT UQ_MEDICO_TARJETA UNIQUE (Tarjeta_Profesional),
    CONSTRAINT UQ_MEDICO_EMAIL UNIQUE (Email)
);

CREATE TABLE ESPECIALIDAD (
    Codigo                 VARCHAR2(10),
    Nombre                 VARCHAR2(50),
    Descripcion            VARCHAR2(255),
    Nivel_Complejidad      VARCHAR2(20),
    Duracion_Promedio_Cita NUMBER(3),
    CONSTRAINT PK_ESPECIALIDAD PRIMARY KEY (Codigo),
    CONSTRAINT UQ_ESPECIALIDAD_NOMBRE UNIQUE (Nombre)
);

CREATE TABLE CERTIFICACION (
    ID_Certificacion    VARCHAR2(15),
    Cedula_Medico       VARCHAR2(10),
    Codigo_Especialidad VARCHAR2(10),
    Fecha_Certificacion DATE,
    Estado              VARCHAR2(20),
    CONSTRAINT PK_CERTIFICACION PRIMARY KEY (ID_Certificacion),
    CONSTRAINT UQ_CERT_MED_ESP
        UNIQUE (Cedula_Medico, Codigo_Especialidad),
    CONSTRAINT FK_CERT_MEDICO
        FOREIGN KEY (Cedula_Medico) REFERENCES MEDICO (Cedula),
    CONSTRAINT FK_CERT_ESPECIALIDAD
        FOREIGN KEY (Codigo_Especialidad) REFERENCES ESPECIALIDAD (Codigo)
);

CREATE TABLE CONSULTORIO (
    ID_Consultorio      VARCHAR2(10),
    Codigo_Especialidad VARCHAR2(10),
    Numero              NUMBER(4),
    Piso                NUMBER(2),
    Capacidad           NUMBER(2),
    Equipamiento        VARCHAR2(255),
    CONSTRAINT PK_CONSULTORIO PRIMARY KEY (ID_Consultorio),
    CONSTRAINT UQ_CONSULTORIO_NUMERO UNIQUE (Numero),
    CONSTRAINT FK_CONSULTORIO_ESPECIALIDAD
        FOREIGN KEY (Codigo_Especialidad) REFERENCES ESPECIALIDAD (Codigo)
);

CREATE TABLE TURNO (
    ID_Turno           VARCHAR2(15),
    Cedula_Medico      VARCHAR2(10),
    ID_Consultorio     VARCHAR2(10),
    Dia_Semana         VARCHAR2(10),
    Hora_Inicio        TIMESTAMP,
    Hora_Fin           TIMESTAMP,
    Cupos_Disponibles  NUMBER(3),
    CONSTRAINT PK_TURNO PRIMARY KEY (ID_Turno),
    CONSTRAINT FK_TURNO_MEDICO
        FOREIGN KEY (Cedula_Medico) REFERENCES MEDICO (Cedula),
    CONSTRAINT FK_TURNO_CONSULTORIO
        FOREIGN KEY (ID_Consultorio) REFERENCES CONSULTORIO (ID_Consultorio)
);

CREATE TABLE CITA (
    ID_Cita          VARCHAR2(15),
    Cedula_Paciente  VARCHAR2(10),
    Cedula_Medico    VARCHAR2(10),
    ID_Consultorio   VARCHAR2(10),
    ID_Turno         VARCHAR2(15),
    Fecha_Hora       TIMESTAMP,
    Estado           VARCHAR2(20),
    Motivo_Consulta  VARCHAR2(255),
    Observaciones    VARCHAR2(500),
    CONSTRAINT PK_CITA PRIMARY KEY (ID_Cita),
    CONSTRAINT FK_CITA_PACIENTE
        FOREIGN KEY (Cedula_Paciente) REFERENCES PACIENTE (Cedula),
    CONSTRAINT FK_CITA_MEDICO
        FOREIGN KEY (Cedula_Medico) REFERENCES MEDICO (Cedula),
    CONSTRAINT FK_CITA_CONSULTORIO
        FOREIGN KEY (ID_Consultorio) REFERENCES CONSULTORIO (ID_Consultorio),
    CONSTRAINT FK_CITA_TURNO
        FOREIGN KEY (ID_Turno) REFERENCES TURNO (ID_Turno)
);