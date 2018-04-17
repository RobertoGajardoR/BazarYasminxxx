using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    class conexionBD
    {
        //private string cadena = @"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-BazarYasmin-20161015020539.mdf;Initial Catalog=aspnet-BazarYasmin-20161015020539;Integrated Security=True";

        private string cadena = @"Server=tcp:bazaryasmin.database.windows.net,1433;Initial Catalog=bazaryasmin;Persist Security Info=False;User ID=RobertoGajardo;Password=BazarYasmin777;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
        private SqlConnection conexion;

        public SqlConnection conectarBD()
        {
            conexion = new SqlConnection(cadena);
            if (conexion.State == ConnectionState.Open)
            {
                conexion.Close();
            }
            else
            {
                conexion.Open();
            }
            return conexion;
        }
    }
}
