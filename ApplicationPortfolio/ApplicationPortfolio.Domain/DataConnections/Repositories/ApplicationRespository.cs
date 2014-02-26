using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;

namespace ApplicationPortfolio.Domain.DataConnections.Repositories
{
    public class ApplicationRespository
    {
        private AppPortfolioEntities db = new AppPortfolioEntities();

        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //}

        public IEnumerable<Application> GetAllApplications()
        {
          //  var applications = db.Applications.Include(a => a.BusinessCriticalityId).Include(a => a.Contact).Include(a => a.Contact1).Include(a => a.ServiceArea);
            return db.Applications.ToList();
        }

        public Application GetApplication(Guid Id)
        {
            return db.Applications.Find(Id);
        }

        public String CreateApplication(Application application)
        {
            application.ApplicationId = Guid.NewGuid();
            db.Applications.Add(application);
            db.SaveChanges();

            return "Success";
        }

        public String EditApplication(Application application)
        {
            db.Entry(application).State = EntityState.Modified;
            db.SaveChanges();

            return "Success";
        }

        public String DeleteApplication(Application application)
        {
            
            db.Applications.Remove(application);
            db.SaveChanges();

            return "Success";
        }

    }
}
