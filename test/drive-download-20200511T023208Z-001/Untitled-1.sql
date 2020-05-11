SELECT
QUESTION_SEQ, a.NAME AS TYPE_NAME, b.KIND AS KIND_NAME, ORDER_NUMBER, TITLE, WEIGHT, CONTENT, PARENT_QUESTION_SEQ 
FROM youjulabdb.QUESTION

 INNER JOIN COMMONCODE AS a
 ON QUESTION.TYPE = COMMONCODE.COMMONCODE_ID

 LEFT JOIN COMMONCODE AS b
 ON QUESTION.KIND = COMMONCODE.COMMONCODE_ID;