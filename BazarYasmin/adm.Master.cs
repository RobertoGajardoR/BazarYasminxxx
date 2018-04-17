using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BazarYasmin
{
    public partial class adm1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void RemoveSessionAdmin(object sender, EventArgs e)
        {
            Response.Write("<script>alert('!Hasta luego¡ " + Session["useradmin"] + "');window.location.href = '../Default.aspx';</script>");
            Session.Remove("useradmin");
        }

    }
}