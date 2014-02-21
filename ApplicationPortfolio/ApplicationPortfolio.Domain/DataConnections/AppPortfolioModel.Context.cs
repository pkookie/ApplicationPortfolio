﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ICT_AppPortfolioEntities : DbContext
    {
        public ICT_AppPortfolioEntities()
            : base("name=ICT_AppPortfolioEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<access_types> access_types { get; set; }
        public DbSet<address> addresses { get; set; }
        public DbSet<application> applications { get; set; }
        public DbSet<backup_jobs> backup_jobs { get; set; }
        public DbSet<backup_links> backup_links { get; set; }
        public DbSet<backup_types> backup_types { get; set; }
        public DbSet<baseobject> baseobjects { get; set; }
        public DbSet<building> buildings { get; set; }
        public DbSet<business_criticalities> business_criticalities { get; set; }
        public DbSet<change_requests> change_requests { get; set; }
        public DbSet<contact_links> contact_links { get; set; }
        public DbSet<contact_types> contact_types { get; set; }
        public DbSet<contact> contacts { get; set; }
        public DbSet<cpu> cpus { get; set; }
        public DbSet<document> documents { get; set; }
        public DbSet<document_type> document_type { get; set; }
        public DbSet<framework> frameworks { get; set; }
        public DbSet<manufacturer> manufacturers { get; set; }
        public DbSet<model> models { get; set; }
        public DbSet<network_addresses> network_addresses { get; set; }
        public DbSet<network> networks { get; set; }
        public DbSet<notification_groups> notification_groups { get; set; }
        public DbSet<notification_groups_contacts> notification_groups_contacts { get; set; }
        public DbSet<notification_groups_objects> notification_groups_objects { get; set; }
        public DbSet<notification> notifications { get; set; }
        public DbSet<object_types> object_types { get; set; }
        public DbSet<operating_systems> operating_systems { get; set; }
        public DbSet<platform> platforms { get; set; }
        public DbSet<server_links> server_links { get; set; }
        public DbSet<server_locations> server_locations { get; set; }
        public DbSet<server> servers { get; set; }
        public DbSet<service_area> service_area { get; set; }
        public DbSet<source_controls> source_controls { get; set; }
        public DbSet<status> status { get; set; }
        public DbSet<supplier> suppliers { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<webserver> webservers { get; set; }
        public DbSet<webservice> webservices { get; set; }
        public DbSet<website> websites { get; set; }
    }
}