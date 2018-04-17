using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class AccesoDatos
    {
        public static DataTable cambiarcategoria(int Cod_categoria,string nombrep, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);

            SqlCommand _comando = new SqlCommand("BuscarAndCategoriaProductos", _conexion);
            _comando.Parameters.AddWithValue("@categoria", Cod_categoria);
            _comando.Parameters.AddWithValue("@nombrep", nombrep);
            _comando.CommandType = CommandType.StoredProcedure;
            DataTable datos = Metadatos.Ejecutar_Parametros(_comando);
            return datos;
        }
        public static DataTable validaruserpassadmin(string nomuser, string password, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);

            SqlCommand _comando = new SqlCommand("ValidarUserPassAdmin", _conexion);
            _comando.Parameters.AddWithValue("@usu_nick", nomuser);
            _comando.Parameters.AddWithValue("@usu_pass", password);
            _comando.CommandType = CommandType.StoredProcedure;
            DataTable datos = Metadatos.Ejecutar_Parametros(_comando);
            return datos;
        }
        public static DataTable AgregarProducto(string descproducto, int codcategoria,int precio,int cantidad, string imagen, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);

            SqlCommand _comando = new SqlCommand("AgregarProducto", _conexion);
            _comando.Parameters.AddWithValue("@descproducto", descproducto);
            _comando.Parameters.AddWithValue("@codcategoria", codcategoria);
            _comando.Parameters.AddWithValue("@precio", precio);
            _comando.Parameters.AddWithValue("@cantidad", cantidad);
            _comando.Parameters.AddWithValue("@imagen", imagen);
            _comando.CommandType = CommandType.StoredProcedure;
            DataTable datos = Metadatos.Ejecutar_Parametros(_comando);
            return datos;
        }
        public static DataTable CambiarEstadoProducto (int id, int estado, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);

            SqlCommand _comando = new SqlCommand("CambiarEstadoProducto", _conexion);
            _comando.Parameters.AddWithValue("@id", id);
            _comando.Parameters.AddWithValue("@est", estado);
           
            _comando.CommandType = CommandType.StoredProcedure;
            DataTable datos = Metadatos.Ejecutar_Parametros(_comando);
            return datos;
        }
        public static DataTable CambiarEstadoPedido(int id, int estado, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);

            SqlCommand _comando = new SqlCommand("CambiarEstadoPedido", _conexion);
            _comando.Parameters.AddWithValue("@id", id);
            _comando.Parameters.AddWithValue("@est", estado);

            _comando.CommandType = CommandType.StoredProcedure;
            DataTable datos = Metadatos.Ejecutar_Parametros(_comando);
            return datos;
        }
        public static DataTable AgregarDetallePedido(int codpedido, int codproducto, int cantproducto, decimal precio, decimal subtotal, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);

            SqlCommand _comando = new SqlCommand("AgregarDetallePedido", _conexion);
            _comando.Parameters.AddWithValue("@codpedido", codpedido);
            _comando.Parameters.AddWithValue("@codproducto", codproducto);
            _comando.Parameters.AddWithValue("@cantproducto", cantproducto);
            _comando.Parameters.AddWithValue("@precio", precio);
            _comando.Parameters.AddWithValue("@subtotal", subtotal);
            _comando.CommandType = CommandType.StoredProcedure;
            DataTable datos = Metadatos.Ejecutar_Parametros(_comando);
            return datos;
        }
        public static DataTable AgregarNuevoPedido(DateTime fechpedido, decimal subtotal, decimal iva, decimal totalpedido, string codcliente,int entrega, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);

            SqlCommand _comando = new SqlCommand("AgregarNuevoPedido", _conexion);
            _comando.Parameters.AddWithValue("@fechpedido", fechpedido);
            _comando.Parameters.AddWithValue("@subtotal", subtotal);
            _comando.Parameters.AddWithValue("@iva", iva);
            _comando.Parameters.AddWithValue("@totalpedido", totalpedido);
            _comando.Parameters.AddWithValue("@codcliente", codcliente);
            _comando.Parameters.AddWithValue("@entrega", entrega);
            _comando.CommandType = CommandType.StoredProcedure;
            DataTable datos = Metadatos.Ejecutar_Parametros(_comando);
            return datos;
        }
        
        public static DataTable RecuperarInfoUser(string username, string CadenaConexion)
        {
            string _cadenaconexion = CadenaConexion;
            SqlConnection _conexion = new SqlConnection(_cadenaconexion);

            SqlCommand _comando = new SqlCommand("RecuperarInfoUser", _conexion);
            _comando.Parameters.AddWithValue("@username", username);
            _comando.CommandType = CommandType.StoredProcedure;

            DataTable datos = Metadatos.Ejecutar_Parametros(_comando);
            return datos;
        }
    }
}
