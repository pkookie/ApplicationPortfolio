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
    
    public partial class network_addresses
    {
        public System.Guid network_address_id { get; set; }
        public System.Guid network_id { get; set; }
        public System.Guid server_id { get; set; }
        public string ip_address { get; set; }
    
        public virtual baseobject baseobject { get; set; }
        public virtual network network { get; set; }
        public virtual server server { get; set; }
    }
}