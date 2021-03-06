USE [master]
GO
/****** Object:  Database [DBWiki]    Script Date: 12/29/2019 1:48:03 AM ******/
CREATE DATABASE [DBWiki]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBWiki', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AKAKSHUKI\MSSQL\DATA\DBWiki.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBWiki_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AKAKSHUKI\MSSQL\DATA\DBWiki_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBWiki] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBWiki].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBWiki] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBWiki] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBWiki] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBWiki] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBWiki] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBWiki] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBWiki] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBWiki] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBWiki] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBWiki] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBWiki] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBWiki] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBWiki] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBWiki] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBWiki] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBWiki] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBWiki] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBWiki] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBWiki] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBWiki] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBWiki] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBWiki] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBWiki] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBWiki] SET  MULTI_USER 
GO
ALTER DATABASE [DBWiki] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBWiki] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBWiki] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBWiki] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBWiki] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBWiki] SET QUERY_STORE = OFF
GO
USE [DBWiki]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/29/2019 1:48:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[idCate] [int] IDENTITY(1,1) NOT NULL,
	[nameCate] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[idCate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EditInfo]    Script Date: 12/29/2019 1:48:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EditInfo](
	[idEI] [int] IDENTITY(1,1) NOT NULL,
	[idInfo] [int] NOT NULL,
	[contentEdit] [nvarchar](max) NOT NULL,
	[dayCreateEI] [datetime] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [PK_EditInfo] PRIMARY KEY CLUSTERED 
(
	[idEI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Information]    Script Date: 12/29/2019 1:48:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Information](
	[idInfor] [int] IDENTITY(1,1) NOT NULL,
	[titleInfo] [nvarchar](300) NOT NULL,
	[contentInfo] [nvarchar](max) NOT NULL,
	[dayCreateInfo] [datetime] NOT NULL,
	[idUser] [int] NOT NULL,
	[idCate] [int] NOT NULL,
	[hideInfo] [bit] NOT NULL,
 CONSTRAINT [PK_Information] PRIMARY KEY CLUSTERED 
(
	[idInfor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/29/2019 1:48:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[idR] [int] IDENTITY(1,1) NOT NULL,
	[nameR] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[idR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/29/2019 1:48:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[nameUser] [nvarchar](100) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[pwd] [varchar](100) NOT NULL,
	[active] [bit] NOT NULL,
	[idR] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([idCate], [nameCate]) VALUES (4, N'BBBBBBB')
INSERT [dbo].[Category] ([idCate], [nameCate]) VALUES (5, N'Phim ảnh')
INSERT [dbo].[Category] ([idCate], [nameCate]) VALUES (6, N'Truyện tranh1')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([idR], [nameR]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([idR], [nameR]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([idUser], [nameUser], [email], [pwd], [active], [idR]) VALUES (1, N'Mỹ Thanh', N'ti16102000@gmail.com', N'123456', 1, 1)
INSERT [dbo].[User] ([idUser], [nameUser], [email], [pwd], [active], [idR]) VALUES (2, N'Dinh Hoang', N'giangbaccai1207@gmail.com', N'8f07c3131896545c7bc115c4a7919cef', 1, 1)
INSERT [dbo].[User] ([idUser], [nameUser], [email], [pwd], [active], [idR]) VALUES (3, N'UnKnow', N'akak1@gmail.com', N'6e5a9a43a78094284eca4a9f557e8a15', 0, 1)
INSERT [dbo].[User] ([idUser], [nameUser], [email], [pwd], [active], [idR]) VALUES (4, N'CocaCola', N'coco@mail.com', N'1dc2613cac8dd654e9750e0078a59525', 1, 2)
INSERT [dbo].[User] ([idUser], [nameUser], [email], [pwd], [active], [idR]) VALUES (5, N'ádasdasdasa', N'giangbaccai1207111@gmail.com', N'b37eae09a7e212593019a1d28c75a5a7', 1, 1)
INSERT [dbo].[User] ([idUser], [nameUser], [email], [pwd], [active], [idR]) VALUES (6, N'sasa-kun', N'le.dinhhoang.1207@gmail.com', N'66f2ccaef876fcc89f77c20263f5aa46', 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[EditInfo] ADD  CONSTRAINT [DF_EditInfo_dayCreateEI]  DEFAULT (getdate()) FOR [dayCreateEI]
GO
ALTER TABLE [dbo].[Information] ADD  CONSTRAINT [DF_Information_dayCreateInfo]  DEFAULT (getdate()) FOR [dayCreateInfo]
GO
ALTER TABLE [dbo].[EditInfo]  WITH CHECK ADD  CONSTRAINT [FK_EditInfo_Information] FOREIGN KEY([idInfo])
REFERENCES [dbo].[Information] ([idInfor])
GO
ALTER TABLE [dbo].[EditInfo] CHECK CONSTRAINT [FK_EditInfo_Information]
GO
ALTER TABLE [dbo].[EditInfo]  WITH CHECK ADD  CONSTRAINT [FK_EditInfo_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[EditInfo] CHECK CONSTRAINT [FK_EditInfo_User]
GO
ALTER TABLE [dbo].[Information]  WITH CHECK ADD  CONSTRAINT [FK_Information_Category] FOREIGN KEY([idCate])
REFERENCES [dbo].[Category] ([idCate])
GO
ALTER TABLE [dbo].[Information] CHECK CONSTRAINT [FK_Information_Category]
GO
ALTER TABLE [dbo].[Information]  WITH CHECK ADD  CONSTRAINT [FK_Information_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[Information] CHECK CONSTRAINT [FK_Information_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([idR])
REFERENCES [dbo].[Role] ([idR])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [DBWiki] SET  READ_WRITE 
GO
