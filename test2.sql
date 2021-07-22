create database test2;
use test2;
create table subject(
SubjectID int primary key,
subjectname nvarchar(50)
);
create table students(
studentID int primary key,
studentName nvarchar(50),
age int,
email nvarchar(100)
);
create table classes(
classid int primary key,
classname nvarchar(50)
);
create table marks(
mark int,
subjectid int,
studentid int,
foreign key (subjectid) references subject(subjectid),
foreign key (studentid) references students(studentid)
);
create table classStudent(
studentid int,
classid int,
foreign key (studentid) references students(studentid),
foreign key (classid) references classes(classid)
);

insert into classstudent
value (1,1),
(2,1),
(3,2),
(4,2),
(5,2);

insert into marks
value (8,1,1),
(4,2,1),
(9,1,1),
(7,1,3),
(3,1,4),
(5,2,5),
(8,3,3),
(1,3,5),
(3,2,4);

-- Hien thi danh sach tat ca cac hoc vien 
select * from students;

-- Hien thi danh sach tat ca cac mon hoc
select * from subject;

-- Tinh diem trung binh
select studentid,avg(mark) as diemtb from marks
group by studentid;

-- Danh so thu tu cua diem theo chieu giam
select row_number() over(order by mark) as stt, mark from marks;

-- Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
ALTER TABLE `test2`.`subject` 
CHANGE COLUMN `subjectname` `subjectname` NVARCHAR(4000);

-- Cap nhat them dong chu « Day la mon hoc «  vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
UPDATE `test2`.`subject` SET `subjectname` = ' Day la mon hoc SQL' WHERE (`SubjectID` = '1');
UPDATE `test2`.`subject` SET `subjectname` = ' Day la mon hoc Java' WHERE (`SubjectID` = '2');
UPDATE `test2`.`subject` SET `subjectname` = ' Day la mon hoc C' WHERE (`SubjectID` = '3');
UPDATE `test2`.`subject` SET `subjectname` = ' Day la mon hoc Visual Basic' WHERE (`SubjectID` = '4');

-- Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table `test2`.`students`
add check (age >15 and age <50);

-- Loai bo tat ca quan he giua cac bang
ALTER TABLE `test2`.`marks` 
DROP FOREIGN KEY `marks_ibfk_2`,
DROP FOREIGN KEY `marks_ibfk_1`;

ALTER TABLE `test2`.`classstudent` 
DROP FOREIGN KEY `classstudent_ibfk_2`,
DROP FOREIGN KEY `classstudent_ibfk_1`;

-- Xoa hoc vien co StudentID la 1
delete from students where studentid = 1;

-- Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table students
add column status bit default 1;

-- Cap nhap gia tri Status trong bang Student thanh 0
update students set status = 0 where studentid = 1;
update students set status = 0 where studentid = 2;
update students set status = 0 where studentid = 3;
update students set status = 0 where studentid = 4;
update students set status = 0 where studentid = 5;
