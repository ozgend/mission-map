using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ApiProject.Controllers;

namespace ApiProject
{
    public static class AppContext
    {
        public static Dictionary<string, LoginModel> Authentications { get; set; }
        public static Dictionary<string, List<string>> Authorizations { get; set; }

        public static void CreateContext()
        {
            Authentications = new Dictionary<string, LoginModel>();

            Authorizations = new Dictionary<string, List<string>>();

            var permissions = new List<string>
            {
                "ListCustomers",
                "CustomerDetail"
            };

            Authorizations.Add("a", permissions);



        }

        public static void AddUser(string token, LoginModel login)
        {
            Authentications[token] = login;
        }

        public static void Remove(string token)
        {
            Authentications.Remove(token);
        }

    }
}