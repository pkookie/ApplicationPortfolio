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
    
    public partial class server_links
    {
        public long server_link_id { get; set; }
        public System.Guid server_id { get; set; }
        public string description { get; set; }
        public string URL { get; set; }
    
        public virtual server server { get; set; }
    }
}