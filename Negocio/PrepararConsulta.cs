using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;
using System.Data.SqlClient;

namespace Negocio
{
    public class PrepararConsulta
    {
        public static DataTable CambiarCategoria(int cod_categoria ,string nombrep, string CadenaConexion)
        {
            return AccesoDatos.cambiarcategoria(cod_categoria,nombrep, CadenaConexion);
        }
        public static Boolean validaruserpassadmin(string nomuser, string password, string CadenaConexion)
        {
            try
            {
                DataTable lector = AccesoDatos.validaruserpassadmin(nomuser, password, CadenaConexion); 
                if (lector.Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                //lector.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
       
    }
        public static Boolean AgregarProducto(string descproducto, int codcategoria, int precio, int cantidad, string imagen, string CadenaConexion)
        {
            Boolean result = false;
            try
            {
                AccesoDatos.AgregarProducto(descproducto, codcategoria, precio, cantidad, imagen, CadenaConexion);
                result = true;
            }
            catch (Exception)
            {
                result = false;
                throw;
            }
            return result;

        }
        public static bool CambiarEstadoProducto(int id, int estado, string CadenaConexion)
        {
            Boolean result = false;
            try
            {
                AccesoDatos.CambiarEstadoProducto(id, estado, CadenaConexion);
                result = true;
            }
            catch (Exception)
            {
                result = false;
                throw;
            }
            return result;

        }
        public static bool AgregarDetallePedido(int codpedido, int codproducto, int cantproducto, decimal precio, decimal subtotal, string CadenaConexion)
        {
            Boolean result = false;
            try
            {
                AccesoDatos.AgregarDetallePedido(codpedido, codproducto, cantproducto, precio, subtotal,  CadenaConexion);
                result = true;
            }
            catch (Exception)
            {
                result = false;
                throw;
            }
            return result;

        }
        public static DataTable AgregarNuevoPedido(DateTime fechpedido, decimal subtotal, decimal iva, decimal totalpedido, string codcliente,int entrega, string CadenaConexion)
        {
            DataTable result ;
            try
            {
                 result = AccesoDatos.AgregarNuevoPedido(fechpedido, subtotal, iva, totalpedido, codcliente,entrega, CadenaConexion);
                 
            }
            catch (Exception)
            {
                
                throw;
            }
            return result;

        }
         

        public static DataTable RecuperarInfoUser(string username, string CadenaConexion)
        {
            DataTable result ;
            try
            {
                result = AccesoDatos.RecuperarInfoUser(username,  CadenaConexion);
                
            }
            catch (Exception)
            {
                
                throw;
            }
            return result;

        }
    }

}
