% % Spectral slope (for Figure 11)
% Calculate SSM_kw, Pr_kw, and ET_kw differences and prepare for significance test
[BCC_CSM_SMPdif1,BCC_CSM_SMPdif1_r]=significance_prepare(BCC_CSM_new_mP1,SMP1);
[BCC_CSM_SMPdif2,BCC_CSM_SMPdif2_r]=significance_prepare(BCC_CSM_new_mP2,SMP2);
[BCC_CSM_SMPdif3,BCC_CSM_SMPdif3_r]=significance_prepare(BCC_CSM_new_mP3,SMP3);
[BCC_CSM_PrPdif1,BCC_CSM_PrPdif1_r]=significance_prepare(BCC_CSM_new_pP1,PrP1_new);
[BCC_CSM_PrPdif2,BCC_CSM_PrPdif2_r]=significance_prepare(BCC_CSM_new_pP2,PrP2_new);
[BCC_CSM_PrPdif3,BCC_CSM_PrPdif3_r]=significance_prepare(BCC_CSM_new_pP3,PrP3_new);
[BCC_CSM_ETPdif1,BCC_CSM_ETPdif1_r]=significance_prepare(BCC_CSM_new_hP1,ETP1_new);
[BCC_CSM_ETPdif2,BCC_CSM_ETPdif2_r]=significance_prepare(BCC_CSM_new_hP2,ETP2_new);
[BCC_CSM_ETPdif3,BCC_CSM_ETPdif3_r]=significance_prepare(BCC_CSM_new_hP3,ETP3_new);
[BNU_ESM_SMPdif1,BNU_ESM_SMPdif1_r]=significance_prepare(BNU_ESM_new_mP1,SMP1);
[BNU_ESM_SMPdif2,BNU_ESM_SMPdif2_r]=significance_prepare(BNU_ESM_new_mP2,SMP2);
[BNU_ESM_SMPdif3,BNU_ESM_SMPdif3_r]=significance_prepare(BNU_ESM_new_mP3,SMP3);
[BNU_ESM_PrPdif1,BNU_ESM_PrPdif1_r]=significance_prepare(BNU_ESM_new_pP1,PrP1_new);
[BNU_ESM_PrPdif2,BNU_ESM_PrPdif2_r]=significance_prepare(BNU_ESM_new_pP2,PrP2_new);
[BNU_ESM_PrPdif3,BNU_ESM_PrPdif3_r]=significance_prepare(BNU_ESM_new_pP3,PrP3_new);
[BNU_ESM_ETPdif1,BNU_ESM_ETPdif1_r]=significance_prepare(BNU_ESM_new_hP1,ETP1_new);
[BNU_ESM_ETPdif2,BNU_ESM_ETPdif2_r]=significance_prepare(BNU_ESM_new_hP2,ETP2_new);
[BNU_ESM_ETPdif3,BNU_ESM_ETPdif3_r]=significance_prepare(BNU_ESM_new_hP3,ETP3_new);
[CanESM2_SMPdif1,CanESM2_SMPdif1_r]=significance_prepare(CanESM2_new_mP1,SMP1);
[CanESM2_SMPdif2,CanESM2_SMPdif2_r]=significance_prepare(CanESM2_new_mP2,SMP2);
[CanESM2_SMPdif3,CanESM2_SMPdif3_r]=significance_prepare(CanESM2_new_mP3,SMP3);
[CanESM2_PrPdif1,CanESM2_PrPdif1_r]=significance_prepare(CanESM2_new_pP1,PrP1_new);
[CanESM2_PrPdif2,CanESM2_PrPdif2_r]=significance_prepare(CanESM2_new_pP2,PrP2_new);
[CanESM2_PrPdif3,CanESM2_PrPdif3_r]=significance_prepare(CanESM2_new_pP3,PrP3_new);
[CanESM2_ETPdif1,CanESM2_ETPdif1_r]=significance_prepare(CanESM2_new_hP1,ETP1_new);
[CanESM2_ETPdif2,CanESM2_ETPdif2_r]=significance_prepare(CanESM2_new_hP2,ETP2_new);
[CanESM2_ETPdif3,CanESM2_ETPdif3_r]=significance_prepare(CanESM2_new_hP3,ETP3_new);
[CNRM_CM5_SMPdif1,CNRM_CM5_SMPdif1_r]=significance_prepare(CNRM_CM5_new_mP1,SMP1);
[CNRM_CM5_SMPdif2,CNRM_CM5_SMPdif2_r]=significance_prepare(CNRM_CM5_new_mP2,SMP2);
[CNRM_CM5_SMPdif3,CNRM_CM5_SMPdif3_r]=significance_prepare(CNRM_CM5_new_mP3,SMP3);
[CNRM_CM5_PrPdif1,CNRM_CM5_PrPdif1_r]=significance_prepare(CNRM_CM5_new_pP1,PrP1_new);
[CNRM_CM5_PrPdif2,CNRM_CM5_PrPdif2_r]=significance_prepare(CNRM_CM5_new_pP2,PrP2_new);
[CNRM_CM5_PrPdif3,CNRM_CM5_PrPdif3_r]=significance_prepare(CNRM_CM5_new_pP3,PrP3_new);
[CNRM_CM5_ETPdif1,CNRM_CM5_ETPdif1_r]=significance_prepare(CNRM_CM5_new_hP1,ETP1_new);
[CNRM_CM5_ETPdif2,CNRM_CM5_ETPdif2_r]=significance_prepare(CNRM_CM5_new_hP2,ETP2_new);
[CNRM_CM5_ETPdif3,CNRM_CM5_ETPdif3_r]=significance_prepare(CNRM_CM5_new_hP3,ETP3_new);
[CSIRO_Mk_SMPdif1,CSIRO_Mk_SMPdif1_r]=significance_prepare(CSIRO_Mk_new_mP1,SMP1);
[CSIRO_Mk_SMPdif2,CSIRO_Mk_SMPdif2_r]=significance_prepare(CSIRO_Mk_new_mP2,SMP2);
[CSIRO_Mk_SMPdif3,CSIRO_Mk_SMPdif3_r]=significance_prepare(CSIRO_Mk_new_mP3,SMP3);
[CSIRO_Mk_PrPdif1,CSIRO_Mk_PrPdif1_r]=significance_prepare(CSIRO_Mk_new_pP1,PrP1_new);
[CSIRO_Mk_PrPdif2,CSIRO_Mk_PrPdif2_r]=significance_prepare(CSIRO_Mk_new_pP2,PrP2_new);
[CSIRO_Mk_PrPdif3,CSIRO_Mk_PrPdif3_r]=significance_prepare(CSIRO_Mk_new_pP3,PrP3_new);
[CSIRO_Mk_ETPdif1,CSIRO_Mk_ETPdif1_r]=significance_prepare(CSIRO_Mk_new_hP1,ETP1_new);
[CSIRO_Mk_ETPdif2,CSIRO_Mk_ETPdif2_r]=significance_prepare(CSIRO_Mk_new_hP2,ETP2_new);
[CSIRO_Mk_ETPdif3,CSIRO_Mk_ETPdif3_r]=significance_prepare(CSIRO_Mk_new_hP3,ETP3_new);
[GFDL_CM3_SMPdif1,GFDL_CM3_SMPdif1_r]=significance_prepare(GFDL_CM3_new_mP1,SMP1);
[GFDL_CM3_SMPdif2,GFDL_CM3_SMPdif2_r]=significance_prepare(GFDL_CM3_new_mP2,SMP2);
[GFDL_CM3_SMPdif3,GFDL_CM3_SMPdif3_r]=significance_prepare(GFDL_CM3_new_mP3,SMP3);
[GFDL_CM3_PrPdif1,GFDL_CM3_PrPdif1_r]=significance_prepare(GFDL_CM3_new_pP1,PrP1_new);
[GFDL_CM3_PrPdif2,GFDL_CM3_PrPdif2_r]=significance_prepare(GFDL_CM3_new_pP2,PrP2_new);
[GFDL_CM3_PrPdif3,GFDL_CM3_PrPdif3_r]=significance_prepare(GFDL_CM3_new_pP3,PrP3_new);
[GFDL_CM3_ETPdif1,GFDL_CM3_ETPdif1_r]=significance_prepare(GFDL_CM3_new_hP1,ETP1_new);
[GFDL_CM3_ETPdif2,GFDL_CM3_ETPdif2_r]=significance_prepare(GFDL_CM3_new_hP2,ETP2_new);
[GFDL_CM3_ETPdif3,GFDL_CM3_ETPdif3_r]=significance_prepare(GFDL_CM3_new_hP3,ETP3_new);
[GFDL_ESM2G_SMPdif1,GFDL_ESM2G_SMPdif1_r]=significance_prepare(GFDL_ESM2G_new_mP1,SMP1);
[GFDL_ESM2G_SMPdif2,GFDL_ESM2G_SMPdif2_r]=significance_prepare(GFDL_ESM2G_new_mP2,SMP2);
[GFDL_ESM2G_SMPdif3,GFDL_ESM2G_SMPdif3_r]=significance_prepare(GFDL_ESM2G_new_mP3,SMP3);
[GFDL_ESM2G_PrPdif1,GFDL_ESM2G_PrPdif1_r]=significance_prepare(GFDL_ESM2G_new_pP1,PrP1_new);
[GFDL_ESM2G_PrPdif2,GFDL_ESM2G_PrPdif2_r]=significance_prepare(GFDL_ESM2G_new_pP2,PrP2_new);
[GFDL_ESM2G_PrPdif3,GFDL_ESM2G_PrPdif3_r]=significance_prepare(GFDL_ESM2G_new_pP3,PrP3_new);
[GFDL_ESM2G_ETPdif1,GFDL_ESM2G_ETPdif1_r]=significance_prepare(GFDL_ESM2G_new_hP1,ETP1_new);
[GFDL_ESM2G_ETPdif2,GFDL_ESM2G_ETPdif2_r]=significance_prepare(GFDL_ESM2G_new_hP2,ETP2_new);
[GFDL_ESM2G_ETPdif3,GFDL_ESM2G_ETPdif3_r]=significance_prepare(GFDL_ESM2G_new_hP3,ETP3_new);
[GFDL_ESM2M_SMPdif1,GFDL_ESM2M_SMPdif1_r]=significance_prepare(GFDL_ESM2M_new_mP1,SMP1);
[GFDL_ESM2M_SMPdif2,GFDL_ESM2M_SMPdif2_r]=significance_prepare(GFDL_ESM2M_new_mP2,SMP2);
[GFDL_ESM2M_SMPdif3,GFDL_ESM2M_SMPdif3_r]=significance_prepare(GFDL_ESM2M_new_mP3,SMP3);
[GFDL_ESM2M_PrPdif1,GFDL_ESM2M_PrPdif1_r]=significance_prepare(GFDL_ESM2M_new_pP1,PrP1_new);
[GFDL_ESM2M_PrPdif2,GFDL_ESM2M_PrPdif2_r]=significance_prepare(GFDL_ESM2M_new_pP2,PrP2_new);
[GFDL_ESM2M_PrPdif3,GFDL_ESM2M_PrPdif3_r]=significance_prepare(GFDL_ESM2M_new_pP3,PrP3_new);
[GFDL_ESM2M_ETPdif1,GFDL_ESM2M_ETPdif1_r]=significance_prepare(GFDL_ESM2M_new_hP1,ETP1_new);
[GFDL_ESM2M_ETPdif2,GFDL_ESM2M_ETPdif2_r]=significance_prepare(GFDL_ESM2M_new_hP2,ETP2_new);
[GFDL_ESM2M_ETPdif3,GFDL_ESM2M_ETPdif3_r]=significance_prepare(GFDL_ESM2M_new_hP3,ETP3_new);
[HadGEM2_CC_SMPdif1,HadGEM2_CC_SMPdif1_r]=significance_prepare(HadGEM2_CC_new_mP1,SMP1);
[HadGEM2_CC_SMPdif2,HadGEM2_CC_SMPdif2_r]=significance_prepare(HadGEM2_CC_new_mP2,SMP2);
[HadGEM2_CC_SMPdif3,HadGEM2_CC_SMPdif3_r]=significance_prepare(HadGEM2_CC_new_mP3,SMP3);
[HadGEM2_CC_PrPdif1,HadGEM2_CC_PrPdif1_r]=significance_prepare(HadGEM2_CC_new_pP1,PrP1_new);
[HadGEM2_CC_PrPdif2,HadGEM2_CC_PrPdif2_r]=significance_prepare(HadGEM2_CC_new_pP2,PrP2_new);
[HadGEM2_CC_PrPdif3,HadGEM2_CC_PrPdif3_r]=significance_prepare(HadGEM2_CC_new_pP3,PrP3_new);
[HadGEM2_CC_ETPdif1,HadGEM2_CC_ETPdif1_r]=significance_prepare(HadGEM2_CC_new_hP1,ETP1_new);
[HadGEM2_CC_ETPdif2,HadGEM2_CC_ETPdif2_r]=significance_prepare(HadGEM2_CC_new_hP2,ETP2_new);
[HadGEM2_CC_ETPdif3,HadGEM2_CC_ETPdif3_r]=significance_prepare(HadGEM2_CC_new_hP3,ETP3_new);
[HadGEM2_ES_SMPdif1,HadGEM2_ES_SMPdif1_r]=significance_prepare(HadGEM2_ES_new_mP1,SMP1);
[HadGEM2_ES_SMPdif2,HadGEM2_ES_SMPdif2_r]=significance_prepare(HadGEM2_ES_new_mP2,SMP2);
[HadGEM2_ES_SMPdif3,HadGEM2_ES_SMPdif3_r]=significance_prepare(HadGEM2_ES_new_mP3,SMP3);
[HadGEM2_ES_PrPdif1,HadGEM2_ES_PrPdif1_r]=significance_prepare(HadGEM2_ES_new_pP1,PrP1_new);
[HadGEM2_ES_PrPdif2,HadGEM2_ES_PrPdif2_r]=significance_prepare(HadGEM2_ES_new_pP2,PrP2_new);
[HadGEM2_ES_PrPdif3,HadGEM2_ES_PrPdif3_r]=significance_prepare(HadGEM2_ES_new_pP3,PrP3_new);
[HadGEM2_ES_ETPdif1,HadGEM2_ES_ETPdif1_r]=significance_prepare(HadGEM2_ES_new_hP1,ETP1_new);
[HadGEM2_ES_ETPdif2,HadGEM2_ES_ETPdif2_r]=significance_prepare(HadGEM2_ES_new_hP2,ETP2_new);
[HadGEM2_ES_ETPdif3,HadGEM2_ES_ETPdif3_r]=significance_prepare(HadGEM2_ES_new_hP3,ETP3_new);
[inmcm4_SMPdif1,inmcm4_SMPdif1_r]=significance_prepare(inmcm4_new_mP1,SMP1);
[inmcm4_SMPdif2,inmcm4_SMPdif2_r]=significance_prepare(inmcm4_new_mP2,SMP2);
[inmcm4_SMPdif3,inmcm4_SMPdif3_r]=significance_prepare(inmcm4_new_mP3,SMP3);
[inmcm4_PrPdif1,inmcm4_PrPdif1_r]=significance_prepare(inmcm4_new_pP1,PrP1_new);
[inmcm4_PrPdif2,inmcm4_PrPdif2_r]=significance_prepare(inmcm4_new_pP2,PrP2_new);
[inmcm4_PrPdif3,inmcm4_PrPdif3_r]=significance_prepare(inmcm4_new_pP3,PrP3_new);
[inmcm4_ETPdif1,inmcm4_ETPdif1_r]=significance_prepare(inmcm4_new_hP1,ETP1_new);
[inmcm4_ETPdif2,inmcm4_ETPdif2_r]=significance_prepare(inmcm4_new_hP2,ETP2_new);
[inmcm4_ETPdif3,inmcm4_ETPdif3_r]=significance_prepare(inmcm4_new_hP3,ETP3_new);
[MIROC5_SMPdif1,MIROC5_SMPdif1_r]=significance_prepare(MIROC5_new_mP1,SMP1);
[MIROC5_SMPdif2,MIROC5_SMPdif2_r]=significance_prepare(MIROC5_new_mP2,SMP2);
[MIROC5_SMPdif3,MIROC5_SMPdif3_r]=significance_prepare(MIROC5_new_mP3,SMP3);
[MIROC5_PrPdif1,MIROC5_PrPdif1_r]=significance_prepare(MIROC5_new_pP1,PrP1_new);
[MIROC5_PrPdif2,MIROC5_PrPdif2_r]=significance_prepare(MIROC5_new_pP2,PrP2_new);
[MIROC5_PrPdif3,MIROC5_PrPdif3_r]=significance_prepare(MIROC5_new_pP3,PrP3_new);
[MIROC5_ETPdif1,MIROC5_ETPdif1_r]=significance_prepare(MIROC5_new_hP1,ETP1_new);
[MIROC5_ETPdif2,MIROC5_ETPdif2_r]=significance_prepare(MIROC5_new_hP2,ETP2_new);
[MIROC5_ETPdif3,MIROC5_ETPdif3_r]=significance_prepare(MIROC5_new_hP3,ETP3_new);
[MIROC_ESM_SMPdif1,MIROC_ESM_SMPdif1_r]=significance_prepare(MIROC_ESM_new_mP1,SMP1);
[MIROC_ESM_SMPdif2,MIROC_ESM_SMPdif2_r]=significance_prepare(MIROC_ESM_new_mP2,SMP2);
[MIROC_ESM_SMPdif3,MIROC_ESM_SMPdif3_r]=significance_prepare(MIROC_ESM_new_mP3,SMP3);
[MIROC_ESM_PrPdif1,MIROC_ESM_PrPdif1_r]=significance_prepare(MIROC_ESM_new_pP1,PrP1_new);
[MIROC_ESM_PrPdif2,MIROC_ESM_PrPdif2_r]=significance_prepare(MIROC_ESM_new_pP2,PrP2_new);
[MIROC_ESM_PrPdif3,MIROC_ESM_PrPdif3_r]=significance_prepare(MIROC_ESM_new_pP3,PrP3_new);
[MIROC_ESM_ETPdif1,MIROC_ESM_ETPdif1_r]=significance_prepare(MIROC_ESM_new_hP1,ETP1_new);
[MIROC_ESM_ETPdif2,MIROC_ESM_ETPdif2_r]=significance_prepare(MIROC_ESM_new_hP2,ETP2_new);
[MIROC_ESM_ETPdif3,MIROC_ESM_ETPdif3_r]=significance_prepare(MIROC_ESM_new_hP3,ETP3_new);
[MIROC_ESM_CHEM_SMPdif1,MIROC_ESM_CHEM_SMPdif1_r]=significance_prepare(MIROC_ESM_CHEM_new_mP1,SMP1);
[MIROC_ESM_CHEM_SMPdif2,MIROC_ESM_CHEM_SMPdif2_r]=significance_prepare(MIROC_ESM_CHEM_new_mP2,SMP2);
[MIROC_ESM_CHEM_SMPdif3,MIROC_ESM_CHEM_SMPdif3_r]=significance_prepare(MIROC_ESM_CHEM_new_mP3,SMP3);
[MIROC_ESM_CHEM_PrPdif1,MIROC_ESM_CHEM_PrPdif1_r]=significance_prepare(MIROC_ESM_CHEM_new_pP1,PrP1_new);
[MIROC_ESM_CHEM_PrPdif2,MIROC_ESM_CHEM_PrPdif2_r]=significance_prepare(MIROC_ESM_CHEM_new_pP2,PrP2_new);
[MIROC_ESM_CHEM_PrPdif3,MIROC_ESM_CHEM_PrPdif3_r]=significance_prepare(MIROC_ESM_CHEM_new_pP3,PrP3_new);
[MIROC_ESM_CHEM_ETPdif1,MIROC_ESM_CHEM_ETPdif1_r]=significance_prepare(MIROC_ESM_CHEM_new_hP1,ETP1_new);
[MIROC_ESM_CHEM_ETPdif2,MIROC_ESM_CHEM_ETPdif2_r]=significance_prepare(MIROC_ESM_CHEM_new_hP2,ETP2_new);
[MIROC_ESM_CHEM_ETPdif3,MIROC_ESM_CHEM_ETPdif3_r]=significance_prepare(MIROC_ESM_CHEM_new_hP3,ETP3_new);
[MRI_CGCM3_SMPdif1,MRI_CGCM3_SMPdif1_r]=significance_prepare(MRI_CGCM3_new_mP1,SMP1);
[MRI_CGCM3_SMPdif2,MRI_CGCM3_SMPdif2_r]=significance_prepare(MRI_CGCM3_new_mP2,SMP2);
[MRI_CGCM3_SMPdif3,MRI_CGCM3_SMPdif3_r]=significance_prepare(MRI_CGCM3_new_mP3,SMP3);
[MRI_CGCM3_PrPdif1,MRI_CGCM3_PrPdif1_r]=significance_prepare(MRI_CGCM3_new_pP1,PrP1_new);
[MRI_CGCM3_PrPdif2,MRI_CGCM3_PrPdif2_r]=significance_prepare(MRI_CGCM3_new_pP2,PrP2_new);
[MRI_CGCM3_PrPdif3,MRI_CGCM3_PrPdif3_r]=significance_prepare(MRI_CGCM3_new_pP3,PrP3_new);
[MRI_CGCM3_ETPdif1,MRI_CGCM3_ETPdif1_r]=significance_prepare(MRI_CGCM3_new_hP1,ETP1_new);
[MRI_CGCM3_ETPdif2,MRI_CGCM3_ETPdif2_r]=significance_prepare(MRI_CGCM3_new_hP2,ETP2_new);
[MRI_CGCM3_ETPdif3,MRI_CGCM3_ETPdif3_r]=significance_prepare(MRI_CGCM3_new_hP3,ETP3_new);
[MRI_ESM1_SMPdif1,MRI_ESM1_SMPdif1_r]=significance_prepare(MRI_ESM1_new_mP1,SMP1);
[MRI_ESM1_SMPdif2,MRI_ESM1_SMPdif2_r]=significance_prepare(MRI_ESM1_new_mP2,SMP2);
[MRI_ESM1_SMPdif3,MRI_ESM1_SMPdif3_r]=significance_prepare(MRI_ESM1_new_mP3,SMP3);
[MRI_ESM1_PrPdif1,MRI_ESM1_PrPdif1_r]=significance_prepare(MRI_ESM1_new_pP1,PrP1_new);
[MRI_ESM1_PrPdif2,MRI_ESM1_PrPdif2_r]=significance_prepare(MRI_ESM1_new_pP2,PrP2_new);
[MRI_ESM1_PrPdif3,MRI_ESM1_PrPdif3_r]=significance_prepare(MRI_ESM1_new_pP3,PrP3_new);
[MRI_ESM1_ETPdif1,MRI_ESM1_ETPdif1_r]=significance_prepare(MRI_ESM1_new_hP1,ETP1_new);
[MRI_ESM1_ETPdif2,MRI_ESM1_ETPdif2_r]=significance_prepare(MRI_ESM1_new_hP2,ETP2_new);
[MRI_ESM1_ETPdif3,MRI_ESM1_ETPdif3_r]=significance_prepare(MRI_ESM1_new_hP3,ETP3_new);
[NorESM1_M_SMPdif1,NorESM1_M_SMPdif1_r]=significance_prepare(NorESM1_M_new_mP1,SMP1);
[NorESM1_M_SMPdif2,NorESM1_M_SMPdif2_r]=significance_prepare(NorESM1_M_new_mP2,SMP2);
[NorESM1_M_SMPdif3,NorESM1_M_SMPdif3_r]=significance_prepare(NorESM1_M_new_mP3,SMP3);
[NorESM1_M_PrPdif1,NorESM1_M_PrPdif1_r]=significance_prepare(NorESM1_M_new_pP1,PrP1_new);
[NorESM1_M_PrPdif2,NorESM1_M_PrPdif2_r]=significance_prepare(NorESM1_M_new_pP2,PrP2_new);
[NorESM1_M_PrPdif3,NorESM1_M_PrPdif3_r]=significance_prepare(NorESM1_M_new_pP3,PrP3_new);
[NorESM1_M_ETPdif1,NorESM1_M_ETPdif1_r]=significance_prepare(NorESM1_M_new_hP1,ETP1_new);
[NorESM1_M_ETPdif2,NorESM1_M_ETPdif2_r]=significance_prepare(NorESM1_M_new_hP2,ETP2_new);
[NorESM1_M_ETPdif3,NorESM1_M_ETPdif3_r]=significance_prepare(NorESM1_M_new_hP3,ETP3_new);
% Do significance test for SSM_kw, Pr_kw, and ET_kw differences
SMPdif1_r=[BCC_CSM_SMPdif1_r,BNU_ESM_SMPdif1_r,CanESM2_SMPdif1_r,CNRM_CM5_SMPdif1_r,CSIRO_Mk_SMPdif1_r,GFDL_CM3_SMPdif1_r,GFDL_ESM2G_SMPdif1_r,GFDL_ESM2M_SMPdif1_r,HadGEM2_CC_SMPdif1_r,HadGEM2_ES_SMPdif1_r,inmcm4_SMPdif1_r,MIROC5_SMPdif1_r,MIROC_ESM_SMPdif1_r,MIROC_ESM_CHEM_SMPdif1_r,MRI_CGCM3_SMPdif1_r,MRI_ESM1_SMPdif1_r,NorESM1_M_SMPdif1_r];
SMPdif2_r=[BCC_CSM_SMPdif2_r,BNU_ESM_SMPdif2_r,CanESM2_SMPdif2_r,CNRM_CM5_SMPdif2_r,CSIRO_Mk_SMPdif2_r,GFDL_CM3_SMPdif2_r,GFDL_ESM2G_SMPdif2_r,GFDL_ESM2M_SMPdif2_r,HadGEM2_CC_SMPdif2_r,HadGEM2_ES_SMPdif2_r,inmcm4_SMPdif2_r,MIROC5_SMPdif2_r,MIROC_ESM_SMPdif2_r,MIROC_ESM_CHEM_SMPdif2_r,MRI_CGCM3_SMPdif2_r,MRI_ESM1_SMPdif2_r,NorESM1_M_SMPdif2_r];
SMPdif3_r=[BCC_CSM_SMPdif3_r,BNU_ESM_SMPdif3_r,CanESM2_SMPdif3_r,CNRM_CM5_SMPdif3_r,CSIRO_Mk_SMPdif3_r,GFDL_CM3_SMPdif3_r,GFDL_ESM2G_SMPdif3_r,GFDL_ESM2M_SMPdif3_r,HadGEM2_CC_SMPdif3_r,HadGEM2_ES_SMPdif3_r,inmcm4_SMPdif3_r,MIROC5_SMPdif3_r,MIROC_ESM_SMPdif3_r,MIROC_ESM_CHEM_SMPdif3_r,MRI_CGCM3_SMPdif3_r,MRI_ESM1_SMPdif3_r,NorESM1_M_SMPdif3_r];
[SMPdif1_positive_pct,SMPdif1_negative_pct]=significance_test(SMPdif1_r);
[SMPdif2_positive_pct,SMPdif2_negative_pct]=significance_test(SMPdif2_r);
[SMPdif3_positive_pct,SMPdif3_negative_pct]=significance_test(SMPdif3_r);
PrPdif1_r=[BCC_CSM_PrPdif1_r,BNU_ESM_PrPdif1_r,CanESM2_PrPdif1_r,CNRM_CM5_PrPdif1_r,CSIRO_Mk_PrPdif1_r,GFDL_CM3_PrPdif1_r,GFDL_ESM2G_PrPdif1_r,GFDL_ESM2M_PrPdif1_r,HadGEM2_CC_PrPdif1_r,HadGEM2_ES_PrPdif1_r,inmcm4_PrPdif1_r,MIROC5_PrPdif1_r,MIROC_ESM_PrPdif1_r,MIROC_ESM_CHEM_PrPdif1_r,MRI_CGCM3_PrPdif1_r,MRI_ESM1_PrPdif1_r,NorESM1_M_PrPdif1_r];
PrPdif2_r=[BCC_CSM_PrPdif2_r,BNU_ESM_PrPdif2_r,CanESM2_PrPdif2_r,CNRM_CM5_PrPdif2_r,CSIRO_Mk_PrPdif2_r,GFDL_CM3_PrPdif2_r,GFDL_ESM2G_PrPdif2_r,GFDL_ESM2M_PrPdif2_r,HadGEM2_CC_PrPdif2_r,HadGEM2_ES_PrPdif2_r,inmcm4_PrPdif2_r,MIROC5_PrPdif2_r,MIROC_ESM_PrPdif2_r,MIROC_ESM_CHEM_PrPdif2_r,MRI_CGCM3_PrPdif2_r,MRI_ESM1_PrPdif2_r,NorESM1_M_PrPdif2_r];
PrPdif3_r=[BCC_CSM_PrPdif3_r,BNU_ESM_PrPdif3_r,CanESM2_PrPdif3_r,CNRM_CM5_PrPdif3_r,CSIRO_Mk_PrPdif3_r,GFDL_CM3_PrPdif3_r,GFDL_ESM2G_PrPdif3_r,GFDL_ESM2M_PrPdif3_r,HadGEM2_CC_PrPdif3_r,HadGEM2_ES_PrPdif3_r,inmcm4_PrPdif3_r,MIROC5_PrPdif3_r,MIROC_ESM_PrPdif3_r,MIROC_ESM_CHEM_PrPdif3_r,MRI_CGCM3_PrPdif3_r,MRI_ESM1_PrPdif3_r,NorESM1_M_PrPdif3_r];
[PrPdif1_positive_pct,PrPdif1_negative_pct]=significance_test(PrPdif1_r);
[PrPdif2_positive_pct,PrPdif2_negative_pct]=significance_test(PrPdif2_r);
[PrPdif3_positive_pct,PrPdif3_negative_pct]=significance_test(PrPdif3_r);
ETPdif1_r=[BCC_CSM_ETPdif1_r,BNU_ESM_ETPdif1_r,CanESM2_ETPdif1_r,CNRM_CM5_ETPdif1_r,CSIRO_Mk_ETPdif1_r,GFDL_CM3_ETPdif1_r,GFDL_ESM2G_ETPdif1_r,GFDL_ESM2M_ETPdif1_r,HadGEM2_CC_ETPdif1_r,HadGEM2_ES_ETPdif1_r,inmcm4_ETPdif1_r,MIROC5_ETPdif1_r,MIROC_ESM_ETPdif1_r,MIROC_ESM_CHEM_ETPdif1_r,MRI_CGCM3_ETPdif1_r,MRI_ESM1_ETPdif1_r,NorESM1_M_ETPdif1_r];
ETPdif2_r=[BCC_CSM_ETPdif2_r,BNU_ESM_ETPdif2_r,CanESM2_ETPdif2_r,CNRM_CM5_ETPdif2_r,CSIRO_Mk_ETPdif2_r,GFDL_CM3_ETPdif2_r,GFDL_ESM2G_ETPdif2_r,GFDL_ESM2M_ETPdif2_r,HadGEM2_CC_ETPdif2_r,HadGEM2_ES_ETPdif2_r,inmcm4_ETPdif2_r,MIROC5_ETPdif2_r,MIROC_ESM_ETPdif2_r,MIROC_ESM_CHEM_ETPdif2_r,MRI_CGCM3_ETPdif2_r,MRI_ESM1_ETPdif2_r,NorESM1_M_ETPdif2_r];
ETPdif3_r=[BCC_CSM_ETPdif3_r,BNU_ESM_ETPdif3_r,CanESM2_ETPdif3_r,CNRM_CM5_ETPdif3_r,CSIRO_Mk_ETPdif3_r,GFDL_CM3_ETPdif3_r,GFDL_ESM2G_ETPdif3_r,GFDL_ESM2M_ETPdif3_r,HadGEM2_CC_ETPdif3_r,HadGEM2_ES_ETPdif3_r,inmcm4_ETPdif3_r,MIROC5_ETPdif3_r,MIROC_ESM_ETPdif3_r,MIROC_ESM_CHEM_ETPdif3_r,MRI_CGCM3_ETPdif3_r,MRI_ESM1_ETPdif3_r,NorESM1_M_ETPdif3_r];
[ETPdif1_positive_pct,ETPdif1_negative_pct]=significance_test(ETPdif1_r);
[ETPdif2_positive_pct,ETPdif2_negative_pct]=significance_test(ETPdif2_r);
[ETPdif3_positive_pct,ETPdif3_negative_pct]=significance_test(ETPdif3_r);

