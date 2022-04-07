DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE LOCATIONS;
DROP TABLE SALGRADE;

CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) 
);
CREATE TABLE EMP(
    EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);

CREATE TABLE SALGRADE( 
    GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER 
);
CREATE TABLE LOCATIONS (
     LOC_CODE  CHAR(2) ,
     CITY      VARCHAR2(12)
) ;

-- DEPT테이블에 데이터 삽입
INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');

-- EMP테이블에 데이터 삽입
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('09-12-1982','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('12-1-1983','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

-- SALGRADE테이블에 데이터 삽입
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);


select * from emp; -- emp 테이블에 있는 모든 컬럼을 화면에 출력하시오. 

select empno, ename, job, mgr, hiredate, sal, comm, deptno 
from emp;

select empno, ename, job, mgr, hiredate, sal, comm
from emp;

select empno, ename, sal, sal+500 from emp;

select empno, ename, sal, 2*sal+500 from emp;

select empno, ename, sal, 2*(sal+500) from emp;

select empno, ename, comm, comm+500 
from emp;

select ename AS name, sal 월급 , sal*12 "Annual Salary"
from emp;

select ename 결과1, 'ABC' 결과2, sal 결과3, 500 결과4 
from emp;

select ename || ':' || empno || ':' || job "이름 사번 업무"
from emp;

select ename || 'is a ' || job AS "Employees Details"
from emp;

select ename || ': 1 Year salary = ' || sal*12 AS Montly
from emp;

select distinct job
from emp;

select ALL job
from emp;

select DISTINCT deptno, job --부서번호이면서 업무가 동일한 중복을 제거
from emp;

select rowid, rownum, ename, sal
from emp;
-- rowid는 오라클에서 제공하는 것으로 모든 행을 구별해주는 열
-- rownum은 일련번호를 부여해주는 컬럼으로 1씩 증가

select empno, ename, job, sal 
from emp 
where job = 'MANAGER';

select empno, ename, job, sal 
from emp 
where job = 'Manager'; -- 데이터는 대소문자를 구분한다.

select empno, ename, job, sal 
from emp -- emp 테이블로부터 한 행씩 읽어서
where sal >= 3000; -- wherer 조건절이 참(TRUE)일 경우에
-- select문에 있는 컬럼을 화면에 출력한다.

select empno, ename, job, sal, deptno
from emp 
where deptno = 30; -- 데이터는 대소문자를 구분한다.

select empno, ename, job, sal, deptno
from emp 
where deptno <> 30;

select empno, ename, job, sal, deptno
from emp 
where deptno != 30; 

select empno, ename, job, sal, deptno
from emp 
where deptno ^= 30;

-- 36
-- 예제1

select ename, job, sal, deptno
from emp
where sal BETWEEN 1300 AND 1700;
-- sal값이 1300보다 크고 sal 값이 1700보다 작은 경우 TRUE

select ename, job, sal, deptno
from emp
where sal BETWEEN 1700 AND 1300;
-- BETWEEN 다음에 오는 숫자는 AND 다음보다 크기가 작아야 한다.

-- 37
--예제3
SELECT empno, ename, job, sal, hiredate
from emp
where empno  IN(7902, 7788, 7566);
-- empno값이 7902 또는 7788 또는 7566에 해당하는 데이터 출력


SELECT empno, ename, job, sal, hiredate
from emp
where empno =7902 OR empno = 7788 OR empno = 7566;

SELECT ename, sal, job
from emp
where ename LIKE '_A%';
-- ename의 첫글자는 모든 문자가 올 수 있고 두 번째는 반드시 A가 와야한다.
-- %는 0개 이상

SELECT ename, sal, job
from emp
where ename LIKE '%A%'; -- ename값이 'A'만 존재하면 TRUE

SELECT empno, ename, job, sal, comm, deptno
from emp
where comm = NULL; 
-- comm = NULL에서 NULL과 연산을 하면 그 결과는 NULL

SELECT empno, ename, job, sal, comm, deptno
from emp
where comm < NULL; 

SELECT empno, ename, job, sal, comm, deptno
from emp
where comm IS NULL; 

-- 39
-- 예제1
SELECT empno, ename, job, sal, deptno
from emp
where sal >= 2800 AND job = 'MANAGER';

SELECT empno, ename, job, sal, deptno
from emp
where sal >= 2800 OR job = 'MANAGER';

-- 40
-- 예제1
SELECT empno, ename, job, sal, deptno
from emp
where job IN('MANAGER', 'CLERK', 'ANALYST');

