using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPortfolio.Mvc.ViewModels.Application
{
    public class ApplicationCreateViewModel
    {
        public virtual ApplicationPortfolio.Domain.DataConnections.Application Application { get; set; }
        public virtual IEnumerable<ApplicationPortfolio.Domain.DataConnections.ApplicationContact> ApplicationContacts { get; set; }
        public virtual IEnumerable<ApplicationPortfolio.Domain.DataConnections.ApplicationDocument> ApplicationDocuments { get; set; }
        public virtual IEnumerable<ApplicationPortfolio.Domain.DataConnections.BusinessCriticality> BusinessCriticalities { get; set; }
        public virtual IEnumerable<ApplicationPortfolio.Domain.DataConnections.ServiceArea> ServiceAreas { get; set; }
        public int BusinessCriticalitySelectedValue { get; set; }
        public int ServiceAreaSelectedValue { get; set; }
    }
}