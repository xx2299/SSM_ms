% % H_{SEP_n} and H_{EEP_n} multimodel differences (for Figure 9)
% Calculate observational H_{SEP_n} and H_{EEP_n}
SEPR1=SMF1./(ETF1_new+PrF1_new);
SEPR2=SMF2./(ETF2_new+PrF2_new);
SEPR3=SMF3./(ETF3_new+PrF3_new);
SEPR1(SMAP_mean_SM<0.1)=0;
SEPR2(SMAP_mean_SM<0.1)=0;
SEPR3(SMAP_mean_SM<0.1)=0;
EEPR1=ETF1_new./(ETF1_new+PrF1_new);
EEPR2=ETF2_new./(ETF2_new+PrF2_new);
EEPR3=ETF3_new./(ETF3_new+PrF3_new);
EEPR1(SMAP_mean_SM<0.1)=0;
EEPR2(SMAP_mean_SM<0.1)=0;
EEPR3(SMAP_mean_SM<0.1)=0;
% Calculate models' H_{SEP_n} and H_{EEP_n}
[BCC_CSM_mhpr1,BCC_CSM_mhpr2,BCC_CSM_mhpr3]=mhpr_tran(BCC_CSM_new_mF1,BCC_CSM_new_hF1,BCC_CSM_new_pF1,BCC_CSM_new_mF2,BCC_CSM_new_hF2,BCC_CSM_new_pF2,BCC_CSM_new_mF3,BCC_CSM_new_hF3,BCC_CSM_new_pF3);
[BCC_CSM_hhpr1,BCC_CSM_hhpr2,BCC_CSM_hhpr3]=hhpr_tran(BCC_CSM_new_hF1,BCC_CSM_new_pF1,BCC_CSM_new_hF2,BCC_CSM_new_pF2,BCC_CSM_new_hF3,BCC_CSM_new_pF3);
[BNU_ESM_mhpr1,BNU_ESM_mhpr2,BNU_ESM_mhpr3]=mhpr_tran(BNU_ESM_new_mF1,BNU_ESM_new_hF1,BNU_ESM_new_pF1,BNU_ESM_new_mF2,BNU_ESM_new_hF2,BNU_ESM_new_pF2,BNU_ESM_new_mF3,BNU_ESM_new_hF3,BNU_ESM_new_pF3);
[BNU_ESM_hhpr1,BNU_ESM_hhpr2,BNU_ESM_hhpr3]=hhpr_tran(BNU_ESM_new_hF1,BNU_ESM_new_pF1,BNU_ESM_new_hF2,BNU_ESM_new_pF2,BNU_ESM_new_hF3,BNU_ESM_new_pF3);
[CanESM2_mhpr1,CanESM2_mhpr2,CanESM2_mhpr3]=mhpr_tran(CanESM2_new_mF1,CanESM2_new_hF1,CanESM2_new_pF1,CanESM2_new_mF2,CanESM2_new_hF2,CanESM2_new_pF2,CanESM2_new_mF3,CanESM2_new_hF3,CanESM2_new_pF3);
[CanESM2_hhpr1,CanESM2_hhpr2,CanESM2_hhpr3]=hhpr_tran(CanESM2_new_hF1,CanESM2_new_pF1,CanESM2_new_hF2,CanESM2_new_pF2,CanESM2_new_hF3,CanESM2_new_pF3);
[CNRM_CM5_mhpr1,CNRM_CM5_mhpr2,CNRM_CM5_mhpr3]=mhpr_tran(CNRM_CM5_new_mF1,CNRM_CM5_new_hF1,CNRM_CM5_new_pF1,CNRM_CM5_new_mF2,CNRM_CM5_new_hF2,CNRM_CM5_new_pF2,CNRM_CM5_new_mF3,CNRM_CM5_new_hF3,CNRM_CM5_new_pF3);
[CNRM_CM5_hhpr1,CNRM_CM5_hhpr2,CNRM_CM5_hhpr3]=hhpr_tran(CNRM_CM5_new_hF1,CNRM_CM5_new_pF1,CNRM_CM5_new_hF2,CNRM_CM5_new_pF2,CNRM_CM5_new_hF3,CNRM_CM5_new_pF3);
[CSIRO_Mk_mhpr1,CSIRO_Mk_mhpr2,CSIRO_Mk_mhpr3]=mhpr_tran(CSIRO_Mk_new_mF1,CSIRO_Mk_new_hF1,CSIRO_Mk_new_pF1,CSIRO_Mk_new_mF2,CSIRO_Mk_new_hF2,CSIRO_Mk_new_pF2,CSIRO_Mk_new_mF3,CSIRO_Mk_new_hF3,CSIRO_Mk_new_pF3);
[CSIRO_Mk_hhpr1,CSIRO_Mk_hhpr2,CSIRO_Mk_hhpr3]=hhpr_tran(CSIRO_Mk_new_hF1,CSIRO_Mk_new_pF1,CSIRO_Mk_new_hF2,CSIRO_Mk_new_pF2,CSIRO_Mk_new_hF3,CSIRO_Mk_new_pF3);
[GFDL_CM3_mhpr1,GFDL_CM3_mhpr2,GFDL_CM3_mhpr3]=mhpr_tran(GFDL_CM3_new_mF1,GFDL_CM3_new_hF1,GFDL_CM3_new_pF1,GFDL_CM3_new_mF2,GFDL_CM3_new_hF2,GFDL_CM3_new_pF2,GFDL_CM3_new_mF3,GFDL_CM3_new_hF3,GFDL_CM3_new_pF3);
[GFDL_CM3_hhpr1,GFDL_CM3_hhpr2,GFDL_CM3_hhpr3]=hhpr_tran(GFDL_CM3_new_hF1,GFDL_CM3_new_pF1,GFDL_CM3_new_hF2,GFDL_CM3_new_pF2,GFDL_CM3_new_hF3,GFDL_CM3_new_pF3);
[GFDL_ESM2G_mhpr1,GFDL_ESM2G_mhpr2,GFDL_ESM2G_mhpr3]=mhpr_tran(GFDL_ESM2G_new_mF1,GFDL_ESM2G_new_hF1,GFDL_ESM2G_new_pF1,GFDL_ESM2G_new_mF2,GFDL_ESM2G_new_hF2,GFDL_ESM2G_new_pF2,GFDL_ESM2G_new_mF3,GFDL_ESM2G_new_hF3,GFDL_ESM2G_new_pF3);
[GFDL_ESM2G_hhpr1,GFDL_ESM2G_hhpr2,GFDL_ESM2G_hhpr3]=hhpr_tran(GFDL_ESM2G_new_hF1,GFDL_ESM2G_new_pF1,GFDL_ESM2G_new_hF2,GFDL_ESM2G_new_pF2,GFDL_ESM2G_new_hF3,GFDL_ESM2G_new_pF3);
[GFDL_ESM2M_mhpr1,GFDL_ESM2M_mhpr2,GFDL_ESM2M_mhpr3]=mhpr_tran(GFDL_ESM2M_new_mF1,GFDL_ESM2M_new_hF1,GFDL_ESM2M_new_pF1,GFDL_ESM2M_new_mF2,GFDL_ESM2M_new_hF2,GFDL_ESM2M_new_pF2,GFDL_ESM2M_new_mF3,GFDL_ESM2M_new_hF3,GFDL_ESM2M_new_pF3);
[GFDL_ESM2M_hhpr1,GFDL_ESM2M_hhpr2,GFDL_ESM2M_hhpr3]=hhpr_tran(GFDL_ESM2M_new_hF1,GFDL_ESM2M_new_pF1,GFDL_ESM2M_new_hF2,GFDL_ESM2M_new_pF2,GFDL_ESM2M_new_hF3,GFDL_ESM2M_new_pF3);
[HadGEM2_CC_mhpr1,HadGEM2_CC_mhpr2,HadGEM2_CC_mhpr3]=mhpr_tran(HadGEM2_CC_new_mF1,HadGEM2_CC_new_hF1,HadGEM2_CC_new_pF1,HadGEM2_CC_new_mF2,HadGEM2_CC_new_hF2,HadGEM2_CC_new_pF2,HadGEM2_CC_new_mF3,HadGEM2_CC_new_hF3,HadGEM2_CC_new_pF3);
[HadGEM2_CC_hhpr1,HadGEM2_CC_hhpr2,HadGEM2_CC_hhpr3]=hhpr_tran(HadGEM2_CC_new_hF1,HadGEM2_CC_new_pF1,HadGEM2_CC_new_hF2,HadGEM2_CC_new_pF2,HadGEM2_CC_new_hF3,HadGEM2_CC_new_pF3);
[HadGEM2_ES_mhpr1,HadGEM2_ES_mhpr2,HadGEM2_ES_mhpr3]=mhpr_tran(HadGEM2_ES_new_mF1,HadGEM2_ES_new_hF1,HadGEM2_ES_new_pF1,HadGEM2_ES_new_mF2,HadGEM2_ES_new_hF2,HadGEM2_ES_new_pF2,HadGEM2_ES_new_mF3,HadGEM2_ES_new_hF3,HadGEM2_ES_new_pF3);
[HadGEM2_ES_hhpr1,HadGEM2_ES_hhpr2,HadGEM2_ES_hhpr3]=hhpr_tran(HadGEM2_ES_new_hF1,HadGEM2_ES_new_pF1,HadGEM2_ES_new_hF2,HadGEM2_ES_new_pF2,HadGEM2_ES_new_hF3,HadGEM2_ES_new_pF3);
[inmcm4_mhpr1,inmcm4_mhpr2,inmcm4_mhpr3]=mhpr_tran(inmcm4_new_mF1,inmcm4_new_hF1,inmcm4_new_pF1,inmcm4_new_mF2,inmcm4_new_hF2,inmcm4_new_pF2,inmcm4_new_mF3,inmcm4_new_hF3,inmcm4_new_pF3);
[inmcm4_hhpr1,inmcm4_hhpr2,inmcm4_hhpr3]=hhpr_tran(inmcm4_new_hF1,inmcm4_new_pF1,inmcm4_new_hF2,inmcm4_new_pF2,inmcm4_new_hF3,inmcm4_new_pF3);
[MIROC5_mhpr1,MIROC5_mhpr2,MIROC5_mhpr3]=mhpr_tran(MIROC5_new_mF1,MIROC5_new_hF1,MIROC5_new_pF1,MIROC5_new_mF2,MIROC5_new_hF2,MIROC5_new_pF2,MIROC5_new_mF3,MIROC5_new_hF3,MIROC5_new_pF3);
[MIROC5_hhpr1,MIROC5_hhpr2,MIROC5_hhpr3]=hhpr_tran(MIROC5_new_hF1,MIROC5_new_pF1,MIROC5_new_hF2,MIROC5_new_pF2,MIROC5_new_hF3,MIROC5_new_pF3);
[MIROC_ESM_mhpr1,MIROC_ESM_mhpr2,MIROC_ESM_mhpr3]=mhpr_tran(MIROC_ESM_new_mF1,MIROC_ESM_new_hF1,MIROC_ESM_new_pF1,MIROC_ESM_new_mF2,MIROC_ESM_new_hF2,MIROC_ESM_new_pF2,MIROC_ESM_new_mF3,MIROC_ESM_new_hF3,MIROC_ESM_new_pF3);
[MIROC_ESM_hhpr1,MIROC_ESM_hhpr2,MIROC_ESM_hhpr3]=hhpr_tran(MIROC_ESM_new_hF1,MIROC_ESM_new_pF1,MIROC_ESM_new_hF2,MIROC_ESM_new_pF2,MIROC_ESM_new_hF3,MIROC_ESM_new_pF3);
[MIROC_ESM_CHEM_mhpr1,MIROC_ESM_CHEM_mhpr2,MIROC_ESM_CHEM_mhpr3]=mhpr_tran(MIROC_ESM_CHEM_new_mF1,MIROC_ESM_CHEM_new_hF1,MIROC_ESM_CHEM_new_pF1,MIROC_ESM_CHEM_new_mF2,MIROC_ESM_CHEM_new_hF2,MIROC_ESM_CHEM_new_pF2,MIROC_ESM_CHEM_new_mF3,MIROC_ESM_CHEM_new_hF3,MIROC_ESM_CHEM_new_pF3);
[MIROC_ESM_CHEM_hhpr1,MIROC_ESM_CHEM_hhpr2,MIROC_ESM_CHEM_hhpr3]=hhpr_tran(MIROC_ESM_CHEM_new_hF1,MIROC_ESM_CHEM_new_pF1,MIROC_ESM_CHEM_new_hF2,MIROC_ESM_CHEM_new_pF2,MIROC_ESM_CHEM_new_hF3,MIROC_ESM_CHEM_new_pF3);
[MRI_CGCM3_mhpr1,MRI_CGCM3_mhpr2,MRI_CGCM3_mhpr3]=mhpr_tran(MRI_CGCM3_new_mF1,MRI_CGCM3_new_hF1,MRI_CGCM3_new_pF1,MRI_CGCM3_new_mF2,MRI_CGCM3_new_hF2,MRI_CGCM3_new_pF2,MRI_CGCM3_new_mF3,MRI_CGCM3_new_hF3,MRI_CGCM3_new_pF3);
[MRI_CGCM3_hhpr1,MRI_CGCM3_hhpr2,MRI_CGCM3_hhpr3]=hhpr_tran(MRI_CGCM3_new_hF1,MRI_CGCM3_new_pF1,MRI_CGCM3_new_hF2,MRI_CGCM3_new_pF2,MRI_CGCM3_new_hF3,MRI_CGCM3_new_pF3);
[MRI_ESM1_mhpr1,MRI_ESM1_mhpr2,MRI_ESM1_mhpr3]=mhpr_tran(MRI_ESM1_new_mF1,MRI_ESM1_new_hF1,MRI_ESM1_new_pF1,MRI_ESM1_new_mF2,MRI_ESM1_new_hF2,MRI_ESM1_new_pF2,MRI_ESM1_new_mF3,MRI_ESM1_new_hF3,MRI_ESM1_new_pF3);
[MRI_ESM1_hhpr1,MRI_ESM1_hhpr2,MRI_ESM1_hhpr3]=hhpr_tran(MRI_ESM1_new_hF1,MRI_ESM1_new_pF1,MRI_ESM1_new_hF2,MRI_ESM1_new_pF2,MRI_ESM1_new_hF3,MRI_ESM1_new_pF3);
[NorESM1_M_mhpr1,NorESM1_M_mhpr2,NorESM1_M_mhpr3]=mhpr_tran(NorESM1_M_new_mF1,NorESM1_M_new_hF1,NorESM1_M_new_pF1,NorESM1_M_new_mF2,NorESM1_M_new_hF2,NorESM1_M_new_pF2,NorESM1_M_new_mF3,NorESM1_M_new_hF3,NorESM1_M_new_pF3);
[NorESM1_M_hhpr1,NorESM1_M_hhpr2,NorESM1_M_hhpr3]=hhpr_tran(NorESM1_M_new_hF1,NorESM1_M_new_pF1,NorESM1_M_new_hF2,NorESM1_M_new_pF2,NorESM1_M_new_hF3,NorESM1_M_new_pF3);
% Calculate H_{SEP_n} and H_{EEP_n} differences and prepare for significance test
[BCC_CSM_mhpdif1,BCC_CSM_mhpdif1_r]=significance_prepare(BCC_CSM_mhpr1,SEPR1);
[BCC_CSM_mhpdif2,BCC_CSM_mhpdif2_r]=significance_prepare(BCC_CSM_mhpr2,SEPR2);
[BCC_CSM_mhpdif3,BCC_CSM_mhpdif3_r]=significance_prepare(BCC_CSM_mhpr3,SEPR3);
[BCC_CSM_hhpdif1,BCC_CSM_hhpdif1_r]=significance_prepare(BCC_CSM_hhpr1,EEPR1);
[BCC_CSM_hhpdif2,BCC_CSM_hhpdif2_r]=significance_prepare(BCC_CSM_hhpr2,EEPR2);
[BCC_CSM_hhpdif3,BCC_CSM_hhpdif3_r]=significance_prepare(BCC_CSM_hhpr3,EEPR3);
[BNU_ESM_mhpdif1,BNU_ESM_mhpdif1_r]=significance_prepare(BNU_ESM_mhpr1,SEPR1);
[BNU_ESM_mhpdif2,BNU_ESM_mhpdif2_r]=significance_prepare(BNU_ESM_mhpr2,SEPR2);
[BNU_ESM_mhpdif3,BNU_ESM_mhpdif3_r]=significance_prepare(BNU_ESM_mhpr3,SEPR3);
[BNU_ESM_hhpdif1,BNU_ESM_hhpdif1_r]=significance_prepare(BNU_ESM_hhpr1,EEPR1);
[BNU_ESM_hhpdif2,BNU_ESM_hhpdif2_r]=significance_prepare(BNU_ESM_hhpr2,EEPR2);
[BNU_ESM_hhpdif3,BNU_ESM_hhpdif3_r]=significance_prepare(BNU_ESM_hhpr3,EEPR3);
[CanESM2_mhpdif1,CanESM2_mhpdif1_r]=significance_prepare(CanESM2_mhpr1,SEPR1);
[CanESM2_mhpdif2,CanESM2_mhpdif2_r]=significance_prepare(CanESM2_mhpr2,SEPR2);
[CanESM2_mhpdif3,CanESM2_mhpdif3_r]=significance_prepare(CanESM2_mhpr3,SEPR3);
[CanESM2_hhpdif1,CanESM2_hhpdif1_r]=significance_prepare(CanESM2_hhpr1,EEPR1);
[CanESM2_hhpdif2,CanESM2_hhpdif2_r]=significance_prepare(CanESM2_hhpr2,EEPR2);
[CanESM2_hhpdif3,CanESM2_hhpdif3_r]=significance_prepare(CanESM2_hhpr3,EEPR3);
[CNRM_CM5_mhpdif1,CNRM_CM5_mhpdif1_r]=significance_prepare(CNRM_CM5_mhpr1,SEPR1);
[CNRM_CM5_mhpdif2,CNRM_CM5_mhpdif2_r]=significance_prepare(CNRM_CM5_mhpr2,SEPR2);
[CNRM_CM5_mhpdif3,CNRM_CM5_mhpdif3_r]=significance_prepare(CNRM_CM5_mhpr3,SEPR3);
[CNRM_CM5_hhpdif1,CNRM_CM5_hhpdif1_r]=significance_prepare(CNRM_CM5_hhpr1,EEPR1);
[CNRM_CM5_hhpdif2,CNRM_CM5_hhpdif2_r]=significance_prepare(CNRM_CM5_hhpr2,EEPR2);
[CNRM_CM5_hhpdif3,CNRM_CM5_hhpdif3_r]=significance_prepare(CNRM_CM5_hhpr3,EEPR3);
[CSIRO_Mk_mhpdif1,CSIRO_Mk_mhpdif1_r]=significance_prepare(CSIRO_Mk_mhpr1,SEPR1);
[CSIRO_Mk_mhpdif2,CSIRO_Mk_mhpdif2_r]=significance_prepare(CSIRO_Mk_mhpr2,SEPR2);
[CSIRO_Mk_mhpdif3,CSIRO_Mk_mhpdif3_r]=significance_prepare(CSIRO_Mk_mhpr3,SEPR3);
[CSIRO_Mk_hhpdif1,CSIRO_Mk_hhpdif1_r]=significance_prepare(CSIRO_Mk_hhpr1,EEPR1);
[CSIRO_Mk_hhpdif2,CSIRO_Mk_hhpdif2_r]=significance_prepare(CSIRO_Mk_hhpr2,EEPR2);
[CSIRO_Mk_hhpdif3,CSIRO_Mk_hhpdif3_r]=significance_prepare(CSIRO_Mk_hhpr3,EEPR3);
[GFDL_CM3_mhpdif1,GFDL_CM3_mhpdif1_r]=significance_prepare(GFDL_CM3_mhpr1,SEPR1);
[GFDL_CM3_mhpdif2,GFDL_CM3_mhpdif2_r]=significance_prepare(GFDL_CM3_mhpr2,SEPR2);
[GFDL_CM3_mhpdif3,GFDL_CM3_mhpdif3_r]=significance_prepare(GFDL_CM3_mhpr3,SEPR3);
[GFDL_CM3_hhpdif1,GFDL_CM3_hhpdif1_r]=significance_prepare(GFDL_CM3_hhpr1,EEPR1);
[GFDL_CM3_hhpdif2,GFDL_CM3_hhpdif2_r]=significance_prepare(GFDL_CM3_hhpr2,EEPR2);
[GFDL_CM3_hhpdif3,GFDL_CM3_hhpdif3_r]=significance_prepare(GFDL_CM3_hhpr3,EEPR3);
[GFDL_ESM2G_mhpdif1,GFDL_ESM2G_mhpdif1_r]=significance_prepare(GFDL_ESM2G_mhpr1,SEPR1);
[GFDL_ESM2G_mhpdif2,GFDL_ESM2G_mhpdif2_r]=significance_prepare(GFDL_ESM2G_mhpr2,SEPR2);
[GFDL_ESM2G_mhpdif3,GFDL_ESM2G_mhpdif3_r]=significance_prepare(GFDL_ESM2G_mhpr3,SEPR3);
[GFDL_ESM2G_hhpdif1,GFDL_ESM2G_hhpdif1_r]=significance_prepare(GFDL_ESM2G_hhpr1,EEPR1);
[GFDL_ESM2G_hhpdif2,GFDL_ESM2G_hhpdif2_r]=significance_prepare(GFDL_ESM2G_hhpr2,EEPR2);
[GFDL_ESM2G_hhpdif3,GFDL_ESM2G_hhpdif3_r]=significance_prepare(GFDL_ESM2G_hhpr3,EEPR3);
[GFDL_ESM2M_mhpdif1,GFDL_ESM2M_mhpdif1_r]=significance_prepare(GFDL_ESM2M_mhpr1,SEPR1);
[GFDL_ESM2M_mhpdif2,GFDL_ESM2M_mhpdif2_r]=significance_prepare(GFDL_ESM2M_mhpr2,SEPR2);
[GFDL_ESM2M_mhpdif3,GFDL_ESM2M_mhpdif3_r]=significance_prepare(GFDL_ESM2M_mhpr3,SEPR3);
[GFDL_ESM2M_hhpdif1,GFDL_ESM2M_hhpdif1_r]=significance_prepare(GFDL_ESM2M_hhpr1,EEPR1);
[GFDL_ESM2M_hhpdif2,GFDL_ESM2M_hhpdif2_r]=significance_prepare(GFDL_ESM2M_hhpr2,EEPR2);
[GFDL_ESM2M_hhpdif3,GFDL_ESM2M_hhpdif3_r]=significance_prepare(GFDL_ESM2M_hhpr3,EEPR3);
[HadGEM2_CC_mhpdif1,HadGEM2_CC_mhpdif1_r]=significance_prepare(HadGEM2_CC_mhpr1,SEPR1);
[HadGEM2_CC_mhpdif2,HadGEM2_CC_mhpdif2_r]=significance_prepare(HadGEM2_CC_mhpr2,SEPR2);
[HadGEM2_CC_mhpdif3,HadGEM2_CC_mhpdif3_r]=significance_prepare(HadGEM2_CC_mhpr3,SEPR3);
[HadGEM2_CC_hhpdif1,HadGEM2_CC_hhpdif1_r]=significance_prepare(HadGEM2_CC_hhpr1,EEPR1);
[HadGEM2_CC_hhpdif2,HadGEM2_CC_hhpdif2_r]=significance_prepare(HadGEM2_CC_hhpr2,EEPR2);
[HadGEM2_CC_hhpdif3,HadGEM2_CC_hhpdif3_r]=significance_prepare(HadGEM2_CC_hhpr3,EEPR3);
[HadGEM2_ES_mhpdif1,HadGEM2_ES_mhpdif1_r]=significance_prepare(HadGEM2_ES_mhpr1,SEPR1);
[HadGEM2_ES_mhpdif2,HadGEM2_ES_mhpdif2_r]=significance_prepare(HadGEM2_ES_mhpr2,SEPR2);
[HadGEM2_ES_mhpdif3,HadGEM2_ES_mhpdif3_r]=significance_prepare(HadGEM2_ES_mhpr3,SEPR3);
[HadGEM2_ES_hhpdif1,HadGEM2_ES_hhpdif1_r]=significance_prepare(HadGEM2_ES_hhpr1,EEPR1);
[HadGEM2_ES_hhpdif2,HadGEM2_ES_hhpdif2_r]=significance_prepare(HadGEM2_ES_hhpr2,EEPR2);
[HadGEM2_ES_hhpdif3,HadGEM2_ES_hhpdif3_r]=significance_prepare(HadGEM2_ES_hhpr3,EEPR3);
[inmcm4_mhpdif1,inmcm4_mhpdif1_r]=significance_prepare(inmcm4_mhpr1,SEPR1);
[inmcm4_mhpdif2,inmcm4_mhpdif2_r]=significance_prepare(inmcm4_mhpr2,SEPR2);
[inmcm4_mhpdif3,inmcm4_mhpdif3_r]=significance_prepare(inmcm4_mhpr3,SEPR3);
[inmcm4_hhpdif1,inmcm4_hhpdif1_r]=significance_prepare(inmcm4_hhpr1,EEPR1);
[inmcm4_hhpdif2,inmcm4_hhpdif2_r]=significance_prepare(inmcm4_hhpr2,EEPR2);
[inmcm4_hhpdif3,inmcm4_hhpdif3_r]=significance_prepare(inmcm4_hhpr3,EEPR3);
[MIROC5_mhpdif1,MIROC5_mhpdif1_r]=significance_prepare(MIROC5_mhpr1,SEPR1);
[MIROC5_mhpdif2,MIROC5_mhpdif2_r]=significance_prepare(MIROC5_mhpr2,SEPR2);
[MIROC5_mhpdif3,MIROC5_mhpdif3_r]=significance_prepare(MIROC5_mhpr3,SEPR3);
[MIROC5_hhpdif1,MIROC5_hhpdif1_r]=significance_prepare(MIROC5_hhpr1,EEPR1);
[MIROC5_hhpdif2,MIROC5_hhpdif2_r]=significance_prepare(MIROC5_hhpr2,EEPR2);
[MIROC5_hhpdif3,MIROC5_hhpdif3_r]=significance_prepare(MIROC5_hhpr3,EEPR3);
[MIROC_ESM_mhpdif1,MIROC_ESM_mhpdif1_r]=significance_prepare(MIROC_ESM_mhpr1,SEPR1);
[MIROC_ESM_mhpdif2,MIROC_ESM_mhpdif2_r]=significance_prepare(MIROC_ESM_mhpr2,SEPR2);
[MIROC_ESM_mhpdif3,MIROC_ESM_mhpdif3_r]=significance_prepare(MIROC_ESM_mhpr3,SEPR3);
[MIROC_ESM_hhpdif1,MIROC_ESM_hhpdif1_r]=significance_prepare(MIROC_ESM_hhpr1,EEPR1);
[MIROC_ESM_hhpdif2,MIROC_ESM_hhpdif2_r]=significance_prepare(MIROC_ESM_hhpr2,EEPR2);
[MIROC_ESM_hhpdif3,MIROC_ESM_hhpdif3_r]=significance_prepare(MIROC_ESM_hhpr3,EEPR3);
[MIROC_ESM_CHEM_mhpdif1,MIROC_ESM_CHEM_mhpdif1_r]=significance_prepare(MIROC_ESM_CHEM_mhpr1,SEPR1);
[MIROC_ESM_CHEM_mhpdif2,MIROC_ESM_CHEM_mhpdif2_r]=significance_prepare(MIROC_ESM_CHEM_mhpr2,SEPR2);
[MIROC_ESM_CHEM_mhpdif3,MIROC_ESM_CHEM_mhpdif3_r]=significance_prepare(MIROC_ESM_CHEM_mhpr3,SEPR3);
[MIROC_ESM_CHEM_hhpdif1,MIROC_ESM_CHEM_hhpdif1_r]=significance_prepare(MIROC_ESM_CHEM_hhpr1,EEPR1);
[MIROC_ESM_CHEM_hhpdif2,MIROC_ESM_CHEM_hhpdif2_r]=significance_prepare(MIROC_ESM_CHEM_hhpr2,EEPR2);
[MIROC_ESM_CHEM_hhpdif3,MIROC_ESM_CHEM_hhpdif3_r]=significance_prepare(MIROC_ESM_CHEM_hhpr3,EEPR3);
[MRI_CGCM3_mhpdif1,MRI_CGCM3_mhpdif1_r]=significance_prepare(MRI_CGCM3_mhpr1,SEPR1);
[MRI_CGCM3_mhpdif2,MRI_CGCM3_mhpdif2_r]=significance_prepare(MRI_CGCM3_mhpr2,SEPR2);
[MRI_CGCM3_mhpdif3,MRI_CGCM3_mhpdif3_r]=significance_prepare(MRI_CGCM3_mhpr3,SEPR3);
[MRI_CGCM3_hhpdif1,MRI_CGCM3_hhpdif1_r]=significance_prepare(MRI_CGCM3_hhpr1,EEPR1);
[MRI_CGCM3_hhpdif2,MRI_CGCM3_hhpdif2_r]=significance_prepare(MRI_CGCM3_hhpr2,EEPR2);
[MRI_CGCM3_hhpdif3,MRI_CGCM3_hhpdif3_r]=significance_prepare(MRI_CGCM3_hhpr3,EEPR3);
[MRI_ESM1_mhpdif1,MRI_ESM1_mhpdif1_r]=significance_prepare(MRI_ESM1_mhpr1,SEPR1);
[MRI_ESM1_mhpdif2,MRI_ESM1_mhpdif2_r]=significance_prepare(MRI_ESM1_mhpr2,SEPR2);
[MRI_ESM1_mhpdif3,MRI_ESM1_mhpdif3_r]=significance_prepare(MRI_ESM1_mhpr3,SEPR3);
[MRI_ESM1_hhpdif1,MRI_ESM1_hhpdif1_r]=significance_prepare(MRI_ESM1_hhpr1,EEPR1);
[MRI_ESM1_hhpdif2,MRI_ESM1_hhpdif2_r]=significance_prepare(MRI_ESM1_hhpr2,EEPR2);
[MRI_ESM1_hhpdif3,MRI_ESM1_hhpdif3_r]=significance_prepare(MRI_ESM1_hhpr3,EEPR3);
[NorESM1_M_mhpdif1,NorESM1_M_mhpdif1_r]=significance_prepare(NorESM1_M_mhpr1,SEPR1);
[NorESM1_M_mhpdif2,NorESM1_M_mhpdif2_r]=significance_prepare(NorESM1_M_mhpr2,SEPR2);
[NorESM1_M_mhpdif3,NorESM1_M_mhpdif3_r]=significance_prepare(NorESM1_M_mhpr3,SEPR3);
[NorESM1_M_hhpdif1,NorESM1_M_hhpdif1_r]=significance_prepare(NorESM1_M_hhpr1,EEPR1);
[NorESM1_M_hhpdif2,NorESM1_M_hhpdif2_r]=significance_prepare(NorESM1_M_hhpr2,EEPR2);
[NorESM1_M_hhpdif3,NorESM1_M_hhpdif3_r]=significance_prepare(NorESM1_M_hhpr3,EEPR3);
% Do significance test for H_{SEP_n} and H_{EEP_n} differences
mhpdif1_r=[BCC_CSM_mhpdif1_r,BNU_ESM_mhpdif1_r,CanESM2_mhpdif1_r,CNRM_CM5_mhpdif1_r,CSIRO_Mk_mhpdif1_r,GFDL_CM3_mhpdif1_r,GFDL_ESM2G_mhpdif1_r,GFDL_ESM2M_mhpdif1_r,HadGEM2_CC_mhpdif1_r,HadGEM2_ES_mhpdif1_r,inmcm4_mhpdif1_r,MIROC5_mhpdif1_r,MIROC_ESM_mhpdif1_r,MIROC_ESM_CHEM_mhpdif1_r,MRI_CGCM3_mhpdif1_r,MRI_ESM1_mhpdif1_r,NorESM1_M_mhpdif1_r];
mhpdif2_r=[BCC_CSM_mhpdif2_r,BNU_ESM_mhpdif2_r,CanESM2_mhpdif2_r,CNRM_CM5_mhpdif2_r,CSIRO_Mk_mhpdif2_r,GFDL_CM3_mhpdif2_r,GFDL_ESM2G_mhpdif2_r,GFDL_ESM2M_mhpdif2_r,HadGEM2_CC_mhpdif2_r,HadGEM2_ES_mhpdif2_r,inmcm4_mhpdif2_r,MIROC5_mhpdif2_r,MIROC_ESM_mhpdif2_r,MIROC_ESM_CHEM_mhpdif2_r,MRI_CGCM3_mhpdif2_r,MRI_ESM1_mhpdif2_r,NorESM1_M_mhpdif2_r];
mhpdif3_r=[BCC_CSM_mhpdif3_r,BNU_ESM_mhpdif3_r,CanESM2_mhpdif3_r,CNRM_CM5_mhpdif3_r,CSIRO_Mk_mhpdif3_r,GFDL_CM3_mhpdif3_r,GFDL_ESM2G_mhpdif3_r,GFDL_ESM2M_mhpdif3_r,HadGEM2_CC_mhpdif3_r,HadGEM2_ES_mhpdif3_r,inmcm4_mhpdif3_r,MIROC5_mhpdif3_r,MIROC_ESM_mhpdif3_r,MIROC_ESM_CHEM_mhpdif3_r,MRI_CGCM3_mhpdif3_r,MRI_ESM1_mhpdif3_r,NorESM1_M_mhpdif3_r];
[mhpdif1_positive_pct,mhpdif1_negative_pct]=significance_test(mhpdif1_r);
[mhpdif2_positive_pct,mhpdif2_negative_pct]=significance_test(mhpdif2_r);
[mhpdif3_positive_pct,mhpdif3_negative_pct]=significance_test(mhpdif3_r);
hhpdif1_r=[BCC_CSM_hhpdif1_r,BNU_ESM_hhpdif1_r,CanESM2_hhpdif1_r,CNRM_CM5_hhpdif1_r,CSIRO_Mk_hhpdif1_r,GFDL_CM3_hhpdif1_r,GFDL_ESM2G_hhpdif1_r,GFDL_ESM2M_hhpdif1_r,HadGEM2_CC_hhpdif1_r,HadGEM2_ES_hhpdif1_r,inmcm4_hhpdif1_r,MIROC5_hhpdif1_r,MIROC_ESM_hhpdif1_r,MIROC_ESM_CHEM_hhpdif1_r,MRI_CGCM3_hhpdif1_r,MRI_ESM1_hhpdif1_r,NorESM1_M_hhpdif1_r];
hhpdif2_r=[BCC_CSM_hhpdif2_r,BNU_ESM_hhpdif2_r,CanESM2_hhpdif2_r,CNRM_CM5_hhpdif2_r,CSIRO_Mk_hhpdif2_r,GFDL_CM3_hhpdif2_r,GFDL_ESM2G_hhpdif2_r,GFDL_ESM2M_hhpdif2_r,HadGEM2_CC_hhpdif2_r,HadGEM2_ES_hhpdif2_r,inmcm4_hhpdif2_r,MIROC5_hhpdif2_r,MIROC_ESM_hhpdif2_r,MIROC_ESM_CHEM_hhpdif2_r,MRI_CGCM3_hhpdif2_r,MRI_ESM1_hhpdif2_r,NorESM1_M_hhpdif2_r];
hhpdif3_r=[BCC_CSM_hhpdif3_r,BNU_ESM_hhpdif3_r,CanESM2_hhpdif3_r,CNRM_CM5_hhpdif3_r,CSIRO_Mk_hhpdif3_r,GFDL_CM3_hhpdif3_r,GFDL_ESM2G_hhpdif3_r,GFDL_ESM2M_hhpdif3_r,HadGEM2_CC_hhpdif3_r,HadGEM2_ES_hhpdif3_r,inmcm4_hhpdif3_r,MIROC5_hhpdif3_r,MIROC_ESM_hhpdif3_r,MIROC_ESM_CHEM_hhpdif3_r,MRI_CGCM3_hhpdif3_r,MRI_ESM1_hhpdif3_r,NorESM1_M_hhpdif3_r];
[hhpdif1_positive_pct,hhpdif1_negative_pct]=significance_test(hhpdif1_r);
[hhpdif2_positive_pct,hhpdif2_negative_pct]=significance_test(hhpdif2_r);
[hhpdif3_positive_pct,hhpdif3_negative_pct]=significance_test(hhpdif3_r);
% Calculate average differences of H_{SEP_n} for 100% and 80% significance test
mhpdif1_positive_pct(SMAP_mean_SM<0.1)=nan;
mhpdif1_negative_pct(SMAP_mean_SM<0.1)=nan;
mhpdif2_positive_pct(SMAP_mean_SM<0.1)=nan;
mhpdif2_negative_pct(SMAP_mean_SM<0.1)=nan;
mhpdif3_positive_pct(SMAP_mean_SM<0.1)=nan;
mhpdif3_negative_pct(SMAP_mean_SM<0.1)=nan;
mhpdif1_p_pct=mhpdif1_positive_pct;
mhpdif1_n_pct=mhpdif1_negative_pct;
mhpdif2_p_pct=mhpdif2_positive_pct;
mhpdif2_n_pct=mhpdif2_negative_pct;
mhpdif3_p_pct=mhpdif3_positive_pct;
mhpdif3_n_pct=mhpdif3_negative_pct;
[BCC_CSM_mhpdif1_p100,BCC_CSM_mhpdif2_p100,BCC_CSM_mhpdif3_p100,BCC_CSM_mhpdif1_p80,BCC_CSM_mhpdif2_p80,BCC_CSM_mhpdif3_p80]= ...
    F_perc(BCC_CSM_mhpdif1,BCC_CSM_mhpdif2,BCC_CSM_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[BNU_ESM_mhpdif1_p100,BNU_ESM_mhpdif2_p100,BNU_ESM_mhpdif3_p100,BNU_ESM_mhpdif1_p80,BNU_ESM_mhpdif2_p80,BNU_ESM_mhpdif3_p80]= ...
    F_perc(BNU_ESM_mhpdif1,BNU_ESM_mhpdif2,BNU_ESM_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[CanESM2_mhpdif1_p100,CanESM2_mhpdif2_p100,CanESM2_mhpdif3_p100,CanESM2_mhpdif1_p80,CanESM2_mhpdif2_p80,CanESM2_mhpdif3_p80]= ...
    F_perc(CanESM2_mhpdif1,CanESM2_mhpdif2,CanESM2_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[CNRM_CM5_mhpdif1_p100,CNRM_CM5_mhpdif2_p100,CNRM_CM5_mhpdif3_p100,CNRM_CM5_mhpdif1_p80,CNRM_CM5_mhpdif2_p80,CNRM_CM5_mhpdif3_p80]= ...
    F_perc(CNRM_CM5_mhpdif1,CNRM_CM5_mhpdif2,CNRM_CM5_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[CSIRO_Mk_mhpdif1_p100,CSIRO_Mk_mhpdif2_p100,CSIRO_Mk_mhpdif3_p100,CSIRO_Mk_mhpdif1_p80,CSIRO_Mk_mhpdif2_p80,CSIRO_Mk_mhpdif3_p80]= ...
    F_perc(CSIRO_Mk_mhpdif1,CSIRO_Mk_mhpdif2,CSIRO_Mk_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[GFDL_CM3_mhpdif1_p100,GFDL_CM3_mhpdif2_p100,GFDL_CM3_mhpdif3_p100,GFDL_CM3_mhpdif1_p80,GFDL_CM3_mhpdif2_p80,GFDL_CM3_mhpdif3_p80]= ...
    F_perc(GFDL_CM3_mhpdif1,GFDL_CM3_mhpdif2,GFDL_CM3_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[GFDL_ESM2G_mhpdif1_p100,GFDL_ESM2G_mhpdif2_p100,GFDL_ESM2G_mhpdif3_p100,GFDL_ESM2G_mhpdif1_p80,GFDL_ESM2G_mhpdif2_p80,GFDL_ESM2G_mhpdif3_p80]= ...
    F_perc(GFDL_ESM2G_mhpdif1,GFDL_ESM2G_mhpdif2,GFDL_ESM2G_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[GFDL_ESM2M_mhpdif1_p100,GFDL_ESM2M_mhpdif2_p100,GFDL_ESM2M_mhpdif3_p100,GFDL_ESM2M_mhpdif1_p80,GFDL_ESM2M_mhpdif2_p80,GFDL_ESM2M_mhpdif3_p80]= ...
    F_perc(GFDL_ESM2M_mhpdif1,GFDL_ESM2M_mhpdif2,GFDL_ESM2M_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[HadGEM2_CC_mhpdif1_p100,HadGEM2_CC_mhpdif2_p100,HadGEM2_CC_mhpdif3_p100,HadGEM2_CC_mhpdif1_p80,HadGEM2_CC_mhpdif2_p80,HadGEM2_CC_mhpdif3_p80]= ...
    F_perc(HadGEM2_CC_mhpdif1,HadGEM2_CC_mhpdif2,HadGEM2_CC_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[HadGEM2_ES_mhpdif1_p100,HadGEM2_ES_mhpdif2_p100,HadGEM2_ES_mhpdif3_p100,HadGEM2_ES_mhpdif1_p80,HadGEM2_ES_mhpdif2_p80,HadGEM2_ES_mhpdif3_p80]= ...
    F_perc(HadGEM2_ES_mhpdif1,HadGEM2_ES_mhpdif2,HadGEM2_ES_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[inmcm4_mhpdif1_p100,inmcm4_mhpdif2_p100,inmcm4_mhpdif3_p100,inmcm4_mhpdif1_p80,inmcm4_mhpdif2_p80,inmcm4_mhpdif3_p80]= ...
    F_perc(inmcm4_mhpdif1,inmcm4_mhpdif2,inmcm4_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[MIROC5_mhpdif1_p100,MIROC5_mhpdif2_p100,MIROC5_mhpdif3_p100,MIROC5_mhpdif1_p80,MIROC5_mhpdif2_p80,MIROC5_mhpdif3_p80]= ...
    F_perc(MIROC5_mhpdif1,MIROC5_mhpdif2,MIROC5_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[MIROC_ESM_mhpdif1_p100,MIROC_ESM_mhpdif2_p100,MIROC_ESM_mhpdif3_p100,MIROC_ESM_mhpdif1_p80,MIROC_ESM_mhpdif2_p80,MIROC_ESM_mhpdif3_p80]= ...
    F_perc(MIROC_ESM_mhpdif1,MIROC_ESM_mhpdif2,MIROC_ESM_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[MIROC_ESM_CHEM_mhpdif1_p100,MIROC_ESM_CHEM_mhpdif2_p100,MIROC_ESM_CHEM_mhpdif3_p100,MIROC_ESM_CHEM_mhpdif1_p80,MIROC_ESM_CHEM_mhpdif2_p80,MIROC_ESM_CHEM_mhpdif3_p80]= ...
    F_perc(MIROC_ESM_CHEM_mhpdif1,MIROC_ESM_CHEM_mhpdif2,MIROC_ESM_CHEM_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[MRI_CGCM3_mhpdif1_p100,MRI_CGCM3_mhpdif2_p100,MRI_CGCM3_mhpdif3_p100,MRI_CGCM3_mhpdif1_p80,MRI_CGCM3_mhpdif2_p80,MRI_CGCM3_mhpdif3_p80]= ...
    F_perc(MRI_CGCM3_mhpdif1,MRI_CGCM3_mhpdif2,MRI_CGCM3_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[MRI_ESM1_mhpdif1_p100,MRI_ESM1_mhpdif2_p100,MRI_ESM1_mhpdif3_p100,MRI_ESM1_mhpdif1_p80,MRI_ESM1_mhpdif2_p80,MRI_ESM1_mhpdif3_p80]= ...
    F_perc(MRI_ESM1_mhpdif1,MRI_ESM1_mhpdif2,MRI_ESM1_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[NorESM1_M_mhpdif1_p100,NorESM1_M_mhpdif2_p100,NorESM1_M_mhpdif3_p100,NorESM1_M_mhpdif1_p80,NorESM1_M_mhpdif2_p80,NorESM1_M_mhpdif3_p80]= ...
    F_perc(NorESM1_M_mhpdif1,NorESM1_M_mhpdif2,NorESM1_M_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
[avg_mhpdif1_p100,avg_mhpdif2_p100,avg_mhpdif3_p100,avg_mhpdif1_p80,avg_mhpdif2_p80,avg_mhpdif3_p80]= ...
    F_perc(avg_mhpdif1,avg_mhpdif2,avg_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
% Calculate average differences of H_{EEP_n} for 100% and 80% significance test
hhpdif1_positive_pct(SMAP_mean_SM<0.1)=nan;
hhpdif1_negative_pct(SMAP_mean_SM<0.1)=nan;
hhpdif2_positive_pct(SMAP_mean_SM<0.1)=nan;
hhpdif2_negative_pct(SMAP_mean_SM<0.1)=nan;
hhpdif3_positive_pct(SMAP_mean_SM<0.1)=nan;
hhpdif3_negative_pct(SMAP_mean_SM<0.1)=nan;
hhpdif1_p_pct=hhpdif1_positive_pct;
hhpdif1_n_pct=hhpdif1_negative_pct;
hhpdif2_p_pct=hhpdif2_positive_pct;
hhpdif2_n_pct=hhpdif2_negative_pct;
hhpdif3_p_pct=hhpdif3_positive_pct;
hhpdif3_n_pct=hhpdif3_negative_pct;
[BCC_CSM_hhpdif1_p100,BCC_CSM_hhpdif2_p100,BCC_CSM_hhpdif3_p100,BCC_CSM_hhpdif1_p80,BCC_CSM_hhpdif2_p80,BCC_CSM_hhpdif3_p80]= ...
    F_perc(BCC_CSM_hhpdif1,BCC_CSM_hhpdif2,BCC_CSM_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[BNU_ESM_hhpdif1_p100,BNU_ESM_hhpdif2_p100,BNU_ESM_hhpdif3_p100,BNU_ESM_hhpdif1_p80,BNU_ESM_hhpdif2_p80,BNU_ESM_hhpdif3_p80]= ...
    F_perc(BNU_ESM_hhpdif1,BNU_ESM_hhpdif2,BNU_ESM_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[CanESM2_hhpdif1_p100,CanESM2_hhpdif2_p100,CanESM2_hhpdif3_p100,CanESM2_hhpdif1_p80,CanESM2_hhpdif2_p80,CanESM2_hhpdif3_p80]= ...
    F_perc(CanESM2_hhpdif1,CanESM2_hhpdif2,CanESM2_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[CNRM_CM5_hhpdif1_p100,CNRM_CM5_hhpdif2_p100,CNRM_CM5_hhpdif3_p100,CNRM_CM5_hhpdif1_p80,CNRM_CM5_hhpdif2_p80,CNRM_CM5_hhpdif3_p80]= ...
    F_perc(CNRM_CM5_hhpdif1,CNRM_CM5_hhpdif2,CNRM_CM5_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[CSIRO_Mk_hhpdif1_p100,CSIRO_Mk_hhpdif2_p100,CSIRO_Mk_hhpdif3_p100,CSIRO_Mk_hhpdif1_p80,CSIRO_Mk_hhpdif2_p80,CSIRO_Mk_hhpdif3_p80]= ...
    F_perc(CSIRO_Mk_hhpdif1,CSIRO_Mk_hhpdif2,CSIRO_Mk_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[GFDL_CM3_hhpdif1_p100,GFDL_CM3_hhpdif2_p100,GFDL_CM3_hhpdif3_p100,GFDL_CM3_hhpdif1_p80,GFDL_CM3_hhpdif2_p80,GFDL_CM3_hhpdif3_p80]= ...
    F_perc(GFDL_CM3_hhpdif1,GFDL_CM3_hhpdif2,GFDL_CM3_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[GFDL_ESM2G_hhpdif1_p100,GFDL_ESM2G_hhpdif2_p100,GFDL_ESM2G_hhpdif3_p100,GFDL_ESM2G_hhpdif1_p80,GFDL_ESM2G_hhpdif2_p80,GFDL_ESM2G_hhpdif3_p80]= ...
    F_perc(GFDL_ESM2G_hhpdif1,GFDL_ESM2G_hhpdif2,GFDL_ESM2G_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[GFDL_ESM2M_hhpdif1_p100,GFDL_ESM2M_hhpdif2_p100,GFDL_ESM2M_hhpdif3_p100,GFDL_ESM2M_hhpdif1_p80,GFDL_ESM2M_hhpdif2_p80,GFDL_ESM2M_hhpdif3_p80]= ...
    F_perc(GFDL_ESM2M_hhpdif1,GFDL_ESM2M_hhpdif2,GFDL_ESM2M_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[HadGEM2_CC_hhpdif1_p100,HadGEM2_CC_hhpdif2_p100,HadGEM2_CC_hhpdif3_p100,HadGEM2_CC_hhpdif1_p80,HadGEM2_CC_hhpdif2_p80,HadGEM2_CC_hhpdif3_p80]= ...
    F_perc(HadGEM2_CC_hhpdif1,HadGEM2_CC_hhpdif2,HadGEM2_CC_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[HadGEM2_ES_hhpdif1_p100,HadGEM2_ES_hhpdif2_p100,HadGEM2_ES_hhpdif3_p100,HadGEM2_ES_hhpdif1_p80,HadGEM2_ES_hhpdif2_p80,HadGEM2_ES_hhpdif3_p80]= ...
    F_perc(HadGEM2_ES_hhpdif1,HadGEM2_ES_hhpdif2,HadGEM2_ES_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[inmcm4_hhpdif1_p100,inmcm4_hhpdif2_p100,inmcm4_hhpdif3_p100,inmcm4_hhpdif1_p80,inmcm4_hhpdif2_p80,inmcm4_hhpdif3_p80]= ...
    F_perc(inmcm4_hhpdif1,inmcm4_hhpdif2,inmcm4_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[MIROC5_hhpdif1_p100,MIROC5_hhpdif2_p100,MIROC5_hhpdif3_p100,MIROC5_hhpdif1_p80,MIROC5_hhpdif2_p80,MIROC5_hhpdif3_p80]= ...
    F_perc(MIROC5_hhpdif1,MIROC5_hhpdif2,MIROC5_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[MIROC_ESM_hhpdif1_p100,MIROC_ESM_hhpdif2_p100,MIROC_ESM_hhpdif3_p100,MIROC_ESM_hhpdif1_p80,MIROC_ESM_hhpdif2_p80,MIROC_ESM_hhpdif3_p80]= ...
    F_perc(MIROC_ESM_hhpdif1,MIROC_ESM_hhpdif2,MIROC_ESM_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[MIROC_ESM_CHEM_hhpdif1_p100,MIROC_ESM_CHEM_hhpdif2_p100,MIROC_ESM_CHEM_hhpdif3_p100,MIROC_ESM_CHEM_hhpdif1_p80,MIROC_ESM_CHEM_hhpdif2_p80,MIROC_ESM_CHEM_hhpdif3_p80]= ...
    F_perc(MIROC_ESM_CHEM_hhpdif1,MIROC_ESM_CHEM_hhpdif2,MIROC_ESM_CHEM_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[MRI_CGCM3_hhpdif1_p100,MRI_CGCM3_hhpdif2_p100,MRI_CGCM3_hhpdif3_p100,MRI_CGCM3_hhpdif1_p80,MRI_CGCM3_hhpdif2_p80,MRI_CGCM3_hhpdif3_p80]= ...
    F_perc(MRI_CGCM3_hhpdif1,MRI_CGCM3_hhpdif2,MRI_CGCM3_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[MRI_ESM1_hhpdif1_p100,MRI_ESM1_hhpdif2_p100,MRI_ESM1_hhpdif3_p100,MRI_ESM1_hhpdif1_p80,MRI_ESM1_hhpdif2_p80,MRI_ESM1_hhpdif3_p80]= ...
    F_perc(MRI_ESM1_hhpdif1,MRI_ESM1_hhpdif2,MRI_ESM1_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[NorESM1_M_hhpdif1_p100,NorESM1_M_hhpdif2_p100,NorESM1_M_hhpdif3_p100,NorESM1_M_hhpdif1_p80,NorESM1_M_hhpdif2_p80,NorESM1_M_hhpdif3_p80]= ...
    F_perc(NorESM1_M_hhpdif1,NorESM1_M_hhpdif2,NorESM1_M_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
[avg_hhpdif1_p100,avg_hhpdif2_p100,avg_hhpdif3_p100,avg_hhpdif1_p80,avg_hhpdif2_p80,avg_hhpdif3_p80]= ...
    F_perc(avg_hhpdif1,avg_hhpdif2,avg_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
% Calculate CV of H_{SEP_n} difference
[std_mhpdif1,std_mhpdif1_val]=F_std(BCC_CSM_mhpdif1,BNU_ESM_mhpdif1,CanESM2_mhpdif1,CNRM_CM5_mhpdif1,CSIRO_Mk_mhpdif1,GFDL_CM3_mhpdif1,GFDL_ESM2G_mhpdif1,GFDL_ESM2M_mhpdif1,HadGEM2_CC_mhpdif1,...
    HadGEM2_ES_mhpdif1,inmcm4_mhpdif1,MIROC5_mhpdif1,MIROC_ESM_mhpdif1,MIROC_ESM_CHEM_mhpdif1,MRI_CGCM3_mhpdif1,MRI_ESM1_mhpdif1,NorESM1_M_mhpdif1);
[std_mhpdif2,std_mhpdif2_val]=F_std(BCC_CSM_mhpdif2,BNU_ESM_mhpdif2,CanESM2_mhpdif2,CNRM_CM5_mhpdif2,CSIRO_Mk_mhpdif2,GFDL_CM3_mhpdif2,GFDL_ESM2G_mhpdif2,GFDL_ESM2M_mhpdif2,HadGEM2_CC_mhpdif2,...
    HadGEM2_ES_mhpdif2,inmcm4_mhpdif2,MIROC5_mhpdif2,MIROC_ESM_mhpdif2,MIROC_ESM_CHEM_mhpdif2,MRI_CGCM3_mhpdif2,MRI_ESM1_mhpdif2,NorESM1_M_mhpdif2);
[std_mhpdif3,std_mhpdif3_val]=F_std(BCC_CSM_mhpdif3,BNU_ESM_mhpdif3,CanESM2_mhpdif3,CNRM_CM5_mhpdif3,CSIRO_Mk_mhpdif3,GFDL_CM3_mhpdif3,GFDL_ESM2G_mhpdif3,GFDL_ESM2M_mhpdif3,HadGEM2_CC_mhpdif3,...
    HadGEM2_ES_mhpdif3,inmcm4_mhpdif3,MIROC5_mhpdif3,MIROC_ESM_mhpdif3,MIROC_ESM_CHEM_mhpdif3,MRI_CGCM3_mhpdif3,MRI_ESM1_mhpdif3,NorESM1_M_mhpdif3);
cv_mhpdif1=abs(std_mhpdif1./avg_mhpdif1);
cv_mhpdif2=abs(std_mhpdif2./avg_mhpdif2);
cv_mhpdif3=abs(std_mhpdif3./avg_mhpdif3);
% Calculate CV of H_{EEP_n} difference
[std_hhpdif1,std_hhpdif1_val]=F_std(BCC_CSM_hhpdif1,BNU_ESM_hhpdif1,CanESM2_hhpdif1,CNRM_CM5_hhpdif1,CSIRO_Mk_hhpdif1,GFDL_CM3_hhpdif1,GFDL_ESM2G_hhpdif1,GFDL_ESM2M_hhpdif1,HadGEM2_CC_hhpdif1,...
    HadGEM2_ES_hhpdif1,inmcm4_hhpdif1,MIROC5_hhpdif1,MIROC_ESM_hhpdif1,MIROC_ESM_CHEM_hhpdif1,MRI_CGCM3_hhpdif1,MRI_ESM1_hhpdif1,NorESM1_M_hhpdif1);
[std_hhpdif2,std_hhpdif2_val]=F_std(BCC_CSM_hhpdif2,BNU_ESM_hhpdif2,CanESM2_hhpdif2,CNRM_CM5_hhpdif2,CSIRO_Mk_hhpdif2,GFDL_CM3_hhpdif2,GFDL_ESM2G_hhpdif2,GFDL_ESM2M_hhpdif2,HadGEM2_CC_hhpdif2,...
    HadGEM2_ES_hhpdif2,inmcm4_hhpdif2,MIROC5_hhpdif2,MIROC_ESM_hhpdif2,MIROC_ESM_CHEM_hhpdif2,MRI_CGCM3_hhpdif2,MRI_ESM1_hhpdif2,NorESM1_M_hhpdif2);
[std_hhpdif3,std_hhpdif3_val]=F_std(BCC_CSM_hhpdif3,BNU_ESM_hhpdif3,CanESM2_hhpdif3,CNRM_CM5_hhpdif3,CSIRO_Mk_hhpdif3,GFDL_CM3_hhpdif3,GFDL_ESM2G_hhpdif3,GFDL_ESM2M_hhpdif3,HadGEM2_CC_hhpdif3,...
    HadGEM2_ES_hhpdif3,inmcm4_hhpdif3,MIROC5_hhpdif3,MIROC_ESM_hhpdif3,MIROC_ESM_CHEM_hhpdif3,MRI_CGCM3_hhpdif3,MRI_ESM1_hhpdif3,NorESM1_M_hhpdif3);
cv_hhpdif1=abs(std_hhpdif1./avg_hhpdif1);
cv_hhpdif2=abs(std_hhpdif2./avg_hhpdif2);
cv_hhpdif3=abs(std_hhpdif3./avg_hhpdif3);
% Calculate CV of H_{SEP_n}
avg_mhpr1=(BCC_CSM_mhpr1+BNU_ESM_mhpr1+CanESM2_mhpr1+CNRM_CM5_mhpr1+CSIRO_Mk_mhpr1+GFDL_CM3_mhpr1+GFDL_ESM2G_mhpr1+GFDL_ESM2M_mhpr1+HadGEM2_CC_mhpr1+HadGEM2_ES_mhpr1+inmcm4_mhpr1+MIROC5_mhpr1+MIROC_ESM_mhpr1+MIROC_ESM_CHEM_mhpr1+MRI_CGCM3_mhpr1+MRI_ESM1_mhpr1+NorESM1_M_mhpr1)/17;
avg_mhpr2=(BCC_CSM_mhpr2+BNU_ESM_mhpr2+CanESM2_mhpr2+CNRM_CM5_mhpr2+CSIRO_Mk_mhpr2+GFDL_CM3_mhpr2+GFDL_ESM2G_mhpr2+GFDL_ESM2M_mhpr2+HadGEM2_CC_mhpr2+HadGEM2_ES_mhpr2+inmcm4_mhpr2+MIROC5_mhpr2+MIROC_ESM_mhpr2+MIROC_ESM_CHEM_mhpr2+MRI_CGCM3_mhpr2+MRI_ESM1_mhpr2+NorESM1_M_mhpr2)/17;
avg_mhpr3=(BCC_CSM_mhpr3+BNU_ESM_mhpr3+CanESM2_mhpr3+CNRM_CM5_mhpr3+CSIRO_Mk_mhpr3+GFDL_CM3_mhpr3+GFDL_ESM2G_mhpr3+GFDL_ESM2M_mhpr3+HadGEM2_CC_mhpr3+HadGEM2_ES_mhpr3+inmcm4_mhpr3+MIROC5_mhpr3+MIROC_ESM_mhpr3+MIROC_ESM_CHEM_mhpr3+MRI_CGCM3_mhpr3+MRI_ESM1_mhpr3+NorESM1_M_mhpr3)/17;
[std_mhpr1,std_mhpr1_val]=F_std(BCC_CSM_mhpr1,BNU_ESM_mhpr1,CanESM2_mhpr1,CNRM_CM5_mhpr1,CSIRO_Mk_mhpr1,GFDL_CM3_mhpr1,GFDL_ESM2G_mhpr1,GFDL_ESM2M_mhpr1,HadGEM2_CC_mhpr1,...
    HadGEM2_ES_mhpr1,inmcm4_mhpr1,MIROC5_mhpr1,MIROC_ESM_mhpr1,MIROC_ESM_CHEM_mhpr1,MRI_CGCM3_mhpr1,MRI_ESM1_mhpr1,NorESM1_M_mhpr1);
[std_mhpr2,std_mhpr2_val]=F_std(BCC_CSM_mhpr2,BNU_ESM_mhpr2,CanESM2_mhpr2,CNRM_CM5_mhpr2,CSIRO_Mk_mhpr2,GFDL_CM3_mhpr2,GFDL_ESM2G_mhpr2,GFDL_ESM2M_mhpr2,HadGEM2_CC_mhpr2,...
    HadGEM2_ES_mhpr2,inmcm4_mhpr2,MIROC5_mhpr2,MIROC_ESM_mhpr2,MIROC_ESM_CHEM_mhpr2,MRI_CGCM3_mhpr2,MRI_ESM1_mhpr2,NorESM1_M_mhpr2);
[std_mhpr3,std_mhpr3_val]=F_std(BCC_CSM_mhpr3,BNU_ESM_mhpr3,CanESM2_mhpr3,CNRM_CM5_mhpr3,CSIRO_Mk_mhpr3,GFDL_CM3_mhpr3,GFDL_ESM2G_mhpr3,GFDL_ESM2M_mhpr3,HadGEM2_CC_mhpr3,...
    HadGEM2_ES_mhpr3,inmcm4_mhpr3,MIROC5_mhpr3,MIROC_ESM_mhpr3,MIROC_ESM_CHEM_mhpr3,MRI_CGCM3_mhpr3,MRI_ESM1_mhpr3,NorESM1_M_mhpr3);
cv_mhpr1=abs(std_mhpr1./avg_mhpr1);
cv_mhpr2=abs(std_mhpr2./avg_mhpr2);
cv_mhpr3=abs(std_mhpr3./avg_mhpr3);
mhpdif1_p_pct=mhpdif1_positive_pct;
mhpdif1_n_pct=mhpdif1_negative_pct;
mhpdif2_p_pct=mhpdif2_positive_pct;
mhpdif2_n_pct=mhpdif2_negative_pct;
mhpdif3_p_pct=mhpdif3_positive_pct;
mhpdif3_n_pct=mhpdif3_negative_pct;
[cv_mhpr1_p100,cv_mhpr2_p100,cv_mhpr3_p100,cv_mhpr1_p80,cv_mhpr2_p80,cv_mhpr3_p80]= ...
    F_perc(cv_mhpr1,cv_mhpr2,cv_mhpr3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
% Calculate CV of H_{EEP_n}
avg_hhpr1=(BCC_CSM_hhpr1+BNU_ESM_hhpr1+CanESM2_hhpr1+CNRM_CM5_hhpr1+CSIRO_Mk_hhpr1+GFDL_CM3_hhpr1+GFDL_ESM2G_hhpr1+GFDL_ESM2M_hhpr1+HadGEM2_CC_hhpr1+HadGEM2_ES_hhpr1+inmcm4_hhpr1+MIROC5_hhpr1+MIROC_ESM_hhpr1+MIROC_ESM_CHEM_hhpr1+MRI_CGCM3_hhpr1+MRI_ESM1_hhpr1+NorESM1_M_hhpr1)/17;
avg_hhpr2=(BCC_CSM_hhpr2+BNU_ESM_hhpr2+CanESM2_hhpr2+CNRM_CM5_hhpr2+CSIRO_Mk_hhpr2+GFDL_CM3_hhpr2+GFDL_ESM2G_hhpr2+GFDL_ESM2M_hhpr2+HadGEM2_CC_hhpr2+HadGEM2_ES_hhpr2+inmcm4_hhpr2+MIROC5_hhpr2+MIROC_ESM_hhpr2+MIROC_ESM_CHEM_hhpr2+MRI_CGCM3_hhpr2+MRI_ESM1_hhpr2+NorESM1_M_hhpr2)/17;
avg_hhpr3=(BCC_CSM_hhpr3+BNU_ESM_hhpr3+CanESM2_hhpr3+CNRM_CM5_hhpr3+CSIRO_Mk_hhpr3+GFDL_CM3_hhpr3+GFDL_ESM2G_hhpr3+GFDL_ESM2M_hhpr3+HadGEM2_CC_hhpr3+HadGEM2_ES_hhpr3+inmcm4_hhpr3+MIROC5_hhpr3+MIROC_ESM_hhpr3+MIROC_ESM_CHEM_hhpr3+MRI_CGCM3_hhpr3+MRI_ESM1_hhpr3+NorESM1_M_hhpr3)/17;
[std_hhpr1,std_hhpr1_val]=F_std(BCC_CSM_hhpr1,BNU_ESM_hhpr1,CanESM2_hhpr1,CNRM_CM5_hhpr1,CSIRO_Mk_hhpr1,GFDL_CM3_hhpr1,GFDL_ESM2G_hhpr1,GFDL_ESM2M_hhpr1,HadGEM2_CC_hhpr1,...
    HadGEM2_ES_hhpr1,inmcm4_hhpr1,MIROC5_hhpr1,MIROC_ESM_hhpr1,MIROC_ESM_CHEM_hhpr1,MRI_CGCM3_hhpr1,MRI_ESM1_hhpr1,NorESM1_M_hhpr1);
[std_hhpr2,std_hhpr2_val]=F_std(BCC_CSM_hhpr2,BNU_ESM_hhpr2,CanESM2_hhpr2,CNRM_CM5_hhpr2,CSIRO_Mk_hhpr2,GFDL_CM3_hhpr2,GFDL_ESM2G_hhpr2,GFDL_ESM2M_hhpr2,HadGEM2_CC_hhpr2,...
    HadGEM2_ES_hhpr2,inmcm4_hhpr2,MIROC5_hhpr2,MIROC_ESM_hhpr2,MIROC_ESM_CHEM_hhpr2,MRI_CGCM3_hhpr2,MRI_ESM1_hhpr2,NorESM1_M_hhpr2);
[std_hhpr3,std_hhpr3_val]=F_std(BCC_CSM_hhpr3,BNU_ESM_hhpr3,CanESM2_hhpr3,CNRM_CM5_hhpr3,CSIRO_Mk_hhpr3,GFDL_CM3_hhpr3,GFDL_ESM2G_hhpr3,GFDL_ESM2M_hhpr3,HadGEM2_CC_hhpr3,...
    HadGEM2_ES_hhpr3,inmcm4_hhpr3,MIROC5_hhpr3,MIROC_ESM_hhpr3,MIROC_ESM_CHEM_hhpr3,MRI_CGCM3_hhpr3,MRI_ESM1_hhpr3,NorESM1_M_hhpr3);
cv_hhpr1=abs(std_hhpr1./avg_hhpr1);
cv_hhpr2=abs(std_hhpr2./avg_hhpr2);
cv_hhpr3=abs(std_hhpr3./avg_hhpr3);
hhpdif1_p_pct=hhpdif1_positive_pct;
hhpdif1_n_pct=hhpdif1_negative_pct;
hhpdif2_p_pct=hhpdif2_positive_pct;
hhpdif2_n_pct=hhpdif2_negative_pct;
hhpdif3_p_pct=hhpdif3_positive_pct;
hhpdif3_n_pct=hhpdif3_negative_pct;
[cv_hhpr1_p100,cv_hhpr2_p100,cv_hhpr3_p100,cv_hhpr1_p80,cv_hhpr2_p80,cv_hhpr3_p80]= ...
    F_perc(cv_hhpr1,cv_hhpr2,cv_hhpr3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);

% % Functions
function [std_f_comp,std_f_val]=F_std(model_1,model_2,model_3,model_4,model_5,model_6,model_7,model_8,model_9,model_10,model_11,model_12,model_13,model_14,model_15,model_16,model_17)
count=1;
std_f_comp(406,964)=0;
for i=1:406
    std_f(1,:)=model_1(i,:);
    std_f(2,:)=model_2(i,:);
    std_f(3,:)=model_3(i,:);
    std_f(4,:)=model_4(i,:);
    std_f(5,:)=model_5(i,:);
    std_f(6,:)=model_6(i,:);
    std_f(7,:)=model_7(i,:);
    std_f(8,:)=model_8(i,:);
    std_f(9,:)=model_9(i,:);
    std_f(10,:)=model_10(i,:);
    std_f(11,:)=model_11(i,:);
    std_f(12,:)=model_12(i,:);
    std_f(13,:)=model_13(i,:);
    std_f(14,:)=model_14(i,:);
    std_f(15,:)=model_15(i,:);
    std_f(16,:)=model_16(i,:);
    std_f(17,:)=model_17(i,:);
    std_dif_f=std(std_f);
    std_f_comp(count,:)=std_dif_f;
    count=count+1;
end
std_f_val=nanmean(std_f_comp(:));
end

function [model_mhpr1,model_mhpr2,model_mhpr3]=mhpr_tran(model_m1,model_h1,model_p1,model_m2,model_h2,model_p2,model_m3,model_h3,model_p3)
model_mhpr1=model_m1./(model_h1+model_p1);
model_mhpr2=model_m2./(model_h2+model_p2);
model_mhpr3=model_m3./(model_h3+model_p3);
end

function [model_hhpr1,model_hhpr2,model_hhpr3]=hhpr_tran(model_h1,model_p1,model_h2,model_p2,model_h3,model_p3)
model_hhpr1=model_h1./(model_h1+model_p1);
model_hhpr2=model_h2./(model_h2+model_p2);
model_hhpr3=model_h3./(model_h3+model_p3);
end

function [nF1,nF2,nF3]=nF_meanS(F1,F2,F3,meanS)
F1(meanS<0.1)=nan;
F2(meanS<0.1)=nan;
F3(meanS<0.1)=nan;
nF1=F1./(F1+F2+F3);
nF2=F2./(F1+F2+F3);
nF3=F3./(F1+F2+F3);
end

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

function [dif1_100,dif2_100,dif3_100,dif1_80,dif2_80,dif3_80]=F_perc(dif1,dif2,dif3,dif1_p_pct,dif1_n_pct,dif2_p_pct,dif2_n_pct,dif3_p_pct,dif3_n_pct)
% Get logic map of 100% and 80% significant test
log1_100=(dif1_p_pct==1) | (dif1_n_pct==1);
log1_80=((dif1_p_pct>=14/17) & (dif1_p_pct<1)) | ((dif1_n_pct>=14/17) & (dif1_n_pct<1));
log2_100=(dif2_p_pct==1) | (dif2_n_pct==1);
log2_80=((dif2_p_pct>=14/17) & (dif2_p_pct<1)) | ((dif2_n_pct>=14/17) & (dif2_n_pct<1));
log3_100=(dif3_p_pct==1) | (dif3_n_pct==1);
log3_80=((dif3_p_pct>=14/17) & (dif3_p_pct<1)) | ((dif3_n_pct>=14/17) & (dif3_n_pct<1));
% Get actual map of 100% significant test
dif1_100_map=dif1;
dif2_100_map=dif2;
dif3_100_map=dif3;
dif1_100_map(log1_100==0)=nan;
dif2_100_map(log2_100==0)=nan;
dif3_100_map(log3_100==0)=nan;
% Get actual map of 80% significant test
dif1_80_map=dif1;
dif2_80_map=dif2;
dif3_80_map=dif3;
dif1_80_map((log1_80+log1_100)==0)=nan;
dif2_80_map((log2_80+log2_100)==0)=nan;
dif3_80_map((log3_80+log3_100)==0)=nan;
% Get sum of 100% significant test
dif1_100=nanmean(dif1_100_map(:));
dif2_100=nanmean(dif2_100_map(:));
dif3_100=nanmean(dif3_100_map(:));
% Get sum of 80% significant test
dif1_80=nanmean(dif1_80_map(:));
dif2_80=nanmean(dif2_80_map(:));
dif3_80=nanmean(dif3_80_map(:));
end