USE [master]
GO
/****** Object:  Database [CocShop]    Script Date: 4/13/2019 12:50:01 PM ******/
CREATE DATABASE [CocShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CocShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CocShop.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CocShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CocShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CocShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CocShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CocShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CocShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CocShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CocShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CocShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [CocShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CocShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CocShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CocShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CocShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CocShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CocShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CocShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CocShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CocShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CocShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CocShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CocShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CocShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CocShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CocShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CocShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CocShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CocShop] SET  MULTI_USER 
GO
ALTER DATABASE [CocShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CocShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CocShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CocShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CocShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CocShop]
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 4/13/2019 12:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[CategoryID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[isDelete] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Image]    Script Date: 4/13/2019 12:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Image](
	[ImageID] [int] NOT NULL,
	[Path] [varchar](100) NOT NULL,
	[Prod_ID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 4/13/2019 12:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[User_Email] [varchar](100) NOT NULL,
	[Total] [float] NOT NULL,
	[isDelete] [bit] NOT NULL,
	[Date_Create] [datetime] NULL,
 CONSTRAINT [PK_tbl_Oder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Order_Detail]    Script Date: 4/13/2019 12:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Order_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Product_ID] [varchar](20) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_tbl_Oder_Detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 4/13/2019 12:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[ProductID] [varchar](20) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceSale] [float] NULL,
	[PriceSell] [float] NOT NULL,
	[PriceIn] [float] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[isDelete] [bit] NOT NULL,
	[isSale] [bit] NOT NULL,
	[isNew] [bit] NOT NULL,
	[isBest] [bit] NOT NULL,
	[Cate_ID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 4/13/2019 12:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[Email] [varchar](100) NOT NULL,
	[Username] [varchar](50) NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Role] [varchar](20) NOT NULL,
	[Telephone] [varchar](13) NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[isDelete] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description], [isDelete]) VALUES (N'C001', N'Food', NULL, 0)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description], [isDelete]) VALUES (N'C002', N'Drink', N'Include gas and non-gas', 0)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description], [isDelete]) VALUES (N'C003', N'Book', NULL, 0)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description], [isDelete]) VALUES (N'C004', N'Heath & Beauty', NULL, 0)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description], [isDelete]) VALUES (N'C005', N'Toiletries', NULL, 0)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description], [isDelete]) VALUES (N'C006', N'Magazine', NULL, 0)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description], [isDelete]) VALUES (N'C0078', N'Tobacco', NULL, 0)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description], [isDelete]) VALUES (N'C008', N'Population Control', N'Against population growth', 0)
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (1, N'img/product/1.jpg', N'P001')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (2, N'img/product/2.jpg', N'P002')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (3, N'img/product/3.jpg', N'P003')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (4, N'img/product/4.jpg', N'P004')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (5, N'img/product/5.jpg', N'P005')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (6, N'img/product/6.jpg', N'P006')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (7, N'img/product/7.jpg', N'P007')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (8, N'img/product/8.jpg', N'P008')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (9, N'img/product/9.jpg', N'P009')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (10, N'img/product/10.jpg', N'P010')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (11, N'img/product/11.jpg', N'P011')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (12, N'img/product/12.jpg', N'P0112')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (13, N'img/product/13.jpg', N'P0113')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (14, N'img/product/14.jpg', N'P0114')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (15, N'img/product/15.jpg', N'P014')
INSERT [dbo].[tbl_Image] ([ImageID], [Path], [Prod_ID]) VALUES (16, N'img/product/16.jpg', N'P001')
SET IDENTITY_INSERT [dbo].[tbl_Order] ON 

INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (1, N'user@gmail.com', 0, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (2, N'user@gmail.com', 30000, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (3, N'user@gmail.com', 30000, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (4, N'user@gmail.com', 30000, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (5, N'user@gmail.com', 30000, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (6, N'user@gmail.com', 30000, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (7, N'user@gmail.com', 30000, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (8, N'benficacronaldo@gmail.com', 59000, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (9, N'benficacronaldo@gmail.com', 59000, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (10, N'benficacronaldo@gmail.com', 20000, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (11, N'benficacronaldo@gmail.com', 30000, 0, NULL)
INSERT [dbo].[tbl_Order] ([OrderID], [User_Email], [Total], [isDelete], [Date_Create]) VALUES (12, N'user@gmail.com', 30000, 0, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Order] OFF
SET IDENTITY_INSERT [dbo].[tbl_Order_Detail] ON 

INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (1, 3, N'P001', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (2, 3, N'P002', 1, 20000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (3, 4, N'P001', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (4, 4, N'P002', 1, 20000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (5, 5, N'P001', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (6, 5, N'P002', 1, 20000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (7, 6, N'P001', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (8, 6, N'P002', 1, 20000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (9, 7, N'P001', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (10, 7, N'P002', 1, 20000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (11, 8, N'P007', 1, 19000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (12, 8, N'P001', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (13, 8, N'P014', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (14, 8, N'P002', 1, 20000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (15, 9, N'P007', 1, 19000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (16, 9, N'P001', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (17, 9, N'P014', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (18, 9, N'P002', 1, 20000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (19, 10, N'P001', 2, 20000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (20, 11, N'P001', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (21, 11, N'P002', 1, 20000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (22, 12, N'P001', 1, 10000)
INSERT [dbo].[tbl_Order_Detail] ([ID], [Order_ID], [Product_ID], [Quantity], [Total]) VALUES (23, 12, N'P002', 1, 20000)
SET IDENTITY_INSERT [dbo].[tbl_Order_Detail] OFF
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'n', N'n', 0, 0, 0, 0, N'n', 1, 1, 1, 1, N'C001')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P001', N'Bánh tráng trộn', 40, 10000, 26000, 10000, N'Ngon', 0, 1, 1, 1, N'C001')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P002', N'Sữan', 20, 18000, 20000, 12000, N'Rẻ', 0, 0, 0, 1, N'C002')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P003', N'Coca Zeron', 20, 9000, 10000, 5000, NULL, 0, 0, 0, 1, N'C002')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P004', N'Pepsi Lightn', 30, NULL, 10000, 5000, NULL, 0, 0, 0, 0, N'C002')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P005', N'Durexn', 2, 44000, 50000, 20000, N'', 0, 1, 1, 1, N'C008')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P006', N'Dr.Thanh', 30, 9000, 10000, 5000, NULL, 0, 1, 1, 0, N'C002')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P007', N'Yaourn', 20, 19000, 20000, 22000, NULL, 0, 1, 1, 0, N'C002')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P008', N'Cafe', 10, NULL, 20000, 10000, NULL, 0, 0, 1, 0, N'C002')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P009', N'Milk Tea', 10, NULL, 20000, 13000, N'', 0, 0, 1, 0, N'C002')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P010', N'VietNam flag', 20, 0, 20000, 10000, N'đỏ chót', 0, 1, 1, 1, N'C004')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P011', N'VietNam flag', 20, 0, 20000, 10000, N'đỏ chót', 0, 0, 1, 1, N'C004')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P0112', N'Ca vien chien', 20, 0, 20000, 10000, N'ngon', 0, 0, 1, 1, N'C001')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P0113', N'Ca vien chien', 20, 0, 20000, 10000, N'ngon', 0, 1, 0, 0, N'C001')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P0114', N'Ca vien chien', 20, 0, 20000, 10000, N'ngon', 0, 0, 0, 0, N'C001')
INSERT [dbo].[tbl_Product] ([ProductID], [ProductName], [Quantity], [PriceSale], [PriceSell], [PriceIn], [Description], [isDelete], [isSale], [isNew], [isBest], [Cate_ID]) VALUES (N'P014', N'Tran chau', 10, 0, 10000, 5000, N'', 0, 0, 1, 1, N'C002')
INSERT [dbo].[tbl_Users] ([Email], [Username], [Firstname], [Lastname], [Password], [Role], [Telephone], [Address], [City], [isDelete]) VALUES (N'123@gmail.com', N'thienmanhvo', N'nao', N'nguyen', N'123456', N'user', N'0902665078', N'', N'aaa', 1)
INSERT [dbo].[tbl_Users] ([Email], [Username], [Firstname], [Lastname], [Password], [Role], [Telephone], [Address], [City], [isDelete]) VALUES (N'1234@gmail.com', N'thienprovip', N' thi', N'nguyen', N'123', N'user', N'0333599778', N'', N'thu thua', 0)
INSERT [dbo].[tbl_Users] ([Email], [Username], [Firstname], [Lastname], [Password], [Role], [Telephone], [Address], [City], [isDelete]) VALUES (N'12345@gmail.com', N'thiencute', N'thi', N'nguyen', N'12345', N'user', N'', N'long ann', N'thuthua', 0)
INSERT [dbo].[tbl_Users] ([Email], [Username], [Firstname], [Lastname], [Password], [Role], [Telephone], [Address], [City], [isDelete]) VALUES (N'123456@gmail.com', NULL, N'a', N'a', N'1234', N'user', NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_Users] ([Email], [Username], [Firstname], [Lastname], [Password], [Role], [Telephone], [Address], [City], [isDelete]) VALUES (N'1234567@gmail.com', N'thien', N'thien', N'nguyen', N'1234', N'admin', NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_Users] ([Email], [Username], [Firstname], [Lastname], [Password], [Role], [Telephone], [Address], [City], [isDelete]) VALUES (N'benficacronaldo@gmail.com', N'aa', N'Bảo Thiện', N'Nguyễn', N'123456', N'user', N'', N'', N'', 0)
INSERT [dbo].[tbl_Users] ([Email], [Username], [Firstname], [Lastname], [Password], [Role], [Telephone], [Address], [City], [isDelete]) VALUES (N'thienmanho@gmail.com', N'thienmanhvo', N'bao thien', N'nguyen', N'1234', N'admin', N'0333577999', N'Don''t have', N'Thu thua', 0)
INSERT [dbo].[tbl_Users] ([Email], [Username], [Firstname], [Lastname], [Password], [Role], [Telephone], [Address], [City], [isDelete]) VALUES (N'user@gmail.com', N'hanlnb', N'aa', N'han', N'1234', N'user', N'0333577999', N'aa', N'aaa', 0)
INSERT [dbo].[tbl_Users] ([Email], [Username], [Firstname], [Lastname], [Password], [Role], [Telephone], [Address], [City], [isDelete]) VALUES (N'user2@gmail.com', N'3', N'n', N'n', N'123', N'user', NULL, NULL, NULL, 0)
ALTER TABLE [dbo].[tbl_Image]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Image_tbl_Product] FOREIGN KEY([Prod_ID])
REFERENCES [dbo].[tbl_Product] ([ProductID])
GO
ALTER TABLE [dbo].[tbl_Image] CHECK CONSTRAINT [FK_tbl_Image_tbl_Product]
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order_tbl_Users] FOREIGN KEY([User_Email])
REFERENCES [dbo].[tbl_Users] ([Email])
GO
ALTER TABLE [dbo].[tbl_Order] CHECK CONSTRAINT [FK_tbl_Order_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order_Detail_tbl_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[tbl_Order] ([OrderID])
GO
ALTER TABLE [dbo].[tbl_Order_Detail] CHECK CONSTRAINT [FK_tbl_Order_Detail_tbl_Order]
GO
ALTER TABLE [dbo].[tbl_Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order_Detail_tbl_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[tbl_Product] ([ProductID])
GO
ALTER TABLE [dbo].[tbl_Order_Detail] CHECK CONSTRAINT [FK_tbl_Order_Detail_tbl_Product]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_tbl_Category] FOREIGN KEY([Cate_ID])
REFERENCES [dbo].[tbl_Category] ([CategoryID])
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_tbl_Category]
GO
USE [master]
GO
ALTER DATABASE [CocShop] SET  READ_WRITE 
GO
