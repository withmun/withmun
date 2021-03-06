
/* Drop Tables */

DROP TABLE APPLY CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE APPLY
(
	ANO varchar2(4) NOT NULL UNIQUE,
	EMAIL varchar2(40) NOT NULL UNIQUE,
	PWD varchar2(20) NOT NULL,
	NAME varchar2(20),
	FIELD varchar2(20),
	JUMIN1 varchar2(6),
	JUMIN2 varchar2(7),
	ADDR varchar2(100),
	ZIPCODE varchar2(10),
	TEL varchar2(20),
	MOBILE varchar2(20),
	HIGH_NAME varchar2(20),
	HIGH_START date,
	HIGH_FINISH date,
	HIGH_JOLUP char(1),
	COL_NAME varchar2(20),
	COL_START date,
	COL_FINISH date,
	COL_MAJOR varchar2(40),
	COL_GRADE number,
	COL_JOLUP char(1),
	UNIV_NAME varchar2(30),
	UNIV_START date,
	UNIV_FINISH date,
	UNIV_MAJOR varchar2(40),
	UNIV_GRADE number,
	UNIV_JOLUP char(1),
	GRAD_NAME varchar2(30),
	GRAD_START date,
	GRAD_FINISH date,
	GRAD_MAJOR varchar2(40),
	GRAD_GRADE number,
	GRAD_JOLUP char(1),
	GUN_BYUL varchar2(10),
	GUN_BYUNG varchar2(10),
	GUN_GYE varchar2(10),
	GUN_START date,
	GUN_FINISH date,
	GUN_PIL char(1),
	GUN_MIPILWHY varchar2(20),
	LANG1_NAME varchar2(20),
	LANG1_SCORE number,
	LANG1_DATE date,
	LANG2_NAME varchar2(20),
	LANG2_SCORE number,
	LANG2_DATE date,
	LICENSE1_NAME varchar2(40),
	LICENSE1_DATE date,
	LICENSE1_ORG varchar2(20),
	LICENSE2_NAME varchar2(30),
	LICENSE2_DATE date,
	LICENSE2_ORG varchar2(20),
	ACTIVITY1_CONTENT varchar2(60),
	ACTIVITY1_START date,
	ACTIVITY1_FINISH date,
	ACTIVITY1_ORG varchar2(40),
	ACTIVITY2_CONTENT varchar2(60),
	ACTIVITY2_START date,
	ACTIVITY2_FINISH date,
	ACTIVITY2_ORG varchar2(40),
	FAMILY1_REL varchar2(10),
	FAMILY1_NAME varchar2(20),
	FAMILY1_BIRTH date,
	FAMILY1_ACADEMIC varchar2(10),
	FAMILY1_JOB varchar2(20),
	FAMILY1_COMPANY varchar2(30),
	FAMILY1_POSITION varchar2(20),
	FAMILY1_LIVEWITH char(1),
	FAMILY2_REL varchar2(10),
	FAMILY2_NAME varchar2(20),
	FAMILY2_BIRTH date,
	FAMILY2_ACADEMIC varchar2(10),
	FAMILY2_JOB varchar2(20),
	FAMILY2_COMPANY varchar2(20),
	FAMILY2_POSITION varchar2(10),
	FAMILY2_LIVEWITH char(1),
	FAMILY3_REL varchar2(10),
	FAMILY3_NAME varchar2(20),
	FAMILY3_BIRTH date,
	FAMILY3_ACADEMIC varchar2(10),
	FAMILY3_JOB varchar2(10),
	FAMILY3_COMPANY varchar2(20),
	FAMILY3_POSITION varchar2(10),
	FAMILY3_LIVEWITH char(1),
	FAMILY4_REL varchar2(10),
	FAMILY4_NAME varchar2(20),
	FAMILY4_BIRTH date,
	FAMILY4_ACADEMIC varchar2(10),
	FAMILY4_JOB varchar2(20),
	FAMILY4_COMPANY varchar2(20),
	FAMILY4_POSITION varchar2(10),
	FAMILY4_LIVEWITH char(1),
	HOBBY varchar2(20),
	SPECIAL varchar2(20),
	RELIGION varchar2(20),
	BOHUN char(1),
	SUNGJANG varchar2(4000),
	CHARACT varchar2(4000),
	MOTIVE varchar2(4000),
	FUTURE varchar2(4000),
	PHOTOC varchar2(100),
	PHOTOS varchar2(100),
	REVIEW char(1)
);



