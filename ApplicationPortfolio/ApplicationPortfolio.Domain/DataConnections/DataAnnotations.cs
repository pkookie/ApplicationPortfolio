using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ApplicationPortfolio.Domain.DataConnections
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


//    #region Access Type

//    [MetadataType(typeof(accesstypeMetaData))]
//    public partial class access_types
//    {
//    }

//    public class accesstypeMetaData
//    {
//        [Key]
//        public long AccessTypeId { get; set; }
//    }

//    #endregion

//    #region Address

//    [MetadataType(typeof(AddressMetaData))]
//    public partial class Address
//    {
//    }

//    public class AddressMetaData
//    {
//        [Key]
//        public long AddressId { get; set; }
//    }

//    #endregion

    #region Application

    [MetadataType(typeof(applicationMetaData))]
    public partial class Application
    {
    }

    public class applicationMetaData
    {
        
        [Required(ErrorMessage = "A name is required")]
        public String Name { get; set; }

        

    }

    #endregion

//    #region Backup Jobs

//    [MetadataType(typeof(backup_jobsMetaData))]
//    public partial class backup_jobs
//    {
//    }

//    public class backup_jobsMetaData
//    {
//        [Key]
//        public long BackupJobId { get; set; }
//    }

//    #endregion

//    #region Backup Links

//    [MetadataType(typeof(backup_linksMetaData))]
//    public partial class backup_links
//    {
//    }

//    public class backup_linksMetaData
//    {
//        [Key]
//        public long BackupLinkId { get; set; }
//    }

//    #endregion

//    #region Backup Types

//    [MetadataType(typeof(backup_typesMetaData))]
//    public partial class backup_types
//    {
//    }

//    public class backup_typesMetaData
//    {
//        [Key]
//        public long BackupTypeId { get; set; }
//    }

//    #endregion

//    #region Base Object


//    [MetadataType(typeof(baseobjectMetaData))]
//    public partial class baseobject
//    {
//    }

//    public class baseobjectMetaData
//    {
//        [Key]
//        public System.Guid BaseObjectId { get; set; }
//      //  [ForeignKey("ApplicationId")]
//        public virtual application application { get; set; }
//        public virtual ICollection<object_types> object_types { get; set; }
//    }
//    #endregion

//    #region Building


//    [MetadataType(typeof(buildingMetaData))]
//    public partial class building
//    {
//    }

//    public class buildingMetaData
//    {
//        [Key]
//        public long BuildingId { get; set; }
//    }
//    #endregion

    #region Business Criticalities


    [MetadataType(typeof(business_criticalitiesMetaData))]
    public partial class BusinessCriticality
    {
    }

    public class business_criticalitiesMetaData
    {
        [Display(Name = "Business Criticality")]
        public string Name { get; set; }
    }
    #endregion

//    #region Change Request


//    [MetadataType(typeof(change_requestsMetaData))]
//    public partial class change_requests
//    {
//    }

//    public class change_requestsMetaData
//    {
//        [Key]
//        public System.Guid ChangeRequestId { get; set; }
//    }
//    #endregion

//    #region Contact


//    [MetadataType(typeof(contactMetaData))]
//    public partial class contact
//    {
//    }

//    public class contactMetaData
//    {
//        [Key]
//        public long ContactId { get; set; }
//    }
//    #endregion

//    #region Contact link


//    [MetadataType(typeof(contact_linksMetaData))]
//    public partial class contact_links
//    {
//    }

//    public class contact_linksMetaData
//    {
//        [Key]
//        public long ContactLinkId { get; set; }
//    }
//    #endregion

//    #region Contact type


//    [MetadataType(typeof(contact_typesMetaData))]
//    public partial class contact_types
//    {
//    }

//    public class contact_typesMetaData
//    {
//        [Key]
//        public long ContactTypeId { get; set; }
//    }
//    #endregion

//    #region CPU


//    [MetadataType(typeof(cpuMetaData))]
//    public partial class cpu
//    {
//    }

//    public class cpuMetaData
//    {
//        [Key]
//        public long CpuId { get; set; }
//    }
//    #endregion

//    #region Document


//    [MetadataType(typeof(documentMetaData))]
//    public partial class document
//    {
//    }

//    public class documentMetaData
//    {
//        [Key]
//        public System.Guid DocumentObjectId { get; set; }
//    }
//    #endregion

//    #region Document Type


//    [MetadataType(typeof(documenttypeMetaData))]
//    public partial class document_type
//    {
//    }

//    public class documenttypeMetaData
//    {
//        [Key]
//        public long DocTypeId { get; set; }
//    }
//    #endregion

//    #region Framework


//    [MetadataType(typeof(frameworkMetaData))]
//    public partial class framework
//    {
//    }

//    public class frameworkMetaData
//    {
//        [Key]
//        public long FrameworkId { get; set; }
//    }
//    #endregion

//    #region Manufacturer


//    [MetadataType(typeof(ManufacturerMetaData))]
//    public partial class manufacturer
//    {
//    }

//    public class ManufacturerMetaData
//    {
//        [Key]
//        public long ManufacturerId { get; set; }
//    }
//    #endregion

//    #region Model


//    [MetadataType(typeof(ModelMetaData))]
//    public partial class model
//    {
//    }

//    public class ModelMetaData
//    {
//        [Key]
//        public long ModelId { get; set; }
//    }
//    #endregion

//    #region Network


//    [MetadataType(typeof(NetworkMetaData))]
//    public partial class network
//    {
//    }

//    public class NetworkMetaData
//    {
//        [Key]
//        public System.Guid NetworkId { get; set; }
//        [Required]
//        public virtual baseobject baseobject { get; set; }
//    }
//    #endregion

