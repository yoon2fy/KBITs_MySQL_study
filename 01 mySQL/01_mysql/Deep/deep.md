# 테스트 데이터베이스 구축
## Q1. world 데이터베이스의 각 테이블을 조사하여 아래 표를 완성하세요.

**o 테이블명: city**
|컬럼명     |데이터타입|PK|NN|기본값|설명|
|-----------|----------|:-:|:-:|------|----|
|ID         |int       |O  |O  |   |ID       |
|Name       |char(35)  |   |O  |"  |도시명|
|CountryCode|char(3)   |   |O  |"  |3자리 국가 코드|
|District   |char(20)  |   |O  |"  |광역지역명|
|Population |int       |   |O  |0  |인구수|

**o 테이블명: country**
|컬럼명        |데이터타입   |PK|NN|기본값|설명|
|--------------|-------------|:-:|:-:|------|----|
|Code          |char(3)      |O |O |"   |3자리 국가 코드|
|Name          |char(52)     |  |O |"  |국가명|
|Continent     |enum         |  |O |'Asia'|대륙|
|Region        |char(26)     |  |O |"  |지역|
|SurfaceArea   |decimal(10,2)|  |O |0.00  |면적|
|IndepYear     |smallint     |  |  |NULL|독립년도|
|Population    |int          |  |O |0   |인구수|
|LifeExpectancy|decimal(3,1) |  |  |NULL|기대 수명|
|GNP           |decimal(10,2)|  |  |NULL|GNP|
|GNPOld        |decimal(10,2)|  |  |NULL|?|
|LocalName     |char(45)   |  |O  |"|그나라 국가명|
|GovernmentForm|char(45)   |  |O  |"|정부형태|
|HeadOfState   |char(60)   |  |   |NULL|국가 수장 이름(대통령 이름)|
|Capital       |int        |  |   |NULL||
|Code2         |char(2)    |  |O  |"|2자리 국가 코드|

**o 테이블명: countrylanguage**
|컬럼명     |데이터타입|PK|NN|기본값|설명|
|-----------|----------|:-:|:-:|------|----|
|CountryCode|char(3)   |O  |O  |"|3자리 국가 코드|
|Language   |char(30)  |O  |O  |"|언어|
|IsOfficial |enum('T','F')|  |O  |'F'|공식 언어 여부|
|Percentage |decimal(4,1)|  |O  |0.0|점유율|

---

## Q2.employees 데이터베이스의 각 테이블을 조사하여 아래 표를 완성하세요

**o 테이블명: departments**
|컬럼명     |데이터타입|PK|NN|기본값|설명|
|-----------|----------|:-:|:-:|------|----|
|dept_no    |char(4)   |O  |O  |    |부서번호|
|dept_name  |varchar(40)|  |O  |    |부서명  |

**o 테이블명: dept_manager**
|컬럼명     |데이터타입|PK|NN|기본값|설명|
|-----------|----------|:-:|:-:|------|----|
|emp_no     |int       |O |O  |  |사원번호|
|dept_no    |char(4)   |O |O  |  |부서번호|
|from_date  |date      |  |O  |  |해당 부서에서의 시작일|
|to_date    |date      |  |O  |  |해당 부서에서의 마지막일|

**o 테이블명: employees**
|컬럼명     |데이터타입   |PK|NN|기본값|설명|
|-----------|-------------|:-:|:-:|------|----|
|emp_no     |int          |O |O  |  |사원 번호|
|birth_date |date         |  |O  |  |생년월일|
|first_name |varchar(14)  |  |O  |  |이름|
|last_name  |varchar(16)  |  |O  |  |성|
|gender     |enum('M','F')|  |O  |  |성별|
|hire_date  |date         |  |O  |  |입사일|

**o 테이블명: salaries**
|컬럼명     |데이터타입|PK|NN|기본값|설명|
|-----------|----------|:-:|:-:|------|----|
|emp_no     |int       |O |O  |  |사원번호|
|salary     |int       |  |O  |  |월급|
|from_date  |date      |O |O  |  |해당 급여 시작일|
|to_date    |date      |  |O  |  |해당 급여 마지막일|
