USE [master]
GO
/****** Object:  Database [testtask]    Script Date: 27.11.2024 23:07:33 ******/
CREATE DATABASE [testtask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testtask', FILENAME = N'D:\мои бд\testtask.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testtask_log', FILENAME = N'D:\мои бд\testtask_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [testtask] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testtask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testtask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testtask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testtask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testtask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testtask] SET ARITHABORT OFF 
GO
ALTER DATABASE [testtask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testtask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testtask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testtask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testtask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testtask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testtask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testtask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testtask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testtask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [testtask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testtask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testtask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testtask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testtask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testtask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testtask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testtask] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [testtask] SET  MULTI_USER 
GO
ALTER DATABASE [testtask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testtask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testtask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testtask] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [testtask] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [testtask] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [testtask] SET QUERY_STORE = OFF
GO
USE [testtask]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 27.11.2024 23:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabletask]    Script Date: 27.11.2024 23:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabletask](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_tabletask] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tabletask] ON 

INSERT [dbo].[tabletask] ([Id], [Name], [ParentId]) VALUES (1, N'Root', NULL)
INSERT [dbo].[tabletask] ([Id], [Name], [ParentId]) VALUES (13, N'zxc2', 12)
INSERT [dbo].[tabletask] ([Id], [Name], [ParentId]) VALUES (14, N'zxc', 13)
INSERT [dbo].[tabletask] ([Id], [Name], [ParentId]) VALUES (15, N'zxc', 1)
INSERT [dbo].[tabletask] ([Id], [Name], [ParentId]) VALUES (16, N'zxc1', 15)
INSERT [dbo].[tabletask] ([Id], [Name], [ParentId]) VALUES (17, N'zxc', 1)
SET IDENTITY_INSERT [dbo].[tabletask] OFF
GO
USE [master]
GO
ALTER DATABASE [testtask] SET  READ_WRITE 
GO
