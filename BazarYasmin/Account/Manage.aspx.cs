using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using BazarYasmin.Models;
using System.Collections;
using mercadopago;
using System.Web.Security;

namespace BazarYasmin.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        public string pedidoSeleccionado;
        public string montopedido;
        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        public bool HasPhoneNumber { get; private set; }

        public bool TwoFactorEnabled { get; private set; }

        public bool TwoFactorBrowserRemembered { get; private set; }

        public int LoginsCount { get; set; }

        protected void Page_Load()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

///<<<<<<< HEAD
            SqlDataSource1.SelectCommand =  "SELECT pedidos.codpedido, CONVERT (varchar, pedidos.fechpedido, 103) AS fechpedido, pedidos.subtotal, pedidos.iva, pedidos.totalpedido, AspNetUsers.UserName, pedidos.estado, tabla_par.descripcion, pedidos.entrega, par1.descripcion as entregad FROM pedidos INNER JOIN AspNetUsers ON AspNetUsers.Id = pedidos.codcliente INNER JOIN tabla_par ON tabla_par.cod_tab = 1 AND tabla_par.cod_par = pedidos.estado INNER JOIN tabla_par as par1 ON par1.cod_tab = 2 AND par1.cod_par = pedidos.entrega where AspNetUsers.UserName = '" + User.Identity.Name + "'";
///=======
            //SqlDataSource1.SelectCommand =  "SELECT pedidos.codpedido, CONVERT (varchar, pedidos.fechpedido, 103) AS fechpedido, pedidos.subtotal, pedidos.iva, pedidos.totalpedido, AspNetUsers.UserName, pedidos.estado, tabla_par.descripcion,pedidos.entrega, par1.descripcion as entregad FROM pedidos INNER JOIN AspNetUsers ON AspNetUsers.Id = pedidos.codcliente INNER JOIN tabla_par ON tabla_par.cod_tab = 1 AND tabla_par.cod_par = pedidos.estado INNER JOIN tabla_par as par1 ON par1.cod_tab = 2 AND par1.cod_par = pedidos.entrega where AspNetUsers.UserName = '" + User.Identity.Name +"'";
///>>>>>>> a6e3ab437d8ab08ca40e0985bf47bcce8e280031

            HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()));

            // Habilitar esta opción tras configurar autenticación de dos factores
            //PhoneNumber.Text = manager.GetPhoneNumber(User.Identity.GetUserId()) ?? String.Empty;

            TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());

            LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count;

            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            if (!IsPostBack)
            {
                // Determine las secciones que se van a presentar
                if (HasPassword(manager))
                {
                    ChangePassword.Visible = true;
                }
                else
                {
                    CreatePassword.Visible = true;
                    ChangePassword.Visible = false;
                }

                // Presentar mensaje de operación correcta
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Seccionar la cadena de consulta desde la acción
                    Form.Action = ResolveUrl("~/Account/Manage");

                    SuccessMessage =
                        message == "ChangePwdSuccess" ? "Se cambió la contraseña."
                        : message == "SetPwdSuccess" ? "Se estableció la contraseña."
                        : message == "RemoveLoginSuccess" ? "La cuenta se quitó."
                        : message == "AddPhoneNumberSuccess" ? "Se ha agregado el número de teléfono"
                        : message == "RemovePhoneNumberSuccess" ? "Se ha quitado el número de teléfono"
                        : String.Empty;
                    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }
            }
        }


        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        // Quitar número de teléfono del usuario
        protected void RemovePhone_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var result = manager.SetPhoneNumber(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return;
            }
            var user = manager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("/Account/Manage?m=RemovePhoneNumberSuccess");
            }
        }

        // DisableTwoFactorAuthentication
        protected void TwoFactorDisable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), false);

            Response.Redirect("/Account/Manage");
        }

        //EnableTwoFactorAuthentication 
        protected void TwoFactorEnable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), true);

            Response.Redirect("/Account/Manage");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            MP mp = new MP("4736332457228950", "0LWuHjraDil2tQrQN5uwMFaS1vuZMlWt");

            Hashtable preference = mp.createPreference("{\"items\":[{\"title\":\"sdk-dotnet\",\"quantity\":1,\"currency_id\":\"ARS\",\"unit_price\":10.5}]}");

            Response.Write(preference["response"]);
        }

        public void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            pedidoSeleccionado = GridView1.SelectedDataKey.Value.ToString();
            SqlDataSource2.SelectCommand = "SELECT productos.descproducto, detallepedidos.cantproducto, detallepedidos.precio, detallepedidos.subtotal FROM detallepedidos INNER JOIN productos ON detallepedidos.codproducto = productos.codigoproducto WHERE detallepedidos.codpedido = " + pedidoSeleccionado;
            SqlDataSource3.SelectCommand = "SELECT [totalpedido], [iva], [subtotal] FROM [pedidos] WHERE [codpedido] = " + pedidoSeleccionado;
            GridView2.DataBind();
            GridView3.DataBind();
            montopedido = GridView3.Rows[0].Cells[2].Text;
            verDetalle.Visible = true;
        }
    }
}
