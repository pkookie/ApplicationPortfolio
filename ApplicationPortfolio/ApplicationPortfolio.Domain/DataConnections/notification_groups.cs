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
    
    public partial class notification_groups
    {
        public notification_groups()
        {
            this.notification_groups_contacts = new HashSet<notification_groups_contacts>();
            this.notification_groups_objects = new HashSet<notification_groups_objects>();
        }
    
        public long notification_group_id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
    
        public virtual ICollection<notification_groups_contacts> notification_groups_contacts { get; set; }
        public virtual ICollection<notification_groups_objects> notification_groups_objects { get; set; }
    }
}
