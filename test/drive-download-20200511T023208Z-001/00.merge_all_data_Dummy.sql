insert into MEMBER 
(MEMBER_SEQ,MEMBER_ID,CRYPT_PASSWORD,NAME,PHONE_NUMBER,TEMPORARY_YN,REGISTRY_DATE) 
select 'TEST-MEMBER-2211111','yojulab01@tistory.com','yojulab','yojulab Manager','010-1234-45678','TEMPORARY_YN_NO',now() from dual union all 
select 'TEST-MEMBER-1111111','system_admin@pulsehu.com','system_admin','system admin','010-1234-45678','TEMPORARY_YN_NO',now() from dual union all 
select 'TEST-MEMBER-1111112','guest@pulsehu.com','guest','system guest','010-1234-45678','TEMPORARY_YN_YES',now() from dual union all 
select 'TEST-MEMBER-1111113','member@pulsehu.com','member','system member','010-1234-45678','TEMPORARY_YN_YES',now() from dual union all 
select 'TEST-MEMBER-1111114','system@pulsehu.com','system','system admin','010-1234-45678','TEMPORARY_YN_YES',now() from dual ; 

-- password = "123456" with BCryptPasswordEncoder() 
update MEMBER
set CRYPT_PASSWORD = '$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.'
	, TEMPORARY_YN = 'TEMPORARY_YN_NO';

insert into ORGANIZATION 
(ORGANIZATION_SEQ,NAME,URI,TYPE,TEMPORARY_YN, PARENT_ORGANIZATION_SEQ) 
SELECT 'TEST-ORGANIZATION-YOJULAB01','테스트 업체','http://www.yojulab.com','ORGANIZATION_TYPE_ORGANIZATION', 'TEMPORARY_YN_NO', NULL FROM dual UNION ALL
SELECT 'TEST-ORGANIZATION-CIPI9401','강사단','http://www.yojulab.com','ORGANIZATION_POSITION_MANAGER', 'TEMPORARY_YN_NO', 'TEST-ORGANIZATION-YOJULAB01' FROM dual UNION ALL
SELECT 'TEST-ORGANIZATION-CIPI7S01','재무부','http://www.yojulab.com','ORGANIZATION_POSITION_POSTION', 'TEMPORARY_YN_NO', 'TEST-ORGANIZATION-YOJULAB01' FROM dual UNION ALL
SELECT 'TEST-ORGANIZATION-CIPI8201','지원부','http://www.yojulab.com','ORGANIZATION_POSITION_POSTION', 'TEMPORARY_YN_NO', 'TEST-ORGANIZATION-YOJULAB01' FROM dual UNION ALL
SELECT 'TEST-ORGANIZATION-CIPI8S01','홍보부','http://www.yojulab.com','ORGANIZATION_POSITION_POSTION', 'TEMPORARY_YN_NO', 'TEST-ORGANIZATION-YOJULAB01' FROM dual 
;

insert into ORGANIZATION_MEMBER 
(ORGANIZATION_MEMBER_SEQ,TYPE,ORGANIZATION_SEQ,MEMBER_SEQ) 
select 'TEST-ORGANIZATION_MEMBER-1111112','ORGANIZATION_POSITION_02','TEST-ORGANIZATION-CIPI9401','TEST-MEMBER-1111112' from dual union all 
select 'TEST-ORGANIZATION_MEMBER-1111113','ORGANIZATION_POSITION_MANAGER','TEST-ORGANIZATION-CIPI8S01','TEST-MEMBER-1111113' from dual union all 
select 'TEST-ORGANIZATION_MEMBER-1111114','ORGANIZATION_POSITION_02','TEST-ORGANIZATION-CIPI8S01','TEST-MEMBER-1111114' from dual ; 

