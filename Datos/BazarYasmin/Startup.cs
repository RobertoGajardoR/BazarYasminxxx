using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BazarYasmin.Startup))]
namespace BazarYasmin
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
