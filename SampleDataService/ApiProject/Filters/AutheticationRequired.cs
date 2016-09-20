using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using ApiProject.Controllers;

namespace ApiProject.Filters
{
    public class AutheticationRequired : ActionFilterAttribute
    {
        const string HeaderKey = "X-TSKB-Egitim-Auth";
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            //base.OnActionExecuting(actionContext);

            var tokenExists = actionContext.Request.Headers.Contains(HeaderKey);

            if (tokenExists)
            {
                var token = actionContext.Request.Headers.GetValues(HeaderKey).First();
                var userExists = AppContext.Authentications.ContainsKey(token);
                if (userExists)
                {
                    base.OnActionExecuting(actionContext);
                    return;
                }
            }

            throw new Exception("Login olmaniz gerekiyor");
        }

    }
}