select * from AUTHORITY;
-- 권한 종류
insert into AUTHORITY_MEMBER 
(AUTHORITY_ID,MEMBER_SEQ) 
select 'ROLE_BIZ_MANAGER','TEST-MEMBER-1111114' from dual union all
select 'ROLE_BIZ_LECTURER','TEST-MEMBER-1111114' from dual union all
select 'ROLE_BIZ_MANAGER','TEST-MEMBER-1111113' from dual union all
select 'ROLE_BIZ_LECTURER','TEST-MEMBER-1111113' from dual ;

insert into AUTHORITY_MEMBER 
(AUTHORITY_ID,MEMBER_SEQ)
select 'ROLE_STUDENT',MEMBER_SEQ
from MEMBER
where MEMBER_SEQ like 'TEST-MEMBER-1111%';

delete from COURSE_QUESTION;
delete from QUESTION where PARENT_QUESTION_SEQ is not null; 
delete from QUESTION; 
delete from ORGANIZATION_COURSE;
delete from COURSE where PARENT_COURSE_SEQ is not null;

-- first step
insert into COURSE 
(COURSE_SEQ, TITLE, CONTENT, START_DATE, END_DATE, START_TIME, END_TIME, PARENT_COURSE_SEQ ,ORGANIZATION_SEQ) 
select 'TEST_T_01','쇼핑몰 플랫폼 입점 무역인 판매 전략 소규모 강의 ','쇼핑몰 플랫폼 입점 무역인 대상 판매 .', DATE_FORMAT(date_add(now(),interval 20 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 60 day), '%Y-%m-%d'),'09:00','18:00',NULL,'UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_02','가이드 라인 통한 아이템 선정 ','판매 제품 선정 따른 어려움 해결 목적.',DATE_FORMAT(date_add(now(),interval 10 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 75 day), '%Y-%m-%d'),'09:00','15:00',NULL,'UUID-ORGANIZATION-YOJULAB' from dual union all 
select 'TEST_T_03','옆구리 찌르는 키워드 잡기 ','소비자 관심 유발하는 제목 만들기 목적.',DATE_FORMAT(date_add(now(),interval 10 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 80 day), '%Y-%m-%d'),'10:00','12:00',NULL,'TEST-ORGANIZATION-YOJULAB01' from dual union all 
select 'TEST_T_04','궁금증 연결 통한 구매 높이기 ','소비자 신뢰 높이기 위한 정보 제공 목적.',DATE_FORMAT(date_add(now(),interval -1 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 65 day), '%Y-%m-%d'),'10:00','16:00',NULL,'TEST-ORGANIZATION-YOJULAB01' from dual; 

insert into ORGANIZATION_COURSE 
(ORGANIZATION_COURSE_SEQ, RECRUIT_START_DATE, RECRUIT_END_DATE, COUNT ,TYPE, USE_YN , COURSE_SEQ) 
select 'TEST_T_01', DATE_FORMAT(date_add(now(),interval 0 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 15 day), '%Y-%m-%d'), 25,null,'USE_YN_YES','TEST_T_01' from dual union all
select 'TEST_T_02', DATE_FORMAT(date_add(now(),interval 0 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 8 day), '%Y-%m-%d'), 10,null,'USE_YN_YES' , 'TEST_T_02' from dual union all
select 'TEST_T_03', DATE_FORMAT(date_add(now(),interval 0 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 8 day), '%Y-%m-%d'), 30,null,'USE_YN_NO' , 'TEST_T_03' from dual union all
select 'TEST_T_04', DATE_FORMAT(date_add(now(),interval -20 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval -10 day), '%Y-%m-%d'), 15,null,'USE_YN_YES' , 'TEST_T_04' from dual;

