-- SET SESSION FOREIGN_KEY_CHECKS=0;

-- /* Drop Indexes */

DROP INDEX ANSWER_INX01 ON ANSWER;
DROP INDEX ATTENDANCE_INX01 ON ATTENDANCE;
DROP INDEX ATTENDANCE_INX02 ON ATTENDANCE;
DROP INDEX COMMONCODE_INX01 ON COMMONCODE;
DROP INDEX COOPERATION_INX01 ON COOPERATION;
DROP INDEX COURSE_INX01 ON COURSE;
DROP INDEX COURSEBANK_INX01 ON COURSEBANK;
DROP INDEX COURSEBANK_QUESTIONBANK_IDX01 ON COURSEBANK_QUESTIONBANK;
DROP INDEX COURSEBANK_TEACHINGMATERIAL_INX01 ON COURSEBANK_TEACHINGMATERIAL;
DROP INDEX EVALUATION_INX01 ON EVALUATION;
DROP INDEX EVALUATION_INX02 ON EVALUATION;
DROP INDEX FACILITY_INX01 ON FACILITY;
DROP INDEX LECTURE_MEMBER_INX01 ON LECTURE_MEMBER;
DROP INDEX LECTURE_MEMBER_INX02 ON LECTURE_MEMBER;
DROP INDEX MENU_INX01 ON MENU;
DROP INDEX MENU_AUTHORITY_INX01 ON MENU_AUTHORITY;
DROP INDEX MENU_AUTHORITY_INX02 ON MENU_AUTHORITY;
DROP INDEX MULTIBOARD_INX01 ON MULTIBOARD;
DROP INDEX MULTIBOARD_INX02 ON MULTIBOARD;
DROP INDEX MULTIBOARDGROUP_INX01 ON MULTIBOARDGROUP;
DROP INDEX NATIONALCALENDAR_API ON NATIONALCALENDAR_API;
DROP INDEX NCSCODE_INX01 ON NCSCODE;
DROP INDEX OPENCOURSE_FACILITY_INX01 ON OPENCOURSE_FACILITY;
DROP INDEX ORGANIZATION_INX01 ON ORGANIZATION;
DROP INDEX ORGANIZATION_COURSBANK_INX01 ON ORGANIZATION_COURSEBANK;
DROP INDEX ORGANIZATION_COURSBANK_INX02 ON ORGANIZATION_COURSEBANK;
DROP INDEX ORGANIZATION_MEMBER_INX01 ON ORGANIZATION_MEMBER;
DROP INDEX PROJECT_MEMBER_INX01 ON PROJECT_MEMBER;
DROP INDEX PROJECT_MEMBER_INX02 ON PROJECT_MEMBER;
DROP INDEX QUESTION_INX01 ON QUESTION;
DROP INDEX QUESTIONBANK_INX01 ON QUESTIONBANK;
DROP INDEX QUESTION_STANDARDEVALUATION_INX01 ON QUESTION_STANDARDEVALUATION;
DROP INDEX RELATEDFILE_INX01 ON RELATEDATTACHFILE;
DROP INDEX RELATEDCONTACTMISC_INX01 ON RELATEDCONTACTMISC;
DROP INDEX RELATEDEXCEPTIONTIME_INX01 ON RELATEDEXCEPTEDDATE;
DROP INDEX RELATEDNCSCODE_INX01 ON RELATEDNCSCODE;
DROP INDEX SENDEDMESSAGE_MEMBER_INX01 ON SENDEDMESSAGE_MEMBER;



/* Drop Tables */

DROP TABLE IF EXISTS ANSWER;
DROP TABLE IF EXISTS RELATEDATTACHFILE;
DROP TABLE IF EXISTS ATTACHFILE;
DROP TABLE IF EXISTS ATTENDANCE;
DROP TABLE IF EXISTS AUTHORITY_MEMBER;
DROP TABLE IF EXISTS MENU_AUTHORITY;
DROP TABLE IF EXISTS AUTHORITY;
DROP TABLE IF EXISTS COMMONCODE;
DROP TABLE IF EXISTS RELATEDCONTACTMISC;
DROP TABLE IF EXISTS CONTACTMISC;
DROP TABLE IF EXISTS COOPERATION;
DROP TABLE IF EXISTS COURSEBANK_COURSE;
DROP TABLE IF EXISTS COURSE_QUESTION;
DROP TABLE IF EXISTS EVALUATION;
DROP TABLE IF EXISTS PROJECT_MEMBER;
DROP TABLE IF EXISTS LECTURE_MEMBER;
DROP TABLE IF EXISTS OPENCOURSE_FACILITY;
DROP TABLE IF EXISTS ORGANIZATION_COURSE;
DROP TABLE IF EXISTS REFERENCEMEMBER;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS COURSEBANK_QUESTIONBANK;
DROP TABLE IF EXISTS ORGANIZATION_COURSEBANK;
DROP TABLE IF EXISTS COURSEBANK;
DROP TABLE IF EXISTS COURSEBANK_TEACHINGMATERIAL;
DROP TABLE IF EXISTS RELATEDEXCEPTEDDATE;
DROP TABLE IF EXISTS EXCEPTEDDATE;
DROP TABLE IF EXISTS ORGANIZATION_FACILITY;
DROP TABLE IF EXISTS FACILITY;
DROP TABLE IF EXISTS MULTIBOARD_HASHTAG;
DROP TABLE IF EXISTS HASHTAG;
DROP TABLE IF EXISTS USEVOUCHER;
DROP TABLE IF EXISTS TAKEVOUCHER;
DROP TABLE IF EXISTS PUBLICVOUCHER;
DROP TABLE IF EXISTS KINDVOUCHERGROUP;
DROP TABLE IF EXISTS LOCATIONTRACE;
DROP TABLE IF EXISTS MESSAGERECEIVEWAY;
DROP TABLE IF EXISTS ORGANIZATION_MEMBER;
DROP TABLE IF EXISTS SENDEDMESSAGE_MEMBER;
DROP TABLE IF EXISTS MEMBER;
DROP TABLE IF EXISTS MENU;
DROP TABLE IF EXISTS MESSAGEFORM;
DROP TABLE IF EXISTS MULTIBOARD;
DROP TABLE IF EXISTS MULTIBOARDGROUP;
DROP TABLE IF EXISTS NATIONALCALENDAR_API;
DROP TABLE IF EXISTS RELATEDNCSCODE;
DROP TABLE IF EXISTS NCSCODE;
DROP TABLE IF EXISTS SENDEDMESSAGE;
DROP TABLE IF EXISTS ORGANIZATION;
DROP TABLE IF EXISTS PROJECT;
DROP TABLE IF EXISTS QUESTIONBANK_QUESTION;
DROP TABLE IF EXISTS QUESTION;
DROP TABLE IF EXISTS QUESTIONBANK;
DROP TABLE IF EXISTS QUESTION_STANDARDEVALUATION;
DROP TABLE IF EXISTS STANDARDEVALUATION;
DROP TABLE IF EXISTS TEACHINGMATERIAL;




-- /* Create Tables */

-- -- 대상자 답변
-- CREATE TABLE ANSWER
-- (
-- 	-- 대상자 답변 SEQ
-- 	ANSWER_SEQ varchar(40) NOT NULL COMMENT '대상자 답변 SEQ',
-- 	-- 해답 및 답변(객관식/짧은 주관식) or 응답
-- 	ANSWER varchar(2000) COMMENT '해답/답변/응답',
-- 	-- 갯수 or 점수 or 일수 or 인원수
-- 	COUNT decimal COMMENT '갯수 or 점수 or 일수 or 인원수',
-- 	-- 개설과목 질의 SEQ
-- 	QUESTION_SEQ varchar(40) NOT NULL COMMENT '개설과목 질의 SEQ',
-- 	-- 과목 강의 구성원 SEQ
-- 	LECTURE_MEMBER_SEQ varchar(40) NOT NULL COMMENT '과목 강의 구성원 SEQ',
-- 	PRIMARY KEY (ANSWER_SEQ)
-- ) COMMENT = '대상자 답변';


-- -- 파일 정보
-- CREATE TABLE ATTACHFILE
-- (
-- 	-- 파일을 N:N 관계로 연계 위해 추가
-- 	ATTACHFILE_SEQ varchar(40) NOT NULL COMMENT '첨부파일 일련번호',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 원본파일_명
-- 	ORGINAL_NAME varchar(200) NOT NULL COMMENT '원본 파일명',
-- 	-- 서비 저장 위한 변환된 파일명
-- 	PHYSICAL_NAME varchar(200) NOT NULL COMMENT '변환된 파일명',
-- 	-- 썸네일 첨부파일명
-- 	THUMBNAIL_NAME varchar(500) COMMENT '썸네일 첨부파일명',
-- 	-- 저장경로
-- 	PATH varchar(500) NOT NULL COMMENT '저장경로',
-- 	PRIMARY KEY (ATTACHFILE_SEQ)
-- ) COMMENT = '파일 정보';


