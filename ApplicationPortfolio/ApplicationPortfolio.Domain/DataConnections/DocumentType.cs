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
    
    public partial class DocumentType
    {
        public DocumentType()
        {
            this.Documents = new HashSet<Document>();
        }
    
        public int DocumentTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<Document> Documents { get; set; }
    }
}