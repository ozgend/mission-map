using System;
using System.Collections.Generic;
using System.Web.Http;
using ApiProject.Component;
using ApiProject.Filters;
using ApiProject.Models;

namespace ApiProject.Controllers
{
    public class DataController : ApiController
    {
        [HttpGet]
        public string Echo()
        {
            return "echo";
        }

        //[AutheticationRequired]
        [HttpGet]
        public List<Customer> ListCustomers()
        {
            var customerComponent = new CustomerComponent();
            var list = customerComponent.GetCustomers();
            return list;
        }

        [HttpPost]
        //[AutheticationRequired]
        //[AuthorizationRequired]
        public CustomerDetail CustomerDetail(DetailRequestModel model)
        {
            var customerComponent = new CustomerComponent();
            var detail = customerComponent.GetCustomerDetail(model.CustomerId);
            return detail;
        }



    }
}
