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
    
    public partial class change_requests
    {
        public System.Guid change_request_id { get; set; }
        public System.Guid object_id { get; set; }
        public string technician_id { get; set; }
        public string authorised { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string is_hardware { get; set; }
        public string equipment_sub { get; set; }
        public string problem { get; set; }
        public string change { get; set; }
        public string comment_reversal { get; set; }
        public string success { get; set; }
        public string site { get; set; }
        public Nullable<long> contact_id { get; set; }
        public string phone { get; set; }
        public string ThirdParty { get; set; }
        public string downtime { get; set; }
        public string requested_by { get; set; }
        public string doc_no { get; set; }
        public string job_no { get; set; }
        public string incident_no { get; set; }
        public string dynamic { get; set; }
        public string perm { get; set; }
        public string impact { get; set; }
        public string auth_state { get; set; }
        public string touchpaper_ref { get; set; }
        public string type { get; set; }
        public string created_on { get; set; }
        public Nullable<System.DateTime> created_by { get; set; }
    
        public virtual baseobject baseobject { get; set; }
        public virtual contact contact { get; set; }
    }
}