-- -- 출석부
-- CREATE TABLE ATTENDANCE
-- (
-- 	-- 출석부 SEQ
-- 	ATTENDANCE_SEQ varchar(40) NOT NULL COMMENT '출석부 SEQ',
-- 	-- 등록일자
-- 	REGISTRY_DATE datetime NOT NULL COMMENT '등록일자',
-- 	-- 종류(메세지,규격,출결,답변대상자)
-- 	KIND varchar(40) NOT NULL COMMENT '종류(메세지,규격,출결,답변대상자)',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) NOT NULL COMMENT '사용/공개/대표/합격/승인/모집/해답 여부',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 과목 강의 구성원 SEQ
-- 	LECTURE_MEMBER_SEQ varchar(40) NOT NULL COMMENT '과목 강의 구성원 SEQ',
-- 	-- 개설 과정/과목 SEQ
-- 	COURSE_SEQ varchar(40) NOT NULL COMMENT '개설 과정/과목 SEQ',
-- 	PRIMARY KEY (ATTENDANCE_SEQ)
-- ) COMMENT = '출석부';


-- -- 권한 종류
-- CREATE TABLE AUTHORITY
-- (
-- 	-- 권한 종류 ID
-- 	AUTHORITY_ID varchar(40) NOT NULL COMMENT '권한 종류 ID',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	PRIMARY KEY (AUTHORITY_ID)
-- ) COMMENT = '권한 종류';


-- -- 회원별 권한
-- CREATE TABLE AUTHORITY_MEMBER
-- (
-- 	-- 회원 SEQ
-- 	MEMBER_SEQ varchar(40) NOT NULL COMMENT '회원 SEQ',
-- 	-- 권한 종류 ID
-- 	AUTHORITY_ID varchar(40) NOT NULL COMMENT '권한 종류 ID',
-- 	UNIQUE (MEMBER_SEQ, AUTHORITY_ID)
-- ) COMMENT = '회원별 권한';


-- -- 공통코드
-- CREATE TABLE COMMONCODE
-- (
-- 	-- 공통코드_ID (사용자 입력 가능)
-- 	COMMONCODE_ID varchar(40) NOT NULL COMMENT '공통코드_ID',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 갯수 or 점수 or 일수 or 인원수
-- 	COUNT decimal COMMENT '갯수 or 점수 or 일수 or 인원수',
-- 	-- 삭제불가(시스템 코드 or 카테고리)
-- 	SYSTEM_CODE_YN varchar(40) DEFAULT 'N' NOT NULL COMMENT '시스템 코드 여부',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal COMMENT '정렬순서',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) DEFAULT 'Y' NOT NULL COMMENT '사용/공개/대표/합격/승인/모집/해답 여부',
-- 	-- 상위 코드 ID
-- 	PARENT_COMMONCODE_ID varchar(40) COMMENT '상위 코드 ID',
-- 	PRIMARY KEY (COMMONCODE_ID)
-- ) COMMENT = '공통코드';


-- -- 각종 접근 정보
-- CREATE TABLE CONTACTMISC
-- (
-- 	-- 각종 접근 정보 SEQ
-- 	CONTACTMISC_SEQ varchar(40) NOT NULL COMMENT '각종 접근 정보 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 각종 정보
-- 	INFORMATION varchar(2000) NOT NULL COMMENT '정보',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) DEFAULT 'Y' NOT NULL COMMENT '사용/공개/대표/합격/승인/모집/해답 여부',
-- 	PRIMARY KEY (CONTACTMISC_SEQ)
-- ) COMMENT = '각종 접근 정보';


-- -- 기관간 협력
-- CREATE TABLE COOPERATION
-- (
-- 	-- 기관간 협력 SEQ
-- 	COOPERATION_SEQ varchar(40) NOT NULL COMMENT '기관간 협력 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 금액/부담금 
-- 	PRICE decimal COMMENT '금액/부담금',
-- 	-- 기관/조직 일련번호
-- 	ORGANIZATION_SEQ varchar(40) NOT NULL COMMENT '기관/조직 일련번호',
-- 	-- 과목 강의 구성원 SEQ
-- 	LECTURE_MEMBER_SEQ varchar(40) NOT NULL COMMENT '과목 강의 구성원 SEQ',
-- 	PRIMARY KEY (COOPERATION_SEQ)
-- ) COMMENT = '기관간 협력';


-- -- 개설 과정/과목
-- CREATE TABLE COURSE
-- (
-- 	-- 개설 과정/과목 SEQ
-- 	COURSE_SEQ varchar(40) NOT NULL COMMENT '개설 과정/과목 SEQ',
-- 	-- 제목
-- 	TITLE varchar(4000) NOT NULL COMMENT '제목',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 시작일시 (공지 등) or 일단위 의미
-- 	START_DATE varchar(12) NOT NULL COMMENT '시작일시',
-- 	-- 종료일시 (공지 등)
-- 	END_DATE varchar(12) NOT NULL COMMENT '종료일시',
-- 	-- 시작 시각
-- 	START_TIME varchar(12) COMMENT '시작 시각',
-- 	-- 종료 시각
-- 	END_TIME varchar(12) COMMENT '종료 시각',
-- 	-- 상위 과정/과목 SEQ
-- 	PARENT_COURSE_SEQ varchar(40) COMMENT '상위 과정/과목 SEQ',
-- 	-- 기관/조직 일련번호
-- 	ORGANIZATION_SEQ varchar(40) NOT NULL COMMENT '기관/조직 일련번호',
-- 	PRIMARY KEY (COURSE_SEQ)
-- ) COMMENT = '개설 과정/과목';


-- -- 과정/과목 은행
-- CREATE TABLE COURSEBANK
-- (
-- 	-- 과정/과목 은행 SEQ
-- 	COURSEBANK_SEQ varchar(40) NOT NULL COMMENT '과정/과목 은행 SEQ',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal NOT NULL COMMENT '정렬순서',
-- 	-- 제목
-- 	TITLE varchar(4000) NOT NULL COMMENT '제목',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 갯수 or 점수 or 일수 or 인원수
-- 	COUNT decimal NOT NULL COMMENT '갯수 or 점수 or 일수 or 인원수',
-- 	-- 시작 시각
-- 	START_TIME varchar(12) NOT NULL COMMENT '시작 시각',
-- 	-- 종료 시각
-- 	END_TIME varchar(12) COMMENT '종료 시각',
-- 	-- 등록일자
-- 	REGISTRY_DATE datetime NOT NULL COMMENT '등록일자',
-- 	-- 상위 과정/과목 은행 SEQ
-- 	PARENT_COURSEBANK_SEQ varchar(40) COMMENT '상위 과정/과목 은행 SEQ',
-- 	-- 기관/조직 일련번호
-- 	ORGANIZATION_SEQ varchar(40) NOT NULL COMMENT '기관/조직 일련번호',
-- 	PRIMARY KEY (COURSEBANK_SEQ)
-- ) COMMENT = '과정/과목 은행';


-- -- 과정 은행 사용 내역
-- CREATE TABLE COURSEBANK_COURSE
-- (
-- 	-- 과정/과목 은행 SEQ
-- 	COURSEBANK_SEQ varchar(40) NOT NULL COMMENT '과정/과목 은행 SEQ',
-- 	-- 개설 과정/과목 SEQ
-- 	COURSE_SEQ varchar(40) NOT NULL COMMENT '개설 과정/과목 SEQ'
-- ) COMMENT = '과정 은행 사용 내역';


-- -- 과정/과목 은행 질의
-- CREATE TABLE COURSEBANK_QUESTIONBANK
-- (
-- 	-- 과정/과목 은행 질의문 SEQ
-- 	COURSEBANK_QUESTIONBANK_SEQ varchar(40) NOT NULL COMMENT '과정/과목 은행 질의문 SEQ',
-- 	-- 종류(메세지,규격,출결,답변대상자)
-- 	KIND varchar(40) NOT NULL COMMENT '종류(메세지,규격,출결,답변대상자)',
-- 	-- 갯수 or 점수 or 일수 or 인원수
-- 	COUNT decimal NOT NULL COMMENT '갯수 or 점수 or 일수 or 인원수',
-- 	-- 과정/과목 은행 SEQ
-- 	COURSEBANK_SEQ varchar(40) NOT NULL COMMENT '과정/과목 은행 SEQ',
-- 	-- 각종 질의 은행 SEQ
-- 	QUESTIONBANK_SEQ varchar(40) NOT NULL COMMENT '각종 질의 은행 SEQ',
-- 	PRIMARY KEY (COURSEBANK_QUESTIONBANK_SEQ)
-- ) COMMENT = '과정/과목 은행 질의';


-- -- 과정 및 과목 은행별 사용교재
-- CREATE TABLE COURSEBANK_TEACHINGMATERIAL
-- (
-- 	-- 연관된 테이블 SEQ
-- 	RELATEDTABLE_SEQ varchar(40) NOT NULL COMMENT '연관된 테이블 SEQ',
-- 	-- 사용 교자재 SEQ
-- 	TEACHINGMATERIAL_SEQ varchar(40) NOT NULL COMMENT '사용 교자재 SEQ'
-- ) COMMENT = '과정 및 과목 은행별 사용교재';


