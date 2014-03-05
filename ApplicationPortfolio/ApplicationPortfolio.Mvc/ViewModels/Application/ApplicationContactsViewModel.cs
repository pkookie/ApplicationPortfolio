using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPortfolio.Mvc.ViewModels.Application
{
    public class ApplicationContactsViewModel
    {
        public virtual IEnumerable<ApplicationPortfolio.Domain.DataConnections.ApplicationContact> ApplicationContacts { get; set; }
        public Guid applicationID { get; set; }
    }
}