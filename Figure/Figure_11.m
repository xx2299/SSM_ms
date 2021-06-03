% % Difference of SSM_{kw},Pr_{kw},and ET_{kw}
% Average difference of SSM_kw over different time scales
avg_SMPdif1=(BCC_CSM_SMPdif1+BNU_ESM_SMPdif1+CanESM2_SMPdif1+CNRM_CM5_SMPdif1+CSIRO_Mk_SMPdif1+GFDL_CM3_SMPdif1+GFDL_ESM2G_SMPdif1+GFDL_ESM2M_SMPdif1+HadGEM2_CC_SMPdif1+HadGEM2_ES_SMPdif1+inmcm4_SMPdif1+MIROC5_SMPdif1+MIROC_ESM_SMPdif1+MIROC_ESM_CHEM_SMPdif1+MRI_CGCM3_SMPdif1+MRI_ESM1_SMPdif1+NorESM1_M_SMPdif1)/17;
avg_SMPdif2=(BCC_CSM_SMPdif2+BNU_ESM_SMPdif2+CanESM2_SMPdif2+CNRM_CM5_SMPdif2+CSIRO_Mk_SMPdif2+GFDL_CM3_SMPdif2+GFDL_ESM2G_SMPdif2+GFDL_ESM2M_SMPdif2+HadGEM2_CC_SMPdif2+HadGEM2_ES_SMPdif2+inmcm4_SMPdif2+MIROC5_SMPdif2+MIROC_ESM_SMPdif2+MIROC_ESM_CHEM_SMPdif2+MRI_CGCM3_SMPdif2+MRI_ESM1_SMPdif2+NorESM1_M_SMPdif2)/17;
avg_SMPdif3=(BCC_CSM_SMPdif3+BNU_ESM_SMPdif3+CanESM2_SMPdif3+CNRM_CM5_SMPdif3+CSIRO_Mk_SMPdif3+GFDL_CM3_SMPdif3+GFDL_ESM2G_SMPdif3+GFDL_ESM2M_SMPdif3+HadGEM2_CC_SMPdif3+HadGEM2_ES_SMPdif3+inmcm4_SMPdif3+MIROC5_SMPdif3+MIROC_ESM_SMPdif3+MIROC_ESM_CHEM_SMPdif3+MRI_CGCM3_SMPdif3+MRI_ESM1_SMPdif3+NorESM1_M_SMPdif3)/17;
% Average difference of Pr_kw over different time scales
avg_PrPdif1=(BCC_CSM_PrPdif1+BNU_ESM_PrPdif1+CanESM2_PrPdif1+CNRM_CM5_PrPdif1+CSIRO_Mk_PrPdif1+GFDL_CM3_PrPdif1+GFDL_ESM2G_PrPdif1+GFDL_ESM2M_PrPdif1+HadGEM2_CC_PrPdif1+HadGEM2_ES_PrPdif1+inmcm4_PrPdif1+MIROC5_PrPdif1+MIROC_ESM_PrPdif1+MIROC_ESM_CHEM_PrPdif1+MRI_CGCM3_PrPdif1+MRI_ESM1_PrPdif1+NorESM1_M_PrPdif1)/17;
avg_PrPdif2=(BCC_CSM_PrPdif2+BNU_ESM_PrPdif2+CanESM2_PrPdif2+CNRM_CM5_PrPdif2+CSIRO_Mk_PrPdif2+GFDL_CM3_PrPdif2+GFDL_ESM2G_PrPdif2+GFDL_ESM2M_PrPdif2+HadGEM2_CC_PrPdif2+HadGEM2_ES_PrPdif2+inmcm4_PrPdif2+MIROC5_PrPdif2+MIROC_ESM_PrPdif2+MIROC_ESM_CHEM_PrPdif2+MRI_CGCM3_PrPdif2+MRI_ESM1_PrPdif2+NorESM1_M_PrPdif2)/17;
avg_PrPdif3=(BCC_CSM_PrPdif3+BNU_ESM_PrPdif3+CanESM2_PrPdif3+CNRM_CM5_PrPdif3+CSIRO_Mk_PrPdif3+GFDL_CM3_PrPdif3+GFDL_ESM2G_PrPdif3+GFDL_ESM2M_PrPdif3+HadGEM2_CC_PrPdif3+HadGEM2_ES_PrPdif3+inmcm4_PrPdif3+MIROC5_PrPdif3+MIROC_ESM_PrPdif3+MIROC_ESM_CHEM_PrPdif3+MRI_CGCM3_PrPdif3+MRI_ESM1_PrPdif3+NorESM1_M_PrPdif3)/17;
% Average difference of ET_kw over different time scales
avg_ETPdif1=(BCC_CSM_ETPdif1+BNU_ESM_ETPdif1+CanESM2_ETPdif1+CNRM_CM5_ETPdif1+CSIRO_Mk_ETPdif1+GFDL_CM3_ETPdif1+GFDL_ESM2G_ETPdif1+GFDL_ESM2M_ETPdif1+HadGEM2_CC_ETPdif1+HadGEM2_ES_ETPdif1+inmcm4_ETPdif1+MIROC5_ETPdif1+MIROC_ESM_ETPdif1+MIROC_ESM_CHEM_ETPdif1+MRI_CGCM3_ETPdif1+MRI_ESM1_ETPdif1+NorESM1_M_ETPdif1)/17;
avg_ETPdif2=(BCC_CSM_ETPdif2+BNU_ESM_ETPdif2+CanESM2_ETPdif2+CNRM_CM5_ETPdif2+CSIRO_Mk_ETPdif2+GFDL_CM3_ETPdif2+GFDL_ESM2G_ETPdif2+GFDL_ESM2M_ETPdif2+HadGEM2_CC_ETPdif2+HadGEM2_ES_ETPdif2+inmcm4_ETPdif2+MIROC5_ETPdif2+MIROC_ESM_ETPdif2+MIROC_ESM_CHEM_ETPdif2+MRI_CGCM3_ETPdif2+MRI_ESM1_ETPdif2+NorESM1_M_ETPdif2)/17;
avg_ETPdif3=(BCC_CSM_ETPdif3+BNU_ESM_ETPdif3+CanESM2_ETPdif3+CNRM_CM5_ETPdif3+CSIRO_Mk_ETPdif3+GFDL_CM3_ETPdif3+GFDL_ESM2G_ETPdif3+GFDL_ESM2M_ETPdif3+HadGEM2_CC_ETPdif3+HadGEM2_ES_ETPdif3+inmcm4_ETPdif3+MIROC5_ETPdif3+MIROC_ESM_ETPdif3+MIROC_ESM_CHEM_ETPdif3+MRI_CGCM3_ETPdif3+MRI_ESM1_ETPdif3+NorESM1_M_ETPdif3)/17;
% Remove regions with limited SSM
avg_SMPdif1(SMAP_mean_SM<0.1)=-5;
avg_SMPdif2(SMAP_mean_SM<0.1)=-5;
avg_SMPdif3(SMAP_mean_SM<0.1)=-5;
SMPdif1_positive_pct(SMAP_mean_SM<0.1)=nan;
SMPdif1_negative_pct(SMAP_mean_SM<0.1)=nan;
SMPdif2_positive_pct(SMAP_mean_SM<0.1)=nan;
SMPdif2_negative_pct(SMAP_mean_SM<0.1)=nan;
SMPdif3_positive_pct(SMAP_mean_SM<0.1)=nan;
SMPdif3_negative_pct(SMAP_mean_SM<0.1)=nan;
PrPdif1_positive_pct(SMAP_mean_SM<0.1)=nan;
PrPdif1_negative_pct(SMAP_mean_SM<0.1)=nan;
PrPdif2_positive_pct(SMAP_mean_SM<0.1)=nan;
PrPdif2_negative_pct(SMAP_mean_SM<0.1)=nan;
PrPdif3_positive_pct(SMAP_mean_SM<0.1)=nan;
PrPdif3_negative_pct(SMAP_mean_SM<0.1)=nan;
ETPdif1_positive_pct(SMAP_mean_SM<0.1)=nan;
ETPdif1_negative_pct(SMAP_mean_SM<0.1)=nan;
ETPdif2_positive_pct(SMAP_mean_SM<0.1)=nan;
ETPdif2_negative_pct(SMAP_mean_SM<0.1)=nan;
ETPdif3_positive_pct(SMAP_mean_SM<0.1)=nan;
ETPdif3_negative_pct(SMAP_mean_SM<0.1)=nan;
% Significance test by stippling for averaged biases for SSM_kw, Pr_kw, and ET_kw
SM_mask11=(SMPdif1_positive_pct==1) | (SMPdif1_negative_pct==1);
SM_mask12=((SMPdif1_positive_pct>=14/17) & (SMPdif1_positive_pct<1)) | ((SMPdif1_negative_pct>=14/17) & (SMPdif1_negative_pct<1));
SM_mask21=(SMPdif2_positive_pct==1) | (SMPdif2_negative_pct==1);
SM_mask22=((SMPdif2_positive_pct>=14/17) & (SMPdif2_positive_pct<1)) | ((SMPdif2_negative_pct>=14/17) & (SMPdif2_negative_pct<1));
SM_mask31=(SMPdif3_positive_pct==1) | (SMPdif3_negative_pct==1);
SM_mask32=((SMPdif3_positive_pct>=14/17) & (SMPdif3_positive_pct<1)) | ((SMPdif3_negative_pct>=14/17) & (SMPdif3_negative_pct<1));
Pr_mask11=(PrPdif1_positive_pct==1) | (PrPdif1_negative_pct==1);
Pr_mask12=((PrPdif1_positive_pct>=14/17) & (PrPdif1_positive_pct<1)) | ((PrPdif1_negative_pct>=14/17) & (PrPdif1_negative_pct<1));
Pr_mask21=(PrPdif2_positive_pct==1) | (PrPdif2_negative_pct==1);
Pr_mask22=((PrPdif2_positive_pct>=14/17) & (PrPdif2_positive_pct<1)) | ((PrPdif2_negative_pct>=14/17) & (PrPdif2_negative_pct<1));
Pr_mask31=(PrPdif3_positive_pct==1) | (PrPdif3_negative_pct==1);
Pr_mask32=((PrPdif3_positive_pct>=14/17) & (PrPdif3_positive_pct<1)) | ((PrPdif3_negative_pct>=14/17) & (PrPdif3_negative_pct<1));
ET_mask11=(ETPdif1_positive_pct==1) | (ETPdif1_negative_pct==1);
ET_mask12=((ETPdif1_positive_pct>=14/17) & (ETPdif1_positive_pct<1)) | ((ETPdif1_negative_pct>=14/17) & (ETPdif1_negative_pct<1));
ET_mask21=(ETPdif2_positive_pct==1) | (ETPdif2_negative_pct==1);
ET_mask22=((ETPdif2_positive_pct>=14/17) & (ETPdif2_positive_pct<1)) | ((ETPdif2_negative_pct>=14/17) & (ETPdif2_negative_pct<1));
ET_mask31=(ETPdif3_positive_pct==1) | (ETPdif3_negative_pct==1);
ET_mask32=((ETPdif3_positive_pct>=14/17) & (ETPdif3_positive_pct<1)) | ((ETPdif3_negative_pct>=14/17) & (ETPdif3_negative_pct<1));
% Global map of averaged difference for SSM_n over different time scales (Figure 11)
detalgx=lonSMAP;
detalgy=latSMAP;
[LON,LAT]=meshgrid(detalgx,detalgy);
TightPlot.ColumeNumber=3;
TightPlot.RowNumber=3;
TightPlot.GapW=0.03;
TightPlot.GapH=0.06;
TightPlot.MarginsLower=0.065;
TightPlot.MarginsUpper=0.035;
TightPlot.MarginsLeft=0.05;
TightPlot.MarginsRight=0.29;
p=tight_subplot(TightPlot.ColumeNumber,TightPlot.RowNumber,...
  [TightPlot.GapH TightPlot.GapW],...
  [TightPlot.MarginsLower TightPlot.MarginsUpper],...
  [TightPlot.MarginsLeft TightPlot.MarginsRight]);
