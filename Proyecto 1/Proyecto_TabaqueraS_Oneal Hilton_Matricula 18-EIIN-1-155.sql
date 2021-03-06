USE [master]
GO
/**Oneal Hilton, Matricula 18-EIIN-1-155, SECCION 0541**/
/****** Object:  Database [TabaqueraS]    Script Date: 11/27/2018 12:00:01 ******/
CREATE DATABASE [TabaqueraS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TabaqueraS', FILENAME = N'C:\SQLServer2017Media\MSSQL14.MSSQLSERVER\MSSQL\DATA\TabaqueraS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TabaqueraS_log', FILENAME = N'C:\SQLServer2017Media\MSSQL14.MSSQLSERVER\MSSQL\DATA\TabaqueraS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TabaqueraS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TabaqueraS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TabaqueraS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TabaqueraS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TabaqueraS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TabaqueraS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TabaqueraS] SET ARITHABORT OFF 
GO
ALTER DATABASE [TabaqueraS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TabaqueraS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TabaqueraS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TabaqueraS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TabaqueraS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TabaqueraS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TabaqueraS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TabaqueraS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TabaqueraS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TabaqueraS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TabaqueraS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TabaqueraS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TabaqueraS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TabaqueraS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TabaqueraS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TabaqueraS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TabaqueraS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TabaqueraS] SET RECOVERY FULL 
GO
ALTER DATABASE [TabaqueraS] SET  MULTI_USER 
GO
ALTER DATABASE [TabaqueraS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TabaqueraS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TabaqueraS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TabaqueraS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TabaqueraS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TabaqueraS', N'ON'
GO
ALTER DATABASE [TabaqueraS] SET QUERY_STORE = OFF
GO
USE [TabaqueraS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TabaqueraS]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/27/2018 12:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] NOT NULL,
	[NombreCliente] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](10) NULL,
	[CorreoElectronico] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 11/27/2018 12:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[PrecioUnitario] [money] NULL,
	[IdProducto] [int] NULL,
	[IdFactura] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturacion]    Script Date: 11/27/2018 12:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturacion](
	[IdFactura] [int] NOT NULL,
	[IdCliente] [int] NULL,
	[IdProducto] [int] NULL,
	[IdSuplidor] [int] NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 11/27/2018 12:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] NOT NULL,
	[NombreProducto] [varchar](50) NOT NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suplidores]    Script Date: 11/27/2018 12:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suplidores](
	[IdSuplidor] [int] NOT NULL,
	[NombreSuplidor] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](10) NULL,
	[CorreoElectronico] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSuplidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([IdCliente], [NombreCliente], [Direccion], [Telefono], [CorreoElectronico]) VALUES (30, N'Marco', N'Calle moises ', N'8098983678', N'padds@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [NombreCliente], [Direccion], [Telefono], [CorreoElectronico]) VALUES (31, N'Benecia', N'Calle moscu ', N'8098693678', N'ssfs@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [NombreCliente], [Direccion], [Telefono], [CorreoElectronico]) VALUES (32, N'Macasi', N'Calle pesticida ', N'8098983968', N'paddds@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [NombreCliente], [Direccion], [Telefono], [CorreoElectronico]) VALUES (33, N'Luicito', N'Calle manzana ', N'8098783678', N'paddvs@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [NombreCliente], [Direccion], [Telefono], [CorreoElectronico]) VALUES (34, N'Anthony', N'Calle 36 ', N'8098983698', N'padds@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [NombreCliente], [Direccion], [Telefono], [CorreoElectronico]) VALUES (35, N'Lisbeth', N'Calle 98 ', N'8098981478', N'pad9@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [NombreCliente], [Direccion], [Telefono], [CorreoElectronico]) VALUES (36, N'Matias', N'Calle loco ', N'8098983738', N'paddsgs@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [NombreCliente], [Direccion], [Telefono], [CorreoElectronico]) VALUES (37, N'Benecia', N'Calle 89 ', N'8098983673', N'padddaax@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [NombreCliente], [Direccion], [Telefono], [CorreoElectronico]) VALUES (38, N'Julio', N'Calle 339 ', N'8098983625', N'padddsdfs@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [NombreCliente], [Direccion], [Telefono], [CorreoElectronico]) VALUES (39, N'Marcos A', N'Calle pedal ', N'8098982018', N'padd66s@gmail.com')
INSERT [dbo].[Detalle] ([PrecioUnitario], [IdProducto], [IdFactura], [Cantidad], [Precio]) VALUES (115.0000, 70, 100, 12, CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[Detalle] ([PrecioUnitario], [IdProducto], [IdFactura], [Cantidad], [Precio]) VALUES (116.0000, 71, 101, 13, CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Detalle] ([PrecioUnitario], [IdProducto], [IdFactura], [Cantidad], [Precio]) VALUES (1117.0000, 72, 102, 14, CAST(3256 AS Decimal(18, 0)))
INSERT [dbo].[Detalle] ([PrecioUnitario], [IdProducto], [IdFactura], [Cantidad], [Precio]) VALUES (118.0000, 73, 103, 15, CAST(2697 AS Decimal(18, 0)))
INSERT [dbo].[Detalle] ([PrecioUnitario], [IdProducto], [IdFactura], [Cantidad], [Precio]) VALUES (119.0000, 74, 104, 16, CAST(693 AS Decimal(18, 0)))
INSERT [dbo].[Detalle] ([PrecioUnitario], [IdProducto], [IdFactura], [Cantidad], [Precio]) VALUES (120.0000, 75, 105, 17, CAST(1254 AS Decimal(18, 0)))
INSERT [dbo].[Detalle] ([PrecioUnitario], [IdProducto], [IdFactura], [Cantidad], [Precio]) VALUES (121.0000, 76, 106, 18, CAST(6369 AS Decimal(18, 0)))
INSERT [dbo].[Detalle] ([PrecioUnitario], [IdProducto], [IdFactura], [Cantidad], [Precio]) VALUES (122.0000, 77, 107, 19, CAST(4581 AS Decimal(18, 0)))
INSERT [dbo].[Detalle] ([PrecioUnitario], [IdProducto], [IdFactura], [Cantidad], [Precio]) VALUES (123.0000, 78, 108, 20, CAST(3658 AS Decimal(18, 0)))
INSERT [dbo].[Detalle] ([PrecioUnitario], [IdProducto], [IdFactura], [Cantidad], [Precio]) VALUES (124.0000, 79, 109, 21, CAST(2658 AS Decimal(18, 0)))
INSERT [dbo].[Facturacion] ([IdFactura], [IdCliente], [IdProducto], [IdSuplidor], [Fecha]) VALUES (40, 50, 60, NULL, CAST(N'2015-10-06' AS Date))
INSERT [dbo].[Facturacion] ([IdFactura], [IdCliente], [IdProducto], [IdSuplidor], [Fecha]) VALUES (41, 51, 61, 50, CAST(N'2015-10-06' AS Date))
INSERT [dbo].[Facturacion] ([IdFactura], [IdCliente], [IdProducto], [IdSuplidor], [Fecha]) VALUES (42, 52, 62, 51, CAST(N'2015-10-06' AS Date))
INSERT [dbo].[Facturacion] ([IdFactura], [IdCliente], [IdProducto], [IdSuplidor], [Fecha]) VALUES (43, 53, 63, 52, CAST(N'2015-10-06' AS Date))
INSERT [dbo].[Facturacion] ([IdFactura], [IdCliente], [IdProducto], [IdSuplidor], [Fecha]) VALUES (44, 54, 64, 53, CAST(N'2015-10-06' AS Date))
INSERT [dbo].[Facturacion] ([IdFactura], [IdCliente], [IdProducto], [IdSuplidor], [Fecha]) VALUES (45, 55, 65, 54, CAST(N'2015-10-06' AS Date))
INSERT [dbo].[Facturacion] ([IdFactura], [IdCliente], [IdProducto], [IdSuplidor], [Fecha]) VALUES (46, 56, 66, 55, CAST(N'2015-10-06' AS Date))
INSERT [dbo].[Facturacion] ([IdFactura], [IdCliente], [IdProducto], [IdSuplidor], [Fecha]) VALUES (47, 57, 67, 56, CAST(N'2015-10-06' AS Date))
INSERT [dbo].[Facturacion] ([IdFactura], [IdCliente], [IdProducto], [IdSuplidor], [Fecha]) VALUES (48, 58, 68, 57, CAST(N'2015-10-06' AS Date))
INSERT [dbo].[Facturacion] ([IdFactura], [IdCliente], [IdProducto], [IdSuplidor], [Fecha]) VALUES (49, 59, 69, 58, CAST(N'2015-10-06' AS Date))
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (1, N'Cigarrillos', 200.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (2, N'Electronicos', 100.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (3, N'Abanicos', 210.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (4, N'Arado', 458.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (5, N'Amuleto', 280.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (6, N'Aspa de Horno', 780.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (7, N'Banderillas', 290.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (8, N'Barca', 203.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (9, N'Baston', 365.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (10, N'Bozal', 780.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (11, N'Carro', 2560.0000)
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [precio]) VALUES (12, N'Molde', 2567.0000)
INSERT [dbo].[Suplidores] ([IdSuplidor], [NombreSuplidor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (20, N'Marcos', N'Calle la paz', N'8098985878', N'papas@gmail.com')
INSERT [dbo].[Suplidores] ([IdSuplidor], [NombreSuplidor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (21, N'Maria', N'Calle 20', N'8098885878', N'maria@gmail.com')
INSERT [dbo].[Suplidores] ([IdSuplidor], [NombreSuplidor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (22, N'Pedro', N'Calle 123', N'8098989878', N'Pedro@gmail.com')
INSERT [dbo].[Suplidores] ([IdSuplidor], [NombreSuplidor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (23, N'Matias', N'Calle 24', N'8098982878', N'matias@gmail.com')
INSERT [dbo].[Suplidores] ([IdSuplidor], [NombreSuplidor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (24, N'Luisa', N'Calle tiradentes', N'8098985879', N'luisa@gmail.com')
INSERT [dbo].[Suplidores] ([IdSuplidor], [NombreSuplidor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (25, N'Medrano', N'Calle 988', N'8098985858', N'pn@gmail.com')
INSERT [dbo].[Suplidores] ([IdSuplidor], [NombreSuplidor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (26, N'Patricia', N'Calle tobias', N'8078985878', N'pticia@gmail.com')
INSERT [dbo].[Suplidores] ([IdSuplidor], [NombreSuplidor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (27, N'Manuel', N'Calle la senda', N'8098965878', N'pad@gmail.com')
INSERT [dbo].[Suplidores] ([IdSuplidor], [NombreSuplidor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (28, N'martha', N'Calle la mesa', N'8092585878', N'paps@gmail.com')
INSERT [dbo].[Suplidores] ([IdSuplidor], [NombreSuplidor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (29, N'Marco', N'Calle ', N'8098983678', N'padds@gmail.com')
USE [master]
GO
ALTER DATABASE [TabaqueraS] SET  READ_WRITE 
GO