SELECT empno, ename, job, sal, deptno
from emp
where job NOT IN('MANAGER', 'CLERK', 'ANALYST');
-- 'MANAGER', 'CLERK', 'ANALYST'를 제외한 행 출력

SELECT empno, ename, job, sal, deptno
from emp
where sal BETWEEN 1000 AND 3000;

SELECT empno, ename, job, sal, deptno
from emp
where sal NOT BETWEEN 1000 AND 3000;
-- sal값이 1000보다 작고 3000보다 큰 데이터를 출력\

select empno, ename, job, sal, deptno
from emp
where ename LIKE 'A%';

select empno, ename, job, sal, deptno
from emp
where ename NOT LIKE 'A%';
-- 첫글자가 'A'가 아닌 데이터를 출력

select empno, ename, job, sal, comm
from emp
where comm IS NULL;

select empno, ename, job, sal, comm
from emp
where comm IS NOT NULL;
-- comm값이 NULL이 아닌 데이터를 출력

select empno, ename, job, sal, comm
from emp
where (NVL(comm, 0)= 0);
-- NVL(comm, 0)는 comm값이 NULL이면 0값으로 바꾸시오.

--43
-- 예제1
select empno, ename, job, sal
from emp
where sal > 1500 AND job = 'PRESIDENT' OR job ='SALESMAN';

select empno, ename, job, sal
from emp
where sal > 1500 AND (job = 'PRESIDENT' OR job ='SALESMAN');

select empno, ename, job, sal
from emp
where sal > 1500 AND job IN('PRESIDENT','SALESMAN');

SELECT empno, ename, job, sal, hiredate, deptno
FROM emp
ORDER BY hiredate;

SELECT empno, ename, job, sal, hiredate, deptno
FROM emp
ORDER BY hiredate desc; -- 최근에 입사한 날짜 순으로 정렬

SELECT empno, ename, job, sal, deptno
FROM emp
ORDER BY hiredate desc; -- select절에 없는 컬럼도 정렬의 기분으로 사용가능

SELECT empno, ename, job, sal, hiredate, deptno
FROM emp
ORDER BY deptno, sal DESC;  -- deptno컬럼 기준으로 오름차순, sal컬럼 기준으로 내림차순
-- deptno 다음에는 ASC가 생략됨

-- 46
SELECT empno, ename, job, sal, hiredate, deptno
FROM emp
order by 4,5 desc; -- 4는 select절의 4번째 컬럼, 5는 5번째 컬럼을 나타낸다.

SELECT ename, sal, sal*12 ANN_SAL
FROM emp
order by ANN_SAL; -- 별명으로도 정렬의 기준으로 사용가능

-- 47
-- 예제5
select DISTINCT deptno, job
from emp
order by job;

select DISTINCT deptno, job
from emp
order by deptno;

select DISTINCT deptno, job
from emp
order by empno; -- select절에 distinct를 사용하면 select절에 있는 컬럼만 사용

select DISTINCT job, sal+comm
from emp
order by 2; -- 2는 select절의 2번째 컬럼

-- 55
-- 예제1
select empno, ename, job, LOWER(job), INITCAP(job)
from emp
where deptno = 10;

select empno, ename, job, 
    CONCAT(empno, ename) ename1, 
    CONCAT(ename, empno) e_empno,
    CONCAT(ename, job) e_job
from emp
where deptno = 10;

select empno, ename, job, sal, deptno
from emp
WHERE SUBSTR(ename, 1, 1) > 'K' AND SUBSTR(ename, 1, 1) < 'Y'
-- SUBSTR(ename, 1, 1) ename컬럼의 문자열에서 첫 번째 위치부터 시작해서 1개의
-- 문자열을 얻는다.
ORDER BY ename;

-- 예제4
SELECT empno, ename, LENGTH(ename), sal, LENGTH(sal)
from emp
where deptno = 20;
-- LENGTH(ename)는 ename컬럼 문자열의 길이

-- 예제5
SELECT ename, 
    INSTR(ename, 'L') e_null
from emp
order by ename;

SELECT ename, 
    INSTR(ename, 'L') e_null,
    INSTR(ename, 'L', 1, 1) e_null, -- ename에 있는 문자열에서 'L'문자를 찾는데
    -- 1은 문자열의 처음부터 시작하여 1은 몇 번째 등장하는 search-string
    INSTR(ename, 'L', 1, 2) e_null2, -- ename에 있는 문자열에서 'L'문자를 찾는데
    -- 1은 문자열의 처음부터 시작하여 2는 두 번째 등장하는 search-string
    INSTR(ename, 'L', 4, 1) e_null4,-- ename에서 'L'문자를 4번째 위치부터 시작하여 
    -- 검색하는 'L'이 첫번째로 등장하는 문자열은 4번째에 위치한다
    INSTR(ename, 'L', 4, 2) e_null42 -- ename에서 'L'문자를 4번째 위치부터 시작하여 
    -- 검색하는 'L'이 두번째로 등장하는 문자열은 존재하지 않는다.
