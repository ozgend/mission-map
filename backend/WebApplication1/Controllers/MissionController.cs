using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Http;
using DataService.Bus;
using DataService.Models;

namespace DataService.Controllers
{
    public class MissionController : ApiController
    {
        [HttpGet]
        public object Echo()
        {
            return new { message = "echo!" };
        }

        public List<Destination> GetAllDestinations()
        {
            var list = DataHelper.GetAllDestinations();
            return list;
        }

        public List<Destination> GetAllDestinationsWithGeocode()
        {
            var list = DataHelper.GetAllDestinationsWithGeocode();
            return list;
        }

        public async Task<List<Destination>> GetAllDestinationsWithGeocodeAsync()
        {
            var task = Task.Factory.StartNew(GetAllDestinationsWithGeocode);
            return await task;
        }

    }
}
