
create database quan_ly_giao_vu
go

use quan_ly_giao_vu
go

create table SINHVIEN
(
	MSSV char(6) primary key,
	TENSV varchar(30) not null,
	SODT varchar(10),
	LOP char(6) not null,
	DIACHI char(50) not null

)

create table DETAI
(
	MSDT char(6) primary key,
	TENDT varchar(30) not null
)

create table SV_DETAI
(
	MSSV char(6) foreign key references SINHVIEN(MSSV),
	MSDT char(6) foreign key references DETAI(MSDT),
	constraint PK_SV_DETAI primary key(MSSV, MSDT)
)

create table HOCHAM
(
	MSHH smallint primary key,
	TENHH varchar(20) not null
)

create table GIAOVIEN
(
	MSGV smallint primary key,
	TENGV varchar(30),
	DIACHI varchar(50),
	SODT varchar(10),
	MSHH smallint foreign key references HOCHAM(MSHH)
)

create table HOCVI
(
	MSHV smallint primary key,
	TENHV varchar(10) not null
)	

create table CHUYENNGANH
(
	MSCN smallint primary key,
	TENCN varchar(30) not null
)

create table GV_HV_CN
(
	MSGV smallint foreign key references GIAOVIEN(MSGV),
	MSHV smallint foreign key references HOCVI(MSHV),
	MSCN smallint foreign key references CHUYENNGANH(MSCN),
	NAM smalldatetime not null,
	constraint PK_GV_HV_CN primary key(MSGV, MSHV, MSCN)
)

create table GV_HDDT
(
	MSGV smallint foreign key references GIAOVIEN(MSGV),
	MSDT char(6) foreign key references DETAI(MSDT),
	DIEM float not null,
	constraint PK_GV_HDDT primary key(MSGV, MSDT)
)

create table GV_PBDT
(
	MSGV smallint foreign key references GIAOVIEN(MSGV),
	MSDT char(6) foreign key references DETAI(MSDT),
	DIEM float not null,
	constraint PK_GV_PBDT primary key(MSGV, MSDT)
)

create table GV_UVDT
(
	MSGV smallint foreign key references GIAOVIEN(MSGV),
	MSDT char(6) foreign key references DETAI(MSDT),
	DIEM float not null,
	constraint PK_GV_UVDT primary key(MSGV, MSDT)
)

create table HOIDONG
(	
	MSHD smallint primary key,
	PHONG smallint,
	TGBD smalldatetime,
	NGAYHD smalldatetime not null,
	TINHTRANG varchar(30) not null,
	MSGVCTHD smallint foreign key references GIAOVIEN(MSGV)
)

create table HOIDONG_GV
(
	MSHD smallint foreign key references HOIDONG(MSHD),
	MSGV smallint foreign key references GIAOVIEN(MSGV),
	constraint PK_HOIDONG_GV primary key(MSHD, MSGV)
)

create table HOIDONG_DT
(
	MSHD smallint foreign key references HOIDONG(MSHD),
	MSDT char(6) foreign key references DETAI(MSDT),
	QUYETDINH char(10),
	constraint PK_HOIDONG_DT primary key(MSHD, MSDT)
)


