using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Graficos.Startup))]
namespace Graficos
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
