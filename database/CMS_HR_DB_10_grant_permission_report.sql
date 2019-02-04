

--=============================================================================
-- Grant privileges on objects under CMS schema to roles
-------------------------------------------------------------------------------


-- privilege for HHS_CMS_HR_RW_ROLE;

GRANT EXECUTE ON HHS_CMS_HR.FN_GET_LOCATION_DSCR TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_LOOKUP_DSCR TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_MEMBER_DSCR TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_GRADE_ADVRT TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_ANNOUNCE_NOT_REQ TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_ANNOUNCE_REQ TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_ANNOUNCE_TYPE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_ASSESS_TYPE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_SUBORG_CD TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_2ND_SUB_ORG TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_CASE_CATEGORY TO HHS_CMS_HR_RW_ROLE;

GRANT SELECT ON HHS_CMS_HR.VW_STRATCON TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_CLASSIFICATION TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ELIGQUAL TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_UNIFIED_REQUESTS_RANK TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_UNIFIED_REQUESTS TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_DATA TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_GEN TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_CNDT_ISSUE TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_APPEAL TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_WGI_DNL TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_MEDDOC TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_PERF_ISSUE TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_INVESTIGATION TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_INFO_REQUEST TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_3RDPARTY_HEAR TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_PROB_ACTION TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_GRIEVANCE TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_ULP TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_LABOR_NEGO TO HHS_CMS_HR_RW_ROLE;

-- privilege for HHS_CMS_HR_DEV_ROLE;

GRANT EXECUTE ON HHS_CMS_HR.FN_GET_LOCATION_DSCR TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_LOOKUP_DSCR TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_MEMBER_DSCR TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_GRADE_ADVRT TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_ANNOUNCE_NOT_REQ TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_ANNOUNCE_REQ TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_ANNOUNCE_TYPE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_ASSESS_TYPE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.FN_GET_SUBORG_CD TO HHS_CMS_HR_DEV_ROLE;

GRANT SELECT ON HHS_CMS_HR.VW_STRATCON TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_CLASSIFICATION TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ELIGQUAL TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_UNIFIED_REQUESTS_RANK TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_UNIFIED_REQUESTS TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_DATA TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_GEN TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_CNDT_ISSUE TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_APPEAL TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_WGI_DNL TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_MEDDOC TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_PERF_ISSUE TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_INVESTIGATION TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_INFO_REQUEST TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_3RDPARTY_HEAR TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_PROB_ACTION TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_GRIEVANCE TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_ULP TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_ERLR_LABOR_NEGO TO HHS_CMS_HR_DEV_ROLE;


-- INCENTIVES
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_COM TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_PCA TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_SAM TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_LE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_COM_TABLE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_PCA_TABLE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_SAM_TABLE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_LE_TABLE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_TABLE TO HHS_CMS_HR_RW_ROLE;

GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_COM TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_PCA TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_SAM TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_LE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_COM_TABLE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_PCA_TABLE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_SAM_TABLE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_LE_TABLE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_TABLE TO HHS_CMS_HR_DEV_ROLE;

