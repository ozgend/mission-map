using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiProject.Models
{
    public class CustomerDetail : Customer
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public string Phone { get; set; }
        public double Grade { get; set; }
        public string Address { get; set; }
        public double Lat { get; set; }
        public double Lon { get; set; }
    }
}