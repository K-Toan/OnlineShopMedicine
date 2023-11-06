USE [master]
GO
CREATE DATABASE [ProjectPRN211_HuongNT7_G6]

GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProjectPRN211_HuongNT7_G6]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/6/2023 2:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](30) NOT NULL,
	[wallet] [money] NOT NULL,
	[role_id] [int] NOT NULL,
	[address] [nvarchar](1000) NOT NULL,
	[phone_number] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/6/2023 2:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[account_id] [int] NOT NULL,
	[medicine_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC,
	[medicine_id] ASC,
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2023 2:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/6/2023 2:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 11/6/2023 2:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[country_id] [int] NULL,
	[expired_date] [date] NULL,
	[image] [nvarchar](max) NULL,
	[descript] [nvarchar](4000) NULL,
	[min_age] [int] NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineType]    Script Date: 11/6/2023 2:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineType](
	[medicine_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_MedicineType] PRIMARY KEY CLUSTERED 
(
	[medicine_id] ASC,
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/6/2023 2:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[total_money] [money] NOT NULL,
	[created_date] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/6/2023 2:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_id] [int] NOT NULL,
	[medicine_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/6/2023 2:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 11/6/2023 2:43:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_MedicineType] FOREIGN KEY([medicine_id], [type_id])
REFERENCES [dbo].[MedicineType] ([medicine_id], [type_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_MedicineType]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Country]
GO
ALTER TABLE [dbo].[MedicineType]  WITH CHECK ADD  CONSTRAINT [FK_MedicineType_Medicine] FOREIGN KEY([medicine_id])
REFERENCES [dbo].[Medicine] ([id])
GO
ALTER TABLE [dbo].[MedicineType] CHECK CONSTRAINT [FK_MedicineType_Medicine]
GO
ALTER TABLE [dbo].[MedicineType]  WITH CHECK ADD  CONSTRAINT [FK_MedicineType_Type] FOREIGN KEY([type_id])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[MedicineType] CHECK CONSTRAINT [FK_MedicineType_Type]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_MedicineType] FOREIGN KEY([medicine_id], [type_id])
REFERENCES [dbo].[MedicineType] ([medicine_id], [type_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_MedicineType]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
USE [master]
GO
ALTER DATABASE [ProjectPRN211_HuongNT7_G6] SET  READ_WRITE 
GO
