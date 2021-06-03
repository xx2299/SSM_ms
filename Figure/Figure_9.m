% % Average difference of H_{SEP_n} and H_{EEP_n} over different time scales
avg_mhpdif1=(BCC_CSM_mhpdif1+BNU_ESM_mhpdif1+CanESM2_mhpdif1+CNRM_CM5_mhpdif1+CSIRO_Mk_mhpdif1+GFDL_CM3_mhpdif1+GFDL_ESM2G_mhpdif1+GFDL_ESM2M_mhpdif1+HadGEM2_CC_mhpdif1+HadGEM2_ES_mhpdif1+inmcm4_mhpdif1+MIROC5_mhpdif1+MIROC_ESM_mhpdif1+MIROC_ESM_CHEM_mhpdif1+MRI_CGCM3_mhpdif1+MRI_ESM1_mhpdif1+NorESM1_M_mhpdif1)/17;
avg_mhpdif2=(BCC_CSM_mhpdif2+BNU_ESM_mhpdif2+CanESM2_mhpdif2+CNRM_CM5_mhpdif2+CSIRO_Mk_mhpdif2+GFDL_CM3_mhpdif2+GFDL_ESM2G_mhpdif2+GFDL_ESM2M_mhpdif2+HadGEM2_CC_mhpdif2+HadGEM2_ES_mhpdif2+inmcm4_mhpdif2+MIROC5_mhpdif2+MIROC_ESM_mhpdif2+MIROC_ESM_CHEM_mhpdif2+MRI_CGCM3_mhpdif2+MRI_ESM1_mhpdif2+NorESM1_M_mhpdif2)/17;
avg_mhpdif3=(BCC_CSM_mhpdif3+BNU_ESM_mhpdif3+CanESM2_mhpdif3+CNRM_CM5_mhpdif3+CSIRO_Mk_mhpdif3+GFDL_CM3_mhpdif3+GFDL_ESM2G_mhpdif3+GFDL_ESM2M_mhpdif3+HadGEM2_CC_mhpdif3+HadGEM2_ES_mhpdif3+inmcm4_mhpdif3+MIROC5_mhpdif3+MIROC_ESM_mhpdif3+MIROC_ESM_CHEM_mhpdif3+MRI_CGCM3_mhpdif3+MRI_ESM1_mhpdif3+NorESM1_M_mhpdif3)/17;
avg_hhpdif1=(BCC_CSM_hhpdif1+BNU_ESM_hhpdif1+CanESM2_hhpdif1+CNRM_CM5_hhpdif1+CSIRO_Mk_hhpdif1+GFDL_CM3_hhpdif1+GFDL_ESM2G_hhpdif1+GFDL_ESM2M_hhpdif1+HadGEM2_CC_hhpdif1+HadGEM2_ES_hhpdif1+inmcm4_hhpdif1+MIROC5_hhpdif1+MIROC_ESM_hhpdif1+MIROC_ESM_CHEM_hhpdif1+MRI_CGCM3_hhpdif1+MRI_ESM1_hhpdif1+NorESM1_M_hhpdif1)/17;
avg_hhpdif2=(BCC_CSM_hhpdif2+BNU_ESM_hhpdif2+CanESM2_hhpdif2+CNRM_CM5_hhpdif2+CSIRO_Mk_hhpdif2+GFDL_CM3_hhpdif2+GFDL_ESM2G_hhpdif2+GFDL_ESM2M_hhpdif2+HadGEM2_CC_hhpdif2+HadGEM2_ES_hhpdif2+inmcm4_hhpdif2+MIROC5_hhpdif2+MIROC_ESM_hhpdif2+MIROC_ESM_CHEM_hhpdif2+MRI_CGCM3_hhpdif2+MRI_ESM1_hhpdif2+NorESM1_M_hhpdif2)/17;
avg_hhpdif3=(BCC_CSM_hhpdif3+BNU_ESM_hhpdif3+CanESM2_hhpdif3+CNRM_CM5_hhpdif3+CSIRO_Mk_hhpdif3+GFDL_CM3_hhpdif3+GFDL_ESM2G_hhpdif3+GFDL_ESM2M_hhpdif3+HadGEM2_CC_hhpdif3+HadGEM2_ES_hhpdif3+inmcm4_hhpdif3+MIROC5_hhpdif3+MIROC_ESM_hhpdif3+MIROC_ESM_CHEM_hhpdif3+MRI_CGCM3_hhpdif3+MRI_ESM1_hhpdif3+NorESM1_M_hhpdif3)/17;
% Remove regions with limited SSM
avg_mhpdif1(SMAP_mean_SM<0.1)=4;
avg_mhpdif2(SMAP_mean_SM<0.1)=4;
avg_mhpdif3(SMAP_mean_SM<0.1)=-4;
mhpdif1_positive_pct(SMAP_mean_SM<0.1)=nan;
mhpdif1_negative_pct(SMAP_mean_SM<0.1)=nan;
mhpdif2_positive_pct(SMAP_mean_SM<0.1)=nan;
mhpdif2_negative_pct(SMAP_mean_SM<0.1)=nan;
mhpdif3_positive_pct(SMAP_mean_SM<0.1)=nan;
mhpdif3_negative_pct(SMAP_mean_SM<0.1)=nan;
avg_hhpdif1(SMAP_mean_SM<0.1)=-1;
avg_hhpdif2(SMAP_mean_SM<0.1)=-1;
avg_hhpdif3(SMAP_mean_SM<0.1)=1;
hhpdif1_positive_pct(SMAP_mean_SM<0.1)=nan;
hhpdif1_negative_pct(SMAP_mean_SM<0.1)=nan;
hhpdif2_positive_pct(SMAP_mean_SM<0.1)=nan;
hhpdif2_negative_pct(SMAP_mean_SM<0.1)=nan;
hhpdif3_positive_pct(SMAP_mean_SM<0.1)=nan;
hhpdif3_negative_pct(SMAP_mean_SM<0.1)=nan;
% Significance test by stippling for averaged biases for SSM_n
mhp_mask11=(mhpdif1_positive_pct==1) | (mhpdif1_negative_pct==1);
mhp_mask12=((mhpdif1_positive_pct>=14/17) & (mhpdif1_positive_pct<1)) | ((mhpdif1_negative_pct>=14/17) & (mhpdif1_negative_pct<1));
mhp_mask21=(mhpdif2_positive_pct==1) | (mhpdif2_negative_pct==1);
mhp_mask22=((mhpdif2_positive_pct>=14/17) & (mhpdif2_positive_pct<1)) | ((mhpdif2_negative_pct>=14/17) & (mhpdif2_negative_pct<1));
mhp_mask31=(mhpdif3_positive_pct==1) | (mhpdif3_negative_pct==1);
mhp_mask32=((mhpdif3_positive_pct>=14/17) & (mhpdif3_positive_pct<1)) | ((mhpdif3_negative_pct>=14/17) & (mhpdif3_negative_pct<1));
hhp_mask11=(hhpdif1_positive_pct==1) | (hhpdif1_negative_pct==1);
hhp_mask12=((hhpdif1_positive_pct>=14/17) & (hhpdif1_positive_pct<1)) | ((hhpdif1_negative_pct>=14/17) & (hhpdif1_negative_pct<1));
hhp_mask21=(hhpdif2_positive_pct==1) | (hhpdif2_negative_pct==1);
hhp_mask22=((hhpdif2_positive_pct>=14/17) & (hhpdif2_positive_pct<1)) | ((hhpdif2_negative_pct>=14/17) & (hhpdif2_negative_pct<1));
hhp_mask31=(hhpdif3_positive_pct==1) | (hhpdif3_negative_pct==1);
hhp_mask32=((hhpdif3_positive_pct>=14/17) & (hhpdif3_positive_pct<1)) | ((hhpdif3_negative_pct>=14/17) & (hhpdif3_negative_pct<1));
% Global map of average difference and CV for H_{SEP_n} and H_{EEP_n} over different time scales (Figure 9)
detalgx=lonSMAP;
detalgy=latSMAP;
[LON,LAT]=meshgrid(detalgx,detalgy);
TightPlot.ColumeNumber=2;
TightPlot.RowNumber=3;
TightPlot.GapW=0.03;
TightPlot.GapH=0.06;
TightPlot.MarginsLower=0.385;
TightPlot.MarginsUpper=0.035;
TightPlot.MarginsLeft=0.05;
TightPlot.MarginsRight=0.29;
p=tight_subplot(TightPlot.ColumeNumber,TightPlot.RowNumber,...
  [TightPlot.GapH TightPlot.GapW],...
  [TightPlot.MarginsLower TightPlot.MarginsUpper],...
  [TightPlot.MarginsLeft TightPlot.MarginsRight]);
