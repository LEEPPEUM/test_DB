-- --
-- SELECT
-- q.QUESTION_SEQ, a.NAME AS TYPE_NAME, b.NAME AS KIND_NAME, q.ORDER_NUMBER, q.TITLE, q.WEIGHT, q.CONTENT, q.PARENT_QUESTION_SEQ 

-- FROM QUESTION q

-- INNER JOIN COMMONCODE a
-- ON q.TYPE = a.COMMONCODE_ID

-- LEFT JOIN COMMONCODE b
-- ON q.KIND = b.COMMONCODE_ID;


-- --
-- SELECT m.MEMBER_SEQ, a_m.AUTHORITY_ID, a.NAME AS AUTHORITY_NAME, m.CRYPT_PASSWORD, m.NAME, m.PHONE_NUMBER, m.REGISTRY_DATE, m.TEMPORARY_YN, c.NAME AS TEMPORARY_NAME

-- FROM AUTHORITY_MEMBER a_m 

-- INNER JOIN AUTHORITY a
-- ON a_m.AUTHORITY_ID = a.AUTHORITY_ID AND a.AUTHORITY_ID = 'ROLE_STUDENT'

-- INNER JOIN MEMBER m 
-- ON m.MEMBER_SEQ = a_m.MEMBER_SEQ

-- INNER JOIN COMMONCODE c 
-- ON c.COMMONCODE_ID = m.TEMPORARY_YN;
-- --

