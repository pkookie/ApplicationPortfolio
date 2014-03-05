using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPortfolio.Mvc.ViewModels.Dependencies
{
    public class ViewDependencyViewModel
    {
        public ApplicationPortfolio.Domain.DataConnections.Application Application { get; set; }
        public ApplicationPortfolio.Domain.DataConnections.Server Server { get; set; }
        public IEnumerable<ApplicationPortfolio.Domain.DataConnections.ApplicationServerDependency> dependencies { get; set; }
        public String ApplicationOrServer { get; set; }
    }
}