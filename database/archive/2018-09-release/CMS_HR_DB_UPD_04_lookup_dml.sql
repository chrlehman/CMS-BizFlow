
REM INSERTING into TBL_LOOKUP
SET DEFINE OFF;

INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (721,0,'DisqualificationReason','NOT_SPECIAL_EXPR','The candidate does not meet the specialized experience required for this position.','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (722,0,'DisqualificationReason','NOT_SPECIAL_EXPR_LENGTH','The candidate does not possess the length of specialized experience required for this position.','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (723,0,'DisqualificationReason','NOT_GENERAL_EXPR','The candidate does not meet the general experience required for this position.','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (724,0,'DisqualificationReason','NOT_EDUCATION_REQ','The candidate does not meet the education requirement(s) for this position.','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (725,0,'DisqualificationReason','NOT_MET_SKILL','The candidate''s application does not demonstrate having met the typing skills requirement of this position.','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (726,0,'DisqualificationReason','NOT_QUAL_RESUME','Unable to determine candidate qualifications based on the resume provided.','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (727,0,'ERLRAppealType','Arbitration','Arbitration','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (728,0,'ERLRAppealType','Special Counsel','Special Counsel','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (729,0,'ERLRAppealType','Grievance','Grievance','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (730,0,'ERLRConductIssueActionType','Administrative Leave','Administrative Leave','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (731,0,'ERLRConductIssueActionType','Alternative Discipline','Alternative Discipline(hidden for CMS)','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (732,0,'ERLRConductIssueActionType','Demotion','Demotion','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (733,0,'ERLRConductIssueActionType','Counseling','Counseling','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (734,0,'ERLRConductIssueActionType','Sick Leave Restriction','Sick Leave Restriction','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (735,0,'ERLRConductIssueActionType','Sick Leave Warning','Sick Leave Warning','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (736,0,'ERLRConductIssueActionType','Reprimand','Reprimand','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (737,0,'ERLRConductIssueActionType','Reassignment','Reassignment','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (738,0,'ERLRConductIssueActionType','Removal','Removal','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (739,0,'ERLRConductIssueActionType','Suspension','Suspension','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (740,0,'ERLRConductIssueActionType','Termination','Termination','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (741,0,'ERLRInitialResponseCaseTpe','Administrative Leave','Administrative Leave','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (742,0,'ERLRInitialResponseCaseTpe','Career Ladder Promotion','Career Ladder Promotion','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (743,0,'ERLRInitialResponseCaseTpe','Conduct Issue','Conduct Issue','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (744,0,'ERLRInitialResponseCaseTpe','Formal Investigation','Formal Investigation','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (745,0,'ERLRInitialResponseCaseTpe','Grievance','Grievance','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (746,0,'ERLRInitialResponseCaseTpe','Medical Documentation','Medical Documentation','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (747,0,'ERLRInitialResponseCaseTpe','Information Request','Information Request','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (748,0,'ERLRInitialResponseCaseTpe','Labor Negotiation','Labor Negotiation','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (749,0,'ERLRInitialResponseCaseTpe','Offer of Medical Exam','Offer of Medical Exam','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (750,0,'ERLRInitialResponseCaseTpe','Performance Issue','Performance Issue','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (751,0,'ERLRInitialResponseCaseTpe','Probationary Period','Probationary Period','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (752,0,'ERLRInitialResponseCaseTpe','Reasonable Accommodation','Reasonable Accommodation','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (753,0,'ERLRInitialResponseCaseTpe','Third Party Hearing','Third Party Hearing','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (754,0,'ERLRInitialResponseCaseTpe','Unfair Labor Practices','Unfair Labor Practices','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (755,0,'ERLRInitialResponseCaseTpe','Union Dues Start/Stop','Union Dues Start/Stop','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (756,0,'ERLRInitialResponseCaseTpe','Union Notification','Union Notification','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (757,0,'ERLRInitialResponseCasesStatus','Drafting Document','Drafting Document','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (758,0,'ERLRInitialResponseCasesStatus','Manager/Employee Out of Office','Manager/Employee Out of Office','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (759,0,'ERLRInitialResponseCasesStatus','Manager Review/Drafting Document','Manager Review/Drafting Document','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (760,0,'ERLRInitialResponseCasesStatus','Pending Appeal','Pending Appeal','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (761,0,'ERLRInitialResponseCasesStatus','Pending Customer Decision','Pending Customer Decision','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (762,0,'ERLRInitialResponseCasesStatus','Pending Grievance Decision','Pending Grievance Decision','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (763,0,'ERLRInitialResponseCasesStatus','Pending IG Determination','Pending IG Determination','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (764,0,'ERLRInitialResponseCasesStatus','Pending Internal View','Pending Internal View','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (765,0,'ERLRInitialResponseCasesStatus','Pending OGC Opinion','Pending OGC Opinion','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (766,0,'ERLRInitialResponseCasesStatus',' Pending Oral Presentation',' Pending Oral Presentation','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (767,0,'ERLRInitialResponseCasesStatus','Pending OSC Investigation','Pending OSC Investigation','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (768,0,'ERLRInitialResponseCasesStatus','Reasonable Accommodation','Reasonable Accommodation','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (769,0,'ERLRInitialResponseCasesStatus','Third Party Hearing','Third Party Hearing','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (770,0,'ERLRInitialResponseCasesStatus','Unfair Labor Practices','Unfair Labor Practices','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (771,0,'ERLRInitialResponseCasesStatus','Union Dues Start/Stop','Union Dues Start/Stop','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (772,0,'ERLRInitialResponseCasesStatus','Union Notification','Union Notification','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
INSERT INTO TBL_LOOKUP (TBL_ID,TBL_PARENT_ID,TBL_LTYPE,TBL_NAME,TBL_LABEL,TBL_ACTIVE,TBL_DISP_ORDER,TBL_MANDATORY,TBL_REGION,TBL_CATEGORY,TBL_EFFECTIVE_DT,TBL_EXPIRATION_DT) 
VALUES (773,0,'ERLRAppealType','MSPB','MSPB','1',null,'N',null,null,TO_DATE('2017-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2050-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
;
