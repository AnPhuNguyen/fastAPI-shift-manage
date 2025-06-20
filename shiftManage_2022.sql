USE [master]
GO
/****** Object:  Database [shifrManage_api]    Script Date: 21-Jun-25 10:35:53 AM ******/
CREATE DATABASE [shifrManage_api]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shifrManage_api', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\shifrManage_api.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shifrManage_api_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\shifrManage_api_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [shifrManage_api] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shifrManage_api].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shifrManage_api] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shifrManage_api] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shifrManage_api] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shifrManage_api] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shifrManage_api] SET ARITHABORT OFF 
GO
ALTER DATABASE [shifrManage_api] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shifrManage_api] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shifrManage_api] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shifrManage_api] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shifrManage_api] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shifrManage_api] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shifrManage_api] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shifrManage_api] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shifrManage_api] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shifrManage_api] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shifrManage_api] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shifrManage_api] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shifrManage_api] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shifrManage_api] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shifrManage_api] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shifrManage_api] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shifrManage_api] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shifrManage_api] SET RECOVERY FULL 
GO
ALTER DATABASE [shifrManage_api] SET  MULTI_USER 
GO
ALTER DATABASE [shifrManage_api] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shifrManage_api] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shifrManage_api] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shifrManage_api] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shifrManage_api] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shifrManage_api] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'shifrManage_api', N'ON'
GO
ALTER DATABASE [shifrManage_api] SET QUERY_STORE = ON
GO
ALTER DATABASE [shifrManage_api] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [shifrManage_api]
GO
/****** Object:  Table [dbo].[ca_lam]    Script Date: 21-Jun-25 10:35:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ca_lam](
	[khung_gio] [nvarchar](10) NOT NULL,
	[bat_dau] [time](7) NOT NULL,
	[ket_thuc] [time](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chat_store]    Script Date: 21-Jun-25 10:35:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chat_store](
	[message] [nvarchar](1000) NOT NULL,
	[send_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhan_vien_ca_lam]    Script Date: 21-Jun-25 10:35:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhan_vien_ca_lam](
	[memberID] [nvarchar](10) NOT NULL,
	[monday] [nvarchar](50) NULL,
	[tuesday] [nvarchar](50) NULL,
	[wednesday] [nvarchar](50) NULL,
	[thursday] [nvarchar](50) NULL,
	[friday] [nvarchar](50) NULL,
	[saturday] [nvarchar](50) NULL,
	[sunday] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tai_khoan]    Script Date: 21-Jun-25 10:35:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tai_khoan](
	[accountID] [nvarchar](10) NOT NULL,
	[ten_dangnhap] [nvarchar](50) NOT NULL,
	[mat_khau] [nvarchar](50) NOT NULL,
	[quyen] [nchar](5) NOT NULL,
 CONSTRAINT [PK_tai_khoan] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_vien]    Script Date: 21-Jun-25 10:35:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thanh_vien](
	[memberID] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[vi_tri] [nvarchar](50) NULL,
	[accountID] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_thanh_vien] PRIMARY KEY CLUSTERED 
(
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ca_lam] ([khung_gio], [bat_dau], [ket_thuc]) VALUES (N'sang', CAST(N'06:30:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[ca_lam] ([khung_gio], [bat_dau], [ket_thuc]) VALUES (N'chieu', CAST(N'13:30:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[ca_lam] ([khung_gio], [bat_dau], [ket_thuc]) VALUES (N'toi', CAST(N'19:30:00' AS Time), CAST(N'23:00:00' AS Time))
GO
INSERT [dbo].[chat_store] ([message], [send_time]) VALUES (N'Testing', CAST(N'2025-06-20T13:06:00.000' AS DateTime))
INSERT [dbo].[chat_store] ([message], [send_time]) VALUES (N'hello your computer has virus lol', CAST(N'2025-06-20T13:10:22.000' AS DateTime))
INSERT [dbo].[chat_store] ([message], [send_time]) VALUES (N'Hello', CAST(N'2025-06-20T13:54:07.000' AS DateTime))
INSERT [dbo].[chat_store] ([message], [send_time]) VALUES (N'how are you', CAST(N'2025-06-20T13:54:15.000' AS DateTime))
INSERT [dbo].[chat_store] ([message], [send_time]) VALUES (N'testing socket 5000', CAST(N'2025-06-20T14:29:57.000' AS DateTime))
INSERT [dbo].[chat_store] ([message], [send_time]) VALUES (N'Hello từ port 8000', CAST(N'2025-06-20T14:38:33.000' AS DateTime))
INSERT [dbo].[chat_store] ([message], [send_time]) VALUES (N'Em chào sếp ạ', CAST(N'2025-06-20T13:57:39.000' AS DateTime))
INSERT [dbo].[chat_store] ([message], [send_time]) VALUES (N'Ủa nhầm rồi, anh mới là sếp', CAST(N'2025-06-20T13:57:53.000' AS DateTime))
GO
INSERT [dbo].[nhan_vien_ca_lam] ([memberID], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday], [sunday]) VALUES (N'N01', N'toi,chieu', N'sang', N'chieu', N'toi', N'chieu,toi', N'sang,toi', NULL)
INSERT [dbo].[nhan_vien_ca_lam] ([memberID], [monday], [tuesday], [wednesday], [thursday], [friday], [saturday], [sunday]) VALUES (N'N02', N'sang', N'sang', N'sang', N'chieu', N'chieu', N'chieu', N'toi')
GO
INSERT [dbo].[tai_khoan] ([accountID], [ten_dangnhap], [mat_khau], [quyen]) VALUES (N'U0', N'admin', N'1', N'admin')
INSERT [dbo].[tai_khoan] ([accountID], [ten_dangnhap], [mat_khau], [quyen]) VALUES (N'U01', N'dummy', N'1', N'staff')
INSERT [dbo].[tai_khoan] ([accountID], [ten_dangnhap], [mat_khau], [quyen]) VALUES (N'U02', N'nauan', N'1', N'staff')
GO
INSERT [dbo].[thanh_vien] ([memberID], [name], [vi_tri], [accountID]) VALUES (N'N0', N'Nguyễn An Phú', N'lập trình viên', N'U0')
INSERT [dbo].[thanh_vien] ([memberID], [name], [vi_tri], [accountID]) VALUES (N'N01', N'Nguyễn Văn A', N'phụ bàn', N'U01')
INSERT [dbo].[thanh_vien] ([memberID], [name], [vi_tri], [accountID]) VALUES (N'N02', N'Trần Thị B', N'Nấu ăn', N'U02')
GO
ALTER TABLE [dbo].[nhan_vien_ca_lam]  WITH CHECK ADD  CONSTRAINT [FK_nhan_vien-ca_lam_thanh_vien] FOREIGN KEY([memberID])
REFERENCES [dbo].[thanh_vien] ([memberID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[nhan_vien_ca_lam] CHECK CONSTRAINT [FK_nhan_vien-ca_lam_thanh_vien]
GO
ALTER TABLE [dbo].[thanh_vien]  WITH CHECK ADD  CONSTRAINT [FK_thanh_vien_tai_khoan] FOREIGN KEY([accountID])
REFERENCES [dbo].[tai_khoan] ([accountID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[thanh_vien] CHECK CONSTRAINT [FK_thanh_vien_tai_khoan]
GO
ALTER TABLE [dbo].[tai_khoan]  WITH CHECK ADD CHECK  (([quyen]='staff' OR [quyen]='admin'))
GO
USE [master]
GO
ALTER DATABASE [shifrManage_api] SET  READ_WRITE 
GO