-- -- 개설 과정/과목 질의
-- CREATE TABLE COURSE_QUESTION
-- (
-- 	-- 개설 과정/과목 질의 SEQ
-- 	COURSE_QUESTION_SEQ varchar(40) NOT NULL COMMENT '개설 과정/과목 질의 SEQ',
-- 	-- 시작일시 (공지 등) or 일단위 의미
-- 	START_DATE varchar(12) NOT NULL COMMENT '시작일시',
-- 	-- 종료일시 (공지 등)
-- 	END_DATE varchar(12) COMMENT '종료일시',
-- 	-- 개설 과정/과목 SEQ
-- 	COURSE_SEQ varchar(40) NOT NULL COMMENT '개설 과정/과목 SEQ',
-- 	-- 개설과목 질의 SEQ
-- 	QUESTION_SEQ varchar(40) NOT NULL COMMENT '개설과목 질의 SEQ',
-- 	PRIMARY KEY (COURSE_QUESTION_SEQ)
-- ) COMMENT = '개설 과정/과목 질의';


-- -- 질의 평가 종합
-- CREATE TABLE EVALUATION
-- (
-- 	-- 질의 평가 종합 SEQ
-- 	EVALUATION_SEQ varchar(40) NOT NULL COMMENT '질의 평가 종합 SEQ',
-- 	-- 갯수 or 점수 or 일수 or 인원수
-- 	COUNT decimal COMMENT '갯수 or 점수 or 일수 or 인원수',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 과목 강의 구성원 SEQ
-- 	LECTURE_MEMBER_SEQ varchar(40) NOT NULL COMMENT '과목 강의 구성원 SEQ',
-- 	-- 개설과목 질의 SEQ
-- 	QUESTION_SEQ varchar(40) NOT NULL COMMENT '개설과목 질의 SEQ',
-- 	PRIMARY KEY (EVALUATION_SEQ)
-- ) COMMENT = '질의 평가 종합';


-- -- 예외 일시(식사 등)
-- CREATE TABLE EXCEPTEDDATE
-- (
-- 	-- 예외 일시 SEQ
-- 	EXCEPTEDDATE_SEQ varchar(40) NOT NULL COMMENT '예외 일시 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 종류(메세지,규격,출결,답변대상자)
-- 	KIND varchar(40) COMMENT '종류(메세지,규격,출결,답변대상자)',
-- 	-- 시작일시 (공지 등) or 일단위 의미
-- 	START_DATE varchar(12) NOT NULL COMMENT '시작일시',
-- 	-- 종료일시 (공지 등)
-- 	END_DATE varchar(12) COMMENT '종료일시',
-- 	PRIMARY KEY (EXCEPTEDDATE_SEQ)
-- ) COMMENT = '예외 일시(식사 등)';


-- -- 각종 시설
-- CREATE TABLE FACILITY
-- (
-- 	-- 각종 시설 SEQ
-- 	FACILITY_SEQ varchar(40) NOT NULL COMMENT '각종 시설 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 크기
-- 	SIZE decimal COMMENT '크기',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal COMMENT '정렬순서',
-- 	-- 경도
-- 	LONGITUDE varchar(50) COMMENT '경도',
-- 	-- 위도
-- 	LATITUDE varchar(50) COMMENT '위도',
-- 	-- 상위 각종 시설 SEQ
-- 	PARENT_FACILITY_SEQ varchar(40) COMMENT '상위 각종 시설 SEQ',
-- 	PRIMARY KEY (FACILITY_SEQ)
-- ) COMMENT = '각종 시설';


-- -- 해쉬태그
-- CREATE TABLE HASHTAG
-- (
-- 	-- 해쉬테그 SEQ
-- 	HASHTAG_SEQ varchar(40) NOT NULL COMMENT '해쉬테그 SEQ',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	PRIMARY KEY (HASHTAG_SEQ)
-- ) COMMENT = '해쉬태그';


-- -- 바우처 종류 그룹
-- CREATE TABLE KINDVOUCHERGROUP
-- (
-- 	-- 바우처 그룹 SEQ
-- 	KINDVOUCHERGROUP_SEQ varchar(40) NOT NULL COMMENT '바우처 그룹 SEQ',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 금액/부담금 
-- 	PRICE decimal COMMENT '금액/부담금',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal COMMENT '정렬순서',
-- 	PRIMARY KEY (KINDVOUCHERGROUP_SEQ)
-- ) COMMENT = '바우처 종류 그룹';


-- -- 강의 구성원
-- CREATE TABLE LECTURE_MEMBER
-- (
-- 	-- 과목 강의 구성원 SEQ
-- 	LECTURE_MEMBER_SEQ varchar(40) NOT NULL COMMENT '과목 강의 구성원 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 종류(메세지,규격,출결,답변대상자)
-- 	KIND varchar(40) COMMENT '종류(메세지,규격,출결,답변대상자)',
-- 	-- 상태/에러상태
-- 	STATUS varchar(40) COMMENT '상태/에러상태',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) NOT NULL COMMENT '사용/공개/대표/합격/승인/모집/해답 여부',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 회원 SEQ
-- 	MEMBER_SEQ varchar(40) NOT NULL COMMENT '회원 SEQ',
-- 	-- 개설 과정/과목 SEQ
-- 	COURSE_SEQ varchar(40) NOT NULL COMMENT '개설 과정/과목 SEQ',
-- 	PRIMARY KEY (LECTURE_MEMBER_SEQ)
-- ) COMMENT = '강의 구성원';


-- -- 연결 위치 정보
-- CREATE TABLE LOCATIONTRACE
-- (
-- 	-- 연결 위치 정보 SEQ
-- 	LOCATIONTRACE_SEQ varchar(40) NOT NULL COMMENT '연결 위치 정보 SEQ',
-- 	-- 위도
-- 	LATITUDE varchar(50) NOT NULL COMMENT '위도',
-- 	-- 경도
-- 	LONGITUDE varchar(50) NOT NULL COMMENT '경도',
-- 	-- 등록일자
-- 	REGISTRY_DATE datetime NOT NULL COMMENT '등록일자',
-- 	-- 회원 SEQ
-- 	MEMBER_SEQ varchar(40) NOT NULL COMMENT '회원 SEQ',
-- 	PRIMARY KEY (LOCATIONTRACE_SEQ)
-- ) COMMENT = '연결 위치 정보';


-- -- 회원정보
-- CREATE TABLE MEMBER
-- (
-- 	-- 회원 SEQ
-- 	MEMBER_SEQ varchar(40) NOT NULL COMMENT '회원 SEQ',
-- 	-- 회원_ID
-- 	MEMBER_ID varchar(50) NOT NULL COMMENT '회원 ID',
-- 	-- 암호화된 암호
-- 	CRYPT_PASSWORD varchar(100) NOT NULL COMMENT '암호화된 암호',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 휴대폰/전화번호
-- 	PHONE_NUMBER varchar(20) COMMENT '휴대폰/전화번호',
-- 	-- 등록일자
-- 	REGISTRY_DATE datetime NOT NULL COMMENT '등록일자',
-- 	-- 임시저장여부
-- 	TEMPORARY_YN varchar(40) NOT NULL COMMENT '임시저장여부',
-- 	PRIMARY KEY (MEMBER_SEQ),
-- 	UNIQUE (MEMBER_ID)
-- ) COMMENT = '회원정보';


-- -- 메뉴 마스터 정보
-- CREATE TABLE MENU
-- (
-- 	-- 메뉴 코드 FULL URI
-- 	MENU_ID varchar(100) NOT NULL COMMENT '메뉴 코드 ID',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal COMMENT '정렬순서',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) DEFAULT 'Y' COMMENT '사용/공개/대표/합격/승인/모집/해답 여부',
-- 	-- 메뉴 코드 FULL URI
-- 	PARENT_MENU_ID varchar(100) COMMENT '상위 메뉴 코드 ID',
-- 	PRIMARY KEY (MENU_ID)
-- ) COMMENT = '메뉴 마스터 정보';


-- -- 메뉴 따른 권한
-- CREATE TABLE MENU_AUTHORITY
-- (
-- 	-- 메뉴 따른 권한 SEQ
-- 	MENU_AUTHORITY_SEQ varchar(40) NOT NULL COMMENT '메뉴 따른 권한 SEQ',
-- 	-- 권한 종류 ID
-- 	AUTHORITY_ID varchar(40) NOT NULL COMMENT '권한 종류 ID',
-- 	-- 메뉴 코드 FULL URI
-- 	MENU_ID varchar(100) NOT NULL COMMENT '메뉴 코드 ID',
-- 	PRIMARY KEY (MENU_AUTHORITY_SEQ)
-- ) COMMENT = '메뉴 따른 권한';


-- -- 메세지 형식
-- CREATE TABLE MESSAGEFORM
-- (
-- 	-- 메세지 형식 ID
-- 	MESSAGEFORM_ID varchar(40) NOT NULL COMMENT '메세지 형식 ID',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 종류(메세지,규격,출결,답변대상자)
-- 	KIND varchar(40) NOT NULL COMMENT '종류(메세지,규격,출결,답변대상자)',
-- 	-- 제목
-- 	TITLE varchar(4000) COMMENT '제목',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) NOT NULL COMMENT '내용/댓글/설명',
-- 	-- 삭제불가(시스템 코드 or 카테고리)
-- 	SYSTEM_CODE_YN varchar(40) COMMENT '시스템 코드 여부',
-- 	CONSTRAINT PK_MULTI_BOARD PRIMARY KEY (MESSAGEFORM_ID)
-- ) COMMENT = '메세지 형식';


