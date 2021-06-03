% % Mean of renormalized global mean SSM for each latitude
SMAP_mean_SM(SMAP_mean_SM<0.1)=nan;
Flattened_mean_SM=SMAP_mean_SM(:)';
MappedF_mean_SM=mapminmax(Flattened_mean_SM,0,1);
Mapped_mean_SM=reshape(MappedF_mean_SM,size(SMAP_mean_SM));
[m,~]=size(Mapped_mean_SM);
Mapped_SMAP_Avg(m,1)=0;
count=1;
for i=1:m
    Mapped_SMAP_Avg(count,1)=nanmean(Mapped_mean_SM(i,:));
    count=count+1;
end
% Plot the diagram (Figure 8)
TightPlot.ColumeNumber=4;
TightPlot.RowNumber=1;
TightPlot.GapW=0.03;
TightPlot.GapH=0.1;
TightPlot.MarginsLower=0.09;
TightPlot.MarginsUpper=0.035;
TightPlot.MarginsLeft=0.05;
TightPlot.MarginsRight=0.35;
p=tight_subplot(TightPlot.ColumeNumber,TightPlot.RowNumber,...
  [TightPlot.GapH TightPlot.GapW],...
  [TightPlot.MarginsLower TightPlot.MarginsUpper],...
  [TightPlot.MarginsLeft TightPlot.MarginsRight]);
var_list={SMAP_lat_avg1,SMAP_lat_avg2,SMAP_lat_avg3,Mapped_SMAP_Avg};
map=surface(1,4);
for i=1:4
    axes(p(i));
    map(i)=plot(latSMAP,var_list{i},'Color',[0 0 0],'LineWidth',1);
    set(gca,'FontSize',10)
end
axes(p(1))
hold on
shadedErrorBar(latSMAP,AVG_lat_avg1_80,AVG_lat_std1_80,'lineprops',{'-r','MarkerFaceColor','r'});
hold off
grid on
xlim([-90,90])
ylim([0,1])
set(gca,'XTick',[-90,-75,-60,-45,-30,-15,0,15,30,45,60,75,90])
set(gca,'YTick',[0,0.25,0.5,0.75,1])
xlabel('(a)','FontSize',12)
title('1/30<f<1/7 day^{-1}','FontSize',14,'FontWeight','bold')
lgd=legend('Observation (SMAP)','Model (CMIP5)');
lgd.FontSize=12;
lgd.FontWeight='bold';
lgd.Location='northeast';
axes(p(2))
hold on
shadedErrorBar(latSMAP,AVG_lat_avg2_80,AVG_lat_std2_80,'lineprops',{'-r','MarkerFaceColor','r'});
hold off
grid on
xlim([-90,90])
ylim([0,1])
set(gca,'XTick',[-90,-75,-60,-45,-30,-15,0,15,30,45,60,75,90])
set(gca,'YTick',[0,0.25,0.5,0.75,1])
xlabel('(b)','FontSize',12)
title('1/90<f<1/30 day^{-1}','FontSize',14,'FontWeight','bold')
axes(p(3))
hold on
shadedErrorBar(latSMAP,AVG_lat_avg3_80,AVG_lat_std3_80,'lineprops',{'-r','MarkerFaceColor','r'});
hold off
grid on
xlim([-90,90])
ylim([0,1])
set(gca,'XTick',[-90,-75,-60,-45,-30,-15,0,15,30,45,60,75,90])
set(gca,'YTick',[0,0.25,0.5,0.75,1])
xlabel('(c)','FontSize',12)
title('1/365<f<1/90 day^{-1}','FontSize',14,'FontWeight','bold')
h=text(-99.5,1.05,'Latitudinal  average  SSM_n');
set(h,'fontsize',14,'FontWeight','bold','rotation',90)
axes(p(4))
plot(latSMAP,Mapped_SMAP_Avg,'Color',[0 0 0],'LineWidth',1)
grid on
xlim([-90,90])
ylim([0,1])
set(gca,'XTick',[-90,-75,-60,-45,-30,-15,0,15,30,45,60,75,90])
set(gca,'YTick',[0,0.25,0.5,0.75,1])
xlabel('(d)','FontSize',12)
ylabel('$\bf{\overline{SSM_n}}$','Interpreter','latex','FontSize',14)
hAxis=axes('visible','off');
text(0.25,-0.117,'Latitude','FontSize',14,'FontWeight','bold')