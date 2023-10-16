-- Crear la base de datos
CREATE DATABASE DBO_PFM;

-- Usar la base de datos
USE DBO_PFM;

-- Crear la tabla de Usuarios
CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NombreUsuario VARCHAR(255) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    Rol ENUM('Comercial', 'RRHH', 'Administrador') NOT NULL
);

-- Crear la tabla de Clientes
CREATE TABLE Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NombreEmpresa VARCHAR(255) NOT NULL,
    Rubro VARCHAR(255),
    NombreContacto VARCHAR(255),
    Teléfono VARCHAR(15),
    CorreoElectrónico VARCHAR(255),
    Ubicación VARCHAR(255)
);

-- Crear la tabla de Candidatos
CREATE TABLE Candidatos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NombreCandidato VARCHAR(255) NOT NULL,
    FechaNacimiento DATE,
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(255),
    Residencia VARCHAR(255)
);

-- Crear la tabla de Propuestas
CREATE TABLE Propuestas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FechaEnvioPropuesta DATE,
    UsuarioEjecutivoComercialID INT,
    ClienteID INT,
    TipoPropuestaEnviada VARCHAR(255),
    MontoPropuesta DECIMAL(10, 2),
    Descuento DECIMAL(5, 2),
    EstadoPropuesta ENUM('Pendiente', 'En Proceso', 'Ganada', 'Perdida', 'Otro'),
    FechaActualizacionSeguimiento DATETIME,
    ComentariosSeguimiento TEXT,
    FOREIGN KEY (UsuarioEjecutivoComercialID) REFERENCES Usuarios(ID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

-- Crear la tabla de Plazas de Trabajo
CREATE TABLE PlazasTrabajo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NombrePlaza VARCHAR(255) NOT NULL,
    PropuestaID INT,
    UsuarioRecursoHumanosID INT,
    Salario DECIMAL(10, 2),
    CantidadSolicitada INT,
    FechaRecepcionValidacionPerfil DATE,
    FechaModificacionPerfil DATE,
    FechaPublicacionPerfil DATE,
    Estatus ENUM('Cerrado', 'Cancelado', 'Otro'),
    FechaFinalizacion DATE,
    FOREIGN KEY (PropuestaID) REFERENCES Propuestas(ID),
    FOREIGN KEY (UsuarioRecursoHumanosID) REFERENCES Usuarios(ID)
);

-- Crear la tabla de Envío de CVs (Ternas)
CREATE TABLE EnvioCVs (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PlazaTrabajoID INT,
    CandidatoID INT,
    FechaEnvioCV DATE,
    NumeroTerna VARCHAR(10),
    FOREIGN KEY (PlazaTrabajoID) REFERENCES PlazasTrabajo(ID),
    FOREIGN KEY (CandidatoID) REFERENCES Candidatos(ID)
);

-- Crear la tabla de Filtración de Entrevistas
CREATE TABLE FiltracionEntrevistas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PlazaTrabajoID INT,
    CandidatoID INT,
    Estatus ENUM('Candidato contratado', 'Otro'),
    FOREIGN KEY (PlazaTrabajoID) REFERENCES PlazasTrabajo(ID),
    FOREIGN KEY (CandidatoID) REFERENCES Candidatos(ID)
);

-- Crear la tabla de Historial de Asignación de Plazas de Trabajo
CREATE TABLE HistorialAsignacion (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PlazaTrabajoID INT,
    AnalistaRRHHID INT,
    FechaAsignacion DATETIME,
    FechaDesasignacion DATETIME,
    FOREIGN KEY (PlazaTrabajoID) REFERENCES PlazasTrabajo(ID),
    FOREIGN KEY (AnalistaRRHHID) REFERENCES Usuarios(ID)
);

-- Insertar registros en la tabla de Usuarios
INSERT INTO Usuarios (NombreUsuario, Contraseña, Rol) VALUES
    ('usuario1', 'contraseña1', 'Comercial'),
    ('usuario2', 'contraseña2', 'RRHH'),
    ('usuario3', 'contraseña3', 'Administrador');

-- Insertar registros en la tabla de Clientes
INSERT INTO Clientes (NombreEmpresa, Rubro, NombreContacto, Teléfono, CorreoElectrónico, Ubicación) VALUES
    ('Empresa1', 'Rubro1', 'Contacto1', '1234567890', 'contacto1@example.com', 'Ubicación1'),
    ('Empresa2', 'Rubro2', 'Contacto2', '9876543210', 'contacto2@example.com', 'Ubicación2');

-- Insertar registros en la tabla de Candidatos
INSERT INTO Candidatos (NombreCandidato, FechaNacimiento, Telefono, CorreoElectronico, Residencia) VALUES
    ('Candidato1', '1990-01-15', '555-1234567', 'candidato1@example.com', 'Residencia1'),
    ('Candidato2', '1985-05-20', '555-9876543', 'candidato2@example.com', 'Residencia2');

