using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPortfolio.Mvc.ViewModels.Application
{
    public class AllApplicationsViewModel
    {
        public virtual IEnumerable<ApplicationPortfolio.Domain.DataConnections.Application> Applications { get; set; }
    }
}