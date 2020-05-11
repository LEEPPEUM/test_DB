SELECT
QUESTION_SEQ, COMMONCODE.NAME AS TYPE_NAME, COMMONCODE.KIND AS KIND_NAME, ORDER_NUMBER, TITLE, WEIGHT, CONTENT, PARENT_QUESTION_SEQ 
FROM QUESTION

 INNER JOIN COMMONCODE 
 ON QUESTION.TYPE = COMMONCODE.COMMONCODE_ID AND QUESTION.KIND = COMMONCODE.COMMONCODE_ID;