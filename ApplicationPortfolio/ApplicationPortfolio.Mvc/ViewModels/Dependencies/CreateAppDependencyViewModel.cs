using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPortfolio.Mvc.ViewModels.Dependencies
{
    public class CreateAppDependencyViewModel
    {
        public virtual ApplicationPortfolio.Domain.DataConnections.Application App { get; set; }
        public virtual IEnumerable<ApplicationPortfolio.Domain.DataConnections.Server> Servers { get; set; }
        public virtual Guid SelectedServerId { get; set; }
    }
}