var_list={avg_mhpdif1,avg_mhpdif2,avg_mhpdif3,avg_hhpdif1,avg_hhpdif2,avg_hhpdif3};
map=surface(1,6);
for i=1:6
    axes(p(i));
    map(i)=pcolor(detalgx,detalgy,var_list{i});
end
axes(p(1))
set(map(1),'alphadata',~isnan(avg_mhpdif1))
shading interp
hold on
mhp_h11=stipple(LON,LAT,mhp_mask11,'density',80,'color','k','marker','+','markersize',5);
mhp_h12=stipple(LON,LAT,mhp_mask12,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-4,4])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(a)','FontSize',13.5)
ylabel('H_{SEP_n} diff mean','FontSize',13.5,'FontWeight','bold')
title('1/30<f<1/7 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(2))
set(map(2),'alphadata',~isnan(avg_mhpdif2))
shading interp
hold on
mhp_h21=stipple(LON,LAT,mhp_mask21,'density',80,'color','k','marker','+','markersize',5);
mhp_h22=stipple(LON,LAT,mhp_mask22,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-4,4])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(b)','FontSize',13.5)
title('1/90<f<1/30 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(3))
set(map(3),'alphadata',~isnan(avg_mhpdif3))
shading interp
hold on
mhp_h31=stipple(LON,LAT,mhp_mask31,'density',80,'color','k','marker','+','markersize',5);
mhp_h32=stipple(LON,LAT,mhp_mask32,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-4,4])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(c)','FontSize',13.5)
title('1/365<f<1/90 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(4))
set(map(4),'alphadata',~isnan(avg_hhpdif1))
shading interp
hold on
hhp_h11=stipple(LON,LAT,hhp_mask11,'density',110,'color','k','marker','+','markersize',5);
hhp_h12=stipple(LON,LAT,hhp_mask12,'density',110,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-1,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(d)','FontSize',13.5)
ylabel('H_{EEP_n} diff mean','FontSize',13.5,'FontWeight','bold')
axes(p(5))
set(map(5),'alphadata',~isnan(avg_hhpdif2))
shading interp
hold on
hhp_h21=stipple(LON,LAT,hhp_mask21,'density',110,'color','k','marker','+','markersize',5);
hhp_h22=stipple(LON,LAT,hhp_mask22,'density',110,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-1,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(e)','FontSize',13.5)
axes(p(6))
set(map(6),'alphadata',~isnan(avg_hhpdif3))
shading interp
hold on
hhp_h31=stipple(LON,LAT,hhp_mask31,'density',110,'color','k','marker','+','markersize',5);
hhp_h32=stipple(LON,LAT,hhp_mask32,'density',110,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-1,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(f)','FontSize',13.5)
% legend setting
lgd=legend([mhp_h31,mhp_h32],'100%','>80%');
lgd.NumColumns=2;
lgd.FontSize=10;
title(lgd,'Significance Test')
% colorbar setting
axes('position',[0.6,0.705,0.16,0.26])
axis off
c=colorbar('eastoutside');
caxis([-4,4])
c.Label.FontSize=5;
axes('position',[0.6,0.385,0.16,0.26])
axis off
c=colorbar('eastoutside');
caxis([-1,1])
c.Label.FontSize=5;