-- Insertar registros en la tabla de Propuestas
INSERT INTO Propuestas (FechaEnvioPropuesta, UsuarioEjecutivoComercialID, ClienteID, TipoPropuestaEnviada, MontoPropuesta, Descuento, EstadoPropuesta, FechaActualizacionSeguimiento, ComentariosSeguimiento) VALUES
    ('2023-08-15', 1, 1, 'Tipo1', 5000.00, 10.00, 'Pendiente', '2023-08-20 09:30:00', 'Comentario 1'),
    ('2023-08-20', 1, 2, 'Tipo2', 7500.00, 15.00, 'En Proceso', '2023-08-25 11:45:00', 'Comentario 2');

-- Insertar registros en la tabla de Plazas de Trabajo
INSERT INTO PlazasTrabajo (NombrePlaza, PropuestaID, UsuarioRecursoHumanosID, Salario, CantidadSolicitada, FechaRecepcionValidacionPerfil, FechaModificacionPerfil, FechaPublicacionPerfil, Estatus, FechaFinalizacion) VALUES
    ('Plaza1', 1, 2, 6000.00, 2, '2023-09-01', '2023-09-05', '2023-09-10', 'Cerrado', '2023-09-20'),
    ('Plaza2', 2, 2, 8000.00, 3, '2023-09-03', '2023-09-07', '2023-09-12', 'En Proceso', NULL);

-- Insertar registros en la tabla de Envío de CVs (Ternas)
INSERT INTO EnvioCVs (PlazaTrabajoID, CandidatoID, FechaEnvioCV, NumeroTerna) VALUES
    (1, 1, '2023-09-02', '1a terna'),
    (1, 2, '2023-09-04', '2a terna'),
    (2, 1, '2023-09-05', '1a terna');

-- Insertar registros en la tabla de Filtración de Entrevistas
INSERT INTO FiltracionEntrevistas (PlazaTrabajoID, CandidatoID, Estatus) VALUES
    (1, 1, 'Candidato contratado'),
    (1, 2, 'Otro'),
    (2, 1, 'Otro');

-- Insertar registros en la tabla de Historial de Asignación de Plazas de Trabajo
INSERT INTO HistorialAsignacion (PlazaTrabajoID, AnalistaRRHHID, FechaAsignacion, FechaDesasignacion) VALUES
    (1, 2, '2023-09-01 10:00:00', '2023-09-15 15:30:00'),
    (2, 2, '2023-09-03 11:30:00', NULL);

SELECT c.NombreEmpresa AS Cliente, p.FechaEnvioPropuesta AS Fecha, p.TipoPropuestaEnviada, u.NombreUsuario AS UsuarioComercial
FROM Propuestas p
INNER JOIN Clientes c ON p.ClienteID = c.ID
INNER JOIN Usuarios u ON p.UsuarioEjecutivoComercialID = u.ID;

SELECT u.NombreUsuario AS UsuarioComercial, p.FechaEnvioPropuesta AS Fecha, c.NombreEmpresa AS Cliente, p.TipoPropuestaEnviada
FROM Propuestas p
INNER JOIN Usuarios u ON p.UsuarioEjecutivoComercialID = u.ID
INNER JOIN Clientes c ON p.ClienteID = c.ID;

SELECT u.NombreUsuario AS UsuarioRRHH, pt.NombrePlaza AS Plaza, pt.Estatus
FROM PlazasTrabajo pt
INNER JOIN Usuarios u ON pt.UsuarioRecursoHumanosID = u.ID
WHERE pt.FechaFinalizacion IS NULL;

SELECT pt.NombrePlaza AS Plaza, c.NombreCandidato AS Candidato
FROM PlazasTrabajo pt
INNER JOIN EnvioCVs ec ON pt.ID = ec.PlazaTrabajoID
INNER JOIN Candidatos c ON ec.CandidatoID = c.ID;

SELECT pt.NombrePlaza AS Plaza, ec.FechaEnvioCV AS FechaEnvio, c.NombreCandidato AS Candidato
FROM EnvioCVs ec
INNER JOIN PlazasTrabajo pt ON ec.PlazaTrabajoID = pt.ID
INNER JOIN Candidatos c ON ec.CandidatoID = c.ID;

SELECT pt.NombrePlaza AS Plaza, u.NombreUsuario AS UsuarioRRHH, ha.FechaAsignacion, ha.FechaDesasignacion
FROM HistorialAsignacion ha
INNER JOIN PlazasTrabajo pt ON ha.PlazaTrabajoID = pt.ID
INNER JOIN Usuarios u ON ha.AnalistaRRHHID = u.ID;

SELECT pt.NombrePlaza AS Plaza, c.NombreCandidato AS Candidato, fe.Estatus
FROM FiltracionEntrevistas fe
INNER JOIN PlazasTrabajo pt ON fe.PlazaTrabajoID = pt.ID
INNER JOIN Candidatos c ON fe.CandidatoID = c.ID;

