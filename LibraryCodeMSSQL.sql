﻿--=============== CREATE DATABASE ===============--

USE master;
GO
DROP DATABASE IF EXISTS QuanLyThuVien
GO
CREATE DATABASE QuanLyThuVien
GO


USE QuanLyThuVien
GO

--=============== DROP CONSTRAINTS IF EXITS ===============--

IF (OBJECT_ID('dbo.FK_NhaXB_DauSach', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE DauSach DROP CONSTRAINT IF EXISTS FK_NhaXB_DauSach;
END

IF (OBJECT_ID('dbo.FK_NgonNgu_DauSach', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE DauSach DROP CONSTRAINT IF EXISTS FK_NgonNgu_DauSach;
END

IF (OBJECT_ID('dbo.FK_TheLoai_DauSach', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE DauSach DROP CONSTRAINT IF EXISTS FK_TheLoai_DauSach;
END

IF (OBJECT_ID('dbo.PK_MuonSach', 'PK') IS NOT NULL)
BEGIN
   ALTER TABLE MuonSach DROP CONSTRAINT IF EXISTS PK_MuonSach;
END

IF (OBJECT_ID('dbo.FK_Sach', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE MuonSach DROP CONSTRAINT IF EXISTS FK_Sach;
END

IF (OBJECT_ID('dbo.FK_Muon', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE MuonSach DROP CONSTRAINT IF EXISTS FK_Muon;
END

IF (OBJECT_ID('dbo.FK_DauSach_Sach', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE Sach DROP CONSTRAINT IF EXISTS FK_DauSach_Sach;
END

IF (OBJECT_ID('dbo.PK_Sach', 'PK') IS NOT NULL)
BEGIN
   ALTER TABLE Sach DROP CONSTRAINT IF EXISTS PK_Sach;
END

IF (OBJECT_ID('dbo.FK_DauSach', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE tacgia_sach DROP CONSTRAINT IF EXISTS FK_DauSach;
END

IF (OBJECT_ID('dbo.FK_TacGia', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE tacgia_sach DROP CONSTRAINT IF EXISTS FK_TacGia;
END

IF (OBJECT_ID('dbo.PK_TheLoai', 'PK') IS NOT NULL)
BEGIN
   ALTER TABLE TheLoai DROP CONSTRAINT IF EXISTS PK_TheLoai;
END

IF (OBJECT_ID('dbo.PK_NgonNgu', 'PK') IS NOT NULL)
BEGIN
   ALTER TABLE NgonNgu DROP CONSTRAINT IF EXISTS PK_NgonNgu;
END

IF (OBJECT_ID('dbo.PK_TacGia', 'PK') IS NOT NULL)
BEGIN
   ALTER TABLE TacGia DROP CONSTRAINT IF EXISTS PK_TacGia;
END

IF (OBJECT_ID('dbo.PK_NhaXuatBan', 'PK') IS NOT NULL)
BEGIN
   ALTER TABLE NhaXuatBan DROP CONSTRAINT IF EXISTS PK_NhaXuatBan;
END

IF (OBJECT_ID('dbo.PK_VaiTroNhanVien', 'PK') IS NOT NULL)
BEGIN
   ALTER TABLE vaitro_nhanVien DROP CONSTRAINT IF EXISTS PK_VaiTroNhanVien;
END

IF (OBJECT_ID('dbo.FK_VaiTro', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE vaitro_nhanVien DROP CONSTRAINT IF EXISTS FK_VaiTro;
END

IF (OBJECT_ID('dbo.FK_NhanVien', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE vaitro_nhanVien DROP CONSTRAINT IF EXISTS FK_NhanVien;
END

IF (OBJECT_ID('dbo.PK_VaiTro', 'PK') IS NOT NULL)
BEGIN
   ALTER TABLE VaiTro DROP CONSTRAINT IF EXISTS PK_VaiTro;
END

IF (OBJECT_ID('dbo.FK_Muon_NhanVien', 'F') IS NOT NULL)
BEGIN
   ALTER TABLE Muon DROP CONSTRAINT IF EXISTS FK_Muon_NhanVien;
END

IF (OBJECT_ID('dbo.FK_Muon_DocGia', 'F') IS NOT NULL)
BEGIN
	ALTER TABLE Muon DROP CONSTRAINT IF EXISTS FK_Muon_DocGia;
END

IF (OBJECT_ID('dbo.PK_NhanVien', 'PK') IS NOT NULL)
BEGIN
	ALTER TABLE NhanVien DROP CONSTRAINT IF EXISTS PK_NhanVien;
END

IF (OBJECT_ID('dbo.FK_HoSo_NhanVien', 'F') IS NOT NULL)
BEGIN
	ALTER TABLE NhanVien DROP CONSTRAINT IF EXISTS FK_HoSo_NhanVien;
END

IF (OBJECT_ID('dbo.PK_HoSo', 'PK') IS NOT NULL)
BEGIN
	ALTER TABLE HoSo DROP CONSTRAINT IF EXISTS PK_HoSo;
END

IF (OBJECT_ID('dbo.FK_HoSo_DocGia', 'F') IS NOT NULL)
BEGIN
	ALTER TABLE HoSo DROP CONSTRAINT IF EXISTS FK_HoSo_DocGia;
END

IF (OBJECT_ID('dbo.PK_DocGia', 'PK') IS NOT NULL)
BEGIN
	ALTER TABLE DocGia DROP CONSTRAINT IF EXISTS PK_DocGia;
END

IF (OBJECT_ID('dbo.PK_DauSach', 'PK') IS NOT NULL)
BEGIN
	ALTER TABLE DauSach DROP CONSTRAINT IF EXISTS PK_DauSach;
END
GO
-- Check constraints
IF (OBJECT_ID('dbo.CHK_DauSach', 'C') IS NOT NULL)
BEGIN
	ALTER TABLE DauSach DROP CONSTRAINT IF EXISTS CHK_DauSach;
END

IF (OBJECT_ID('dbo.CHK_HoSo', 'C') IS NOT NULL)
BEGIN
	ALTER TABLE HoSo DROP CONSTRAINT IF EXISTS CHK_HoSo;
END

IF (OBJECT_ID('dbo.CHK_NhanVien', 'C') IS NOT NULL)
BEGIN
	ALTER TABLE HoSo DROP CONSTRAINT IF EXISTS CHK_NhanVien;
END

IF (OBJECT_ID('dbo.CHK_NhanVien', 'C') IS NOT NULL)
BEGIN
	ALTER TABLE HoSo DROP CONSTRAINT IF EXISTS CHK_NhanVien;
END

IF (OBJECT_ID('dbo.CHK_Muon', 'C') IS NOT NULL)
BEGIN
	ALTER TABLE Muon DROP CONSTRAINT IF EXISTS CHK_Muon;
END

IF (OBJECT_ID('dbo.CHK_Sach', 'C') IS NOT NULL)
BEGIN
	ALTER TABLE Sach DROP CONSTRAINT IF EXISTS CHK_Sach;
END

IF (OBJECT_ID('dbo.CHK_TheLoai', 'C') IS NOT NULL)
BEGIN
	ALTER TABLE TheLoai DROP CONSTRAINT IF EXISTS CHK_TheLoai;
END

IF (OBJECT_ID('dbo.CHK_NgonNgu', 'C') IS NOT NULL)
BEGIN
	ALTER TABLE NgonNgu DROP CONSTRAINT IF EXISTS CHK_NgonNgu;
END

IF (OBJECT_ID('dbo.CHK_TacGia', 'C') IS NOT NULL)
BEGIN
	ALTER TABLE TacGia DROP CONSTRAINT IF EXISTS CHK_TacGia;
END

GO

--=============== CREATE TABLE ===============--

IF OBJECT_ID(N'TheLoai', N'U') IS NOT NULL  
	DROP TABLE [dbo].[TheLoai];  
CREATE TABLE TheLoai
(
  id INT IDENTITY(1,1),
  ten NVARCHAR(50) NOT NULL,
  CONSTRAINT PK_TheLoai PRIMARY KEY(id),
  CONSTRAINT CHK_TheLoai CHECK (ten NOT LIKE '%[^a-zA-Z ]%')
);
GO

IF OBJECT_ID(N'NgonNgu', N'U') IS NOT NULL  
	DROP TABLE [dbo].[NgonNgu];  
CREATE TABLE NgonNgu
(
  id INT IDENTITY(1,1),
  ten NVARCHAR(20) NOT NULL,
  CONSTRAINT PK_NgonNgu PRIMARY KEY(id),
  CONSTRAINT CHK_NgonNgu CHECK (ten NOT LIKE '%[^a-zA-Z ]%')

);
GO

IF OBJECT_ID(N'TacGia', N'U') IS NOT NULL  
	DROP TABLE [dbo].[TacGia];  
CREATE TABLE TacGia
(
  id INT IDENTITY(1,1),
  ten NVARCHAR(50) NOT NULL,
  CONSTRAINT PK_TacGia PRIMARY KEY(id),
  CONSTRAINT CHK_TacGia CHECK (ten NOT LIKE '%[^a-zA-Z ]%')
);
GO

IF OBJECT_ID(N'NhaXuatBan', N'U') IS NOT NULL  
	DROP TABLE [dbo].[NhaXuatBan]; 
CREATE TABLE NhaXuatBan
(
  id INT IDENTITY(1,1),
  ten NVARCHAR(50) NOT NULL,
  CONSTRAINT PK_NhaXuatBan PRIMARY KEY(id)
);
GO

IF OBJECT_ID(N'VaiTro', N'U') IS NOT NULL  
	DROP TABLE [dbo].[VaiTro]; 
CREATE TABLE VaiTro
(
  id INT IDENTITY(1,1),
  ten NVARCHAR(20) NOT NULL,
  mota NVARCHAR(200),
  CONSTRAINT PK_VaiTro PRIMARY KEY(id)
);
GO

IF OBJECT_ID(N'DocGia', N'U') IS NOT NULL  
	DROP TABLE [dbo].[DocGia]; 
CREATE TABLE DocGia
(
  id INT IDENTITY(1,1),
  ten NVARCHAR(50) NOT NULL,
  mssv NVARCHAR(10),
  khoa NVARCHAR(30),
  trangthai INT NOT NULL,
  CONSTRAINT PK_DocGia PRIMARY KEY(id)
);
GO

IF OBJECT_ID(N'DauSach', N'U') IS NOT NULL  
	DROP TABLE [dbo].[DauSach]; 
CREATE TABLE DauSach
(
  id INT IDENTITY(1,1),
  tieude NVARCHAR(30) NOT NULL,
  mota NVARCHAR(200),
  gia INT,
  ngayxuatban DATE,
  hinhanh NVARCHAR(100),
  loai INT NOT NULL, -- 1 = Giáo khoa | 0: Tham khảo
  trangthai INT NOT NULL,
  maNXB INT,
  maNgonNgu INT,
  maTheLoai INT,
  CONSTRAINT PK_DauSach PRIMARY KEY(id),
  CONSTRAINT FK_NhaXB_DauSach FOREIGN KEY (maNXB) REFERENCES NhaXuatBan(id),
  CONSTRAINT FK_NgonNgu_DauSach FOREIGN KEY (maNgonNgu) REFERENCES NgonNgu(id),
  CONSTRAINT FK_TheLoai_DauSach FOREIGN KEY (maTheLoai) REFERENCES TheLoai(id),
  CONSTRAINT CHK_DauSach CHECK (gia>=0 AND (loai=0 OR loai=1))
);
GO

IF OBJECT_ID(N'HoSo', N'U') IS NOT NULL  
	DROP TABLE [dbo].[HoSo]; 
CREATE TABLE HoSo
(
  id INT IDENTITY(1,1),
  ten NVARCHAR(20) NOT NULL,
  ho NVARCHAR(20) NOT NULL,
  diachi NVARCHAR(200),
  soDT NVARCHAR(10),
  hinhanh NVARCHAR(100),
  email NVARCHAR(100) NOT NULL,
  gioitinh INT NOT NULL, -- 0: không rõ | 1: Nam | 2:Nữ
  ngaysinh Date,
  luong INT,
  CONSTRAINT PK_HoSo PRIMARY KEY(id),
);
GO



IF OBJECT_ID(N'NhanVien', N'U') IS NOT NULL  
	DROP TABLE [dbo].[NhanVien]; 
CREATE TABLE NhanVien
(
  id INT IDENTITY(1,1),
  tenDangNhap NVARCHAR(30) NOT NULL,
  matkhau NVARCHAR(100) NOT NULL,
  trangthai INT NOT NULL,
  maHoSo INT NOT NULL,
  CONSTRAINT PK_NhanVien PRIMARY KEY(id),
  CONSTRAINT FK_HoSo_NhanVien FOREIGN KEY (maHoSo) REFERENCES HoSo(id),
  CONSTRAINT CHK_NhanVien CHECK (DATALENGTH(matkhau) >= 8 AND (tenDangNhap LIKE '%[a-zA-Z ]%') 
									AND (trangthai = 0 OR trangthai =1))
);
GO

IF OBJECT_ID(N'Muon', N'U') IS NOT NULL  
	DROP TABLE [dbo].[Muon]; 
CREATE TABLE Muon
(
  id INT IDENTITY(1,1),
  ngaymuon DATE NOT NULL,
  ngaytra DATE,
  ngayhethan DATE,
  trangthai INT NOT NULL, -- 1: Đang mượn | 0: Trả rồi
  tienphat INT,
  maNhanVien INT NOT NULL,
  maDocGia INT NOT NULL,
  CONSTRAINT PK_Muon PRIMARY KEY(id),
  CONSTRAINT FK_Muon_NhanVien FOREIGN KEY (maNhanVien) REFERENCES NhanVien(id),
  CONSTRAINT FK_Muon_DocGia FOREIGN KEY (maDocGia) REFERENCES DocGia(id),
  CONSTRAINT CHK_Muon CHECK (tienphat >= 0 AND (trangthai = 0 OR trangthai =1))
);
GO


IF OBJECT_ID(N'tacgia_sach', N'U') IS NOT NULL  
	DROP TABLE [dbo].[tacgia_sach]; 
CREATE TABLE tacgia_sach
(
  maDauSach INT NOT NULL,
  maTacGia INT NOT NULL,
  CONSTRAINT PK_tacgia_sach PRIMARY KEY (maDauSach, maTacGia),
  CONSTRAINT FK_DauSach FOREIGN KEY (maDauSach) REFERENCES DauSach(id),
  CONSTRAINT FK_TacGia FOREIGN KEY (maTacGia) REFERENCES TacGia(id)
);



IF OBJECT_ID(N'vaitro_NhanVien', N'U') IS NOT NULL  
	DROP TABLE [dbo].[vaitro_nhanVien]; 
CREATE TABLE vaitro_nhanVien
(
  maNhanVien INT NOT NULL,
  maVaiTro INT NOT NULL, -- 1: Quản lý | 0: Nhân viên
  CONSTRAINT PK_VaiTroNhanVien PRIMARY KEY (maNhanVien, maVaiTro),
  CONSTRAINT FK_VaiTro FOREIGN KEY (maVaiTro) REFERENCES VaiTro(id),
  CONSTRAINT FK_NhanVien FOREIGN KEY (maNhanVien) REFERENCES NhanVien(id)
);
GO


IF OBJECT_ID(N'Sach', N'U') IS NOT NULL  
	DROP TABLE [dbo].[Sach]; 
CREATE TABLE Sach
(
  id INT IDENTITY(1,1),
  trangthai INT NOT NULL, --  -1: Mất  1: Còn cho mượn | 0: Không cho mượn
  vitri NVARCHAR(100),
  maDauSach INT NOT NULL,
  CONSTRAINT PK_Sach PRIMARY KEY (id),
  CONSTRAINT FK_DauSach_Sach FOREIGN KEY (maDauSach) REFERENCES DauSach(id),
  CONSTRAINT CHK_Sach CHECK (trangthai = 0 OR trangthai = 1 OR trangthai = -1)
);
GO



IF OBJECT_ID(N'MuonSach', N'U') IS NOT NULL  
	DROP TABLE [dbo].[MuonSach]; 
CREATE TABLE MuonSach
(
  maSach INT NOT NULL,
  maMuon INT NOT NULL,
  CONSTRAINT PK_MuonSach PRIMARY KEY (maSach, maMuon),
  CONSTRAINT FK_Sach FOREIGN KEY (maSach) REFERENCES Sach(id),
  CONSTRAINT FK_Muon FOREIGN KEY (maMuon) REFERENCES Muon(id)
);
GO


--=============== CREATE TRIGGER ===============--

-- if ngayxuatban > current time => rollback
-- or ngayxuatban is older than 1900 => rollback also
CREATE TRIGGER trig_namxuatban ON DauSach
FOR INSERT, UPDATE
AS
	DECLARE @ngayxuatban DATE;
	SELECT @ngayxuatban = DauSach.ngayxuatban FROM INSERTED DauSach
	IF YEAR(GETDATE()) - YEAR(@ngayxuatban)  < 0 OR YEAR(@ngayxuatban) < 1900 
	BEGIN
		ROLLBACK
	END

GO
-- instead of delete dausach, change status from 1 to 0 (unactive )
CREATE TRIGGER trig_trangthai_dausach ON DauSach
INSTEAD OF DELETE
AS
	DECLARE @trangthai INT;
	
	IF (SELECT trangthai FROM DELETED DauSachDel) != 0
	BEGIN
		DECLARE @id INT
		SELECT @id = id FROM DELETED
		UPDATE DauSach
		SET trangthai = 0
		WHERE DauSach.id = @id;
	END
GO

-- delete muon if trangthai == 1 => rollback 
CREATE TRIGGER trig_trangthai_muon ON Muon 
FOR DELETE
AS
	IF (SELECT trangthai FROM DELETED ) = 1
	BEGIN
		ROLLBACK
	END
Go

-- delete sach if trangthai == -1 => rollback 
CREATE TRIGGER trig_trangthai_sach ON Sach
INSTEAD OF DELETE
AS
	DECLARE @trangthai INT;
	
	IF (SELECT trangthai FROM DELETED SachDel) != -1
	BEGIN
		DECLARE @id INT
		SELECT @id = id FROM DELETED
		UPDATE Sach
		SET trangthai = -1
		WHERE Sach.id = @id;
	END
GO

-- if role is admin but age < 18 => rollback
CREATE TRIGGER trig_HoSo ON HoSo
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @ngaysinh DATE, @role NVARCHAR(20);
	SELECT @ngaysinh = ngaysinh FROM INSERTED HoSo
    SELECT @role = VaiTro.ten FROM INSERTED HoSo 
	INNER JOIN NhanVien ON HoSo.id=NhanVien.maHoSo 
		INNER JOIN vaitro_nhanVien ON NhanVien.id=vaitro_nhanVien.maNhanVien INNER JOIN VaiTro ON vaitro_nhanVien.maVaiTro=VaiTro.id
	IF ((YEAR(GETDATE())-YEAR(@ngaysinh)<18) AND @role='admin')
	BEGIN
		ROLLBACK
	END
END
GO

-- if trangthai == 1 => rollback
CREATE TRIGGER trigg_enable_nhanVien ON NhanVien
FOR DELETE
AS
BEGIN
	DECLARE @trangthai INT
	SELECT @trangthai = trangthai FROM NhanVien
	IF (@trangthai = 1) 
	BEGIN
		ROLLBACK
	END
END
GO
-- create view nhanvien
CREATE VIEW NHANVIEN_VIEW AS
SELECT HoSo.id, HoSo.ten, Hoso.email
FROM HoSo INNER JOIN NhanVien ON HoSo.id=NhanVien.maHoSo 
INNER JOIN vaitro_nhanVien ON NhanVien.id=vaitro_nhanVien.maNhanVien 
	INNER JOIN VaiTro ON vaitro_nhanVien.maVaiTro=VaiTro.id
WHERE VaiTro.ten='nhan vien'
GO


--=============== CREATE PROC ===============--
-- procedure Xem thông tin độc giả
CREATE PROCEDURE usp_Xem_Thong_Tin_Doc_gia
AS
BEGIN
   SELECT * FROM DocGia;
END;

GO

-- procedure Thêm thông tin độc giả
CREATE PROCEDURE usp_Them_Doc_Gia
@trangthai INT,
@ten NVARCHAR(50),
@mssv NVARCHAR(10),
@khoa NVARCHAR(30)
AS
BEGIN
   INSERT INTO DocGia (ten,mssv,khoa,trangthai)
   VALUES (@ten,@mssv,@khoa,@trangthai);
END;

GO

-- procedure Chuyển trạng thái độc giả
CREATE PROCEDURE usp_Chuyen_Trang_Thai_Doc_gia
   @id INT,
   @trangthai INT
AS
BEGIN
   UPDATE Docgia
   SET trangthai = @trangthai
   WHERE id=@id;
END;

GO

-- procedure sửa thông tin độc giả

CREATE PROC usp_Sua_Thong_Tin_Doc_Gia  
@id INT,
@trangthai INT,
@ten NVARCHAR(50),
@mssv NVARCHAR(10),
@khoa NVARCHAR(30)
AS
BEGIN
	UPDATE DocGia SET ten=@TEN, trangthai = @trangthai, mssv = @mssv, khoa = @khoa
	WHERE id=@id
END;
GO

-- procedure Xem sách theo ngôn ngữ
CREATE PROCEDURE usp_Xem_Sach_Theo_Ngon_Ngu
@id INT
AS
BEGIN
   	SELECT DauSach.tieude, DauSach.mota, DauSach.hinhanh FROM 
   	DauSach INNER JOIN NgonNgu ON DauSach.maNgonNgu = NgonNgu.id
	WHERE NgonNgu.id=@id
END;

GO

-- procedure Sửa thông tin nhân viên
CREATE PROC usp_Sua_Thong_Tin_Nhan_Vien  
@ID INT,
@TEN NVARCHAR(20),
@HO NVARCHAR(20),
@TENDANGNHAP NVARCHAR(30),
@DIACHI NVARCHAR(20),
@SODT NVARCHAR(10),
@HINHANH NVARCHAR(100),
@EMAIL NVARCHAR(100),
@GIOITINH INT,
@NGAYSINH DATE,
@LUONG INT,
@TRANGTHAI INT
AS
BEGIN
	UPDATE HoSo SET ten=@TEN, ho=@HO, diachi=@DIACHI, soDT=@SODT, hinhanh=@HINHANH, email=@EMAIL, gioitinh = @GIOITINH, ngaysinh=@NGAYSINH, luong = @LUONG
	WHERE id=@ID

	UPDATE NhanVien SET tenDangNhap = @TENDANGNHAP, trangthai = @TRANGTHAI
	WHERE id = @ID
END;
GO


-- procedure Đổi mật khẩu nhân viên
CREATE PROC usp_Sua_Mat_Khau_Nhan_Vien  
@ID INT,
@MATKHAU NVARCHAR(100)
AS
BEGIN
	UPDATE NhanVien SET matkhau = @MATKHAU
	WHERE id = @ID
END;
GO

-- procedure Thêm thông tin nhân viên
/*
CREATE PROC THEM_THONG_TIN_NHAN_VIEN  
@ID INT OUT,
@TEN NVARCHAR(20),
@HO NVARCHAR(20),
@DIACHI NVARCHAR(20),
@SODT NVARCHAR(10),
@HINHANH NVARCHAR(100),
@EMAIL NVARCHAR(100),
@NGAYSINH DATE,
@LUONG INT
AS
BEGIN
	DECLARE @TEMP table([id] uniqueidentifier);
	INSERT INTO HoSo OUTPUT INSERTED.id INTO @TEMP VALUES(@TEN, @HO, @DIACHI, @SODT, @HINHANH, @EMAIL, @NGAYSINH,@LUONG);
	SELECT @ID=H.[id]
	FROM @TEMP AS T
	JOIN HoSo AS H 
	ON T.id = H.id
	WHERE @@ROWCOUNT > 0
END;
GO
*/
-- procedure Thêm tài khoản nhân viên
CREATE PROC usp_Them_Tai_Khoan_Nhan_Vien  
@TENTK NVARCHAR(30),
@MK NVARCHAR(100),
@TRANGTHAI INT,
@MAHS INT
AS
BEGIN
	INSERT INTO NhanVien VALUES(@TENTK, @MK, @TRANGTHAI, @MAHS)
END;

GO

-- procedure Xem toàn bộ thông tin nhân viên
CREATE PROC usp_Xem_Toan_Bo_Thong_Tin_Nhan_Vien
AS
BEGIN
	SELECT HoSo.id,HoSo.ten, VaiTro.ten AS vaitro, tenDangNhap,ho,diachi ,soDT,hinhanh,email, gioitinh, ngaysinh,luong, trangthai
	FROM HoSo 
	INNER JOIN NhanVien on HoSo.id = NhanVien.maHoSo
		INNER JOIN vaitro_nhanVien ON vaitro_nhanVien.maNhanVien = NhanVien.id
			INNER JOIN VaiTro ON vaitro_nhanVien.maVaiTro = VaiTro.id
END;
GO

-- procedure Xem thông tin nhân viên theo id
CREATE PROC usp_Xem_Thong_Tin_Nhan_Vien
@id INT
AS
BEGIN
	SELECT HoSo.id,HoSo.ten, VaiTro.ten AS vaitro, tenDangNhap, ho,diachi ,soDT,hinhanh,email, gioitinh, ngaysinh,luong, trangthai
	FROM HoSo 
	INNER JOIN NhanVien on HoSo.id = NhanVien.maHoSo
		INNER JOIN vaitro_nhanVien ON vaitro_nhanVien.maNhanVien = NhanVien.id
			INNER JOIN VaiTro ON vaitro_nhanVien.maVaiTro = VaiTro.id
	WHERE HoSo.id = @id;
END;
GO

-- procedure Xem mật khẩu nhân viên theo id
CREATE PROC usp_Xem_Mat_Khau_Nhan_Vien
@id INT
AS
BEGIN
	SELECT matKhau
	FROM NhanVien
	WHERE NhanVien.id = @id;
END;
GO

-- procedure chuyển trạng thái tài khoản nhân viên
CREATE PROC usp_Chuyen_Trang_Thai_Nhan_Vien
@ID INT,
@TRANGTHAI INT
AS
BEGIN
	UPDATE NhanVien SET trangthai=@TRANGTHAI WHERE id=@ID
END;
GO


-- procedure Xem thông tin đầu sách
CREATE PROCEDURE usp_Xem_Dau_Sach
AS
BEGIN
   SELECT * FROM DauSach;
END;
GO

-- procedure Xem thông tin đầu sách
CREATE OR ALTER PROCEDURE usp_Xem_DauSachDTO
AS
BEGIN
SELECT DauSach.id, DauSach.tieude, TheLoai.ten as 'theloai', DauSach.gia
FROM DauSach INNER JOIN TheLoai ON DauSach.maTheLoai = TheLoai.id;
END;

GO
-- procedure Thêm thông tin đầu sách
CREATE PROCEDURE usp_Them_Dau_Sach
   @tieude NVARCHAR(30),
   @mota NVARCHAR(200),
   @gia INT,
   @ngayxuatban DATE,
   @hinhanh NVARCHAR(100),
   @loai INT,
   @trangthai INT,
   @maNXB INT,
   @maNgonNgu INT,
   @maTheLoai INT
AS
BEGIN
   INSERT INTO DauSach (
      tieude, 
      mota, 
      gia,
      ngayxuatban,
      hinhanh,
      loai,
      trangthai,
      maNXB,
      maNgonNgu,
      maTheLoai
   )
   VALUES (
      @tieude, 
      @mota, 
      @gia,
      @ngayxuatban,
      @hinhanh,
      @loai,
      @trangthai,
      @maNXB,
      @maNgonNgu,
      @maTheLoai
   );
END;

GO

-- procedure Chuyển trạng thái đầu sách ( Cho mượn, không cho mượn)
CREATE PROCEDURE usp_Chuyen_Trang_Thai_Dau_Sach
   @id INT,
   @trangthai INT
AS
BEGIN
   UPDATE DauSach
   SET trangthai = @trangthai
   WHERE id=@id;
END;

GO

-- procedure Liệt kê sách theo trạng thái 
CREATE PROCEDURE usp_Liet_Ke_Sach_Theo_Trang_Thai
   @trangthai INT
AS
BEGIN
   SELECT * FROM DauSach WHERE trangthai=@trangthai;
END;

GO

-- procedure Liệt kê những độc giả đang mượn sách
CREATE PROCEDURE usp_Liet_Ke_Doc_Gia_Dang_Muon_Sach
AS
BEGIN
   SELECT DocGia.ten, DocGia.mssv, DocGia.khoa FROM 
   DocGia INNER JOIN Muon ON DocGia.id = Muon.maDocGia;
END;

GO

-- procedure Liệt kê những độc giả đang mượn sách quá hạn
CREATE PROCEDURE usp_Liet_Ke_Doc_Gia_Dang_Muon_Sach_Qua_Han
AS
BEGIN
   SELECT DocGia.ten, DocGia.mssv, DocGia.khoa FROM 
   DocGia INNER JOIN Muon ON DocGia.id = Muon.maDocGia
   WHERE MONTH(GETDATE())-MONTH(Muon.ngaymuon) >=6;
END;

GO

-- procedure Xem sách theo tác giả
CREATE PROCEDURE usp_Xem_Sach_Theo_Tac_Gia
@id INT
AS
BEGIN
   SELECT DauSach.tieude, DauSach.mota, DauSach.hinhanh FROM 
   TacGia INNER JOIN tacgia_sach ON TacGia.id = tacgia_sach.maTacGia
   INNER JOIN DauSach ON DauSach.id = tacgia_sach.maDauSach
   WHERE TacGia.id = @id;
END;

GO

-- procedure Xem sách theo danh mục
CREATE PROCEDURE usp_Xem_Sach_Theo_Danh_Muc
@id INT
AS
BEGIN
   SELECT DauSach.tieude, DauSach.mota, DauSach.hinhanh FROM 
   DauSach INNER JOIN TheLoai ON DauSach.maTheLoai = TheLoai.id
   WHERE TheLoai.id = @id;
END;
GO


-- procedure xem thông tin phiếu mượn
CREATE PROCEDURE usp_Xem_Thong_Tin_Phieu_Muon
@id INT
AS
BEGIN
   SELECT * FROM Muon
   WHERE id = @id;
END;
GO
-- procedure thêm thông tin phiếu mượn
CREATE proc usp_Them_Thong_Tin_Phieu_Muon
  @ngaymuon DATE,
  @ngaytra DATE,
  @ngayhethan DATE,
  @trangthai INT,
  @tienphat INT,
  @maNhanVien INT,
  @maDocGia INT
AS
BEGIN
	INSERT INTO Muon VALUES(@ngaymuon, @ngaytra, @ngayhethan, @trangthai, @tienphat ,@maNhanVien, @maDocGia)
END;

GO

-- procedure xóa thông tin phiếu mượn quá hạn ( trên 1 năm )
CREATE PROC usp_Xoa_Phieu_Muon_Qua_Han
AS
BEGIN
	DELETE FROM Muon WHERE DATEDIFF(day, GETDATE(), Muon.ngaytra) > 365
END;
GO

-- procedure đổi mật khẩu nhân viên
CREATE PROC usp_Doi_Mat_Khau_Nhan_Vien
@ID INT,
@MATKHAU NVARCHAR(100)
AS
BEGIN
	UPDATE NhanVien SET matkhau=@MATKHAU WHERE id=@ID
END;
GO

-- procedure xem đầu sách theo nhà xuất bản
CREATE PROCEDURE usp_Xem_Dau_Sach_Theo_Nha_Xuat_Ban
@maNXB INT
AS
BEGIN
   SELECT * FROM DauSach INNER JOIN NhaXuatBan ON DauSach.maNXB = NhaXuatBan.id
   WHERE NhaXuatBan.id = @maNXB;
END;
GO

--================ Create Function ====================================

-- function trả về tổng lương nhân viên
CREATE FUNCTION fn_Tong_Luong_Nhan_Vien()
RETURNS INT AS
BEGIN
   DECLARE @salary INT;
   SELECT @salary = COUNT(HoSo.luong) FROM NhanVien
	INNER JOIN HoSo ON NhanVien.maHoSo = HoSo.id;
   RETURN @salary;
END;
GO
-- function trả về tổng số lượng sách theo trạng thái
CREATE FUNCTION fn_Tong_Sach_Theo_Trang_Thai(
@ID_DAU_SACH INT,
@TRANG_THAI INT
)
RETURNS INT
AS
BEGIN
	DECLARE @NUMBER INT;
	SELECT @NUMBER=COUNT(*) FROM Sach WHERE maDauSach=@ID_DAU_SACH and trangthai=@TRANG_THAI;
	RETURN @NUMBER
END;
GO
-- function trả về tổng số cuốn sách
CREATE OR ALTER FUNCTION fn_Tong_Sach(
@ID_DAU_SACH INT
)
RETURNS INT
AS
BEGIN
	DECLARE @NUMBER INT;
	SELECT @NUMBER=COUNT(*) FROM Sach WHERE maDauSach=@ID_DAU_SACH;
	RETURN @NUMBER
END;

GO

-- function trả về vai trò theo nhân viên
CREATE OR ALTER FUNCTION fn_Vai_Tro_Nhan_Vien( @id INT)
RETURNS INT AS
BEGIN
   DECLARE @vaitro INT;
   SELECT @vaitro = VaiTro.id FROM NhanVien
	INNER JOIN vaitro_nhanVien ON @id = vaitro_nhanVien.maNhanVien
		INNER JOIN VaiTro ON vaitro_nhanVien.maVaiTro=VaiTro.id;
   RETURN @vaitro;
END;
GO
USE QuanLyThuVien;
SELECT * FROM VaiTro;
SELECT * FROM NhanVien;
SELECT * FROM vaitro_nhanVien;
SELECT dbo.fn_Vai_Tro_Nhan_Vien (1) AS abc;

GO
-- function kiểm tra đăng nhập 
CREATE PROC usp_Kiem_Tra_Dang_Nhap 
    @tenDangNhap NVARCHAR(40),
    @matKhau Nvarchar(100)
AS
BEGIN

DECLARE @maNhanVien INT
SELECT @maNhanVien = NhanVien.id FROM NhanVien WHERE NhanVien.tenDangNhap = @tenDangNhap AND NhanVien.matkhau = @matKhau
IF (@maNhanVien IS NOT NULL)
    SELECT @maNhanVien 
ELSE
    SELECT -1

END



GO

CREATE FUNCTION fn_Kiem_Tra_Dang_Nhap (
    @tenDangNhap NVARCHAR(40),
    @matKhau Nvarchar(100) )
RETURNS INT
AS
BEGIN

DECLARE @maNhanVien INT
SELECT @maNhanVien = NhanVien.id FROM NhanVien WHERE NhanVien.tenDangNhap = @tenDangNhap AND NhanVien.matkhau = @matKhau
IF (@maNhanVien IS NOT NULL)
   RETURN @maNhanVien
ELSE 
   RETURN -1;
END
GO



--================ INSERT DATA ====================================

INSERT INTO TheLoai VALUES(N'Công nghệ thông tin');
INSERT INTO TheLoai VALUES(N'Kỹ thuật dữ liệu');
INSERT INTO TheLoai VALUES(N'Ngôn ngữ anh');
INSERT INTO TheLoai VALUES(N'Sư phạm');
INSERT INTO TheLoai VALUES(N'Công nghệ thực phẩm');
INSERT INTO TheLoai VALUES(N'Công nghệ hóa học');
INSERT INTO TheLoai VALUES(N'Xây dựng');
INSERT INTO TheLoai VALUES(N'Thương mại điện tử');


INSERT INTO NgonNgu VALUES(N'Tiếng việt');
INSERT INTO NgonNgu VALUES(N'Tiếng anh');
INSERT INTO NgonNgu VALUES(N'Tiếng trung');
INSERT INTO NgonNgu VALUES(N'Tiếng nhật');
INSERT INTO NgonNgu VALUES(N'Tiếng hàn');
INSERT INTO NgonNgu VALUES(N'Song ngữ');

INSERT INTO TacGia VALUES(N'Nguyễn Trường Thịnh');
INSERT INTO TacGia VALUES(N'Nguyễn Nhật Ánh');
INSERT INTO TacGia VALUES(N'Lê Công Tú');
INSERT INTO TacGia VALUES(N'Nguyễn Văn Ngọc');

INSERT INTO NhaXuatBan VALUES(N'Kim Đồng');
INSERT INTO NhaXuatBan VALUES(N'Lao động');
INSERT INTO NhaXuatBan VALUES(N'Trẻ');

INSERT INTO VaiTro VALUES(N'Quản lý',N'Quản lý mọi thứ');
INSERT INTO VaiTro VALUES(N'Thủ thư',N'Quản lý cho/nhận sách');


INSERT INTO DocGia VALUES(N'Lê Hải Đăng',N'201106123','Công nghệ thông tin',1);
INSERT INTO DocGia VALUES(N'Hứa Lộc Sơn',N'20110345','Công nghệ thông tin',1);
INSERT INTO DocGia VALUES(N'Lê Anh Kiệt',N'20110678','Công nghệ thông tin',1);
INSERT INTO DocGia VALUES(N'Nguyễn Hưng Khang',N'20110912','Kỹ thuật dữ liệu',1);
INSERT INTO DocGia VALUES(N'Nguyễn Văn Tèo',N'20110722','Công nghệ hóa học',1);

INSERT INTO DauSach VALUES(N'Tôi thấy hoa vàng trên cỏ xanh', N'Một cuốn sách dành cho giới trẻ',30000,'06-04-2012','None',1,1,1,1,1);
INSERT INTO DauSach VALUES(N'Mắt biếc', N'Một cuốn sách dành cho giới trẻ',30000,'06-04-2012','None',1,2,2,2,2);
INSERT INTO DauSach VALUES(N'Xác suất thống kê', N'Một cuốn sách dạy xác suất hay',30000,'06-04-2012','None',0,3,3,3,3);
INSERT INTO DauSach VALUES(N'Toán 2', N'Một cuốn sách dạy toán 2 hay',30000,'05-04-2011','None',0,4,3,4,4);

INSERT INTO HoSo VALUES(N'Khải', N'Nguyễn',N'241 Nguyễn Trãi, Lái Thiêu, Thuận An, Bình Dương','0783511740','none','20110655@student.hcmute.edu.vn',1,'06-06-2002',null);
INSERT INTO HoSo VALUES(N'Tuấn Kiệt', N'Lê Nguyễn',N'241 Đông Ba, Đống Đa, Hà Tĩnh','0783511234','none','20110234@student.hcmute.edu.vn',1,'09-17-2002',2000000);
INSERT INTO HoSo VALUES(N'Hà', N'Vĩ Khang',N'22 Và trong mơ, anh hái bông hoa cài lên tóc em','0767111345','none','20110211@student.hcmute.edu.vn',1,'12-17-2002',2000000);
INSERT INTO HoSo VALUES(N'Nguyễn', N'Đức Thịnh',N'12 Mỗi sáng chủ nhật, trời không có mây bay','0767223451','none','201102221@student.hcmute.edu.vn',1,'12-17-2002',2000000);

INSERT INTO NhanVien VALUES(N'khainguyen','12345678',1,1);
INSERT INTO NhanVien VALUES(N'kietnguyen','12345678',1,2);
INSERT INTO NhanVien VALUES(N'vikhang','12345678',1,3);
INSERT INTO NhanVien VALUES(N'thinhNguyen','12345678',1,4);


INSERT INTO Muon VALUES('11-1-2021',null,'11-1-2022',1,null,1,1);
INSERT INTO Muon VALUES('10-14-2021',null,'10-14-2022',1,null,2,2);
INSERT INTO Muon VALUES('9-12-2021','9-10-2022','9-12-2022',1,null,3,3);
INSERT INTO Muon VALUES('7-23-2021','7-19-2022','7-23-2022',1,null,4,4);

INSERT INTO tacgia_sach VALUES(1,1);
INSERT INTO tacgia_sach VALUES(2,1);
INSERT INTO tacgia_sach VALUES(3,2);
INSERT INTO tacgia_sach VALUES(4,3);

INSERT INTO vaitro_nhanVien VALUES(1,1);
INSERT INTO vaitro_nhanVien VALUES(2,2);
INSERT INTO vaitro_nhanVien VALUES(3,2);
INSERT INTO vaitro_nhanVien VALUES(4,2);

INSERT INTO Sach VALUES(1,'Kệ 1',1);
INSERT INTO Sach VALUES(-1,'Kệ 1',1);
INSERT INTO Sach VALUES(0,'Kệ 1',1);
INSERT INTO Sach VALUES(1,'Kệ 1',1);
INSERT INTO Sach VALUES(1,'Kệ 1',1);
INSERT INTO Sach VALUES(1,'Kệ 2',2);
INSERT INTO Sach VALUES(0,'Kệ 2',2);
INSERT INTO Sach VALUES(-1,'Kệ 2',2);
INSERT INTO Sach VALUES(1,'Kệ 2',2);
INSERT INTO Sach VALUES(1,'Kệ 3',3);
INSERT INTO Sach VALUES(0,'Kệ 3',3);
INSERT INTO Sach VALUES(-1,'Kệ 3',3);
INSERT INTO Sach VALUES(1,'Kệ 3',3);
INSERT INTO Sach VALUES(1,'Kệ 2',4);
INSERT INTO Sach VALUES(0,'Kệ 2',4);
INSERT INTO Sach VALUES(-1,'Kệ 2',4);
INSERT INTO Sach VALUES(1,'Kệ 2',4);


INSERT INTO MuonSach VALUES(1,1);
INSERT INTO MuonSach VALUES(2,1);
INSERT INTO MuonSach VALUES(2,2);
INSERT INTO MuonSach VALUES(3,3);
INSERT INTO MuonSach VALUES(4,4);

select * from hoso