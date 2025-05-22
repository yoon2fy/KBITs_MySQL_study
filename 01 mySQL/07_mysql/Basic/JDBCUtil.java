package org.scoula.jdbc_ex.common;

/* 07_mysql(기본) JDBC 프로그래밍
-- JY let's go

[문제 6] org.scoula.jdbc_ex.common 패키지에 JDBCUtil 클래스를 작성하세요
○ Properties 클래스를 이용하여 application.properties 파일을 로드함
○ 데이터베이스 접속에 필요한 정보를 추출함
○ jdbc_ex 데이터베이스에 접속하여 Connection 객체를 보관함
○ getConnection() 스태틱 메서드를 정의함
     외부에서 Connection 객체를 추출하기 위함
○ 데이터베이스 접속을 끊는 close() 메서드를 정의함
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtil {
    static Connection conn = null;

    public static Connection getConncection(){
        if(conn != null) return conn;

        try {
            Properties properties = new Properties();
            properties.load(JDBCUtil.class.getResourceAsStream("/application.properties"));

            String driver = properties.getProperty("driver");
            String url = properties.getProperty("url");
            String id = properties.getProperty("id");
            String password = properties.getProperty("password");

            Class.forName(driver);
            conn = DriverManager.getConnection(url, id, password);
        } catch (Exception e) {
            e.printStackTrace();
        } return conn;
    }

    public static void close(){
        try{
            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}