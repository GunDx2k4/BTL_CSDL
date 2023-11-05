CREATE DATABASE QuanLyGiangDay
USE QuanLyGiangDay

CREATE TABLE tblKhoa(
	sMaKhoa varchar(10),
	sTenKhoa nvarchar(20),
	sDiaChi nvarchar(50),
	CONSTRAINT PK_tblKhoa PRIMARY KEY (sMaKhoa)
)

CREATE TABLE tblPhongHoc(
	sMaPhong varchar(10),
	sTenPhong nvarchar(30),
	CONSTRAINT PK_tblPhongHoc PRIMARY KEY (sMaPhong)
)

CREATE TABLE tblGiangVien(
	sMaGV varchar(10),
	sTenGV nvarchar(30),
	bGioiTinh bit,
	sSDT varchar(10),
	sMaKhoa varchar(10),
	sChuyenMon varchar(30),
	CONSTRAINT PK_tblGiangVien PRIMARY KEY (sMaGV),
	FOREIGN KEY(sMaKhoa) REFERENCES tblKhoa(sMaKhoa)
)

CREATE TABLE tblMonHoc(
	sMaMon varchar(10),
	sTenMon nvarchar(30),
	iTinChi tinyint,
	CONSTRAINT PK_tblMonHoc PRIMARY KEY (sMaMon)
)

CREATE TABLE tblLopHoc(
	sMaLop varchar(10),
	sTenLop nvarchar(30),
	sMaMon varchar(10),
	iSiSo tinyint,
	sMaKhoa varchar(10),
	CONSTRAINT PK_tblLopHoc PRIMARY KEY (sMaLop),
	FOREIGN KEY(sMaKhoa) REFERENCES tblKhoa(sMaKhoa),
	FOREIGN KEY(sMaMon) REFERENCES tblMonHoc(sMaMon)
)

CREATE TABLE tblGiangDay(
	sMaLop varchar(10) NOT NULL,
	sMaGV varchar(10) NOT NULL,
	dNgayDay datetime NOT NULL,
	sMaPhong varchar(10) NOT NULL,
	sCaHoc varchar(10) NOT NULL,
	CONSTRAINT FK_sMaPhong FOREIGN KEY(sMaPhong) REFERENCES tblPhongHoc(sMaPhong),
	CONSTRAINT FK_sMaGV FOREIGN KEY(sMaGV) REFERENCES tblGiangVien(sMaGV),
	CONSTRAINT FK_sMaLop FOREIGN KEY(sMaLop) REFERENCES tblLopHoc(sMaLop)
)

ALTER TABLE tblGiangDay ADD 
CONSTRAINT PK_GiangDay PRIMARY KEY(sMaLop, sMaGV, dNgayDay)
GO

--INSERT KHOA
INSERT INTO tblKhoa VALUES('CNTT',N'Công nghệ thông tin',N'96 Định Công')
INSERT INTO tblKhoa VALUES('KT',N'Kinh tế',N'193 Vĩnh Hưng')
INSERT INTO tblKhoa VALUES('DL',N'Du lịch',N'301 Nguyễn Trãi')
INSERT INTO tblKhoa VALUES('TA',N'Tiếng Anh',N'301 Nguyễn Trãi')
GO

--INSTERT PHONGHOC
INSERT INTO tblPhongHoc VALUES('201','P201')
INSERT INTO tblPhongHoc VALUES('202','P202')
INSERT INTO tblPhongHoc VALUES('301','TH1')
INSERT INTO tblPhongHoc VALUES('302','TH2')
INSERT INTO tblPhongHoc VALUES('401','P401')
INSERT INTO tblPhongHoc VALUES('402','P402')
INSERT INTO tblPhongHoc VALUES('501','P501')
INSERT INTO tblPhongHoc VALUES('502','P502')
GO