-- -- 메세지 받는 허용 방법
-- CREATE TABLE MESSAGERECEIVEWAY
-- (
-- 	-- 메세지 받는 허용 방법 SEQ
-- 	MESSAGERECEIVEWAY_SEQ varchar(40) NOT NULL COMMENT '메세지 받는 허용 방법 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 등록일자
-- 	REGISTRY_DATE datetime NOT NULL COMMENT '등록일자',
-- 	-- 회원 SEQ
-- 	MEMBER_SEQ varchar(40) NOT NULL COMMENT '회원 SEQ',
-- 	PRIMARY KEY (MESSAGERECEIVEWAY_SEQ)
-- ) COMMENT = '메세지 받는 허용 방법';


-- -- 멀티게시판
-- CREATE TABLE MULTIBOARD
-- (
-- 	-- 게시물 일련번호
-- 	MULTIBOARD_SEQ varchar(40) NOT NULL COMMENT '게시물 일련번호',
-- 	-- 제목
-- 	TITLE varchar(4000) COMMENT '제목',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) NOT NULL COMMENT '내용/댓글/설명',
-- 	-- 시작일시 (공지 등) or 일단위 의미
-- 	START_DATE varchar(12) COMMENT '시작일시',
-- 	-- 종료일시 (공지 등)
-- 	END_DATE varchar(12) COMMENT '종료일시',
-- 	-- 암호화된 암호
-- 	CRYPT_PASSWORD varchar(100) COMMENT '암호화된 암호',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) NOT NULL COMMENT '사용/공개/대표/합격/승인/모집/해답 여부',
-- 	-- 회원 SEQ
-- 	MEMBER_SEQ varchar(40) COMMENT '회원 SEQ',
-- 	-- 등록일자
-- 	REGISTRY_DATE datetime NOT NULL COMMENT '등록일자',
-- 	-- 수정일자
-- 	MODIFY_DATE datetime NOT NULL COMMENT '수정일자',
-- 	-- 상위 게시물 일련번호
-- 	PARENT_MULTIBOARD_SEQ varchar(40) COMMENT '상위 게시물 일련번호',
-- 	-- 멀티 게시판 그룹 ID
-- 	MULTI_BOARDGROUP_ID varchar(40) NOT NULL COMMENT '멀티 게시판 그룹 ID',
-- 	CONSTRAINT PK_MULTI_BOARD PRIMARY KEY (MULTIBOARD_SEQ)
-- ) COMMENT = '멀티게시판';


-- -- 멀티게시판그룹
-- CREATE TABLE MULTIBOARDGROUP
-- (
-- 	-- 연관된 테이블 SEQ
-- 	RELATEDTABLE_SEQ varchar(40) NOT NULL COMMENT '연관된 테이블 SEQ',
-- 	-- 멀티 게시판 그룹 ID
-- 	MULTI_BOARDGROUP_ID varchar(40) NOT NULL COMMENT '멀티 게시판 그룹 ID',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal COMMENT '정렬순서',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) NOT NULL COMMENT '사용/공개/대표/합격/승인/모집/해답 여부',
-- 	PRIMARY KEY (MULTI_BOARDGROUP_ID),
-- 	UNIQUE (RELATEDTABLE_SEQ)
-- ) COMMENT = '멀티게시판그룹';


-- -- 게시판 검색 해쉬태그
-- CREATE TABLE MULTIBOARD_HASHTAG
-- (
-- 	-- 게시물 일련번호
-- 	MULTIBOARD_SEQ varchar(40) NOT NULL COMMENT '게시물 일련번호',
-- 	-- 해쉬테그 SEQ
-- 	HASHTAG_SEQ varchar(40) NOT NULL COMMENT '해쉬테그 SEQ'
-- ) COMMENT = '게시판 검색 해쉬태그';


-- -- 국가달력(API)
-- CREATE TABLE NATIONALCALENDAR_API
-- (
-- 	-- 종류(메세지,규격,출결,답변대상자)
-- 	KIND varchar(40) NOT NULL COMMENT '종류(메세지,규격,출결,답변대상자)',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 시작일시 (공지 등) or 일단위 의미
-- 	START_DATE varchar(12) NOT NULL COMMENT '시작일시',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) NOT NULL COMMENT '사용/공개/대표/합격/승인/모집/해답 여부'
-- ) COMMENT = '국가달력(API)';


-- -- NCS 코드
-- CREATE TABLE NCSCODE
-- (
-- 	-- NCS코드 SEQ
-- 	NCSCODE_SEQ varchar(40) NOT NULL COMMENT 'NCS코드 SEQ',
-- 	-- 공통코드_ID (사용자 입력 가능)
-- 	COMMONCODE_ID varchar(40) NOT NULL COMMENT '공통코드_ID',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal COMMENT '정렬순서',
-- 	-- 상위 NCS코드 SEQ
-- 	PARENT_NCSCODE_SEQ varchar(40) COMMENT '상위 NCS코드 SEQ',
-- 	PRIMARY KEY (NCSCODE_SEQ)
-- ) COMMENT = 'NCS 코드';


-- -- 개설강좌 강의실
-- CREATE TABLE OPENCOURSE_FACILITY
-- (
-- 	-- 개설강좌 강의실 SEQ
-- 	OPENCOURSE_FACILITY_SEQ varchar(40) NOT NULL COMMENT '개설강좌 강의실 SEQ',
-- 	-- 각종 시설 SEQ
-- 	FACILITY_SEQ varchar(40) NOT NULL COMMENT '각종 시설 SEQ',
-- 	-- 개설 과정/과목 SEQ
-- 	COURSE_SEQ varchar(40) NOT NULL COMMENT '개설 과정/과목 SEQ',
-- 	PRIMARY KEY (OPENCOURSE_FACILITY_SEQ)
-- ) COMMENT = '개설강좌 강의실';


-- -- 기관/그룹/조직/부서 구조도
-- CREATE TABLE ORGANIZATION
-- (
-- 	-- 기관/조직 일련번호
-- 	ORGANIZATION_SEQ varchar(40) NOT NULL COMMENT '기관/조직 일련번호',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- EMAIL
-- 	EMAIL varchar(1000) COMMENT 'EMAIL',
-- 	-- 휴대폰/전화번호
-- 	PHONE_NUMBER varchar(20) COMMENT '휴대폰/전화번호',
-- 	-- 등록번호/사업번호
-- 	LICENSE_NUMBER varchar(40) COMMENT '등록번호/사업번호',
-- 	-- URI
-- 	URI varchar(2000) COMMENT 'URI',
-- 	-- 임시저장여부
-- 	TEMPORARY_YN varchar(40) NOT NULL COMMENT '임시저장여부',
-- 	-- 상위 조직 일련번호
-- 	PARENT_ORGANIZATION_SEQ varchar(40) COMMENT '상위 조직 일련번호',
-- 	CONSTRAINT PK_ORGANIZATION PRIMARY KEY (ORGANIZATION_SEQ)
-- ) COMMENT = '기관/그룹/조직/부서 구조도';


-- -- 개설 강좌 모집 정보
-- CREATE TABLE ORGANIZATION_COURSE
-- (
-- 	-- 기관 개설 강좌 SEQ
-- 	ORGANIZATION_COURSE_SEQ varchar(40) NOT NULL COMMENT '기관 개설 강좌 SEQ',
-- 	-- 모집 시작일시
-- 	RECRUIT_START_DATE varchar(12) NOT NULL COMMENT '모집 시작일시',
-- 	-- 모집 종료일시
-- 	RECRUIT_END_DATE varchar(12) NOT NULL COMMENT '모집 종료일시',
-- 	-- 갯수 or 점수 or 일수 or 인원수
-- 	COUNT decimal NOT NULL COMMENT '갯수 or 점수 or 일수 or 인원수',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) COMMENT '종류or형식or유형',
-- 	-- 금액/부담금 
-- 	PRICE decimal COMMENT '금액/부담금',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) NOT NULL COMMENT '사용/공개/대표/합격/승인/모집/해답 여부',
-- 	-- 개설 과정/과목 SEQ
-- 	COURSE_SEQ varchar(40) NOT NULL COMMENT '개설 과정/과목 SEQ',
-- 	PRIMARY KEY (ORGANIZATION_COURSE_SEQ)
-- ) COMMENT = '개설 강좌 모집 정보';


-- -- 기관 판매 과정은행
-- CREATE TABLE ORGANIZATION_COURSEBANK
-- (
-- 	-- 기관 판매 과정 은행 SEQ
-- 	ORGANIZATION_COURSEBANK_SEQ varchar(40) NOT NULL COMMENT '기관 판매 과정 은행 SEQ',
-- 	-- 금액/부담금 
-- 	PRICE decimal COMMENT '금액/부담금',
-- 	-- 상위 기관 보유 과정 은행 SEQ
-- 	PARENT_ORGANIZATION_COURSEBANK_SEQ varchar(40) COMMENT '상위 기관 보유 과정 은행 SEQ',
-- 	-- 과정/과목 은행 SEQ
-- 	COURSEBANK_SEQ varchar(40) NOT NULL COMMENT '과정/과목 은행 SEQ',
-- 	PRIMARY KEY (ORGANIZATION_COURSEBANK_SEQ)
-- ) COMMENT = '기관 판매 과정은행';


