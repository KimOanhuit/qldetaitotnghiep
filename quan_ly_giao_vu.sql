
create database quan_ly_giao_vu
go

use quan_ly_giao_vu
go

create table SINHVIEN
(
	MSSV char(8) primary key,
	TENSV nvarchar(30) not null,
	SODT varchar(10),
	LOP char(10) not null,
	DIACHI nchar(50) not null

)

create table DETAI
(
	MSDT char(6) primary key,
	TENDT nvarchar(30) not null
)

create table SV_DETAI
(
	MSSV char(8) foreign key references SINHVIEN(MSSV),
	MSDT char(6) foreign key references DETAI(MSDT),
	constraint PK_SV_DETAI primary key(MSSV, MSDT)
)

create table HOCHAM
(
	MSHH int primary key,
	TENHH nvarchar(20) not null
)

create table GIAOVIEN
(
	MSGV int primary key,
	TENGV nvarchar(30) not null,
	DIACHI nvarchar(50) not null,
	SODT nvarchar(10)not null,
	MSHH int foreign key references HOCHAM(MSHH),
	NAMHH smalldatetime not null
)

create table HOCVI
(
	MSHV int primary key,
	TENHV nvarchar(10) not null
)	

create table CHUYENNGANH
(
	MSCN int primary key,
	TENCN nvarchar(30) not null
)

create table GV_HV_CN
(
	MSGV int foreign key references GIAOVIEN(MSGV),
	MSHV int foreign key references HOCVI(MSHV),
	MSCN int foreign key references CHUYENNGANH(MSCN),
	NAM smalldatetime not null,
	constraint PK_GV_HV_CN primary key(MSGV, MSHV, MSCN)
)

create table GV_HDDT
(
	MSGV int foreign key references GIAOVIEN(MSGV),
	MSDT char(6) foreign key references DETAI(MSDT),
	DIEM float not null,
	constraint PK_GV_HDDT primary key(MSGV, MSDT)
)

create table GV_PBDT
(
	MSGV int foreign key references GIAOVIEN(MSGV),
	MSDT char(6) foreign key references DETAI(MSDT),
	DIEM float not null,
	constraint PK_GV_PBDT primary key(MSGV, MSDT)
)

create table GV_UVDT
(
	MSGV int foreign key references GIAOVIEN(MSGV),
	MSDT char(6) foreign key references DETAI(MSDT),
	DIEM float not null,
	constraint PK_GV_UVDT primary key(MSGV, MSDT)
)

create table HOIDONG
(	
	MSHD int primary key,
	PHONG int,
	TGBD smalldatetime,
	NGAYHD smalldatetime not null,
	TINHTRANG nvarchar(30) not null,
	MSGVCTHD int foreign key references GIAOVIEN(MSGV)
)

create table HOIDONG_GV
(
	MSHD int foreign key references HOIDONG(MSHD),
	MSGV int foreign key references GIAOVIEN(MSGV),
	constraint PK_HOIDONG_GV primary key(MSHD, MSGV)
)

create table HOIDONG_DT
(
	MSHD int foreign key references HOIDONG(MSHD),
	MSDT char(6) foreign key references DETAI(MSDT),
	QUYETDINH nchar(10),
	constraint PK_HOIDONG_DT primary key(MSHD, MSDT)
)

insert into SINHVIEN(MSSV, TENSV, SODT, LOP, DIACHI)
values ('13520001', N'Nguyễn Văn An', '0906762255','SE103.U32', 'THỦ ĐỨC')
insert into SINHVIEN(MSSV, TENSV, SODT, LOP, DIACHI)
values ('13520002',N'Phan Tấn Đạt',	'0975672350',	'IE204.T21', 'QUẬN 1')
insert into SINHVIEN(MSSV, TENSV, SODT, LOP, DIACHI)
values ('13520003',	N'Nguyễn Anh Hải',	'0947578688',	'IE205.R12',	'QUẬN 9')
insert into SINHVIEN(MSSV, TENSV, SODT, LOP, DIACHI)
values ('13520004',	N'Phạm Tài','0956757869', 'IE202.A22',	'QUẬN 1')
insert into SINHVIEN(MSSV, TENSV, SODT, LOP, DIACHI)
values ('13520005',	N'Lê Thúy Hằng',	'0976668688',	'SE304.E22',	'THỦ ĐỨC')
insert into SINHVIEN(MSSV, TENSV, SODT, LOP, DIACHI)
values ('13520006',	N'Ưng Hồng Ân',	'0957475898',	'IE208.F33',	'QUẬN 2')

