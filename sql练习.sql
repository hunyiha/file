
--�����û�
 CREATE USER �û��� IDENTIFIED BY ����;
--���û��޸�����
ALTER USER �û��� IDENTIFIED BY ����;
--�޸��Լ�������
PASSWORD �û���;


CREATE TABLE studenet(
   ID NUMBER,
   NAME VARCHAR2(64),
   sex CHAR(2),
   birthday DATE,
   score NUMBER(3,1),
   RESUME CLOB
);
--������
RENAME studenet TO student;
--����ֶ�
ALTER TABLE student ADD(class_id NUMBER);
--�޸���  ����
ALTER TABLE student MODIFY(NAME VARCHAR2(30));
--ɾ������
ALTER TABLE student DROP (ID,NAME);

ALTER TABLE student ADD(ID NUMBER,NAME VARCHAR2(30));
--�޸�����
ALTER TABLE student RENAME COLUMN RESUME TO intro;
--�鿴��ṹ
DESC student;

Create TABLE CLASS(ID NUMBER PRIMARY KEY,NAME VARCHAR2(30));
CREATE TABLE stus(ID NUMBER PRIMARY KEY,NAME VARCHAR2(36) NOT NULL,classid NUMBER REFERENCES CLASS(ID));

CREATE TABLE user4(ID NUMBER PRIMARY KEY,
sal NUMBER CHECK(sal>=1000 AND sal<=2000),
sex CHAR(2)  DEFAULT '��' CHECK(sex IN('��','Ů')));
DROP TABLE user4;

CREATE TABLE user4(ID NUMBER PRIMARY KEY,
sal NUMBER CHECK(sal>=1000 AND sal<=2000),
sex CHAR(2) DEFAULT '��' CHECK(sex IN('��','Ů')));

INSERT INTO user4 VALUES(1,1000,'��');

-----------------------------------
eg.�̵��ۻ�ϵͳ- -���մ���Լ��
--��Ʒ��
CREATE TABLE goods(
 goodsId NUMBER PRIMARY KEY,
 goodsName VARCHAR2(64) NOT NULL,
 price NUMBER CHECK(price>0),
 CATEGORY VARCHAR2(64),
 provider VARCHAR2(64)
);
--�ͻ���
CREATE TABLE customer(
 customerId NUMBER PRIMARY KEY,
 NAME VARCHAR2(30) NOT NULL,
 address VARCHAR2(64),
 email VARCHAR2(64) UNIQUE,
 sex CHAR(2) DEFAULT '��' CHECK(sex IN('��','Ů')),
 cardId VARCHAR2(18) UNIQUE
);
--�����
CREATE TABLE purchase(
 customerId NUMBER REFERENCES customer(customerId),
 goodsId NUMBER REFERENCES goods(goodsId),
 nums NUMBER CHECK(nums>=1 AND nums<=30),
 PRIMARY KEY(customerId,goodsId)
);

--�޸�Լ����
   1������ not null Լ��ʹ�� modify����Ϊ�ֶΣ��У�Ĭ�϶��ǿ���Ϊ�գ�
   2��������������Լ��ʹ�� add��
   

--ɾ��Լ��
ALTER TABLE purchase DROP PRIMARY KEY;
--�������Լ��
ALTER TABLE purchase ADD CONSTRAINT pk_purchase PRIMARY KEY(customerId,goodsId);
--��ӷǿ�Լ��
ALTER TABLE goods
