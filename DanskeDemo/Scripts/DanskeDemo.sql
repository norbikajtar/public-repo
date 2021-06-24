USE [master]
GO
/****** Object:  Database [DanskeDemo]    Script Date: 6/24/2021 2:12:27 PM ******/
CREATE DATABASE [DanskeDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DanskeDemo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DanskeDemo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DanskeDemo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DanskeDemo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DanskeDemo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DanskeDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DanskeDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DanskeDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DanskeDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DanskeDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DanskeDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [DanskeDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DanskeDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DanskeDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DanskeDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DanskeDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DanskeDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DanskeDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DanskeDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DanskeDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DanskeDemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DanskeDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DanskeDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DanskeDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DanskeDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DanskeDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DanskeDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DanskeDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DanskeDemo] SET RECOVERY FULL 
GO
ALTER DATABASE [DanskeDemo] SET  MULTI_USER 
GO
ALTER DATABASE [DanskeDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DanskeDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DanskeDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DanskeDemo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DanskeDemo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DanskeDemo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DanskeDemo', N'ON'
GO
ALTER DATABASE [DanskeDemo] SET QUERY_STORE = OFF
GO
USE [DanskeDemo]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 6/24/2021 2:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Number] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[MarketID] [int] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyType]    Script Date: 6/24/2021 2:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CompanyType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Market]    Script Date: 6/24/2021 2:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Market](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Market] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationSchedule]    Script Date: 6/24/2021 2:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationSchedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [uniqueidentifier] NOT NULL,
	[Notification] [int] NOT NULL,
	[SendDate] [datetime] NOT NULL,
 CONSTRAINT [PK_NotificationSchedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationScheduleRule]    Script Date: 6/24/2021 2:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationScheduleRule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MarketID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Occurences] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_NotificationScheduleRules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyType] ON 
GO
INSERT [dbo].[CompanyType] ([ID], [Type]) VALUES (1, N'Small')
GO
INSERT [dbo].[CompanyType] ([ID], [Type]) VALUES (2, N'Medium')
GO
INSERT [dbo].[CompanyType] ([ID], [Type]) VALUES (3, N'Large')
GO
SET IDENTITY_INSERT [dbo].[CompanyType] OFF
GO
SET IDENTITY_INSERT [dbo].[Market] ON 
GO
INSERT [dbo].[Market] ([ID], [Name]) VALUES (1, N'Denmark')
GO
INSERT [dbo].[Market] ([ID], [Name]) VALUES (2, N'Norway')
GO
INSERT [dbo].[Market] ([ID], [Name]) VALUES (3, N'Sweden')
GO
INSERT [dbo].[Market] ([ID], [Name]) VALUES (4, N'Finland')
GO
SET IDENTITY_INSERT [dbo].[Market] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationScheduleRule] ON 
GO
INSERT [dbo].[NotificationScheduleRule] ([ID], [MarketID], [TypeID], [Occurences]) VALUES (1, 1, 1, N'1,5,10,15,20')
GO
INSERT [dbo].[NotificationScheduleRule] ([ID], [MarketID], [TypeID], [Occurences]) VALUES (2, 1, 2, N'1,5,10,15,20')
GO
INSERT [dbo].[NotificationScheduleRule] ([ID], [MarketID], [TypeID], [Occurences]) VALUES (3, 1, 3, N'1,5,10,15,20')
GO
INSERT [dbo].[NotificationScheduleRule] ([ID], [MarketID], [TypeID], [Occurences]) VALUES (4, 2, 1, N'1,5,10,20')
GO
INSERT [dbo].[NotificationScheduleRule] ([ID], [MarketID], [TypeID], [Occurences]) VALUES (5, 2, 2, N'1,5,10,20')
GO
INSERT [dbo].[NotificationScheduleRule] ([ID], [MarketID], [TypeID], [Occurences]) VALUES (6, 2, 3, N'1,5,10,20')
GO
INSERT [dbo].[NotificationScheduleRule] ([ID], [MarketID], [TypeID], [Occurences]) VALUES (7, 3, 1, N'1,7,14,28')
GO
INSERT [dbo].[NotificationScheduleRule] ([ID], [MarketID], [TypeID], [Occurences]) VALUES (8, 3, 2, N'1,7,14,28')
GO
INSERT [dbo].[NotificationScheduleRule] ([ID], [MarketID], [TypeID], [Occurences]) VALUES (9, 4, 3, N'1,5,10,15,20')
GO
SET IDENTITY_INSERT [dbo].[NotificationScheduleRule] OFF
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF_Company_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_CompanyType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[CompanyType] ([ID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_CompanyType]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Market] FOREIGN KEY([MarketID])
REFERENCES [dbo].[Market] ([ID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Market]
GO
ALTER TABLE [dbo].[NotificationSchedule]  WITH CHECK ADD  CONSTRAINT [FK_NotificationSchedule_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[NotificationSchedule] CHECK CONSTRAINT [FK_NotificationSchedule_Company]
GO
ALTER TABLE [dbo].[NotificationScheduleRule]  WITH CHECK ADD  CONSTRAINT [FK_NotificationScheduleRules_CompanyType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[CompanyType] ([ID])
GO
ALTER TABLE [dbo].[NotificationScheduleRule] CHECK CONSTRAINT [FK_NotificationScheduleRules_CompanyType]
GO
ALTER TABLE [dbo].[NotificationScheduleRule]  WITH CHECK ADD  CONSTRAINT [FK_NotificationScheduleRules_Market] FOREIGN KEY([MarketID])
REFERENCES [dbo].[Market] ([ID])
GO
ALTER TABLE [dbo].[NotificationScheduleRule] CHECK CONSTRAINT [FK_NotificationScheduleRules_Market]
GO
USE [master]
GO
ALTER DATABASE [DanskeDemo] SET  READ_WRITE 
GO
