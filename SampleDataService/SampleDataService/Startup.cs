using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SampleDataService.Startup))]
namespace SampleDataService
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
