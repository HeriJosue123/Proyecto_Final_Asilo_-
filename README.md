# VITALIA: Plataforma Integral de Gestión, Cuidado y Bienestar del Adulto Mayor

## Descripción
VITALIA es una plataforma integral para la gestión y organización del cuidado de adultos mayores en residencias, diseñada para facilitar el seguimiento de residentes, personal, actividades, medicamentos, visitas e incidentes, centralizando su información e historial para mejorar la organización y atención diaria.

## Objetivo
El sistema busca resolver los problemas comunes en la gestión manual de los asilos, centralizando la información para mantener registros organizados sobre los residentes, su medicación, familiares responsables, control de habitaciones y seguimiento de incidentes o actividades.

## Tecnologías utilizadas
Actualmente, el proyecto hace uso de:
- C#
- ASP.NET Core MVC
- .NET
- SQL Server
- ADO.NET
- Microsoft.Data.SqlClient
- HTML/CSS
- Bootstrap

*(Nota: No se utiliza Entity Framework para el acceso a datos)*

## Base de datos
El sistema utiliza **SQL Server**. En el directorio principal del repositorio existe el script `CreateVITALIADB.sql` utilizado para construir la base de datos y toda su estructura.

La base de datos se llama **VITALIADB** y consta de las siguientes 11 tablas (con relaciones establecidas mediante claves primarias y foráneas):
- Usuarios
- Habitaciones
- Residentes
- Familiares
- Personal
- Medicamentos
- AdministracionMedicamentos
- Actividades
- ParticipacionActividades
- Incidentes
- Visitas

## Funcionalidades implementadas actualmente
Hasta el momento, se ha completado:
- Configuración inicial del proyecto ASP.NET Core MVC.
- Conexión con SQL Server mediante ADO.NET.
- Configuración de la cadena de conexión `VITALIAConnection`.
- Creación de la clase `ConexionBD` para obtener conexiones a `VITALIADB`.
- Creación del modelo `Residente`.
- Acceso a datos a través de `ResidenteData`.
- Consulta para listar los residentes (ordenados por apellido y nombre) utilizando `SqlConnection`, `SqlCommand` y `SqlDataReader`.
- Controlador `ResidenteController` e inyección de dependencias de `ConexionBD`.
- Acción `Index` en el controlador para obtener y enviar la lista de residentes a la vista.

**Importante:** La vista de listado de residentes todavía se encuentra pendiente y no ha sido implementada visualmente.

## Funcionalidades previstas
El sistema crecerá progresivamente para incluir las siguientes características que actualmente se encuentran pendientes:
- Gestión de residentes.
- Gestión de personal.
- Gestión de habitaciones.
- Gestión de familiares.
- Gestión de medicamentos.
- Gestión de actividades.
- Gestión de incidentes.
- Gestión de visitas.
- Consultas y reportes.
- Búsquedas, filtros y ordenamiento utilizando LINQ.

## Estructura actual del proyecto
```text
VITALIA/
├── Controllers/
├── Data/
├── Models/
├── Views/
├── wwwroot/
├── Program.cs
├── appsettings.json
└── VITALIA.csproj
```

## Requisitos
Para ejecutar este proyecto de manera local, necesitas:
- SDK de .NET compatible con el proyecto.
- SQL Server.


## Integrantes del equipo

- Heriberto Josue
- David Alexander
- Yeyson Elber
- Ludy Amarillis
- Jennifer Susana

## Estado del proyecto
**En desarrollo**

El sistema se encuentra actualmente en construcción. Se irán agregando los diferentes módulos y la interfaz de usuario progresivamente en los siguientes avances.