--INSTERT GIANGVIEN
INSERT INTO tblGiangVien VALUES('GV01',N'Nguyễn Văn A',1,'0987654321','CNTT','CTDL')
INSERT INTO tblGiangVien VALUES('GV02',N'Nguyễn Văn B',1,'0987654377','CNTT','CSDL')
INSERT INTO tblGiangVien VALUES('GV03',N'Trần Văn C',1,'0987654366','CNTT','MTT')
INSERT INTO tblGiangVien VALUES('GV04',N'Nguyễn Thị D',0,'0987654326','TA','TA1')
INSERT INTO tblGiangVien VALUES('GV05',N'Lê Thị E',1,'0987654351','TA','Triet')
INSERT INTO tblGiangVien VALUES('GV06',N'Nguyễn Thị H',0,'0987654322','DL','KTMT')
INSERT INTO tblGiangVien VALUES('GV07',N'Nguyễn Văn A',1,'0987654323','KT','XSTK')
INSERT INTO tblGiangVien VALUES('GV08',N'Lê Thị G',0,'0987654324','CNTT','WEB')
INSERT INTO tblGiangVien VALUES('GV09',N'Nguyễn Văn F',1,'0987653377','CNTT','TA1')
INSERT INTO tblGiangVien VALUES('GV10',N'Lê Thị G',1,'0987652377','CNTT','CSDL')
GO

--INSTERT MONHOC
INSERT INTO tblMonHoc VALUES('CTDL',N'Cấu trúc dữ liệu',4)
INSERT INTO tblMonHoc VALUES('TRR',N'Toán rời rạc',3)
INSERT INTO tblMonHoc VALUES('CSDL',N'Cơ sở dữ liệu',4)
INSERT INTO tblMonHoc VALUES('MTT',N'Mạng và truyền thông',3)
INSERT INTO tblMonHoc VALUES('TA1',N'Tiếng Anh 1',4)
INSERT INTO tblMonHoc VALUES('TA2',N'Tiếng Anh 2',4)
INSERT INTO tblMonHoc VALUES('KTMT',N'Kiến trúc máy tính',4)
INSERT INTO tblMonHoc VALUES('WEB',N'Lập trình web',4)
INSERT INTO tblMonHoc VALUES('LTHDT',N'Lập trình hướng đối tượng',4)
INSERT INTO tblMonHoc VALUES('LTHSK',N'Lập trình hướng sự kiện',4)
GO

--INSTERT LOPHOC
INSERT INTO tblLopHoc VALUES('CSDLK1',N'Cơ sở dữ liệu','CSDL',50,'CNTT')
INSERT INTO tblLopHoc VALUES('CSDLK2',N'Cơ sở dữ liệu','CSDL',50,'CNTT')
INSERT INTO tblLopHoc VALUES('TRRK1',N'Toán rời rạc','TRR',45,'CNTT')
INSERT INTO tblLopHoc VALUES('TRRK2',N'Toán rời rạc','TRR',45,'CNTT')
INSERT INTO tblLopHoc VALUES('MTTK1',N'Mạng và truyền thông','MTT',65,'CNTT')
INSERT INTO tblLopHoc VALUES('MTTK2',N'Mạng và truyền thông','MTT',65,'CNTT')
INSERT INTO tblLopHoc VALUES('TA1K1',N'Tiếng Anh 1','TA1',50,'TA')
INSERT INTO tblLopHoc VALUES('TA1K2',N'Tiếng Anh 1','TA1',50,'TA')
INSERT INTO tblLopHoc VALUES('CTDLK1',N'Cấu trúc dữ liệu','CTDL',50,'CNTT')
INSERT INTO tblLopHoc VALUES('CTDLK2',N'Cấu trúc dữ liệu','CTDL',50,'CNTT')
GO

