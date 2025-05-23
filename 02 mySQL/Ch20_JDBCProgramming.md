# JDBC 프로그래밍

## 📚 JDBC_Java DataBase Connectivity
- DB와 연결해서 입출력을 지원
- DBMS의 종류와 상관없이 동일하게 사용할 수 있는 클래스와 인터페이스로 구성됨

![jdbc1](./img/fig_jdbc1.png)

**fig. JDBC의 개념**

</br>

**JDBC의 전체구조**

`Application` ⇨ `JBDC(java.sql 패키지) 인터페이스` ⇦ **[** `JDBC Driver` ➝ `Oracle/MySQL ...` **]**

</br>

## 📚 Application 구조 (응집도)
|    |            |           |                |      |
|:--:|:----------:|:---------:|:--------------:|:----:|
|    |자바프로그램|자바프로그램|자바프로그램    |DB서버|
|역할|UI          |가방, VO   |DB관련 처리, DAO|      |
|    |⟶ data     |           |⟶ SQL         |      |
|    |   result ⟵|           |result ⟵      |      |

</br>

## 📚 JAVA Application에서 반드시 필요한 클래스 2개
|    |DB처리 담당 클래스|데이터 전달 담당 클래스|
|:--:|-------------------|-----------------------|
|이름|Data Access Object (DAO)|Data Transfer Object(DTO), VO|
|기능|DB에 접근해서 처리하는 클래스. 데이터를 가지고 할 수 있는 일. CRUD(Create, Read, Update, Delete)|입력한 데이터를 DB에 전송하기 위해서 데이터를 묶기 위한 가방역할의 클래스|

![jdbc2](./img/fig_jdbc2.png)

**fig. JDBC의 핵심 인터페이스/클래스**


---

## 📚 ⭐ JDBC 개발 절차

![jdbc3](./img/fig_jdbc3.png)

**fig. JDBC 개발 절차**

1. JDBC 드라이버를 로드한다. 이때, 사용해야하는 클래스는 `System.setProperty()`, `Class.forName()` 이다.
2. 데이터 베이스를 연결한다. 이때, `Java.sql.Connection`을 사용한다.
3. Statement를 생성한다. 이때, 사용해야하는 클래스는 `Java.sql.Statement`, `Java.sql.PreparedStatement`이다.
4. SQL문을 전송한다. 이때, `Java.sql.Statement`의 `executeQuery()`와 `executeUpdate()`를 사용한다.
5. 결과를 받는다. 이때, `Java.sql.ResultSet`를 사용한다.
6. 사용 이후 연결을 해제한다. 이때 `Java.sql.Connection`의 `Close()`를 사용한다.

![jdbc4](./img/fig_jdbc4.png)

**fig. ⭐ DB 처리 필수 4단계**

```java
try {
  // ⭐ 1. 커넥터 설정 (DB 드라이버 설정)
  Class.forName("com.mysql.jdbc.Driver");
  System.out.println("1. 커넥터 설정 성공....");

  // ⭐ 2. DB 연결
  String url = jdbc:mysql://localhost:3309/ ... ";
  String user = "root";
  String password = "1234";
  Connection con = DriverManager.getConnection(url, user, password);
  System.out.println("2. DB 연결 성공....");

  // ⭐ 3. SQL문을 만든다. (SQL문 객체 생성)
  String sql = "insert into member values (?, ?, ?, ?)";
  PreparedStatement ps = con.preparedStatement(sql);
  ps.setString(1, id);
  ps.setString(2, pw);
  ps.setString(3, name);
  ps.setString(4, tel);
  System.out.println("4. SQL문 전송 성공");

}



```


# 작성중








