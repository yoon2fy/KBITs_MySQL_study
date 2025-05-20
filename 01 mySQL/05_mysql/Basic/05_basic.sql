-- 05_mysql(기본) 테이블
-- JY let's go

-- [문제 1] tabledb 데이터베이스를 생성하세요
SHOW DATABASES; -- DB에 tabledb가 존재하는지 확인함.
DROP DATABASE IF EXISTS tabledb; -- 만일 존재한다면 DB를 삭제함.
CREATE DATABASE tabledb; -- tabledb DB를 생성함.


-- [문제 2] 다음 컬럼을 가지는 usertbl 테이블을 만드세요
USE tabledb;
CREATE TABLE usertbl(
	userID		CHAR(8)		NOT NULL PRIMARY KEY,
    name		VARCHAR(10)	NOT NULL,
    birthyear	INT			NOT NULL,
    addr		CHAR(2)		NOT NULL,
    mobile1		CHAR(3)		NULL,
    mobile2		CHAR(8)		NULL,
    height		SMALLINT	NULL,
    mDate		DATE		NULL
);


-- [문제 3] 다음 컬럼을 가지는 buytbl 테이블을 만드세요
CREATE TABLE buytbl(
	num			INT		 NOT NULL PRIMARY KEY AUTO_INCREMENT,
    userID		CHAR(8)	 NOT NULL, -- 외래키
    prodName	CHAR(6)	 NOT NULL,
    groupName	CHAR(4)	 NULL,
    price		INT		 NOT NULL,
    amount		SMALLINT NOT NULL,
    FOREIGN KEY(userID)	 REFERENCES usertbl(userID)
);


-- [문제 4] 회원 테이블에 다음 데이터를 입력하세요
-- ○ 순서 : userID, name, birthyear, addr, mobile1, mobile2, height, mDate

INSERT INTO usertbl  VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl  VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl  VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

-- [문제 5] 구매 테이블에 다음 데이터를 입력하세요
	-- ○ 에러가 난다면 , 왜 발생하는지 설명하세요
	-- ○ 순서 : userid, prodName, groupName, price, amount
INSERT INTO buytbl  VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl  VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
-- INSERT INTO buytbl  VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
-- userid는 외래키이므로 usertbl에 'JYP' 가 있어야 함. 현재 해당 userid 가 없기 때문에 에러임.


-- [문제 6] 다음 컬럼을 가지는 usertbl 을 정의하세요
	-- ○ 기존 usertbl 이 존재하는 경우 삭제함
	-- ○ 기본키는 테이블 레벨에서 정의하고 제약조건명을 함께 지정함
ALTER TABLE buytbl DROP FOREIGN KEY buytbl_ibfk_1;
DROP TABLE usertbl;

DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl(
	userID		CHAR(8)		NOT NULL,
    name		VARCHAR(10)	NOT NULL,
    birthYear	INT			NOT NULL,
    CONSTRAINT PRIMARY KEY PK_userTBL_userID(userID)
);


-- [문제 7] 다음 컬럼을 가지는 prodTbl 을 정의하세요
	-- ○ 기존 prodTbl 이 존재하는 경우 삭제함
DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl(
	prodCode	CHAR(3)	NOT NULL,
    prodID		CHAR(4) NOT NULL,
    prodDate	DATE	NOT NULL,
    prodCur		VARCHAR(10) NULL,
    CONSTRAINT PK_prodTbl_proCode_prodID PRIMARY KEY(prodCode, prodID)
);


-- [문제 8] usertbl과 buytbl 을 바탕으로 다음 결과가 나오는 뷰를 정의하세요
CREATE VIEW v_userbuytbl AS 

SELECT U.userID,
	   U.name,
       U.addr,
       CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl AS U
	 INNER JOIN buytbl AS B
     ON U.userid = B.userid;


-- [문제 9] 위에서 정의한 뷰에서 userid 가 김범수 인 데이터만 출력하세요
SELECT *
FROM v_userbuytbl
WHERE name = '김범수';