from emp
order by ename;

select parameter, value
from NLS_DATABASE_PARAMETERS
where parameter = 'NLS_CHARACTERSET';
-- AL32UTF8은 한글 한글자가 3바이트로 설정되어 있다.

select 
    substrB('I am here with you', 5, 3) 결과1,
    substr('나 여기 있어', 5, 3) 결과2,
    substrB('나 여기 있어', 5, 3) 결과3,
    -- 한글 1글자는 3바이트로 설정 되어있다. 여기서는 5는 '여'문자의 위치이다.
    -- 3dms 'du'rk 3바이트이기 때문에 출력결과는 '여'가 된다
    substrB('나 여기 있어', 5, 4) 결과4,
    substrB('나 여기 있어', 5, 5) 결과5,
    substrB('나 여기 있어', 5, 6) 결과6 -- 출력은 '여기'로 되는데 한글 2글자가 6바이트
    -- 이기 때문
from dual; -- dual은 오라클에서 제공하는 가상 테이블

select ename, substr(ename, 1, 3), 
    -- ename이 문자열에서 첫 번째 위치부터 3개의 문자열을 반환
    substr(ename, 3),
    -- ename이 문자열에서 세 번째 위치부터 끝까지 문자열을 반환
    substr(name, -3, 2)
    -- ename이 문자열에서 마지막 위치를 기준으로 해서 
    -- -3은 앞으로 세 번째 문자열부터 2개의 문자열을 반환
from emp
where deptno = 10;

--59페이지
select ename, LPAD(ename, 15, '*'), sal, LPAD(sal, 10, '*') 
from emp
where deptno = 10;

select ename, RPAD(ename, 15, '*'), sal, RPAD(sal, 10, '*') 
from emp
where deptno = 10;
    
-- 예제3
select ename, job, LTRIM(job, 'A'), sal, LTRIM(sal, 1)
from emp
where deptno = 20;

select ename, job, RTRIM(job, 'T'), sal, RTRIM(sal, 0)
from emp
where deptno = 20;

select 
    TRIM(LEADING 'A' FROM 'AABDCADD') 결과1,  
    -- 문자열 'AABDCADD'의 맨앞에 있는 'A' 삭제
    TRIM('A' FROM 'AABDCADD') 결과2, 
    -- 문자열 'AABDCADD'의 맨앞에 있는 'A'와 맨 뒤에 있는 'A'를 삭제
    TRIM(TRAILING 'D' FROM 'AABDCADD') 결과3
    -- 문자열 'AABDCADD'의 맨뒤에 있는 'D' 삭제
from dual;
    
-- REPLACE 함수
select ename, REPLACE(ename, 'SC', '*?') 변경결과 
-- ename의 값 중 SC인 문자열을 찾아서 '*?'로 변경
from emp
where deptno = 20;

select ename, TRANSLATE(ename, 'SC', '*?') 변경결과2 
-- S는 *로, C는 ?로 바뀐다.
-- ename에 있는 데이터에서 문자 's' 또는 'c'가 있는 문자를 
from emp
where deptno = 20;

-- 사원이름을 소문자로 바꾸는 것을 TRANSLATE()함수를 이용해서 작성하시오
SELECT ename, TRANSLATE( ename, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') u_lower
from emp;

-- LOWER함수를 이용해서 작성
select ename, LOWER(ename) u_lower
from emp;

select 
    ROUND(4567.678) 결과1,
    ROUND(4567.678, 0) 결과2,
    ROUND(4567.678, 2) 결과3,
    ROUND(4567.678, -2) 결과4
FROM dual;

select 
    TRUNC(4567.678) 결과1,
    TRUNC(4567.678, 0) 결과2,
    TRUNC(4567.678, 2) 결과3,
    TRUNC(4567.678, -2) 결과4
FROM dual;

select POWER(2, 10) 결과1, CEIL(3.7) 결과2, FLOOR(3.7) 결과3
FROM dual;

select sal, sal, mod(sal, 30)
from emp
where deptno = 10;

select sal, sal, sign(sal-2975)
from emp
where deptno = 20;

-- 오라클의 날짜 포맷(형식) 조회
select value 
from NLS_SESSION_PARAMETERS
where parameter = 'NLS_DATE_FORMAT';

select sysdate
from dual;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
-- 날짜 형식을 변경할 때
commit;