-- -- 기관 시설
-- CREATE TABLE ORGANIZATION_FACILITY
-- (
-- 	-- 기관 보유 시설 SEQ
-- 	ORGANIZATION_FACILITY_SEQ varchar(40) NOT NULL COMMENT '기관 보유 시설 SEQ',
-- 	-- 기관/조직 일련번호
-- 	ORGANIZATION_SEQ varchar(40) NOT NULL COMMENT '기관/조직 일련번호',
-- 	-- 각종 시설 SEQ
-- 	FACILITY_SEQ varchar(40) NOT NULL COMMENT '각종 시설 SEQ',
-- 	PRIMARY KEY (ORGANIZATION_FACILITY_SEQ)
-- ) COMMENT = '기관 시설';


-- -- 조직 근무자
-- CREATE TABLE ORGANIZATION_MEMBER
-- (
-- 	-- 조직 근무자 SEQ
-- 	ORGANIZATION_MEMBER_SEQ varchar(40) NOT NULL COMMENT '조직 근무자 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 기관/조직 일련번호
-- 	ORGANIZATION_SEQ varchar(40) NOT NULL COMMENT '기관/조직 일련번호',
-- 	-- 회원 SEQ
-- 	MEMBER_SEQ varchar(40) NOT NULL COMMENT '회원 SEQ',
-- 	PRIMARY KEY (ORGANIZATION_MEMBER_SEQ)
-- ) COMMENT = '조직 근무자';


-- -- 수행프로젝트정보
-- CREATE TABLE PROJECT
-- (
-- 	-- 프로젝트_SEQ
-- 	PROJECT_SEQ varchar(40) NOT NULL COMMENT '프로젝트 일련번호',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 제목
-- 	TITLE varchar(4000) NOT NULL COMMENT '제목',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- URI
-- 	URI varchar(2000) COMMENT 'URI',
-- 	-- 시작일시 (공지 등) or 일단위 의미
-- 	START_DATE varchar(12) NOT NULL COMMENT '시작일시',
-- 	-- 종료일시 (공지 등)
-- 	END_DATE varchar(12) COMMENT '종료일시',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal DEFAULT 0 COMMENT '정렬순서',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) NOT NULL COMMENT '사용/공개/대표/합격/승인/모집/해답 여부',
-- 	-- 갯수 or 점수 or 일수 or 인원수
-- 	COUNT decimal COMMENT '갯수 or 점수 or 일수 or 인원수',
-- 	-- 개설과목 질의 SEQ
-- 	QUESTION_SEQ varchar(40) NOT NULL COMMENT '개설과목 질의 SEQ',
-- 	-- 상위 프로젝트_SEQ
-- 	PARENT_PROJECT_SEQ varchar(40) COMMENT '프로젝트 일련번호',
-- 	PRIMARY KEY (PROJECT_SEQ)
-- ) COMMENT = '수행프로젝트정보';


-- -- 프로젝트 구성원
-- CREATE TABLE PROJECT_MEMBER
-- (
-- 	-- 프로젝트 구성원 SEQ
-- 	PROJECT_MEMBER_SEQ varchar(40) NOT NULL COMMENT '프로젝트 구성원 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) COMMENT '종류or형식or유형',
-- 	-- 과목 강의 구성원 SEQ
-- 	LECTURE_MEMBER_SEQ varchar(40) NOT NULL COMMENT '과목 강의 구성원 SEQ',
-- 	-- 프로젝트_SEQ
-- 	PROJECT_SEQ varchar(40) NOT NULL COMMENT '프로젝트 일련번호',
-- 	PRIMARY KEY (PROJECT_MEMBER_SEQ)
-- ) COMMENT = '프로젝트 구성원';


-- -- 발행바우처
-- CREATE TABLE PUBLICVOUCHER
-- (
-- 	-- 발행 바우처 SEQ
-- 	PUBLICVOUCHER_SEQ varchar(40) NOT NULL COMMENT '발행 바우처 SEQ',
-- 	-- 시작일시 (공지 등) or 일단위 의미
-- 	START_DATE varchar(12) NOT NULL COMMENT '시작일시',
-- 	-- 종료일시 (공지 등)
-- 	END_DATE varchar(12) NOT NULL COMMENT '종료일시',
-- 	-- 갯수 or 점수 or 일수 or 인원수
-- 	COUNT decimal NOT NULL COMMENT '갯수 or 점수 or 일수 or 인원수',
-- 	-- 사용/공개/대표/합격/승인/모집/해답 여부
-- 	USE_YN varchar(40) NOT NULL COMMENT '사용/공개/대표/합격/승인/모집/해답 여부',
-- 	-- 바우처 그룹 SEQ
-- 	KINDVOUCHERGROUP_SEQ varchar(40) NOT NULL COMMENT '바우처 그룹 SEQ',
-- 	PRIMARY KEY (PUBLICVOUCHER_SEQ)
-- ) COMMENT = '발행바우처';


-- -- 개설과목 질의
-- CREATE TABLE QUESTION
-- (
-- 	-- 개설과목 질의 SEQ
-- 	QUESTION_SEQ varchar(40) NOT NULL COMMENT '개설과목 질의 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) COMMENT '종류or형식or유형',
-- 	-- 종류(메세지,규격,출결,답변대상자)
-- 	KIND varchar(40) COMMENT '종류(메세지,규격,출결,답변대상자)',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal NOT NULL COMMENT '정렬순서',
-- 	-- 제목
-- 	TITLE varchar(4000) NOT NULL COMMENT '제목',
-- 	-- 점수가중치
-- 	WEIGHT decimal COMMENT '점수가중치',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 상위 개설과목 질의 SEQ
-- 	PARENT_QUESTION_SEQ varchar(40) COMMENT '상위 개설과목 질의 SEQ',
-- 	PRIMARY KEY (QUESTION_SEQ)
-- ) COMMENT = '개설과목 질의';


-- -- 각종 질의 은행
-- CREATE TABLE QUESTIONBANK
-- (
-- 	-- 각종 질의 은행 SEQ
-- 	QUESTIONBANK_SEQ varchar(40) NOT NULL COMMENT '각종 질의 은행 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 종류(메세지,규격,출결,답변대상자)
-- 	KIND varchar(40) NOT NULL COMMENT '종류(메세지,규격,출결,답변대상자)',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal COMMENT '정렬순서',
-- 	-- 제목
-- 	TITLE varchar(4000) NOT NULL COMMENT '제목',
-- 	-- 점수가중치
-- 	WEIGHT decimal COMMENT '점수가중치',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 상위 각종 질의 은행 SEQ
-- 	PARENT_QUESTIONBANK_SEQ varchar(40) COMMENT '상위 각종 질의 은행 SEQ',
-- 	PRIMARY KEY (QUESTIONBANK_SEQ)
-- ) COMMENT = '각종 질의 은행';


-- -- 각종 질의 은행 사용 내역
-- CREATE TABLE QUESTIONBANK_QUESTION
-- (
-- 	-- 각종 질의 은행 SEQ
-- 	QUESTIONBANK_SEQ varchar(40) NOT NULL COMMENT '각종 질의 은행 SEQ',
-- 	-- 개설과목 질의 SEQ
-- 	QUESTION_SEQ varchar(40) NOT NULL COMMENT '개설과목 질의 SEQ'
-- ) COMMENT = '각종 질의 은행 사용 내역';


-- -- 각종 질의 평가기준표
-- CREATE TABLE QUESTION_STANDARDEVALUATION
-- (
-- 	-- 연관된 테이블 SEQ
-- 	RELATEDTABLE_SEQ varchar(40) NOT NULL COMMENT '연관된 테이블 SEQ',
-- 	-- 평가 기준표 ID
-- 	STANDARDEVALUATION_ID varchar(40) NOT NULL COMMENT '평가 기준표 ID'
-- ) COMMENT = '각종 질의 평가기준표';


-- -- 각종 회원 참조 정보
-- CREATE TABLE REFERENCEMEMBER
-- (
-- 	-- 각종 회원 참조 정보 SEQ
-- 	REFERENCEMEMBER_SEQ varchar(40) NOT NULL COMMENT '각종 참조 정보 SEQ',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 시작일시 (공지 등) or 일단위 의미
-- 	START_DATE varchar(12) NOT NULL COMMENT '시작일시',
-- 	-- 종료일시 (공지 등)
-- 	END_DATE varchar(12) NOT NULL COMMENT '종료일시',
-- 	-- 회원 SEQ
-- 	MEMBER_SEQ varchar(40) NOT NULL COMMENT '회원 SEQ',
-- 	-- 개설 과정/과목 SEQ
-- 	COURSE_SEQ varchar(40) COMMENT '개설 과정/과목 SEQ',
-- 	PRIMARY KEY (REFERENCEMEMBER_SEQ)
-- ) COMMENT = '각종 회원 참조 정보';


