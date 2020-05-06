-- SQLite

-- SELECT * FROM COMPANY
-- GROUP BY NAME
-- HAVING count(name) < 2;

-- SELECT * FROM COMPANY
-- GROUP BY NAME
-- HAVING count(name) >= 2;

-- SELECT * FROM OLD_COMPANY
-- GROUP BY NAME
-- HAVING count(name)

-- SELECT * 
-- FROM OLD_COMPANY
-- GROUP BY ADDRESS
-- HAVING count(ADDRESS) >= 2; 

-- SELECT *
-- FROM OLD_COMPANY
-- GROUP BY ADDRESS;

-- SELECT *
-- FROM OLD_COMPANY
-- GROUP BY ADDRESS
-- HAVING sum(salary) > 45000;
-- -- GROUP BY를 우선 한 것 중에서의 WHERE 조건과 같은 HAVING을 사용하면 2개 나옴.
-- -- ALLEN TEXAS, MARK RICH-MOND

-- SELECT sum(salary) > 45000
-- FROM OLD_COMPANY;

-- -- !=
-- -- NULL 값이 아예 존재하지 않음. 스페이스 조차

-- -- DISTINCT 중복값을 없앰. 첫번째 값만 내온다.
-- SELECT SALARY FROM OLD_COMPANY;
-- SELECT DISTINCT SALARY FROM OLD_COMPANY;

-- SELECT DISTINCT NAME, ADDRESS, SALARY FROM OLD_COMPANY;
-- -- NAME과 ADDRESS, SALARY가 일렬로 이어진 데이터를 새로운 데이터처럼 붙여서 새롭게 인식.
-- -- 해당 하는 SELECT한 COLUMN들의 값인 RECORD가 완전 정확히 일치하지 않는거라면 다른 것으로 인식함.