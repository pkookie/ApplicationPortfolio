//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ApplicationPortfolio.Domain.DataConnections
{
    using System;
    using System.Collections.Generic;
    
    public partial class BusinessCriticality
    {
        public BusinessCriticality()
        {
            this.Applications = new HashSet<Application>();
        }
    
        public int BusinessCriticalityId { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<Application> Applications { get; set; }
    }
}