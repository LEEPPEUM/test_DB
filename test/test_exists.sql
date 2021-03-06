-- SQLite

SELECT * FROM OLD_COMPANY;

SELECT * FROM OLD_COMPANY
WHERE ID IN (
SELECT ID FROM OLD_COMPANY WHERE SALARY > 45000
);

SELECT AGE FROM COMPANY
WHERE EXISTS (
SELECT AGE FROM COMPANY AS SUB_COMPANY
WHERE COMPANY.ID = SUB_COMPANY.ID
AND SALARY > 65000
);


CREATE TABLE OLD_COMPANY_BKP (
ID REAL NULL,
NAME TEXT NULL,
AGE REAL NULL,
ADDRESS TEXT NULL,
SALARY REAL NULL
);

INSERT INTO OLD_COMPANY_BKP
SELECT * FROM OLD_COMPANY
WHERE ID IN (SELECT ID FROM OLD_COMPANY);

UPDATE OLD_COMPANY
SET SALARY = SALARY * 0.50
WHERE AGE IN (SELECT AGE FROM OLD_COMPANY_BKP WHERE AGE >= 27);

DELETE FROM OLD_COMPANY
WHERE AGE IN (SELECT AGE FROM OLD_COMPANY_BKP WHERE AGE > 27);



SELECT date('now');
SELECT date('now', 'start of month', '+1 month', '-1 day');
SELECT datetime(1092941466, 'unixepoch');
SELECT datetime(1092941466, 'unixepoch', 'localtime');
SELECT strftime('%s', 'now');
SELECT strftime('%s', 'now') - strftime('%s', '2004-01-01 02:34:56');
SELECT date('now', 'start of year', '+9 months', 'weekday 2');
SELECT time('12:00', 'localtime');
SELECT time('12:00', 'utc'); 