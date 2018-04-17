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
    public partial class pedidos : System.Web.UI.Page
    {
        public string codigoPedido;
        public int indexpedido;
        String cadenaconexion = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
       
            if (Session["useradmin"] == null) { Response.Redirect("~/Account/LoginAdm.aspx"); }
            //for (int i = 0; i < GridView1.Rows.Count; i++)
            //{
                
            //    Label estado = (Label)this.GridView1.Rows[i].Cells[7].FindControl("Labelestado");
                
            //    DropDownList estadodrop1 = (DropDownList)this.GridView1.Rows[i].Cells[7].FindControl("DropDownList1");
            //    DropDownList estadodrop2 = (DropDownList)this.GridView1.Rows[i].Cells[7].FindControl("DropDownList2");
            //    estadodrop1.SelectedValue = estado.Text;
            //    //estadodrop2.SelectedValue = estado.Text;
            //}
            
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            

            indexpedido = e.NewEditIndex;
            
            //GridViewRow row = GridView1.Rows[index];
            codigoPedido = GridView1.DataKeys[indexpedido].Value.ToString();//row.Cells[1].Text.ToString();
            //Label estado = (Label)row.FindControl("Labelestado2");
            //DropDownList estadodrop2 = (DropDownList)row.FindControl("DropDownList2");
            //estadodrop2.SelectedValue = estado.Text;

        }
        

        protected void updatepedido(object sender, SqlDataSourceStatusEventArgs e)
        {
            indexpedido = GridView1.EditIndex;
            Label estado = (Label)GridView1.Rows[indexpedido].FindControl("Labelestado2");
            DropDownList estadodrop2 = (DropDownList)GridView1.Rows[indexpedido].FindControl("DropDownList2");
            //estadodrop2.SelectedValue = estado.Text;
            codigoPedido = GridView1.DataKeys[indexpedido].Value.ToString();//row.Cells[1].Text.ToString();
            if (estadodrop2.SelectedValue == "0")
            {
                string script = "alert('Seleccione estado valido.');";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            else
            {


                if (PrepararConsulta.CambiarEstadoPedido(int.Parse(codigoPedido), int.Parse(estadodrop2.SelectedValue), cadenaconexion))
                {

                    //Response.Write("<script>alert('Producto dadon de baja correctamente');</script>");
                    string script = "alert('Se cambio de estado correctamente.');";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                    GridView1.DataBind();
                }
                else
                {
                    //Response.Write("<script>alert('error al dar de baja');</script>");
                    string script = "alert('error al cambiar estado.');";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                    GridView1.DataBind();
                }
            }
            //GridView1.DataBind();
        }
    }
}