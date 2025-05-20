-- 05_mysql(심화1) 테이블
-- JY let's go

-- [문제 1] 다음 컬럼을 가지는 userTBL 과 buyTBL 을 정의하세요
-- 	○ 기존에 테이블이 존재하면 삭제함
-- 	○ userTBL
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl(
	userID		CHAR(8)		NOT NULL PRIMARY KEY,
    name		VARCHAR(10)	NOT NULL,
    birthYear	INT			NOT NULL
);


-- 	○ buyTBL
CREATE TABLE buytbl(
	num			INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID		CHAR(8)	NOT NULL,
    prodName	CHAR(6)	NOT NULL
);


-- 	• ALTER 를 이용해 userID 를 외래키로 수정하세요
ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
    FOREIGN KEY(userID)
    REFERENCES usertbl(userID);



-- [문제 2] 다음 조건을 만족하는 userTBL 테이블을 정의하세요
-- ○ 기존 buyTBL, userTBL 을 삭제하세요
USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl(
	userID		CHAR(8)		NOT NULL PRIMARY KEY,
    name		VARCHAR(10) NOT NULL,
    birthYear	INT 		NOT NULL,
    email		CHAR(30)	NULL UNIQUE
);


-- [문제 3] 다음 조건을 만족하는 userTBL 테이블을 정의하세요
-- ○ 기존 userTBL 을 삭제하세요
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl(
	userID		CHAR(8) PRIMARY KEY,
    name		VARCHAR(10),
    birthYear	INT CHECK(birthYear >= 1900 AND birthYear <= 2023), -- 1,900 이상 2,023 이하 값만 허용
    mobile1		CHAR(3),
    CONSTRAINT	CK_name CHECK(name IS NOT NULL)
);


-- [문제 4] 다음 조건을 만족하는 userTBL 테이블을 정의하세요
-- ○ 기존 userTBL 을 삭제하세요
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl(
	userID		CHAR(8)		NOT NULL PRIMARY KEY,
    name		VARCHAR(10)	NOT NULL,
    birthYear	INT			NOT NULL DEFAULT -1,
    addr		CHAR(2)		NOT NULL DEFAULT '서울',
    mobile1		CHAR(3)		NULL,
    mobile2		CHAR(8)		NULL,
    height		SMALLINT	NULL DEFAULT 170,
    mDate		DATE		NULL
);


-- ○ 기본값 추가를 확인할 수 있는 데이터를 추가하세요
-- DEFAULT문은 DEFAULT로 설정된 값을 자동으로 입력한다.
INSERT INTO usertbl VALUES('LHL', '이혜리', DEFAULT, DEFAULT, '011', '1234567', DEFAULT, '2023.12.12');
SELECT * FROM usertbl;


-- 열 이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO usertbl(userID, name) VALUES('KAY', '김아영');


-- 값이 직접 명시되면 DEFAULT로 설정된 값은 무시된다.
INSERT INTO usertbl VALUES('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2020.5.5');
SELECT * FROM usertbl;

-- [문제 5] 앞에서 만든 userTBL 에 대해서 다음 조건을 처리하도록 수정하세요
-- ○ mobile1 컬럼을 삭제함
ALTER TABLE usertbl
	DROP COLUMN mobile1;
    

-- ○ name 컬럼명을 uName 으로 변경함
ALTER TABLE usertbl
	CHANGE COLUMN name uName VARCHAR(20) NULL;


-- ○ 기본키를 제거함
ALTER TABLE usertbl
	DROP PRIMARY KEY;


-- 05_mysql(심화2) 테이블
-- 모든 문제는 employees 데이터베이스에서 수행한다
USE employees;


-- [문제 6] 다음 정보를 가지는 직원 정보를 출력하는 EMPLOYEES_INFO 뷰를 작성하세요
CREATE OR REPLACE VIEW EMPLOYEES_INFO AS
SELECT e.*,
	   t.title,
       t.from_date	AS t_form,
       t.to_date	AS t_to,
       s.salary		AS s_from,
       s.to_date	AS s_to
FROM employees AS e
	 INNER JOIN titles 	 AS t ON e.emp_no = t.emp_no
     INNER JOIN salaries AS s ON e.emp_no = s.emp_no;


-- [문제 7] EMPLOYEES_INFO 뷰에서 재직자의 현재 정보만 출력하세요
SELECT *
FROM EMPLOYEES_INFO
WHERE s_to = '9999-01-01';


-- [문제 8] 다음 정보를 가지는 부서 정보를 출력하는 EMP_DEPT_INFO 뷰를 작성하세요
CREATE OR REPLACE VIEW EMP_DEPT_INFO
AS
SELECT e.emp_no,
	   d.dept_no,
       d.dept_name,
       de.from_date,
       de.to_date
FROM departments AS d
	 INNER JOIN dept_emp  AS de ON d.dept_no = de.dept_no
     INNER JOIN employees AS e  ON de.emp_no = e.emp_no;
     

-- [문제 9] EMP_DEPT_INFO로 현재 재직자의 부서 정보를 출력하세요
SELECT *
FROM EMP_DEPT_INFO
WHERE to_date = '9999-01-01'
ORDER BY emp_no;