-- second step
insert into COURSE 
(COURSE_SEQ, TITLE, CONTENT, START_DATE, END_DATE, START_TIME, END_TIME, PARENT_COURSE_SEQ ,ORGANIZATION_SEQ) 
select 'TEST_T_01_01','소규모 강의 ','대상 판매 .', DATE_FORMAT(date_add(now(),interval 20 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 25 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_02','판매 전략 소규모 강의 ','무역인 대상 판매 .', DATE_FORMAT(date_add(now(),interval 25 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 35 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_03','입점 무역인 판매 전략 소규모 강의 ','쇼핑몰 플랫폼 입점', DATE_FORMAT(date_add(now(),interval 36 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 45 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_04','플랫폼 입점 무역인 판매 전략 소규모 강의 ','쇼핑몰 대상 판매 .', DATE_FORMAT(date_add(now(),interval 46 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 55 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_05','쇼핑몰 플랫폼 입점 무역인 판매 전략 소규모 강의 ','쇼핑몰 플랫폼 입점 무역인 대상 판매 .', DATE_FORMAT(date_add(now(),interval 56 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 60 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01','UUID-ORGANIZATION-YOJULAB' from dual;  

-- third step
insert into COURSE 
(COURSE_SEQ, TITLE, CONTENT, START_DATE, END_DATE, START_TIME, END_TIME, PARENT_COURSE_SEQ ,ORGANIZATION_SEQ) 
select 'TEST_T_01_011','소규모','대상', DATE_FORMAT(date_add(now(),interval 20 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 22 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01_01','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_012','강의 ','판매 .', DATE_FORMAT(date_add(now(),interval 23 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 25 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01_01','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_022','판매 전략 소규모 강의 ','무역인 대상 판매 .', DATE_FORMAT(date_add(now(),interval 25 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 35 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01_02','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_033','입점 무역인 판매 ','쇼핑몰 플랫폼 입점', DATE_FORMAT(date_add(now(),interval 36 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 40 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01_03','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_034','소규모 강의 ','쇼핑몰 플랫폼 입점', DATE_FORMAT(date_add(now(),interval 41 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 45 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01_03','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_044','플랫폼 입점 무역인 판매 전략 소규모 강의 ','쇼핑몰 대상 판매 .', DATE_FORMAT(date_add(now(),interval 46 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 55 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01_04','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_055','쇼핑몰 플랫폼 입점','쇼핑몰 플랫폼 입점 무역인', DATE_FORMAT(date_add(now(),interval 56 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 59 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01_05','UUID-ORGANIZATION-YOJULAB' from dual union all  
select 'TEST_T_01_056','전략 소규모 강의 ','쇼핑몰 플랫폼 ', DATE_FORMAT(date_add(now(),interval 60 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 60 day), '%Y-%m-%d'),'09:00','18:00','TEST_T_01_05','UUID-ORGANIZATION-YOJULAB' from dual ;  

-- first step
insert into QUESTION 
(QUESTION_SEQ, TYPE, KIND, ORDER_NUMBER, TITLE, WEIGHT, PARENT_QUESTION_SEQ)
select 'TEST_QUESTION_T_04','QUESTION_TYPE_EXAMINATION', 'LECTURE_ATTEND_TYPE_LISTENER', 1, '01.주간 시험', 10, NULL from dual union all  
select 'TEST_QUESTION_T_03','QUESTION_TYPE_EXAMINATION', 'LECTURE_ATTEND_TYPE_LISTENER', 1, '02.주간 시험', 10, NULL from dual union all  
select 'TEST_QUESTION_T_02','QUESTION_TYPE_NOTICE', 'LECTURE_ATTEND_TYPE_LISTENER', 1, '오리엔테이션 안내 ', 0, NULL from dual union all  
select 'TEST_QUESTION_T_05','QUESTION_TYPE_SURVEY', 'LECTURE_ATTEND_TYPE_LISTENER', 1, '중간 설문 ', 0, NULL from dual union all  
select 'TEST_QUESTION_T_06','QUESTION_TYPE_PROJECT', 'LECTURE_ATTEND_TYPE_LISTENER', 1, '최종 프로젝트 안내 ', 10, NULL from dual union all  
select 'TEST_QUESTION_T_01','QUESTION_TYPE_SURVEY', 'LECTURE_ATTEND_TYPE_LISTENER', 1, '마무리 설문 ', 0, NULL from dual ;  
		
insert into COURSE_QUESTION 
(COURSE_QUESTION_SEQ, START_DATE,END_DATE, COURSE_SEQ, QUESTION_SEQ)
select 'TEST_COURSE_QUESTION_T_14', DATE_FORMAT(date_add(now(),interval 59 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 60 day), '%Y-%m-%d'), 'TEST_T_01_055' , 'TEST_QUESTION_T_04' from dual union all
select 'TEST_COURSE_QUESTION_T_13', DATE_FORMAT(date_add(now(),interval 45 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 50 day), '%Y-%m-%d'), 'TEST_T_01_03' , 'TEST_QUESTION_T_03' from dual union all
select 'TEST_COURSE_QUESTION_T_12', DATE_FORMAT(date_add(now(),interval -5 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval -5 day), '%Y-%m-%d'), 'TEST_T_01' , 'TEST_QUESTION_T_02' from dual union all
select 'TEST_COURSE_QUESTION_T_15', DATE_FORMAT(date_add(now(),interval 10 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 15 day), '%Y-%m-%d'), 'TEST_T_01' , 'TEST_QUESTION_T_05' from dual union all
select 'TEST_COURSE_QUESTION_T_16', DATE_FORMAT(date_add(now(),interval 15 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 60 day), '%Y-%m-%d'), 'TEST_T_01_055' , 'TEST_QUESTION_T_06' from dual union all
select 'TEST_COURSE_QUESTION_T_11', DATE_FORMAT(date_add(now(),interval 61 day), '%Y-%m-%d'),DATE_FORMAT(date_add(now(),interval 61 day), '%Y-%m-%d'), 'TEST_T_01' , 'TEST_QUESTION_T_01' from dual ;

-- second step
insert into QUESTION 
(QUESTION_SEQ, TYPE, KIND, ORDER_NUMBER, TITLE, WEIGHT, PARENT_QUESTION_SEQ,CONTENT)
select 'TEST_QUESTION_T_041','ANSWER_TYPE_CHOICE', 'STANDARD_ANSWER_CHOICE_TYPE5', 1, '언어가 아닌 것은 ?', 1, 'TEST_QUESTION_T_04', null from dual union all  
select 'TEST_QUESTION_T_042','ANSWER_TYPE_WRITE', null, 1, '기술하시오.', 3, 'TEST_QUESTION_T_04', '기술' from dual union all
select 'TEST_QUESTION_T_031','ANSWER_TYPE_CHOICE', 'STANDARD_ANSWER_CHOICE_TYPE5', 2, '프로그래밍 언어가 아닌 것은 ?', 1, 'TEST_QUESTION_T_03', null from dual union all  
select 'TEST_QUESTION_T_032','ANSWER_TYPE_WRITE', null, 1, '알고리즘 기술하시오.', 3, 'TEST_QUESTION_T_03', '알고리즘' from dual union all
select 'TEST_QUESTION_T_021','ANSWER_TYPE_WRITE', null, 1, '- 오리엔테이션 안내, 장소 : 알림.', 1, 'TEST_QUESTION_T_02', null from dual union all  
select 'TEST_QUESTION_T_056','ANSWER_TYPE_DIVIDE', null, 1, '<시설 관련>', 1, 'TEST_QUESTION_T_05', null from dual union all
select 'TEST_QUESTION_T_051','ANSWER_TYPE_CHOICE', 'STANDARD_ANSWER_CHOICE_TYPE2', 2, '시설 역량은 ?', 1, 'TEST_QUESTION_T_05', null from dual union all  
select 'TEST_QUESTION_T_052','ANSWER_TYPE_WRITE', null, 3, '기관에 하고 싶은 말은 !', 1, 'TEST_QUESTION_T_05', null from dual union all
select 'TEST_QUESTION_T_055','ANSWER_TYPE_DIVIDE', null, 4, '<강사 관련>', 1, 'TEST_QUESTION_T_05', null from dual union all
select 'TEST_QUESTION_T_053','ANSWER_TYPE_CHOICE', 'STANDARD_ANSWER_CHOICE_TYPE5', 5, '강사 역량은 ?', 1, 'TEST_QUESTION_T_05', null from dual union all  
select 'TEST_QUESTION_T_054','ANSWER_TYPE_WRITE', null, 6, '강사에 하고 싶은 말은 !', 1, 'TEST_QUESTION_T_05', null from dual union all
select 'TEST_QUESTION_T_060','ANSWER_TYPE_WRITE', null, 1, '- 프로젝트 안내, 장소 : 알림.', 1, 'TEST_QUESTION_T_06', null from dual union all  
select 'TEST_QUESTION_T_061','ANSWER_TYPE_WRITE', null, 1, '- 프로젝트 진행 요령', 1, 'TEST_QUESTION_T_06', null from dual union all  
select 'TEST_QUESTION_T_012','ANSWER_TYPE_WRITE', null, 2, '강사에 하고 싶은 말은 !', 1, 'TEST_QUESTION_T_01', null from dual;  

-- third step
insert into QUESTION 
(QUESTION_SEQ, TYPE, KIND, ORDER_NUMBER, TITLE, WEIGHT, PARENT_QUESTION_SEQ)
select 'TEST_QUESTION_T_0415', NULL, NULL, 5, 'node.js', 0, 'TEST_QUESTION_T_041' from dual union all  
select 'TEST_QUESTION_T_0414', NULL, NULL, 4, 'C++', 0, 'TEST_QUESTION_T_041' from dual union all  
select 'TEST_QUESTION_T_0413', NULL, NULL, 3, 'Dart', 0, 'TEST_QUESTION_T_041' from dual union all  
select 'TEST_QUESTION_T_0412', NULL, NULL, 2, 'Java', 0, 'TEST_QUESTION_T_041' from dual union all  
select 'TEST_QUESTION_T_0411', NULL, NULL, 1, 'Korea', 1, 'TEST_QUESTION_T_041' from dual union all  
select 'TEST_QUESTION_T_0315', NULL, NULL, 5, 'node.js', 0, 'TEST_QUESTION_T_031' from dual union all  
select 'TEST_QUESTION_T_0314', NULL, NULL, 4, 'English', 1, 'TEST_QUESTION_T_031' from dual union all  
select 'TEST_QUESTION_T_0313', NULL, NULL, 3, 'Dart', 0, 'TEST_QUESTION_T_031' from dual union all  
select 'TEST_QUESTION_T_0312', NULL, NULL, 2, 'Java', 0, 'TEST_QUESTION_T_031' from dual union all  
select 'TEST_QUESTION_T_0311', NULL, NULL, 1, 'Korea', 1, 'TEST_QUESTION_T_031' from dual union all  
select 'TEST_QUESTION_T_0511', NULL, NULL, 1, '만족', 3, 'TEST_QUESTION_T_051' from dual union all  
select 'TEST_QUESTION_T_0512', NULL, NULL, 2, '불만족', 1, 'TEST_QUESTION_T_051' from dual union all 
select 'TEST_QUESTION_T_0531', NULL, NULL, 1, '매우 불만족', 1, 'TEST_QUESTION_T_053' from dual union all 
select 'TEST_QUESTION_T_0532', NULL, NULL, 2, '불만족', 2, 'TEST_QUESTION_T_053' from dual union all  
select 'TEST_QUESTION_T_0533', NULL, NULL, 3, '중간', 3, 'TEST_QUESTION_T_053' from dual union all 
select 'TEST_QUESTION_T_0534', NULL, NULL, 4, '만족', 4, 'TEST_QUESTION_T_053' from dual union all  
select 'TEST_QUESTION_T_0535', NULL, NULL, 5, '매우 만족', 5, 'TEST_QUESTION_T_053' from dual union all  
select 'TEST_QUESTION_T_0111', NULL, NULL, 1, '만족', 3, 'TEST_QUESTION_T_011' from dual union all  
select 'TEST_QUESTION_T_0112', NULL, NULL, 2, '불만족', 1, 'TEST_QUESTION_T_011' from dual ; 

insert into yojulabdb.MULTIBOARDGROUP
(RELATEDTABLE_SEQ, MULTI_BOARDGROUP_ID, NAME, TYPE, CONTENT, ORDER_NUMBER, USE_YN)
select 'TEST_BOARDGROUP_ID_01', 'TEST_BOARDGROUP_ID_01', '테스트 멀티 보드 01', 'BOARD_TYPE_NOTICE', '테스트 멀티 보드 01', 1, 'USE_YN_YES' from dual union all 
select 'TEST_BOARDGROUP_ID_02', 'TEST_BOARDGROUP_ID_02', '테스트 멀티 보드 02', 'BOARD_TYPE_NOTICE', '테스트 멀티 보드 02', 2, 'USE_YN_YES' from dual ;

insert into yojulabdb.MULTIBOARD
(MULTIBOARD_SEQ, TITLE, CONTENT, START_DATE, END_DATE, CRYPT_PASSWORD, USE_YN, MEMBER_SEQ, REGISTRY_DATE, MODIFY_DATE, PARENT_MULTIBOARD_SEQ, MULTI_BOARDGROUP_ID)
select 'TEST_BOARD_ID_011', ' 테스트 011',  ' 테스트 011', NULL, NULL, NULL, 'USE_YN_YES', 'UUID-MEMBER-2111111', date_add(now(),interval -10 day),now() , NULL, 'TEST_BOARDGROUP_ID_01' from dual union all 
select 'TEST_BOARD_ID_012', ' 테스트 012',  ' 테스트 011', NULL, NULL, NULL, 'USE_YN_YES', 'TEST-MEMBER-1111111', date_add(now(),interval -4 day),now() , NULL, 'TEST_BOARDGROUP_ID_01' from dual union all 
select 'TEST_BOARD_ID_013', ' 테스트 013',  ' 테스트 011', NULL, NULL, NULL, 'USE_YN_YES', 'TEST-MEMBER-1111114', date_add(now(),interval -3 day),now() , NULL, 'TEST_BOARDGROUP_ID_01' from dual union all 
select 'TEST_BOARD_ID_014', ' 테스트 014',  ' 테스트 011', NULL, NULL, NULL, 'USE_YN_YES', 'TEST-MEMBER-1111113', date_add(now(),interval -2 day),now() , NULL, 'TEST_BOARDGROUP_ID_01' from dual union all 
select 'TEST_BOARD_ID_015', ' 테스트 015',  ' 테스트 011', NULL, NULL, NULL, 'USE_YN_YES', 'TEST-MEMBER-1111114', date_add(now(),interval -1 day),now() , NULL, 'TEST_BOARDGROUP_ID_01' from dual union all 
select 'TEST_BOARD_ID_016', ' 테스트 016',  ' 테스트 011', NULL, NULL, NULL, 'USE_YN_YES', 'TEST-MEMBER-1111114', date_add(now(),interval -9 day),now() , NULL, 'TEST_BOARDGROUP_ID_01' from dual union all 
select 'TEST_BOARD_ID_017', ' 테스트 017',  ' 테스트 011', NULL, NULL, NULL, 'USE_YN_YES', 'TEST-MEMBER-1111111', date_add(now(),interval 0 day),now() , NULL, 'TEST_BOARDGROUP_ID_01' from dual union all 
select 'TEST_BOARD_ID_021', ' 테스트 021',  ' 테스트 021', NULL, NULL, NULL, 'USE_YN_YES', 'TEST-MEMBER-2111111', date_add(now(),interval 0 day),now() , NULL, 'TEST_BOARDGROUP_ID_02' from dual ;
