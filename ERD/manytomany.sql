-- SQLite
CREATE TABLE DEPARTMENT
(
  DEPARTMENT_ID TEXT NOT NULL,
  NAME          TEXT NOT NULL,
  PRIMARY KEY (DEPARTMENT_ID)
);

CREATE TABLE MEMBER
(
  MEMBER_ID     TEXT        NOT NULL,
  NAME          TEXT(65535) NOT NULL,
  AGE           INT         NOT NULL,
  ADDRESS       CHAR(50)    NULL    ,
  SALARY        INT         NULL    ,
  DEPARTMENT_ID TEXT        NOT NULL,
  PRIMARY KEY (MEMBER_ID),
  CONSTRAINT FK_DEPARTMENT_TO_MEMBER
    FOREIGN KEY (DEPARTMENT_ID)
    REFERENCES DEPARTMENT (DEPARTMENT_ID)
);

CREATE TABLE HOBBY
(
  HOBBY_ID TEXT NOT NULL,
  NAME     TEXT NOT NULL,
  PRIMARY KEY (HOBBY_ID)
);

CREATE TABLE MEMBER_HOBBY
(
  MEMBER_ID TEXT NOT NULL,
  HOBBY_ID  TEXT NOT NULL,
  CONSTRAINT FK_MEMBER_TO_MEMBER_HOBBY
    FOREIGN KEY (MEMBER_ID)
    REFERENCES MEMBER (MEMBER_ID),
    CONSTRAINT FK_HOBBY_TO_MEMBER_HOBBY
    FOREIGN KEY (HOBBY_ID)
    REFERENCES HOBBY (HOBBY_ID)
);
