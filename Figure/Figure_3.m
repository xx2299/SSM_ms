% % SSM_n,ET_n,and P_n over different time scales
% Remove regions with limited SSM
SMF1(SMAP_mean_SM<0.1)=0;
SMF2(SMAP_mean_SM<0.1)=0;
SMF3(SMAP_mean_SM<0.1)=0;
% Plot the diagram (Figure 3)
detalgx=lonSMAP;
detalgy=latSMAP;
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
var_list={SMF1,SMF2,SMF3,PrF1_new,PrF2_new,PrF3_new,ETF1_new,ETF2_new,ETF3_new};
map=surface(1,9);
for i=1:9
    axes(p(i));
    map(i)=pcolor(detalgx,detalgy,var_list{i});
end
axes(p(1))
set(map(1),'alphadata',~isnan(SMF1))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(a)','FontSize',13.5)
ylabel('SSM_n','FontSize',13.5,'FontWeight','bold')
title('1/30<f<1/7 day^{-1}','FontSize',13.5,'FontWeight','bold')
axes(p(2))
set(map(2),'alphadata',~isnan(SMF2))
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
set(map(3),'alphadata',~isnan(SMF3))
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
set(map(4),'alphadata',~isnan(PrF1_new))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(d)','FontSize',13.5)
ylabel('Pr_n','FontSize',13.5,'FontWeight','bold')
axes(p(5))
set(map(5),'alphadata',~isnan(PrF2_new))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(e)','FontSize',13.5)
axes(p(6))
set(map(6),'alphadata',~isnan(PrF3_new))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(f)','FontSize',13.5)
axes(p(7))
set(map(7),'alphadata',~isnan(ETF1_new))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(g)','FontSize',13.5)
ylabel('ET_n','FontSize',13.5,'FontWeight','bold')
axes(p(8))
set(map(8),'alphadata',~isnan(ETF2_new))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(h)','FontSize',13.5)
axes(p(9))
set(map(9),'alphadata',~isnan(ETF3_new))
shading interp
colorbar
caxis([0,1])
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(i)','FontSize',13.5)
axes('position',[0.6,0.065,0.16,0.9])
axis off
c=colorbar('eastoutside');
caxis([0,1])
c.Label.FontSize=5;