--INSTERT GIANGDAY
INSERT INTO tblGiangDay VALUES('CSDLK1','GV02','10/10/2023','201','Sang')
INSERT INTO tblGiangDay VALUES('CSDLK1','GV02','10/17/2023','201','Sang')
INSERT INTO tblGiangDay VALUES('CSDLK1','GV02','10/24/2023','201','Sang')
INSERT INTO tblGiangDay VALUES('CSDLK1','GV02','10/29/2023','201','Sang')

INSERT INTO tblGiangDay VALUES('CTDLK1','GV01','10/10/2023','401','Sang')
INSERT INTO tblGiangDay VALUES('CTDLK1','GV01','10/15/2023','401','Sang')
INSERT INTO tblGiangDay VALUES('CTDLK1','GV01','10/20/2023','401','Sang')
INSERT INTO tblGiangDay VALUES('CTDLK1','GV01','10/25/2023','401','Sang')

INSERT INTO tblGiangDay VALUES('CTDLK2','GV01','10/11/2023','401','Sang')
INSERT INTO tblGiangDay VALUES('CTDLK2','GV01','10/11/2023','401','Sang')
INSERT INTO tblGiangDay VALUES('CTDLK2','GV01','10/11/2023','401','Sang')
INSERT INTO tblGiangDay VALUES('CTDLK2','GV01','10/11/2023','401','Sang')

INSERT INTO tblGiangDay VALUES('TA1K1','GV04','10/15/2023','202','Chieu')
INSERT INTO tblGiangDay VALUES('TA1K1','GV04','10/20/2023','202','Chieu')
INSERT INTO tblGiangDay VALUES('TA1K1','GV04','10/25/2023','202','Chieu')
INSERT INTO tblGiangDay VALUES('TA1K1','GV04','10/30/2023','202','Chieu')

INSERT INTO tblGiangDay VALUES('MTTK1','GV03','10/11/2023','202','Sang')
INSERT INTO tblGiangDay VALUES('MTTK1','GV03','10/19/2023','202','Sang')
INSERT INTO tblGiangDay VALUES('MTTK1','GV03','10/24/2023','202','Sang')
INSERT INTO tblGiangDay VALUES('MTTK1','GV03','11/2/2023','202','Sang')

INSERT INTO tblGiangDay VALUES('CSDLK2','GV02','10/10/2023','202','Chieu')
INSERT INTO tblGiangDay VALUES('CSDLK2','GV02','10/17/2023','202','Chieu')
INSERT INTO tblGiangDay VALUES('CSDLK2','GV02','10/25/2023','202','Chieu')
INSERT INTO tblGiangDay VALUES('CSDLK2','GV02','11/1/2023','202','Chieu')
GO



--VIEW
--
--VIEW : Cho biet day cua tung giang vien
CREATE OR ALTER VIEW vvLichDay
AS
SELECT tblGiangDay.sMaGV, sTenGV, dNgayDay, sMaPhong, sCaHoc FROM tblGiangDay INNER JOIN tblGiangVien
ON tblGiangDay.sMaGV = tblGiangVien.sMaGV
GO

SELECT * FROM vvLichDay
GO

--VIEW : Cho biet phong con trong ngay 17/10/2023
ALTER VIEW vvPhongTrong
AS
SELECT tblPhongHoc.sMaPhong FROM tblPhongHoc
WHERE tblPhongHoc.sMaPhong NOT IN 
(
	SELECT sMaPhong FROM tblGiangDay
	WHERE dNgayDay = '10/17/2023'
)
GO

SELECT * FROM vvPhongTrong
GO

--VIEW : Tong ngay day hoc cua tung giang vien
ALTER VIEW vvTongNgayDay
AS
SELECT tblGiangVien.sMaGV, sTenGV, (CASE WHEN COUNT(tblGiangDay.sMaGV) > 0 THEN COUNT(tblGiangDay.sMaGV)ELSE 0 END) AS 'TongNgayDay' 
FROM tblGiangVien LEFT JOIN tblGiangDay
ON tblGiangVien.sMaGV = tblGiangDay.sMaGV
GROUP BY tblGiangVien.sMaGV, sTenGV
GO

