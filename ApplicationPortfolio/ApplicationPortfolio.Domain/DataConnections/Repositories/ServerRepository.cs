using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;

namespace ApplicationPortfolio.Domain.DataConnections.Repositories
{
    public class ServerRepository
    {

        private AppPortfolioEntities db = new AppPortfolioEntities();

        public IEnumerable<Server> GetAllServers()
        {
            return db.Servers.ToList();
        }

        public Server GetServer(Guid Id)
        {
            return db.Servers.Find(Id);
        }

        public String CreateServer(Server server)
        {

            db.Servers.Add(server);
            db.SaveChanges();

            return "Success";
        }

        public String EditServer(Server server)
        {
            db.Entry(server).State = EntityState.Modified;
            db.SaveChanges();

            return "Success";
        }

        public String DeleteServer(Server server)
        {

            db.Servers.Remove(server);
            db.SaveChanges();

            return "Success";
        }
    }
}
