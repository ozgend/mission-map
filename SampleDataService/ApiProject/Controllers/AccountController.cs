using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiProject.Controllers
{
    public class AccountController : ApiController
    {
        [HttpPost]
        public dynamic Login(LoginModel data)
        {
            // login business
            var success = data.Username == "a" && data.Password == "1";
            string token = "";

            if (success)
            {
                token = Guid.NewGuid().ToString().Replace("-", string.Empty);
                AppContext.AddUser(token, data);

            }

            return new { success, token };

        }
    }
}
