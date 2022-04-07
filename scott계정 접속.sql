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

-- DEPT���̺� ������ ����
INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');

-- EMP���̺� ������ ����
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

-- SALGRADE���̺� ������ ����
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);


select * from emp; -- emp ���̺� �ִ� ��� �÷��� ȭ�鿡 ����Ͻÿ�. 

select empno, ename, job, mgr, hiredate, sal, comm, deptno 
from emp;

select empno, ename, job, mgr, hiredate, sal, comm
from emp;

select empno, ename, sal, sal+500 from emp;

select empno, ename, sal, 2*sal+500 from emp;

select empno, ename, sal, 2*(sal+500) from emp;

select empno, ename, comm, comm+500 
from emp;

select ename AS name, sal ���� , sal*12 "Annual Salary"
from emp;

select ename ���1, 'ABC' ���2, sal ���3, 500 ���4 
from emp;

select ename || ':' || empno || ':' || job "�̸� ��� ����"
from emp;

select ename || 'is a ' || job AS "Employees Details"
from emp;

select ename || ': 1 Year salary = ' || sal*12 AS Montly
from emp;

select distinct job
from emp;

select ALL job
from emp;

select DISTINCT deptno, job --�μ���ȣ�̸鼭 ������ ������ �ߺ��� ����
from emp;

select rowid, rownum, ename, sal
from emp;
-- rowid�� ����Ŭ���� �����ϴ� ������ ��� ���� �������ִ� ��
-- rownum�� �Ϸù�ȣ�� �ο����ִ� �÷����� 1�� ����

select empno, ename, job, sal 
from emp 
where job = 'MANAGER';

select empno, ename, job, sal 
from emp 
where job = 'Manager'; -- �����ʹ� ��ҹ��ڸ� �����Ѵ�.

select empno, ename, job, sal 
from emp -- emp ���̺�κ��� �� �྿ �о
where sal >= 3000; -- wherer �������� ��(TRUE)�� ��쿡
-- select���� �ִ� �÷��� ȭ�鿡 ����Ѵ�.

select empno, ename, job, sal, deptno
from emp 
where deptno = 30; -- �����ʹ� ��ҹ��ڸ� �����Ѵ�.

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
-- ����1

select ename, job, sal, deptno
from emp
where sal BETWEEN 1300 AND 1700;
-- sal���� 1300���� ũ�� sal ���� 1700���� ���� ��� TRUE

select ename, job, sal, deptno
from emp
where sal BETWEEN 1700 AND 1300;
-- BETWEEN ������ ���� ���ڴ� AND �������� ũ�Ⱑ �۾ƾ� �Ѵ�.

-- 37
--����3
SELECT empno, ename, job, sal, hiredate
from emp
where empno  IN(7902, 7788, 7566);
-- empno���� 7902 �Ǵ� 7788 �Ǵ� 7566�� �ش��ϴ� ������ ���


SELECT empno, ename, job, sal, hiredate
from emp
where empno =7902 OR empno = 7788 OR empno = 7566;

SELECT ename, sal, job
from emp
where ename LIKE '_A%';
-- ename�� ù���ڴ� ��� ���ڰ� �� �� �ְ� �� ��°�� �ݵ�� A�� �;��Ѵ�.
-- %�� 0�� �̻�

SELECT ename, sal, job
from emp
where ename LIKE '%A%'; -- ename���� 'A'�� �����ϸ� TRUE

SELECT empno, ename, job, sal, comm, deptno
from emp
where comm = NULL; 
-- comm = NULL���� NULL�� ������ �ϸ� �� ����� NULL

SELECT empno, ename, job, sal, comm, deptno
from emp
where comm < NULL; 

SELECT empno, ename, job, sal, comm, deptno
from emp
where comm IS NULL; 

-- 39
-- ����1
SELECT empno, ename, job, sal, deptno
from emp
where sal >= 2800 AND job = 'MANAGER';

SELECT empno, ename, job, sal, deptno
from emp
where sal >= 2800 OR job = 'MANAGER';

-- 40
-- ����1
SELECT empno, ename, job, sal, deptno
from emp
where job IN('MANAGER', 'CLERK', 'ANALYST');

SELECT empno, ename, job, sal, deptno
from emp
where job NOT IN('MANAGER', 'CLERK', 'ANALYST');
-- 'MANAGER', 'CLERK', 'ANALYST'�� ������ �� ���

