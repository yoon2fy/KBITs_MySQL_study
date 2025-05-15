-- 03_mysql; SQL 기본(심화1)
-- JY let's go

SHOW DATABASES;
USE sqldb;
SHOW TABLES;

-- (solution 1) 다음 결과가 나오도록 buytbl 에 대한 SQL 문을 각각 작성하세요
select userID as '사용자 아이디',
	   sum(amount) as '총 구매 개수'
from buytbl
group by userID
order by userID;

-- (solution 2-1) 다음 결과가 나오도록 buytbl 에 대한 SQL 문을 각각 작성하세요
select avg(amount) as '평균 구매 개수'
from buytbl;

-- (solution 2-) 다음 결과가 나오도록 buytbl 에 대한 SQL 문을 각각 작성하세요
select userID,
	   avg(amount) as '평균 구매 개수'
from buytbl
group by userID;

-- 다음 결과가 나오도록 usertbl 에 대한 SQL 문을 작성하세요
 -- ○ 가장 키가 큰 사람과 가장 키가 작은 사람을 출력함
select name, height
from usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
   OR height = (SELECT MIN(height) FROM usertbl);

-- 다음 결과가 나오도록 usertbl 에 대한 SQL 문을 작성하세요
select count(name) as '휴대폰이 있는 사용자'
from usertbl
where mobile1 is not null;
	 
-- buytbl 테이블로 다음을 처리하세요
-- ○ 사용자별 총 구매액을 출력하세요
select userID as '사용자',
	   sum(price) as '총구매액'
from buytbl
group by userID;

-- ○ 총 구매액이 1,000 이상인 사용자만 출력하세요
select userID as '사용자',
	   sum(price) as '총구매액'
from buytbl
group by userID
having sum(price) >= 1000;

-- world 데이터베이스에서 다음 질문을 처리하세요
SHOW DATABASES;
USE world;
SHOW TABLES;

-- ○ city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 총합을 구하시오
select sum(population) as '인구수 총합'
from city
where CountryCode = 'KOR';

-- ○ city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최소값을 구하시오.
	-- (단, 결과를 나타내는 테이블의 필드는 최소값으로 표시하시오)
select Population as '최소값'
from city
where CountryCode = 'KOR'
order by Population
limit 1;

-- ○ city 테이블에서 국가코드가 'KOR'인 도시들의 평균을 구하시오
select avg(Population)
from city
where CountryCode = 'KOR';

-- ○ city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최대값을 구하시오.
	-- (단, 결과를 나타내는 테이블의 필드는 최대값으로 표시하시오)
select Population as '최대값'
from city
where CountryCode = 'KOR'
order by Population desc
limit 1;

-- ○ country 테이블 각 레코드의 Name 칼럼의 글자수를 표시하시오
select Name,
	   length(Name) as 'Name 칼럼의 글자수'
from country;

-- ○ country 테이블의 나라명 (Name 칼럼)을 앞 세글자만 대문자로 표시하시오
select concat(upper(left(Name, 3)), substring(Name, 4)) as Name
from country;

-- ○ country 테이블의 기대수명 (LifeExpectancy)을 소수점 첫째자리에서 반올림해서 표시하시오
select round(LifeExpectancy, 0)
from country;

-- 03_mysql; SQL 기본(심화2)
-- 모든 문제는 employees 데이터베이스에서 수행한다
SHOW DATABASES;
USE employees;
SHOW TABLES;

-- employees db에서 각 부서별 관리자를 출력하세요
	-- ○ 단, 현 재직자만 출력한다
select *
from dept_manager
where to_date = '9999-01-01';

-- 부서번호 d005 부서의 현재 관리자 정보를 출력하세요
select *
from dept_manager
where dept_no = 'd005' and
	  to_date = '9999-01-01';

-- employees 테이블에서 페이지네이션으로 페이지를 추출하려고 한다. 
-- 다음 조건하에서 8번 페이지의 데이터를 출력하세요
	-- ○ 입사일을 내림차순으로 정렬한다
	-- ○ 한 페이지당 20 명의 정보를 출력한다
select *
from employees
order by hire_date desc -- ○ 입사일을 내림차순으로 정렬한다.
limit 20 offset 140;	-- ○ 한 페이지당 20 명의 정보를 출력한다

-- employees db에서 재직자의 총 수를 구하시오
	-- ○ 재직자의 to_date 값은 '9999-01-01' 로 저장되어 있음
select count(emp.emp_no) as '재직자의 총 수'
from employees as emp
	inner join dept_emp as dep
    on emp.emp_no = dep.emp_no
where dep.to_date = '9999-01-01';

-- employees.db에서 재직자의 평균 급여를 출력하시오

select avg(salary) as '재직자의 평균 급여'
from salaries
where to_date = '9999-01-01';


-- 재직자 전체 평균 급여 보다 급여를 더 많이 받는 재직자를 출력하세요
select emp_no
from salaries
where to_date = '9999-01-01'
	and salary > (
		select avg(salary)
        from salaries
        where to_date = '9999-01-01'
    ); -- avg와 같은 집계함수는 서브쿼리를 이용해야함.

	  
-- employees db에서 각 부서별 재직자의 수를 구하시오
	-- ○ 부서 번호로 구분하고, 부서 번호로 오름 차순 정렬하여 출력한다

select dept_no as '부서명',
 	   count(dept_no) '재직자 수'
from dept_emp
group by dept_no
order by dept_no;
