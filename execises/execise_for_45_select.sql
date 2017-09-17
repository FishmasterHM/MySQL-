#查询student表中的所有记录的Sname、Ssex和Class列
SELECT s_name, s_sex, class from student;
#查询教师所有的单位即不重复的Depart列。
Select DISTINCT Depart from teacher;
#查询student表所有信息
SELECT count(*) FROM student;
#查询Score表中成绩在60到80之间的所有记录。
SELECT * FROM score
WHERE degree BETWEEN 60 and 80;
#查询Score表中成绩为85，86或88的记录
SELECT * FROM score
WHERE degree in (85,86,88);
# 查询Student表中“95031”班或性别为“女”的同学记录
SELECT * FROM student
WHERE class = 95031 OR s_sex = '女';
#以Class降序查询Student表的所有记录
SELECT * FROM student
ORDER BY class DESC;
#以Cno升序、Degree降序查询Score表的所有记录。
SELECT * FROM score
ORDER BY s_no ASC, degree DESC;
#查询“95031”班的学生人数。
SELECT COUNT(*) AS sum_student
FROM student
WHERE class = 95031;
#查询Score表中的最高分的学生学号和课程号。（子查询或者排序）
SELECT s_no, c_no FROM score
WHERE degree = (SELECT MAX(degree)
				FROM score);
		
SELECT s_no, c_no FROM score
ORDER BY degree DESC
LIMIT 0,1;
#查询每门课的平均成绩。
SELECT c_no, AVG(degree) AS avg_score
FROM score
GROUP BY c_no WITH ROLLUP;
#查询Score表中至少有5名学生选修的并以3开头的课程的平均分数。
SELECT 
    AVG(degree) AS avg_core
FROM
    score
WHERE
    c_no LIKE '3%'
GROUP BY c_no
HAVING COUNT(*) >= 4;
#查询分数大于70，小于90的Sno列
SELECT s_no 
FROM score
WHERE degree between 70 and 90;
#查询所有学生的Sname、Cno和Degree列
SELECT s_name, c_no, degree
FROM student AS st INNER JOIN score AS sc
  ON st.s_no = sc.s_no;
#查询所有学生的Sname、Cname和Degree列
SELECT s_name, c_name, degree
FROM student AS st INNER JOIN score AS sc
	     ON st.s_no = sc.s_no
     INNER JOIN course AS co
         ON co.c_no = sc.c_no;
#查询“95033”班学生的平均分
SELECT Avg(degree) AS avg_95033
FROM score INNER JOIN student
    ON score.s_no = student.s_no
WHERE class = 95033;
/*假设使用如下命令建立了一个grade表：
create table grade(low  int(3),upp  int(3),rank  char(1))
insert into grade values(90,100,’A’)
insert into grade values(80,89,’B’)
insert into grade values(70,79,’C’)
insert into grade values(60,69,’D’)
insert into grade values(0,59,’E’)
现查询所有同学的Sno、Cno和rank列。*/
SELECT s_no, c_no, degree, rank
FROM score INNER JOIN grade
    ON degree BETWEEN low AND upp;
#查询选修“3-105”课程的成绩高于“109”号同学成绩的所有同学的记录。
SELECT * FROM score
WHERE c_no = '3-105' AND 
	  (degree > (SELECT degree from score 
				 WHERE s_no = 109 AND c_no = '3-105'));
#选了多门课程并且是这个课程下不是最高分的
SELECT * 
FROM score AS a
INNER JOIN (SELECT s_no, c_no, max(degree) AS maxa
            FROM score
            GROUP BY c_no) AS filter_max
            ON a.c_no = filter_max.c_no 
WHERE a.degree < filter_max.maxa;

SELECT * 
FROM score AS a
WHERE s_no IN (SELECT s_no FROM score
			   GROUP BY s_no
               HAVING Count(*) > 2)
	AND 
	  degree < (SELECT Max(degree) FROM score AS b WHERE b.c_no = a. c_no);
   