select * from  SINHVIEN
---B.BẢNG DETAI
INSERT INTO DETAI VALUES('97001',N'Quản lý thư viện')
INSERT INTO DETAI VALUES('97002',N'Nhận dạng vân tay')
INSERT INTO DETAI VALUES('97003',N'Bán đấu giá trên mạng')
INSERT INTO DETAI VALUES('97004',N'Quản lý siêu thị')
INSERT INTO DETAI VALUES('97005',N'Xử lý ảnh')
INSERT INTO DETAI VALUES('97006',N'Hệ giải toán thông minh')

---C.BẢNG SV_DETAI
INSERT INTO SV_DETAI VALUES('13520001','97004')
INSERT INTO SV_DETAI VALUES('13520002','97005')
INSERT INTO SV_DETAI VALUES('13520003','97001')
INSERT INTO SV_DETAI VALUES('13520004','97002')
INSERT INTO SV_DETAI VALUES('13520005','97003')
INSERT INTO SV_DETAI VALUES('13520006','97005')
--D. BẢNG HOCHAM
INSERT INTO HOCHAM VALUES(1,N'PHÓ GIÁO SƯ')
INSERT INTO HOCHAM VALUES(2,N'GIÁO SƯ')
---E. BẢNG GIAOVIEN
INSERT INTO GIAOVIEN VALUES(00201,N'Trần Trung',N'Bến Tre','35353535',1,'1996')
INSERT INTO GIAOVIEN VALUES(00202,N'Nguyễn Văn An',N'Tiền Giang','67868688',1,'1996')
INSERT INTO GIAOVIEN VALUES(00203,N'Trần Thu Trang',N'Cần Thơ','74758687',1,'1996')
INSERT INTO GIAOVIEN VALUES(00204,N'Nguyễn Thị Loan',N'TP. HCM','56575868',2,'2005')
INSERT INTO GIAOVIEN VALUES(00205,N'Chu Tiến',N'Hà Nội','46466646',2,'2005')
---F.BẢNG HOCVI
INSERT INTO HOCVI VALUES(1,N'Kỹ sư')
INSERT INTO HOCVI VALUES(2,N'Cử Nhân')
INSERT INTO HOCVI VALUES(3,N'Thạc sĩ')
INSERT INTO HOCVI VALUES(4,N'Tiến sĩ')
INSERT INTO HOCVI VALUES(5,N'Tiến sĩ Khoa học')	
---G. BẢNG CHUYENNGANH
INSERT INTO CHUYENNGANH VALUES(1,N'Công nghệ Web')
INSERT INTO CHUYENNGANH VALUES(2,N'Mạng xã hội')
INSERT INTO CHUYENNGANH VALUES(3,N'Quản lý CNTT')
INSERT INTO CHUYENNGANH VALUES(4,N'GIS')
---H. BẢNG GV_HV_CN
INSERT INTO GV_HV_CN VALUES(00201,1,1,'2013')
INSERT INTO GV_HV_CN VALUES(00201,1,2,'2013')
INSERT INTO GV_HV_CN VALUES(00201,2,1,'2014')
INSERT INTO GV_HV_CN VALUES(00202,3,2,'2013')
INSERT INTO GV_HV_CN VALUES(00203,2,4,'2014')
INSERT INTO GV_HV_CN VALUES(00204,3,2,'2014')
---I. BẢNG GV_HDDT
INSERT INTO GV_HDDT VALUES(00201,'97001',8)
INSERT INTO GV_HDDT VALUES(00202,'97002',7)
INSERT INTO GV_HDDT VALUES(00205,'97001',9)
INSERT INTO GV_HDDT VALUES(00204,'97004',7)
INSERT INTO GV_HDDT VALUES(00203,'97005',9)
---J. BẢNG GV_PBDT
INSERT INTO GV_PBDT VALUES(00201,'97005',8)
INSERT INTO GV_PBDT VALUES(00202,'97001',7)
INSERT INTO GV_PBDT VALUES(00205,'97004',9)
INSERT INTO GV_PBDT VALUES(00204,'97003',7)
INSERT INTO GV_PBDT VALUES(00203,'97002',9)
---K. BẢNG GV_UVDT
INSERT INTO GV_UVDT VALUES(00205,'97005',8)
INSERT INTO GV_UVDT VALUES(00202,'97005',7)
INSERT INTO GV_UVDT VALUES(00204,'97005',9)
INSERT INTO GV_UVDT VALUES(00203,'97001',7)
INSERT INTO GV_UVDT VALUES(00204,'97001',9)
INSERT INTO GV_UVDT VALUES(00205,'97001',8)
INSERT INTO GV_UVDT VALUES(00203,'97003',7)
INSERT INTO GV_UVDT VALUES(00201,'97003',9)
INSERT INTO GV_UVDT VALUES(00202,'97003',7)
INSERT INTO GV_UVDT VALUES(00201,'97004',9)
INSERT INTO GV_UVDT VALUES(00202,'97004',8)
INSERT INTO GV_UVDT VALUES(00203,'97004',7)
INSERT INTO GV_UVDT VALUES(00201,'97002',9)
INSERT INTO GV_UVDT VALUES(00204,'97002',7)
INSERT INTO GV_UVDT VALUES(00205,'97002',9)
---L. BẢNG HOIDONG
INSERT INTO HOIDONG VALUES(1,002,'7:00','29/11/2014',N'Thật',00201)
INSERT INTO HOIDONG VALUES(2,102,'7:00','5/12/2014',N'Thật',00202)
INSERT INTO HOIDONG VALUES(3,003,'8:00','6/12/2014',N'Thật',00203)
---M. BẢNG HOIDONG_GV
INSERT INTO HOIDONG_GV VALUES(1,00201)
INSERT INTO HOIDONG_GV VALUES(1,00202)
INSERT INTO HOIDONG_GV VALUES(1,00203)
INSERT INTO HOIDONG_GV VALUES(1,00204)
INSERT INTO HOIDONG_GV VALUES(2,00203)
INSERT INTO HOIDONG_GV VALUES(2,00202)
INSERT INTO HOIDONG_GV VALUES(2,00205)
INSERT INTO HOIDONG_GV VALUES(2,00204)
INSERT INTO HOIDONG_GV VALUES(3,00201)
INSERT INTO HOIDONG_GV VALUES(3,00202)
INSERT INTO HOIDONG_GV VALUES(3,00203)
INSERT INTO HOIDONG_GV VALUES(3,00204)
INSERT INTO HOIDONG_GV VALUES(4,00203)
INSERT INTO HOIDONG_GV VALUES(4,00202)
INSERT INTO HOIDONG_GV VALUES(4,00205)
INSERT INTO HOIDONG_GV VALUES(4,00204)
---N. BẢNG HOIDONG_DT
INSERT INTO HOIDONG_DT VALUES(1,'97001',N'Được')
INSERT INTO HOIDONG_DT VALUES(1,'97002',N'Được')
INSERT INTO HOIDONG_DT VALUES(2,'97001',N'Không')
INSERT INTO HOIDONG_DT VALUES(2,'97004',N'Không')
INSERT INTO HOIDONG_DT VALUES(1,'97005',N'Được')
INSERT INTO HOIDONG_DT VALUES(3,'97001',N'Không')
INSERT INTO HOIDONG_DT VALUES(3,'97002',N'Được')

