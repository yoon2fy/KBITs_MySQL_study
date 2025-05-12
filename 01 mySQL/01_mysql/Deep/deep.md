# 테스트 데이터베이스 구축
## Q1. world 데이터베이스의 각 테이블을 조사하여 아래 표를 완성하세요.
**o 테이블명: city**

|컬럼명     |데이터타입|PK|NN|UN|기본값|설명|
|-----------|----------|:-:|:-:|:-:|------|----|
|ID         |int       |O  |O  |O  |   |       |
|Name       |char(35)  |   |   |
|CountryCode|char(3)   |   |
|District   |char(20)  |   |
|Population |int       |   |

**o 테이블명: country**
|컬럼명        |데이터타입|PK|NN|UN|기본값|설명|
|--------------|----------|:-:|:-:|:-:|------|----|
|Code          |char(3)   |O  |O  |O  |   |       |
|Name          |char(52) 
|Continent     |enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') 
|Region        |char(26) 
|SurfaceArea   |decimal(10,2) 
|IndepYear     |smallint 
|Population    |int 
|LifeExpectancy|decimal(3,1) 
|GNP           |decimal(10,2) 
|GNPOld        |decimal(10,2) 
|LocalName     |char(45) 
|GovernmentForm|char(45) 
|HeadOfState   |char(60) 
|Capital       |int 
|Code2         |char(2)


**o 테이블명: countrylanguage**
|컬럼명     |데이터타입 |PK |NN |UN |기본값|설명|
|-----------|----------|:-:|:-:|:-:|------|----|
|CountryCode|char(3)   |O  |O  |O  |     |       |
|Language   |char(30)  |O  |O  |O  |     |       | 
|IsOfficial |enum('T','F') 
|Percentage |decimal(4,1)

---

## Q2.employees 데이터베이스의 각 테이블을 조사하여 아래 표를 완성하세요

**o 테이블명: departments**
|컬럼명     |데이터타입 |PK |NN |UN |기본값|설명|
|-----------|----------|:-:|:-:|:-:|------|----|
|dept_no    |char(4)   |O  |O  |O  |     |       |
|dept_name  |varchar(40)

**o 테이블명: dept_manager**
|컬럼명     |데이터타입 |PK |NN |UN |기본값|설명|
|-----------|----------|:-:|:-:|:-:|------|----|
|emp_no     |int       |O  |O  |O  |     |       |
|dept_no    |char(4)   |O  |O  |O  |     |       |
|from_date  |date 
|to_date    |date

**o 테이블명: employees**
|컬럼명     |데이터타입 |PK |NN |UN |기본값|설명|
|-----------|----------|:-:|:-:|:-:|------|----|
|emp_no     |int       |O  |O  |O  |     |       |
|birth_date |date 
|first_name |varchar(14) 
|last_name  |varchar(16) 
|gender     |enum('M','F') 
|hire_date  |date



**o 테이블명: salaries**
|컬럼명     |데이터타입 |PK |NN |UN |기본값|설명|
|-----------|----------|:-:|:-:|:-:|------|----|
|emp_no     |int       |O  |O  |O  |     |       |
|salary     |int 
|from_date  |date      |O  |O  |O  |     |       |
|to_date    |date


**o 테이블명: titles**
|컬럼명     |데이터타입 |PK |NN |UN |기본값|설명|
|-----------|----------|:-:|:-:|:-:|------|----|
|emp_no     |int       |O  |O  |O  |     |       |
|title      |varchar(50)|O  |O  |O  |     |       |
|from_date  |date      |O  |O  |O  |     |       | 
|to_date    |date


