-- Generated by Oracle SQL Developer Data Modeler 18.3.0.268.1208
--   at:        2018-12-21 21:07:30 PST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLESPACE example 
--  WARNING: Tablespace has no data files defined 
 LOGGING ONLINE EXTENT MANAGEMENT LOCAL AUTOALLOCATE FLASHBACK ON;

CREATE ROLE oe NOT IDENTIFIED;

CREATE USER hr IDENTIFIED BY default TABLESPACE USERS 
    ACCOUNT UNLOCK 
;

GRANT
    CREATE VIEW,
    UNLIMITED TABLESPACE,
    CREATE DATABASE LINK,
    CREATE SEQUENCE,
    CREATE SESSION,
    ALTER SESSION,
    CREATE SYNONYM
TO hr;

CREATE USER hr IDENTIFIED BY default TABLESPACE USERS 
    ACCOUNT UNLOCK 
;

GRANT
    CREATE VIEW,
    UNLIMITED TABLESPACE,
    CREATE DATABASE LINK,
    CREATE SEQUENCE,
    CREATE SESSION,
    ALTER SESSION,
    CREATE SYNONYM
TO hr;

CREATE USER hr IDENTIFIED BY default TABLESPACE USERS 
    ACCOUNT UNLOCK 
;

GRANT
    CREATE VIEW,
    UNLIMITED TABLESPACE,
    CREATE DATABASE LINK,
    CREATE SEQUENCE,
    CREATE SESSION,
    ALTER SESSION,
    CREATE SYNONYM
TO hr;

