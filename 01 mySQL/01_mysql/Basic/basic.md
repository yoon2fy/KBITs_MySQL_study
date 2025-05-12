# MySQL 설치
## Q1. 샘플 데이터 베이스가 없다면 sakila, world를 다운받아 데이터베이스를 구축하세요.
- 완료
---

## Q2. employees.sql 파일을 이용하여 테스트 데이터를 구축하세요.
![image](./01_mysql_basic_answer)

```cmd
cd employees
mysql -u root -p
source employees.sql
mysql> show databases;
```
