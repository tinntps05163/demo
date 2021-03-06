USE [master]
GO
/****** Object:  Database [QLSinhVien]    Script Date: 12/3/2017 10:34:36 AM ******/
CREATE DATABASE [QLSinhVien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSinhVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLSinhVien.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLSinhVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QLSinhVien_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLSinhVien] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSinhVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSinhVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSinhVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSinhVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSinhVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSinhVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSinhVien] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLSinhVien] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLSinhVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSinhVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSinhVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSinhVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSinhVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSinhVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSinhVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSinhVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSinhVien] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLSinhVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSinhVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSinhVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSinhVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSinhVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSinhVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSinhVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSinhVien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLSinhVien] SET  MULTI_USER 
GO
ALTER DATABASE [QLSinhVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSinhVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSinhVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSinhVien] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLSinhVien]
GO
/****** Object:  StoredProcedure [dbo].[timkiem]    Script Date: 12/3/2017 10:34:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkiem]
@name nvarchar(50)
as
begin
select * from Login where login.Chucvu like N'%'+@name+'%'
end
GO
/****** Object:  Table [dbo].[Giang_Vien]    Script Date: 12/3/2017 10:34:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giang_Vien](
	[IDGV] [nvarchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](10) NOT NULL,
	[TrinhDo] [nvarchar](20) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[IDKQ] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Giang_Vien] PRIMARY KEY CLUSTERED 
(
	[IDGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ket_Qua]    Script Date: 12/3/2017 10:34:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ket_Qua](
	[IDKQ] [nvarchar](10) NOT NULL,
	[IDSV] [int] NOT NULL,
	[IDGV] [nvarchar](20) NOT NULL,
	[Tiếng Anh] [float] NOT NULL,
	[Tin Học] [float] NOT NULL,
	[GDTC] [float] NOT NULL,
	[MSSV] [nvarchar](20) NOT NULL,
	[Điểm TB] [float] NULL,
 CONSTRAINT [PK_Ket_Qua] PRIMARY KEY CLUSTERED 
(
	[IDKQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 12/3/2017 10:34:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[ID] [nvarchar](20) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Chucvu] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Login_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 12/3/2017 10:34:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[IDSV] [int] NOT NULL,
	[MSSV] [nvarchar](20) NOT NULL,
	[Họ Tên] [nvarchar](50) NOT NULL,
	[Ngày Sinh] [nvarchar](30) NOT NULL,
	[IDKQ] [nvarchar](10) NOT NULL,
	[Mã Lớp] [nvarchar](20) NOT NULL,
	[Giới Tính] [nvarchar](10) NOT NULL,
	[Trình Độ] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[IDSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Ket_Qua] ([IDKQ], [IDSV], [IDGV], [Tiếng Anh], [Tin Học], [GDTC], [MSSV], [Điểm TB]) VALUES (N'1', 6, N'GV03', 9, 9, 10, N'PS05194', NULL)
INSERT [dbo].[Ket_Qua] ([IDKQ], [IDSV], [IDGV], [Tiếng Anh], [Tin Học], [GDTC], [MSSV], [Điểm TB]) VALUES (N'2', 2, N'GV01', 9, 8.4, 7.5, N'PS05162', NULL)
INSERT [dbo].[Ket_Qua] ([IDKQ], [IDSV], [IDGV], [Tiếng Anh], [Tin Học], [GDTC], [MSSV], [Điểm TB]) VALUES (N'3', 5, N'GV02', 9, 8.7, 8.5, N'PS05190', NULL)
INSERT [dbo].[Ket_Qua] ([IDKQ], [IDSV], [IDGV], [Tiếng Anh], [Tin Học], [GDTC], [MSSV], [Điểm TB]) VALUES (N'4', 7, N'GV05', 6.5, 7.6, 8, N'PS05191', NULL)
INSERT [dbo].[Ket_Qua] ([IDKQ], [IDSV], [IDGV], [Tiếng Anh], [Tin Học], [GDTC], [MSSV], [Điểm TB]) VALUES (N'6', 3, N'GV04', 9.5, 8.5, 6.5, N'PS05196', NULL)
INSERT [dbo].[Login] ([ID], [Username], [Password], [Chucvu]) VALUES (N'CB01', N'Nguyễn Minh Hải', N'password', N'CB01')
INSERT [dbo].[Login] ([ID], [Username], [Password], [Chucvu]) VALUES (N'CB02', N'Tôn Thất Nhật Khánh', N'12345     ', N'CB02')
INSERT [dbo].[Login] ([ID], [Username], [Password], [Chucvu]) VALUES (N'GV01', N'Trần Thị Hương', N'123       ', N'Giảng viên')
INSERT [dbo].[Login] ([ID], [Username], [Password], [Chucvu]) VALUES (N'GV02', N'Huỳnh Thanh Phụng', N'1234      ', N'Giảng Viên')
INSERT [dbo].[Login] ([ID], [Username], [Password], [Chucvu]) VALUES (N'GV03', N'Trần Minh Thông', N'4321      ', N'Giảng Viên')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (2, N'PS05162', N'Phạm Quốc Khánh', N'03/04/1995', N'2', N'PT12201', N'Nam', N'Cao Đẳng')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (3, N'PS05191', N'Trần Thị Hương Lan', N'01/05/1997', N'3', N'PT12202', N'Nữ', N'Đại Học')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (5, N'PS05195', N'Nguyễn Trọng Tín', N'08/10/1992', N'5', N'PT12201', N'Nam', N'Cao Đẳng')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (6, N'PS05164', N'Khải Ca', N'06/07/1993', N'6', N'PT12202', N'Nam', N'Trung Cấp')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (7, N'PS05198', N'Lý Hương', N'05/04/1997', N'7', N'PT12203', N'Nữ', N'Đại Học')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (9, N'PS05194', N'Pham Huynh Vu Kien', N'08/23/1993', N'9', N'PT12201', N'Nam', N'Cao Đẳng')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (10, N'PS05167', N'Bach Thu Ha', N'08/10/1994', N'10', N'PT12203', N'Nữ', N'Cao Đẳng')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (11, N'PS05163', N'Nguyen Chi Tai', N'04/12/1997', N'11', N'PT12202', N'Nam', N'Trung Cấp')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (14, N'PS05166', N'Ly Huynh Duy Bao', N'01/06/1992', N'14', N'PT12202', N'Nam', N'Trung Cấp')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (15, N'PS05199', N'Lý Thu Hương', N'05/04/1994', N'15', N'PT12202', N'Nữ', N'Cao Đẳng')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (17, N'PS04167', N'Bin La Den', N'06/09/1994', N'17', N'PT12202', N'Nam', N'Trung Cấp')
INSERT [dbo].[SinhVien] ([IDSV], [MSSV], [Họ Tên], [Ngày Sinh], [IDKQ], [Mã Lớp], [Giới Tính], [Trình Độ]) VALUES (18, N'PS05196', N'Lý Thu Thu', N'08/02/1994', N'18', N'PT12201', N'Nữ', N'Đại Học')
ALTER TABLE [dbo].[Giang_Vien]  WITH CHECK ADD  CONSTRAINT [FK_Giang_Vien_Ket_Qua] FOREIGN KEY([IDKQ])
REFERENCES [dbo].[Ket_Qua] ([IDKQ])
GO
ALTER TABLE [dbo].[Giang_Vien] CHECK CONSTRAINT [FK_Giang_Vien_Ket_Qua]
GO
ALTER TABLE [dbo].[Ket_Qua]  WITH CHECK ADD FOREIGN KEY([IDSV])
REFERENCES [dbo].[SinhVien] ([IDSV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ket_Qua]  WITH CHECK ADD  CONSTRAINT [FK_Ket_Qua_SinhVien] FOREIGN KEY([IDSV])
REFERENCES [dbo].[SinhVien] ([IDSV])
GO
ALTER TABLE [dbo].[Ket_Qua] CHECK CONSTRAINT [FK_Ket_Qua_SinhVien]
GO
USE [master]
GO
ALTER DATABASE [QLSinhVien] SET  READ_WRITE 
GO
