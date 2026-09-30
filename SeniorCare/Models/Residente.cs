using System;

namespace SeniorCare.Models
{
    public class Residente
    {
        public int IdResidente { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Apellido { get; set; } = string.Empty;
        public DateTime FechaNacimiento { get; set; }
        public string Sexo { get; set; } = string.Empty;
        public string? Telefono { get; set; }
        public string? Direccion { get; set; }
        public DateTime FechaIngreso { get; set; }
        public int IdHabitacion { get; set; }
    }
}
