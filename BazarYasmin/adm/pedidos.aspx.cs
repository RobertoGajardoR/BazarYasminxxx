using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BazarYasmin.adm
{
    public partial class pedidos : System.Web.UI.Page
    {
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



            //int index = GridView1.EditIndex;
            //GridViewRow row = GridView1.Rows[index];

            //Label estado = (Label)row.FindControl("Labelestado2");
            //DropDownList estadodrop2 = (DropDownList)row.FindControl("DropDownList2");
            //estadodrop2.SelectedValue = estado.Text;

        }
    }
}