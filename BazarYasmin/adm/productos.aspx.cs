using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Configuration;

namespace BazarYasmin.adm
{
    public partial class productos : System.Web.UI.Page
    {
        String cadenaconexion = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["useradmin"] == null) { Response.Redirect("~/Account/LoginAdm.aspx"); }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string descripcion = nombre.Text;
            int codcategoria = int.Parse(categoria.SelectedValue);
            int precioo = int.Parse(precio.Text);
            int cantidadd = int.Parse(cantidad.Text);
            string imagen = "";
            if (FileUpload1.HasFile)
            {
                //si hay una archivo.
                string nombreArchivo = FileUpload1.FileName;
                string ruta = "~/img/productos/" + nombreArchivo;
                FileUpload1.SaveAs(Server.MapPath(ruta));

                imagen = nombreArchivo;
            }

            if(PrepararConsulta.AgregarProducto(descripcion, codcategoria, precioo, cantidadd, imagen, cadenaconexion))
            {
                //Response.Write("<script>alert('Producto " + descripcion + " agregado correctamente');</script>");
                string script = "alert('Producto " + descripcion + " agregado correctamente');";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            else
            {
                //Response.Write("<script>alert('Producto no se agrego correctamente');</script>");
                string script = "alert('Producto no se agrego correctamente');";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            if (PrepararConsulta.CambiarEstadoProducto(id, 1, cadenaconexion))
            {

                //Response.Write("<script>alert('Producto dadon de baja correctamente');</script>");
                string script = "alert('Producto dadon de baja correctamente');";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                GridView1.DataBind();
            }
            else
            {
                //Response.Write("<script>alert('error al dar de baja');</script>");
                string script = "alert('error al dar de baja');";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                GridView1.DataBind();
            }
        }

        
    }
}