SELECT * FROM vvTongNgayDay
GO

--VIEW : Cho biet lop hoc cua mon CSDL
ALTER VIEW vvLopHoc_CSDL
AS
SELECT sMaLop FROM tblLopHoc INNER JOIN tblMonHoc
ON tblLopHoc.sMaMon = tblMonHoc.sMaMon
WHERE tblMonHoc.sMaMon = 'CSDL'
GO

SELECT * FROM vvLopHoc_CSDL
GO

--VIEW : Cho biet lich hoc cua lop Cơ sở dữ liệu
ALTER VIEW vvLichHoc
AS
SELECT tblGiangDay.sMaLop, dNgayDay FROM tblGiangDay INNER JOIN tblLopHoc
ON tblLopHoc.sMaLop = tblGiangDay.sMaLop
WHERE tblLopHoc.sTenLop = N'Cơ sở dữ liệu'
GO

SELECT * FROM vvLichHoc
GO

-- VIew
--
--View: View danh sách các môn học cua thuoc chuyen mon cua giang vien

ALTER VIEW DanhSachMonHocChuyenMon AS
SELECT sMaGV, sTenGV, sMaMon, sTenMon
FROM tblGiangVien
JOIN tblMonHoc  ON sChuyenMon = sMaMon
GO

SELECT * FROM DanhSachMonHocChuyenMon
GO
--View : View danh sách cac giang vien co gioi tinh la nu 

ALTER VIEW DanhSachGiangVienNu AS
SELECT sMaGV, sTenGV, sSDT
FROM tblGiangVien
WHERE bGioiTinh  = 0
GO

SELECT * FROM DanhSachGiangVienNu
GO

--View: View Hien thi thong tin ca nhan cua giang vien thuoc khoa CNTT

ALTER VIEW ThongTinCaNhanGiangVienKhoaCNTT AS
SELECT tblGiangVien.sMaGV , tblGiangVien.sTenGV , tblGiangVien.sSDT, tblKhoa.sTenKhoa
FROM tblGiangVien 
JOIN tblKhoa ON tblGiangVien.sMaKhoa = tblKhoa.sMaKhoa
WHERE tblKhoa.sMaKhoa = 'CNTT'
GO

SELECT * FROM ThongTinCaNhanGiangVienKhoaCNTT
GO

--View: View danh sach lop hoc cua mon hoc CSDL

ALTER VIEW DanhSachLopHocMonHocCSDL AS
SELECT tblLopHoc.sMaLop, tblLopHoc.sTenLop, tblMonHoc.sTenMon
FROM tblLopHoc
JOIN tblMonHoc ON tblLopHoc.sMaMon = tblMonHoc.sMaMon
WHERE tblMonHoc.sTenMon = N'Cơ sở dữ liệu'
GO

SELECT * FROM DanhSachLopHocMonHocCSDL
GO

--PROCEDUCES
--
--PROC: Thêm phân công giảng dạy 
CREATE PROCEDURE Them_PCGD
    @MaGV INT,
    @MaLop INT,
    @CaHoc INT,
    @MaPhong INT,
    @NgayDay DATE
AS
BEGIN
    INSERT INTO tblGiangDay(sMaGV, sMaLop, sCaHoc, sMaPhong, dNgayDay)
    VALUES (@MaGV, @MaLop, @CaHoc, @MaPhong, @NgayDay)
END
GO

--PROC: Cập Nhật Phân Công Giảng Dạy
CREATE PROCEDURE CapNhat
	@MaGV INT,
    @MaLop INT,
    @CaHoc INT,
    @MaPhong INT,
    @NgayDay DATE
AS
BEGIN
    UPDATE tblGiangDay
    SET sMaGV = @MaGV,
		sMaLop = @MaLop,
		sCaHoc = @CaHoc,
		sMaPhong = @MaPhong,
		dNgayDay = @NgayDay

    WHERE dNgayDay = @NgayDay
