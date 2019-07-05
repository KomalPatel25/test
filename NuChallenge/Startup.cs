using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NuChallenge.Startup))]
namespace NuChallenge
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
