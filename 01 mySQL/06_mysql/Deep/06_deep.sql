-- 06_mysql(심화) 인덱스
-- JY let's go

-- [문제 1] sqldb에서 usertbl 테이블에서 다음 내용들을 확인하세요
USE sqldb;
SELECT * FROM usertbl;		-- ○ usertbl 의 내용 확인
SHOW INDEX FROM usertbl;	-- ○ usertbl 의 인덱스 목록 확인
SHOW TABLE STATUS LIKE 'usertbl'; -- ○ usertbl의 데이터 크기와 인덱스의 크기 확인


-- [문제 2] usertbl의 addr 컬럼에 대해 idx_usertbl_addr 이름으로 인덱스를 만들고 인덱스 목록을 확인하세요
CREATE INDEX idx_usertbl_addr ON usertbl(addr);
SHOW INDEX FROM usertbl;


-- [문제 3] usertbl의 상태를 출력하여 인덱스의 내용이 만들어졌는지 확인하고
-- 내용이 없다면 실제 적용되도록 한 후, 인덱스의 크기를 확인하세요
SHOW TABLE STATUS LIKE 'usertbl'; -- Index_length가 0
ANALYZE TABLE usertbl; -- 생성한 인덱스를 실제 적용하여면 먼저 테이블을 분석/처리해야함.
SHOW TABLE STATUS LIKE 'usertbl'; -- Index_length가 16,384


-- [문제 4] usertbl에 대해 다음을 처리하세요
-- ○ birthYear 컬럼에 대해 idx_usertbl_birthYear 이름의 인덱스를 만드세요. 에러가 난다면 그 이유를 설명하세요
CREATE UNIQUE INDEX idx_usertbl_birthYear ON usertbl(birthYear);
/*
(에러) Duplicate entry '1979' for key 'usertbl.idx_usertbl_birthYear'
= 중복값이 있어 인덱스 에러가 발생함.
*/

-- ○ name 컬럼에 대해 idx_usertbl_name 이름의 인덱스를 만드세요
CREATE UNIQUE INDEX idx_usertbl_name ON usertbl(name);

-- ○ 생성된 인덱스의 목록을 확인하세요
SHOW INDEX FROM usertbl;


-- [문제 5] usertbl에 대해 다음을 처리하세요
-- ○ name 컬럼에 대한 보조 인덱스를 삭제하세요
DROP INDEX idx_usertbl_name ON usertbl;

-- ○ name 과 birthYear 컬럼 조합으로 idx_usertbl_name_birthYear 이름의 인덱스를 생성하세요
CREATE UNIQUE INDEX idx_usertbl_name_birthYear ON usertbl(name, birthYear);

-- ○ 인덱스의 목록을 확인하세요
SHOW INDEX FROM usertbl;


-- [문제 6] usertbl에서 앞에서 만든 인덱스를 삭제하세요
SHOW INDEX FROM usertbl;

DROP INDEX idx_usertbl_addr ON usertbl;
DROP INDEX idx_usertbl_name_birthYear ON usertbl;

SHOW INDEX FROM usertbl; -- 확인을 해보면 사라져 있음.


-- 06_mysql(심화) 사용자 관리

-- [문제 7] 다음과 같이 실습 데이터베이스 및 사용자를 생성하고, 해당 데이터베이스에 대해 모든 권한을 부여하세요
-- 	○ 데이터베이스 명 : scoula_db
-- 	○ 사용자 명 : scoula
-- 	○ 비밀번호 : 1234
-- 	○ 접속 호스트 : 제한 없음

-- 1. 데이터 베이스 생성
CREATE DATABASE scoula_db;

-- 2. 사용자 생성 비밀번호는 '1234', 호스트는 로 제한 없음
CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';

-- 3. 권한 부여 (scoula_db 데이터베이스에 대해 모든 권한
GRANT ALL PRIVILEGES ON scoula_db.* TO 'scoula'@'%';

-- 4. 권한 변경사항 적용
FLUSH PRIVILEGES;
