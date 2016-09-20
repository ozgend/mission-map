using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ApiProject.Models;
using Geocoding.Google;

namespace ApiProject.Component
{
    public class CustomerComponent
    {
        public List<Customer> GetCustomers()
        {
            var list = new List<Customer>();

            list.Add(new Customer { Id = 1, Name = "Cronom R&D" });
            list.Add(new Customer { Id = 2, Name = "Cronom HQ" });
            list.Add(new Customer { Id = 3, Name = "Google Advertising and Marketing" });
            list.Add(new Customer { Id = 4, Name = "Microsoft Corporation" });
            list.Add(new Customer { Id = 4, Name = "TSKB" });

            return list;
        }

        public CustomerDetail GetCustomerDetail(int customerId)
        {
            var customer = GetCustomers().Find(c => c.Id == customerId);


            var customerDetail = new CustomerDetail
            {
                Id = customerId,
                Name = customer.Name,
                CustomerId = customerId,
                Grade = 4.5 * customerId,
                Phone = "0123456789",
                Address = Addresses[customer.Id - 1]
            };

            // gls


            // GeocodingClass
            var apiKey = "AIzaSyCfzt5k4DI_owt5CYmERCD-pFspOrV8P1Q";
            var geocoder = new GoogleGeocoder { ApiKey = apiKey };

            var geocode = geocoder.Geocode(customerDetail.Address).First();
            customerDetail.Lat = geocode.Coordinates.Latitude;
            customerDetail.Lon = geocode.Coordinates.Longitude;


            return customerDetail;
        }

        private static List<string> Addresses = new List<string>
        {
            "Çiftehavuzlar mh. Eski Londra Asfaltı cd. YTÜ Davutpaşa Kampüsü Tek. Geliştirme Bölg. No 155/1G, 34420, Esenler/İstanbul",
            "Ahmediye mh. Halk Cd. Sunar İş Merkezi, Üsküdar/İstanbul",
            "Esentepe, Eski Büyükdere Cad. Tekfen Tower No:209, 34394 Şişli/İstanbul",
            "Nispetiye, Aydın Sokağı No:9, 34340 Beşiktaş/İstanbul",
            "Meclisi Mebusan Cad. 81 Fındıklı 34427 İstanbul"
        };
    }

}