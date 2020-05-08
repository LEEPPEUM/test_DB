CREATE TABLE COMPANY01
(
  COMPANY_ID VARCHAR(100) NOT NULL,
  NAME       VARCHAR(100) NULL    ,
  PRIMARY KEY (COMPANY_ID)
) COMMENT '회사';

CREATE TABLE DEPARTMENT01
(
  ID         VARCHAR(100) NOT NULL,
  NAME       VARCHAR(100) NULL    ,
  COMPANY_ID VARCHAR(100) NULL    ,
  PRIMARY KEY (ID)
) COMMENT '부서';

ALTER TABLE DEPARTMENT01
  ADD CONSTRAINT FK_COMPANY01_TO_DEPARTMENT01
    FOREIGN KEY (COMPANY_ID)
    REFERENCES COMPANY01 (COMPANY_ID);