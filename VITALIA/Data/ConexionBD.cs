using Microsoft.Data.SqlClient;

namespace VITALIA.Data
{
    public class ConexionBD
    {
        private readonly string _cadenaConexion;

        public ConexionBD(string cadenaConexion)
        {
            _cadenaConexion = cadenaConexion ?? throw new ArgumentNullException(nameof(cadenaConexion));
        }

        public SqlConnection ObtenerConexion()
        {
            return new SqlConnection(_cadenaConexion);
        }
    }
}
