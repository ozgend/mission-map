using System;
using System.Linq;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace ApiProject.Filters
{
    public class AuthorizationRequiredAttribute : ActionFilterAttribute
    {
        const string HeaderKey = "X-TSKB-Egitim-Auth";
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            var tokenExists = actionContext.Request.Headers.Contains(HeaderKey);

            if (tokenExists)
            {
                var token = actionContext.Request.Headers.GetValues(HeaderKey).First();
                var userExists = AppContext.Authentications.ContainsKey(token);
                if (userExists)
                {
                    var user = AppContext.Authentications[token];

                    var authorizationExists = AppContext.Authorizations.ContainsKey(user.Username);

                    if (authorizationExists)
                    {
                        var permissions = AppContext.Authorizations[user.Username];

                        var isAuthorized = permissions.Contains(actionContext.ActionDescriptor.ActionName);

                        if (isAuthorized)
                        {
                            base.OnActionExecuting(actionContext);
                            return;
                        }
                    }

                }
            }

            throw new Exception("Yetkiniz yok");
        }
    }
}