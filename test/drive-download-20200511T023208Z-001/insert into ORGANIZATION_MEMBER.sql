insert into ORGANIZATION_MEMBER 
(ORGANIZATION_MEMBER_SEQ,TYPE,ORGANIZATION_SEQ,MEMBER_SEQ) 
select 'TEST-ORGANIZATION_MEMBER-1111112','ORGANIZATION_POSITION_02','TEST-ORGANIZATION-CIPI9401','TEST-MEMBER-1111112' from dual union all 
select 'TEST-ORGANIZATION_MEMBER-1111113','ORGANIZATION_POSITION_MANAGER','TEST-ORGANIZATION-CIPI8S01','TEST-MEMBER-1111113' from dual union all 
select 'TEST-ORGANIZATION_MEMBER-1111114','ORGANIZATION_POSITION_02','TEST-ORGANIZATION-CIPI8S01','TEST-MEMBER-1111114' from dual ; 