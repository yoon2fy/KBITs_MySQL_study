-- [03_BasicSol1] 다음을 처리하는 쿼리문을 작성하세요.
-- 현재 서버에 존재하는 데이터베이스 확인
SHOW DATABASES;

-- 현재 데이터 베이스를 employees로 설정하기
USE employees;

-- employees 데이터베이스의 테이블 목록 보기
SHOW TABLES;

-- employees 테이블의 열 목록 출력하기
DESCRIBE employees;


-- [03_BasicSol2] employees 테이블에서 다음 쿼리를 작성하세요
-- titles 테이블의 데이터 출력하기
select *
from employees.titles;

-- employees 테이블에서 first_name 컬럼만 출력하기
select first_name
from employees;

-- employees 테이블에서 first_name 컬럼 , last_name 컬럼 , gender 컬럼 출력하기
select first_name, last_name, gender
from employees;

-- [03_BasicSol3] 
-- employees 테이블 출력시 다음과 같이 나오도록 쿼리를 작성하세요

select first_name as '이름',
	   gender as '성별',
       hire_date as '회사 입사일'
from employees;

-- [03_BasicSol4] 
-- 배포된 sqldb.sql 파일을 이용하여 sqldb 데이터베이스를 구축하세요
-- 이후 작업은 sqldb 데이터베이스로 작업함

-- [03_BasicSol5] 
-- 배포된 sqldb.sql 파일을 이용하여 sqldb 데이터베이스를 구축하세요
-- 이후 작업은 sqldb 데이터베이스로 작업함

USE sqldb;
SHOW TABLES;

-- usertbl 테이블에서 이름이 김경호 인 행을 출력하세요
select *
from usertbl
where name = '김경호';

-- usertbl 테이블에서 생년이 1970 이상이고 키가 182 이상인 데이터를 출력하세요
select *
from usertbl
where (birthYear >= 1970) and (height >= 182);

-- [03_BasicSol6]
-- usertbl 테이블에서 키가 180~183 범위인 데이터를 출력하세요
select *
from usertbl
where height >= 180 and height <= 183;

-- usertbl 테이블에서 주소가 '경남' 또는 '전남' 또는 '경북'인 데이터를 출력하세요
select *
from usertbl
where addr in ('경남', '전남', '경북');

-- usertbl 테이블에서 이름이 김 으로 시작하는 데이터를 출력하세요
select *
from usertbl
where name like '김%';

-- [03_BasicSol7]
-- usertbl에서 김경호 보다 큰 사람들의 이름과 키를 출력하세요
-- 서브쿼리를 이용하여 쿼리를 작성하세요
select name, height
from usertbl
where height > (
	  select height
      from usertbl
      where name = '김경호'
      );

-- [03_BasicSol8]
-- usertbl을 mdate 의 오름차순으로 정렬하여 출력하세요
select *
from usertbl
order by mDate;

-- usertbl을 mdate 의 내림 차순으로 정렬하여 출력하세요
select *
from usertbl
order by mDate desc;

-- usertbl을 height 의 내림차순으로 정렬하고, 동률인 경우 name 의 내림차순으로 정렬하여 출력하세요
select *
from usertbl
order by height desc, name desc;

-- [03_BasicSol9]
-- usertbl의 주소지를 중복없이 오름 차순으로 출력하세요-
select distinct addr
from usertbl
order by addr;

-- [03_BasicSol10]
-- World 데이터베이스에서 다음 질문을 처리하세요
SHOW DATABASES;
USE world;
SHOW TABLES; -- city, country, countrylanguage

-- 국가 코드가 'KOR'인 도시를 찾아 인구수를 역순으로 표시하세요
select population
from city
where countrycode = 'kor'
order by population desc;

-- city 테이블에서 국가코드와 인구수를 출력하라. 정렬은 국가코드별로 오름차순으로, 동일한 코드(국가) 안에서는 인구 수의 역순으로 표시하세요.
select countrycode, population
from city
order by countrycode, population desc;


-- city 테이블에서 국가코드가 'KOR' 인 도시의 수를 표시하세요
select count(distinct(Name)) as count_city
from city
where countrycode = 'kor';

-- city 테이블에서 국가코드가 'KOR', 'CHN', 'JPN' 인 도시를 찾으세요
select Name as city_name
from city
where countrycode IN ('KOR', 'CHN', 'JPN');

-- 국가코드가 'KOR' 이면서 인구가 100 만 이상인 도시를 찾으세요
select Name as city_name
from city
where (countrycode = 'KOR') and (population >=1000000);

-- 국가 코드가 'KOR' 인 도시 중 인구수가 많은 순서로 상위 10 개만 표시하세요
select name as 'top 10'
from city
where countrycode = 'KOR'
order by population desc
limit 10;

-- city 테이블에서 국가코드가 'KOR' 이고 , 인구가 100 만 이상 500 만 이하인 도시를 찾으세요
select name
from city
where (countrycode = 'KOR') and (population <= 5000000 and population >= 1000000);