SELECT empno, ename, job, sal, deptno
from emp
where sal BETWEEN 1000 AND 3000;

SELECT empno, ename, job, sal, deptno
from emp
where sal NOT BETWEEN 1000 AND 3000;
-- sal���� 1000���� �۰� 3000���� ū �����͸� ���\

select empno, ename, job, sal, deptno
from emp
where ename LIKE 'A%';

select empno, ename, job, sal, deptno
from emp
where ename NOT LIKE 'A%';
-- ù���ڰ� 'A'�� �ƴ� �����͸� ���

select empno, ename, job, sal, comm
from emp
where comm IS NULL;

select empno, ename, job, sal, comm
from emp
where comm IS NOT NULL;
-- comm���� NULL�� �ƴ� �����͸� ���

select empno, ename, job, sal, comm
from emp
where (NVL(comm, 0)= 0);
-- NVL(comm, 0)�� comm���� NULL�̸� 0������ �ٲٽÿ�.

--43
-- ����1
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
ORDER BY hiredate desc; -- �ֱٿ� �Ի��� ��¥ ������ ����

SELECT empno, ename, job, sal, deptno
FROM emp
ORDER BY hiredate desc; -- select���� ���� �÷��� ������ ������� ��밡��

SELECT empno, ename, job, sal, hiredate, deptno
FROM emp
ORDER BY deptno, sal DESC;  -- deptno�÷� �������� ��������, sal�÷� �������� ��������
-- deptno �������� ASC�� ������

-- 46
SELECT empno, ename, job, sal, hiredate, deptno
FROM emp
order by 4,5 desc; -- 4�� select���� 4��° �÷�, 5�� 5��° �÷��� ��Ÿ����.

SELECT ename, sal, sal*12 ANN_SAL
FROM emp
order by ANN_SAL; -- �������ε� ������ �������� ��밡��

-- 47
-- ����5
select DISTINCT deptno, job
from emp
order by job;

select DISTINCT deptno, job
from emp
order by deptno;

select DISTINCT deptno, job
from emp
order by empno; -- select���� distinct�� ����ϸ� select���� �ִ� �÷��� ���

select DISTINCT job, sal+comm
from emp
order by 2; -- 2�� select���� 2��° �÷�

-- 55
-- ����1
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
-- SUBSTR(ename, 1, 1) ename�÷��� ���ڿ����� ù ��° ��ġ���� �����ؼ� 1����
-- ���ڿ��� ��´�.
ORDER BY ename;

-- ����4
SELECT empno, ename, LENGTH(ename), sal, LENGTH(sal)
from emp
where deptno = 20;
-- LENGTH(ename)�� ename�÷� ���ڿ��� ����

-- ����5
SELECT ename, 
    INSTR(ename, 'L') e_null
from emp
order by ename;

SELECT ename, 
    INSTR(ename, 'L') e_null,
    INSTR(ename, 'L', 1, 1) e_null, -- ename�� �ִ� ���ڿ����� 'L'���ڸ� ã�µ�
    -- 1�� ���ڿ��� ó������ �����Ͽ� 1�� �� ��° �����ϴ� search-string
    INSTR(ename, 'L', 1, 2) e_null2, -- ename�� �ִ� ���ڿ����� 'L'���ڸ� ã�µ�
    -- 1�� ���ڿ��� ó������ �����Ͽ� 2�� �� ��° �����ϴ� search-string
    INSTR(ename, 'L', 4, 1) e_null4,-- ename���� 'L'���ڸ� 4��° ��ġ���� �����Ͽ� 
    -- �˻��ϴ� 'L'�� ù��°�� �����ϴ� ���ڿ��� 4��°�� ��ġ�Ѵ�
    INSTR(ename, 'L', 4, 2) e_null42 -- ename���� 'L'���ڸ� 4��° ��ġ���� �����Ͽ� 
    -- �˻��ϴ� 'L'�� �ι�°�� �����ϴ� ���ڿ��� �������� �ʴ´�.
from emp
order by ename;

select parameter, value
from NLS_DATABASE_PARAMETERS
where parameter = 'NLS_CHARACTERSET';
-- AL32UTF8�� �ѱ� �ѱ��ڰ� 3����Ʈ�� �����Ǿ� �ִ�.

