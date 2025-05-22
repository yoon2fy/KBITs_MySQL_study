package org.scoula.jdbc_ex.dao;

// UserDao의 구현 클래스 UserDaoImpl 클래스를 정의하세요

import org.scoula.jdbc_ex.domain.UserVO;
import org.scoula.jdbc_ex.common.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserDaoImpl implements UserDao {
    Connection conn = JDBCUtil.getConnection();

    // USERS 테이블 관련 SQL 명령어
    private String USER_LIST = "select * from `user`";
    private String USER_GET = "select * from `user` where `id` = ?";
    private String USER_INSERT = "insert into users values(?,?,?,?)";
    private String USER_UPDATE = "update users set name = ?, role = ? where id = ?";
    private String USER_DELETE = "delete from `user` where id = ?";

    // 회원 등록
    @Override
    public int create(UserVO user) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement(USER_INSERT)){
            stmt.setString(1, user.getId());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getName());
            stmt.setString(4, user.getRole());
            return stmt.executeUpdate();
        }
    }

    private UserVO map(ResultSet rs) throws SQLException {
        UserVO user = new UserVO();
        user.setId(rs.getString("ID"));
        user.setPassword(rs.getString("PASSWORD"));
        user.setName(rs.getString("NAME"));
        user.setRole(rs.getString("ROLE"));
        return user;
    }

    // 회원 목록 조회
    @Override
    public List<UserVO> getList() throws SQLException {
        List<UserVO> userList = new ArrayList<UserVO>();
        Connection conn = JDBCUtil.getConnection();
        try (PreparedStatement stmt = conn.prepareStatement(USER_LIST);
             ResultSet rs = stmt.executeQuery()){
            while(rs.next()){
                UserVO user = map(rs);
                userList.add(user);
            }
        }
        return userList;
    }

    // 회원 정보 조회
    @Override
    public Optional<UserVO> get(String id) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement(USER_GET)){
            stmt.setString(1, id);
            try(ResultSet rs = stmt.executeQuery()){
                if(rs.next()){
                    return Optional.of(map(rs));
                }
            }
        }
        return Optional.empty();
    }

    // 회원 수정
    @Override
    public int update(UserVO user) throws SQLException {
        Connection conn = JDBCUtil.getConnection();
        try (PreparedStatement stmt = conn.prepareStatement(USER_UPDATE)){
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getRole());
            stmt.setString(3, user.getId());
            return stmt.executeUpdate();

        }
    }

    // USERS 테이블 관련 CRUD 메소드
    // 회원삭제
    @Override
    public int delete(String id) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement(USER_DELETE)){
            stmt.setString(1, id);
            return stmt.executeUpdate();
        }
    }
}