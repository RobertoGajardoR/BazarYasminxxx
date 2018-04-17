using Negocio;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BazarYasmin.Account
{
    public partial class LoginAdm : System.Web.UI.Page
    {
        String cadenaconexion = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if(PrepararConsulta.validaruserpassadmin(nomusuario.Text.ToString(),password.Text.ToString(), cadenaconexion))
            {
                Session["useradmin"] = nomusuario.Text.ToString();
                Response.Write("<script>alert('Bienvenido "+ Session["useradmin"] + "');window.location.href = '../adm/inicio.aspx';</script>");
               /// Response.Redirect("~/adm/inicio.aspx");
            }
            else
            {
                alertNoCoincide.Visible = true;
            }
        }

       
    }
}