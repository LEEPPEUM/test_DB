delete
from COMMONCODE;

insert into COMMONCODE 
(COMMONCODE_ID,NAME,ORDER_NUMBER,CONTENT,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'ORGANIZATION_TYPE','기관/협회/학원/조직 유형',1,'기관/협회/학원/조직 유형 적용','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'ORGANIZATION_TYPE_LECTURE','강사',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','ORGANIZATION_TYPE' from dual union all 
select 'ORGANIZATION_TYPE_ORGANIZATION','기관/협회',2,'조직 적용 ','SYSTEM_CODE_YN_YES','USE_YN_YES','ORGANIZATION_TYPE' from dual union all 
select 'ORGANIZATION_TYPE_ACADEMY','학원',2,'조직 적용 ','SYSTEM_CODE_YN_YES','USE_YN_YES','ORGANIZATION_TYPE' from dual union all 
select 'ORGANIZATION_POSITION','조직근무자 유형',1,'Using Yes or No','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'ORGANIZATION_POSITION_POSTION','역활',2,'역활 적용 ','SYSTEM_CODE_YN_YES','USE_YN_YES','ORGANIZATION_POSITION' from dual union all 
select 'ORGANIZATION_POSITION_MANAGER','대표 담당자',1,'대표 담당자 적용 ','SYSTEM_CODE_YN_YES','USE_YN_YES','ORGANIZATION_POSITION' from dual union all 
select 'ORGANIZATION_POSITION_LECTURE','정규직 강사',1,'상사 적용 ','SYSTEM_CODE_YN_YES','USE_YN_YES','ORGANIZATION_POSITION' from dual union all 
select 'USE_YN','Using Yes or No',1,'Using Yes or No','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'USE_YN_YES','Yes',1,'Using Yes','SYSTEM_CODE_YN_YES','USE_YN_YES','USE_YN' from dual union all 
select 'USE_YN_NO','No',2,'Using No','SYSTEM_CODE_YN_YES','USE_YN_YES','USE_YN' from dual union all 
select 'TEMPORARY_YN','Using Yes or No',1,'Using Yes or No','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'TEMPORARY_YN_YES','Yes',1,'Using Yes','SYSTEM_CODE_YN_YES','USE_YN_YES','TEMPORARY_YN' from dual union all 
select 'TEMPORARY_YN_NO','No',2,'Using No','SYSTEM_CODE_YN_YES','USE_YN_YES','TEMPORARY_YN' from dual union all 
select 'SYSTEM_CODE_YN','Sytem Yes or No',1,'Sytem Using Yes or No','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'SYSTEM_CODE_YN_YES','Yes',1,'Sytem Using Yes','SYSTEM_CODE_YN_YES','USE_YN_YES','SYSTEM_CODE_YN' from dual union all 
select 'SYSTEM_CODE_YN_NO','No',2,'Sytem Using No','SYSTEM_CODE_YN_YES','USE_YN_YES','SYSTEM_CODE_YN' from dual 
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,ORDER_NUMBER,CONTENT,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'QUESTION_TYPE','질문지 유형 ',1,'질문지 유형 ','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'QUESTION_TYPE_NOTICE','안내 ',1,'안내 ','SYSTEM_CODE_YN_YES','USE_YN_YES','QUESTION_TYPE' from dual union all 
select 'QUESTION_TYPE_SURVEY','설문 ',2,'설문지 ','SYSTEM_CODE_YN_YES','USE_YN_YES','QUESTION_TYPE' from dual union all 
select 'QUESTION_TYPE_PROJECT','프로젝트 ',4,'설문지 ','SYSTEM_CODE_YN_YES','USE_YN_YES','QUESTION_TYPE' from dual union all 
select 'QUESTION_TYPE_EXAMINATION','문답 ',3,'문답하기 ','SYSTEM_CODE_YN_YES','USE_YN_YES','QUESTION_TYPE' from dual 
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,ORDER_NUMBER,CONTENT,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'MESSAGE_KIND','메세지 유형 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'MESSAGE_KIND_EMAIL','이메일 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','MESSAGE_KIND' from dual union all 
select 'MESSAGE_KIND_SMS','SMS ',2,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','MESSAGE_KIND' from dual union all 
select 'MESSAGE_KIND_KAKAOTALK','카카오톡 ',3,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_NO','MESSAGE_KIND' from dual 
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,ORDER_NUMBER,CONTENT,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'ANSWER_TYPE','답변 유형 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'ANSWER_TYPE_WRITE','쓰기 방식 ',2,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','ANSWER_TYPE' from dual union all 
select 'ANSWER_TYPE_CHOICE','고르기 방식 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_NO','ANSWER_TYPE' from dual union all 
select 'ANSWER_TYPE_DIVIDE','질문간 나누기',2,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','ANSWER_TYPE' from dual 
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,ORDER_NUMBER,CONTENT,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'ANSWER_TYPE_CHOICE_TYPE','선택식 답변 문제 형성 유형 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'STANDARD_ANSWER_CHOICE_TYPE5','5 형식',5,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','ANSWER_TYPE_CHOICE_TYPE' from dual union all 
select 'STANDARD_ANSWER_CHOICE_TYPE2','2 형식',2,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_NO','ANSWER_TYPE_CHOICE_TYPE' from dual union all 
select 'STANDARD_ANSWER_CHOICE_WRITE','직접 작성 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_NO','ANSWER_TYPE_CHOICE_TYPE' from dual 
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,ORDER_NUMBER,CONTENT,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'LECTURE_ATTEND_TYPE','강의 참석자 유형(수강생, 강사 등) ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'LECTURE_ATTEND_TYPE_LISTENER','수강생',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','LECTURE_ATTEND_TYPE' from dual union all 
select 'LECTURE_ATTEND_TYPE_LECTURER','강사',2,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','LECTURE_ATTEND_TYPE' from dual union all 
select 'LECTURE_ATTEND_TYPE_MENAGER','관리자',3,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_NO','LECTURE_ATTEND_TYPE' from dual 
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,ORDER_NUMBER,CONTENT,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'LECTURE_ATTEND_KIND','지원,불합격,합격,수료 종류 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'LECTURE_ATTEND_KIND_APPLY','지원 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','LECTURE_ATTEND_KIND' from dual union all 
select 'LECTURE_ATTEND_KIND_WAITING','대기 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','LECTURE_ATTEND_KIND' from dual union all 
select 'LECTURE_ATTEND_KIND_PASS','합격 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','LECTURE_ATTEND_KIND' from dual union all 
select 'LECTURE_ATTEND_KIND_FAIL','불합격 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','LECTURE_ATTEND_KIND' from dual union all 
select 'LECTURE_ATTEND_KIND_CANSEL','자진탈퇴 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','LECTURE_ATTEND_KIND' from dual union all 
select 'LECTURE_ATTEND_KIND_COMPLETION','수료 ',2,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_NO','LECTURE_ATTEND_KIND' from dual 
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,ORDER_NUMBER,CONTENT,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'AFTER_LECTURE_STATUS_TYPE','강의 참석자 업무 유형(수강생, 강사 등) ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'AFTER_LECTURE_STATUS_TYPE_LISTENER','준비',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','AFTER_LECTURE_STATUS_TYPE' from dual union all 
select 'AFTER_LECTURE_STATUS_TYPE_LECTURE','취업 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','AFTER_LECTURE_STATUS_TYPE' from dual 
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,ORDER_NUMBER,CONTENT,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'MESSAGEGROUP_DEFAULT_CATEGORY','메세지 그룹 초기화 카테고리',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES',NULL from dual union all 
select 'MESSAGEGROUP_DEFAULT_CATEGORY_TOTAL','전체 ',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_YES','MESSAGEGROUP_DEFAULT_CATEGORY' from dual union all 
select 'MESSAGEGROUP_DEFAULT_CATEGORY_COURSE','개설 과정들',1,'시스템 입력  ','SYSTEM_CODE_YN_YES','USE_YN_NO','MESSAGEGROUP_DEFAULT_CATEGORY' from dual 
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,COUNT,ORDER_NUMBER,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'STANDARD_ANSWER_CHOICE_TYPE5_5','매우만족 ',5,1,'SYSTEM_CODE_YN_YES','USE_YN_YES','STANDARD_ANSWER_CHOICE_TYPE5' from dual union all 
select 'STANDARD_ANSWER_CHOICE_TYPE5_4','만족 ',4,2,'SYSTEM_CODE_YN_YES','USE_YN_YES','STANDARD_ANSWER_CHOICE_TYPE5' from dual union all 
select 'STANDARD_ANSWER_CHOICE_TYPE5_3','보통 ',3,3,'SYSTEM_CODE_YN_YES','USE_YN_YES','STANDARD_ANSWER_CHOICE_TYPE5' from dual union all 
select 'STANDARD_ANSWER_CHOICE_TYPE5_2','불만족 ',2,4,'SYSTEM_CODE_YN_YES','USE_YN_YES','STANDARD_ANSWER_CHOICE_TYPE5' from dual union all 
select 'STANDARD_ANSWER_CHOICE_TYPE5_1','매우불만족 ',1,5,'SYSTEM_CODE_YN_YES','USE_YN_YES','STANDARD_ANSWER_CHOICE_TYPE5' from dual
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,COUNT,ORDER_NUMBER,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'STANDARD_ANSWER_CHOICE_TYPE2_5','만족 ',5,1,'SYSTEM_CODE_YN_YES','USE_YN_YES','STANDARD_ANSWER_CHOICE_TYPE2' from dual union all 
select 'STANDARD_ANSWER_CHOICE_TYPE2_1','불만족 ',1,2,'SYSTEM_CODE_YN_YES','USE_YN_YES','STANDARD_ANSWER_CHOICE_TYPE2' from dual 
; 

insert into COMMONCODE 
(COMMONCODE_ID,NAME,COUNT,ORDER_NUMBER,SYSTEM_CODE_YN,USE_YN,PARENT_COMMONCODE_ID) 
select 'PICKUP_WAY','청강생 선출 방식', 0,1,'SYSTEM_CODE_YN_YES','USE_YN_YES',null from dual union all 
select 'PICKUP_WAY_FIRSTCOME','선착순', 0,1,'SYSTEM_CODE_YN_YES','USE_YN_YES','PICKUP_WAY' from dual union all 
select 'PICKUP_WAY_INTERVIEW','면접 후 승인', 0,1,'SYSTEM_CODE_YN_YES','USE_YN_YES','PICKUP_WAY' from dual 
; 

insert into ORGANIZATION 
(ORGANIZATION_SEQ,NAME,URI,TYPE,TEMPORARY_YN, PARENT_ORGANIZATION_SEQ) 
SELECT 'UUID-ORGANIZATION-YOJULAB','강의/강연 신','http://www.yojulab.com','ORGANIZATION_TYPE_ORGANIZATION', 'TEMPORARY_YN_NO', NULL FROM dual UNION ALL
SELECT 'UUID-ORGANIZATION-CIPI94','강사단','http://www.yojulab.com','ORGANIZATION_POSITION_MANAGER', 'TEMPORARY_YN_NO', 'UUID-ORGANIZATION-YOJULAB' FROM dual UNION ALL
SELECT 'UUID-ORGANIZATION-CIPI7S','재무부','http://www.yojulab.com','ORGANIZATION_POSITION_POSTION', 'TEMPORARY_YN_NO', 'UUID-ORGANIZATION-YOJULAB' FROM dual UNION ALL
SELECT 'UUID-ORGANIZATION-CIPI82','지원부','http://www.yojulab.com','ORGANIZATION_POSITION_POSTION', 'TEMPORARY_YN_NO', 'UUID-ORGANIZATION-YOJULAB' FROM dual UNION ALL
SELECT 'UUID-ORGANIZATION-CIPI8S','홍보부','http://www.yojulab.com','ORGANIZATION_POSITION_POSTION', 'TEMPORARY_YN_NO', 'UUID-ORGANIZATION-YOJULAB' FROM dual 
;


DELETE FROM MENU_AUTHORITY;
DELETE FROM MENU;

DELETE FROM AUTHORITY_MEMBER;
DELETE FROM AUTHORITY;

-- 권한 종류
insert into AUTHORITY 
(AUTHORITY_ID,NAME) 
select 'ROLE_SYSTEM_ADMIN','SYSTEM ADMIN' from dual union all
select 'ROLE_SYSTEM_MANAGER','SYSTEM MANAGER' from dual union all
select 'ROLE_BIZ_ADMIN','BIZ ADMIN' from dual union all
select 'ROLE_BIZ_MANAGER','BIZ MANAGER' from dual union all
select 'ROLE_BIZ_LECTURER','BIZ LECTURER' from dual union all
select 'ROLE_STUDENT','STUDENT' from dual ;


DELETE FROM AUTHORITY_MEMBER;

delete from MEMBER;

insert into MEMBER 
(MEMBER_SEQ,MEMBER_ID,CRYPT_PASSWORD,NAME,PHONE_NUMBER,TEMPORARY_YN,REGISTRY_DATE) 
select 'UUID-MEMBER-2111111','yojulab@tistory.com','yojulab','yojulab Admin','010-1234-45678','TEMPORARY_YN_NO',now() from dual ; 

-- password = "123456" with BCryptPasswordEncoder() 
update MEMBER
set CRYPT_PASSWORD = '$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.'
	, TEMPORARY_YN = 'TEMPORARY_YN_NO';

insert into ORGANIZATION_MEMBER 
(ORGANIZATION_MEMBER_SEQ,TYPE,ORGANIZATION_SEQ,MEMBER_SEQ) 
select 'UUID-ORGANIZATION_MEMBER-2111111','ORGANIZATION_POSITION_MANAGER','UUID-ORGANIZATION-YOJULAB','UUID-MEMBER-2111111' from dual; 

DELETE FROM AUTHORITY_MEMBER;

select * from AUTHORITY;
-- 권한 종류
insert into AUTHORITY_MEMBER 
(AUTHORITY_ID,MEMBER_SEQ) 
select 'ROLE_SYSTEM_MANAGER','UUID-MEMBER-2111111' from dual union all
select 'ROLE_BIZ_ADMIN','UUID-MEMBER-2111111' from dual union all
select 'ROLE_BIZ_MANAGER','UUID-MEMBER-2111111' from dual union all
select 'ROLE_BIZ_LECTURER','UUID-MEMBER-2111111' from dual union all
select 'ROLE_STUDENT','UUID-MEMBER-2111111' from dual ;

delete from MENU_AUTHORITY;
delete from MENU;

-- 메뉴
insert into MENU
(MENU_ID,NAME,USE_YN,PARENT_MENU_ID)
select '/security/insert','로그인폼','USE_YN',NULL from dual union all 
select '/member/list','/member/list','USE_YN',NULL from dual union all 
select '/member/edit','/member/list','USE_YN',NULL from dual union all 
select '/project/list','/project/list','USE_YN',NULL from dual union all 
select '/project/edit','/project/edit','USE_YN',NULL from dual union all 
select '/project/read','/project/read','USE_YN',NULL from dual union all 
select '/project/delete','/project/delete','USE_YN',NULL from dual union all 
select '/project/modify','/project/modify','USE_YN',NULL from dual ;

insert into MENU_AUTHORITY
(MENU_AUTHORITY_SEQ, MENU_ID, AUTHORITY_ID)
select 'MENU_AUTHORITY-01', '/member/list','ROLE_BIZ_ADMIN' from dual union all 
select 'MENU_AUTHORITY-02', '/member/edit','ROLE_BIZ_ADMIN' from dual union all 
select 'MENU_AUTHORITY-03', '/project/list','ROLE_BIZ_ADMIN' from dual union all 
select 'MENU_AUTHORITY-04', '/project/edit','ROLE_BIZ_ADMIN' from dual union all 
select 'MENU_AUTHORITY-05', '/project/read','ROLE_BIZ_ADMIN' from dual union all 
select 'MENU_AUTHORITY-06', '/project/modify','ROLE_BIZ_ADMIN' from dual union all 
select 'MENU_AUTHORITY-07', '/project/delete','ROLE_BIZ_ADMIN' from dual union all 
select 'MENU_AUTHORITY-08', '/project/list','ROLE_SYSTEM_MANAGER' from dual ;


insert into MESSAGEFORM
(MESSAGEFORM_ID, TYPE, KIND, TITLE, CONTENT, SYSTEM_CODE_YN)
select 'AUTHORITY_SIGNUP_TEMPORARY_MESSAGE', 'QUESTION_TYPE_NOTICE','MESSAGE_KIND_EMAIL', '{{NAME}}님. 회원가입 승인 메일', '{{NAME}}님. 완전한 가입 위해선 주소를 클릭하세요. http://localhost:8081/project_yojulab/security/update?MEMBER_SEQ={{MEMBER_SEQ}}', 'SYSTEM_CODE_YN_YES' from dual ;
