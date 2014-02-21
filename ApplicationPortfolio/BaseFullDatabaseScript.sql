CREATE TABLE [dbo].[notification_groups](
	[notification_group_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_notification_groups] PRIMARY KEY CLUSTERED 
(
	[notification_group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact_types]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact_types](
	[contact_type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_contact_types] PRIMARY KEY CLUSTERED 
(
	[contact_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[models]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[models](
	[model_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_models] PRIMARY KEY CLUSTERED 
(
	[model_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufacturers]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturers](
	[manufacturer_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_manufacturers_1] PRIMARY KEY CLUSTERED 
(
	[manufacturer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[frameworks]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frameworks](
	[framework_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
	[website_id] [uniqueidentifier] NULL,
	[application_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_frameworks] PRIMARY KEY CLUSTERED 
(
	[framework_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[document_type]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[document_type](
	[document_type_id] [bigint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_document_type] PRIMARY KEY CLUSTERED 
(
	[document_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platforms]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platforms](
	[platform_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_platforms] PRIMARY KEY CLUSTERED 
(
	[platform_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operating_systems]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operating_systems](
	[operating_system_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_operating_systems_1] PRIMARY KEY CLUSTERED 
(
	[operating_system_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[object_types]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[object_types](
	[object_type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[details_table] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_object_types] PRIMARY KEY CLUSTERED 
(
	[object_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[supplier_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_suppliers_1] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[status_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_status_1] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[source_controls]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[source_controls](
	[source_control_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_source_controls_1] PRIMARY KEY CLUSTERED 
(
	[source_control_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_area]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_area](
	[service_area_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_directorates_1] PRIMARY KEY CLUSTERED 
(
	[service_area_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresses](
	[address_id] [bigint] IDENTITY(1,1) NOT NULL,
	[property_name] [nvarchar](100) NULL,
	[uprn] [nvarchar](100) NULL,
	[paon] [nvarchar](100) NULL,
	[descriptor] [nvarchar](100) NULL,
	[locality] [nvarchar](100) NULL,
	[county] [nvarchar](100) NULL,
	[post_code] [nvarchar](100) NULL,
	[usrn] [nvarchar](100) NULL,
	[authority] [nvarchar](100) NULL,
 CONSTRAINT [PK_addresses_1] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[access_types]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[access_types](
	[access_type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_access_types_1] PRIMARY KEY CLUSTERED 
(
	[access_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[backup_types]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[backup_types](
	[backup_type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_backup_types] PRIMARY KEY CLUSTERED 
(
	[backup_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[backup_jobs]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[backup_jobs](
	[backup_job_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_backup_jobs] PRIMARY KEY CLUSTERED 
(
	[backup_job_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cpus]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cpus](
	[cpu_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_cpus_1] PRIMARY KEY CLUSTERED 
(
	[cpu_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[business_criticalities]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[business_criticalities](
	[bus_criticality_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_business_criticalities] PRIMARY KEY CLUSTERED 
(
	[bus_criticality_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[buildings]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buildings](
	[building_id] [bigint] IDENTITY(1,1) NOT NULL,
	[address1] [nvarchar](200) NULL,
	[address2] [nvarchar](200) NULL,
	[address3] [nvarchar](200) NULL,
	[town] [nvarchar](200) NULL,
	[postcode] [nvarchar](200) NULL,
 CONSTRAINT [PK_buildings] PRIMARY KEY CLUSTERED 
(
	[building_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[baseobjects]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[baseobjects](
	[object_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[object_type_id] [bigint] NOT NULL,
	[parent_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_objects] PRIMARY KEY CLUSTERED 
(
	[object_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contacts]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacts](
	[contact_id] [bigint] IDENTITY(1,1) NOT NULL,
	[known_as] [nvarchar](50) NOT NULL,
	[primary_email] [nvarchar](512) NOT NULL,
	[primary_phone] [nvarchar](30) NULL,
	[secondary_phone] [nvarchar](30) NULL,
	[address_id] [bigint] NULL,
	[job_description] [nvarchar](100) NULL,
	[contact_type_id] [bigint] NULL,
 CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[server_locations]    Script Date: 02/21/2014 10:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[server_locations](
	[location_id] [bigint] IDENTITY(1,1) NOT NULL,
	[display_name] [nvarchar](50) NULL,
	[short_name] [nvarchar](50) NULL,
	[building_id] [bigint] NULL,
 CONSTRAINT [PK_server_locations] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_get_object_desendant]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Line
-- Create date: 20/05/2010
-- Description:	Get object Desendant
-- =============================================
CREATE FUNCTION [dbo].[ufn_get_object_desendant] 
(	
	
	@objectId AS uniqueidentifier
	
)
RETURNS 
@Result TABLE 
(
	ParentId	uniqueidentifier,
	ChildId		uniqueidentifier,
	objectName	nvarchar(50),
	Level		int
)
AS
BEGIN
	WITH Desendant(ParentId, ChildId, objectName, Level) AS 
	(
		SELECT o.parent_id, o.object_id, o.name, 0 AS Level FROM [baseobjects] AS o
		WHERE o.object_id = @objectId
		UNION ALL
		SELECT o.parent_id, o.object_id, o.name, Level + 1 FROM [baseobjects] AS o 
		INNER JOIN Desendant AS d ON
			o.parent_id = d.ChildId
	)
	INSERT INTO @Result
	SELECT ParentId, ChildId, objectName, Level FROM Desendant
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_get_object_ancestors]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Line
-- Create date: 20/05/2010
-- Description:	Get object Ancestors
-- =============================================
CREATE FUNCTION [dbo].[ufn_get_object_ancestors] 
(	
	
	@objectId AS uniqueidentifier
	
)
RETURNS 
@Result TABLE 
(
	ParentId	uniqueidentifier,
	ChildId		uniqueidentifier,
	objectName	nvarchar(50),
	Level		int
)
AS
BEGIN
	WITH Ancestor(ParentId, ChildId, objectName, Level) AS 
	(
		SELECT o.parent_id, o.object_id, o.name, 0 AS Level FROM [baseobjects] AS o
		WHERE o.object_id = @objectId
		UNION ALL
		SELECT o.parent_id, o.object_id, o.name, Level - 1 FROM [baseobjects] AS o
		INNER JOIN Ancestor AS a ON
			o.object_id = a.ParentId
	)
	INSERT INTO @Result
	SELECT ParentId, ChildId, objectName, Level FROM Ancestor
	RETURN
END
GO
/****** Object:  Table [dbo].[applications]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applications](
	[application_id] [uniqueidentifier] NOT NULL,
	[service_area_id] [bigint] NOT NULL,
	[business_criticality_id] [bigint] NOT NULL,
 CONSTRAINT [PK_applications] PRIMARY KEY CLUSTERED 
(
	[application_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servers]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servers](
	[server_id] [uniqueidentifier] NOT NULL,
	[platform_id] [bigint] NULL,
	[operating_system_id] [bigint] NULL,
	[manufacturer_id] [bigint] NULL,
	[cpu_id] [bigint] NULL,
	[model_id] [bigint] NULL,
	[status_id] [bigint] NULL,
	[supplier_id] [bigint] NULL,
	[building_id] [bigint] NULL,
	[serial_number] [nvarchar](50) NULL,
 CONSTRAINT [PK_servers] PRIMARY KEY CLUSTERED 
(
	[server_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notifications]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notifications](
	[notifications_id] [bigint] IDENTITY(1,1) NOT NULL,
	[contact_id] [bigint] NOT NULL,
	[object_id] [uniqueidentifier] NOT NULL,
	[and_dependants] [bit] NOT NULL,
	[and_ascendants] [bit] NOT NULL,
 CONSTRAINT [PK_notifications] PRIMARY KEY CLUSTERED 
(
	[notifications_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification_groups_objects]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_groups_objects](
	[notifications_groups_objects_id] [bigint] IDENTITY(1,1) NOT NULL,
	[notification_group_id] [bigint] NOT NULL,
	[object_id] [uniqueidentifier] NULL,
	[object_type_id] [bigint] NULL,
 CONSTRAINT [PK_notifications_groups_objects] PRIMARY KEY CLUSTERED 
(
	[notifications_groups_objects_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification_groups_contacts]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_groups_contacts](
	[notification_groups_contacts_id] [bigint] IDENTITY(1,1) NOT NULL,
	[notification_group_id] [bigint] NULL,
	[contact_id] [bigint] NULL,
 CONSTRAINT [PK_notification_groups_contacts] PRIMARY KEY CLUSTERED 
(
	[notification_groups_contacts_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[document]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[document](
	[object_id] [uniqueidentifier] NOT NULL,
	[document_id] [bigint] NOT NULL,
	[document_type_id] [bigint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NULL,
	[is_image] [bit] NULL,
	[file_location] [nvarchar](50) NULL,
 CONSTRAINT [PK_documentation] PRIMARY KEY CLUSTERED 
(
	[document_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact_links]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact_links](
	[contact_link_id] [bigint] NOT NULL,
	[contact_id] [bigint] NOT NULL,
	[contact_type_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[change_requests]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[change_requests](
	[change_request_id] [uniqueidentifier] NOT NULL,
	[object_id] [uniqueidentifier] NOT NULL,
	[technician_id] [nvarchar](50) NULL,
	[authorised] [nchar](10) NULL,
	[date] [datetime] NULL,
	[is_hardware] [nvarchar](50) NULL,
	[equipment_sub] [nvarchar](50) NULL,
	[problem] [nvarchar](max) NULL,
	[change] [nvarchar](max) NULL,
	[comment_reversal] [nvarchar](max) NULL,
	[success] [nvarchar](50) NULL,
	[site] [nvarchar](50) NULL,
	[contact_id] [bigint] NULL,
	[phone] [nvarchar](50) NULL,
	[ThirdParty] [nvarchar](50) NULL,
	[downtime] [nvarchar](50) NULL,
	[requested_by] [nvarchar](50) NULL,
	[doc_no] [nvarchar](50) NULL,
	[job_no] [nvarchar](50) NULL,
	[incident_no] [nvarchar](50) NULL,
	[dynamic] [nvarchar](50) NULL,
	[perm] [nvarchar](50) NULL,
	[impact] [nvarchar](50) NULL,
	[auth_state] [nvarchar](50) NULL,
	[touchpaper_ref] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[created_on] [nchar](10) NULL,
	[created_by] [datetime] NULL,
 CONSTRAINT [PK_change_requests] PRIMARY KEY CLUSTERED 
(
	[change_request_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[networks]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[networks](
	[network_id] [uniqueidentifier] NOT NULL,
	[start_ip] [nvarchar](30) NOT NULL,
	[end_ip] [nvarchar](30) NOT NULL,
	[subnet_mask] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_networks] PRIMARY KEY CLUSTERED 
(
	[network_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[network_addresses]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[network_addresses](
	[network_address_id] [uniqueidentifier] NOT NULL,
	[network_id] [uniqueidentifier] NOT NULL,
	[server_id] [uniqueidentifier] NOT NULL,
	[ip_address] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_network_addresses] PRIMARY KEY CLUSTERED 
(
	[network_address_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[backup_links]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[backup_links](
	[backup_link_id] [bigint] NOT NULL,
	[server_id] [uniqueidentifier] NOT NULL,
	[backup_type_id] [bigint] NOT NULL,
	[backup_job_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webservers]    Script Date: 02/21/2014 10:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webservers](
	[webserver_id] [uniqueidentifier] NOT NULL,
	[server_id] [uniqueidentifier] NOT NULL,
	[is_iis] [bit] NOT NULL,
	[is_apache] [bit] NOT NULL,
 CONSTRAINT [PK_webservers] PRIMARY KEY CLUSTERED 
(
	[webserver_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_notification_list_for_object]    Script Date: 02/21/2014 10:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Richard Line
-- Create date: 20/05/2010
-- Description:	get change management notification list for object
-- =============================================
CREATE PROCEDURE [dbo].[usp_notification_list_for_object] 
	
	@Id AS uniqueidentifier
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT c.known_as AS Name, c.primary_email AS Email,
		(CASE
			WHEN o.object_id = @Id THEN
				'Asked to be notified when a change request on ' + o.name + '(' + t.name + ') was requested'
			WHEN n.and_ascendants = 1 AND n.and_dependants = 1 THEN
				'Asked to be notified when a change request on either an ascendant or dependant of ' + o.name + '(' + t.name + ') was requested'
			WHEN n.and_ascendants = 1 THEN
				'Asked to be notified when a change request on an ascendant of ' + o.name + '(' + t.name + ') was requested'
			WHEN n.and_dependants = 1 THEN
				'Asked to be notified when a change request on a dependant of ' + o.name + '(' + t.name + ') was requested'
			ELSE
				'Asked to be notified when a change request regarding ' + o.name + '(' + t.name + ') was requested'
			END + ', ') AS Reason, oo.name + '(' + tt.name + ')' AS RequestedChangeOn FROM notifications AS n
	INNER JOIN contacts AS c ON
		n.contact_id = c.contact_id
	INNER JOIN [baseobjects] AS o ON
		n.object_id = o.object_id
	INNER JOIN object_types AS t ON
		o.object_type_id = t.object_type_id
	INNER JOIN [baseobjects] AS oo ON
		oo.object_id = @Id
	INNER JOIN object_types AS tt ON
		oo.object_type_id = tt.object_type_id
	WHERE n.object_id = @Id
		OR (n.and_ascendants = 1 AND n.object_id IN (SELECT ChildId FROM ufn_get_object_desendant(@Id))) -- notify for parents 
		OR (n.and_dependants = 1 AND n.object_id IN (SELECT ChildId FROM ufn_get_object_ancestors(@Id))) -- notify for children
	ORDER BY c.known_as
END
GO
/****** Object:  Table [dbo].[server_links]    Script Date: 02/21/2014 10:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[server_links](
	[server_link_id] [bigint] IDENTITY(1,1) NOT NULL,
	[server_id] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](50) NULL,
	[URL] [nvarchar](200) NULL,
 CONSTRAINT [PK_server_links] PRIMARY KEY CLUSTERED 
(
	[server_link_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[websites]    Script Date: 02/21/2014 10:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[websites](
	[website_id] [uniqueidentifier] NOT NULL,
	[webserver_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_websites] PRIMARY KEY CLUSTERED 
(
	[website_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webservices]    Script Date: 02/21/2014 10:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webservices](
	[webservice_id] [uniqueidentifier] NOT NULL,
	[is_websitebased] [bit] NOT NULL,
	[website_id] [uniqueidentifier] NULL,
	[server_id] [uniqueidentifier] NULL,
	[url] [nvarchar](250) NULL,
	[access_type_id] [bigint] NULL,
 CONSTRAINT [PK_webservices] PRIMARY KEY CLUSTERED 
(
	[webservice_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_objects_object_id]    Script Date: 02/21/2014 10:19:21 ******/
ALTER TABLE [dbo].[baseobjects] ADD  CONSTRAINT [DF_objects_object_id]  DEFAULT (newid()) FOR [object_id]
GO
/****** Object:  Default [DF_notifications_and_dependants]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[notifications] ADD  CONSTRAINT [DF_notifications_and_dependants]  DEFAULT ((0)) FOR [and_dependants]
GO
/****** Object:  Default [DF_notifications_and_ascendants]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[notifications] ADD  CONSTRAINT [DF_notifications_and_ascendants]  DEFAULT ((0)) FOR [and_ascendants]
GO
/****** Object:  ForeignKey [FK_objects_object_types]    Script Date: 02/21/2014 10:19:21 ******/
ALTER TABLE [dbo].[baseobjects]  WITH CHECK ADD  CONSTRAINT [FK_objects_object_types] FOREIGN KEY([object_type_id])
REFERENCES [dbo].[object_types] ([object_type_id])
GO
ALTER TABLE [dbo].[baseobjects] CHECK CONSTRAINT [FK_objects_object_types]
GO
/****** Object:  ForeignKey [FK_contacts_addresses]    Script Date: 02/21/2014 10:19:21 ******/
ALTER TABLE [dbo].[contacts]  WITH CHECK ADD  CONSTRAINT [FK_contacts_addresses] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([address_id])
GO
ALTER TABLE [dbo].[contacts] CHECK CONSTRAINT [FK_contacts_addresses]
GO
/****** Object:  ForeignKey [FK_contacts_contact_types]    Script Date: 02/21/2014 10:19:21 ******/
ALTER TABLE [dbo].[contacts]  WITH CHECK ADD  CONSTRAINT [FK_contacts_contact_types] FOREIGN KEY([contact_type_id])
REFERENCES [dbo].[contact_types] ([contact_type_id])
GO
ALTER TABLE [dbo].[contacts] CHECK CONSTRAINT [FK_contacts_contact_types]
GO
/****** Object:  ForeignKey [FK_server_locations_buildings]    Script Date: 02/21/2014 10:19:21 ******/
ALTER TABLE [dbo].[server_locations]  WITH CHECK ADD  CONSTRAINT [FK_server_locations_buildings] FOREIGN KEY([building_id])
REFERENCES [dbo].[buildings] ([building_id])
GO
ALTER TABLE [dbo].[server_locations] CHECK CONSTRAINT [FK_server_locations_buildings]
GO
/****** Object:  ForeignKey [FK_applications_business_criticalities]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[applications]  WITH CHECK ADD  CONSTRAINT [FK_applications_business_criticalities] FOREIGN KEY([business_criticality_id])
REFERENCES [dbo].[business_criticalities] ([bus_criticality_id])
GO
ALTER TABLE [dbo].[applications] CHECK CONSTRAINT [FK_applications_business_criticalities]
GO
/****** Object:  ForeignKey [FK_applications_directorates]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[applications]  WITH CHECK ADD  CONSTRAINT [FK_applications_directorates] FOREIGN KEY([service_area_id])
REFERENCES [dbo].[service_area] ([service_area_id])
GO
ALTER TABLE [dbo].[applications] CHECK CONSTRAINT [FK_applications_directorates]
GO
/****** Object:  ForeignKey [FK_applications_objects]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[applications]  WITH CHECK ADD  CONSTRAINT [FK_applications_objects] FOREIGN KEY([application_id])
REFERENCES [dbo].[baseobjects] ([object_id])
GO
ALTER TABLE [dbo].[applications] CHECK CONSTRAINT [FK_applications_objects]
GO
/****** Object:  ForeignKey [FK_servers_buildings]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[servers]  WITH CHECK ADD  CONSTRAINT [FK_servers_buildings] FOREIGN KEY([building_id])
REFERENCES [dbo].[buildings] ([building_id])
GO
ALTER TABLE [dbo].[servers] CHECK CONSTRAINT [FK_servers_buildings]
GO
/****** Object:  ForeignKey [FK_servers_cpus]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[servers]  WITH CHECK ADD  CONSTRAINT [FK_servers_cpus] FOREIGN KEY([cpu_id])
REFERENCES [dbo].[cpus] ([cpu_id])
GO
ALTER TABLE [dbo].[servers] CHECK CONSTRAINT [FK_servers_cpus]
GO
/****** Object:  ForeignKey [FK_servers_manufacturers]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[servers]  WITH CHECK ADD  CONSTRAINT [FK_servers_manufacturers] FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[manufacturers] ([manufacturer_id])
GO
ALTER TABLE [dbo].[servers] CHECK CONSTRAINT [FK_servers_manufacturers]
GO
/****** Object:  ForeignKey [FK_servers_models]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[servers]  WITH CHECK ADD  CONSTRAINT [FK_servers_models] FOREIGN KEY([model_id])
REFERENCES [dbo].[models] ([model_id])
GO
ALTER TABLE [dbo].[servers] CHECK CONSTRAINT [FK_servers_models]
GO
/****** Object:  ForeignKey [FK_servers_objects]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[servers]  WITH CHECK ADD  CONSTRAINT [FK_servers_objects] FOREIGN KEY([server_id])
REFERENCES [dbo].[baseobjects] ([object_id])
GO
ALTER TABLE [dbo].[servers] CHECK CONSTRAINT [FK_servers_objects]
GO
/****** Object:  ForeignKey [FK_servers_operating_systems]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[servers]  WITH CHECK ADD  CONSTRAINT [FK_servers_operating_systems] FOREIGN KEY([operating_system_id])
REFERENCES [dbo].[operating_systems] ([operating_system_id])
GO
ALTER TABLE [dbo].[servers] CHECK CONSTRAINT [FK_servers_operating_systems]
GO
/****** Object:  ForeignKey [FK_servers_platforms]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[servers]  WITH CHECK ADD  CONSTRAINT [FK_servers_platforms] FOREIGN KEY([platform_id])
REFERENCES [dbo].[platforms] ([platform_id])
GO
ALTER TABLE [dbo].[servers] CHECK CONSTRAINT [FK_servers_platforms]
GO
/****** Object:  ForeignKey [FK_servers_status]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[servers]  WITH CHECK ADD  CONSTRAINT [FK_servers_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([status_id])
GO
ALTER TABLE [dbo].[servers] CHECK CONSTRAINT [FK_servers_status]
GO
/****** Object:  ForeignKey [FK_servers_suppliers1]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[servers]  WITH CHECK ADD  CONSTRAINT [FK_servers_suppliers1] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[suppliers] ([supplier_id])
GO
ALTER TABLE [dbo].[servers] CHECK CONSTRAINT [FK_servers_suppliers1]
GO
/****** Object:  ForeignKey [FK_notifications_contacts]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD  CONSTRAINT [FK_notifications_contacts] FOREIGN KEY([contact_id])
REFERENCES [dbo].[contacts] ([contact_id])
GO
ALTER TABLE [dbo].[notifications] CHECK CONSTRAINT [FK_notifications_contacts]
GO
/****** Object:  ForeignKey [FK_notifications_objects]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD  CONSTRAINT [FK_notifications_objects] FOREIGN KEY([object_id])
REFERENCES [dbo].[baseobjects] ([object_id])
GO
ALTER TABLE [dbo].[notifications] CHECK CONSTRAINT [FK_notifications_objects]
GO
/****** Object:  ForeignKey [FK_notifications_groups_objects_notification_groups]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[notification_groups_objects]  WITH CHECK ADD  CONSTRAINT [FK_notifications_groups_objects_notification_groups] FOREIGN KEY([notification_group_id])
REFERENCES [dbo].[notification_groups] ([notification_group_id])
GO
ALTER TABLE [dbo].[notification_groups_objects] CHECK CONSTRAINT [FK_notifications_groups_objects_notification_groups]
GO
/****** Object:  ForeignKey [FK_notifications_groups_objects_object_types]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[notification_groups_objects]  WITH CHECK ADD  CONSTRAINT [FK_notifications_groups_objects_object_types] FOREIGN KEY([object_type_id])
REFERENCES [dbo].[object_types] ([object_type_id])
GO
ALTER TABLE [dbo].[notification_groups_objects] CHECK CONSTRAINT [FK_notifications_groups_objects_object_types]
GO
/****** Object:  ForeignKey [FK_notifications_groups_objects_objects]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[notification_groups_objects]  WITH CHECK ADD  CONSTRAINT [FK_notifications_groups_objects_objects] FOREIGN KEY([object_id])
REFERENCES [dbo].[baseobjects] ([object_id])
GO
ALTER TABLE [dbo].[notification_groups_objects] CHECK CONSTRAINT [FK_notifications_groups_objects_objects]
GO
/****** Object:  ForeignKey [FK_notification_groups_contacts_contacts]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[notification_groups_contacts]  WITH CHECK ADD  CONSTRAINT [FK_notification_groups_contacts_contacts] FOREIGN KEY([contact_id])
REFERENCES [dbo].[contacts] ([contact_id])
GO
ALTER TABLE [dbo].[notification_groups_contacts] CHECK CONSTRAINT [FK_notification_groups_contacts_contacts]
GO
/****** Object:  ForeignKey [FK_notification_groups_contacts_notification_groups]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[notification_groups_contacts]  WITH CHECK ADD  CONSTRAINT [FK_notification_groups_contacts_notification_groups] FOREIGN KEY([notification_group_id])
REFERENCES [dbo].[notification_groups] ([notification_group_id])
GO
ALTER TABLE [dbo].[notification_groups_contacts] CHECK CONSTRAINT [FK_notification_groups_contacts_notification_groups]
GO
/****** Object:  ForeignKey [FK_documentation_document_type]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[document]  WITH CHECK ADD  CONSTRAINT [FK_documentation_document_type] FOREIGN KEY([document_type_id])
REFERENCES [dbo].[document_type] ([document_type_id])
GO
ALTER TABLE [dbo].[document] CHECK CONSTRAINT [FK_documentation_document_type]
GO
/****** Object:  ForeignKey [FK_documentation_objects]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[document]  WITH CHECK ADD  CONSTRAINT [FK_documentation_objects] FOREIGN KEY([object_id])
REFERENCES [dbo].[baseobjects] ([object_id])
GO
ALTER TABLE [dbo].[document] CHECK CONSTRAINT [FK_documentation_objects]
GO
/****** Object:  ForeignKey [FK_contact_links_contact_types]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[contact_links]  WITH CHECK ADD  CONSTRAINT [FK_contact_links_contact_types] FOREIGN KEY([contact_type_id])
REFERENCES [dbo].[contact_types] ([contact_type_id])
GO
ALTER TABLE [dbo].[contact_links] CHECK CONSTRAINT [FK_contact_links_contact_types]
GO
/****** Object:  ForeignKey [FK_contact_links_contacts]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[contact_links]  WITH CHECK ADD  CONSTRAINT [FK_contact_links_contacts] FOREIGN KEY([contact_id])
REFERENCES [dbo].[contacts] ([contact_id])
GO
ALTER TABLE [dbo].[contact_links] CHECK CONSTRAINT [FK_contact_links_contacts]
GO
/****** Object:  ForeignKey [FK_change_requests_contacts]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[change_requests]  WITH CHECK ADD  CONSTRAINT [FK_change_requests_contacts] FOREIGN KEY([contact_id])
REFERENCES [dbo].[contacts] ([contact_id])
GO
ALTER TABLE [dbo].[change_requests] CHECK CONSTRAINT [FK_change_requests_contacts]
GO
/****** Object:  ForeignKey [FK_change_requests_objects]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[change_requests]  WITH CHECK ADD  CONSTRAINT [FK_change_requests_objects] FOREIGN KEY([object_id])
REFERENCES [dbo].[baseobjects] ([object_id])
GO
ALTER TABLE [dbo].[change_requests] CHECK CONSTRAINT [FK_change_requests_objects]
GO
/****** Object:  ForeignKey [FK_networks_objects]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[networks]  WITH CHECK ADD  CONSTRAINT [FK_networks_objects] FOREIGN KEY([network_id])
REFERENCES [dbo].[baseobjects] ([object_id])
GO
ALTER TABLE [dbo].[networks] CHECK CONSTRAINT [FK_networks_objects]
GO
/****** Object:  ForeignKey [FK_network_addresses_networks]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[network_addresses]  WITH CHECK ADD  CONSTRAINT [FK_network_addresses_networks] FOREIGN KEY([network_id])
REFERENCES [dbo].[networks] ([network_id])
GO
ALTER TABLE [dbo].[network_addresses] CHECK CONSTRAINT [FK_network_addresses_networks]
GO
/****** Object:  ForeignKey [FK_network_addresses_objects]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[network_addresses]  WITH CHECK ADD  CONSTRAINT [FK_network_addresses_objects] FOREIGN KEY([network_address_id])
REFERENCES [dbo].[baseobjects] ([object_id])
GO
ALTER TABLE [dbo].[network_addresses] CHECK CONSTRAINT [FK_network_addresses_objects]
GO
/****** Object:  ForeignKey [FK_network_addresses_servers]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[network_addresses]  WITH CHECK ADD  CONSTRAINT [FK_network_addresses_servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[servers] ([server_id])
GO
ALTER TABLE [dbo].[network_addresses] CHECK CONSTRAINT [FK_network_addresses_servers]
GO
/****** Object:  ForeignKey [FK_backup_links_backup_jobs]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[backup_links]  WITH CHECK ADD  CONSTRAINT [FK_backup_links_backup_jobs] FOREIGN KEY([backup_job_id])
REFERENCES [dbo].[backup_jobs] ([backup_job_id])
GO
ALTER TABLE [dbo].[backup_links] CHECK CONSTRAINT [FK_backup_links_backup_jobs]
GO
/****** Object:  ForeignKey [FK_backup_links_backup_types]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[backup_links]  WITH CHECK ADD  CONSTRAINT [FK_backup_links_backup_types] FOREIGN KEY([backup_type_id])
REFERENCES [dbo].[backup_types] ([backup_type_id])
GO
ALTER TABLE [dbo].[backup_links] CHECK CONSTRAINT [FK_backup_links_backup_types]
GO
/****** Object:  ForeignKey [FK_backup_links_servers]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[backup_links]  WITH CHECK ADD  CONSTRAINT [FK_backup_links_servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[servers] ([server_id])
GO
ALTER TABLE [dbo].[backup_links] CHECK CONSTRAINT [FK_backup_links_servers]
GO
/****** Object:  ForeignKey [FK_webservers_objects]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[webservers]  WITH CHECK ADD  CONSTRAINT [FK_webservers_objects] FOREIGN KEY([webserver_id])
REFERENCES [dbo].[baseobjects] ([object_id])
GO
ALTER TABLE [dbo].[webservers] CHECK CONSTRAINT [FK_webservers_objects]
GO
/****** Object:  ForeignKey [FK_webservers_servers]    Script Date: 02/21/2014 10:19:22 ******/
ALTER TABLE [dbo].[webservers]  WITH CHECK ADD  CONSTRAINT [FK_webservers_servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[servers] ([server_id])
GO
ALTER TABLE [dbo].[webservers] CHECK CONSTRAINT [FK_webservers_servers]
GO
/****** Object:  ForeignKey [FK_server_links_servers]    Script Date: 02/21/2014 10:19:24 ******/
ALTER TABLE [dbo].[server_links]  WITH CHECK ADD  CONSTRAINT [FK_server_links_servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[servers] ([server_id])
GO
ALTER TABLE [dbo].[server_links] CHECK CONSTRAINT [FK_server_links_servers]
GO
/****** Object:  ForeignKey [FK_websites_webservers]    Script Date: 02/21/2014 10:19:24 ******/
ALTER TABLE [dbo].[websites]  WITH CHECK ADD  CONSTRAINT [FK_websites_webservers] FOREIGN KEY([webserver_id])
REFERENCES [dbo].[webservers] ([webserver_id])
GO
ALTER TABLE [dbo].[websites] CHECK CONSTRAINT [FK_websites_webservers]
GO
/****** Object:  ForeignKey [FK_webservices_access_types]    Script Date: 02/21/2014 10:19:24 ******/
ALTER TABLE [dbo].[webservices]  WITH CHECK ADD  CONSTRAINT [FK_webservices_access_types] FOREIGN KEY([access_type_id])
REFERENCES [dbo].[access_types] ([access_type_id])
GO
ALTER TABLE [dbo].[webservices] CHECK CONSTRAINT [FK_webservices_access_types]
GO
/****** Object:  ForeignKey [FK_webservices_servers]    Script Date: 02/21/2014 10:19:24 ******/
ALTER TABLE [dbo].[webservices]  WITH CHECK ADD  CONSTRAINT [FK_webservices_servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[servers] ([server_id])
GO
ALTER TABLE [dbo].[webservices] CHECK CONSTRAINT [FK_webservices_servers]
GO
/****** Object:  ForeignKey [FK_webservices_websites]    Script Date: 02/21/2014 10:19:24 ******/
ALTER TABLE [dbo].[webservices]  WITH CHECK ADD  CONSTRAINT [FK_webservices_websites] FOREIGN KEY([website_id])
REFERENCES [dbo].[websites] ([website_id])
GO
ALTER TABLE [dbo].[webservices] CHECK CONSTRAINT [FK_webservices_websites]
GO
