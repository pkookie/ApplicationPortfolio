using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPortfolio.Mvc.ViewModels.Application
{
    public class ApplicationDocumentsViewModel
    {
        public virtual IEnumerable<ApplicationPortfolio.Domain.DataConnections.ApplicationDocument> ApplicationDocuments { get; set; }
        public Guid applicationID { get; set; }
    }
}