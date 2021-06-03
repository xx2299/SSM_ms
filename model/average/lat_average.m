% % Model latitudinal average (for Figure 8)
mdif1_p_pct=mdif1_positive_pct;
mdif1_n_pct=mdif1_negative_pct;
mdif2_p_pct=mdif2_positive_pct;
mdif2_n_pct=mdif2_negative_pct;
mdif3_p_pct=mdif3_positive_pct;
mdif3_n_pct=mdif3_negative_pct;
[BCC_CSM_new_mF1_100,BCC_CSM_new_mF2_100,BCC_CSM_new_mF3_100,BCC_CSM_new_mF1_80,BCC_CSM_new_mF2_80,BCC_CSM_new_mF3_80]=...
    sig_tran(BCC_CSM_new_mF1,BCC_CSM_new_mF2,BCC_CSM_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[BNU_ESM_new_mF1_100,BNU_ESM_new_mF2_100,BNU_ESM_new_mF3_100,BNU_ESM_new_mF1_80,BNU_ESM_new_mF2_80,BNU_ESM_new_mF3_80]=...
    sig_tran(BNU_ESM_new_mF1,BNU_ESM_new_mF2,BNU_ESM_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[CanESM2_new_mF1_100,CanESM2_new_mF2_100,CanESM2_new_mF3_100,CanESM2_new_mF1_80,CanESM2_new_mF2_80,CanESM2_new_mF3_80]=...
    sig_tran(CanESM2_new_mF1,CanESM2_new_mF2,CanESM2_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[CNRM_CM5_new_mF1_100,CNRM_CM5_new_mF2_100,CNRM_CM5_new_mF3_100,CNRM_CM5_new_mF1_80,CNRM_CM5_new_mF2_80,CNRM_CM5_new_mF3_80]=...
    sig_tran(CNRM_CM5_new_mF1,CNRM_CM5_new_mF2,CNRM_CM5_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[CSIRO_Mk_new_mF1_100,CSIRO_Mk_new_mF2_100,CSIRO_Mk_new_mF3_100,CSIRO_Mk_new_mF1_80,CSIRO_Mk_new_mF2_80,CSIRO_Mk_new_mF3_80]=...
    sig_tran(CSIRO_Mk_new_mF1,CSIRO_Mk_new_mF2,CSIRO_Mk_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[GFDL_CM3_new_mF1_100,GFDL_CM3_new_mF2_100,GFDL_CM3_new_mF3_100,GFDL_CM3_new_mF1_80,GFDL_CM3_new_mF2_80,GFDL_CM3_new_mF3_80]=...
    sig_tran(GFDL_CM3_new_mF1,GFDL_CM3_new_mF2,GFDL_CM3_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
% Latitudinal average of SSM_n
[BCC_CSM_lat_avg1_100,BCC_CSM_lat_avg2_100,BCC_CSM_lat_avg3_100,BCC_CSM_lat_avg1_80,BCC_CSM_lat_avg2_80,BCC_CSM_lat_avg3_80]=lat_avg(BCC_CSM_new_mF1,BCC_CSM_new_mF2,BCC_CSM_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[BNU_ESM_lat_avg1_100,BNU_ESM_lat_avg2_100,BNU_ESM_lat_avg3_100,BNU_ESM_lat_avg1_80,BNU_ESM_lat_avg2_80,BNU_ESM_lat_avg3_80]=lat_avg(BNU_ESM_new_mF1,BNU_ESM_new_mF2,BNU_ESM_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[CanESM2_lat_avg1_100,CanESM2_lat_avg2_100,CanESM2_lat_avg3_100,CanESM2_lat_avg1_80,CanESM2_lat_avg2_80,CanESM2_lat_avg3_80]=lat_avg(CanESM2_new_mF1,CanESM2_new_mF2,CanESM2_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[CNRM_CM5_lat_avg1_100,CNRM_CM5_lat_avg2_100,CNRM_CM5_lat_avg3_100,CNRM_CM5_lat_avg1_80,CNRM_CM5_lat_avg2_80,CNRM_CM5_lat_avg3_80]=lat_avg(CNRM_CM5_new_mF1,CNRM_CM5_new_mF2,CNRM_CM5_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[CSIRO_Mk_lat_avg1_100,CSIRO_Mk_lat_avg2_100,CSIRO_Mk_lat_avg3_100,CSIRO_Mk_lat_avg1_80,CSIRO_Mk_lat_avg2_80,CSIRO_Mk_lat_avg3_80]=lat_avg(CSIRO_Mk_new_mF1,CSIRO_Mk_new_mF2,CSIRO_Mk_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[GFDL_CM3_lat_avg1_100,GFDL_CM3_lat_avg2_100,GFDL_CM3_lat_avg3_100,GFDL_CM3_lat_avg1_80,GFDL_CM3_lat_avg2_80,GFDL_CM3_lat_avg3_80]=lat_avg(GFDL_CM3_new_mF1,GFDL_CM3_new_mF2,GFDL_CM3_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[GFDL_ESM2G_lat_avg1_100,GFDL_ESM2G_lat_avg2_100,GFDL_ESM2G_lat_avg3_100,GFDL_ESM2G_lat_avg1_80,GFDL_ESM2G_lat_avg2_80,GFDL_ESM2G_lat_avg3_80]=lat_avg(GFDL_ESM2G_new_mF1,GFDL_ESM2G_new_mF2,GFDL_ESM2G_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[GFDL_ESM2M_lat_avg1_100,GFDL_ESM2M_lat_avg2_100,GFDL_ESM2M_lat_avg3_100,GFDL_ESM2M_lat_avg1_80,GFDL_ESM2M_lat_avg2_80,GFDL_ESM2M_lat_avg3_80]=lat_avg(GFDL_ESM2M_new_mF1,GFDL_ESM2M_new_mF2,GFDL_ESM2M_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[HadGEM2_CC_lat_avg1_100,HadGEM2_CC_lat_avg2_100,HadGEM2_CC_lat_avg3_100,HadGEM2_CC_lat_avg1_80,HadGEM2_CC_lat_avg2_80,HadGEM2_CC_lat_avg3_80]=lat_avg(HadGEM2_CC_new_mF1,HadGEM2_CC_new_mF2,HadGEM2_CC_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[HadGEM2_ES_lat_avg1_100,HadGEM2_ES_lat_avg2_100,HadGEM2_ES_lat_avg3_100,HadGEM2_ES_lat_avg1_80,HadGEM2_ES_lat_avg2_80,HadGEM2_ES_lat_avg3_80]=lat_avg(HadGEM2_ES_new_mF1,HadGEM2_ES_new_mF2,HadGEM2_ES_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[inmcm4_lat_avg1_100,inmcm4_lat_avg2_100,inmcm4_lat_avg3_100,inmcm4_lat_avg1_80,inmcm4_lat_avg2_80,inmcm4_lat_avg3_80]=lat_avg(inmcm4_new_mF1,inmcm4_new_mF2,inmcm4_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[MIROC5_lat_avg1_100,MIROC5_lat_avg2_100,MIROC5_lat_avg3_100,MIROC5_lat_avg1_80,MIROC5_lat_avg2_80,MIROC5_lat_avg3_80]=lat_avg(MIROC5_new_mF1,MIROC5_new_mF2,MIROC5_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[MIROC_ESM_lat_avg1_100,MIROC_ESM_lat_avg2_100,MIROC_ESM_lat_avg3_100,MIROC_ESM_lat_avg1_80,MIROC_ESM_lat_avg2_80,MIROC_ESM_lat_avg3_80]=lat_avg(MIROC_ESM_new_mF1,MIROC_ESM_new_mF2,MIROC_ESM_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[MIROC_ESM_CHEM_lat_avg1_100,MIROC_ESM_CHEM_lat_avg2_100,MIROC_ESM_CHEM_lat_avg3_100,MIROC_ESM_CHEM_lat_avg1_80,MIROC_ESM_CHEM_lat_avg2_80,MIROC_ESM_CHEM_lat_avg3_80]=lat_avg(MIROC_ESM_CHEM_new_mF1,MIROC_ESM_CHEM_new_mF2,MIROC_ESM_CHEM_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[MRI_CGCM3_lat_avg1_100,MRI_CGCM3_lat_avg2_100,MRI_CGCM3_lat_avg3_100,MRI_CGCM3_lat_avg1_80,MRI_CGCM3_lat_avg2_80,MRI_CGCM3_lat_avg3_80]=lat_avg(MRI_CGCM3_new_mF1,MRI_CGCM3_new_mF2,MRI_CGCM3_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[MRI_ESM1_lat_avg1_100,MRI_ESM1_lat_avg2_100,MRI_ESM1_lat_avg3_100,MRI_ESM1_lat_avg1_80,MRI_ESM1_lat_avg2_80,MRI_ESM1_lat_avg3_80]=lat_avg(MRI_ESM1_new_mF1,MRI_ESM1_new_mF2,MRI_ESM1_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
[NorESM1_M_lat_avg1_100,NorESM1_M_lat_avg2_100,NorESM1_M_lat_avg3_100,NorESM1_M_lat_avg1_80,NorESM1_M_lat_avg2_80,NorESM1_M_lat_avg3_80]=lat_avg(NorESM1_M_new_mF1,NorESM1_M_new_mF2,NorESM1_M_new_mF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
% Latitudinal average of SSM_n for models
AVG_lat_avg1=(BCC_CSM_lat_avg1+BNU_ESM_lat_avg1+CanESM2_lat_avg1+CNRM_CM5_lat_avg1+CSIRO_Mk_lat_avg1+GFDL_CM3_lat_avg1+GFDL_ESM2G_lat_avg1+GFDL_ESM2M_lat_avg1+HadGEM2_CC_lat_avg1+HadGEM2_ES_lat_avg1+...
    inmcm4_lat_avg1+MIROC5_lat_avg1+MIROC_ESM_lat_avg1+MIROC_ESM_CHEM_lat_avg1+MRI_CGCM3_lat_avg1+MRI_ESM1_lat_avg1+NorESM1_M_lat_avg1)/17;
AVG_lat_avg2=(BCC_CSM_lat_avg2+BNU_ESM_lat_avg2+CanESM2_lat_avg2+CNRM_CM5_lat_avg2+CSIRO_Mk_lat_avg2+GFDL_CM3_lat_avg2+GFDL_ESM2G_lat_avg2+GFDL_ESM2M_lat_avg2+HadGEM2_CC_lat_avg2+HadGEM2_ES_lat_avg2+...
    inmcm4_lat_avg2+MIROC5_lat_avg2+MIROC_ESM_lat_avg2+MIROC_ESM_CHEM_lat_avg2+MRI_CGCM3_lat_avg2+MRI_ESM1_lat_avg2+NorESM1_M_lat_avg2)/17;
AVG_lat_avg3=(BCC_CSM_lat_avg3+BNU_ESM_lat_avg3+CanESM2_lat_avg3+CNRM_CM5_lat_avg3+CSIRO_Mk_lat_avg3+GFDL_CM3_lat_avg3+GFDL_ESM2G_lat_avg3+GFDL_ESM2M_lat_avg3+HadGEM2_CC_lat_avg3+HadGEM2_ES_lat_avg3+...
    inmcm4_lat_avg3+MIROC5_lat_avg3+MIROC_ESM_lat_avg3+MIROC_ESM_CHEM_lat_avg3+MRI_CGCM3_lat_avg3+MRI_ESM1_lat_avg3+NorESM1_M_lat_avg3)/17;
% Latitudinal average of SSM_n for models (100% sigificance test)
AVG_lat_avg1_100=(BCC_CSM_lat_avg1_100+BNU_ESM_lat_avg1_100+CanESM2_lat_avg1_100+CNRM_CM5_lat_avg1_100+CSIRO_Mk_lat_avg1_100+GFDL_CM3_lat_avg1_100+GFDL_ESM2G_lat_avg1_100+GFDL_ESM2M_lat_avg1_100+HadGEM2_CC_lat_avg1_100+HadGEM2_ES_lat_avg1_100+...
    inmcm4_lat_avg1_100+MIROC5_lat_avg1_100+MIROC_ESM_lat_avg1_100+MIROC_ESM_CHEM_lat_avg1_100+MRI_CGCM3_lat_avg1_100+MRI_ESM1_lat_avg1_100+NorESM1_M_lat_avg1_100)/17;
AVG_lat_avg2_100=(BCC_CSM_lat_avg2_100+BNU_ESM_lat_avg2_100+CanESM2_lat_avg2_100+CNRM_CM5_lat_avg2_100+CSIRO_Mk_lat_avg2_100+GFDL_CM3_lat_avg2_100+GFDL_ESM2G_lat_avg2_100+GFDL_ESM2M_lat_avg2_100+HadGEM2_CC_lat_avg2_100+HadGEM2_ES_lat_avg2_100+...
    inmcm4_lat_avg2_100+MIROC5_lat_avg2_100+MIROC_ESM_lat_avg2_100+MIROC_ESM_CHEM_lat_avg2_100+MRI_CGCM3_lat_avg2_100+MRI_ESM1_lat_avg2_100+NorESM1_M_lat_avg2_100)/17;
AVG_lat_avg3_100=(BCC_CSM_lat_avg3_100+BNU_ESM_lat_avg3_100+CanESM2_lat_avg3_100+CNRM_CM5_lat_avg3_100+CSIRO_Mk_lat_avg3_100+GFDL_CM3_lat_avg3_100+GFDL_ESM2G_lat_avg3_100+GFDL_ESM2M_lat_avg3_100+HadGEM2_CC_lat_avg3_100+HadGEM2_ES_lat_avg3_100+...
    inmcm4_lat_avg3_100+MIROC5_lat_avg3_100+MIROC_ESM_lat_avg3_100+MIROC_ESM_CHEM_lat_avg3_100+MRI_CGCM3_lat_avg3_100+MRI_ESM1_lat_avg3_100+NorESM1_M_lat_avg3_100)/17;
% Latitudinal average of SSM_n for models (80% sigificance test)
AVG_lat_avg1_80=(BCC_CSM_lat_avg1_80+BNU_ESM_lat_avg1_80+CanESM2_lat_avg1_80+CNRM_CM5_lat_avg1_80+CSIRO_Mk_lat_avg1_80+GFDL_CM3_lat_avg1_80+GFDL_ESM2G_lat_avg1_80+GFDL_ESM2M_lat_avg1_80+HadGEM2_CC_lat_avg1_80+HadGEM2_ES_lat_avg1_80+...
    inmcm4_lat_avg1_80+MIROC5_lat_avg1_80+MIROC_ESM_lat_avg1_80+MIROC_ESM_CHEM_lat_avg1_80+MRI_CGCM3_lat_avg1_80+MRI_ESM1_lat_avg1_80+NorESM1_M_lat_avg1_80)/17;
AVG_lat_avg2_80=(BCC_CSM_lat_avg2_80+BNU_ESM_lat_avg2_80+CanESM2_lat_avg2_80+CNRM_CM5_lat_avg2_80+CSIRO_Mk_lat_avg2_80+GFDL_CM3_lat_avg2_80+GFDL_ESM2G_lat_avg2_80+GFDL_ESM2M_lat_avg2_80+HadGEM2_CC_lat_avg2_80+HadGEM2_ES_lat_avg2_80+...
    inmcm4_lat_avg2_80+MIROC5_lat_avg2_80+MIROC_ESM_lat_avg2_80+MIROC_ESM_CHEM_lat_avg2_80+MRI_CGCM3_lat_avg2_80+MRI_ESM1_lat_avg2_80+NorESM1_M_lat_avg2_80)/17;
AVG_lat_avg3_80=(BCC_CSM_lat_avg3_80+BNU_ESM_lat_avg3_80+CanESM2_lat_avg3_80+CNRM_CM5_lat_avg3_80+CSIRO_Mk_lat_avg3_80+GFDL_CM3_lat_avg3_80+GFDL_ESM2G_lat_avg3_80+GFDL_ESM2M_lat_avg3_80+HadGEM2_CC_lat_avg3_80+HadGEM2_ES_lat_avg3_80+...
    inmcm4_lat_avg3_80+MIROC5_lat_avg3_80+MIROC_ESM_lat_avg3_80+MIROC_ESM_CHEM_lat_avg3_80+MRI_CGCM3_lat_avg3_80+MRI_ESM1_lat_avg3_80+NorESM1_M_lat_avg3_80)/17;
% Latitudinal average of SSM_n for SMAP observation
[SMAP_lat_avg1,SMAP_lat_avg2,SMAP_lat_avg3]=lat_avg(SMF1,SMF2,SMF3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
% Latitudinal standard deviation of SSM_n across all models
count=1;
AVG_lat_std1_100(406,1)=0;
for i=1:406
    std_f1(1,:)=BCC_CSM_lat_avg1_100(i,:);
    std_f1(2,:)=BNU_ESM_lat_avg1_100(i,:);
    std_f1(3,:)=CanESM2_lat_avg1_100(i,:);
    std_f1(4,:)=CNRM_CM5_lat_avg1_100(i,:);
    std_f1(5,:)=CSIRO_Mk_lat_avg1_100(i,:);
    std_f1(6,:)=GFDL_CM3_lat_avg1_100(i,:);
    std_f1(7,:)=GFDL_ESM2G_lat_avg1_100(i,:);
    std_f1(8,:)=GFDL_ESM2M_lat_avg1_100(i,:);
    std_f1(9,:)=HadGEM2_CC_lat_avg1_100(i,:);
    std_f1(10,:)=HadGEM2_ES_lat_avg1_100(i,:);
    std_f1(11,:)=inmcm4_lat_avg1_100(i,:);
    std_f1(12,:)=MIROC5_lat_avg1_100(i,:);
    std_f1(13,:)=MIROC_ESM_lat_avg1_100(i,:);
    std_f1(14,:)=MIROC_ESM_CHEM_lat_avg1_100(i,:);
    std_f1(15,:)=MRI_CGCM3_lat_avg1_100(i,:);
    std_f1(16,:)=MRI_ESM1_lat_avg1_100(i,:);
    std_f1(17,:)=NorESM1_M_lat_avg1_100(i,:);
    std_AVG1=std(std_f1);
    AVG_lat_std1_100(count,:)=std_AVG1;
    count=count+1;
end
count=1;
AVG_lat_std2_100(406,1)=0;
for i=1:406
    std_f2(1,:)=BCC_CSM_lat_avg2_100(i,:);
    std_f2(2,:)=BNU_ESM_lat_avg2_100(i,:);
    std_f2(3,:)=CanESM2_lat_avg2_100(i,:);
    std_f2(4,:)=CNRM_CM5_lat_avg2_100(i,:);
    std_f2(5,:)=CSIRO_Mk_lat_avg2_100(i,:);
    std_f2(6,:)=GFDL_CM3_lat_avg2_100(i,:);
    std_f2(7,:)=GFDL_ESM2G_lat_avg2_100(i,:);
    std_f2(8,:)=GFDL_ESM2M_lat_avg2_100(i,:);
    std_f2(9,:)=HadGEM2_CC_lat_avg2_100(i,:);
    std_f2(10,:)=HadGEM2_ES_lat_avg2_100(i,:);
    std_f2(11,:)=inmcm4_lat_avg2_100(i,:);
    std_f2(12,:)=MIROC5_lat_avg2_100(i,:);
    std_f2(13,:)=MIROC_ESM_lat_avg2_100(i,:);
    std_f2(14,:)=MIROC_ESM_CHEM_lat_avg2_100(i,:);
    std_f2(15,:)=MRI_CGCM3_lat_avg2_100(i,:);
    std_f2(16,:)=MRI_ESM1_lat_avg2_100(i,:);
    std_f2(17,:)=NorESM1_M_lat_avg2_100(i,:);
    std_AVG2=std(std_f2);
    AVG_lat_std2_100(count,:)=std_AVG2;
    count=count+1;
end
count=1;
AVG_lat_std3_100(406,1)=0;
for i=1:406
    std_f3(1,:)=BCC_CSM_lat_avg3_100(i,:);
    std_f3(2,:)=BNU_ESM_lat_avg3_100(i,:);
    std_f3(3,:)=CanESM2_lat_avg3_100(i,:);
    std_f3(4,:)=CNRM_CM5_lat_avg3_100(i,:);
    std_f3(5,:)=CSIRO_Mk_lat_avg3_100(i,:);
    std_f3(6,:)=GFDL_CM3_lat_avg3_100(i,:);
    std_f3(7,:)=GFDL_ESM2G_lat_avg3_100(i,:);
    std_f3(8,:)=GFDL_ESM2M_lat_avg3_100(i,:);
    std_f3(9,:)=HadGEM2_CC_lat_avg3_100(i,:);
    std_f3(10,:)=HadGEM2_ES_lat_avg3_100(i,:);
    std_f3(11,:)=inmcm4_lat_avg3_100(i,:);
    std_f3(12,:)=MIROC5_lat_avg3_100(i,:);
    std_f3(13,:)=MIROC_ESM_lat_avg3_100(i,:);
    std_f3(14,:)=MIROC_ESM_CHEM_lat_avg3_100(i,:);
    std_f3(15,:)=MRI_CGCM3_lat_avg3_100(i,:);
    std_f3(16,:)=MRI_ESM1_lat_avg3_100(i,:);
    std_f3(17,:)=NorESM1_M_lat_avg3_100(i,:);
    std_AVG3=std(std_f3);
    AVG_lat_std3_100(count,:)=std_AVG3;
    count=count+1;
end
count=1;
AVG_lat_std1_80(406,1)=0;
for i=1:406
    std_f1(1,:)=BCC_CSM_lat_avg1_80(i,:);
    std_f1(2,:)=BNU_ESM_lat_avg1_80(i,:);
    std_f1(3,:)=CanESM2_lat_avg1_80(i,:);
    std_f1(4,:)=CNRM_CM5_lat_avg1_80(i,:);
    std_f1(5,:)=CSIRO_Mk_lat_avg1_80(i,:);
    std_f1(6,:)=GFDL_CM3_lat_avg1_80(i,:);
    std_f1(7,:)=GFDL_ESM2G_lat_avg1_80(i,:);
    std_f1(8,:)=GFDL_ESM2M_lat_avg1_80(i,:);
    std_f1(9,:)=HadGEM2_CC_lat_avg1_80(i,:);
    std_f1(10,:)=HadGEM2_ES_lat_avg1_80(i,:);
    std_f1(11,:)=inmcm4_lat_avg1_80(i,:);
    std_f1(12,:)=MIROC5_lat_avg1_80(i,:);
    std_f1(13,:)=MIROC_ESM_lat_avg1_80(i,:);
    std_f1(14,:)=MIROC_ESM_CHEM_lat_avg1_80(i,:);
    std_f1(15,:)=MRI_CGCM3_lat_avg1_80(i,:);
    std_f1(16,:)=MRI_ESM1_lat_avg1_80(i,:);
    std_f1(17,:)=NorESM1_M_lat_avg1_80(i,:);
    std_AVG1=std(std_f1);
    AVG_lat_std1_80(count,:)=std_AVG1;
    count=count+1;
end
count=1;
AVG_lat_std2_80(406,1)=0;
for i=1:406
    std_f2(1,:)=BCC_CSM_lat_avg2_80(i,:);
    std_f2(2,:)=BNU_ESM_lat_avg2_80(i,:);
    std_f2(3,:)=CanESM2_lat_avg2_80(i,:);
    std_f2(4,:)=CNRM_CM5_lat_avg2_80(i,:);
    std_f2(5,:)=CSIRO_Mk_lat_avg2_80(i,:);
    std_f2(6,:)=GFDL_CM3_lat_avg2_80(i,:);
    std_f2(7,:)=GFDL_ESM2G_lat_avg2_80(i,:);
    std_f2(8,:)=GFDL_ESM2M_lat_avg2_80(i,:);
    std_f2(9,:)=HadGEM2_CC_lat_avg2_80(i,:);
    std_f2(10,:)=HadGEM2_ES_lat_avg2_80(i,:);
    std_f2(11,:)=inmcm4_lat_avg2_80(i,:);
    std_f2(12,:)=MIROC5_lat_avg2_80(i,:);
    std_f2(13,:)=MIROC_ESM_lat_avg2_80(i,:);
    std_f2(14,:)=MIROC_ESM_CHEM_lat_avg2_80(i,:);
    std_f2(15,:)=MRI_CGCM3_lat_avg2_80(i,:);
    std_f2(16,:)=MRI_ESM1_lat_avg2_80(i,:);
    std_f2(17,:)=NorESM1_M_lat_avg2_80(i,:);
    std_AVG2=std(std_f2);
    AVG_lat_std2_80(count,:)=std_AVG2;
    count=count+1;
end
count=1;
AVG_lat_std3_80(406,1)=0;
for i=1:406
    std_f3(1,:)=BCC_CSM_lat_avg3_80(i,:);
    std_f3(2,:)=BNU_ESM_lat_avg3_80(i,:);
    std_f3(3,:)=CanESM2_lat_avg3_80(i,:);
    std_f3(4,:)=CNRM_CM5_lat_avg3_80(i,:);
    std_f3(5,:)=CSIRO_Mk_lat_avg3_80(i,:);
    std_f3(6,:)=GFDL_CM3_lat_avg3_80(i,:);
    std_f3(7,:)=GFDL_ESM2G_lat_avg3_80(i,:);
    std_f3(8,:)=GFDL_ESM2M_lat_avg3_80(i,:);
    std_f3(9,:)=HadGEM2_CC_lat_avg3_80(i,:);
    std_f3(10,:)=HadGEM2_ES_lat_avg3_80(i,:);
    std_f3(11,:)=inmcm4_lat_avg3_80(i,:);
    std_f3(12,:)=MIROC5_lat_avg3_80(i,:);
    std_f3(13,:)=MIROC_ESM_lat_avg3_80(i,:);
    std_f3(14,:)=MIROC_ESM_CHEM_lat_avg3_80(i,:);
    std_f3(15,:)=MRI_CGCM3_lat_avg3_80(i,:);
    std_f3(16,:)=MRI_ESM1_lat_avg3_80(i,:);
    std_f3(17,:)=NorESM1_M_lat_avg3_80(i,:);
    std_AVG3=std(std_f3);
    AVG_lat_std3_80(count,:)=std_AVG3;
    count=count+1;
end

% % Functions
function [lat_avg1_100,lat_avg2_100,lat_avg3_100,lat_avg1_80,lat_avg2_80,lat_avg3_80]=lat_avg(in_f1,in_f2,in_f3,dif1_p_pct,dif1_n_pct,dif2_p_pct,dif2_n_pct,dif3_p_pct,dif3_n_pct)
% Get logic map of 100% and 80% significant test
log1_100=(dif1_p_pct==1) | (dif1_n_pct==1);
log1_80=((dif1_p_pct>=14/17) & (dif1_p_pct<1)) | ((dif1_n_pct>=14/17) & (dif1_n_pct<1));
log2_100=(dif2_p_pct==1) | (dif2_n_pct==1);
log2_80=((dif2_p_pct>=14/17) & (dif2_p_pct<1)) | ((dif2_n_pct>=14/17) & (dif2_n_pct<1));
log3_100=(dif3_p_pct==1) | (dif3_n_pct==1);
log3_80=((dif3_p_pct>=14/17) & (dif3_p_pct<1)) | ((dif3_n_pct>=14/17) & (dif3_n_pct<1));
% Get actual map of 100% significant test
out_f1_100=in_f1;
out_f2_100=in_f2;
out_f3_100=in_f3;
out_f1_100(log1_100==0)=nan;
out_f2_100(log2_100==0)=nan;
out_f3_100(log3_100==0)=nan;
% Get actual map of 80% significant test
out_f1_80=in_f1;
out_f2_80=in_f2;
out_f3_80=in_f3;
out_f1_80((log1_80+log1_100)==0)=nan;
out_f2_80((log2_80+log2_100)==0)=nan;
out_f3_80((log3_80+log3_100)==0)=nan;
lat_avg1_100(406,1)=0;
lat_avg1_80(406,1)=0;
count=1;
for i=1:406
    lat_avg1_100(count,1)=nanmean(out_f1_100(i,:));
    lat_avg1_80(count,1)=nanmean(out_f1_80(i,:));
    count=count+1;
end
lat_avg2_100(406,1)=0;
lat_avg2_80(406,1)=0;
count=1;
for i=1:406
    lat_avg2_100(count,1)=nanmean(out_f2_100(i,:));
    lat_avg2_80(count,1)=nanmean(out_f2_80(i,:));
    count=count+1;
end
lat_avg3_100(406,1)=0;
lat_avg3_80(406,1)=0;
count=1;
for i=1:406
    lat_avg3_100(count,1)=nanmean(out_f3_100(i,:));
    lat_avg3_80(count,1)=nanmean(out_f3_80(i,:));
    count=count+1;
end
end