-- -- 연관된 파일 정보
-- CREATE TABLE RELATEDATTACHFILE
-- (
-- 	-- 연관된 테이블 SEQ
-- 	RELATEDTABLE_SEQ varchar(40) NOT NULL COMMENT '연관된 테이블 SEQ',
-- 	-- 파일을 N:N 관계로 연계 위해 추가
-- 	ATTACHFILE_SEQ varchar(40) NOT NULL COMMENT '첨부파일 일련번호',
-- 	UNIQUE (RELATEDTABLE_SEQ, ATTACHFILE_SEQ)
-- ) COMMENT = '연관된 파일 정보';


-- -- 연관된 각종 접근 테이블 정보
-- CREATE TABLE RELATEDCONTACTMISC
-- (
-- 	-- 연관된 테이블 SEQ
-- 	RELATEDTABLE_SEQ varchar(40) NOT NULL COMMENT '연관된 테이블 SEQ',
-- 	-- 각종 접근 정보 SEQ
-- 	CONTACTMISC_SEQ varchar(40) NOT NULL COMMENT '각종 접근 정보 SEQ'
-- ) COMMENT = '연관된 각종 접근 테이블 정보';


-- -- 연결되는 예외 일시
-- CREATE TABLE RELATEDEXCEPTEDDATE
-- (
-- 	-- 연관된 테이블 SEQ
-- 	RELATEDTABLE_SEQ varchar(40) NOT NULL COMMENT '연관된 테이블 SEQ',
-- 	-- 예외 일시 SEQ
-- 	EXCEPTEDDATE_SEQ varchar(40) NOT NULL COMMENT '예외 일시 SEQ'
-- ) COMMENT = '연결되는 예외 일시';


-- -- 연관된 NCS코드
-- CREATE TABLE RELATEDNCSCODE
-- (
-- 	-- 연관된 테이블 SEQ
-- 	RELATEDTABLE_SEQ varchar(40) NOT NULL COMMENT '연관된 테이블 SEQ',
-- 	-- NCS코드 SEQ
-- 	NCSCODE_SEQ varchar(40) NOT NULL COMMENT 'NCS코드 SEQ'
-- ) COMMENT = '연관된 NCS코드';


-- -- 보낸 메세지 목록
-- CREATE TABLE SENDEDMESSAGE
-- (
-- 	-- 보낸 메세지 목록 SEQ
-- 	SENDEDMESSAGE_SEQ varchar(40) NOT NULL COMMENT '보낸 메세지 목록 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 종류(메세지,규격,출결,답변대상자)
-- 	KIND varchar(40) NOT NULL COMMENT '종류(메세지,규격,출결,답변대상자)',
-- 	-- 제목
-- 	TITLE varchar(4000) NOT NULL COMMENT '제목',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- 시작일시 (공지 등) or 일단위 의미
-- 	START_DATE varchar(12) NOT NULL COMMENT '시작일시',
-- 	-- 종료일시 (공지 등)
-- 	END_DATE varchar(12) COMMENT '종료일시',
-- 	-- 연관된 테이블 SEQ
-- 	RELATEDTABLE_SEQ varchar(40) COMMENT '연관된 테이블 SEQ',
-- 	-- 기관/조직 일련번호
-- 	ORGANIZATION_SEQ varchar(40) NOT NULL COMMENT '기관/조직 일련번호',
-- 	PRIMARY KEY (SENDEDMESSAGE_SEQ)
-- ) COMMENT = '보낸 메세지 목록';


-- -- 보낸 메세지 회원
-- CREATE TABLE SENDEDMESSAGE_MEMBER
-- (
-- 	-- 보낸 메세지 회원 SEQ
-- 	SENDEDMESSAGE_MEMBER_SEQ varchar(40) NOT NULL COMMENT '보낸 메세지 회원 SEQ',
-- 	-- 등록일자
-- 	REGISTRY_DATE datetime NOT NULL COMMENT '등록일자',
-- 	-- 상태/에러상태
-- 	STATUS varchar(40) COMMENT '상태/에러상태',
-- 	-- 회원 SEQ
-- 	MEMBER_SEQ varchar(40) NOT NULL COMMENT '회원 SEQ',
-- 	-- 보낸 메세지 목록 SEQ
-- 	SENDEDMESSAGE_SEQ varchar(40) NOT NULL COMMENT '보낸 메세지 목록 SEQ',
-- 	PRIMARY KEY (SENDEDMESSAGE_MEMBER_SEQ)
-- ) COMMENT = '보낸 메세지 회원';


-- -- 평가기준표
-- CREATE TABLE STANDARDEVALUATION
-- (
-- 	-- 평가 기준표 ID
-- 	STANDARDEVALUATION_ID varchar(40) NOT NULL COMMENT '평가 기준표 ID',
-- 	-- 제목
-- 	TITLE varchar(4000) NOT NULL COMMENT '제목',
-- 	-- 갯수 or 점수 or 일수 or 인원수
-- 	COUNT decimal NOT NULL COMMENT '갯수 or 점수 or 일수 or 인원수',
-- 	-- 정렬순서
-- 	ORDER_NUMBER decimal NOT NULL COMMENT '정렬순서',
-- 	-- 상위 평가 기준표 ID
-- 	PARENT_STANDARDEVALUATION_ID varchar(40) COMMENT '상위 평가 기준표 ID',
-- 	PRIMARY KEY (STANDARDEVALUATION_ID)
-- ) COMMENT = '평가기준표';


-- -- 보유 바우처
-- CREATE TABLE TAKEVOUCHER
-- (
-- 	-- 보유 바우처 SEQ
-- 	TAKEVOUCHER_SEQ varchar(40) NOT NULL COMMENT '보유 바우처 SEQ',
-- 	-- 종류 or 형식 from common code or 유형
-- 	TYPE varchar(40) NOT NULL COMMENT '종류or형식or유형',
-- 	-- 등록일자
-- 	REGISTRY_DATE datetime NOT NULL COMMENT '등록일자',
-- 	-- 발행 바우처 SEQ
-- 	PUBLICVOUCHER_SEQ varchar(40) NOT NULL COMMENT '발행 바우처 SEQ',
-- 	-- 기관/조직 일련번호
-- 	ORGANIZATION_SEQ varchar(40) NOT NULL COMMENT '기관/조직 일련번호',
-- 	PRIMARY KEY (TAKEVOUCHER_SEQ)
-- ) COMMENT = '보유 바우처';


-- -- 사용교자재
-- CREATE TABLE TEACHINGMATERIAL
-- (
-- 	-- 사용 교자재 SEQ
-- 	TEACHINGMATERIAL_SEQ varchar(40) NOT NULL COMMENT '사용 교자재 SEQ',
-- 	-- 명칭/팀명/해쉬태그/강의실번호/팀명 
-- 	NAME varchar(255) NOT NULL COMMENT '명칭/팀명/해쉬태그/강의실번호/팀명',
-- 	-- 내용/댓글/설명
-- 	CONTENT varchar(9000) COMMENT '내용/댓글/설명',
-- 	-- URI
-- 	URI varchar(2000) COMMENT 'URI',
-- 	PRIMARY KEY (TEACHINGMATERIAL_SEQ)
-- ) COMMENT = '사용교자재';


-- -- 사용 바우처
-- CREATE TABLE USEVOUCHER
-- (
-- 	-- 사용 바우처 SEQ
-- 	USEVOUCHER_SEQ varchar(40) NOT NULL COMMENT '사용 바우처 SEQ',
-- 	-- 금액/부담금 
-- 	PRICE decimal COMMENT '금액/부담금',
-- 	-- 등록일자
-- 	REGISTRY_DATE datetime NOT NULL COMMENT '등록일자',
-- 	-- 보유 바우처 SEQ
-- 	TAKEVOUCHER_SEQ varchar(40) NOT NULL COMMENT '보유 바우처 SEQ',
-- 	PRIMARY KEY (USEVOUCHER_SEQ)
-- ) COMMENT = '사용 바우처';



-- /* Create Foreign Keys */