//    #region network addresses


//    [MetadataType(typeof(network_addressesMetaData))]
//    public partial class network_addresses
//    {
//    }

//    public class network_addressesMetaData
//    {
//        [Key]
//        public System.Guid NetworkAddressId { get; set; }
//        [Required]
//        public virtual baseobject baseobject { get; set; }
//    }
//    #endregion

//    #region notification


//    [MetadataType(typeof(notificationMetaData))]
//    public partial class notification
//    {
//    }

//    public class notificationMetaData
//    {
//        [Key]
//        public long NotificationId { get; set; }
//        [ForeignKey("object_id")]
//        public virtual baseobject baseobject { get; set; }
//    }
//    #endregion

//    #region notification groups


//    [MetadataType(typeof(notification_groupsMetaData))]
//    public partial class notification_groups
//    {
//    }

//    public class notification_groupsMetaData
//    {
//        [Key]
//        public long NotGroupId { get; set; }
//    }
//    #endregion

//    #region notification groups contacts


//    [MetadataType(typeof(notification_groups_contactsMetaData))]
//    public partial class notification_groups_contacts
//    {
//    }

//    public class notification_groups_contactsMetaData
//    {
//        [Key]
//        public long NotGroupContactId { get; set; }
//    }
//    #endregion

//    #region notification groups objects


//    [MetadataType(typeof(notification_groups_objectsMetaData))]
//    public partial class notification_groups_objects
//    {
//    }

//    public class notification_groups_objectsMetaData
//    {
//        [Key]
//        public long NotGroupObjectId { get; set; }
//    }
//    #endregion

//    #region object types


//    [MetadataType(typeof(object_typesMetaData))]
//    public partial class object_types
//    {
//    }

//    public class object_typesMetaData
//    {
//        [Key]
//        public long ObjectTypeId { get; set; }
//    }
//    #endregion

//    #region Operating System


//    [MetadataType(typeof(osMetaData))]
//    public partial class operating_systems
//    {
//    }

//    public class osMetaData
//    {
//        [Key]
//        public long OsId { get; set; }
//    }
//    #endregion

//    #region Platform


//    [MetadataType(typeof(platformMetaData))]
//    public partial class platform
//    {
//    }

//    public class platformMetaData
//    {
//        [Key]
//        public long PlatformId { get; set; }
//    }
//    #endregion

//    #region Server


//    [MetadataType(typeof(serverMetaData))]
//    public partial class server
//    {
//    }

//    public class serverMetaData
//    {
//        [Key]
//        public System.Guid ServerId { get; set; }
//        [Required]
//        public virtual baseobject baseobject { get; set; }
//    }
//    #endregion

//    #region Server links


//    [MetadataType(typeof(server_linksMetaData))]
//    public partial class server_links
//    {
//    }

//    public class server_linksMetaData
//    {
//        [Key]
//        public long ServerLinkId { get; set; }
//    }
//    #endregion

//    #region Server locations


//    [MetadataType(typeof(server_locationsMetaData))]
//    public partial class server_locations
//    {
//    }

//    public class server_locationsMetaData
//    {
//        [Key]
//        public long ServerLocationId { get; set; }
//    }
//    #endregion

    #region Service Area


    [MetadataType(typeof(service_areaMetaData))]
    public partial class ServiceArea
    {
    }

    public class service_areaMetaData
    {
        [Display(Name = "Service Area")]
        public String Name { get; set; }
    }
    #endregion

//    #region Source Control


//    [MetadataType(typeof(source_controlsMetaData))]
//    public partial class source_controls
//    {
//    }

//    public class source_controlsMetaData
//    {
//        [Key]
//        public long SourceControlId { get; set; }
//    }
//    #endregion

//    #region Status


//    [MetadataType(typeof(statusMetaData))]
//    public partial class status
//    {
//    }

//    public class statusMetaData
//    {
//        [Key]
//        public long StatusId { get; set; }
//    }
//    #endregion

//    #region Supplier


//    [MetadataType(typeof(supplierMetaData))]
//    public partial class supplier
//    {
//    }

//    public class supplierMetaData
//    {
//        [Key]
//        public long SupplierId { get; set; }
//    }
//    #endregion

//    #region Web Server


//    [MetadataType(typeof(webserverMetaData))]
//    public partial class webserver
//    {
//    }

//    public class webserverMetaData
//    {
//        [Key]
//        public System.Guid WebserverId { get; set; }
//        [Required]
//        public virtual baseobject baseobject { get; set; }
//    }
//    #endregion

//    #region Web Service


//    [MetadataType(typeof(webserviceMetaData))]
//    public partial class webservice
//    {
//    }

//    public class webserviceMetaData
//    {
//        [Key]
//        public System.Guid WebserviceId { get; set; }
//    }
//    #endregion

//    #region Web Site


//    [MetadataType(typeof(websiteMetaData))]
//    public partial class website
//    {
//    }

//    public class websiteMetaData
//    {
//        [Key]
//        public System.Guid WebsiteId { get; set; }
//    }
    //    #endregion

    #region Application Business Contact


    [MetadataType(typeof(appbuscontactMetaData))]
    public partial class ApplicationBusinessContact
    {
    }

    public class appbuscontactMetaData
    {
        [Display(Name = "Business Contact")]
        public System.Guid contact_id { get; set; }
    }
    #endregion

    #region Application ICT Contact


    [MetadataType(typeof(appictcontactMetaData))]
    public partial class ApplicationIctContact
    {
    }

    public class appictcontactMetaData
    {
        [Display(Name = "ICT Contact")]
        public System.Guid contact_id { get; set; }
    }
    #endregion

    
}

