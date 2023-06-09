USE [master]
GO
/****** Object:  Database [Otaku_No_Sekai]    Script Date: 6/6/2023 8:48:44 AM ******/
CREATE DATABASE [Otaku_No_Sekai]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Otaku_No_Sekai', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Otaku_No_Sekai.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Otaku_No_Sekai_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Otaku_No_Sekai_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Otaku_No_Sekai] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Otaku_No_Sekai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Otaku_No_Sekai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET ARITHABORT OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Otaku_No_Sekai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Otaku_No_Sekai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Otaku_No_Sekai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Otaku_No_Sekai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET RECOVERY FULL 
GO
ALTER DATABASE [Otaku_No_Sekai] SET  MULTI_USER 
GO
ALTER DATABASE [Otaku_No_Sekai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Otaku_No_Sekai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Otaku_No_Sekai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Otaku_No_Sekai] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Otaku_No_Sekai] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Otaku_No_Sekai] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Otaku_No_Sekai', N'ON'
GO
ALTER DATABASE [Otaku_No_Sekai] SET QUERY_STORE = ON
GO
ALTER DATABASE [Otaku_No_Sekai] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Otaku_No_Sekai]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/6/2023 8:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/6/2023 8:48:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[Description] [varchar](5000) NULL,
	[Author] [varchar](50) NULL,
	[Poster] [int] NOT NULL,
	[Image] [varchar](5000) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Name], [Pass]) VALUES (1, N'long', N'123456')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (1, N'Date A Live Volume 1', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679824934/Cover_jirero.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (2, N'Date A Live Volume 2', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679824941/Cover_hly0j0.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (3, N'Date A Live Volume 3', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679824954/Cover_vjgpww.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (4, N'Date A Live Volume 4', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679824967/Cover_y7z6am.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (5, N'Date A Live Volume 5', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679824983/Cover_pjivl3.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (6, N'Date A Live Volume 6', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679824992/Cover_dnzn81.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (7, N'Date A Live Volume 7', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825003/Cover_dtspqe.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (8, N'Date A Live Volume 8', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825011/Cover_h4qi42.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (9, N'Date A Live Volume 9', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825024/Cover_aqh0o8.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (10, N'Date A Live Volume 10', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825032/Cover_kgha0y.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (11, N'Date A Live Volume 11', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825038/Cover_zqugzz.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (12, N'Date A Live Volume 11.5', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825048/1474086558031_fgbocn.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (13, N'Date A Live Volume 12', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825058/Cover_qfmkwg.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (15, N'Date A Live Volume 13', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825076/001_hhmiaq.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (16, N'Date A Live Volume 14', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825087/i001-cover_yl7pjv.png')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (17, N'Date A Live Volume 15', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825101/Light_Novel_vol_15_swncdl.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (18, N'Date A Live Volume 16', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825111/cover_tvkweg.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (19, N'Date A Live Volume 17', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825123/DAL_v17_Cover_v1sn2x.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (20, N'Date A Live Volume 18', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825131/cover_dbdyxm.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (21, N'Date A Live Volume 19', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825141/cover_pglepb.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (22, N'Date A Live Volume 20', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825151/img25_syqjdy.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (23, N'Date A Live Volume 21', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825162/cover_mch5mp.jpg')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Author], [Poster], [Image]) VALUES (24, N'Date A Live Volume 22', NULL, N'Tachibana Koushi', 1, N'https://res.cloudinary.com/dawscodko/image/upload/v1679825180/DAL_v22_Cover_y6inqs.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
USE [master]
GO
ALTER DATABASE [Otaku_No_Sekai] SET  READ_WRITE 
GO
