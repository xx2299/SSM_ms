% % SSM_n multimodel differences (for Figure 6)
% SSM_n model average
avg_mF1=(BCC_CSM_new_mF1+BNU_ESM_new_mF1+CanESM2_new_mF1+CNRM_CM5_new_mF1+CSIRO_Mk_new_mF1+GFDL_CM3_new_mF1+GFDL_ESM2G_new_mF1+GFDL_ESM2M_new_mF1+HadGEM2_CC_new_mF1+HadGEM2_ES_new_mF1+inmcm4_new_mF1+MIROC5_new_mF1+MIROC_ESM_new_mF1+MIROC_ESM_CHEM_new_mF1+MRI_CGCM3_new_mF1+MRI_ESM1_new_mF1+NorESM1_M_new_mF1)/17;
avg_mF2=(BCC_CSM_new_mF2+BNU_ESM_new_mF2+CanESM2_new_mF2+CNRM_CM5_new_mF2+CSIRO_Mk_new_mF2+GFDL_CM3_new_mF2+GFDL_ESM2G_new_mF2+GFDL_ESM2M_new_mF2+HadGEM2_CC_new_mF2+HadGEM2_ES_new_mF2+inmcm4_new_mF2+MIROC5_new_mF2+MIROC_ESM_new_mF2+MIROC_ESM_CHEM_new_mF2+MRI_CGCM3_new_mF2+MRI_ESM1_new_mF2+NorESM1_M_new_mF2)/17;
avg_mF3=(BCC_CSM_new_mF3+BNU_ESM_new_mF3+CanESM2_new_mF3+CNRM_CM5_new_mF3+CSIRO_Mk_new_mF3+GFDL_CM3_new_mF3+GFDL_ESM2G_new_mF3+GFDL_ESM2M_new_mF3+HadGEM2_CC_new_mF3+HadGEM2_ES_new_mF3+inmcm4_new_mF3+MIROC5_new_mF3+MIROC_ESM_new_mF3+MIROC_ESM_CHEM_new_mF3+MRI_CGCM3_new_mF3+MRI_ESM1_new_mF3+NorESM1_M_new_mF3)/17;
[avg_mF1_n,avg_mF2_n,avg_mF3_n]=nF_meanS(avg_mF1,avg_mF2,avg_mF3,SMAP_mean_SM);
avg_mF1_n_value=nanmean(avg_mF1_n(:));
avg_mF2_n_value=nanmean(avg_mF2_n(:));
avg_mF3_n_value=nanmean(avg_mF3_n(:));
% Calculate SSM_n differences and prepare for significance test
[BCC_CSM_mdif1,BCC_CSM_mdif1_r]=significance_prepare(BCC_CSM_new_mF1,SMF1);
[BCC_CSM_mdif2,BCC_CSM_mdif2_r]=significance_prepare(BCC_CSM_new_mF2,SMF2);
[BCC_CSM_mdif3,BCC_CSM_mdif3_r]=significance_prepare(BCC_CSM_new_mF3,SMF3);
[BNU_ESM_mdif1,BNU_ESM_mdif1_r]=significance_prepare(BNU_ESM_new_mF1,SMF1);
[BNU_ESM_mdif2,BNU_ESM_mdif2_r]=significance_prepare(BNU_ESM_new_mF2,SMF2);
[BNU_ESM_mdif3,BNU_ESM_mdif3_r]=significance_prepare(BNU_ESM_new_mF3,SMF3);
[CanESM2_mdif1,CanESM2_mdif1_r]=significance_prepare(CanESM2_new_mF1,SMF1);
[CanESM2_mdif2,CanESM2_mdif2_r]=significance_prepare(CanESM2_new_mF2,SMF2);
[CanESM2_mdif3,CanESM2_mdif3_r]=significance_prepare(CanESM2_new_mF3,SMF3);
[CNRM_CM5_mdif1,CNRM_CM5_mdif1_r]=significance_prepare(CNRM_CM5_new_mF1,SMF1);
[CNRM_CM5_mdif2,CNRM_CM5_mdif2_r]=significance_prepare(CNRM_CM5_new_mF2,SMF2);
[CNRM_CM5_mdif3,CNRM_CM5_mdif3_r]=significance_prepare(CNRM_CM5_new_mF3,SMF3);
[CSIRO_Mk_mdif1,CSIRO_Mk_mdif1_r]=significance_prepare(CSIRO_Mk_new_mF1,SMF1);
[CSIRO_Mk_mdif2,CSIRO_Mk_mdif2_r]=significance_prepare(CSIRO_Mk_new_mF2,SMF2);
[CSIRO_Mk_mdif3,CSIRO_Mk_mdif3_r]=significance_prepare(CSIRO_Mk_new_mF3,SMF3);
[GFDL_CM3_mdif1,GFDL_CM3_mdif1_r]=significance_prepare(GFDL_CM3_new_mF1,SMF1);
[GFDL_CM3_mdif2,GFDL_CM3_mdif2_r]=significance_prepare(GFDL_CM3_new_mF2,SMF2);
[GFDL_CM3_mdif3,GFDL_CM3_mdif3_r]=significance_prepare(GFDL_CM3_new_mF3,SMF3);
[GFDL_ESM2G_mdif1,GFDL_ESM2G_mdif1_r]=significance_prepare(GFDL_ESM2G_new_mF1,SMF1);
[GFDL_ESM2G_mdif2,GFDL_ESM2G_mdif2_r]=significance_prepare(GFDL_ESM2G_new_mF2,SMF2);
[GFDL_ESM2G_mdif3,GFDL_ESM2G_mdif3_r]=significance_prepare(GFDL_ESM2G_new_mF3,SMF3);
[GFDL_ESM2M_mdif1,GFDL_ESM2M_mdif1_r]=significance_prepare(GFDL_ESM2M_new_mF1,SMF1);
[GFDL_ESM2M_mdif2,GFDL_ESM2M_mdif2_r]=significance_prepare(GFDL_ESM2M_new_mF2,SMF2);
[GFDL_ESM2M_mdif3,GFDL_ESM2M_mdif3_r]=significance_prepare(GFDL_ESM2M_new_mF3,SMF3);
[HadGEM2_CC_mdif1,HadGEM2_CC_mdif1_r]=significance_prepare(HadGEM2_CC_new_mF1,SMF1);
[HadGEM2_CC_mdif2,HadGEM2_CC_mdif2_r]=significance_prepare(HadGEM2_CC_new_mF2,SMF2);
[HadGEM2_CC_mdif3,HadGEM2_CC_mdif3_r]=significance_prepare(HadGEM2_CC_new_mF3,SMF3);
[HadGEM2_ES_mdif1,HadGEM2_ES_mdif1_r]=significance_prepare(HadGEM2_ES_new_mF1,SMF1);
[HadGEM2_ES_mdif2,HadGEM2_ES_mdif2_r]=significance_prepare(HadGEM2_ES_new_mF2,SMF2);
[HadGEM2_ES_mdif3,HadGEM2_ES_mdif3_r]=significance_prepare(HadGEM2_ES_new_mF3,SMF3);
[inmcm4_mdif1,inmcm4_mdif1_r]=significance_prepare(inmcm4_new_mF1,SMF1);
[inmcm4_mdif2,inmcm4_mdif2_r]=significance_prepare(inmcm4_new_mF2,SMF2);
[inmcm4_mdif3,inmcm4_mdif3_r]=significance_prepare(inmcm4_new_mF3,SMF3);
[MIROC5_mdif1,MIROC5_mdif1_r]=significance_prepare(MIROC5_new_mF1,SMF1);
[MIROC5_mdif2,MIROC5_mdif2_r]=significance_prepare(MIROC5_new_mF2,SMF2);
[MIROC5_mdif3,MIROC5_mdif3_r]=significance_prepare(MIROC5_new_mF3,SMF3);
[MIROC_ESM_mdif1,MIROC_ESM_mdif1_r]=significance_prepare(MIROC_ESM_new_mF1,SMF1);
[MIROC_ESM_mdif2,MIROC_ESM_mdif2_r]=significance_prepare(MIROC_ESM_new_mF2,SMF2);
[MIROC_ESM_mdif3,MIROC_ESM_mdif3_r]=significance_prepare(MIROC_ESM_new_mF3,SMF3);
[MIROC_ESM_CHEM_mdif1,MIROC_ESM_CHEM_mdif1_r]=significance_prepare(MIROC_ESM_CHEM_new_mF1,SMF1);
[MIROC_ESM_CHEM_mdif2,MIROC_ESM_CHEM_mdif2_r]=significance_prepare(MIROC_ESM_CHEM_new_mF2,SMF2);
[MIROC_ESM_CHEM_mdif3,MIROC_ESM_CHEM_mdif3_r]=significance_prepare(MIROC_ESM_CHEM_new_mF3,SMF3);
[MRI_CGCM3_mdif1,MRI_CGCM3_mdif1_r]=significance_prepare(MRI_CGCM3_new_mF1,SMF1);
[MRI_CGCM3_mdif2,MRI_CGCM3_mdif2_r]=significance_prepare(MRI_CGCM3_new_mF2,SMF2);
[MRI_CGCM3_mdif3,MRI_CGCM3_mdif3_r]=significance_prepare(MRI_CGCM3_new_mF3,SMF3);
[MRI_ESM1_mdif1,MRI_ESM1_mdif1_r]=significance_prepare(MRI_ESM1_new_mF1,SMF1);
[MRI_ESM1_mdif2,MRI_ESM1_mdif2_r]=significance_prepare(MRI_ESM1_new_mF2,SMF2);
[MRI_ESM1_mdif3,MRI_ESM1_mdif3_r]=significance_prepare(MRI_ESM1_new_mF3,SMF3);
[NorESM1_M_mdif1,NorESM1_M_mdif1_r]=significance_prepare(NorESM1_M_new_mF1,SMF1);
[NorESM1_M_mdif2,NorESM1_M_mdif2_r]=significance_prepare(NorESM1_M_new_mF2,SMF2);
[NorESM1_M_mdif3,NorESM1_M_mdif3_r]=significance_prepare(NorESM1_M_new_mF3,SMF3);
% Do significance test for SSM_n differences
mdif1_r=[BCC_CSM_mdif1_r,BNU_ESM_mdif1_r,CanESM2_mdif1_r,CNRM_CM5_mdif1_r,CSIRO_Mk_mdif1_r,GFDL_CM3_mdif1_r,GFDL_ESM2G_mdif1_r,GFDL_ESM2M_mdif1_r,HadGEM2_CC_mdif1_r,HadGEM2_ES_mdif1_r,inmcm4_mdif1_r,MIROC5_mdif1_r,MIROC_ESM_mdif1_r,MIROC_ESM_CHEM_mdif1_r,MRI_CGCM3_mdif1_r,MRI_ESM1_mdif1_r,NorESM1_M_mdif1_r];
mdif2_r=[BCC_CSM_mdif2_r,BNU_ESM_mdif2_r,CanESM2_mdif2_r,CNRM_CM5_mdif2_r,CSIRO_Mk_mdif2_r,GFDL_CM3_mdif2_r,GFDL_ESM2G_mdif2_r,GFDL_ESM2M_mdif2_r,HadGEM2_CC_mdif2_r,HadGEM2_ES_mdif2_r,inmcm4_mdif2_r,MIROC5_mdif2_r,MIROC_ESM_mdif2_r,MIROC_ESM_CHEM_mdif2_r,MRI_CGCM3_mdif2_r,MRI_ESM1_mdif2_r,NorESM1_M_mdif2_r];
mdif3_r=[BCC_CSM_mdif3_r,BNU_ESM_mdif3_r,CanESM2_mdif3_r,CNRM_CM5_mdif3_r,CSIRO_Mk_mdif3_r,GFDL_CM3_mdif3_r,GFDL_ESM2G_mdif3_r,GFDL_ESM2M_mdif3_r,HadGEM2_CC_mdif3_r,HadGEM2_ES_mdif3_r,inmcm4_mdif3_r,MIROC5_mdif3_r,MIROC_ESM_mdif3_r,MIROC_ESM_CHEM_mdif3_r,MRI_CGCM3_mdif3_r,MRI_ESM1_mdif3_r,NorESM1_M_mdif3_r];
[mdif1_positive_pct,mdif1_negative_pct]=significance_test(mdif1_r);
[mdif2_positive_pct,mdif2_negative_pct]=significance_test(mdif2_r);
[mdif3_positive_pct,mdif3_negative_pct]=significance_test(mdif3_r);
% Calculate average differences of SSM_n for 100% and 80% significance test
mdif1_p_pct=mdif1_positive_pct;
mdif1_n_pct=mdif1_negative_pct;
mdif2_p_pct=mdif2_positive_pct;
mdif2_n_pct=mdif2_negative_pct;
mdif3_p_pct=mdif3_positive_pct;
mdif3_n_pct=mdif3_negative_pct;
[BCC_CSM_mdif1_p100,BCC_CSM_mdif2_p100,BCC_CSM_mdif3_p100,BCC_CSM_mdif1_p80,BCC_CSM_mdif2_p80,BCC_CSM_mdif3_p80]= ...
    F_perc(BCC_CSM_mdif1,BCC_CSM_mdif2,BCC_CSM_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[BNU_ESM_mdif1_p100,BNU_ESM_mdif2_p100,BNU_ESM_mdif3_p100,BNU_ESM_mdif1_p80,BNU_ESM_mdif2_p80,BNU_ESM_mdif3_p80]= ...
    F_perc(BNU_ESM_mdif1,BNU_ESM_mdif2,BNU_ESM_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[CanESM2_mdif1_p100,CanESM2_mdif2_p100,CanESM2_mdif3_p100,CanESM2_mdif1_p80,CanESM2_mdif2_p80,CanESM2_mdif3_p80]= ...
    F_perc(CanESM2_mdif1,CanESM2_mdif2,CanESM2_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[CNRM_CM5_mdif1_p100,CNRM_CM5_mdif2_p100,CNRM_CM5_mdif3_p100,CNRM_CM5_mdif1_p80,CNRM_CM5_mdif2_p80,CNRM_CM5_mdif3_p80]= ...
    F_perc(CNRM_CM5_mdif1,CNRM_CM5_mdif2,CNRM_CM5_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[CSIRO_Mk_mdif1_p100,CSIRO_Mk_mdif2_p100,CSIRO_Mk_mdif3_p100,CSIRO_Mk_mdif1_p80,CSIRO_Mk_mdif2_p80,CSIRO_Mk_mdif3_p80]= ...
    F_perc(CSIRO_Mk_mdif1,CSIRO_Mk_mdif2,CSIRO_Mk_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[GFDL_CM3_mdif1_p100,GFDL_CM3_mdif2_p100,GFDL_CM3_mdif3_p100,GFDL_CM3_mdif1_p80,GFDL_CM3_mdif2_p80,GFDL_CM3_mdif3_p80]= ...
    F_perc(GFDL_CM3_mdif1,GFDL_CM3_mdif2,GFDL_CM3_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[GFDL_ESM2G_mdif1_p100,GFDL_ESM2G_mdif2_p100,GFDL_ESM2G_mdif3_p100,GFDL_ESM2G_mdif1_p80,GFDL_ESM2G_mdif2_p80,GFDL_ESM2G_mdif3_p80]= ...
    F_perc(GFDL_ESM2G_mdif1,GFDL_ESM2G_mdif2,GFDL_ESM2G_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[GFDL_ESM2M_mdif1_p100,GFDL_ESM2M_mdif2_p100,GFDL_ESM2M_mdif3_p100,GFDL_ESM2M_mdif1_p80,GFDL_ESM2M_mdif2_p80,GFDL_ESM2M_mdif3_p80]= ...
    F_perc(GFDL_ESM2M_mdif1,GFDL_ESM2M_mdif2,GFDL_ESM2M_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[HadGEM2_CC_mdif1_p100,HadGEM2_CC_mdif2_p100,HadGEM2_CC_mdif3_p100,HadGEM2_CC_mdif1_p80,HadGEM2_CC_mdif2_p80,HadGEM2_CC_mdif3_p80]= ...
    F_perc(HadGEM2_CC_mdif1,HadGEM2_CC_mdif2,HadGEM2_CC_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[HadGEM2_ES_mdif1_p100,HadGEM2_ES_mdif2_p100,HadGEM2_ES_mdif3_p100,HadGEM2_ES_mdif1_p80,HadGEM2_ES_mdif2_p80,HadGEM2_ES_mdif3_p80]= ...
    F_perc(HadGEM2_ES_mdif1,HadGEM2_ES_mdif2,HadGEM2_ES_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[inmcm4_mdif1_p100,inmcm4_mdif2_p100,inmcm4_mdif3_p100,inmcm4_mdif1_p80,inmcm4_mdif2_p80,inmcm4_mdif3_p80]= ...
    F_perc(inmcm4_mdif1,inmcm4_mdif2,inmcm4_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[MIROC5_mdif1_p100,MIROC5_mdif2_p100,MIROC5_mdif3_p100,MIROC5_mdif1_p80,MIROC5_mdif2_p80,MIROC5_mdif3_p80]= ...
    F_perc(MIROC5_mdif1,MIROC5_mdif2,MIROC5_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[MIROC_ESM_mdif1_p100,MIROC_ESM_mdif2_p100,MIROC_ESM_mdif3_p100,MIROC_ESM_mdif1_p80,MIROC_ESM_mdif2_p80,MIROC_ESM_mdif3_p80]= ...
    F_perc(MIROC_ESM_mdif1,MIROC_ESM_mdif2,MIROC_ESM_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[MIROC_ESM_CHEM_mdif1_p100,MIROC_ESM_CHEM_mdif2_p100,MIROC_ESM_CHEM_mdif3_p100,MIROC_ESM_CHEM_mdif1_p80,MIROC_ESM_CHEM_mdif2_p80,MIROC_ESM_CHEM_mdif3_p80]= ...
    F_perc(MIROC_ESM_CHEM_mdif1,MIROC_ESM_CHEM_mdif2,MIROC_ESM_CHEM_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[MRI_CGCM3_mdif1_p100,MRI_CGCM3_mdif2_p100,MRI_CGCM3_mdif3_p100,MRI_CGCM3_mdif1_p80,MRI_CGCM3_mdif2_p80,MRI_CGCM3_mdif3_p80]= ...
    F_perc(MRI_CGCM3_mdif1,MRI_CGCM3_mdif2,MRI_CGCM3_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[MRI_ESM1_mdif1_p100,MRI_ESM1_mdif2_p100,MRI_ESM1_mdif3_p100,MRI_ESM1_mdif1_p80,MRI_ESM1_mdif2_p80,MRI_ESM1_mdif3_p80]= ...
    F_perc(MRI_ESM1_mdif1,MRI_ESM1_mdif2,MRI_ESM1_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[NorESM1_M_mdif1_p100,NorESM1_M_mdif2_p100,NorESM1_M_mdif3_p100,NorESM1_M_mdif1_p80,NorESM1_M_mdif2_p80,NorESM1_M_mdif3_p80]= ...
    F_perc(NorESM1_M_mdif1,NorESM1_M_mdif2,NorESM1_M_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[avg_mdif1_p100,avg_mdif2_p100,avg_mdif3_p100,avg_mdif1_p80,avg_mdif2_p80,avg_mdif3_p80]= ...
    F_perc(avg_mdif1,avg_mdif2,avg_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
% Calculate CV of SSM_n difference
[std_mdif1,std_mdif1_val]=F_std(BCC_CSM_mdif1,BNU_ESM_mdif1,CanESM2_mdif1,CNRM_CM5_mdif1,CSIRO_Mk_mdif1,GFDL_CM3_mdif1,GFDL_ESM2G_mdif1,GFDL_ESM2M_mdif1,HadGEM2_CC_mdif1,...
    HadGEM2_ES_mdif1,inmcm4_mdif1,MIROC5_mdif1,MIROC_ESM_mdif1,MIROC_ESM_CHEM_mdif1,MRI_CGCM3_mdif1,MRI_ESM1_mdif1,NorESM1_M_mdif1);
[std_mdif2,std_mdif2_val]=F_std(BCC_CSM_mdif2,BNU_ESM_mdif2,CanESM2_mdif2,CNRM_CM5_mdif2,CSIRO_Mk_mdif2,GFDL_CM3_mdif2,GFDL_ESM2G_mdif2,GFDL_ESM2M_mdif2,HadGEM2_CC_mdif2,...
    HadGEM2_ES_mdif2,inmcm4_mdif2,MIROC5_mdif2,MIROC_ESM_mdif2,MIROC_ESM_CHEM_mdif2,MRI_CGCM3_mdif2,MRI_ESM1_mdif2,NorESM1_M_mdif2);
[std_mdif3,std_mdif3_val]=F_std(BCC_CSM_mdif3,BNU_ESM_mdif3,CanESM2_mdif3,CNRM_CM5_mdif3,CSIRO_Mk_mdif3,GFDL_CM3_mdif3,GFDL_ESM2G_mdif3,GFDL_ESM2M_mdif3,HadGEM2_CC_mdif3,...
    HadGEM2_ES_mdif3,inmcm4_mdif3,MIROC5_mdif3,MIROC_ESM_mdif3,MIROC_ESM_CHEM_mdif3,MRI_CGCM3_mdif3,MRI_ESM1_mdif3,NorESM1_M_mdif3);
cv_mdif1=abs(std_mdif1./avg_mdif1);
cv_mdif2=abs(std_mdif2./avg_mdif2);
cv_mdif3=abs(std_mdif3./avg_mdif3);
% Calculate CV of SSM_n
[std_mF1,std_mF1_val]=F_std(BCC_CSM_new_mF1,BNU_ESM_new_mF1,CanESM2_new_mF1,CNRM_CM5_new_mF1,CSIRO_Mk_new_mF1,GFDL_CM3_new_mF1,GFDL_ESM2G_new_mF1,GFDL_ESM2M_new_mF1,HadGEM2_CC_new_mF1,...
    HadGEM2_ES_new_mF1,inmcm4_new_mF1,MIROC5_new_mF1,MIROC_ESM_new_mF1,MIROC_ESM_CHEM_new_mF1,MRI_CGCM3_new_mF1,MRI_ESM1_new_mF1,NorESM1_M_new_mF1);
[std_mF2,std_mF2_val]=F_std(BCC_CSM_new_mF2,BNU_ESM_new_mF2,CanESM2_new_mF2,CNRM_CM5_new_mF2,CSIRO_Mk_new_mF2,GFDL_CM3_new_mF2,GFDL_ESM2G_new_mF2,GFDL_ESM2M_new_mF2,HadGEM2_CC_new_mF2,...
    HadGEM2_ES_new_mF2,inmcm4_new_mF2,MIROC5_new_mF2,MIROC_ESM_new_mF2,MIROC_ESM_CHEM_new_mF2,MRI_CGCM3_new_mF2,MRI_ESM1_new_mF2,NorESM1_M_new_mF2);
[std_mF3,std_mF3_val]=F_std(BCC_CSM_new_mF3,BNU_ESM_new_mF3,CanESM2_new_mF3,CNRM_CM5_new_mF3,CSIRO_Mk_new_mF3,GFDL_CM3_new_mF3,GFDL_ESM2G_new_mF3,GFDL_ESM2M_new_mF3,HadGEM2_CC_new_mF3,...
    HadGEM2_ES_new_mF3,inmcm4_new_mF3,MIROC5_new_mF3,MIROC_ESM_new_mF3,MIROC_ESM_CHEM_new_mF3,MRI_CGCM3_new_mF3,MRI_ESM1_new_mF3,NorESM1_M_new_mF3);
cv_mF1=abs(std_mF1./avg_mF1);
cv_mF2=abs(std_mF2./avg_mF2);
cv_mF3=abs(std_mF3./avg_mF3);
mdif1_p_pct=mdif1_positive_pct;
mdif1_n_pct=mdif1_negative_pct;
mdif2_p_pct=mdif2_positive_pct;
mdif2_n_pct=mdif2_negative_pct;
mdif3_p_pct=mdif3_positive_pct;
mdif3_n_pct=mdif3_negative_pct;
[cv_mF1_p100,cv_mF2_p100,cv_mF3_p100,cv_mF1_p80,cv_mF2_p80,cv_mF3_p80]= ...
    F_perc(cv_mF1,cv_mF2,cv_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);

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