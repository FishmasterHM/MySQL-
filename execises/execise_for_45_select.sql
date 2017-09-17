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
#
   