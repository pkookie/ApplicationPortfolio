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
    
    public partial class network
    {
        public network()
        {
            this.network_addresses = new HashSet<network_addresses>();
        }
    
        public System.Guid network_id { get; set; }
        public string start_ip { get; set; }
        public string end_ip { get; set; }
        public string subnet_mask { get; set; }
    
        public virtual baseobject baseobject { get; set; }
        public virtual ICollection<network_addresses> network_addresses { get; set; }
    }
}