% % Functions
function [model_dif,model_dif_r]=significance_prepare(model_n,obv_n)
model_dif=model_n-obv_n;
model_dif_temp=model_dif;
model_dif_temp(model_dif<0)=0;
model_dif_temp(model_dif>0)=1;
[m,n]=size(model_dif_temp);
model_dif_r=reshape(model_dif_temp,[m*n,1]);
end

function [dif_positive_pct,dif_negative_pct]=significance_test(dif_r)
dif_r_nan=isnan(dif_r);
dif_r_nan=single(dif_r_nan);
dif_r_nan_sum=sum(dif_r_nan,2);   % calculate NaN sum (=17 means the pixel is not land surface)
dif_r_nan_sum_c=[dif_r,dif_r_nan_sum];
[row,~]=size(dif_r);
% dif1_count_0 (dif1_count_1) is the number of models with negative (positive) differences
% num_0 (num_1) is the number of models with negative (positive) differences for each pixel
dif_count_0(row,1)=0;
dif_count_1(row,1)=0;
count=1;
for i=1:row
    if dif_r_nan_sum_c(i,18)==17
        num_0=nan;
        num_1=nan;
    else
        num_0=sum(dif_r(i,:)==0,2);
        num_1=sum(dif_r(i,:)~=0,2);
    end
    dif_count_0(count,:)=num_0;
    dif_count_1(count,:)=num_1;
    count=count+1;
    disp(i)
end
% Change the number of 0 (and 1) to the percentage divided by 17
dif_count_0_real=dif_count_0/17;
dif_count_1_real=dif_count_1/17;
% Reshape the percentage to global map scale
dif_positive_pct=reshape(dif_count_0_real,[406,964]);
dif_negative_pct=reshape(dif_count_1_real,[406,964]);
end