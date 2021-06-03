% Normalize CV of models across three frequency ranges
ncv_mhpr1=cv_mhpr1./(cv_mhpr1+cv_mhpr2+cv_mhpr3);
ncv_mhpr2=cv_mhpr2./(cv_mhpr1+cv_mhpr2+cv_mhpr3);
ncv_mhpr3=cv_mhpr3./(cv_mhpr1+cv_mhpr2+cv_mhpr3);
ncv_hhpr1=cv_hhpr1./(cv_hhpr1+cv_hhpr2+cv_hhpr3);
ncv_hhpr2=cv_hhpr2./(cv_hhpr1+cv_hhpr2+cv_hhpr3);
ncv_hhpr3=cv_hhpr3./(cv_hhpr1+cv_hhpr2+cv_hhpr3);
% Remove regions with limited SSM
ncv_mhpr1(SMAP_mean_SM<0.1)=-0.1;
ncv_mhpr2(SMAP_mean_SM<0.1)=-0.1;
ncv_mhpr3(SMAP_mean_SM<0.1)=-0.1;
ncv_hhpr1(SMAP_mean_SM<0.1)=-0.1;
ncv_hhpr2(SMAP_mean_SM<0.1)=-0.1;
ncv_hhpr3(SMAP_mean_SM<0.1)=-0.1;
% Global map of averaged difference and CV for H_{SEP_n} and H_{EEP_n} over different time scales (Figure S4)
detalgx=lonSMAP;
detalgy=latSMAP;
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
var_list={ncv_mhpr1,ncv_mhpr2,ncv_mhpr3,ncv_hhpr1,ncv_hhpr2,ncv_hhpr3};
map=surface(1,6);
for i=1:6
    axes(p(i));
    map(i)=pcolor(detalgx,detalgy,var_list{i});
end
axes(p(1))
set(map(1),'alphadata',~isnan(ncv_mhpr1))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(a)','FontSize',13.5)
ylabel('H_{SEP_n} CV','FontSize',13.5,'FontWeight','bold')
title('1/30<f<1/7 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(2))
set(map(2),'alphadata',~isnan(ncv_mhpr2))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(b)','FontSize',13.5)
title('1/90<f<1/30 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(3))
set(map(3),'alphadata',~isnan(ncv_mhpr3))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(c)','FontSize',13.5)
title('1/365<f<1/90 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(4))
set(map(4),'alphadata',~isnan(ncv_hhpr1))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(d)','FontSize',13.5)
ylabel('H_{EEP_n} CV','FontSize',13.5,'FontWeight','bold')
axes(p(5))
set(map(5),'alphadata',~isnan(ncv_hhpr2))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(e)','FontSize',13.5)
axes(p(6))
set(map(6),'alphadata',~isnan(ncv_hhpr3))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(f)','FontSize',13.5)
% colorbar setting
axes('position',[0.6,0.705,0.16,0.26])
axis off
c=colorbar('eastoutside');
caxis([0,1])
c.Label.FontSize=5;
axes('position',[0.6,0.385,0.16,0.26])
axis off
c=colorbar('eastoutside');
caxis([0,1])
c.Label.FontSize=5;