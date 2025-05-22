package org.scoula.jdbc_ex.dao;
/*
Users 테이블에 대한 기본 CRUD 연산을 수행하기 위한 인터페이스를 정의하세요
○ 패키지명 : org.scoula.jdbc_ex.dao
○ 인터페이스명 : UserDao
○ 메서드 목록
     int create(UserVO user) throws SQLException;
     List<UserVO> getList() throws SQLException;
     Optional<UserVO> get(String id) throws SQLException;
     int update(UserVO user) throws SQLException;
     int delete(String id) throws SQLException;
 */

import org.scoula.jdbc_ex.domain.UserVO;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface UserDao {
    int crate(UserVO user) throws SQLException; // 1. 회원 등록
    List<UserVO> getList() throws SQLException; // 2. 회원 목록 조회
    Optional<UserVO> get(String id) throws SQLException; // 3. 회원 정보 조회
    int update(UserVO user) throws SQLException; // 4. 회원 수정
    int delete(String id) throws SQLException; // 5. 회원 삭제
}
