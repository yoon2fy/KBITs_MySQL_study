package org.scoula.jdbc_ex.test;

/* 07_mysql(기본) JDBC 프로그래밍
-- JY let's go

[문제 4] JUnit5를 이용하여 데이터베이스에 접속하는 JDBC 코드를 테스트하세요
○ test 폴더에서 작업함
○ 패키지명 : org.scoula.jdbc_ex.test
○ 테스트 클래스명 : ConnectionTest
     테스트 메소드 : testConnection()
 */

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.scoula.jdbc_ex.common.JDBCUtil;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest {
    Connection conn = null;
    @Test
    @DisplayName("jdbc_ex 데이터베이스에 접속한다.")
    public void testConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("드라이버 설정 성공");

        String url = "jdbc:mysql://127.0.0.1:3306/jdbc_ex";
        String id = "scoula";
        String password = "1234";
        conn = DriverManager.getConnection(url, id, password);
        System.out.println("DB 연결 성공");

        conn.close();
        System.out.println("DB 연결 해제");
    }

    // [문제 7] ConnectionTest 클래스의 testConnection2 메서드에서 JDBCUtil 클래스의 기능을 테스트하세요
    @Test
    @DisplayName("jdbc_ex에 접속한다.(자동 닫기)")
    public void testConnection2() throws SQLException {
        try(Connection conn = JDBCUtil.getConnection()){
            System.out.println("DB 연결 성공");
        }
    }
}