-- ALTER TABLE RELATEDATTACHFILE
-- 	ADD FOREIGN KEY (ATTACHFILE_SEQ)
-- 	REFERENCES ATTACHFILE (ATTACHFILE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE AUTHORITY_MEMBER
-- 	ADD FOREIGN KEY (AUTHORITY_ID)
-- 	REFERENCES AUTHORITY (AUTHORITY_ID)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE MENU_AUTHORITY
-- 	ADD FOREIGN KEY (AUTHORITY_ID)
-- 	REFERENCES AUTHORITY (AUTHORITY_ID)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COMMONCODE
-- 	ADD FOREIGN KEY (PARENT_COMMONCODE_ID)
-- 	REFERENCES COMMONCODE (COMMONCODE_ID)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE RELATEDCONTACTMISC
-- 	ADD FOREIGN KEY (CONTACTMISC_SEQ)
-- 	REFERENCES CONTACTMISC (CONTACTMISC_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ATTENDANCE
-- 	ADD FOREIGN KEY (COURSE_SEQ)
-- 	REFERENCES COURSE (COURSE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSE
-- 	ADD FOREIGN KEY (PARENT_COURSE_SEQ)
-- 	REFERENCES COURSE (COURSE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSEBANK_COURSE
-- 	ADD FOREIGN KEY (COURSE_SEQ)
-- 	REFERENCES COURSE (COURSE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSE_QUESTION
-- 	ADD FOREIGN KEY (COURSE_SEQ)
-- 	REFERENCES COURSE (COURSE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE LECTURE_MEMBER
-- 	ADD FOREIGN KEY (COURSE_SEQ)
-- 	REFERENCES COURSE (COURSE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE OPENCOURSE_FACILITY
-- 	ADD FOREIGN KEY (COURSE_SEQ)
-- 	REFERENCES COURSE (COURSE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ORGANIZATION_COURSE
-- 	ADD FOREIGN KEY (COURSE_SEQ)
-- 	REFERENCES COURSE (COURSE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE REFERENCEMEMBER
-- 	ADD FOREIGN KEY (COURSE_SEQ)
-- 	REFERENCES COURSE (COURSE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSEBANK
-- 	ADD FOREIGN KEY (PARENT_COURSEBANK_SEQ)
-- 	REFERENCES COURSEBANK (COURSEBANK_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSEBANK_COURSE
-- 	ADD FOREIGN KEY (COURSEBANK_SEQ)
-- 	REFERENCES COURSEBANK (COURSEBANK_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSEBANK_QUESTIONBANK
-- 	ADD FOREIGN KEY (COURSEBANK_SEQ)
-- 	REFERENCES COURSEBANK (COURSEBANK_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ORGANIZATION_COURSEBANK
-- 	ADD FOREIGN KEY (COURSEBANK_SEQ)
-- 	REFERENCES COURSEBANK (COURSEBANK_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE RELATEDEXCEPTEDDATE
-- 	ADD FOREIGN KEY (EXCEPTEDDATE_SEQ)
-- 	REFERENCES EXCEPTEDDATE (EXCEPTEDDATE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE FACILITY
-- 	ADD FOREIGN KEY (PARENT_FACILITY_SEQ)
-- 	REFERENCES FACILITY (FACILITY_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE OPENCOURSE_FACILITY
-- 	ADD FOREIGN KEY (FACILITY_SEQ)
-- 	REFERENCES FACILITY (FACILITY_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ORGANIZATION_FACILITY
-- 	ADD FOREIGN KEY (FACILITY_SEQ)
-- 	REFERENCES FACILITY (FACILITY_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE MULTIBOARD_HASHTAG
-- 	ADD FOREIGN KEY (HASHTAG_SEQ)
-- 	REFERENCES HASHTAG (HASHTAG_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE PUBLICVOUCHER
-- 	ADD FOREIGN KEY (KINDVOUCHERGROUP_SEQ)
-- 	REFERENCES KINDVOUCHERGROUP (KINDVOUCHERGROUP_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ANSWER
-- 	ADD FOREIGN KEY (LECTURE_MEMBER_SEQ)
-- 	REFERENCES LECTURE_MEMBER (LECTURE_MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ATTENDANCE
-- 	ADD FOREIGN KEY (LECTURE_MEMBER_SEQ)
-- 	REFERENCES LECTURE_MEMBER (LECTURE_MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COOPERATION
-- 	ADD FOREIGN KEY (LECTURE_MEMBER_SEQ)
-- 	REFERENCES LECTURE_MEMBER (LECTURE_MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE EVALUATION
-- 	ADD FOREIGN KEY (LECTURE_MEMBER_SEQ)
-- 	REFERENCES LECTURE_MEMBER (LECTURE_MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE PROJECT_MEMBER
-- 	ADD FOREIGN KEY (LECTURE_MEMBER_SEQ)
-- 	REFERENCES LECTURE_MEMBER (LECTURE_MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE AUTHORITY_MEMBER
-- 	ADD FOREIGN KEY (MEMBER_SEQ)
-- 	REFERENCES MEMBER (MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE LECTURE_MEMBER
-- 	ADD FOREIGN KEY (MEMBER_SEQ)
-- 	REFERENCES MEMBER (MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE LOCATIONTRACE
-- 	ADD FOREIGN KEY (MEMBER_SEQ)
-- 	REFERENCES MEMBER (MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE MESSAGERECEIVEWAY
-- 	ADD FOREIGN KEY (MEMBER_SEQ)
-- 	REFERENCES MEMBER (MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ORGANIZATION_MEMBER
-- 	ADD FOREIGN KEY (MEMBER_SEQ)
-- 	REFERENCES MEMBER (MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE REFERENCEMEMBER
-- 	ADD FOREIGN KEY (MEMBER_SEQ)
-- 	REFERENCES MEMBER (MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE SENDEDMESSAGE_MEMBER
-- 	ADD FOREIGN KEY (MEMBER_SEQ)
-- 	REFERENCES MEMBER (MEMBER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE MENU
-- 	ADD FOREIGN KEY (PARENT_MENU_ID)
-- 	REFERENCES MENU (MENU_ID)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE MENU_AUTHORITY
-- 	ADD FOREIGN KEY (MENU_ID)
-- 	REFERENCES MENU (MENU_ID)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE MULTIBOARD
-- 	ADD FOREIGN KEY (PARENT_MULTIBOARD_SEQ)
-- 	REFERENCES MULTIBOARD (MULTIBOARD_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE MULTIBOARD_HASHTAG
-- 	ADD FOREIGN KEY (MULTIBOARD_SEQ)
-- 	REFERENCES MULTIBOARD (MULTIBOARD_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE MULTIBOARD
-- 	ADD FOREIGN KEY (MULTI_BOARDGROUP_ID)
-- 	REFERENCES MULTIBOARDGROUP (MULTI_BOARDGROUP_ID)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE NCSCODE
-- 	ADD FOREIGN KEY (PARENT_NCSCODE_SEQ)
-- 	REFERENCES NCSCODE (NCSCODE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE RELATEDNCSCODE
-- 	ADD FOREIGN KEY (NCSCODE_SEQ)
-- 	REFERENCES NCSCODE (NCSCODE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COOPERATION
-- 	ADD FOREIGN KEY (ORGANIZATION_SEQ)
-- 	REFERENCES ORGANIZATION (ORGANIZATION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSE
-- 	ADD FOREIGN KEY (ORGANIZATION_SEQ)
-- 	REFERENCES ORGANIZATION (ORGANIZATION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSEBANK
-- 	ADD FOREIGN KEY (ORGANIZATION_SEQ)
-- 	REFERENCES ORGANIZATION (ORGANIZATION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ORGANIZATION
-- 	ADD FOREIGN KEY (PARENT_ORGANIZATION_SEQ)
-- 	REFERENCES ORGANIZATION (ORGANIZATION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ORGANIZATION_FACILITY
-- 	ADD FOREIGN KEY (ORGANIZATION_SEQ)
-- 	REFERENCES ORGANIZATION (ORGANIZATION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ORGANIZATION_MEMBER
-- 	ADD FOREIGN KEY (ORGANIZATION_SEQ)
-- 	REFERENCES ORGANIZATION (ORGANIZATION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE SENDEDMESSAGE
-- 	ADD FOREIGN KEY (ORGANIZATION_SEQ)
-- 	REFERENCES ORGANIZATION (ORGANIZATION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE TAKEVOUCHER
-- 	ADD FOREIGN KEY (ORGANIZATION_SEQ)
-- 	REFERENCES ORGANIZATION (ORGANIZATION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ORGANIZATION_COURSEBANK
-- 	ADD FOREIGN KEY (PARENT_ORGANIZATION_COURSEBANK_SEQ)
-- 	REFERENCES ORGANIZATION_COURSEBANK (ORGANIZATION_COURSEBANK_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE PROJECT
-- 	ADD FOREIGN KEY (PARENT_PROJECT_SEQ)
-- 	REFERENCES PROJECT (PROJECT_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE PROJECT_MEMBER
-- 	ADD FOREIGN KEY (PROJECT_SEQ)
-- 	REFERENCES PROJECT (PROJECT_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE TAKEVOUCHER
-- 	ADD FOREIGN KEY (PUBLICVOUCHER_SEQ)
-- 	REFERENCES PUBLICVOUCHER (PUBLICVOUCHER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE ANSWER
-- 	ADD FOREIGN KEY (QUESTION_SEQ)
-- 	REFERENCES QUESTION (QUESTION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSE_QUESTION
-- 	ADD FOREIGN KEY (QUESTION_SEQ)
-- 	REFERENCES QUESTION (QUESTION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE EVALUATION
-- 	ADD FOREIGN KEY (QUESTION_SEQ)
-- 	REFERENCES QUESTION (QUESTION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE PROJECT
-- 	ADD FOREIGN KEY (QUESTION_SEQ)
-- 	REFERENCES QUESTION (QUESTION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE QUESTION
-- 	ADD FOREIGN KEY (PARENT_QUESTION_SEQ)
-- 	REFERENCES QUESTION (QUESTION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE QUESTIONBANK_QUESTION
-- 	ADD FOREIGN KEY (QUESTION_SEQ)
-- 	REFERENCES QUESTION (QUESTION_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSEBANK_QUESTIONBANK
-- 	ADD FOREIGN KEY (QUESTIONBANK_SEQ)
-- 	REFERENCES QUESTIONBANK (QUESTIONBANK_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE QUESTIONBANK
-- 	ADD FOREIGN KEY (PARENT_QUESTIONBANK_SEQ)
-- 	REFERENCES QUESTIONBANK (QUESTIONBANK_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE QUESTIONBANK_QUESTION
-- 	ADD FOREIGN KEY (QUESTIONBANK_SEQ)
-- 	REFERENCES QUESTIONBANK (QUESTIONBANK_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE SENDEDMESSAGE_MEMBER
-- 	ADD FOREIGN KEY (SENDEDMESSAGE_SEQ)
-- 	REFERENCES SENDEDMESSAGE (SENDEDMESSAGE_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE QUESTION_STANDARDEVALUATION
-- 	ADD FOREIGN KEY (STANDARDEVALUATION_ID)
-- 	REFERENCES STANDARDEVALUATION (STANDARDEVALUATION_ID)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE STANDARDEVALUATION
-- 	ADD FOREIGN KEY (PARENT_STANDARDEVALUATION_ID)
-- 	REFERENCES STANDARDEVALUATION (STANDARDEVALUATION_ID)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE USEVOUCHER
-- 	ADD FOREIGN KEY (TAKEVOUCHER_SEQ)
-- 	REFERENCES TAKEVOUCHER (TAKEVOUCHER_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;


-- ALTER TABLE COURSEBANK_TEACHINGMATERIAL
-- 	ADD FOREIGN KEY (TEACHINGMATERIAL_SEQ)
-- 	REFERENCES TEACHINGMATERIAL (TEACHINGMATERIAL_SEQ)
-- 	ON UPDATE CASCADE
-- 	ON DELETE CASCADE
-- ;



-- /* Create Indexes */

-- CREATE INDEX ANSWER_INX01 ON ANSWER (QUESTION_SEQ ASC, LECTURE_MEMBER_SEQ ASC);
-- CREATE UNIQUE INDEX ATTENDANCE_INX01 ON ATTENDANCE (LECTURE_MEMBER_SEQ ASC, COURSE_SEQ ASC, REGISTRY_DATE ASC);
-- CREATE UNIQUE INDEX ATTENDANCE_INX02 ON ATTENDANCE (COURSE_SEQ ASC, LECTURE_MEMBER_SEQ ASC, REGISTRY_DATE ASC);
-- CREATE UNIQUE INDEX COMMONCODE_INX01 ON COMMONCODE (PARENT_COMMONCODE_ID ASC, COMMONCODE_ID ASC);
-- CREATE UNIQUE INDEX COOPERATION_INX01 ON COOPERATION (ORGANIZATION_SEQ ASC, LECTURE_MEMBER_SEQ ASC, COOPERATION_SEQ ASC);
-- CREATE UNIQUE INDEX COURSE_INX01 ON COURSE (PARENT_COURSE_SEQ ASC, COURSE_SEQ ASC);
-- CREATE UNIQUE INDEX COURSEBANK_INX01 ON COURSEBANK (PARENT_COURSEBANK_SEQ ASC, COURSEBANK_SEQ ASC);
-- CREATE UNIQUE INDEX COURSEBANK_QUESTIONBANK_IDX01 ON COURSEBANK_QUESTIONBANK (COURSEBANK_SEQ ASC, QUESTIONBANK_SEQ ASC);
-- CREATE UNIQUE INDEX COURSEBANK_TEACHINGMATERIAL_INX01 ON COURSEBANK_TEACHINGMATERIAL (RELATEDTABLE_SEQ ASC, TEACHINGMATERIAL_SEQ ASC);
-- CREATE UNIQUE INDEX EVALUATION_INX01 ON EVALUATION (LECTURE_MEMBER_SEQ ASC, QUESTION_SEQ ASC);
-- CREATE UNIQUE INDEX EVALUATION_INX02 ON EVALUATION (QUESTION_SEQ ASC, LECTURE_MEMBER_SEQ ASC);
-- CREATE UNIQUE INDEX FACILITY_INX01 ON FACILITY (PARENT_FACILITY_SEQ ASC, FACILITY_SEQ ASC);
-- CREATE UNIQUE INDEX LECTURE_MEMBER_INX01 ON LECTURE_MEMBER (COURSE_SEQ ASC, MEMBER_SEQ ASC, TYPE ASC);
-- CREATE UNIQUE INDEX LECTURE_MEMBER_INX02 ON LECTURE_MEMBER (MEMBER_SEQ ASC, COURSE_SEQ ASC, TYPE ASC);
-- CREATE UNIQUE INDEX MENU_INX01 ON MENU (PARENT_MENU_ID ASC, MENU_ID ASC);
-- CREATE UNIQUE INDEX MENU_AUTHORITY_INX01 ON MENU_AUTHORITY (AUTHORITY_ID ASC, MENU_ID ASC);
-- CREATE UNIQUE INDEX MENU_AUTHORITY_INX02 ON MENU_AUTHORITY (MENU_ID ASC, AUTHORITY_ID ASC);
-- CREATE UNIQUE INDEX MULTIBOARD_INX01 ON MULTIBOARD (PARENT_MULTIBOARD_SEQ ASC, MULTIBOARD_SEQ ASC);
-- CREATE UNIQUE INDEX MULTIBOARD_INX02 ON MULTIBOARD (MULTI_BOARDGROUP_ID ASC, MULTIBOARD_SEQ ASC);
-- CREATE UNIQUE INDEX MULTIBOARDGROUP_INX01 ON MULTIBOARDGROUP (RELATEDTABLE_SEQ ASC, MULTI_BOARDGROUP_ID ASC);
-- CREATE UNIQUE INDEX NATIONALCALENDAR_API ON NATIONALCALENDAR_API (START_DATE ASC, NAME ASC);
-- CREATE UNIQUE INDEX NCSCODE_INX01 ON NCSCODE (PARENT_NCSCODE_SEQ ASC, NCSCODE_SEQ ASC);
-- CREATE UNIQUE INDEX OPENCOURSE_FACILITY_INX01 ON OPENCOURSE_FACILITY (COURSE_SEQ ASC, FACILITY_SEQ ASC);
-- CREATE UNIQUE INDEX ORGANIZATION_INX01 ON ORGANIZATION (PARENT_ORGANIZATION_SEQ ASC, ORGANIZATION_SEQ ASC);
-- CREATE UNIQUE INDEX ORGANIZATION_COURSBANK_INX01 ON ORGANIZATION_COURSEBANK (COURSEBANK_SEQ ASC);
-- CREATE UNIQUE INDEX ORGANIZATION_COURSBANK_INX02 ON ORGANIZATION_COURSEBANK (COURSEBANK_SEQ ASC);
-- CREATE INDEX ORGANIZATION_MEMBER_INX01 ON ORGANIZATION_MEMBER (ORGANIZATION_SEQ ASC, MEMBER_SEQ ASC);
-- CREATE UNIQUE INDEX PROJECT_MEMBER_INX01 ON PROJECT_MEMBER (PROJECT_SEQ ASC, LECTURE_MEMBER_SEQ ASC);
-- CREATE UNIQUE INDEX PROJECT_MEMBER_INX02 ON PROJECT_MEMBER (LECTURE_MEMBER_SEQ ASC, PROJECT_SEQ ASC);
-- CREATE UNIQUE INDEX QUESTION_INX01 ON QUESTION (PARENT_QUESTION_SEQ ASC, QUESTION_SEQ ASC);
-- CREATE UNIQUE INDEX QUESTIONBANK_INX01 ON QUESTIONBANK (PARENT_QUESTIONBANK_SEQ ASC, QUESTIONBANK_SEQ ASC);
-- CREATE UNIQUE INDEX QUESTION_STANDARDEVALUATION_INX01 ON QUESTION_STANDARDEVALUATION (RELATEDTABLE_SEQ ASC, STANDARDEVALUATION_ID ASC);
-- CREATE UNIQUE INDEX RELATEDFILE_INX01 ON RELATEDATTACHFILE (RELATEDTABLE_SEQ ASC, ATTACHFILE_SEQ ASC);
-- CREATE UNIQUE INDEX RELATEDCONTACTMISC_INX01 ON RELATEDCONTACTMISC (RELATEDTABLE_SEQ ASC, CONTACTMISC_SEQ ASC);
-- CREATE UNIQUE INDEX RELATEDEXCEPTIONTIME_INX01 ON RELATEDEXCEPTEDDATE (RELATEDTABLE_SEQ ASC, EXCEPTEDDATE_SEQ ASC);
-- CREATE UNIQUE INDEX RELATEDNCSCODE_INX01 ON RELATEDNCSCODE (RELATEDTABLE_SEQ ASC, NCSCODE_SEQ ASC);
-- CREATE INDEX SENDEDMESSAGE_MEMBER_INX01 ON SENDEDMESSAGE_MEMBER (SENDEDMESSAGE_SEQ ASC);