var_list={avg_SMPdif1,avg_SMPdif2,avg_SMPdif3,avg_PrPdif1,avg_PrPdif2,avg_PrPdif3,avg_ETPdif1,avg_ETPdif2,avg_ETPdif3};
map=surface(1,9);
for i=1:9
    axes(p(i));
    map(i)=pcolor(detalgx,detalgy,var_list{i});
end
axes(p(1))
set(map(1),'alphadata',~isnan(avg_SMPdif1))
shading interp
hold on
SM_h21=stipple(LON,LAT,SM_mask21,'density',80,'color','k','marker','+','markersize',5);
SM_h22=stipple(LON,LAT,SM_mask22,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-5,5])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(a)','FontSize',13.5)
ylabel('SSM_{kw} diff mean','FontSize',13.5,'FontWeight','bold')
title('1/30<f<1/7 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(2))
set(map(2),'alphadata',~isnan(avg_SMPdif2))
shading interp
hold on
SM_h11=stipple(LON,LAT,SM_mask11,'density',80,'color','k','marker','+','markersize',5);
SM_h12=stipple(LON,LAT,SM_mask12,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-5,5])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(b)','FontSize',13.5)
title('1/90<f<1/30 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(3))
set(map(3),'alphadata',~isnan(avg_SMPdif3))
shading interp
hold on
SM_h31=stipple(LON,LAT,SM_mask31,'density',80,'color','k','marker','+','markersize',5);
SM_h32=stipple(LON,LAT,SM_mask32,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-5,5])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(c)','FontSize',13.5)
title('1/365<f<1/90 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(4))
set(map(4),'alphadata',~isnan(avg_PrPdif1))
shading interp
hold on
Pr_h11=stipple(LON,LAT,Pr_mask11,'density',80,'color','k','marker','+','markersize',5);
Pr_h12=stipple(LON,LAT,Pr_mask12,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-5,5])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(d)','FontSize',13.5)
ylabel('Pr_{kw} diff mean','FontSize',13.5,'FontWeight','bold')
axes(p(5))
set(map(5),'alphadata',~isnan(avg_PrPdif2))
shading interp
hold on
Pr_h21=stipple(LON,LAT,Pr_mask21,'density',80,'color','k','marker','+','markersize',5);
Pr_h22=stipple(LON,LAT,Pr_mask22,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-5,5])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(e)','FontSize',13.5)
axes(p(6))
set(map(6),'alphadata',~isnan(avg_PrPdif3))
shading interp
hold on
Pr_h31=stipple(LON,LAT,Pr_mask31,'density',80,'color','k','marker','+','markersize',5);
Pr_h32=stipple(LON,LAT,Pr_mask32,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-5,5])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(f)','FontSize',13.5)
axes(p(7))
set(map(7),'alphadata',~isnan(avg_ETPdif1))
shading interp
hold on
ET_h11=stipple(LON,LAT,ET_mask11,'density',80,'color','k','marker','+','markersize',5);
ET_h12=stipple(LON,LAT,ET_mask12,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-5,5])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(g)','FontSize',13.5)
ylabel('ET_{kw} diff mean','FontSize',13.5,'FontWeight','bold')
axes(p(8))
set(map(8),'alphadata',~isnan(avg_ETPdif2))
shading interp
hold on
ET_h21=stipple(LON,LAT,ET_mask21,'density',80,'color','k','marker','+','markersize',5);
ET_h22=stipple(LON,LAT,ET_mask22,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-5,5])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(h)','FontSize',13.5)
axes(p(9))
set(map(9),'alphadata',~isnan(avg_ETPdif3))
shading interp
hold on
ET_h31=stipple(LON,LAT,ET_mask31,'density',80,'color','k','marker','+','markersize',5);
ET_h32=stipple(LON,LAT,ET_mask32,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-5,5])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(i)','FontSize',13.5)
axes('position',[0.6,0.065,0.16,0.9])
axis off
c=colorbar('eastoutside');
caxis([-5,5])
c.Label.FontSize=5;
% legend setting
lgd=legend([ET_h11,ET_h12],'100%','>80%');
lgd.NumColumns=2;
lgd.FontSize=10;
title(lgd,'Significance Test')