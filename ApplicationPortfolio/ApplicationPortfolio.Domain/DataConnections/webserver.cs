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
    
    public partial class webserver
    {
        public webserver()
        {
            this.websites = new HashSet<website>();
        }
    
        public System.Guid webserver_id { get; set; }
        public System.Guid server_id { get; set; }
        public bool is_iis { get; set; }
        public bool is_apache { get; set; }
    
        public virtual baseobject baseobject { get; set; }
        public virtual server server { get; set; }
        public virtual ICollection<website> websites { get; set; }
    }
}
