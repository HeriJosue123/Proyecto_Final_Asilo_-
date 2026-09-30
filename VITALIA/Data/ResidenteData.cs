using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using VITALIA.Models;

namespace VITALIA.Data
{
    public class ResidenteData
    {
        private readonly ConexionBD _conexionBD;

        public ResidenteData(ConexionBD conexionBD)
        {
            _conexionBD = conexionBD;
        }

        public List<Residente> ObtenerTodos()
        {
            var residentes = new List<Residente>();

            using (var conexion = _conexionBD.ObtenerConexion())
            {
                conexion.Open();
                
                string query = @"
SELECT
    IdResidente,
    Nombre,
    Apellido,
    FechaNacimiento,
    Sexo,
    Telefono,
    Direccion,
    FechaIngreso,
    IdHabitacion
FROM Residentes
ORDER BY Apellido, Nombre;";

                using (var comando = new SqlCommand(query, conexion))
                {
                    using (var reader = comando.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var residente = new Residente
                            {
                                IdResidente = reader.GetInt32(reader.GetOrdinal("IdResidente")),
                                Nombre = reader.GetString(reader.GetOrdinal("Nombre")),
                                Apellido = reader.GetString(reader.GetOrdinal("Apellido")),
                                FechaNacimiento = reader.GetDateTime(reader.GetOrdinal("FechaNacimiento")),
                                Sexo = reader.GetString(reader.GetOrdinal("Sexo")),
                                Telefono = reader.IsDBNull(reader.GetOrdinal("Telefono")) ? null : reader.GetString(reader.GetOrdinal("Telefono")),
                                Direccion = reader.IsDBNull(reader.GetOrdinal("Direccion")) ? null : reader.GetString(reader.GetOrdinal("Direccion")),
                                FechaIngreso = reader.GetDateTime(reader.GetOrdinal("FechaIngreso")),
                                IdHabitacion = reader.GetInt32(reader.GetOrdinal("IdHabitacion"))
                            };
                            
                            residentes.Add(residente);
                        }
                    }
                }
            }

            return residentes;
        }
    }
}
