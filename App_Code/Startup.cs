using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ListaCompras.Startup))]
namespace ListaCompras
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
