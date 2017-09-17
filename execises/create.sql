Use test1;
#建学生信息表student
create table student
(
s_no varchar(20) not null primary key,
s_name varchar(20) not null,
s_sex varchar(20) not null,
s_birthday datetime,
class varchar(20)

);
#建立教师表
create table teacher
(
t_no varchar(20) not null primary key,
t_name varchar(20) not null,
t_sex varchar(20) not null,
t_birthday datetime,
prof varchar(20),
depart varchar(20) not null

);
#建立课程表course
create table course
(
c_no varchar(20) not null primary key,
c_name varchar(20) not null,
t_no varchar(20) not null,
foreign key(t_no) references teacher(t_no)

);
#建立成绩表
CREATE TABLE score (
    s_no VARCHAR(20) NOT NULL,
    c_no VARCHAR(20) NOT NULL,
    degree DECIMAL,
    primary key(s_no, c_no)
);

ALTER table score ADD CONSTRAINT fk_score_student FOREIGN KEY (s_no) REFERENCES student (s_no);
ALTER table score ADD CONSTRAINT fk_score_course FOREIGN KEY (c_no) REFERENCES course (c_no);

#添加学生信息
insert into student values('108','曾华','男','1977-09-01','95033');
insert into student values('105','匡明','男','1975-10-02','95031');
insert into student values('107','王丽','女','1976-01-23','95033');
insert into student values('101','李军','男','1976-02-20','95033');
insert into student values('109','王芳','女','1975-02-10','95031');
insert into student values('103','陆君','男','1974-06-03','95031');




#添加教师表
insert into teacher values('804','李诚','男','1958-12-02','副教授','计算机系');
insert into teacher values('856','张旭','男','1969-03-12','讲师','电子工程系');
insert into teacher values('825','王萍','女','1972-05-05','助教','计算机系');
insert into teacher values('831','刘冰','女','1977-08-14','助教','电子工程系');

#添加课程表
insert into course values('3-105','计算机导论','825');
insert into course values('3-245','操作系统','804');
insert into course values('6-166','数字电路','856');
insert into course values('9-888','高等数学','831');
#添加成绩表
insert into score values('101','3-105','64');
insert into score values('103','6-166','85');
insert into score values('103','3-245','86');
insert into score values('103','3-105','92');
insert into score values('105','3-245','75');
insert into score values('105','3-105','76');
insert into score values('105','6-166','79');
insert into score values('101','3-245','88');
insert into score values('109','3-245','68');
insert into score values('109','3-105','78');
insert into score values('109','6-166','81');
insert into score values('101','6-166','99');