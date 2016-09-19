using System.Collections.Generic;
using System.Linq;
using DataService.Models;
using Geocoding.Google;

namespace DataService.Bus
{
    public class DataHelper
    {
        private static List<Destination> _destinations = new List<Destination>()
        {
            new Destination
            {
                Title = "Cronom R&D",
                Address = "Çiftehavuzlar mh. Eski Londra Asfaltı cd. YTÜ Davutpaşa Kampüsü Tek. Geliştirme Bölg. No 155/1G, 34420, Esenler/İstanbul"
            },

            new Destination
            {
                Title = "Cronom HQ",
                Address = "Ahmediye mh. Halk Cd. Sunar İş Merkezi, Üsküdar/İstanbul"
            },

            new Destination
            {
                Title = "Google Advertising and Marketing",
                Address = "Esentepe, Eski Büyükdere Cad. Tekfen Tower No:209, 34394 Şişli/İstanbul"
            },

            new Destination
            {
                Title = "Microsoft Corporation",
                Address = "Nispetiye, Aydın Sokağı No:9, 34340 Beşiktaş/İstanbul"
            }
        };


        public static List<Destination> GetAllDestinations()
        {
            return _destinations;
        }

        public static List<Destination> GetAllDestinationsWithGeocode()
        {
            var geocoder = new GoogleGeocoder() { ApiKey = "AIzaSyCfzt5k4DI_owt5CYmERCD-pFspOrV8P1Q" };
            foreach (var destination in _destinations)
            {
                var geocode = geocoder.Geocode(destination.Address).First();
                destination.Lat = geocode.Coordinates.Latitude;
                destination.Lon = geocode.Coordinates.Longitude;
            }
            return _destinations;
        }
    }
}