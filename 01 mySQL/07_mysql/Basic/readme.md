# 📝 과제 개요
07_mysql(기본) 실습 과제로, MySQL과 JDBC를 이용하여 데이터베이스 연결을 테스트하고, JUnit5 기반의 단위 테스트를 수행합니다.

## 📁 프로젝트 구조

```bash
untitled/
├── build.gradle
├── src/
│   ├── main/
│   │   ├── java/
│   │   └── resources/
│   └── test/
│       ├── java/
│       │   └── org/
│       │       └── scoula/
│       │           └── jdbc_ex/
│       │               ├── common/
│       │               │   └── JDBCUtil.java        # JDBC 유틸 클래스
│       │               └── test/
│       │                   └── ConnectionTest.java  # JUnit 테스트 클래스
│       └── resources/
│           └── application.properties               # DB 접속 정보

```
</br>

## 🔧 주요 파일 설명
### 1. JDBCUtil.java
application.properties 파일을 읽어 DB 연결 정보를 불러옴
getConnection(), close() 메서드를 제공

### 2. ConnectionTest.java
JUnit5를 이용해 DB 연결 테스트 수행

### 3. application.properties

</br>

## ✅ 실행 방법
1. application.properties 내 DB 접속 정보를 본인 환경에 맞게 설정
2. 프로젝트에서 JUnit 테스트 실행
3. 콘솔에 "DB 연결 성공" 메시지가 출력되면 성공
