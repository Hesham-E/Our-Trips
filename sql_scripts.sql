USE [master]
GO
/****** Object:  Database [471project]    Script Date: 2021-12-16 2:32:48 PM ******/
CREATE DATABASE [471project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'471project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\471project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'471project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\471project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [471project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [471project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [471project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [471project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [471project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [471project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [471project] SET ARITHABORT OFF 
GO
ALTER DATABASE [471project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [471project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [471project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [471project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [471project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [471project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [471project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [471project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [471project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [471project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [471project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [471project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [471project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [471project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [471project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [471project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [471project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [471project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [471project] SET  MULTI_USER 
GO
ALTER DATABASE [471project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [471project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [471project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [471project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [471project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [471project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [471project] SET QUERY_STORE = OFF
GO
USE [471project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Email] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Trip_Moderates]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Trip_Moderates](
	[Account_ID] [int] NOT NULL,
	[Trip_ID] [int] NOT NULL,
 CONSTRAINT [PK_Account_Trip_Moderates] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC,
	[Trip_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[Event_ID] [int] IDENTITY(1,1) NOT NULL,
	[Event_Description] [varchar](max) NULL,
	[Date] [date] NULL,
	[Event_Name] [varchar](100) NULL,
	[Duration] [int] NULL,
	[Account_Creator] [int] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Locations]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Locations](
	[Event_ID] [int] NOT NULL,
	[Event_Location] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Event_Locations] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC,
	[Event_Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Vendor_Creates]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Vendor_Creates](
	[Event_ID] [int] NOT NULL,
	[Vendor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Event_Vendor_Creates] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC,
	[Vendor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Private_Event]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Private_Event](
	[Event_ID] [int] NOT NULL,
 CONSTRAINT [PK_Private_Event] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Public_Events_paid_for]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Public_Events_paid_for](
	[Event_ID] [int] NOT NULL,
	[Transaction_ID] [int] NOT NULL,
	[Owner_ID] [int] NOT NULL,
 CONSTRAINT [PK_Public_Events_paid_for] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC,
	[Transaction_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[Transaction_ID] [int] NOT NULL,
	[Ticket_ID] [int] NULL,
	[Account_ID] [int] NOT NULL,
	[Receipt_ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](max) NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[Receipt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temporary_User]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temporary_User](
	[Display_Name] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_Temporary_User_1] PRIMARY KEY CLUSTERED 
(
	[Display_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TemporaryUser_Event_CanView]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemporaryUser_Event_CanView](
	[Display_Name] [int] NOT NULL,
	[Event_ID] [int] NOT NULL,
 CONSTRAINT [PK_TemporaryUser_Event_CanView] PRIMARY KEY CLUSTERED 
(
	[Display_Name] ASC,
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Ticket_ID] [int] IDENTITY(1,1) NOT NULL,
	[Transaction_ID] [int] NOT NULL,
	[owner_ID] [int] NOT NULL,
	[Event_ID] [int] NOT NULL,
	[Event_Date] [date] NULL,
	[Event_Location] [varchar](50) NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Ticket_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket_Event_Information]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket_Event_Information](
	[Event_ID] [int] NOT NULL,
	[Event_Date] [date] NOT NULL,
	[Event_Location] [varchar](50) NOT NULL,
	[Tickets_remaining] [int] NOT NULL,
 CONSTRAINT [PK_Ticket_Event_Information] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Transaction_ID] [int] IDENTITY(1,1) NOT NULL,
	[Payee_ID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[is_vendor_purchase] [bit] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Transaction_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip](
	[Trip_ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NOT NULL,
	[Start_Date] [date] NULL,
	[End_Date] [date] NULL,
	[Start_Location] [varchar](50) NULL,
	[Destination] [varchar](50) NULL,
 CONSTRAINT [PK_Trip_1] PRIMARY KEY CLUSTERED 
(
	[Trip_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip_Event_Groups]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip_Event_Groups](
	[Event_ID] [int] NOT NULL,
	[Trip_ID] [int] NOT NULL,
 CONSTRAINT [PK_Trip_Event_Groups] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC,
	[Trip_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip_Locations]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip_Locations](
	[Trip_ID] [int] NOT NULL,
	[Location] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Trip_Locations] PRIMARY KEY CLUSTERED 
(
	[Trip_ID] ASC,
	[Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Display_Name] [varchar](100) NOT NULL,
	[First_Name] [varchar](100) NULL,
	[Last_Name] [varchar](100) NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Attending_Event]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Attending_Event](
	[Event_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_Event_AcceptedUsers] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC,
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Invites_Event]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Invites_Event](
	[User_ID_sender] [int] NOT NULL,
	[User_ID_invited] [int] NOT NULL,
	[Event_ID] [int] NOT NULL,
	[has_accepted] [bit] NOT NULL,
 CONSTRAINT [PK_User_Invites_Event] PRIMARY KEY CLUSTERED 
(
	[User_ID_sender] ASC,
	[User_ID_invited] ASC,
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Invites_Trip]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Invites_Trip](
	[User_ID_sender] [int] NOT NULL,
	[User_ID_invited] [int] NOT NULL,
	[Trip_ID] [int] NOT NULL,
	[has_accepted] [bit] NOT NULL,
 CONSTRAINT [PK_User_Invites_Trip] PRIMARY KEY CLUSTERED 
(
	[User_ID_sender] ASC,
	[User_ID_invited] ASC,
	[Trip_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[Vehicle_ID] [int] IDENTITY(1,1) NOT NULL,
	[Price_per_passenger] [money] NULL,
	[Type] [varchar](50) NULL,
	[Land] [bit] NOT NULL,
	[Water] [bit] NOT NULL,
	[Air] [bit] NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Vehicle_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle_Trip_Uses]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Trip_Uses](
	[Trip_ID] [int] NOT NULL,
	[Vehicle_ID] [int] NOT NULL,
	[Start_Location] [varchar](100) NOT NULL,
	[End_Location] [varchar](100) NOT NULL,
	[Start_Time] [datetime] NOT NULL,
	[End_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Vehicle_Trip_Uses] PRIMARY KEY CLUSTERED 
(
	[Trip_ID] ASC,
	[Vehicle_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 2021-12-16 2:32:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[ID] [int] NOT NULL,
	[Vendor_Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User]    Script Date: 2021-12-16 2:32:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User] ON [dbo].[User]
(
	[Display_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_1]    Script Date: 2021-12-16 2:32:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_1] ON [dbo].[User]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Admin] FOREIGN KEY([ID])
REFERENCES [dbo].[Admin] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Admin]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_User] FOREIGN KEY([ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_User]
GO
ALTER TABLE [dbo].[Account_Trip_Moderates]  WITH CHECK ADD  CONSTRAINT [FK_Account_Trip_Moderates_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Account_Trip_Moderates] CHECK CONSTRAINT [FK_Account_Trip_Moderates_Account]
GO
ALTER TABLE [dbo].[Account_Trip_Moderates]  WITH CHECK ADD  CONSTRAINT [FK_Account_Trip_Moderates_Trip] FOREIGN KEY([Trip_ID])
REFERENCES [dbo].[Trip] ([Trip_ID])
GO
ALTER TABLE [dbo].[Account_Trip_Moderates] CHECK CONSTRAINT [FK_Account_Trip_Moderates_Trip]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Account] FOREIGN KEY([Account_Creator])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Account]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Ticket_Event_Information] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Ticket_Event_Information] ([Event_ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Ticket_Event_Information]
GO
ALTER TABLE [dbo].[Event_Locations]  WITH CHECK ADD  CONSTRAINT [FK_Event_Locations_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Event_Locations] CHECK CONSTRAINT [FK_Event_Locations_Event]
GO
ALTER TABLE [dbo].[Event_Vendor_Creates]  WITH CHECK ADD  CONSTRAINT [FK_Event_Vendor_Creates_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Event_Vendor_Creates] CHECK CONSTRAINT [FK_Event_Vendor_Creates_Event]
GO
ALTER TABLE [dbo].[Event_Vendor_Creates]  WITH CHECK ADD  CONSTRAINT [FK_Event_Vendor_Creates_Vendor] FOREIGN KEY([Vendor_ID])
REFERENCES [dbo].[Vendor] ([ID])
GO
ALTER TABLE [dbo].[Event_Vendor_Creates] CHECK CONSTRAINT [FK_Event_Vendor_Creates_Vendor]
GO
ALTER TABLE [dbo].[Private_Event]  WITH CHECK ADD  CONSTRAINT [FK_Private_Event_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Private_Event] CHECK CONSTRAINT [FK_Private_Event_Event]
GO
ALTER TABLE [dbo].[Public_Events_paid_for]  WITH CHECK ADD  CONSTRAINT [FK_Public_Events_paid_for_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Public_Events_paid_for] CHECK CONSTRAINT [FK_Public_Events_paid_for_Event]
GO
ALTER TABLE [dbo].[Public_Events_paid_for]  WITH CHECK ADD  CONSTRAINT [FK_Public_Events_paid_for_Transactions] FOREIGN KEY([Transaction_ID])
REFERENCES [dbo].[Transactions] ([Transaction_ID])
GO
ALTER TABLE [dbo].[Public_Events_paid_for] CHECK CONSTRAINT [FK_Public_Events_paid_for_Transactions]
GO
ALTER TABLE [dbo].[Public_Events_paid_for]  WITH CHECK ADD  CONSTRAINT [FK_Public_Events_paid_for_Vendor] FOREIGN KEY([Owner_ID])
REFERENCES [dbo].[Vendor] ([ID])
GO
ALTER TABLE [dbo].[Public_Events_paid_for] CHECK CONSTRAINT [FK_Public_Events_paid_for_Vendor]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Account]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Ticket] FOREIGN KEY([Ticket_ID])
REFERENCES [dbo].[Ticket] ([Ticket_ID])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Ticket]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Transactions] FOREIGN KEY([Transaction_ID])
REFERENCES [dbo].[Transactions] ([Transaction_ID])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Transactions]
GO
ALTER TABLE [dbo].[Temporary_User]  WITH CHECK ADD  CONSTRAINT [FK_Temporary_User_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Temporary_User] CHECK CONSTRAINT [FK_Temporary_User_User]
GO
ALTER TABLE [dbo].[TemporaryUser_Event_CanView]  WITH CHECK ADD  CONSTRAINT [FK_TemporaryUser_Event_CanView_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[TemporaryUser_Event_CanView] CHECK CONSTRAINT [FK_TemporaryUser_Event_CanView_Event]
GO
ALTER TABLE [dbo].[TemporaryUser_Event_CanView]  WITH CHECK ADD  CONSTRAINT [FK_TemporaryUser_Event_CanView_Temporary_User] FOREIGN KEY([Display_Name])
REFERENCES [dbo].[Temporary_User] ([Display_Name])
GO
ALTER TABLE [dbo].[TemporaryUser_Event_CanView] CHECK CONSTRAINT [FK_TemporaryUser_Event_CanView_Temporary_User]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Account] FOREIGN KEY([owner_ID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Account]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Event]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Transactions] FOREIGN KEY([Transaction_ID])
REFERENCES [dbo].[Transactions] ([Transaction_ID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Transactions]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Account] FOREIGN KEY([Payee_ID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Account]
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD  CONSTRAINT [FK_Trip_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Trip] CHECK CONSTRAINT [FK_Trip_Account]
GO
ALTER TABLE [dbo].[Trip_Event_Groups]  WITH CHECK ADD  CONSTRAINT [FK_Trip_Event_Groups_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Trip_Event_Groups] CHECK CONSTRAINT [FK_Trip_Event_Groups_Event]
GO
ALTER TABLE [dbo].[Trip_Event_Groups]  WITH CHECK ADD  CONSTRAINT [FK_Trip_Event_Groups_Trip] FOREIGN KEY([Trip_ID])
REFERENCES [dbo].[Trip] ([Trip_ID])
GO
ALTER TABLE [dbo].[Trip_Event_Groups] CHECK CONSTRAINT [FK_Trip_Event_Groups_Trip]
GO
ALTER TABLE [dbo].[Trip_Locations]  WITH CHECK ADD  CONSTRAINT [FK_Trip_Locations_Trip] FOREIGN KEY([Trip_ID])
REFERENCES [dbo].[Trip] ([Trip_ID])
GO
ALTER TABLE [dbo].[Trip_Locations] CHECK CONSTRAINT [FK_Trip_Locations_Trip]
GO
ALTER TABLE [dbo].[User_Attending_Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_AcceptedUsers_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[User_Attending_Event] CHECK CONSTRAINT [FK_Event_AcceptedUsers_Event]
GO
ALTER TABLE [dbo].[User_Attending_Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_AcceptedUsers_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User_Attending_Event] CHECK CONSTRAINT [FK_Event_AcceptedUsers_User]
GO
ALTER TABLE [dbo].[User_Invites_Event]  WITH CHECK ADD  CONSTRAINT [FK_User_Invites_Event_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[User_Invites_Event] CHECK CONSTRAINT [FK_User_Invites_Event_Event]
GO
ALTER TABLE [dbo].[User_Invites_Event]  WITH CHECK ADD  CONSTRAINT [FK_User_Invites_Event_User] FOREIGN KEY([User_ID_sender])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User_Invites_Event] CHECK CONSTRAINT [FK_User_Invites_Event_User]
GO
ALTER TABLE [dbo].[User_Invites_Event]  WITH CHECK ADD  CONSTRAINT [FK_User_Invites_Event_User1] FOREIGN KEY([User_ID_invited])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User_Invites_Event] CHECK CONSTRAINT [FK_User_Invites_Event_User1]
GO
ALTER TABLE [dbo].[User_Invites_Trip]  WITH CHECK ADD  CONSTRAINT [FK_User_Invites_Trip_Trip] FOREIGN KEY([Trip_ID])
REFERENCES [dbo].[Trip] ([Trip_ID])
GO
ALTER TABLE [dbo].[User_Invites_Trip] CHECK CONSTRAINT [FK_User_Invites_Trip_Trip]
GO
ALTER TABLE [dbo].[User_Invites_Trip]  WITH CHECK ADD  CONSTRAINT [FK_User_Invites_Trip_User] FOREIGN KEY([User_ID_sender])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User_Invites_Trip] CHECK CONSTRAINT [FK_User_Invites_Trip_User]
GO
ALTER TABLE [dbo].[User_Invites_Trip]  WITH CHECK ADD  CONSTRAINT [FK_User_Invites_Trip_User1] FOREIGN KEY([User_ID_invited])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User_Invites_Trip] CHECK CONSTRAINT [FK_User_Invites_Trip_User1]
GO
ALTER TABLE [dbo].[Vehicle_Trip_Uses]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Trip_Uses_Trip] FOREIGN KEY([Trip_ID])
REFERENCES [dbo].[Trip] ([Trip_ID])
GO
ALTER TABLE [dbo].[Vehicle_Trip_Uses] CHECK CONSTRAINT [FK_Vehicle_Trip_Uses_Trip]
GO
ALTER TABLE [dbo].[Vehicle_Trip_Uses]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Trip_Uses_Vehicle] FOREIGN KEY([Vehicle_ID])
REFERENCES [dbo].[Vehicle] ([Vehicle_ID])
GO
ALTER TABLE [dbo].[Vehicle_Trip_Uses] CHECK CONSTRAINT [FK_Vehicle_Trip_Uses_Vehicle]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Account] FOREIGN KEY([ID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Account]
GO
USE [master]
GO
ALTER DATABASE [471project] SET  READ_WRITE 
GO
