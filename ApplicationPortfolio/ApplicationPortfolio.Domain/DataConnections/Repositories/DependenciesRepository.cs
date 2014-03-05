using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ApplicationPortfolio.Domain.DataConnections.Repositories
{
    public class DependenciesRepository
    {
        private AppPortfolioEntities db = new AppPortfolioEntities();

        public IEnumerable<ApplicationPortfolio.Domain.DataConnections.ApplicationServerDependency> GetAllDependencies()
        {
            return db.ApplicationServerDependencies.ToList();
        }

        //can use these for any kind of dependency
        public String CreateDependency(ApplicationServerDependency applicationServerDependency)
        {
            db.ApplicationServerDependencies.Add(applicationServerDependency);
            db.SaveChanges();

            return "Success";
        }

        public ApplicationServerDependency GetDependency(int Id)
        {
            return db.ApplicationServerDependencies.Find(Id);
        }

        public String DeleteDependency(ApplicationServerDependency applicationServerDependency)
        {

            db.ApplicationServerDependencies.Remove(applicationServerDependency);
            db.SaveChanges();

            return "Success";
        }
        #region Application Dependencies

        public IEnumerable<ApplicationPortfolio.Domain.DataConnections.ApplicationServerDependency> GetDependenciesForApplication(Guid ApplicationId)
        {
            return db.ApplicationServerDependencies.Where(x => x.ApplicationId == ApplicationId);
        }

        

        #endregion

        #region Server Dependencies

        public IEnumerable<ApplicationPortfolio.Domain.DataConnections.ApplicationServerDependency> GetDependenciesForServer(Guid ServerId)
        {
            return db.ApplicationServerDependencies.Where(x => x.ServerId == ServerId);
        }

        #endregion
    }
}
