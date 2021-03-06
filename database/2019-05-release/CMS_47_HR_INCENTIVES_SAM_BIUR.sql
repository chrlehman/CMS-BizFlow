/*
 * Performance Tuning
 * Data Type mismatch: Date fields are all varchar2.
 */
create or replace TRIGGER INCENTIVES_SAM_BIUR
BEFORE INSERT OR UPDATE OF JUSTIFICATION_SUPER_QUAL_DESC, JUSTIFICATION_QUAL_COMP_DESC, JUSTIFICATION_PAY_EQUITY_DESC, JUSTIFICATION_MOD_REASON, JUSTIFICATION_MOD_SUMMARY, JUSTIFICATION_MODIFIER_ID
ON INCENTIVES_SAM
FOR EACH ROW
DECLARE
	L_JUSTIFICATION_CRT_ID   VARCHAR2(10);
	L_JUSTIFICATION_CRT_NAME VARCHAR2(100);
	L_JUSTIFICATION_CRT_DATE VARCHAR2(20);
	L_JUSTIFICATION_VER NUMBER(10);
BEGIN
		L_JUSTIFICATION_CRT_ID   := :new.JUSTIFICATION_CRT_ID;
		L_JUSTIFICATION_CRT_NAME := :new.JUSTIFICATION_CRT_NAME;
		L_JUSTIFICATION_CRT_DATE := :new.JUSTIFICATION_CRT_DATE;

    IF ((NVL(:old.JUSTIFICATION_SUPER_QUAL_DESC,' ') <> NVL(:new.JUSTIFICATION_SUPER_QUAL_DESC, ' ')) OR 
		(NVL(:old.JUSTIFICATION_QUAL_COMP_DESC,' ') <> NVL(:new.JUSTIFICATION_QUAL_COMP_DESC, ' ')) OR 
		(NVL(:old.JUSTIFICATION_PAY_EQUITY_DESC,' ') <> NVL(:new.JUSTIFICATION_PAY_EQUITY_DESC, ' ')) OR 
		(NVL(:old.JUSTIFICATION_MOD_REASON,' ') <> NVL(:new.JUSTIFICATION_MOD_REASON, ' ')) OR 
		(NVL(:old.JUSTIFICATION_MOD_SUMMARY,' ') <> NVL(:new.JUSTIFICATION_MOD_SUMMARY, ' ')) ) THEN
      IF (L_JUSTIFICATION_CRT_ID IS NULL) THEN
        L_JUSTIFICATION_CRT_ID   := :new.JUSTIFICATION_LASTMOD_ID;
        L_JUSTIFICATION_CRT_NAME := :new.JUSTIFICATION_LASTMOD_NAME;
        L_JUSTIFICATION_CRT_DATE := TO_CHAR(SYSTIMESTAMP, 'MM/DD/YYYY HH24:MI:SS');
        
        :new.JUSTIFICATION_CRT_ID := L_JUSTIFICATION_CRT_ID;
        :new.JUSTIFICATION_CRT_NAME := L_JUSTIFICATION_CRT_NAME;
        :new.JUSTIFICATION_CRT_DATE := L_JUSTIFICATION_CRT_DATE;
        :new.JUSTIFICATION_CRT_DATE_D := SYSTIMESTAMP; --
        :new.JUSTIFICATION_LASTMOD_DATE := TO_CHAR(SYSTIMESTAMP, 'MM/DD/YYYY HH24:MI:SS');
        :new.JUSTIFICATION_LASTMOD_DATE_D := SYSTIMESTAMP; --new
      ELSE
        IF (:new.JUSTIFICATION_MODIFIER_ID IS NOT NULL) THEN
          IF(:new.JUSTIFICATION_VER = 0) THEN
            L_JUSTIFICATION_CRT_ID   := :new.JUSTIFICATION_CRT_ID;
            L_JUSTIFICATION_CRT_NAME := :new.JUSTIFICATION_CRT_NAME;
            L_JUSTIFICATION_CRT_DATE := :new.JUSTIFICATION_CRT_DATE;
			L_JUSTIFICATION_VER := 1;
          ELSE
            L_JUSTIFICATION_CRT_ID   := :old.JUSTIFICATION_MODIFIER_ID;
            L_JUSTIFICATION_CRT_NAME := :old.JUSTIFICATION_MODIFIER_NAME;
            L_JUSTIFICATION_CRT_DATE := :old.JUSTIFICATION_MODIFIED_DATE;
			L_JUSTIFICATION_VER := :new.JUSTIFICATION_VER + 1;
          END IF;
          
          INSERT INTO INCENTIVES_SAM_JUST_HISTORY
          (
            PROC_ID,
            JUSTIFICATION_VER,
            JUSTIFICATION_MOD_REASON,
            JUSTIFICATION_MOD_SUMMARY,
            JUSTIFICATION_MODIFIER_NAME,
            JUSTIFICATION_MODIFIER_ID,
            JUSTIFICATION_MODIFIED_DATE,
            JUSTIFICATION_MODIFIED_DATE_D, --new
            JUSTIFICATION_SUPER_QUAL_DESC,
            JUSTIFICATION_QUAL_COMP_DESC,
            JUSTIFICATION_PAY_EQUITY_DESC
          )
          VALUES
          (
            :new.PROC_ID,
            L_JUSTIFICATION_VER,
            :old.JUSTIFICATION_MOD_REASON,
            :old.JUSTIFICATION_MOD_SUMMARY,
            L_JUSTIFICATION_CRT_NAME,
            L_JUSTIFICATION_CRT_ID,
            L_JUSTIFICATION_CRT_DATE,
            TO_DATE(L_JUSTIFICATION_CRT_DATE, 'mm/dd/yyyy hh24:mi:ss'),
            :old.JUSTIFICATION_SUPER_QUAL_DESC,
            :old.JUSTIFICATION_QUAL_COMP_DESC,
            :old.JUSTIFICATION_PAY_EQUITY_DESC
          );
          
          :new.JUSTIFICATION_VER	:= L_JUSTIFICATION_VER;
          :new.JUSTIFICATION_LASTMOD_DATE := TO_CHAR(SYSTIMESTAMP, 'MM/DD/YYYY HH24:MI:SS');
          :new.JUSTIFICATION_LASTMOD_DATE_D := SYSTIMESTAMP; --new
        END IF;
      END IF;
    END IF;
		
EXCEPTION
	WHEN OTHERS THEN
		SP_ERROR_LOG();

END;

