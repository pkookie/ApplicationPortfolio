using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;

namespace ApplicationPortfolio.Domain.DataConnections.Repositories
{
    public class ChangeRequestRepository
    {
        private AppPortfolioEntities db = new AppPortfolioEntities();

        #region Change Requests
       

        public IEnumerable<ApplicationPortfolio.Domain.DataConnections.ChangeRequest> GetAllChangeRequests()
        {
            return db.ChangeRequests.ToList();
        }

        public ChangeRequest GetChangeRequest(int Id)
        {
            return db.ChangeRequests.Find(Id);
        }

        public String CreateChangeRequest(ChangeRequest changeRequest)
        {
            db.ChangeRequests.Add(changeRequest);
            db.SaveChanges();

            return "Success";
        }

        public String EditChangeRequest(ChangeRequest changeRequest)
        {
            db.Entry(changeRequest).State = EntityState.Modified;
            db.SaveChanges();

            return "Success";
        }

        public String DeleteChangeRequest(ChangeRequest changeRequest)
        {

            db.ChangeRequests.Remove(changeRequest);
            db.SaveChanges();

            return "Success";
        }

        #endregion

        #region Server Change Requests

        public IEnumerable<ApplicationPortfolio.Domain.DataConnections.ServerChangeRequest> GetAllServerChangeRequests()
        {
            return db.ServerChangeRequests.ToList();
        }

        public ServerChangeRequest GetServerChangeRequest(int Id)
        {
            return db.ServerChangeRequests.Find(Id);
        }

        public IEnumerable<ApplicationPortfolio.Domain.DataConnections.ServerChangeRequest> GetServerChangeRequestsByServerId(Guid Id)
        {
            return db.ServerChangeRequests.Where(x => x.ServerId == Id);
        }

        public String CreateServerChangeRequest(ServerChangeRequest serverChangeRequest)
        {
            db.ServerChangeRequests.Add(serverChangeRequest);
            db.SaveChanges();

            return "Success";
        }

        public String DeleteServerChangeRequest(ServerChangeRequest serverChangeRequest)
        {

            db.ServerChangeRequests.Remove(serverChangeRequest);
            db.SaveChanges();

            return "Success";
        }

        #endregion
    }
}
