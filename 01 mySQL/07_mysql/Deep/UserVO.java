package org.scoula.jdbc_ex.domain;
/*
Users 테이블을 위한 VO 클래스를 정의하세요
○ 패키지 : org.scoula.jdbc_ex.domain
○ 클래스명 : UserVO
○ 롬복을 이용한 기본 정의
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
    private String id;
    private String password;
    private String name;
    private String role;
}
