create or replace PROCEDURE SP_UPDATE_PV_ELIGQUAL
  (
      I_PROCID            IN      NUMBER
    , I_FIELD_DATA      IN      XMLTYPE
  )
IS
  V_RLVNTDATANAME        VARCHAR2(100);
  V_VALUE                NVARCHAR2(2000);
  V_VALUE_LOOKUP         NVARCHAR2(2000);
  V_CURRENTDATE          DATE;
  V_CURRENTDATESTR       NVARCHAR2(30);
  V_VALUE_DATE           DATE;
  V_VALUE_DATESTR        NVARCHAR2(30);
  V_REC_CNT              NUMBER(10);
  V_XMLDOC               XMLTYPE;
  V_XMLVALUE             XMLTYPE;
  V_VALUE1               NVARCHAR2(2000);
  V_VALUE2               NVARCHAR2(2000);
  V_VALUE3               NVARCHAR2(2000);
  BEGIN
    --DBMS_OUTPUT.PUT_LINE('==== SP_UPDATE_PV_ELIGQUAL ==============================');
    --DBMS_OUTPUT.PUT_LINE('PARAMETERS ----------------');
    --DBMS_OUTPUT.PUT_LINE('    I_PROCID IS NULL?  = ' || (CASE WHEN I_PROCID IS NULL THEN 'YES' ELSE 'NO' END));
    --DBMS_OUTPUT.PUT_LINE('    I_PROCID           = ' || TO_CHAR(I_PROCID));
    --DBMS_OUTPUT.PUT_LINE('    I_FIELD_DATA       = ' || I_FIELD_DATA.GETCLOBVAL());
    --DBMS_OUTPUT.PUT_LINE(' ----------------');
    --V_XMLDOC := XMLTYPE(I_FIELD_DATA);
    V_XMLDOC := I_FIELD_DATA;


    IF I_PROCID IS NOT NULL AND I_PROCID > 0 THEN
      --DBMS_OUTPUT.PUT_LINE('Starting PV update ----------');

      HHS_CMS_HR.SP_UPDATE_PV_BY_XPATH(I_PROCID, I_FIELD_DATA, 'adminCode', '/DOCUMENT/GENERAL/ADMIN_CD/text()', null);
      HHS_CMS_HR.SP_UPDATE_PV_BY_XPATH(I_PROCID, I_FIELD_DATA, 'cancelReason', '/DOCUMENT/PROCESS_VARIABLE/cancelReason/text()', null);
      HHS_CMS_HR.SP_UPDATE_PV_BY_XPATH(I_PROCID, I_FIELD_DATA, 'feedbackDCO', '/DOCUMENT/PROCESS_VARIABLE/feedbackDCO/text()', null);
      HHS_CMS_HR.SP_UPDATE_PV_BY_XPATH(I_PROCID, I_FIELD_DATA, 'feedbackStaffSpec', '/DOCUMENT/PROCESS_VARIABLE/feedbackStaffSpec/text()', null);
      HHS_CMS_HR.SP_UPDATE_PV_BY_XPATH(I_PROCID, I_FIELD_DATA, 'memIdClassSpec', '/DOCUMENT/GENERAL/CS_ID/text()', null);      
      HHS_CMS_HR.SP_UPDATE_PV_BY_XPATH(I_PROCID, I_FIELD_DATA, 'memIdSelectOff', '/DOCUMENT/GENERAL/SO_ID/text()', null);
      HHS_CMS_HR.SP_UPDATE_PV_BY_XPATH(I_PROCID, I_FIELD_DATA, 'memIdStaffSpec', '/DOCUMENT/GENERAL/SS_ID/text()', null);
      HHS_CMS_HR.SP_UPDATE_PV_BY_XPATH(I_PROCID, I_FIELD_DATA, 'posLocation', '/DOCUMENT/POSITION/LOCATION/text()', null);

      V_RLVNTDATANAME := 'appointmentType';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/GENERAL/AT_ID/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        ---------------------------------
        -- replace with lookup value
        ---------------------------------
        BEGIN
          SELECT TBL_LABEL INTO V_VALUE_LOOKUP
          FROM TBL_LOOKUP
          WHERE TBL_ID = TO_NUMBER(V_VALUE);
          EXCEPTION
          WHEN NO_DATA_FOUND THEN
          V_VALUE_LOOKUP := NULL;
          WHEN OTHERS THEN
          V_VALUE_LOOKUP := NULL;
        END;
        V_VALUE := V_VALUE_LOOKUP;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

      V_RLVNTDATANAME := 'candidateApproved';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/PROCESS_VARIABLE/candidateApproved/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      -------------------------------------------------------------------------------
      -- Only update if not blank to prevent overwriting unintentionally
      -------------------------------------------------------------------------------
      IF V_VALUE IS NOT NULL THEN
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;
      END IF;


      V_RLVNTDATANAME := 'candidateName';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/POSITION/CNDT_FIRST_NM/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
      ELSE
        V_VALUE := NULL;
      END IF;
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/POSITION/CNDT_LAST_NM/text()');
      IF V_VALUE IS NOT NULL AND V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_VALUE || ' ' || V_XMLVALUE.GETSTRINGVAL();
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'classSpecialist';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/GENERAL/CS_ID/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        -------------------------------
        -- participant prefix
        -------------------------------
        V_VALUE := '[U]' || V_XMLVALUE.GETSTRINGVAL();
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'classificationType';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/GENERAL/CT_ID/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        ---------------------------------
        -- replace with lookup value
        ---------------------------------
        BEGIN
          SELECT TBL_LABEL INTO V_VALUE_LOOKUP
          FROM TBL_LOOKUP
          WHERE TBL_ID = TO_NUMBER(V_VALUE);
          EXCEPTION
          WHEN NO_DATA_FOUND THEN
          V_VALUE_LOOKUP := NULL;
          WHEN OTHERS THEN
          V_VALUE_LOOKUP := NULL;
        END;
        V_VALUE := V_VALUE_LOOKUP;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'disqualReason';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/REVIEW/DISQUAL_REASON/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        ---------------------------------
        -- replace with lookup value
        ---------------------------------
        BEGIN
          SELECT TBL_LABEL INTO V_VALUE_LOOKUP
          FROM TBL_LOOKUP
          WHERE TBL_ID = TO_NUMBER(V_VALUE);
          EXCEPTION
          WHEN NO_DATA_FOUND THEN
          V_VALUE_LOOKUP := NULL;
          WHEN OTHERS THEN
          V_VALUE_LOOKUP := NULL;
        END;
        V_VALUE := V_VALUE_LOOKUP;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'eligQualCandidate';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/PROCESS_VARIABLE/eligQualCandidate/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      -------------------------------------------------------------------------------
      -- Only update if not blank to prevent overwriting unintentionally
      -------------------------------------------------------------------------------
      IF V_VALUE IS NOT NULL THEN
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;
      END IF;

      V_RLVNTDATANAME := 'ineligReason';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/REVIEW/INELIG_REASON/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        ---------------------------------
        -- replace with lookup value
        ---------------------------------
        BEGIN
          SELECT TBL_LABEL INTO V_VALUE_LOOKUP
          FROM TBL_LOOKUP
          WHERE TBL_ID = TO_NUMBER(V_VALUE);
          EXCEPTION
          WHEN NO_DATA_FOUND THEN
          V_VALUE_LOOKUP := NULL;
          WHEN OTHERS THEN
          V_VALUE_LOOKUP := NULL;
        END;
        V_VALUE := V_VALUE_LOOKUP;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'lastActivityCompDate';
      BEGIN
        SELECT TO_CHAR(SYSTIMESTAMP AT TIME ZONE 'UTC', 'YYYY/MM/DD HH24:MI:SS') INTO V_VALUE FROM DUAL;
        EXCEPTION
        WHEN OTHERS THEN V_VALUE := NULL;
      END;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

      --V_RLVNTDATANAME := 'memIdExecOff';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/GENERAL/XO_ID/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        SELECT REGEXP_SUBSTR (V_VALUE, '[^,]+', 1, 1) INTO V_VALUE1 FROM DUAL;
        SELECT REGEXP_SUBSTR (V_VALUE, '[^,]+', 1, 2) INTO V_VALUE2 FROM DUAL;
        SELECT REGEXP_SUBSTR (V_VALUE, '[^,]+', 1, 3) INTO V_VALUE3 FROM DUAL;

        V_RLVNTDATANAME := 'memIdExecOff';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE1) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

        IF V_VALUE1 IS NOT NULL THEN
          V_VALUE1 := '[U]' || V_VALUE1;
        END IF;
        V_RLVNTDATANAME := 'execOfficer';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE1) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

        V_RLVNTDATANAME := 'memIdExecOff2';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE2) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

        IF V_VALUE2 IS NOT NULL THEN
          V_VALUE2 := '[U]' || V_VALUE2;
        END IF;
        V_RLVNTDATANAME := 'execOfficer2';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE2) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

        V_RLVNTDATANAME := 'memIdExecOff3';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE3) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

        IF V_VALUE3 IS NOT NULL THEN
          V_VALUE3 := '[U]' || V_VALUE3;
        END IF;
        V_RLVNTDATANAME := 'execOfficer3';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE3) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

      ELSE

        UPDATE BIZFLOW.RLVNTDATA SET VALUE = NULL
        WHERE RLVNTDATANAME in ('memIdExecOff','memIdExecOff2','memIdExecOff3', 'execOfficer','execOfficer2','execOfficer3')
              AND PROCID = I_PROCID;

      END IF;

    V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/GENERAL/HRL_ID/text()');
    IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        SELECT REGEXP_SUBSTR (V_VALUE, '[^,]+', 1, 1) INTO V_VALUE1 FROM DUAL;
        SELECT REGEXP_SUBSTR (V_VALUE, '[^,]+', 1, 2) INTO V_VALUE2 FROM DUAL;
        SELECT REGEXP_SUBSTR (V_VALUE, '[^,]+', 1, 3) INTO V_VALUE3 FROM DUAL;

        V_RLVNTDATANAME := 'memIdHrLiaison';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE1) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

        IF V_VALUE1 IS NOT NULL THEN
          V_VALUE1 := '[U]' || V_VALUE1;
        END IF;
        V_RLVNTDATANAME := 'hrLiaison';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE1) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

        V_RLVNTDATANAME := 'memIdHrLiaison2';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE2) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

        IF V_VALUE2 IS NOT NULL THEN
          V_VALUE2 := '[U]' || V_VALUE2;
        END IF;
        V_RLVNTDATANAME := 'hrLiaison2';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE2) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

        V_RLVNTDATANAME := 'memIdHrLiaison3';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE3) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

        IF V_VALUE3 IS NOT NULL THEN
          V_VALUE3 := '[U]' || V_VALUE3;
        END IF;
        V_RLVNTDATANAME := 'hrLiaison3';
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE3) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;

      ELSE

        UPDATE BIZFLOW.RLVNTDATA SET VALUE = NULL
        WHERE RLVNTDATANAME IN ('memIdHrLiaison', 'memIdHrLiaison2', 'memIdHrLiaison3', 'hrLiaison', 'hrLiaison2', 'hrLiaison3') AND PROCID = I_PROCID;

      END IF;


      V_RLVNTDATANAME := 'posIs';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/POSITION/SUPERVISORY/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        ---------------------------------
        -- replace with lookup value
        ---------------------------------
        BEGIN
          SELECT TBL_LABEL INTO V_VALUE_LOOKUP
          FROM TBL_LOOKUP
          WHERE TBL_ID = TO_NUMBER(V_VALUE);
          EXCEPTION
          WHEN NO_DATA_FOUND THEN
          V_VALUE_LOOKUP := NULL;
          WHEN OTHERS THEN
          V_VALUE_LOOKUP := NULL;
        END;
        V_VALUE := V_VALUE_LOOKUP;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'posSensitivity';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/POSITION/SEC_ID/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        ---------------------------------
        -- replace with lookup value
        ---------------------------------
        BEGIN
          SELECT TBL_LABEL INTO V_VALUE_LOOKUP
          FROM TBL_LOOKUP
          WHERE TBL_ID = TO_NUMBER(V_VALUE);
          EXCEPTION
          WHEN NO_DATA_FOUND THEN
          V_VALUE_LOOKUP := NULL;
          WHEN OTHERS THEN
          V_VALUE_LOOKUP := NULL;
        END;
        V_VALUE := V_VALUE_LOOKUP;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'posSeries';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/POSITION/SERIES/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        ---------------------------------
        -- replace with lookup value
        ---------------------------------
        BEGIN
          SELECT TBL_LABEL INTO V_VALUE_LOOKUP
          FROM TBL_LOOKUP
          --WHERE TBL_ID = TO_NUMBER(V_VALUE);
          WHERE TBL_LTYPE = 'OccupationalSeries' AND TBL_NAME = V_VALUE;
          EXCEPTION
          WHEN NO_DATA_FOUND THEN
          V_VALUE_LOOKUP := NULL;
          WHEN OTHERS THEN
          V_VALUE_LOOKUP := NULL;
        END;
        V_VALUE := V_VALUE_LOOKUP;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'posTitle';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/POSITION/POS_TITLE/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := REPLACE(V_XMLVALUE.GETSTRINGVAL(), '&amp;', '&');
        V_VALUE := REPLACE(V_VALUE, '&lt;', '<');
        V_VALUE := REPLACE(V_VALUE, '&gt;', '>');
        V_VALUE := REPLACE(V_VALUE, '&quot;', '"');
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'requestStatus';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/PROCESS_VARIABLE/requestStatus/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      -------------------------------------------------------------------------------
      -- Only update if not blank to prevent overwriting unintentionally
      -------------------------------------------------------------------------------
      IF V_VALUE IS NOT NULL THEN
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;
      END IF;


      V_RLVNTDATANAME := 'requestStatusDate';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/PROCESS_VARIABLE/requestStatusDate/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        -------------------------------------
        -- even though it is date, do not format or perform GMT conversion
        -------------------------------------
        V_VALUE := V_VALUE;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      -------------------------------------------------------------------------------
      -- Only update if not blank to prevent overwriting unintentionally
      -------------------------------------------------------------------------------
      IF V_VALUE IS NOT NULL THEN
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;
      END IF;


      V_RLVNTDATANAME := 'requestType';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/GENERAL/RT_ID/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        ---------------------------------
        -- replace with lookup value
        ---------------------------------
        BEGIN
          SELECT TBL_LABEL INTO V_VALUE_LOOKUP
          FROM TBL_LOOKUP
          WHERE TBL_ID = TO_NUMBER(V_VALUE);
          EXCEPTION
          WHEN NO_DATA_FOUND THEN
          V_VALUE_LOOKUP := NULL;
          WHEN OTHERS THEN
          V_VALUE_LOOKUP := NULL;
        END;
        V_VALUE := V_VALUE_LOOKUP;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'returnToSO';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/PROCESS_VARIABLE/returnToSO/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      -------------------------------------------------------------------------------
      -- This pv can be updated from multiple workitem
      -- Only update if not blank to prevent overwriting unintentionally
      -------------------------------------------------------------------------------
      IF V_VALUE IS NOT NULL THEN
        UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;
      END IF;


      V_RLVNTDATANAME := 'secondSubOrg';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/GENERAL/ADMIN_CD/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        ---------------------------------
        -- replace with admin code desc lookup value
        ---------------------------------
        BEGIN
          SELECT AC_ADMIN_CD_DESCR INTO V_VALUE_LOOKUP
          FROM ADMIN_CODES
          WHERE AC_ADMIN_CD = SUBSTR(V_VALUE, 1, 3);
          EXCEPTION
          WHEN NO_DATA_FOUND THEN
          V_VALUE_LOOKUP := NULL;
          WHEN OTHERS THEN
          V_VALUE_LOOKUP := NULL;
        END;
        V_VALUE := V_VALUE_LOOKUP;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'selectOfficial';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/GENERAL/SO_ID/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        -------------------------------
        -- participant prefix
        -------------------------------
        V_VALUE := '[U]' || V_XMLVALUE.GETSTRINGVAL();
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      V_RLVNTDATANAME := 'staffSpecialist';
      V_XMLVALUE := I_FIELD_DATA.EXTRACT('/DOCUMENT/GENERAL/SS_ID/text()');
      IF V_XMLVALUE IS NOT NULL THEN
        -------------------------------
        -- participant prefix
        -------------------------------
        --V_VALUE := '[U]' || V_XMLVALUE.GETSTRINGVAL();
        -- If the Job Request is for Special Program, SS_ID may point to User Group,
        -- rather than individual user.  Therefore, lookup
        V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        BEGIN
          SELECT TYPE INTO V_VALUE_LOOKUP FROM BIZFLOW.MEMBER WHERE MEMBERID = V_VALUE;
          EXCEPTION
          WHEN OTHERS THEN
          V_VALUE_LOOKUP := NULL;
        END;

        IF V_VALUE_LOOKUP IS NOT NULL THEN
          V_VALUE := '[' || V_VALUE_LOOKUP || ']' || V_XMLVALUE.GETSTRINGVAL();
        ELSE
          V_VALUE := NULL;
        END IF;
      ELSE
        V_VALUE := NULL;
      END IF;
      --DBMS_OUTPUT.PUT_LINE('    V_RLVNTDATANAME = ' || V_RLVNTDATANAME);
      --DBMS_OUTPUT.PUT_LINE('    V_VALUE         = ' || V_VALUE);
      UPDATE BIZFLOW.RLVNTDATA SET VALUE = UTL_I18N.UNESCAPE_REFERENCE(V_VALUE) WHERE RLVNTDATANAME = V_RLVNTDATANAME AND PROCID = I_PROCID;


      --DBMS_OUTPUT.PUT_LINE('End PV update SP_UPDATE_PV_ELIGQUAL -------------------');

    END IF;

    EXCEPTION
    WHEN OTHERS THEN
    SP_ERROR_LOG();
    --DBMS_OUTPUT.PUT_LINE('Error occurred while executing SP_UPDATE_PV_ELIGQUAL -------------------');
  END;