select 
    substrB('I am here with you', 5, 3) ���1,
    substr('�� ���� �־�', 5, 3) ���2,
    substrB('�� ���� �־�', 5, 3) ���3,
    -- �ѱ� 1���ڴ� 3����Ʈ�� ���� �Ǿ��ִ�. ���⼭�� 5�� '��'������ ��ġ�̴�.
    -- 3dms 'du'rk 3����Ʈ�̱� ������ ��°���� '��'�� �ȴ�
    substrB('�� ���� �־�', 5, 4) ���4,
    substrB('�� ���� �־�', 5, 5) ���5,
    substrB('�� ���� �־�', 5, 6) ���6 -- ����� '����'�� �Ǵµ� �ѱ� 2���ڰ� 6����Ʈ
    -- �̱� ����
from dual; -- dual�� ����Ŭ���� �����ϴ� ���� ���̺�

select ename, substr(ename, 1, 3), 
    -- ename�� ���ڿ����� ù ��° ��ġ���� 3���� ���ڿ��� ��ȯ
    substr(ename, 3),
    -- ename�� ���ڿ����� �� ��° ��ġ���� ������ ���ڿ��� ��ȯ
    substr(name, -3, 2)
    -- ename�� ���ڿ����� ������ ��ġ�� �������� �ؼ� 
    -- -3�� ������ �� ��° ���ڿ����� 2���� ���ڿ��� ��ȯ
from emp
where deptno = 10;

--59������
select ename, LPAD(ename, 15, '*'), sal, LPAD(sal, 10, '*') 
from emp
where deptno = 10;

select ename, RPAD(ename, 15, '*'), sal, RPAD(sal, 10, '*') 
from emp
where deptno = 10;
    
-- ����3
select ename, job, LTRIM(job, 'A'), sal, LTRIM(sal, 1)
from emp
where deptno = 20;

select ename, job, RTRIM(job, 'T'), sal, RTRIM(sal, 0)
from emp
where deptno = 20;

select 
    TRIM(LEADING 'A' FROM 'AABDCADD') ���1,  
    -- ���ڿ� 'AABDCADD'�� �Ǿտ� �ִ� 'A' ����
    TRIM('A' FROM 'AABDCADD') ���2, 
    -- ���ڿ� 'AABDCADD'�� �Ǿտ� �ִ� 'A'�� �� �ڿ� �ִ� 'A'�� ����
    TRIM(TRAILING 'D' FROM 'AABDCADD') ���3
    -- ���ڿ� 'AABDCADD'�� �ǵڿ� �ִ� 'D' ����
from dual;
    
-- REPLACE �Լ�
select ename, REPLACE(ename, 'SC', '*?') ������ 
-- ename�� �� �� SC�� ���ڿ��� ã�Ƽ� '*?'�� ����
from emp
where deptno = 20;

select ename, TRANSLATE(ename, 'SC', '*?') ������2 
-- S�� *��, C�� ?�� �ٲ��.
-- ename�� �ִ� �����Ϳ��� ���� 's' �Ǵ� 'c'�� �ִ� ���ڸ� 
from emp
where deptno = 20;

-- ����̸��� �ҹ��ڷ� �ٲٴ� ���� TRANSLATE()�Լ��� �̿��ؼ� �ۼ��Ͻÿ�
SELECT ename, TRANSLATE( ename, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') u_lower
from emp;

-- LOWER�Լ��� �̿��ؼ� �ۼ�
select ename, LOWER(ename) u_lower
from emp;

select 
    ROUND(4567.678) ���1,
    ROUND(4567.678, 0) ���2,
    ROUND(4567.678, 2) ���3,
    ROUND(4567.678, -2) ���4
FROM dual;

select 
    TRUNC(4567.678) ���1,
    TRUNC(4567.678, 0) ���2,
    TRUNC(4567.678, 2) ���3,
    TRUNC(4567.678, -2) ���4
FROM dual;

select POWER(2, 10) ���1, CEIL(3.7) ���2, FLOOR(3.7) ���3
FROM dual;

select sal, sal, mod(sal, 30)
from emp
where deptno = 10;

select sal, sal, sign(sal-2975)
from emp
where deptno = 20;

-- ����Ŭ�� ��¥ ����(����) ��ȸ
select value 
from NLS_SESSION_PARAMETERS
where parameter = 'NLS_DATE_FORMAT';

select sysdate
from dual;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
-- ��¥ ������ ������ ��
commit;