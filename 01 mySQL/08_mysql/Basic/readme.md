# 📝 과제 개요
08_mysql(기본) 실습 과제로, MySQL과 JDBC를 이용하여 데이터베이스 연결을 테스트하고, JUnit5 기반의 단위 테스트를 수행합니다.

## 📁 프로젝트 구조

```bash
untitled/
├── build.gradle
├── src/
│   ├── main/
│   │   ├── java/
│   │   └── resources/
│   └── test/
│   │   ├── java/
│   │   │   └── org.scoula/
│   │   │   │   └── database/
│   │   │   │   │   └── JDBCUtil.java
│   │   │   └── travel/
│   │   │   │   ├── app/
│   │   │   │   ├── dao/
│   │   │   │   │   ├── TravelDao.java
│   │   │   │   │   ├── TravelDaoImpl.java
│   │   │   │   │   └── TravelImageVO.java
│   │   │   │   ├── dataimport/
│   │   │   │   │   ├── ImportImageData.java
│   │   │   │   │   └── ImportTravelData.java
│   │   │   │   └── domain/
│   │   │   │   │   ├── CSVTest1.java
│   │   │   │   │   └── CSVTest2.java
```
</br>

## 🔧 주요 파일
1. TravelDao.java
2. TravelDaoImpl.java
3. TravelImageVO.java
4. ImportImageData.java
5. ImportTravelData.java
6. CSVTest1.java
7. CSVTest2.java

</br>

## ✅ 실행 방법
1. application.properties 내 DB 접속 정보를 본인 환경에 맞게 설정
2. 프로젝트에서 JUnit 테스트 실행
3. 콘솔에 "DB 연결 성공" 메시지가 출력되면 성공

</br>

## 🐘 build.gradle
```java
plugins {
    id 'java'
}

group = 'org.scoula'
version = '1.0-SNAPSHOT'

repositories {
    mavenCentral()
}

dependencies {
    implementation 'com.opencsv:opencsv:5.8'
    implementation 'com.mysql:mysql-connector-j:8.3.0'

    compileOnly 'org.projectlombok:lombok:1.18.30'
    annotationProcessor 'org.projectlombok:lombok:1.18.30'

    testCompileOnly 'org.projectlombok:lombok:1.18.30'
    testAnnotationProcessor 'org.projectlombok:lombok:1.18.30'

    testImplementation platform('org.junit:junit-bom:5.10.0')
    testImplementation 'org.junit.jupiter:junit-jupiter'
}

test {
    useJUnitPlatform()
}
```

</br>
