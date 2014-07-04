using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPortfolio.Mvc.ViewModels.ChangeRequest
{
    public class ServerChangeRequestViewViewModel
    {
        public virtual IEnumerable<ApplicationPortfolio.Domain.DataConnections.ServerChangeRequest> ChangeRequests { get; set; }
        public virtual Guid ServerId { get; set; }
    }
}