END
GO

--PROC: Xóa Phân Công Giảng Dạy Cua 1 GV
CREATE PROCEDURE XoaPC_GiangDay
	@MaGV int
AS
BEGIN
    DELETE FROM tblGiangDay
    WHERE sMaGV = @MaGV
END
GO

--PROC: Liệt Kê Phân Công Giảng Dạy Theo Giảng Viên
CREATE PROCEDURE LietkeGV
    @MaGV int
AS
BEGIN
    SELECT *
    FROM tblGiangDay
    WHERE sMaGV =@MaGV
END
GO

--PROC: Xóa Phân Công Giảng Dạy Bằng ID Giảng Viên
CREATE PROCEDURE Xoabang_MaGV
	@MaGV int
AS
BEGIN
    DELETE FROM tblGiangDay
    WHERE sMaGV = @MaGV
END
GO

--TRIGGER
--
--TRIGGER : Gioi han si so
CREATE TRIGGER tg_MaxSiSo ON tblLopHoc
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS(SELECT 1 FROM INSERTED WHERE iSiSo > 50)
	BEGIN
		RAISERROR('Goi han si so <= 50', 16, 1)
        ROLLBACK TRAN
	END
	ELSE
		PRINT N'Kiem tra gioi han si so hop le'
END
GO

--TRIGGER : Kiem tra buoi day giang vien
CREATE TRIGGER tg_CheckLichDay ON tblGiangDay
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @MaGV varchar(10)
	DECLARE @NgayDay datetime
	DECLARE @CaDay varchar(10)
	SELECT @MaGV = sMaGV, @NgayDay = dNgayDay, @CaDay = sCaHoc FROM INSERTED 
	IF EXISTS(SELECT 1 FROM tblGiangDay WHERE sMaGV = @MaGV AND dNgayDay = @NgayDay AND sCaHoc = @CaDay)
	BEGIN
		RAISERROR('Giang vien da co ca day hom do', 16, 1)
        ROLLBACK TRAN
	END
	ELSE
		PRINT N'Kiem tra lich day hop le'
END
GO

--TRIGGER : Xoa Lop Hoc
CREATE TRIGGER tg_DeleteLopHoc ON tblLopHoc
AFTER DELETE
AS
BEGIN
	DECLARE @MaLop varchar(10)
	SELECT @MaLop = sMaLop FROM DELETED
    DELETE FROM tblGiangDay 
	WHERE sMaLop = @MaLop;
	PRINT N'Xoa thanh thanh cong'
END
GO

--TRIGGER : Kiem tra lop hoc da duoc phan cong
CREATE TRIGGER tg_CheckLopHoc ON tblGiangDay
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @MaLop varchar(10)
	DECLARE @NgayDay datetime
	SELECT @MaLop = sMaLop, @NgayDay = dNgayDay FROM INSERTED
   IF EXISTS(SELECT 1 FROM tblGiangDay WHERE sMaLop = @MaLop AND dNgayDay = @NgayDay)
	BEGIN
		RAISERROR('Lop hoc da co ca day hom do', 16, 1)
        ROLLBACK TRAN
	END
	ELSE
		PRINT N'Kiem tra lop hoc hop le'
END
GO

--TRIGGER : Gioi han lop hoc cua tung mon hoc
CREATE TRIGGER tg_CheckLopHoc ON tblLopHoc
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @MaMon varchar(10)
	SELECT @MaMon = sMaMon FROM INSERTED
	IF ((SELECT COUNT(sMaLop) FROM tblLopHoc WHERE sMaMon = @MaMon) > 5)
	BEGIN
		RAISERROR('Goi han lop hoc cua tung mon hoc <= 5', 16, 1)
        ROLLBACK TRAN
	END
	ELSE
		PRINT N'Kiem tra gioi han lop hoc hop le'
END
GO