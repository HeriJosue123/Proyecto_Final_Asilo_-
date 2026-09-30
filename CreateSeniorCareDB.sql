IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'SeniorCareDB')
BEGIN
    CREATE DATABASE [SeniorCareDB];
END
GO

USE [SeniorCareDB];
GO

-- 1. Usuarios
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Usuarios')
BEGIN
CREATE TABLE Usuarios (
    IdUsuario INT PRIMARY KEY IDENTITY,
    NombreUsuario VARCHAR(50) NOT NULL,
    Contrasena VARCHAR(100) NOT NULL,
    Rol VARCHAR(30) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1
);
END
GO

-- 2. Habitaciones
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Habitaciones')
BEGIN
CREATE TABLE Habitaciones (
    IdHabitacion INT PRIMARY KEY IDENTITY,
    Numero VARCHAR(10) NOT NULL,
    Capacidad INT NOT NULL,
    Estado VARCHAR(30) NOT NULL
);
END
GO

-- 5. Personal
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Personal')
BEGIN
CREATE TABLE Personal (
    IdPersonal INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20),
    Turno VARCHAR(30),
    Estado BIT NOT NULL DEFAULT 1
);
END
GO

-- 8. Actividades
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Actividades')
BEGIN
CREATE TABLE Actividades (
    IdActividad INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(200),
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Tipo VARCHAR(50) NOT NULL
);
END
GO

-- 3. Residentes (depends on Habitaciones)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Residentes')
BEGIN
CREATE TABLE Residentes (
    IdResidente INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Sexo VARCHAR(20) NOT NULL,
    Telefono VARCHAR(20),
    Direccion VARCHAR(150),
    FechaIngreso DATE NOT NULL,
    IdHabitacion INT NOT NULL,
    FOREIGN KEY (IdHabitacion) REFERENCES Habitaciones(IdHabitacion)
);
END
GO

-- 4. Familiares (depends on Residentes)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Familiares')
BEGIN
CREATE TABLE Familiares (
    IdFamiliar INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20),
    Parentesco VARCHAR(50) NOT NULL,
    IdResidente INT NOT NULL,
    FOREIGN KEY (IdResidente) REFERENCES Residentes(IdResidente)
);
END
GO

-- 6. Medicamentos (depends on Residentes)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Medicamentos')
BEGIN
CREATE TABLE Medicamentos (
    IdMedicamento INT PRIMARY KEY IDENTITY,
    IdResidente INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(200),
    Horario TIME NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE,
    FOREIGN KEY (IdResidente) REFERENCES Residentes(IdResidente)
);
END
GO

-- 7. AdministracionMedicamentos (depends on Medicamentos, Personal)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'AdministracionMedicamentos')
BEGIN
CREATE TABLE AdministracionMedicamentos (
    IdAdministracion INT PRIMARY KEY IDENTITY,
    IdMedicamento INT NOT NULL,
    IdPersonal INT NOT NULL,
    FechaHora DATETIME NOT NULL,
    Estado VARCHAR(30) NOT NULL,
    Observacion VARCHAR(200),
    FOREIGN KEY (IdMedicamento) REFERENCES Medicamentos(IdMedicamento),
    FOREIGN KEY (IdPersonal) REFERENCES Personal(IdPersonal)
);
END
GO

-- 9. ParticipacionActividades (depends on Actividades, Residentes)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ParticipacionActividades')
BEGIN
CREATE TABLE ParticipacionActividades (
    IdParticipacion INT PRIMARY KEY IDENTITY,
    IdActividad INT NOT NULL,
    IdResidente INT NOT NULL,
    Estado VARCHAR(30) NOT NULL,
    Observacion VARCHAR(200),
    FOREIGN KEY (IdActividad) REFERENCES Actividades(IdActividad),
    FOREIGN KEY (IdResidente) REFERENCES Residentes(IdResidente)
);
END
GO

-- 10. Incidentes (depends on Residentes, Personal)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Incidentes')
BEGIN
CREATE TABLE Incidentes (
    IdIncidente INT PRIMARY KEY IDENTITY,
    IdResidente INT NOT NULL,
    IdPersonal INT NOT NULL,
    FechaHora DATETIME NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(300) NOT NULL,
    Estado VARCHAR(30) NOT NULL,
    Seguimiento VARCHAR(300),
    FOREIGN KEY (IdResidente) REFERENCES Residentes(IdResidente),
    FOREIGN KEY (IdPersonal) REFERENCES Personal(IdPersonal)
);
END
GO

-- 11. Visitas (depends on Residentes, Familiares)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Visitas')
BEGIN
CREATE TABLE Visitas (
    IdVisita INT PRIMARY KEY IDENTITY,
    IdResidente INT NOT NULL,
    IdFamiliar INT NOT NULL,
    Fecha DATE NOT NULL,
    HoraEntrada TIME,
    HoraSalida TIME,
    Estado VARCHAR(30) NOT NULL,
    FOREIGN KEY (IdResidente) REFERENCES Residentes(IdResidente),
    FOREIGN KEY (IdFamiliar) REFERENCES Familiares(IdFamiliar)
);
END
GO
