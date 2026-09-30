# SeniorCare

## Descripción
El sistema SeniorCare es una aplicación web enfocada en administrar las operaciones diarias de una residencia para la tercera edad, facilitando el control de los residentes, el personal y las actividades del establecimiento.

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
El sistema utiliza **SQL Server**. En el directorio principal del repositorio existe el script `CreateSeniorCareDB.sql` utilizado para construir la base de datos y toda su estructura.

La base de datos se llama **SeniorCareDB** y consta de las siguientes 11 tablas (con relaciones establecidas mediante claves primarias y foráneas):
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
- Configuración de la cadena de conexión `SeniorCareConnection`.
- Creación de la clase `ConexionBD` para obtener conexiones a `SeniorCareDB`.
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
SeniorCare/
├── Controllers/
├── Data/
├── Models/
├── Views/
├── wwwroot/
├── Program.cs
├── appsettings.json
└── SeniorCare.csproj
```

## Requisitos
Para ejecutar este proyecto de manera local, necesitas:
- SDK de .NET compatible con el proyecto.
- SQL Server.
- Visual Studio o un IDE compatible con ASP.NET Core.
- Git para clonar el repositorio.

## Instalación
Sigue estos pasos para levantar el proyecto localmente:
1. Clonar el repositorio.
2. Abrir el proyecto en tu IDE preferido.
3. Crear y configurar la base de datos ejecutando el script `CreateSeniorCareDB.sql` en tu servidor.
4. Verificar la cadena de conexión en el archivo `appsettings.json`.
5. Restaurar dependencias del proyecto.
6. Compilar.
7. Ejecutar el proyecto.

## Desarrollo académico
Este sistema se desarrolla como proyecto final de la asignatura de **Programación II**. A lo largo de su construcción se aplican (o se aplicarán durante el desarrollo) los siguientes conceptos de la materia:
- Clases y objetos.
- Colecciones.
- LINQ.
- Lambda.
- ADO.NET.
- SQL Server.
- Relaciones entre datos.
- DateTime.

## Integrantes del equipo

- Heriberto Josue
- David Alexander
- Yeyson Elber
- Ludy Amarillis
- Jennifer Susana

## Estado del proyecto
**En desarrollo**

El sistema se encuentra actualmente en construcción. Se irán agregando los diferentes módulos y la interfaz de usuario progresivamente en los siguientes avances.
