using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;

namespace ApplicationPortfolio.Domain.DataConnections.Repositories
{
    public class ServiceAreaRepository
    {
        private AppPortfolioEntities db = new AppPortfolioEntities();

        public IEnumerable<ServiceArea> GetAllServiceAreas()
        {
            return db.ServiceAreas.ToList();
        }

        public Contact GetServiceArea(Guid Id)
        {
            return db.Contacts.Find(Id);
        }

        public String CreateServiceArea(ServiceArea servicesrea)
        {

            db.ServiceAreas.Add(servicesrea);
            db.SaveChanges();

            return "Success";
        }

        public String EditServiceArea(ServiceArea servicesrea)
        {
            db.Entry(servicesrea).State = EntityState.Modified;
            db.SaveChanges();

            return "Success";
        }

        public String DeleteServiceArea(ServiceArea servicesrea)
        {

            db.ServiceAreas.Remove(servicesrea);
            db.SaveChanges();

            return "Success";
        }
    }
}
