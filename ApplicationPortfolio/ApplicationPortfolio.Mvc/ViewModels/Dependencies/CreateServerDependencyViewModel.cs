using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPortfolio.Mvc.ViewModels.Dependencies
{
    public class CreateServerDependencyViewModel
    {
        public virtual IEnumerable<ApplicationPortfolio.Domain.DataConnections.Application> Applications { get; set; }
        public virtual ApplicationPortfolio.Domain.DataConnections.Server Server { get; set; }
        public virtual Guid SelectedApplicationId { get; set; }
    }
}