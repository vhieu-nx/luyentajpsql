create database luyentapsql;
use luyentapsql;
create table tbladdress(
	_idAddress int primary key ,
    _address varchar(155) NOT NULL
);
create table tblclasses(
	_idClass int  primary key ,
    _name varchar(155) not null,
    _language varchar(10) not null ,
    _description VARCHAR(50) NOT NULL 
);
CREATE TABLE tblSTUDENTS(
	_idStudent int primary key, 
    _fullname varchar(15) not null,
    _addressid int ,
    _phone int(10) unique,
    _classid int,
    foreign key (_addressid) references tbladdress(_idAddress),
    foreign key (_classid) references tblclasses(_idClass)
);
create table tblcourse(
	_idCourse int primary key,
    _name varchar(20) not null,
    _description varchar(50) not null
);
create table tblPoint(
	_idPoint int primary key,
    _courseid int,
    _studentid int,
    _point float not null,
	foreign key (_courseid) references tblCourse(_idCourse),
	foreign key (_studentid) references tblSTUDENTS(_idStudent)
);
insert into tbladdress value(1,'huu bang'),(2,'ngoc xa'),(3,'que vo'),(4,'bac ninh'),(5,'long khe');
insert into tblclasses value(1,'C0221I1','JAVA','TT04'),(2,'C0221I2','C#','TT02'),(3,'C0221I3','PHP','TT01'),(4,'C0221I4','PYTHON','TT03'),(5,'C0221I5','RUBY','TT05');
INSERT INTO tblstudents value(1,'NGUYENVANA',1,0325708605,1)
,(2,'NGUYENVANB',2,0325708602,2)
,(3,'NGUYENVANC',1,0325708603,1)
,(4,'NGUYENVAND',1,0325708604,1),
(5,'NGUYENVANE',2,0325708601,2)
,(6,'NGUYENVANF',5,0325708606,5)
,(7,'NGUYENVANG',4,0325708607,5)
,(8,'NGUYENVANH',3,0325708608,4)
,(9,'NGUYENVANI',2,0325708609,3)
,(10,'NGUYENVANK',1,0325708610,2);
INSERT INTO TBLCOURSE VALUE(1,'BUTACAM1','AUTO HAVE JOB1'),(2,'BUTACAM2','AUTO HAVE JOB2'),(3,'BUTACAM3','AUTO HAVE JOB3'),(4,'BUTACAM4','AUTO HAVE JOB4'),(5,'BUTACAM5','AUTO HAVE JOB5');
insert into tblPoint value(1,1,1,5),
(2,2,10,6),
(3,3,9,7),
(4,4,8,8),
(5,5,7,9),
(6,1,6,8),
(7,2,5,1),
(8,3,4,5),
(9,4,2,3),
(10,5,1,2),
(11,5,6,1),
(12,4,7,10),
(13,5,1,5.5),
(14,3,1,6.5),
(15,3,1,7.5);
/*thong ke so luong hoc vien cac lop*/
select c._name as TenLop,count(_name) as SoLuongHV from
 tblStudents as s inner join tblClasses as c on _classid= c._idclass group by c._name;
SELECT tblstudents._idStudent, tblclasses._name 
FROM tblStudents
INNER JOIN tblClasses ON tblStudents._classid=tblclasses._idclass;

/*thong ke so luong hoc vien tai cac tinh */ 
select _address as TenThanhPho,count(_address) as SoLuongHV from tblStudents as s  join tblAddress as a on _addressid = _idaddress group by a._address;
/* tinh diem trung binh cua cac khoa hoc*/
select c._name as TenKhoaHoc, avg(p._point) as DiemTB from tblPoint as p join tblCourse as c on _courseid = c._idcourse group by c._name;
/* tinh diem trung binh cac khoa cao nhat*/
select c._name as TenKhoaHoc, avg(p._point) as DiemTB from tblPoint as p join tblCourse as c on _courseid = c._idcourse group by c._name having avg(p._point) > 6.5;


