using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;

namespace ApplicationPortfolio.Domain.DataConnections.Repositories
{
    public class SharedRepository
    {
        private AppPortfolioEntities db = new AppPortfolioEntities();

        public IEnumerable<vw_AutoComplete> GetAutoCompleteResults()
        {
            return db.vw_AutoComplete.ToList();
        }
    }
}