/* A. STORED PROCEDUREDS VỚI THAM SỐ VÀO */
  
/* CAU 1: Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Trước khi insert dữ liệu cần kiểm tra MSHH đã tồn tại trong table HOCHAM chưa, 
nếu chưa thì trả về giá trị 0.*/

create proc cau1
(
	@MSGV int,
	@TENGV nvarchar(30),
	@DIACHI nvarchar(50),
	@SODT nvarchar(10),
	@MSHH int,
	@NAMHH smalldatetime
)

as
	begin 
		if exists (select MSHH from HOCHAM where MSHH=@MSHH)
			begin
				insert into GIAOVIEN(MSGV, TENGV,SODT, DIACHI, MSHH, NAMHH)
				values (@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
				print 'Chen thanh cong'
			end
		else
			print 'MSHH chua ton tai trong table HOCHAM'
			return 0
	end

exec cau1 00206,N'Đậu Thị Kim Oanh',N'Hà Tĩnh','0987554394',2,'2016'

/*CAU 2: Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Trước khi insert dữ liệu cần kiểm tra MSGV trong table GIAOVIEN có trùng không, 
nếu trùng thì trả về giá trị 0.*/

create proc cau2
(
	@MSGV int,
	@TENGV nvarchar(30),
	@DIACHI nvarchar(50),
	@SODT nvarchar(10),
	@MSHH int,
	@NAMHH smalldatetime
)

as

	begin
		if exists (select MSHH from HOCHAM where MSHH=@MSHH)
			begin
				if not exists (select MSGV from GIAOVIEN where MSGV=@MSGV)
					begin
						insert into GIAOVIEN(MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH)
						values (@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
						print 'Chen thanh cong'
					end
					else
						print 'Da ton tai MSGV nay trong table GIAOVIEN'
						return 0
			end
	end

exec cau2 00207,N'Đậu Thị Kieu Oanh',N'Hà Tĩnh','0987554394',2,'2016'

select * from GIAOVIEN
			
/* CAU 3: Giống (1) và (2) kiểm tra xem MSGV có trùng không? MSHH có tồn tại chưa? Nếu MSGV trùng thì trả về 0. Nếu MSHH chưa tồn tại trả về 1, 
ngược lại cho insert dữ liệu. */

create proc cau3
(
	@MSGV int,
	@TENGV nvarchar(30),
	@DIACHI nvarchar(50),
	@SODT nvarchar(10),
	@MSHH int,
	@NAMHH smalldatetime
)

as 

	begin
		if exists(select MSHH from HOCHAM where MSHH=@MSHH)
			begin
				if not exists (select MSGV from GIAOVIEN where MSGV=@MSGV)
					begin
						insert into GIAOVIEN(MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH)
						values (@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
						print 'Chen thanh cong'
					end
				else
					print 'Da ton tai MSGV nay trong table GIAOVIEN'
					return 0
		end
		else
			print 'Chua co du lieu trong table HOCHAM'
			return 1
	end
			
exec cau3 00207,N'Đậu Thị Kieu Oanh',N'Hà Tĩnh','0987554394',2,'2016'	

/* CAU 4: Đưa vào MSDT cũ, TENDT mới. Hãy cập nhật tên đề tài mới với mã đề tài cũ không đổi nếu không tìm thấy trả về 0 ngược lại cập nhật trả về 1. */

create proc cau4
(
	@MSDT char(6),
	@TENDT nvarchar (30)
)

as 
	begin
		if exists (select MSDT from DETAI where MSDT=@MSDT)
			begin
				update DETAI
				set TENDT=@TENDT
				where MSDT=@MSDT
				print 'Cap nhat thanh cong'
				return 1
			end
		else
			print 'Khong tim thay'
			return 0
	end

/* CAU 5: Tham số đưa vào MSSV cũ, TENSV mới,  DIACHI mới. Thủ tục dùng để cập nhật sinh viên trên, nếu không tìm thấy trả về 0,
 ngược lại cập nhật và trả về 1. */

 create proc cau5
 (
	@MSSV char(8),
	@TENSV nvarchar(30),
	@DIACHI nchar(50)
 )

 as
	begin 
		if exists (select MSSV from SINHVIEN where MSSV=@MSSV)
			begin
				update SINVIEN
				set TENSV=@TENSV, DIACHI=@DIACHI
				where MSSV=@MSSV 
				print 'Cap nhat thanh cong'
				return 1
			end
		else
			print 'Loi'
			return 0
	end

/* B. STORED PROCEDUREDS VỚI THAM SỐ VÀO VÀ RA */

/* 1. Đưa vào TENHV trả ra: Số GV thỏa học vị, nếu không tìm thấy trả về 0. */





  
		
					

					
