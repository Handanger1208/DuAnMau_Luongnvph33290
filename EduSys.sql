CREATE DATABASE Han
GO

USE Han
GO 

--TẠO BẢNG

/*==============================================================*/
/* Table: Nhân Viên                                             */
/*==============================================================*/

IF OBJECT_ID('NhanVien') IS NOT NULL
DROP TABLE NhanVien
GO

CREATE TABLE NhanVien
(
MaNV NVARCHAR(50) PRIMARY KEY NOT NULL,
MatKhau NVARCHAR(50) NOT NULL,
HoTen NVARCHAR(50) NOT NULL,
VaiTro BIT NOT NULL
)
GO

/*==============================================================*/
/* Table: Chuyên Đề                                             */
/*==============================================================*/

IF OBJECT_ID('ChuyenDe') IS NOT NULL
DROP TABLE ChuyenDe
GO

CREATE TABLE ChuyenDe
(
MaCD NCHAR(5) PRIMARY KEY NOT NULL,
TenCD NVARCHAR(50) NOT NULL,
HocPhi FLOAT NOT NULL,
ThoiLuong INT NOT NULL,
Hinh NVARCHAR(50) NOT NULL,
MoTa NVARCHAR(255) NOT NULL
)
GO

/*==============================================================*/
/* Table: Khóa Học                                              */
/*==============================================================*/

IF OBJECT_ID('KhoaHoc') IS NOT NULL
DROP TABLE KhoaHoc
GO

CREATE TABLE KhoaHoc
(
MaKH INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
MaCD NCHAR(5) NOT NULL,
HocPhi FLOAT NOT NULL,
ThoiLuong INT NOT NULL,
NgayKG DATE NOT NULL,
GhiChu NVARCHAR(50) NULL,
MaNV NVARCHAR(50) NOT NULL,
NgayTao DATE NOT NULL,
CONSTRAINT FK_KH_CD FOREIGN KEY(MaCD) REFERENCES ChuyenDe(MaCD) ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT FK_KH_NV FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO

INSERT INTO KhoaHoc(MaCD, HocPhi, ThoiLuong, NgayKG, GhiChu, MaNV, NgayTao) VALUES(N'CD02', 12, 23, '2022-11-10', N'Check', N'PH33066', '2022-10-10')
INSERT INTO KhoaHoc(MaCD, HocPhi, ThoiLuong, NgayKG, GhiChu, MaNV, NgayTao) VALUES(N'CD03', 15, 23, '2022-11-10', N'Check', N'PH33066', '2022-10-10')
INSERT INTO KhoaHoc(MaCD, HocPhi, ThoiLuong, NgayKG, GhiChu, MaNV, NgayTao) VALUES(N'CD04', 5, 23, '2022-11-10', N'Check', N'PH33066', '2022-10-10')
INSERT INTO KhoaHoc(MaCD, HocPhi, ThoiLuong, NgayKG, GhiChu, MaNV, NgayTao) VALUES(N'CD05', 7, 23, '2022-11-10', N'Check', N'PH33066', '2022-10-10')
INSERT INTO KhoaHoc(MaCD, HocPhi, ThoiLuong, NgayKG, GhiChu, MaNV, NgayTao) VALUES(N'CD06', 5, 23, '2022-11-10', N'Check', N'PH33066', '2022-10-10')

INSERT INTO KhoaHoc(MaKH, MaCD, HocPhi, ThoiLuong, NgayKG, GhiChu, MaNV, NgayTao) VALUES(?,?,?,?,?,?,?,?)

SELECT DISTINCT year(NgayKG) FROM KhoaHoc ORDER BY Year DESC

/*==============================================================*/
/* Table: Người Học                                             */
/*==============================================================*/

IF OBJECT_ID('NguoiHoc') IS NOT NULL
DROP TABLE NguoiHoc
GO

CREATE TABLE NguoiHoc
(
MaNH NCHAR(7) PRIMARY KEY NOT NULL,
HoTen NVARCHAR(50) NOT NULL,
NgaySinh DATE NOT NULL,
GioiTinh BIT NOT NULL,
DienThoai NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL,
GhiChu NVARCHAR(max) NULL,
MaNV NVARCHAR(50) NOT NULL,
NgayDK DATE NOT NULL,
CONSTRAINT FK_NH_NV FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO

/*==============================================================*/
/* Table: Học Viên                                              */
/*==============================================================*/

IF OBJECT_ID('HocVien') IS NOT NULL
DROP TABLE HocVien
GO

CREATE TABLE HocVien
(
MaHV INT IDENTITY(1,1) PRIMARY KEY NOT NUll,
MaKH INT NOT NULL,
MaNH NCHAR(7) NOT NULL,
Diem FLOAT NOT NULL,
CONSTRAINT FK_HV_KH FOREIGN KEY(MaKH) REFERENCES KhoaHoc(MaKH),
CONSTRAINT FK_HV_NH FOREIGN KEY(MaNH) REFERENCES NguoiHoc(MaNH)
)
GO

---Thêm dữ liệu
INSERT INTO NhanVien VALUES
(N'PH33288',N'yennhi1',N'Nguyễn Thị Yến Nhi',1),
(N'PH33216',N'thuhong2',N'Nguyễn Thu Hồng',0),
(N'PH33066',N'camvan3',N'Nguyễn Thị Cẩm Vân',0),
(N'PH31265',N'quangthien4',N'Phạm Quang Thiện',0),
(N'PH32184',N'ducmanh5',N'Nguyễn Đức Mạnh',0)

INSERT INTO ChuyenDe VALUES
('CD01',N'Lập trình JDBC',18000,62,'anh1.jpg',N'Ok'),
('CD02',N'Lập trình Hibernate',37000,35,'anh2.jpg',N'Ok'),
('CD03',N'Lập trình C',40100,92,'anh3.jpg',N'Ok'),
('CD04',N'Lập trình Java',40100,65,'anh4.jpg',N'Ok'),
('CD05',N'Lập trình PHP',40100,46,'anh5.jpg',N'Ok'),
('CD06',N'Lập trình C++',98000,46,'anh6.jpg',N'Ok')


SELECT * FROM NhanVien
SELECT * FROM KhoaHoc
SELECT * FROM ChuyenDe
SELECT * FROM NguoiHoc
SELECT * FROM HocVien

-- Câu lệnh SQL cơ bản
INSERT INTO NhanVien (MaNV, MatKhau, HoTen, VaiTro) VALUES (?, ?, ?, ?)
UPDATE NhanVien SET MatKhau = ?, HoTen = ?, VaiTro = ? WHERE MaNV = ?
DELETE FROM NhanVien WHERE MaNV = ?
SELECT * FROM NhanVien WHERE MaNV = ?

INSERT INTO ChuyenDe(MaCD, TenCD, HocPhi, ThoiLuong, Hinh) VALUES(?,?,?,?,?)

SELECT MaCD,TenCD,HocPhi,ThoiLuong,Hinh FROM ChuyenDe WHERE MaCD=?

UPDATE ChuyenDe SET TenCD=?, HocPhi=?, ThoiLuong=?, Hinh=? , MoTa=? WHERE MaCD LIKE ?

