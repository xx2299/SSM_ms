% Average difference of SSM_n over different time scales
avg_mdif1=(BCC_CSM_mdif1+BNU_ESM_mdif1+CanESM2_mdif1+CNRM_CM5_mdif1+CSIRO_Mk_mdif1+GFDL_CM3_mdif1+GFDL_ESM2G_mdif1+GFDL_ESM2M_mdif1+HadGEM2_CC_mdif1+HadGEM2_ES_mdif1+inmcm4_mdif1+MIROC5_mdif1+MIROC_ESM_mdif1+MIROC_ESM_CHEM_mdif1+MRI_CGCM3_mdif1+MRI_ESM1_mdif1+NorESM1_M_mdif1)/17;
avg_mdif2=(BCC_CSM_mdif2+BNU_ESM_mdif2+CanESM2_mdif2+CNRM_CM5_mdif2+CSIRO_Mk_mdif2+GFDL_CM3_mdif2+GFDL_ESM2G_mdif2+GFDL_ESM2M_mdif2+HadGEM2_CC_mdif2+HadGEM2_ES_mdif2+inmcm4_mdif2+MIROC5_mdif2+MIROC_ESM_mdif2+MIROC_ESM_CHEM_mdif2+MRI_CGCM3_mdif2+MRI_ESM1_mdif2+NorESM1_M_mdif2)/17;
avg_mdif3=(BCC_CSM_mdif3+BNU_ESM_mdif3+CanESM2_mdif3+CNRM_CM5_mdif3+CSIRO_Mk_mdif3+GFDL_CM3_mdif3+GFDL_ESM2G_mdif3+GFDL_ESM2M_mdif3+HadGEM2_CC_mdif3+HadGEM2_ES_mdif3+inmcm4_mdif3+MIROC5_mdif3+MIROC_ESM_mdif3+MIROC_ESM_CHEM_mdif3+MRI_CGCM3_mdif3+MRI_ESM1_mdif3+NorESM1_M_mdif3)/17;
% Normalize CV of models across three frequency ranges 
ncv_mF1=cv_mF1./(cv_mF1+cv_mF2+cv_mF3);
ncv_mF2=cv_mF2./(cv_mF1+cv_mF2+cv_mF3);
ncv_mF3=cv_mF3./(cv_mF1+cv_mF2+cv_mF3);
% Remove regions with limited SSM
avg_mdif1(SMAP_mean_SM<0.1)=-1;
avg_mdif2(SMAP_mean_SM<0.1)=-1;
avg_mdif3(SMAP_mean_SM<0.1)=-1;
mdif1_positive_pct(SMAP_mean_SM<0.1)=nan;
mdif1_negative_pct(SMAP_mean_SM<0.1)=nan;
mdif2_positive_pct(SMAP_mean_SM<0.1)=nan;
mdif2_negative_pct(SMAP_mean_SM<0.1)=nan;
mdif3_positive_pct(SMAP_mean_SM<0.1)=nan;
mdif3_negative_pct(SMAP_mean_SM<0.1)=nan;
ncv_mF1(SMAP_mean_SM<0.1)=-0.1;
ncv_mF2(SMAP_mean_SM<0.1)=-0.1;
ncv_mF3(SMAP_mean_SM<0.1)=-0.1;
% Significance test by stippling for averaged biases for SSM_n
mask11=(mdif1_positive_pct==1) | (mdif1_negative_pct==1);
mask12=((mdif1_positive_pct>=14/17) & (mdif1_positive_pct<1)) | ((mdif1_negative_pct>=14/17) & (mdif1_negative_pct<1));
mask21=(mdif2_positive_pct==1) | (mdif2_negative_pct==1);
mask22=((mdif2_positive_pct>=14/17) & (mdif2_positive_pct<1)) | ((mdif2_negative_pct>=14/17) & (mdif2_negative_pct<1));
mask31=(mdif3_positive_pct==1) | (mdif3_negative_pct==1);
mask32=((mdif3_positive_pct>=14/17) & (mdif3_positive_pct<1)) | ((mdif3_negative_pct>=14/17) & (mdif3_negative_pct<1));
% Global map of averaged difference and CV for SSM_n over different time scales (Figure 6)
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
var_list={avg_mdif1,avg_mdif2,avg_mdif3,ncv_mF1,ncv_mF2,ncv_mF3};
map=surface(1,6);
for i=1:6
    axes(p(i));
    map(i)=pcolor(detalgx,detalgy,var_list{i});
end
axes(p(1))
set(map(1),'alphadata',~isnan(avg_mdif1))
shading interp
hold on
h11=stipple(LON,LAT,mask11,'density',80,'color','k','marker','+','markersize',5);
h12=stipple(LON,LAT,mask12,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-1,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(a)','FontSize',13.5)
ylabel('SSM_n diff mean','FontSize',13.5,'FontWeight','bold')
title('1/30<f<1/7 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(2))
set(map(2),'alphadata',~isnan(avg_mdif2))
shading interp
hold on
h21=stipple(LON,LAT,mask21,'density',80,'color','k','marker','+','markersize',5);
h22=stipple(LON,LAT,mask22,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-1,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(b)','FontSize',13.5)
title('1/90<f<1/30 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(3))
set(map(3),'alphadata',~isnan(avg_mdif3))
shading interp
hold on
h31=stipple(LON,LAT,mask31,'density',80,'color','k','marker','+','markersize',5);
h32=stipple(LON,LAT,mask32,'density',80,'color','k','marker','.','markersize',5);
hold off
colorbar
caxis([-1,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(c)','FontSize',13.5)
title('1/365<f<1/90 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(4))
set(map(4),'alphadata',~isnan(ncv_mF1))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(d)','FontSize',13.5)
ylabel('SSM_n CV','FontSize',13.5,'FontWeight','bold')
axes(p(5))
set(map(5),'alphadata',~isnan(ncv_mF2))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(e)','FontSize',13.5)
axes(p(6))
set(map(6),'alphadata',~isnan(ncv_mF3))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(f)','FontSize',13.5)
% legend setting
lgd=legend([h31,h32],'100%','>80%');
lgd.NumColumns=2;
lgd.FontSize=10;
title(lgd,'Significance Test')
% colorbar setting
axes('position',[0.6,0.705,0.16,0.26])
axis off
c=colorbar('eastoutside');
caxis([-1,1])
c.Label.FontSize=5;
axes('position',[0.6,0.385,0.16,0.26])
axis off
c=colorbar('eastoutside');
caxis([0,1])
c.Label.FontSize=5;