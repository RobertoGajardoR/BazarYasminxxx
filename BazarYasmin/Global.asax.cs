using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace BazarYasmin
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciar la aplicación
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            // Add Routes.
            RegisterCustomRoutes(RouteTable.Routes);
        }
        void RegisterCustomRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("default", "", "~/Default.aspx");
            routes.MapPageRoute("default1", "home", "~/Default.aspx");
            routes.MapPageRoute("default2", "index", "~/Default.aspx");
            routes.MapPageRoute("default3", "inicio", "~/Default.aspx");

            routes.MapPageRoute("adm", "administrador", "~/Account/LoginAdm.aspx");
            routes.MapPageRoute("adm1","adm-by", "~/Account/LoginAdm.aspx");
            routes.MapPageRoute("adm2", "administrar", "~/Account/LoginAdm.aspx");
            routes.MapPageRoute("adm3", "admin", "~/Account/LoginAdm.aspx");
            //routes.MapPageRoute(
            //        "Inicio",// Route name
            //        "{id}",// URL with parameters
            //        "~/default.aspx",// url
            //        true,
            //        new RouteValueDictionary { { "id", "home" } } // Parameter defaults

            //    );
            //routes.MapPageRoute("AdmBazarYasmin", "adm", "~/adm/inicio.aspx");



            //routes.MapPageRoute(
            //    "ProductByNameRoute",
            //    "Product/{productName}",
            //    "~/ProductDetails.aspx"
            //);
        }
    }
}