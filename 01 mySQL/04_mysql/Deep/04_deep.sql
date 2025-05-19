-- 04_mysql(심화) sql 고급 - 조인 (심화1)
-- JY let's go

SHOW DATABASES;
SHOW TABLES;


-- 다음과 같이 테이블과 데이터를 준비하세요
USE sqldb;

-- 학생 테이블
CREATE TABLE stdtbl(
	stdName VARCHAR(10) NOT NULL PRIMARY KEY, -- 학생이름; 기본키
    addr	CHAR(4)		NOT NULL			  -- 주소
);

-- 동아리 테이블
CREATE TABLE clubtbl(
	clubName VARCHAR(10) NOT NULL PRIMARY KEY, -- 동아리 이름
    roomNo	 CHAR(4)	 NOT NULL			   -- 방 번호
);

-- 학생x동아리 테이블
CREATE TABLE stdclubtbl(
	num		 int 		AUTO_INCREMENT NOT NULL PRIMARY KEY,
    stdName  VARCHAR(10) NOT NULL,
    clubName VARCHAR(10) NOT NULL,
    FOREIGN KEY(stdName) REFERENCES stdtbl(stdName),
    FOREIGN KEY(clubName) REFERENCES clubtbl(clubName)
);

-- 다음과 같이 테이블과 데이터를 준비하세요
INSERT INTO stdtbl VALUES ('김범수', '경남'), ('성시경', '서울'), ('조용필', '경기'), ('은지원', '경북'), ('바비킴', '서울');
INSERT INTO clubtbl VALUES ('수영', '101호'), ('바둑', '102호'), ('축구', '103호'), ('봉사', '104호');
INSERT INTO stdclubtbl VALUES (NULL, '김범수', '바둑'), (NULL, '김범수', '축구'), (NULL, '조용필', '축구'), (NULL, '은지원', '축구'), (NULL, '은지원', '봉사'), (NULL, '바비킴', '봉사');

-- 앞에서 정의한 3 개의 테이블을 이용해서 다음을 처리하세요
	-- o 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름 지역 가입한 동아리 동아리방을 출력하세요

select * from stdtbl; -- stdName, addr
select * from clubtbl; -- clubName, roomNo
select * from stdclubtbl; -- num, stdName, clubName

select s.stdName, 	-- 학생 이름
	   s.addr, 		-- 지역
       c.clubName,	-- 가입한 동아리
       c.roomNo		-- 동아리방
from stdclubtbl as sc
	inner join stdtbl as s on sc.stdName = s.stdName
    inner join clubtbl as c on sc.clubName = c.clubName
order by s.stdName
;


-- 	○ 동아리를 기준으로 가입한 학생의 목록을 출력하세요
-- 	 - 출력정보 : clubName, roomNo, stdName, addr
select s.stdName, 	-- 학생 이름
	   s.addr, 		-- 지역
       c.clubName,	-- 가입한 동아리
       c.roomNo		-- 동아리방
from stdclubtbl as sc
	inner join stdtbl as s on sc.stdName = s.stdName
    inner join clubtbl as c on sc.clubName = c.clubName
order by c.clubName
;


-- 다음과 같이 테이블과 데이터를 준비하세요
USE sqldb;
CREATE TABLE empTbl(
	emp		CHAR(3),
    manager	CHAR(3),
    empTel	VARCHAR(8)
);

INSERT INTO empTbl VALUES ('나사장',   NULL, '0000');
INSERT INTO empTbl VALUES ('김재무', '나사장', '2222');
INSERT INTO empTbl VALUES ('김부장', '김재무', '2222-1');
INSERT INTO empTbl VALUES ('이부장', '김재무', '2222-2');
INSERT INTO empTbl VALUES ('우대리', '이부장', '2222-2-1');
INSERT INTO empTbl VALUES ('지사원', '이부장', '2222-2-2');
INSERT INTO empTbl VALUES ('이영업', '나사장', '1111');
INSERT INTO empTbl VALUES ('한과장', '이영업', '1111-1');
INSERT INTO empTbl VALUES ('최정보', '나사장', '3333');
INSERT INTO empTbl VALUES ('윤차장', '최정보', '3333-1');
INSERT INTO empTbl VALUES ('이주임', '윤차장', '3333-1-1');


-- 앞에서 추가한 테이블에서 '우대리'의 상관 연락처 정보를 확인하세요
	-- ○ 출력할 정보: 부하직원, 직속상관, 직속상관연락처
SELECT a.emp as 부하직원,
	   b.emp as 직속상관,
       b.empTel as 직속상관연락처
FROM empTbl as a
	inner join empTbl as b -- self join
    on a.manager = b.emp
where a.emp = '우대리'
;


-- 04_mysql(심화) sql 고급 - 조인 (심화2)
-- 모든 문제는 employees 데이터베이스에서 수행한다
SHOW DATABASES;

USE employees;
SHOW TABLES;

-- 현재 재직 중인 직원의 정보를 출력하세요
-- 	○ 출력 항목 : emp_no, first_name, last_name, title
select e.emp_no,
	   e.first_name,
       e.last_name,
       t.title
from employees as e
	join titles as t
    on e.emp_no = t.emp_no
where t.to_date ='9999-01-01'
;


-- 현재 재직 중인 직원 정보를 출력하세요
-- ○ 출력항목 : 직원의 기본 정보 모두 , title, salary
select e.*,
	   t.title,
       s.salary
from employees as e
	join titles   as t on e.emp_no = t.emp_no
	join salaries as s on e.emp_no = s.emp_no
where s.to_date ='9999-01-01'
;

-- 현재 재직중인 직원의 정보를 출력하세요
-- ○ 출력항목 : emp_no, first_name, last_name, department
-- ○ 정렬 : emp_no 오름 차순
select e.emp_no,
	   e.first_name,
       e.last_name,
       d2.dept_name
from employees as e
	join dept_emp 	 as d1 on e.emp_no   = d1.emp_no
    join departments as d2 on d1.dept_no = d2.dept_no
where d1.to_date ='9999-01-01'
order by e.emp_no
;

-- 부서별 재직중인 직원의 수를 출력하세요
-- ○ 출력 항목 : 부서 번호, 부서명, 인원수
-- ○ 정렬 : 부서 번호 오름차순

select d1.dept_no,
	   d1.dept_name,
       count(*)
from departments  as d1
	join dept_emp as d2
    on d1.dept_no = d2.dept_no
where d2.to_date ='9999-01-01'
group by d1.dept_no
order by d2.dept_no
;

-- 직원 번호가 10209 인 직원의 부서 이동 히스토리를 출력하세요
-- ○ 출력항목 : emp_no, first_name, last_name, dept_name, from_date, to_date
select d1.emp_no,
	   e.first_name, 
       e.last_name, 
       d2.dept_name, 
       d1.from_date, 
       d1.to_date
from dept_emp as d1
	join employees   as e  on d1.emp_no  = e.emp_no
    join departments as d2 on d1.dept_no = d2.dept_no
 where d1.emp_no = 10209
 ;

