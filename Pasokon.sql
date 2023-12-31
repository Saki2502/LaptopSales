USE master
GO

USE [Pasokon]
GO
/****** Object:  StoredProcedure [dbo].[urUpdateSLSP]    Script Date: 9/1/2023 3:42:16 AM ******/
DROP PROCEDURE [dbo].[urUpdateSLSP]
GO
/****** Object:  StoredProcedure [dbo].[spCheckLogin]    Script Date: 9/1/2023 3:42:16 AM ******/
DROP PROCEDURE [dbo].[spCheckLogin]
GO
ALTER TABLE [dbo].[ProductTag] DROP CONSTRAINT [FK_ProductTag_Tag]
GO
ALTER TABLE [dbo].[ProductTag] DROP CONSTRAINT [FK_ProductTag_Products]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Customers_Orders]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Invoices_Orders]
GO
ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_Invoices_Customers]
GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_Employees_Accounts]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tag]') AND type in (N'U'))
DROP TABLE [dbo].[Tag]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]') AND type in (N'U'))
DROP TABLE [dbo].[Suppliers]
GO
/****** Object:  Table [dbo].[ProductTag]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductTag]') AND type in (N'U'))
DROP TABLE [dbo].[ProductTag]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetails]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoices]') AND type in (N'U'))
DROP TABLE [dbo].[Invoices]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
DROP TABLE [dbo].[Customers]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Brands]') AND type in (N'U'))
DROP TABLE [dbo].[Brands]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 9/1/2023 3:42:16 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Role] [bit] NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[PhoneNumber] [varchar](15) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[PhoneNumber] [varchar](15) NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[TotalPrice] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NULL,
	[PayType] [nvarchar](100) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImageURL] [varchar](max) NULL,
	[Price] [money] NULL,
	[Quantity] [smallint] NULL,
	[CategoryID] [int] NULL,
	[SupplierID] [int] NULL,
	[CPU] [varchar](50) NULL,
	[VGA] [varchar](50) NULL,
	[RAM] [varchar](20) NULL,
	[SSD] [varchar](20) NULL,
	[Pin] [varchar](20) NULL,
	[Weight] [varchar](10) NULL,
	[BrandID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTag]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TagID] [int] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](80) NULL,
	[PhoneNumber] [nchar](20) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (1, N'a', N'123', NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (2, N'Nhi', N'1', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (3, N'An', N'1', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (4, N'saki', N'2311', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (5, N'hine', N'2410', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (6, N'thienan', N'0', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (7, N'vung', N'0', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (8, N'khiem', N'0', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (9, N'trang', N'0', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (10, N'truc', N'0', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (11, N'duy', N'0', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (12, N'huyen', N'0', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (13, N'uyen', N'0', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (14, N'haha', N'0', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (15, N'hihi', N'0', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (16, N'noname', N'1', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (17, N'staff', N'123', NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (18, N'test', N'202cb962ac59075b964b07152d234b70', NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [Password], [Email], [Role], [LastName], [FirstName], [Address], [PhoneNumber]) VALUES (19, N'admin', N'96e79218965eb72c92a549dd5a330112', NULL, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (1, N'Acer')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (2, N'Asus')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (3, N'DELL')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (4, N'MSI')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (5, N'Lenovo')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (6, N'HP')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (7, N'Gigabyte')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (8, N'Microsoft (Surface)')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (9, N'Apple (MacBook)')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (10, N'Samsung')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (11, N'Kingston')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (12, N'Corsair')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (13, N'Tomtoc')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (14, N'Cooler Master')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (15, N'NoBrand')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Laptop')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Phụ kiện Laptop')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Linh kiện Laptop')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [AccountID]) VALUES (1, 2)
INSERT [dbo].[Customers] ([CustomerID], [AccountID]) VALUES (3, 3)
INSERT [dbo].[Customers] ([CustomerID], [AccountID]) VALUES (4, 7)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Address], [PhoneNumber], [AccountID]) VALUES (1, N'Nguyễn Đặng', N'Tuyết Nhi', NULL, NULL, 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Address], [PhoneNumber], [AccountID]) VALUES (4, N'Nguyễn Ngọc', N'Thiên Ân', NULL, NULL, 17)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (1, N'Laptop Gaming Asus TUF F15 FX506LHB-HN188W', N'Laptop Gaming Asus TUF F15 FX506LHB-HN188W sẽ thay đổi cách bạn nhìn vào laptop chơi game. được trang bị phần cứng ấn tượng, thiết kế gọn nhưng mạnh mẽ. Trang bị bộ vi xử lý Intel thế hệ mới nhất, hỗ trợ ram tối đa 32GB, VGA GTX 16 series, màn hình IPS 144Hz với bàn phím có đèn nền RGB. Có bàn phím chuyên dụng chơi game với các phím RGB-backlit. Cụm phím WASD nổi bật và công nghệ Overstroke để thao tác nhanh và chính xác. Với màn hình NanoEdge IPS cấp độ tiên tiến, và độ bền được chứng nhận kiểm tra MIL-STD-810G. Laptop Gaming Asus TUF F15 FX506LHB-HN188W mang đến trải nghiệm chơi game phong phú mọi lúc mọi nơi!', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690019991/Laptop%20Sales/Asus/Laptop-Gaming-Asus-TUF-F15-FX506LHB-HN188W_emkyyu.jpg', 14990000.0000, 100, 1, 1, N'i5-10300H', N'GTX 1650', N'DDR4 8GB 2933MHz', N'512GB', N'3 Cell, 48Whr', N'2.3 Kg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (2, N'Laptop Gaming Asus TUF F15 FX506HF-HN014W', N'Laptop Gaming Asus TUF F15 FX506HF-HN014W sẽ thay đổi cách bạn nhìn vào laptop chơi game. được trang bị phần cứng ấn tượng, thiết kế gọn nhưng mạnh mẽ. Trang bị bộ vi xử lý Intel thế hệ mới nhất, hỗ trợ ram tối đa 32GB, VGA RTX 20 series, màn hình IPS 144Hz với bàn phím có đèn nền RGB. Có bàn phím chuyên dụng chơi game với các phím RGB-backlit. Cụm phím WASD nổi bật và công nghệ Overstroke để thao tác nhanh và chính xác. Với màn hình NanoEdge IPS cấp độ tiên tiến, và độ bền được chứng nhận kiểm tra MIL-STD-810G. Laptop Gaming Asus TUF F15 FX506HF-HN014W mang đến trải nghiệm chơi game phong phú mọi lúc mọi nơi!', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690020297/Laptop%20Sales/Asus/Laptop-Gaming-Asus-TUF-F15-FX506HF-HN014W_qajcc2.jpg', 15990000.0000, 100, 1, 1, N'i5-11400H', N'RTX 2050 4GB', N'DDR4 8GB 3200MHz', N'512GB', N'3 Cell, 48Whr', N'2.3 Kg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (3, N'Laptop Gaming Asus ROG Strix G15 G513IH-HN015W', N'Asus ROG Strix G15 G513IH-HN015W với CPU manh mẽ R7 4800H và GPU GeForce GTX™ 1650. Mọi hoạt động từ chơi game tới thao tác đa nhiệm đều nhanh và mượt mà. Chơi game với màn hình siêu nhanh FHD 144Hz. Công nghệ Adaptive-Sync cho tựa game siêu mượt. Hệ thống tản nhiệt cao cấp giữ cho máy luôn mát mẻ dưới những thử thách cam go. Với bất kỳ game nào, bạn đều có thể có được những màn chơi hoàn hảo.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690020399/Laptop%20Sales/Asus/Laptop-Gaming-Asus-ROG-Strix-G15-G513IH-HN015W-1_sw1zip.jpg', 17490000.0000, 100, 1, 1, N'Ryzen 7 4800H', N'GTX 1650 4GB', N'DDR4 8GB 3200MHz', N'512GB', NULL, N'2.1 Kg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (4, N'Laptop Asus VivoBook 14X A1405VA-KM095W', N'Tỏa sáng với cả thế giới cùng Laptop Asus VivoBook 14X A1405VA-KM095W, máy tính xách tay đầy đủ tính năng với màn hình OLED HDR cực sáng với dải màu DCI-P3 đẳng cấp điện ảnh. Laptop Asus VivoBook 14X A1405VA-KM095W cho phép hoàn thành mọi việc dễ dàng, mọi lúc mọi nơi: mọi khía cạnh đều được cải tiến, từ bộ vi xử lý di động Intel® thế hệ 12 mạnh mẽ tới bản lề duỗi thẳng 180°, thiết kế hình học thanh mảnh và màu sắc hiện đại. Bắt đầu ngày mới đầy hứng khởi với Laptop Asus VivoBook 14X A1405VA-KM095W OLED!', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690020471/Laptop%20Sales/Asus/Laptop-Asus-VivoBook-14X-A1405VA-KM095W-1_xgu4kp.jpg', 17490000.0000, 100, 1, 1, N'i5-13500H', N'Iris Xe Graphics', N'DDR4 16GB', N'512GB', N'3 Cell, 50Whr', N'1.7 Kg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (5, N'Laptop Gaming Asus TUF F15 FX507ZC4-HN074W', N'Laptop Gaming Asus TUF F15 FX507ZC4-HN074W kết hợp bộ xử lý Intel® Core ™ thế hệ thứ 12 Hoặc AMD Ryzen™ 6000 Series. GPU Nvidia GeForce RTX ™ 30 Series với TGP tối đa 140W và MUX switch. Thiết kế khung máy nhỏ hơn 4,5%, nâng bàn di chuột lớn hơn 26%. Hỗ trợ màn hình QHD 165Hz hoặc FHD 300Hz với Adaptive-Sync và tỷ lệ màn hình so với thân máy là 80%. Tích hợp thêm cổng Thunderbolt ™ 4 và. USB Type-C, và pin lên đến 90Wh.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690020569/Laptop%20Sales/Asus/Laptop-Gaming-Asus-TUF-F15-FX507ZC4-HN074W_melddv.jpg', 19890000.0000, 100, 1, 1, N'i5-12500H', N'RTX 3050 4GB', N'DDR4 8GB 3200MHz', N'512GB', N'4 Cell, 76Whr', N'2.2 Kg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (6, N'Laptop Asus ROG Zephyrus G16 GU603VU-N3898W', N'Asus ROG Zephyrus G16 GU603VU-N3898W là dòng sản phẩm dành riêng cho game thủ và người sáng tạo nội dung, được tái thiết kế với tôn chỉ tiếp tục phát huy thiết kế mỏng nhẹ đặc trưng, cải tiến hệ thống tản nhiệt vượt trội hơn nhờ hệ thống khe thoát nhiệt bao quanh thân máy và công nghệ tản nhiệt ROG Intelligent Cooling.

Trang bị cấu hình khủng
Trang bị CPU Intel Core™ i7 12620H và GPU NVIDIA GeForce RTX 4050 Laptop GPU kèm công nghệ MUX Switch và NVIDIA Advanced Optimus. Asus ROG Zephyrus G16 GU603VU-N3898W còn được nâng tầm về mặt hiển thị, với màn hình 16-inch độ phân giải FHD đạt chuẩn 100% sRGB.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690020647/Laptop%20Sales/Asus/Laptop-Asus-ROG-Zephyrus-G16-GU603VU-N3898W_tp1c4m.jpg', 40690000.0000, 100, 1, 1, N'i7-13620H', N'RTX 4050 6GB', N'DDR4 8GB 3200MHz', N'512GB', N'4 Cell, 90Whr', N'2.0 Kg', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (7, N'Laptop Gaming Acer Nitro 5 Eagle AN515-57-5669', N'Acer Nitro 5 AN515-57-5669 tích hợp những "vũ khí" mới nhất. Bao gồm CPU i5 11400H, VGA GTX 1650 cho hiệu năng xử lý mạnh mẽ.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690020831/Laptop%20Sales/Acer/Laptop-Gaming-Acer-Nitro-5-Eagle-AN515-57-5669-1_pgtm6t.jpg', 17990000.0000, 100, 1, 1, N'i5-11400H', N'GTX 1650 4GB', N'DDR4 8GB 3200MHz', N'512GB', N'4 Cell. 57Whr', N'2.2 Kg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (8, N'Laptop Acer Swift 3 SF314-43-R4X3 R5', N'Mỏng nhẹ, cao cấp, bền bỉ và mang trong mình nguồn sức mạnh đáng tin cậy, Acer Swift 3 SF314-43-R4X3 sẽ nâng tầm trải nghiệm giải trí cũng như hoạt động công việc của bạn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690020965/Laptop%20Sales/Acer/Acer_Swift_3_SF314-43-R4X3-R5-3_eblt7z.webp', 14990000.0000, 100, 1, 2, N'Ryzen 5 5500U', N'Radeon Graphics', N'DDDR4 16GB 4266MHz', N'512GB', N'3 Cell', N'1.19 Kg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (9, N'Laptop Acer Nitro 5 Tiger Gaming AN515-58-52SP', N'Dòng Nitro 5 được yêu thích của Acer nay đã xuất hiện phiên bản mới Tiger 2022. Acer Nitro 5 Tiger AN515-58-52SP được nâng cấp toàn diện về cả thiết kế và hiệu năng, đặc biệt là sức mạnh từ bộ vi xử lý Intel thế hệ thứ 12 hoàn toàn mới, sẽ cùng các game thủ vượt qua mọi giới hạn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690021167/Laptop%20Sales/Acer/Acer-Nitro_5-AN515-58-52SP-9_fis3wl.webp', 22990000.0000, 100, 1, 2, N'i5-12500H', N'RTX 3050 4GB', N'DDR4 8GB 3200MHz', N'512GB', N'4 Cell. 57Whr', N'2.45 Kg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (10, N'Laptop gaming Acer Predator Helios 300 PH315 55 76KG', N'Sức mạnh đến từ NVIDIA GeForce RTX 3060
RTX 3060 sẽ mang lại hiệu suất tối ưu cho game thủ và creator. Chiếc card màn hình được sở hữu sức mạnh bởi kiến trúc Ampere thế hệ 2 của NVIDIA - bao gồm công nghệ Ray Tracing mới, Lõi Tensor và khả năng streaming với bộ xử lý multiprocessor để có một bước nhảy vọt về hiệu năng. ', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690021315/Laptop%20Sales/Acer/Acer-Predator-Helios-300-PH315-55-76KG_nc66lh.webp', 33990000.0000, 100, 1, 3, N'i7-12700H', N'RTX 3060 6GB', N'DDR5 16GB 4800WHz', N'512GB', NULL, N'2.4 Kg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (11, N'Laptop Gaming Acer Aspire 7 A715 42G R05G', N'Laptop gaming tốt nhất phân khúc
Acer Aspire 7 2020 A715 42G tích hợp card đồ họa NVIDIA GTX1650 4GB GDDR6, là laptop chơi game tốt nhất phân khúc. Không chỉ vậy, phiên bản này còn mang thiết kế mới gọn gàng và sexy hơn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690021579/Laptop%20Sales/Acer/Laptop-Gaming-Acer-Aspire-7-A715-42G-R05G_jxdpjq.webp', 14990000.0000, 100, 1, 3, N'Ryzen 5 5500U', N'GTX 1650 4GB', N'DDR4 8GB 3200MHz', N'512GB', N'4 Cell, 48Whr', N'2.1 Kg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (12, N'Laptop Acer Nitro 16 Phoenix AN16-41-R76E', N'Laptop Acer Nitro 16 Phoenix AN16-41-R76E mang đến cho bạn toàn bộ công nghệ mới nhất, vì vậy bạn có thể trò chuyện, duyệt web, stream, chỉnh sửa, ghi âm và chơi game mà không bỏ lỡ nhịp nào.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690021651/Laptop%20Sales/Acer/Laptop-Acer-Nitro-16-Phoenix-AN16-41-R76E_icbnit.jpg', 42490000.0000, 100, 1, 1, N'Ryzen 9 7940HS', N'RTX 4060 8GB', N'DDR5 16GB 4800WHz', N'512GB', N'4 Cell. 57Whr', N'2.7 Kg', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (14, N'MacBook Air 15 inch M2 2023', N'MacBook Air M2 2023 giờ đây sẽ mở ra trải nghiệm hình ảnh rộng lớn hơn khi gia tăng kích cỡ màn hình Liquid Retina lên ngưỡng 15 inch ấn tượng. Độ tương thích tuyệt đối giữa chip M2 và nền tảng macOS đem lại trải nghiệm mượt mà và chuyên nghiệp nhất, giúp phản hồi cực nhanh mọi tác vụ của bạn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690021970/Laptop%20Sales/Mac/macbook-air-m2-2023-15-inch-man-hinh_eolboi.webp', 32290000.0000, 100, 1, 2, N'Apple M2', N'Apple M2 GPU 10x', N'8GB', N'256GB', N'18h', N'1.51 Kg', 9)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (15, N'MacBook Pro 14 inch M2 Pro 2023', N'Trải nghiệm đỉnh cao dành cho người dùng chuyên nghiệp. MacBook 14 Pro 2023 quy tụ loạt công nghệ cao cấp bậc nhất mà Apple nắm giữ như chip M2 Pro cực mạnh, màn hình Liquid Retina XDR lý tưởng cho dân thiết kế, dung lượng RAM 16GB và 1TB bộ nhớ trong. Tất cả hứa hẹn phục vụ bạn trong nhiều năm với hiệu năng thực sự mạnh mẽ không đổi.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690022142/Laptop%20Sales/Mac/Macbook_Pro_14_M2_sfkyzy.webp', 59990000.0000, 25, 1, 2, N'Apple M2 Pro', N'Apple M2 Pro 19-core GPU', N'16GB', N'1TB', N'18h', N'1.6 Kg', 9)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (16, N'MacBook Pro 16 inch M2 Pro 2023', N'Xuất sắc và chuyên nghiệp trên mọi phương diện, phiên bản 32GB RAM của MacBook Pro 16 2023 M2 Pro sẽ giúp bạn có được trải nghiệm nâng cao ở mọi khía cạnh, tạo tiền đề cho chip M2 Pro phát huy tất cả sức mạnh tiềm năng và trình diễn mọi thông tin trên màn hình Liquid Retina XDR tốt nhất thế giới laptop.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690022283/Laptop%20Sales/Mac/macbook-pro-16-2023-m2-pro_esnzcl.webp', 76990000.0000, 25, 1, 2, N'Apple M2 Pro', N'Apple M2 Pro 16-core GPU', N'32GB', N'512GB', N'18h', N'2.15 Kg', 9)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (17, N'Laptop MSI Modern 15 B7M 099VN', N'Được trang bị lên đến Bộ xử lý AMD Ryzen™ 7, Modern 15 B7M cực kỳ nhẹ và mỏng chỉ cần cho vào túi xách của bạn để bạn luôn làm việc hiệu quả và giải trí mọi lúc mọi nơi. Sức mạnh tuyệt vời của nó sẽ luôn tiếp tục và giúp bạn hoàn thành công việc, giống như khả năng sáng tạo của bạn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690127848/Laptop%20Sales/MSI/Laptop-MSI-Modern-15-B7M-099VN_uox8bs.jpg', 11890000.0000, 100, 1, 1, N'Ryzen 5 7530U', N'Radeon Graphics', N'DDR4 8GB 3200MHz', N'512GB', N'3 Cell, 39Whr', N'1.75 Kg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (18, N'Laptop Gaming MSI GF63 Thin 11SC 664VN', N'Laptop Gaming MSI GF63 Thin 11SC 664VN sinh ra để thích nghi, tồn tại và phát triển. Thế hệ mới sở hữu chip i5 11400H và GPU GTX 1650 mới nhất. Intel Core i5 11400H mới nhất tăng cường sức mạnh với hiệu suất tăng lên đến 15% so với thế hệ trước. Tần số lõi đơn cao hơn sẽ tốt hơn cho trải nghiệm chơi game.

 GeForce GTX™ 16 Series có mặt trên những mẫu Laptop Gaming MSI GF63 Thin 11SC 664VN cho game thủ và người sáng tạo nội dung, cùng với đa nhân xử lí streaming giúp đem lại đồ họa siêu chân thực và các tính năng AI tân tiến nhất.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690127902/Laptop%20Sales/MSI/Laptop-Gaming-MSI-GF63-Thin-11SC-664VN_p0x8nj.jpg', 14890000.0000, 100, 1, 1, N'i5-11400H', N'GTX 1650 MaxQ', N'DDR4 8GB 3200MHz', N'512GB', N'3 Cell', N'1.8 Kg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (19, N'Laptop MSI Prestige 13 Evo A13M 081VN', N'Một trong những siêu phẩm laptop học tập làm việc mới nhất đến từ nhà MSI là MSI Prestige 13 Evo A13M 081VN. Sở hữu thiết kế năng động cấu hình mạnh mẽ đến từ con chip gen 13 đáp ứng mọi nhu cầu công việc hằng ngày. MSI Prestige 13 Evo được đầu tư thiết kế nhằm tối ưu trải nghiệm và phục vụ nhu cầu di chuyển mỗi ngày của người dùng. Trọng lượng chỉ khoảng 1.49kg thuận lợi trong việc bỏ vào balo và mang đi cứ lúc nào. Kiểu dáng sang trọng với tông màu xám thời thượng kết hợp từng đường nét chau chuốt tỉ mỉ tạo ra một nét đẹp đầy phong cách. Bắt kịp xu hướng và thị hiếu của các bạn trẻ ngày nay. 

', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690128095/Laptop%20Sales/MSI/Laptop_MSI_Prestige_13_Evo_A13M_081VN_xp4qqf.webp', 29990000.0000, 50, 1, 3, N'i7-1360P', N'Iris Xe Graphics', N'DDR5 16GB 4800WHz', N'1TB', N'4 Cell, 75Whr', N'0.99 Kg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (20, N'Laptop MSI Modern 14 C13M 458VN / 609VN / 610VN', N'ừng sáng cuộc sống của bạn với Modern Series hoàn toàn mới. Mỏng, mạnh mẽ và phong cách - MSI Modern 14 C13M được trang bị mọi thứ để bạn theo đuổi đam mê của mình ngay cả trong công việc và giải trí. Hãy để hiệu suất tuyệt vời của nó giúp bạn chinh phục bất kỳ nhiệm vụ nào và tăng thêm sự tinh tế cho năng suất hàng ngày của bạn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690128247/Laptop%20Sales/MSI/Laptop-MSI-Modern-14-C13M-458VN_jebj4g.jpg', 15790000.0000, 70, 1, 1, N'i5-1335U', N'Iris Xe Graphics', N'DDR4 8GB 3200MHz', N'512GB', N'3 Cell, 39.3Whr', N'1.4 Kg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (21, N'Laptop Gaming MSI Katana 15 B13VFK 676VN', N'Bảo vệ danh dự và đánh bại kẻ thù, đánh thức sức mạnh bên trong bạn và kế thừa ý chí của Rồng. Trong tay bạn là "thanh kiếm" của Rồng, chứa đựng sức mạnh cổ xưa và được khắc bằng những chữ rune của gió. Hạ gục bất kỳ kẻ thù nào cản đường bạn bằng thanh kiếm huyền thoại Laptop Gaming MSI Katana 15 B13VFK 676VN. Laptop Gaming MSI Katana 15 B13VFK 676VN với bộ xử lý Intel® Core™ i7 thế hệ thứ 13 được trang bị, xây dựng trên kiến trúc lõi lai cải tiến, 6 lõi Hiệu suất và 4 lõi Hiệu quả, giúp xử lý đa nhiệm tốt hơn và chạy các trò chơi đòi hỏi khắt khe.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690128331/Laptop%20Sales/MSI/Laptop-Gaming-MSI-Katana-15-B13VFK-676VN-1_gxumvy.jpg', 32290000.0000, 70, 1, 1, N'i7-13620H', N'RTX 4060 8GB', N'DDR5 16GB 5200WHz', N'1TB', N'3 Cell, 53.5Whr', N'2.25 Kg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (22, N'Laptop MSI Creator Z17 HX Studio A13VGT 068VN', N'Laptop MSI Creator Z17 HX Studio A13VGT 068VN dựa trên triết lý thiết kế lấy con người làm trọng tâm, áp dụng tỷ lệ vàng trong thiết kế sản phẩm với công nghệ tiên tiến hàng đầu. Nó là bước ngoặt mới của công nghệ kết hợp với nghệ thuật.  Với bộ vi xử lý Intel Core i7 thế hệ 13 mới nhất, MSI Creator Z17 HX Studio A13VGT 068VN cung cấp tần số turbo lõi kép lên đến 5.0 GHz, mang đến cho bạn sức mạnh đa thế hệ để đáp ứng các tác vụ xử lý đa nhiệm và chuyên nghiệp của bạn. MSI Creator Z17 mang đến cho bạn nhiều thời gian hơn để theo đuổi nàng thơ lý của mình.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690128502/Laptop%20Sales/MSI/Laptop_MSI_Creator_Z17_HX_Studio_A13VGT_068VN_jd5gjy.webp', 72490000.0000, 30, 1, 3, N'i7-13700HX', N'RTX 4070 8GB', N'DDR5 32GB 5600WHz', N'2TB', N'4 Cell, 90Whr', N'2.49 Kg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (23, N'Laptop MSI Modern 14 C13M 611VN', N'MSI Modern 14 là dòng laptop cho sinh viên được nhiều bạn lựa chọn trong việc đồng hành trong mọi công việc và học tập. Và mẫu máy MSI Modern 14 C13M 611VN được ra mắt với thiết kế di động cao cùng bộ cấu hình mạnh mẽ đáp ứng nhiều tác vụ hằng ngày. Nếu bạn đang tìm kiếm một chiếc laptop hoàn hảo thì có thể tham khảo ngay sản phẩm nhà MSI này cùng GEARVN nhé!', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690128729/Laptop%20Sales/MSI/Laptop_MSI_Modern_14_C13M_611VN_iz0abf.webp', 16490000.0000, 20, 1, 3, N'i5-1335U', N'Iris Xe Graphics', N'DDR4 8GB 3200MHz', N'512GB', N'3 Cell, 39.3Whr', N'1.4 Kg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (24, N'Laptop Gaming MSI Raider GE78 HX 13VH 076VN', N'Laptop Gaming MSI Raider GE78 HX 13VH 076VN kết hợp giữa sang trọng, công nghệ tiên tiến và hiệu năng đỉnh cao, Laptop Gaming MSI Raider GE78 HX 13VH 076VN là đỉnh cao của laptop gaming. Với bộ vi xử lý Intel ® Core ™ i9-13950HX thế hệ thứ 13 mới nhất 2023 có hiệu năng mạnh nhất thời điểm hiện tại. Mang kèm sức mạnh quái vật của card đồ họa NVIDIA ® GeForce RTX ™ 4080. Tính thẩm mỹ sang trọng mang đến bởi Mystic Light. Laptop Gaming MSI Raider GE78 HX 13VH 076VN tái sinh siêu phẩm laptop gaming mạnh mẽ nhất.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690128866/Laptop%20Sales/MSI/Laptop-Gaming-MSI-Raider-GE78-HX-13VH-076VN_wmru9n.jpg', 104490000.0000, 10, 1, 1, N'i9-13950HX', N'RTX 4080 GDDR6 12GB', N'DDR5 64GB 4800WHz', N'4TB', N'4 Cell, 99.9Whr', N'3.1 Kg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (25, N'Laptop Gaming MSI Raider GE77 HX 12UGS 230VN', N'Du hành xuyên thời gian và không gian với hiệu suất tối ưu và thiết kế không thể cưỡng lại. Laptop Gaming MSI Raider GE77 HX 12UGS 230VN đi kèm với bộ xử lý Intel ® Core ™ i9-12900HX mới nhất. Card đồ họa NVIDIA ® GeForce RTX ™ 30 series cho trải nghiệm chơi game tốt nhất mà bạn có thể tưởng tượng. Với bộ vi xử lý Intel ® Core ™ i9-12900HX mới nhất đi kèm với 16 nhân 24 luồng. Laptop Gaming MSI Raider GE77 HX 12UGS 230VN mang đến sức mạnh chưa từng có cho công việc đa nhiệm và các trò chơi đòi hỏi hiệu năng cao của bạn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690128934/Laptop%20Sales/MSI/Laptop-Gaming-MSI-Raider-GE77-HX-12UGS-230VN_pnkqor.jpg', 59990000.0000, 20, 1, 1, N'i9-12900HX', N'RTX 3070Ti 8GB', N'DDR5 32GB 4800WHz', N'2TB', N'4 Cell, 99.9Whr', N'2.9 Kg', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (26, N'Laptop Dell Inspiron 15 N3520', N'Dell Inspiron N3520 là chiếc laptop lý tưởng cho công việc hàng ngày. Bộ vi xử lý Intel Core i5 thế hệ thứ 12 hiệu suất cao, màn hình lớn 15,6 inch Full HD 120Hz mượt mà, thiết kế bền bỉ sẽ giúp bạn giải quyết công việc nhanh chóng mọi lúc mọi nơi.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690129266/Laptop%20Sales/DELL/Laptop_Dell_Inspiron_15_5320.webp', 16190000.0000, 60, 1, 2, N'i5-1235U', N'Iris Xe Graphics', N'DDR4 8GB 2666MHz', N'256GB', N'41Whr', N'1.9 Kg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (27, N'Laptop gaming Dell G15 5530 i7H165W11GR4050', N'Laptop gaming Dell G15 5530 i7H165W11GR4050 là sản phẩm nằm trong phân khúc trên laptop gaming cao cấp 30 triệu và là thế hệ chơi game tiếp theo của Dell. Vốn nổi tiếng với những chiếc laptop văn phòng thì nay Dell mang đến cho game thủ một lựa chọn mới đầy tính năng, cấu hình mạnh mẽ và đương đầu với vô số tựa game dễ dàng.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690129422/Laptop%20Sales/DELL/Laptop_gaming_Dell_G15_5530_i7H165W11GR4050_vsdo7e.webp', 38990000.0000, 50, 1, 3, N'i7-13650HX', N'RTX 4050 6GB', N'DDR5 16GB 4800WHz', N'512GB', N'3 Cell, 56Whr', N'2.81 Kg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (28, N'Laptop Dell Inspiron 14 N5420 i5U085W11SLU', N'Là một trong những cái tên quen thuộc trong làng laptop mỏng nhẹ, cao cấp, Dell lại cho ra mắt một sản phẩm mới thuộc phân khúc laptop văn phòng. Sở hữu ngoại hình thu hút và hiệu năng ổn định, Dell Inspiron 14 5420 i5U085W11SLU hứa hẹn trở thành cái tên hot mới cho người dùng trong thời gian tới.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690129598/Laptop%20Sales/DELL/Laptop_Dell_Inspiron_14_N5420_i5U085W11SLU_amdx4x.png', 20990000.0000, 80, 1, 3, N'i5-1235U', N'UHD Graphics', N'DDR4 8GB 3200MHz', N'512GB', N'4 Cell. 54Whr', N'1.55 Kg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (29, N'Laptop Dell Inspiron 16 5620 N6I5003W1 Silver', N'Tùy theo nhiều nhu cầu khác nhau mà có nhiều dòng sản phẩm laptop Dell khác nhau. Nếu bạn đang tìm một chiếc laptop phục vụ cho nhu cầu học tập và làm việc hằng ngày thì Dell Inspiron 16 5620 N6I5003W1 Silver sẽ là người bạn đồng hành cực tốt. cấu hình mạnh mẽ trên thiết kế đơn giản mang lại hiệu năng giải quyết mọi công việc mượt mà, nhanh chóng. ', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690129671/Laptop%20Sales/DELL/Laptop_Dell_Inspiron_16_5620_N6I5003W1_Silver_qy6mr9.png', 25990000.0000, 80, 1, 3, N'i5-1240P', N'MX570 2GB', N'DDR4 16GB 3200MHz', N'512GB', N'4 Cell. 54Whr', N'1.87 Kg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (30, N'Laptop Dell Inspiron T7420 N4I5021W Silver', N'Laptop Dell Inspiron T7420 N4I5021W là một siêu phẩm mới đến từ nhà Dell. Ở phân khúc laptop văn phòng, Dell Inspiron T7420 đã hoàn thành xuất sắc nhiệm vụ của mình khi có thể thực hiện đa nhiệm tốt, hiệu năng ổn định, chất lượng hiển thị hình ảnh đẹp mắt và thiết kế sang trọng, tinh tế. Đây chính là sự lựa chọn thích hợp cho những ai yêu thích sự mới mẻ, năng động và tinh tế.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690129762/Laptop%20Sales/DELL/Laptop_Dell_Inspiron_T7420_N4I5021W_Silver_cidcns.webp', 23990000.0000, 80, 1, 3, N'i5-1235U', N'Iris Xe Graphics', N'DDR4 8GB 3200MHz', N'512GB', N'4 Cell. 54Whr', N'1.57 Kg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (31, N'Laptop gaming Dell G15 5511 P105F006 70283448', N'Laptop gaming Dell G15 5511 P105F006 70283448 là sản phẩm nằm trong phân khúc laptop gaming trên 30 triệu và là thế hệ chơi game tiếp theo của Dell. Vốn nổi tiếng với những chiếc laptop văn phòng thì nay Dell mang đến cho game thủ một lựa chọn mới đầy tính năng, cấu hình mạnh mẽ và đương đầu với vô số tựa game dễ dàng. ', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690129882/Laptop%20Sales/DELL/Laptop_gaming_Dell_G15_5511_P105F006_70283448_femhlu.webp', 32490000.0000, 50, 1, 3, N'i7-11800H', N'RTX 3060 6GB', N'DDR4 16GB 3200MHz', N'512GB', N'6 Cell, 86Whr', N'2.65 Kg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (32, N'Laptop gaming Dell Alienware M15 R7 I7H165W11GR3050Ti', N'Một trong những dòng laptop gaming cao cấp được yêu thích nhất hiện nay với vẻ ngoài đặc biệt cùng cấu hình mạnh mẽ, đây cũng là đứa con của thương hiệu Dell nổi tiếng với dòng laptop văn phòng, đó chính là Alienware. Hôm nay GEARVN sẽ đem đến cho bạn chiếc laptop Dell Alienware M15 R7 I7H165W11GR3050Ti, hãy cùng xem “người ngoài hành tinh” sẽ được trang bị những gì cho game thủ chúng ta nhé!', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690129981/Laptop%20Sales/DELL/Laptop_gaming_Dell_Alienware_M15_R7_I7H165W11GR3050Ti_wk60q9.webp', 39000000.0000, 25, 1, 3, N'i7-12700H', N'RTX 3050Ti 4GB', N'DDR5 16GB 4800WHz', N'512GB', N'6 Cell, 86Whr', N'2.69 Kg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (33, N'Laptop gaming Dell G15 5520 P105F008 71000334', N'Laptop gaming Dell G15 5520 P105F008 71000334 là sản phẩm nằm trong phân khúc laptop gaming trên 30 triệu và là thế hệ chơi game tiếp theo của Dell. Vốn nổi tiếng với những chiếc laptop văn phòng thì nay Dell mang đến cho game thủ một lựa chọn mới đầy tính năng, cấu hình mạnh mẽ và đương đầu với vô số tựa game dễ dàng.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690130057/Laptop%20Sales/DELL/Laptop_gaming_Dell_G15_5520_P105F008_71000334_iia3bu.webp', 39990000.0000, 30, 1, 3, N'i7-12700H', N'RTX 3060 6GB', N'DDR5 16GB 4800WHz', N'512GB', N'6 Cell, 86Whr', N'2.67 Kg', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (34, N'Laptop HP Victus 15 fa0115TX 7C0X1PA', N'Laptop HP Victus 15 fa0115TX 7C0X1PA sẽ đáp ứng mọi nhu cầu chơi game của bạn. Được trang bị CPU lên tới Intel® Core™ i5 thế hệ 12th, VGA NVIDIA® GeForce RTX™ mạnh mẽ cùng hệ thống tản nhiệt đã được nâng cấp. Cùng với đó là độ phân giải cao, màn hình nhanh và OMEN Gaming Hub đều có trên Laptop HP Victus 15 fa0115TX 7C0X1PA.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690130208/Laptop%20Sales/HP/Laptop-HP-Victus-15-fa0115TX-7C0X1PA-1_jkmmxl.jpg', 19990000.0000, 100, 1, 1, N'i5-12500H', N'RTX 3050', N'DDR4 8GB 3200MHz', N'512GB', N'4 Cell, 70Whr', N'2.33 Kg', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (35, N'Laptop HP Victus 15 fa0111TX 7C0R4PA', N'Laptop HP Victus 15 fa0111TX 7C0R4PA sẽ đáp ứng mọi nhu cầu chơi game của bạn. Được trang bị CPU lên tới Intel® Core™ i5 thế hệ 12th, VGA NVIDIA® GeForce RTX™ mạnh mẽ cùng hệ thống tản nhiệt đã được nâng cấp. Cùng với đó là độ phân giải cao, màn hình nhanh và OMEN Gaming Hub đều có trên Laptop HP Victus 15 fa0111TX 7C0R4PA.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690130347/Laptop%20Sales/HP/Laptop-HP-Victus-15-fa0111TX-7C0R4PA_eotd9v.jpg', 25190000.0000, 75, 1, 1, N'i5-12500H', N'RTX 3050Ti', N'DDR4 16GB 3200MHz', N'512GB', N'4 Cell, 70Whr', N'2.31 Kg', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (36, N'Laptop HP Envy 13 BA1536TU 4U6M5PA', N'Laptop HP Envy 13 BA1536TU 4U6M5PA ra mắt vào năm 2021, là một gương mặt mới trong làng laptop văn phòng trứ danh của nhà HP. Envy 13 BA1536TU sở hữu một thiết kế trẻ trung, năng động chắc chắn sẽ mang đến cho bạn sự tự tin nhất khi cầm trên tay. Đây là chiếc laptop kết hợp hoàn hảo của một chiếc laptop văn phòng với thời trang hiện đại. ', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690130456/Laptop%20Sales/HP/Laptop_HP_Envy_13_BA1536TU_4U6M5PA_nsvgcm.webp', 21990000.0000, 80, 1, 3, N'i5-1135G7', N'Iris Xe Graphics', N'DDR4 8GB 3200MHz', N'512GB', N'3 Cell, 51Whr', N'1.3 Kg', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (37, N'Laptop HP ProBook 450 G8 614K3PA', N'Laptop có kiểu dáng bắt mắt với thân máy siêu mỏng, hoàn thiện từ vỏ nhôm nguyên khối sang trọng. Phiên bản màu bạc thời trang, logo HP nổi bật bóng bẩy cùng viền màn hình mỏng hai cạnh thể hiện sự hiện đại và thời thượng. Tuy mỏng nhẹ nhưng chiếc máy này bền bỉ với khả năng chống sốc và chống va đập tối ưu, sử dụng được trong thời gian lâu dài.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690130558/Laptop%20Sales/HP/Laptop_HP_ProBook_450_G8_614K3PA_rjydeb.webp', 19990000.0000, 75, 1, 3, N'i5-1135G7', N'Iris Xe Graphics', N'DDR4 8GB 3200MHz', N'512GB', N'3 Cell, 45Whr', N'1.74 Kg', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (38, N'Laptop HP Spectre x360 14 ef0030TU 6K773PA', N'Được đánh giá là một trong những phân khúc cao cấp của dòng laptop văn phòng, laptop HP Spectre luôn được người dùng tin dùng khi muốn tìm kiếm một chiếc laptop cao cấp để phục vụ nhu cầu sử dụng của mình. Và một lần nữa HP Spectre x360 14 ef0030TU 6K773PA không làm người dùng thất vọng khi có thể tiếp nối mọi đặc điểm nổi bật của những người anh em tiền nhiệm.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690130754/Laptop%20Sales/HP/Laptop_HP_Spectre_x360_14_ef0030TU_6K773PA_dnnug6.webp', 51990000.0000, 20, 1, 3, N'i7-1255U', N'Iris Xe Graphics', N'DDR4 16GB 4266WHz', N'1TB', N'4 Cell. 66Whr', N'1.36 Kg', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (39, N'Laptop HP Omen 16 n0087AX 7C0T7PA', N'Laptop HP Omen 16 n0087AX 7C0T7PA sẽ đáp ứng mọi nhu cầu chơi game của bạn. Được trang bị CPU AMD R7 6800H và VGA NVIDIA® GeForce RTX™ mạnh mẽ cùng hệ thống tản nhiệt đã được nâng cấp. Cùng với đó là độ phân giải cao, màn hình nhanh và OMEN Gaming Hub đều có trên sản phẩm này.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690130888/Laptop%20Sales/HP/Laptop-HP-Omen-16-n0087AX-7C0T7PA_woyknz.jpg', 43990000.0000, 50, 1, 1, N'Ryzen 7 6800H', N'RTX 3060 6GB', N'DDR5 16GB 4800WHz', N'1TB', NULL, N'2.34 Kg', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (40, N'Laptop HP Omen 16 n0086AX 7C0T5PA', N'Laptop HP Omen 16 n0086AX 7C0T5PA sẽ đáp ứng mọi nhu cầu chơi game của bạn. Được trang bị CPU AMD R7 6800H và VGA NVIDIA® GeForce RTX™ mạnh mẽ cùng hệ thống tản nhiệt đã được nâng cấp. Cùng với đó là độ phân giải cao, màn hình nhanh và OMEN Gaming Hub đều có trên sản phẩm này.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690130991/Laptop%20Sales/HP/Laptop-HP-Omen-16-n0086AX-7C0T5PA_vp2qys.jpg', 53890000.0000, 35, 1, 1, N'Ryzen 9 6900HX', N'RTX 3070Ti 8GB', N'DDR5 32GB 4800WHz', N'1TB', NULL, N'2.34 Kg', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (41, N'Laptop Lenovo ThinkBook 14 G3', N'Với giá bán chưa tới 10 triệu đồng, Lenovo ThinkBook 14 G3 ACL là chiếc laptop sinh viên cực kì nổi trội vì máy sở hữu phần cứng mạnh mẽ có thể đáp ứng tốt các nhu cầu sử dụng phổ thông hàng ngày của các bạn sinh viên. Từ việc làm bài tập trên các phần mềm riêng biệt cho đến xử lí các file tài liệu nhiều trang của những ứng dụng văn phòng phổ thông hay thậm chí là xem những bộ phim Full HD trên dịch vụ phát sóng Netflix, các bạn sinh viên sẽ thấy thỏa mãn khi có chiếc laptop Lenovo này trong tay.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690131363/Laptop%20Sales/Lenovo/Lenovo_ThinkBook_14_G3_ACL_1_orqzlk.webp', 8490000.0000, 75, 1, 2, N'Ryzen 3 5300U', N'Radeon Graphics', N'DDR4 8GB 3200MHz', N'512GB', N'45Whr', N'1.4 Kg', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (42, N'Laptop Lenovo Yoga Slim 7 Pro 14IHU5', N'Bạn cần một chiếc laptop màn hình thật sự đỉnh, hiệu năng xuất sắc nhưng vẫn đảm bảo thời trang và nhỏ gọn. Lenovo Yoga Slim 7 Pro 14IHU5 O sẽ khiến bạn phải kinh ngạc với màn hình OLED 2.8K tuyệt mỹ cùng sự sang trọng và sức mạnh vượt trội.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690131542/Laptop%20Sales/Lenovo/Laptop_Lenovo_Yoga_Slim_7_Pro-4._tqyazr.webp', 18990000.0000, 75, 1, 2, N'i5-11320H', N'Iris Xe Graphics', N'DDR4 16GB 4266WHz', N'512GB', N'61Whr', N'1.38 Kg', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (43, N'Laptop Lenovo IdeaPad 5 15ABA7', N'Lenovo IdeaPad 5 15ABA7 là thế hệ thứ 7 của dòng laptop sinh viên giá rẻ nổi tiếng IdeaPad, được trang bị sức mạnh hoàn toàn mới của chip AMD Ryzen; khả năng xử lý đồ họa xuất sắc; thiết kế mỏng nhẹ, bền bỉ; màn hình và webcam tuyệt đẹp, cho bạn một sản phẩm đáng tin cậy trong học tập, công việc.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690131701/Laptop%20Sales/Lenovo/Laptop_Lenovo_IdeaPad_5_15ABA7_p1faag.webp', 13490000.0000, 80, 1, 2, N'Ryzen 5 5625U', N'Radeon Graphics', N'DDR4 8GB 3200MHz', N'512GB', N'57Whr', N'1.85 Kg', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (44, N'Laptop Lenovo Ideapad Gaming 3 15IAH7', N'Laptop Lenovo Ideapad Gaming 3 15IAH7 82S9006YVN làm việc hoặc giải trí cả ngày và đêm với Bộ xử lý AMD Ryzen ™ 6000 Series hoặc Intel™ Gen 12 mới nhất. Trải nghiệm giải trí đỉnh cao với GPU NVIDIA ® GeForce RTX ™. Luôn mát mẻ, yên tĩnh với hệ thống làm mát Quad Vent cải tiến. Màn hình 15,6 inch FHD với tốc độ khu hình cao và độ chính xác màu đáng kinh ngạc. Dung lượng bộ nhớ DDR5 dồi dào và không gian lưu trữ rộng, xứng tầm với tương lai của bạn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690131869/Laptop%20Sales/Lenovo/Laptop-Lenovo-Ideapad-Gaming-3-15IAH7-82S9006YVN_axuehg.jpg', 18890000.0000, 100, 1, 1, N'i5-12500H', N'RTX 3050 4GB', N'DDR4 8GB 3200MHz', N'512GB', N'60Whr', N'2.315 Kg', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (45, N'Laptop Lenovo Legion 5 15ARH7 82RE0036VN', N'Lenovo Legion 5 15ARH7 82RE0036VN nhắm trọn mục tiêu nhờ CPU Intel Core i thế hệ 12 mới nhất. Thưởng thức đồ họa AAA với GPU NVIDIA® GeForce RTX ™ 30 series. Trải nghiệm hiệu suất thế hệ tiếp theo từ Ram DDR5. Thực hiện phản xạ nhanh trên màn hình 15,6 inch với độ phân giải lên đến FHD & tốc độ làm mới 165Hz. Ép xung trò chơi của bạn mà không bị kiệt sức với tính năng làm mát Legion Coldfront 4.0.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690131975/Laptop%20Sales/Lenovo/Laptop-Lenovo-Legion-5-15ARH7-82RE0036VN_w3zlyq.jpg', 27990000.0000, 85, 1, 1, N'Ryzen 7 6800H', N'RTX 3050Ti 4GB', N'DDR5 16GB 4800WHz', N'512GB', N'4 Cell, 80Whr', N'2.35 Kg', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (46, N'Laptop Gaming Lenovo LOQ 15IRH8 82XV00D5VN', N'Laptop Gaming Lenovo LOQ 15IRH8 82XV00D5VN mẫu laptop thuốc seri LOQ – một cái tên rất mất sẽ được Lenovo ra mắt trong thời gian sắp tới. Mặc dù là một sản phẩm mới nhưng bạn sẽ thấy mẫu laptop này rất quen bởi lẽ nó mang trong mình DNA của dòng Legion được Lenovo đem xuống chuỗi sản phẩm này. Cũng có thể nói Laptop Gaming Lenovo LOQ 15IRH8 82XV00D5VN sẽ là sản phẩm thay thế dòng Ideapad Gaming trước kia của Lenovo.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690132091/Laptop%20Sales/Lenovo/Laptop-Lenovo-LOQ-15IRH8-82XV00D5VN_yckwrg.jpg', 32990000.0000, 50, 1, 1, N'i7-13620H', N'RTX 4060 8GB', N'DDR5 16GB 5200WHz', N'512GB', N'60Whr', N'2.4 Kg', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (47, N'Laptop Legion Slim 5 16IRH8 82YA00BSVN', N'Lenovo Legion Slim 5 là dòng laptop gaming mới nhất của Lenovo. Với thiết kế mỏng nhẹ và hiệu năng mạnh mẽ, Laptop Legion Slim 5 16IRH8 82YA00BSVN hứa hẹn mang đến trải nghiệm chơi game và làm việc tuyệt vời.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690132175/Laptop%20Sales/Lenovo/Laptop-Legion-Slim-5-16IRH8-82YA00BSVN_hzrhl8.jpg', 38990000.0000, 72, 1, 1, N'i5-13500H', N'RTX 4050 6GB', N'DDR5 8GB 5200WHz', N'512GB', N'80Whr', N'2.4 Kg', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (48, N'Laptop Gaming Gigabyte G5 GD-51VN123SO', N'Trang bị cho Laptop Gigabyte G5 GD-51VN123SO con chip Intel Core i5-11400H, với tốc độ xử lý tối đa đạt 4.5GHz sẻ giúp bạn tối ưu tốc độ xử lý các tác vụ từ công việc đến giải trí. Kết hợp cùng 16GB RAM đem lại khả năng đa tác vụ mượt mà, cho bạn có thể làm nhiều công việc cùng lúc; 512GB SSD cung cấp cho bạn không gian lưu trữ tài liệu khổng lồ cùng tốc độ khởi động máy nhanh.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690132320/Laptop%20Sales/Gigabyte/Laptop-Gigabyte-G5-GD-51VN123SO_ucr0zo.jpg', 17490000.0000, 100, 1, 1, N'i5-11400H', N'RTX 3050 4GB', N'DDR4 16GB 3200MHz', N'512GB', N'150Whr', N'2.2 Kg', 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (49, N'Laptop Gaming Gigabyte G5 ME-51VN263SH', N'Laptop Gigabyte G5 ME-51VN263SH trang bị bộ vi xử lý intel Core thế hệ 12th với hiệu suất vượt trội cho phép thực hiện các tác vụ hàng ngày nhanh chóng và mượt mà. Để bạn có thể tự do sáng tạo nội dung, livestream hay chơi game bất cứ khi nào bạn muốn.

Trang bị GPU GeForce RTX 30 Series cho Laptop Gigabyte G5 ME-51VN263SH giúp nó mang lại hiệu suất tối thượng cho game thủ và nhà sáng tạo video. Card hoạt động trên nền tảng Ampere, Kiến trúc RTX thế hệ thứ 2 của NVIDIA với nhân RT, nhân Tensor và bộ đa xử lý phát trực tuyến mới, cung cấp đồ họa dò tia chân thực nhất và các tính năng AI tiên tiến.

Laptop Gigabyte G5 ME-51VN263SH với Wifi thế hệ thứ 6 mang lại trải nghiệm cực kỳ mượt mà khi chơi game củng như truy xuất dữ liệu đám mây, đem lại độ trễ khi truy cập mạng đến mức tổi thiểu.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690132400/Laptop%20Sales/Gigabyte/Laptop-Gigabyte-G5-ME-51VN263SH_mc4jfa.jpg', 20490000.0000, 100, 1, 1, N'i5-12500H', N'RTX 3050Ti 4GB', N'DDR4 8GB 3200MHz', N'512GB', N'54Whr', N'1.94 Kg', 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (50, N'Laptop gaming Gigabyte G7 KE 52VN263SH', N'GIGABYTE, thương hiệu đi lên với những sản phẩm linh kiện máy tính chất lượng như mainboard, VGA, nguồn máy tính,... Hướng đến thị trường gaming đang vô cùng sôi động, GIGABYTE còn mang đến những chiếc laptop gaming chất lượng. Và nay sẽ là chiếc laptop với tên Gigabyte G7 KE 52VN263SH đến từ nhà GIGABYTE. ', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690132528/Laptop%20Sales/Gigabyte/Laptop_gaming_Gigabyte_G7_KE_52VN263SH_ydt6mp.webp', 27490000.0000, 78, 1, 3, N'i5-12500H', N'RTX 3060 6GB', N'DDR4 8GB 3200MHz', N'512GB', N'54Whr', N'2.49 Kg', 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (51, N'Laptop Gaming Gigabyte AORUS 15 9MF-E2VN583SH', N'Laptop Gigabyte AORUS 15 9MF-E2VN583SH trang bị vi xử lí Intel Core thế hệ 12 mới nhất với khả năng phát huy hiệu suất tối đa trong việc xử lí game, phần mềm công việc và tác vụ đa nhiệm.

', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690132619/Laptop%20Sales/Gigabyte/Laptop-Gigabyte-AORUS-15-9MF-E2VN583SH_wkqg0t.jpg', 27990000.0000, 49, 1, 1, N'i5-12500H', N'RTX 4050 6GB', N'DDR5 8GB 4800WHz', N'512GB', N'99Whr', N'2.25 Kg', 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (52, N'Laptop Gaming Gigabyte AORUS 5 KE4-72VN314SH', N'Máy tính xách tay chơi game Laptop Gigabyte AORUS 5 KE4-72VN314SH được thiết kế dành cho những game thủ sành sỏi. Với bộ vi xử lý Intel Core i7 thế hệ thứ 12 mới nhất, hiệu năng ấn tượng cho phép game thủ thể hiện tất cả các kỹ năng của mình. Được trang bị màn hình tốc độ làm mới cao 240Hz, có thể đánh bại tất cả các đối thủ một cách chính xác.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690132686/Laptop%20Sales/Gigabyte/Laptop-Gigabyte-AORUS-5-KE4-72VN314SH-1_nj9sak.jpg', 35990000.0000, 52, 1, 1, N'i7-12700H', N'RTX 3070Ti 8GB', N'DDR4 16GB 3200MHz', N'1TB', N'99Whr', N'2.4 Kg', 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (53, N'Laptop Gigabyte AERO 17 XE5-73VN744AH', N'Laptop Gigabyte AERO 17 XE5-73VN744AH trang bị bộ xử lý Intel Core H-series 12th mới nhất với hiệu suất lớn hơn 35% so với thế hệ trước, việc giảm thời gian xử lý sẽ là chìa khóa để các cảm hứng sáng tạo trở nên hiệu quả hơn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690132746/Laptop%20Sales/Gigabyte/Laptop-Gigabyte-AERO-17-XE5-73VN744AH_vnddfl.jpg', 39990000.0000, 54, 1, 1, N'i7-12700H', N'RTX 3070Ti 8GB', N'DDR5 32GB 4800WHz', N'1TB', N'99Whr', N'2.6 Kg', 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (54, N'Laptop Gigabyte AERO 16 XE5 73VN938AH', N'Laptop Gaming AERO 16 trang bị bộ xử lý Intel Core H-series 12th mới nhất với hiệu suất lớn hơn 35% so với thế hệ trước, việc giảm thời gian xử lý sẽ là chìa khóa để các cảm hứng sáng tạo trở nên hiệu quả hơn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690132844/Laptop%20Sales/Gigabyte/Laptop_Gigabyte_AERO_16_XE5_73VN938AH_r3x1q3.webp', 45990000.0000, 39, 1, 3, N'i7-12700H', N'RTX 3070Ti 8GB', N'DDR5 16GB 4800WHz', N'2TB', N'4 Cell, 99Whr', N'2.3 Kg', 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (55, N'Microsoft Surface Laptop Go i5', N'Nếu bạn đang tìm kiếm một chiếc laptop sinh viên và văn phòng nhỏ gọn, mỏng, nhẹ, sang chảnh và xịn xò nhưng mức giá lại dễ tiếp cận thì Microsoft Surface Laptop Go là một trong những lựa chọn tốt nhất mà bạn không thể bỏ qua.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690133092/Laptop%20Sales/Surface/Microsoft_Surface_Laptop_Go_i5_ji1gk0.webp', 14890000.0000, 60, 1, 2, N'i5-1035G1', N'UHD Graphics', N'DDR4 8GB 3733MHz', N'128GB', N'4 Cell', N'1.1 Kg', 8)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (56, N'Laptop Microsoft Surface Pro 9 i7', N'Không chỉ là một sản phẩm chuyên nghiệp cho công việc và sáng tạo, Microsoft Surface Pro 9 còn khơi nguồn cảm hứng trong bạn với thiết kế linh hoạt độc đáo. Hiệu suất đỉnh cao từ bộ vi xử lý Intel Core i7 gen 12 sẽ giúp mọi thứ được hoàn thành trong chớp mắt.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690133164/Laptop%20Sales/Surface/Laptop_Microsoft_Surface_Pro_9_i7_rhhaid.webp', 44990000.0000, 50, 1, 2, N'i7-1235U', N'Iris Xe Graphics', N'DDR5 16GB 4800WHz', N'256GB', N'47.7Whr', N'0.879 Kg', 8)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (57, N'Laptop Microsoft Surface Pro 9 i5', N'Một chiếc laptop mạnh mẽ hay một chiếc máy tính bảng linh hoạt, dù trong bất cứ vai trò nào, Microsoft Surface Pro 9 vẫn thể hiện vô cùng xuất sắc, cho bạn sản phẩm có hiệu suất cao, thời lượng pin cả ngày và một thiết kế cực chất mà ai cũng phải ngước nhìn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690133258/Laptop%20Sales/Surface/Laptop_Microsoft_Surface_Pro_9_i5_hzdicw.webp', 29990000.0000, 50, 1, 2, N'i5-1235U', NULL, N'DDR5 8GB 4800WHz', N'256GB', N'47.7Whr', N'0.879 Kg', 8)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (58, N'Đế tản nhiệt Cooler Master NOTEPAL CMC3', N'Quạt làm mát 200mm trên Đế tản nhiệt Cooler Master NOTEPAL CMC3 giữ cho laptop của bạn luôn mát khi chạm vào, nhưng gần như im lặng. Giá đỡ chống trượt phía trước để ngăn máy tính xách tay của bạn bị trượt khỏi Đế tản nhiệt Cooler Master NOTEPAL CMC3. Làm việc và chơi trên laptop của bạn trong thời gian dài mà không làm căng cơ cổ, lưng và cổ tay. Được thiết kế công thái học để có góc nhìn và gõ tốt hơn khi so sánh với không có miếng làm mát. Đế tản nhiệt Cooler Master NOTEPAL CMC3 Tuyệt vời cho công việc ở nhà hoặc trong văn phòng.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690133730/Laptop%20Sales/%C4%90%E1%BA%BF%20t%E1%BA%A3n%20nhi%E1%BB%87t/CMC3_2_compressed_v1hcyf.jpg', 190000.0000, 200, 2, 1, NULL, NULL, NULL, NULL, NULL, N'0.55 Kg', 14)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (59, N'Đế tản nhiệt Cooler Master NOTEPAL L1', N'Thiết kế siêu mỏng và nhẹ dễ dàng vận chuyển. Thiết kế công thái học cho góc nhìn đánh máy tốt nhất. Quạt làm mát yên lặng 160mm với luồng gió vượt trội mang đến hiệu suất tản nhiệt xuất sắc. Bề mặt phủ lưới kim loại toàn bộ và thiết kế hút gió khí động học hiệu quả', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690133871/Laptop%20Sales/%C4%90%E1%BA%BF%20t%E1%BA%A3n%20nhi%E1%BB%87t/notepal-l1_g1-image_compressed_rnovyb.jpg', 330000.0000, 250, 2, 1, NULL, NULL, NULL, NULL, NULL, N'0.55 Kg', 14)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (60, N'Đế tản nhiệt Cooler Master NOTEPAL X150 Spectrum', N'Đế tản nhiệt Cooler Master NOTEPAL X150 Spectrum của Cooler Master là sự kết hợp của hiệu năng, vẻ ngoài, và chức năng bên trong bộ tản nhiệt hoàn hảo cho thiết bị di động của bạn. Được thiết kế với lưới kim loại và độ nghiêng lý tưởng, nó giúp bạn có được sự ổn định cũng như tạo luồng gió tối đa đem lại khả năng tiêu tán nhiệt hiệu quả.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690133939/Laptop%20Sales/%C4%90%E1%BA%BF%20t%E1%BA%A3n%20nhi%E1%BB%87t/x150-spectru-gallery-1-image_compressed_v41cyd.jpg', 1050000.0000, 186, 2, 1, NULL, NULL, NULL, NULL, NULL, N'0.55 Kg', 14)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (61, N'Đế tản nhiệt Cooler Master NOTEPAL X150R', N'Đế tản nhiệt Cooler Master NOTEPAL X150R của Cooler Master là sự kết hợp của hiệu năng, vẻ ngoài, và chức năng bên trong bộ tản nhiệt hoàn hảo cho thiết bị di động của bạn. Được thiết kế với lưới kim loại và độ nghiêng lý tưởng, nó giúp bạn có được sự ổn định cũng như tạo luồng gió tối đa đem lại khả năng tiêu tán nhiệt hiệu quả.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690134002/Laptop%20Sales/%C4%90%E1%BA%BF%20t%E1%BA%A3n%20nhi%E1%BB%87t/X150R_5_compressed_g1hjzt.jpg', 890000.0000, 200, 2, 1, NULL, NULL, NULL, NULL, NULL, N'0.55 Kg', 14)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (62, N'Túi chống sốc 15.6″ cao cấp Xgear', N'Bảo vệ laptop, hạn chế va đập trầy xước. Với lớp phủ nhung, lớp bông dày dặn.

 Bề mặt simili láng mịn chống giọt nước và khóa kéo chắc chắn.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690134150/Laptop%20Sales/T%C3%BAi%20ch%E1%BB%91ng%20s%E1%BB%91c/800x800_tuisocXgear_vuhuav.jpg', 190000.0000, 150, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 15)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (63, N'Túi chống sốc GearVN 15''''', N'Sở hữu dây kéo có khả năng trượt mượt mà, tuổi thọ cao hơn so với cách sản phẩm trên thị trường. Chất vải dày với nhiều lớp chống sốc với góc bo tròn được gia công tỉ mỉ mang lại sự an tâm tuyệt đối khi chứa laptop. Sử dụng vừa vặn cho các mẫu laptop 15.6 inch.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690134282/Laptop%20Sales/T%C3%BAi%20ch%E1%BB%91ng%20s%E1%BB%91c/tui_chong_sock_gearvn_size_14_m2lt66.webp', 100000.0000, 200, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 15)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (64, N'TÚI CHỐNG SỐC TOMTOC (USA) 360* PROTECTIVE', N'TÚI CHỐNG SỐC TOMTOC (USA) 360* PROTECTIVE KÈM TÚI PHỤ KIỆN CHO MACBOOK PRO 14” ĐEN A13 D2D1GP', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690134391/Laptop%20Sales/T%C3%BAi%20ch%E1%BB%91ng%20s%E1%BB%91c/T%C3%9AI_CH%E1%BB%90NG_S%E1%BB%90C_TOMTOC_i39yw2.webp', 979000.0000, 100, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 13)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (65, N'Balo Xgear ASUS ROG 15″', NULL, N'https://res.cloudinary.com/dahppd9es/image/upload/v1690134500/Laptop%20Sales/Balo/balo-asus-ava_fd1th2.png', 300000.0000, 150, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (66, N'Balo ASUS TUF Gaming VP4700 17″', NULL, N'https://res.cloudinary.com/dahppd9es/image/upload/v1690134557/Laptop%20Sales/Balo/balo-tuf-vp1700-2-1_xgzkgq.jpg', 890000.0000, 150, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (67, N'Balo Asus ROG Archer Messenger BC2000', NULL, N'https://res.cloudinary.com/dahppd9es/image/upload/v1690134613/Laptop%20Sales/Balo/rog-archer-messenger_ltvvwe.jpg', 1790000.0000, 100, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (68, N'Balo Tomtoc A63 Slash Flip 12L A63C1G1', NULL, N'https://res.cloudinary.com/dahppd9es/image/upload/v1690134675/Laptop%20Sales/Balo/Balo_Tomtoc_A63_Slash_Flip_12L_A63C1G1_l5llpr.jpg', 1490000.0000, 85, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 13)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (69, N'RAM LAPTOP KINGSTON (KVR32S22S8/16) 16GB (1X16GB) DDR4 3200MHZ', NULL, N'https://res.cloudinary.com/dahppd9es/image/upload/v1690135598/Laptop%20Sales/RAM/ram_laptop_kingston_kvr32s22s8_16_gaqh1d.png', 1199000.0000, 120, 3, 4, NULL, NULL, N'DDR4 16GB 3200MHz', NULL, NULL, NULL, 11)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (70, N'RAM LAPTOP KINGSTON (KVR26S19S6/8 / KVR26S19S8/8) 8GB (1X8GB) DDR4 2666MHZ', NULL, N'https://res.cloudinary.com/dahppd9es/image/upload/v1690135681/Laptop%20Sales/RAM/ram_laptop_kingston_kvr26s19s6_8_8gb_1x8gb_ddr4_2666mhz_001_trts3s.png', 669000.0000, 120, 3, 4, NULL, NULL, N'DDR4 8GB 2666MHz', NULL, NULL, NULL, 11)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (71, N'RAM LAPTOP CORSAIR (CMSX8GX4M1A2666C18) 8GB (1X8GB) DDR4 2666MHZ', NULL, N'https://res.cloudinary.com/dahppd9es/image/upload/v1690135765/Laptop%20Sales/RAM/ram_laptop_corsair_fne4pd.jpg', 639000.0000, 120, 3, 4, NULL, NULL, N'DDR4 8GB 2666MHz', NULL, NULL, NULL, 12)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (72, N'RAM LAPTOP CORSAIR (CMSX16GX4M1A2666C18) 16GB (1X16GB) DDR4 2666MHZ', NULL, N'https://res.cloudinary.com/dahppd9es/image/upload/v1690135765/Laptop%20Sales/RAM/ram_laptop_corsair_fne4pd.jpg', 1199000.0000, 120, 3, 4, NULL, NULL, N'DDR4 16GB 2666MHz', NULL, NULL, NULL, 12)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (73, N'Ram Laptop Samsung DDR5 8GB 5600MHz', N'Samsung DDR5 8GB 5600MHz M425R1GB4BB0 CWM là một trong những phụ kiện giúp chiếc máy tính xách tay của bạn đạt hiệu xuất cao hơn, xử lý mọi tác vụ nhanh và tiết kiệm thời gian. Hứa hẹn đây sẽ là một trong những dòng RAM Laptop giúp tối ưu thời gian làm việc và nâng tầm giải trí lên một tầm cao mới. ', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690135929/Laptop%20Sales/RAM/Ram_Laptop_Samsung_DDR5_8GB_5600MHz_hc8bjy.webp', 1600000.0000, 120, 3, 3, NULL, NULL, N'DDR5 8GB 5600WHz', NULL, NULL, NULL, 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (74, N'Ram Laptop Samsung DDR5 8GB 4800MHz', N'RAM laptop là linh kiện máy tính giúp hệ thống vận hành nhanh hơn. Samsung DDR5 8GB 4800MHz 1.1v M425R1GB4BB0-CQK0L là chiếc RAM nằm trong phân khúc từ 1 đến 3 triệu hỗ trợ người dùng thao tác mượt mà khi làm việc trên laptop của họ.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690135929/Laptop%20Sales/RAM/Ram_Laptop_Samsung_DDR5_8GB_5600MHz_hc8bjy.webp', 1600000.0000, 120, 3, 3, NULL, NULL, N'DDR5 8GB 4800WHz', NULL, NULL, NULL, 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (75, N'Ram Laptop Samsung DDR5 16GB 4800MHz', N'RAM laptop là linh kiện máy tính giúp hệ thống vận hành nhanh hơn. Samsung DDR5 16GB 4800MHz M425R2GA3BB0 CQKOL là chiếc RAM nằm trong phân khúc từ 1 đến 3 triệu hỗ trợ người dùng thao tác mượt mà khi làm việc trên laptop của họ', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690136060/Laptop%20Sales/RAM/Ram_Laptop_Samsung_DDR5_16GB_4800MHz_mewh5k.webp', 2690000.0000, 120, 3, 3, NULL, NULL, N'DDR5 16GB 4800WHz', NULL, NULL, NULL, 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (76, N'Ổ Cứng SSD SamSung 980 1TB M.2 PCIe NVMe', N'Với chất lượng vượt trội và hiệu năng cao. SSD M.2 NVMe Intel là một sự lựa chọn tối ưu khi bạn muốn nâng cấp ổ cứng. Rất nhanh với tốc độ đọc ghi tuần tự có thể lên đến 3500Mb/s và 3000Mb/s. Giờ đây mọi thao tác trên máy tính của bạn diễn ra một cách nhanh chóng và mượt mà nhất có thể. Tăng hiệu năng toàn bộ của máy tính lên rất nhiều.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690136186/Laptop%20Sales/%E1%BB%94%20c%E1%BB%A9ng/%E1%BB%94_C%E1%BB%A9ng_SSD_SamSung_980_1TB_M.2_PCIe_NVMe_m5kk56.webp', 2290000.0000, 120, 3, 3, NULL, NULL, NULL, N'1TB', NULL, NULL, 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (77, N'Ổ Cứng SSD SamSung 980 500GB M.2 PCIe NVMe', N'Ổ cứng SSD Samsung 980 M.2 PCIe NVMe 500GB là sự lựa chọn tốt nhất hiện nay dành cho game thủ cả về giá thành lẫn hiệu năng', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690136186/Laptop%20Sales/%E1%BB%94%20c%E1%BB%A9ng/%E1%BB%94_C%E1%BB%A9ng_SSD_SamSung_980_1TB_M.2_PCIe_NVMe_m5kk56.webp', 1290000.0000, 120, 3, 3, NULL, NULL, NULL, N'500GB', NULL, NULL, 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (78, N'SSD GIGABYTE NVMe 256Gb', N'Ổ cứng SSD là phương tiện lưu trữ dữ liệu trên máy tính. Nó không những là một sự nâng cấp hoàn hảo cho ổ HDD truyền thống trong việc xử lý dữ liệu mà còn cải thiện tối đa nhiệt độ và điện năng tiêu thụ. SSD Gigabyte M.2 PCIe 256GB thế hệ mới với chuẩn giao thức kết nối PCI-Express 3.0 x4 và NVMe 1.3 tự hào có thể làm tốt mọi tác vụ cần có ở một ổ lưu trữ và nâng cao hiệu suất hệ thống.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690136383/Laptop%20Sales/%E1%BB%94%20c%E1%BB%A9ng/SSD_GIGABYTE_NVMe_256Gb_aeeayx.webp', 790000.0000, 120, 3, 3, NULL, NULL, NULL, N'256GB', NULL, NULL, 7)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (79, N'SSD Samsung 870 EVO 2TB 2.5'' SATA III', N'SSD Samsung 870 EVO 2TB 2.5'' SATA III được trang bị tốc độ đọc và ghi lần lượt là 560MB/s và 530MB/s đem đến khả năng xử lý file, dữ liệu một cách nhanh chóng khi thực hiện trên ổ SSD.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690136514/Laptop%20Sales/%E1%BB%94%20c%E1%BB%A9ng/SSD_Samsung_870_EVO_2TB_2.5_SATA_III_qpnetj.webp', 5990000.0000, 100, 3, 3, NULL, NULL, NULL, N'2TB', NULL, NULL, 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ImageURL], [Price], [Quantity], [CategoryID], [SupplierID], [CPU], [VGA], [RAM], [SSD], [Pin], [Weight], [BrandID]) VALUES (80, N'Ổ CỨNG HDD LAPTOP WD 1TB BLUE 2.5 INCH', N'HDD Laptop Western Blue 1TB 2.5" 5400RPM SATA3 thuộc phiên bản WD Blue, là phiên bản nguyên được thiết kế cho hệ máy desktop với công nghệ cho phép lưu trữ lớn và cải thiện hiệu suất làm việc, nay được áp dụng tạo nên ổ cứng di động lý tưởng cho các sản phẩm laptop, notebook, ultrabook.', N'https://res.cloudinary.com/dahppd9es/image/upload/v1690136617/Laptop%20Sales/%E1%BB%94%20c%E1%BB%A9ng/hdd_laptop_western_blue_1tb_m1mzqg.jpg', 1199000.0000, 50, 3, 4, NULL, NULL, NULL, N'1TB', NULL, NULL, 15)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTag] ON 

INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (1, 1, 1)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (2, 1, 2)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (3, 1, 3)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (4, 1, 5)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (5, 1, 7)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (6, 1, 9)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (7, 1, 10)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (8, 1, 11)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (9, 1, 12)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (10, 2, 4)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (11, 1, 6)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (12, 2, 8)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (13, 2, 17)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (14, 1, 18)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (15, 2, 19)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (16, 2, 20)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (17, 1, 21)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (18, 2, 22)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (19, 2, 23)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (20, 1, 24)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (21, 1, 25)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (22, 2, 14)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (23, 2, 15)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (24, 2, 16)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (25, 2, 26)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (26, 1, 27)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (27, 2, 28)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (28, 2, 29)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (29, 2, 30)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (30, 1, 31)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (31, 1, 32)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (32, 1, 33)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (33, 1, 34)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (34, 1, 35)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (35, 2, 36)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (36, 2, 37)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (37, 2, 38)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (38, 1, 39)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (39, 1, 40)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (40, 2, 41)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (41, 2, 42)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (42, 2, 43)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (43, 1, 44)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (44, 1, 45)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (45, 1, 46)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (46, 1, 47)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (47, 1, 48)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (49, 1, 49)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (50, 1, 50)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (51, 1, 51)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (52, 1, 52)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (53, 1, 53)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (54, 1, 54)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (55, 2, 55)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (56, 2, 56)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (57, 2, 57)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (58, 3, 58)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (59, 3, 59)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (60, 3, 60)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (61, 3, 61)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (62, 5, 62)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (63, 5, 63)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (64, 5, 64)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (65, 4, 65)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (66, 4, 66)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (67, 4, 67)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (68, 4, 68)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (69, 6, 69)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (70, 6, 70)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (71, 6, 71)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (72, 6, 72)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (73, 6, 73)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (74, 6, 74)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (75, 6, 75)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (76, 7, 76)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (77, 7, 77)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (78, 7, 78)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (79, 7, 79)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (80, 7, 80)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (81, 17, 55)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (82, 17, 56)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (83, 17, 57)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (84, 14, 1)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (85, 14, 2)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (86, 14, 3)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (87, 14, 4)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (88, 14, 5)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (89, 14, 6)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (90, 13, 7)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (91, 13, 8)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (92, 13, 9)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (93, 13, 10)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (94, 13, 11)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (95, 13, 12)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (96, 18, 14)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (97, 18, 15)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (98, 18, 16)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (99, 12, 17)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (100, 12, 18)
GO
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (101, 12, 19)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (102, 12, 20)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (103, 12, 21)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (104, 12, 22)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (105, 12, 23)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (106, 12, 24)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (107, 12, 25)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (108, 11, 26)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (109, 11, 27)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (110, 11, 28)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (111, 11, 29)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (112, 11, 30)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (113, 11, 31)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (114, 11, 32)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (115, 11, 33)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (116, 10, 34)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (117, 10, 35)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (118, 10, 36)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (119, 10, 37)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (120, 10, 38)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (121, 10, 39)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (122, 10, 40)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (123, 15, 41)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (124, 15, 42)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (125, 15, 43)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (126, 15, 44)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (127, 15, 45)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (128, 15, 46)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (129, 15, 47)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (130, 16, 48)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (131, 16, 49)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (132, 16, 50)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (133, 16, 51)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (134, 16, 52)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (135, 16, 53)
INSERT [dbo].[ProductTag] ([ID], [TagID], [ProductID]) VALUES (136, 16, 54)
SET IDENTITY_INSERT [dbo].[ProductTag] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [PhoneNumber]) VALUES (1, N'XGear', NULL, NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [PhoneNumber]) VALUES (2, N'FPT Shop', NULL, NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [PhoneNumber]) VALUES (3, N'GearVN', NULL, NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [PhoneNumber]) VALUES (4, N'HACOM', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (1, N'Gaming')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (2, N'Sinh viên - Văn phòng')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (3, N'Đế tản nhiệt')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (4, N'Balo')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (5, N'Túi chống sốc')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (6, N'RAM')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (7, N'Ổ cứng Laptop')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (8, N'Pin')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (9, N'Card đồ họa rời')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (10, N'HP')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (11, N'DELL')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (12, N'MSI')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (13, N'Acer')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (14, N'Asus')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (15, N'Lenovo')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (16, N'Gigabyte')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (17, N'Microsoft (Surface)')
INSERT [dbo].[Tag] ([TagID], [TagName]) VALUES (18, N'Apple (MacBook)')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Accounts]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Customers]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Orders] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Customers_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductTag] CHECK CONSTRAINT [FK_ProductTag_Products]
GO
ALTER TABLE [dbo].[ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
GO
ALTER TABLE [dbo].[ProductTag] CHECK CONSTRAINT [FK_ProductTag_Tag]
GO
/****** Object:  StoredProcedure [dbo].[spCheckLogin]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCheckLogin]
            @username VARCHAR(50), @password VARCHAR(50)
AS
BEGIN
  -- Kiểm tra tên đăng nhập
  IF NOT EXISTS (SELECT * FROM Accounts WHERE UserName = @username)
    return 2
  ELSE
  Begin
	-- Kiểm tra mật khẩu
	IF ((SELECT Password FROM Accounts WHERE UserName = @username)!=@password)
		return 3
	ELSE
	-- Đăng nhập thành công
		return 1
  End
END
GO
/****** Object:  StoredProcedure [dbo].[urUpdateSLSP]    Script Date: 9/1/2023 3:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[urUpdateSLSP]
AS
BEGIN
	Declare @maDH int, @maSP int, @sl int
	Declare curUpdateSL CURSOR
	FOR (Select ProductID, Quantity From OrderDetails)
	OPEN curUpdateSL
	FETCH NEXT FROM curUpdateSL INTO @maSP, @sl
	WHILE(@@FETCH_STATUS=0)
	Begin
		UPDATE	Products
		SET		Quantity = Quantity-@sl
		Where	ProductID = @maSP
	End
	CLOSE curUpdateSL
	DEALLOCATE curUpdateSL
END
GO
