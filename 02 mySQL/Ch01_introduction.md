# Chapter 01 DBMS 개요

## 📚 DB 정의와 특징
- **DB:** (1) 데이터의 집합, (2) 여러 명의 사용자나 응용프로그램이 공유/동시 접근, (3) '데이터의 저장 공간' 자체
- **DBMS:** DB를 관리/운영하는 역할

## 📚 DB/DBMS의 특징
> (1) 데이터의 무결성, (2) 데이터의 독립성, (3) 보안, (4) 데이터 중복의 최소화, (5) 응용 프로그램 제작 및 수정이 쉬워짐, (6) 데이터의 안전성 향상

### 📖 데이터의 무결성 (Integrity)
- 데이터베이스 안의 데이터는 오류가 없어야 함
- 제약 조건 (Constrain)을 가짐

### 📖 데이터의 독립성
- 데이터베이스 크기 변경하거나 데이터 파일의 저장소 변경시, 기존에 작성된 응용프로그램은 전혀 영향을 받지 않아야 함

### 📖 보안 (Security)
- 데이터베이스 안의 데이터에 데이터를 소유한 사람이나 데이터에 접근이 허가된 사람만 접근할 수 있어야 함
- 접근할 때도 사용자의 계정에 따라서 다른 권한 가짐

### 📖 데이터 중복의 최소화
- 동일한 데이터가 여러 개 중복되어 저장되는 것 방지

### 📖 응용프로그램 제작 및 수정이 쉬워짐
- 통일된 방식으로 응용프로그램 작성 가능
- 유지보수 또한 쉬워짐

### 📖 데이터의 안전성 향상
- 대부분의 DBMS 가 제공하는 백업 · 복원 기능 이용
- 데이터가 깨지는 문제가 발생할 경우 원상으로 복원, 복구하는 방법이 명확해짐

---

## 📚 DBMS의 분류
> (1) 계층형 DBMS, (2) 망형 DBMS, (3) 관계형 DBMS,

### 📖 계층형 DBMS
- 처음으로 나온 DBMS 개념 1960 년대에 시작
- 각 계층은 트리 Tree 형태 , 1:N 관계

**[문제점]**
- 처음 구축한 이후 그 구조를 변경하기가 상당히 까다로움
- 주어진 상태에서의 검색은 상당히 빠름
- 접근 유연성 부족해서 임의의 검색에는 어려움

### 📖 망형 DBMS
- 계층형 DBMS 의 문제점을 개선하기 위해 1970 년대에 시작
- 1:1,1:N, N:M( 다대다 ) 관계 지원 효과적이고 빠른 데이터 추출
- 복잡한 내부 포인터 사용 (프로그래머가 이 모든 구조를 이해해야만 프로그램의 작성 가능)


### 📖 관계형 DBMS (Relational DBMS)
- 1969 년 E.F.Codd 라는 학자가 수학 모델에 근거해 고안
- 데이터베이스는 테이블 `Table` 이라 불리는 최소 단위로 구성
- 이 테이블은 하나 이상의 열로 구성

### 📑 관계형 DBMS의 장단점
**[장점]**
- 다른 DBMS 에 비해 업무가 변화될 경우 쉽게 변화에 순응
- 유지보수 측면에서도 편리
- 대용량 데이터의 관리와 데이터 무결성 (Integration) 보장

**[단점]**
- 시스템 자원을 많이 차지해 시스템이 전반적으로 느려지는 것
- 하드웨어 발전되어 해결

---

## 📚 SQL 개요
### 📖 SQL (Structured Query Language)
- 관계형 데이터베이스에서 사용되는 언어
- DBMS 제작 회사와 독립적
- 다른 시스템으로 **이식성**이 좋음
- 표준이 계속 발전중
- 대화식 언어
- **분산형 클라이언트/서버 구조**
