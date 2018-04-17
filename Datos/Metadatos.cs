using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    class Metadatos
    {
        public static DataTable Ejecutar_Parametros(SqlCommand _comando)
        {
            DataTable _tabla = new DataTable();
            try
            {
                _comando.Connection.Open();
                SqlDataAdapter _adaptador = new SqlDataAdapter();
                _adaptador.SelectCommand = _comando;
                _adaptador.Fill(_tabla);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _comando.Connection.Close();
            }
            return _tabla;
        }
    }
}
