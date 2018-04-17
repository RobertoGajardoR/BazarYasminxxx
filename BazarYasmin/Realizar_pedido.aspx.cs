using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Configuration;
using System.Data;

namespace BazarYasmin
{
    public partial class Realizar_pedido : System.Web.UI.Page
    {
        String cadenaconexion = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        DataTable dtb;
        DataTable carrito = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string userName = HttpContext.Current.User.Identity.Name;
            if (Page.IsPostBack == false)
            {
                CargarDetalle();
                lblAgregado.Text = "";
                DataList1.DataSource = PrepararConsulta.CambiarCategoria(0, "", cadenaconexion);
                DataList1.DataBind();
            }

            


        }



        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Lista_pedido.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int categoria = int.Parse(DropDownList1.SelectedValue);
            DataList1.DataSource = PrepararConsulta.CambiarCategoria(categoria,"", cadenaconexion);
            DataList1.DataBind();
            DataList1.SelectedIndex = -1;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String nombrep = TextBox1.Text;
            int categoria = int.Parse(DropDownList1.SelectedValue);
            DataList1.DataSource = PrepararConsulta.CambiarCategoria(categoria, nombrep, cadenaconexion);
            DataList1.DataBind();
            DataList1.SelectedIndex = -1;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            DropDownList1.SelectedIndex = 0; 
            DataList1.DataSource = PrepararConsulta.CambiarCategoria(0, "", cadenaconexion);
            DataList1.DataBind();
            DataList1.SelectedIndex = -1;
            alertproducto.Visible = false;

        }
        public void AgregarItem(string cod, string des, double precio)
        {
            double total;
            int cantidad = 1;
            total = precio * cantidad;
            carrito = (DataTable)Session["pedido"];
            DataRow fila = carrito.NewRow();
            fila[0] = cod;
            fila[1] = des;
            fila[2] = precio;
            fila[3] = (int)cantidad;
            fila[4] = total;
            carrito.Rows.Add(fila);
            Session["pedido"] = carrito;
        }
        public void CargarDetalle()
        {
            if(Session["pedido"]== null)
            {
                dtb = new DataTable("Carrito");
                dtb.Columns.Add("codproducto", System.Type.GetType("System.String"));
                dtb.Columns.Add("desproducto", System.Type.GetType("System.String"));
                dtb.Columns.Add("preproducto", System.Type.GetType("System.Double"));
                dtb.Columns.Add("subtotal", System.Type.GetType("System.Double"));
                dtb.Columns.Add("canproducto", System.Type.GetType("System.Int32"));

                Session["pedido"] = dtb;
            }
                
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null, nom = null;
            double precio = 0;
            int validacionlista = 0;
            if (e.CommandName == "Seleccionar")
            {
                


                DataList1.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList1.SelectedItem.FindControl("codproductoLabel")).Text;
                des = ((Label)this.DataList1.SelectedItem.FindControl("descproductoLabel")).Text;
                precio = double.Parse(((Label)this.DataList1.SelectedItem.FindControl("preproductoLabel")).Text);

                if ((DataTable)Session["pedido"] != null)
                {
                    var items = (DataTable)Session["pedido"];
                    foreach (DataRow dr in items.Rows)
                    {
                        if (dr["codproducto"].ToString() == cod.ToString())
                        {
                            validacionlista = 1;

                        }
                    }
                }
                else
                {
                    validacionlista = 2;
                }
                if (validacionlista==1)
                {
                    alertproducto.CssClass = "alert alert-danger";
                    lblAgregado.Text =  nom + " " + des + ", ya se encuentra en lista pedido.";

                }
                else
                {
                 
                    AgregarItem(cod, des, precio);
                    alertproducto.CssClass = "alert alert-success";
                    lblAgregado.Text = nom + " " + des + ", agregado a lista pedido.";
                }
                
                Session["prueba"] = "Sesión usuario prueba";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // ScriptManager.RegisterStartupScript(Realizar_pedido, typeof(string), "mostraralert", "$('.alert').show()", true); 
            alertproducto.Visible = true;
            
        }
    }
}