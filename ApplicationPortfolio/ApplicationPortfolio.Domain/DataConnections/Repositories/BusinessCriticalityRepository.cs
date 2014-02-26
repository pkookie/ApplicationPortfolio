using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;

namespace ApplicationPortfolio.Domain.DataConnections.Repositories
{
    public class BusinessCriticalityRepository
    {
        private AppPortfolioEntities db = new AppPortfolioEntities();

        public IEnumerable<BusinessCriticality> GetAllBusinessCriticalities()
        {
            return db.BusinessCriticalities.ToList();
        }

        public BusinessCriticality GetBusinessCriticality(int Id)
        {
            return db.BusinessCriticalities.Find(Id);
        }

        public String CreateBusinessCriticality(BusinessCriticality businesscriticality)
        {
           
            db.BusinessCriticalities.Add(businesscriticality);
            db.SaveChanges();

            return "Success";
        }

        public String EditBusinessCriticality(BusinessCriticality businesscriticality)
        {
            db.Entry(businesscriticality).State = EntityState.Modified;
            db.SaveChanges();

            return "Success";
        }

        public String DeleteBusinessCriticality(BusinessCriticality businesscriticality)
        {

            db.BusinessCriticalities.Remove(businesscriticality);
            db.SaveChanges();

            return "Success";
        }
    }
}
