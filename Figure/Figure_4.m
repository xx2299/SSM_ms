% % H_SEP_n and H_EEP_n over different time scales
SEPR1=SMF1./(ETF1_new+PrF1_new);
SEPR2=SMF2./(ETF2_new+PrF2_new);
SEPR3=SMF3./(ETF3_new+PrF3_new);
nSEPR1=SEPR1./(SEPR1+SEPR2+SEPR3);
nSEPR2=SEPR2./(SEPR1+SEPR2+SEPR3);
nSEPR3=SEPR3./(SEPR1+SEPR2+SEPR3);
nSEPR1(SMAP_mean_SM<0.1)=0;
nSEPR2(SMAP_mean_SM<0.1)=0;
nSEPR3(SMAP_mean_SM<0.1)=0;
EEPR1=ETF1_new./(ETF1_new+PrF1_new);
EEPR2=ETF2_new./(ETF2_new+PrF2_new);
EEPR3=ETF3_new./(ETF3_new+PrF3_new);
nEEPR1=EEPR1./(EEPR1+EEPR2+EEPR3);
nEEPR2=EEPR2./(EEPR1+EEPR2+EEPR3);
nEEPR3=EEPR3./(EEPR1+EEPR2+EEPR3);
nEEPR1(SMAP_mean_SM<0.1)=0;
nEEPR2(SMAP_mean_SM<0.1)=0;
nEEPR3(SMAP_mean_SM<0.1)=0;
% Plot the diagram (Figure 4)
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
var_list={nSEPR1,nSEPR2,nSEPR3,nEEPR1,nEEPR2,nEEPR3};
map=surface(1,6);
for i=1:6
    axes(p(i));
    map(i)=pcolor(detalgx,detalgy,var_list{i});
end
axes(p(1))
set(map(1),'alphadata',~isnan(nSEPR1))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(a)','FontSize',13.5)
ylabel('H_{SEP_n}','FontSize',13.5,'FontWeight','bold')
title('1/30<f<1/7 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(2))
set(map(2),'alphadata',~isnan(nSEPR2))
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
set(map(3),'alphadata',~isnan(nSEPR3))
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
set(map(4),'alphadata',~isnan(nEEPR1))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(d)','FontSize',13.5)
ylabel('H_{EEP_n}','FontSize',13.5,'FontWeight','bold')
axes(p(5))
set(map(5),'alphadata',~isnan(nEEPR2))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(e)','FontSize',13.5)
axes(p(6))
set(map(6),'alphadata',~isnan(nEEPR3))
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