CREATE TABLE hr.dep_prereq (
    dep_id      NUMBER NOT NULL,
    prereq_id   NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE hr.department (
    id        NUMBER NOT NULL,
    name      VARCHAR2(50 BYTE) NOT NULL,
    min_cap   NUMBER NOT NULL,
    max_cap   NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX hr.department_pk ON
    hr.department (
        id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.department
    ADD CONSTRAINT department_pk PRIMARY KEY ( id )
        USING INDEX hr.department_pk;

CREATE TABLE hr.edu_level (
    id              NUMBER NOT NULL,
    year            NUMBER DEFAULT 0 NOT NULL,
    department_id   NUMBER NOT NULL,
    starting_date   DATE,
    ending_date     DATE
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

COMMENT ON COLUMN hr.edu_level.year IS
    '0 MEANS PERPARATORY YEAR';

COMMENT ON COLUMN hr.edu_level.department_id IS
    '0 MEANS PREPARATORY';

CREATE UNIQUE INDEX hr.edu_level_pk ON
    hr.edu_level (
        id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE hr.edu_level
    ADD CONSTRAINT edu_level_pk PRIMARY KEY ( id )
        USING INDEX hr.edu_level_pk;

CREATE TABLE hr.messages (
    from_user_id   NUMBER NOT NULL,
    report         VARCHAR2(1000 BYTE) NOT NULL,
    to_user_id     NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE hr.prerequisite (
    subject                NUMBER NOT NULL,
    id                     NUMBER NOT NULL,
    min_mark_subject       NUMBER NOT NULL,
    current_edu_level_id   NUMBER NOT NULL,
    min_mark_dep           NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX hr.prerequisite_pk1 ON
    hr.prerequisite (
        id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.prerequisite
    ADD CONSTRAINT prerequisite_pk PRIMARY KEY ( id )
        USING INDEX hr.prerequisite_pk1;

CREATE TABLE hr.reports (
    student_id   NUMBER NOT NULL,
    report       VARCHAR2(1000 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE hr.roles (
    user_id   NUMBER NOT NULL,
    role_id   NUMBER DEFAULT 0 NOT NULL,
    roles     NUMBER DEFAULT 0 NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

COMMENT ON COLUMN hr.roles.roles IS
    '0 IS STUDENT';

CREATE UNIQUE INDEX hr.roles_pk ON
    hr.roles (
        role_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.roles
    ADD CONSTRAINT roles_pk PRIMARY KEY ( role_id )
        USING INDEX hr.roles_pk;

CREATE TABLE hr.student (
    user_id     NUMBER NOT NULL,
    edu_level   NUMBER NOT NULL
)
LOGGING;

CREATE UNIQUE INDEX hr.student_pk ON
    hr.student (
        user_id
    ASC )
        LOGGING;

ALTER TABLE hr.student ADD CONSTRAINT student_pk PRIMARY KEY ( user_id );

CREATE TABLE hr.students_requests (
    dep_id       NUMBER NOT NULL,
    student_id   NUMBER NOT NULL,
    "ORDER"      NUMBER NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE hr.subject (
    id     NUMBER NOT NULL,
    name   VARCHAR2(30 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX hr.subject_pk ON
    hr.subject (
        id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.subject
    ADD CONSTRAINT subject_pk PRIMARY KEY ( id )
        USING INDEX hr.subject_pk;

CREATE TABLE hr.user_website (
    role      NUMBER NOT NULL,
    website   VARCHAR2(100 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE hr.users (
    id            NUMBER NOT NULL,
    user_name     VARCHAR2(20 BYTE) NOT NULL,
    password      VARCHAR2(20 BYTE) NOT NULL,
    email         VARCHAR2(30 BYTE) NOT NULL,
    role          NUMBER DEFAULT 0 NOT NULL,
    first_name    VARCHAR2(15 BYTE) NOT NULL,
    middle_name   VARCHAR2(15 BYTE),
    last_name     VARCHAR2(15 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX hr.table1_pk ON
    hr.users (
        id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX hr.table1_uk1 ON
    hr.users (
        user_name
    ASC,
        email
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.users
    ADD CONSTRAINT table1_pk PRIMARY KEY ( id )
        USING INDEX hr.table1_pk;

ALTER TABLE hr.users
    ADD CONSTRAINT table1_uk1 UNIQUE ( user_name,
                                       email )
        USING INDEX hr.table1_uk1;

ALTER TABLE hr.dep_prereq
    ADD CONSTRAINT dep_prereq_fk1 FOREIGN KEY ( dep_id )
        REFERENCES hr.department ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.dep_prereq
    ADD CONSTRAINT dep_prereq_fk2 FOREIGN KEY ( prereq_id )
        REFERENCES hr.prerequisite ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.edu_level
    ADD CONSTRAINT edu_level_fk1 FOREIGN KEY ( department_id )
        REFERENCES hr.department ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.messages
    ADD CONSTRAINT messages_fk1 FOREIGN KEY ( to_user_id )
        REFERENCES hr.users ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.prerequisite
    ADD CONSTRAINT prerequisite_fk1 FOREIGN KEY ( current_edu_level_id )
        REFERENCES hr.edu_level ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.prerequisite
    ADD CONSTRAINT prerequisite_fk2 FOREIGN KEY ( subject )
        REFERENCES hr.subject ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.reports
    ADD CONSTRAINT reports_fk1 FOREIGN KEY ( student_id )
        REFERENCES hr.users ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.messages
    ADD CONSTRAINT reports_fk1v1 FOREIGN KEY ( from_user_id )
        REFERENCES hr.users ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.students_requests
    ADD CONSTRAINT requests_fk1 FOREIGN KEY ( student_id )
        REFERENCES hr.student ( user_id )
    NOT DEFERRABLE;

ALTER TABLE hr.students_requests
    ADD CONSTRAINT requests_fk2 FOREIGN KEY ( dep_id )
        REFERENCES hr.department ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.roles
    ADD CONSTRAINT roles_fk1 FOREIGN KEY ( user_id )
        REFERENCES hr.users ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.student
    ADD CONSTRAINT student_fk1 FOREIGN KEY ( user_id )
        REFERENCES hr.users ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.user_website
    ADD CONSTRAINT user_website_fk1 FOREIGN KEY ( role )
        REFERENCES hr.roles ( role_id )
    NOT DEFERRABLE;

ALTER TABLE hr.dep_prereq
    ADD CONSTRAINT dep_prereq_fk1 FOREIGN KEY ( dep_id )
        REFERENCES hr.department ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.dep_prereq
    ADD CONSTRAINT dep_prereq_fk2 FOREIGN KEY ( prereq_id )
        REFERENCES hr.prerequisite ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.edu_level
    ADD CONSTRAINT edu_level_fk1 FOREIGN KEY ( department_id )
        REFERENCES hr.department ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.messages
    ADD CONSTRAINT messages_fk1 FOREIGN KEY ( to_user_id )
        REFERENCES hr.users ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.prerequisite
    ADD CONSTRAINT prerequisite_fk1 FOREIGN KEY ( current_edu_level_id )
        REFERENCES hr.edu_level ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.prerequisite
    ADD CONSTRAINT prerequisite_fk2 FOREIGN KEY ( subject )
        REFERENCES hr.subject ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.reports
    ADD CONSTRAINT reports_fk1 FOREIGN KEY ( student_id )
        REFERENCES hr.users ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.messages
    ADD CONSTRAINT reports_fk1v1 FOREIGN KEY ( from_user_id )
        REFERENCES hr.users ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.students_requests
    ADD CONSTRAINT requests_fk1 FOREIGN KEY ( student_id )
        REFERENCES hr.student ( user_id )
    NOT DEFERRABLE;

ALTER TABLE hr.students_requests
    ADD CONSTRAINT requests_fk2 FOREIGN KEY ( dep_id )
        REFERENCES hr.department ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.roles
    ADD CONSTRAINT roles_fk1 FOREIGN KEY ( user_id )
        REFERENCES hr.users ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.student
    ADD CONSTRAINT student_fk1 FOREIGN KEY ( user_id )
        REFERENCES hr.users ( id )
    NOT DEFERRABLE;

ALTER TABLE hr.user_website
    ADD CONSTRAINT user_website_fk1 FOREIGN KEY ( role )
        REFERENCES hr.roles ( role_id )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             8
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              1
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        1
-- CREATE USER                              3
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 1
