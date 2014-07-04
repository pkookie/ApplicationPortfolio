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
    
    public partial class Server
    {
        public Server()
        {
            this.ApplicationServers = new HashSet<ApplicationServer>();
            this.ServerContacts = new HashSet<ServerContact>();
            this.ServerDocuments = new HashSet<ServerDocument>();
            this.ApplicationServerDependencies = new HashSet<ApplicationServerDependency>();
            this.ServerChangeRequests = new HashSet<ServerChangeRequest>();
        }
    
        public System.Guid ServerId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<ApplicationServer> ApplicationServers { get; set; }
        public virtual ICollection<ServerContact> ServerContacts { get; set; }
        public virtual ICollection<ServerDocument> ServerDocuments { get; set; }
        public virtual ICollection<ApplicationServerDependency> ApplicationServerDependencies { get; set; }
        public virtual ICollection<ServerChangeRequest> ServerChangeRequests { get; set; }
    }
}
