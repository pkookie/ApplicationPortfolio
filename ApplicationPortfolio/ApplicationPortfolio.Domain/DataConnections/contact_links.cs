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
    
    public partial class contact_links
    {
        public long contact_link_id { get; set; }
        public long contact_id { get; set; }
        public long contact_type_id { get; set; }
    
        public virtual contact_types contact_types { get; set; }
        public virtual contact contact { get; set; }
    }
}
