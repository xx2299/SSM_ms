% % Noise color of SSM,ET,P,and PE over different time scales
SM_mask11=abs(avg_mP1-2)<0.5;
SM_mask12=abs(avg_mP1-1)<0.5;
SM_mask13=abs(avg_mP1-0)<0.5;
SM_mask14=abs(avg_mP1-(-1))<0.5;
SM_mask15=abs(avg_mP1-(-2))<0.5;
SM_mask16=avg_mP1<=-2.5;
SM_mask21=abs(avg_mP2-2)<0.5;
SM_mask22=abs(avg_mP2-1)<0.5;
SM_mask23=abs(avg_mP2-0)<0.5;
SM_mask24=abs(avg_mP2-(-1))<0.5;
SM_mask25=abs(avg_mP2-(-2))<0.5;
SM_mask26=avg_mP2<=-2.5;
SM_mask31=abs(avg_mP3-2)<0.5;
SM_mask32=abs(avg_mP3-1)<0.5;
SM_mask33=abs(avg_mP3-0)<0.5;
SM_mask34=abs(avg_mP3-(-1))<0.5;
SM_mask35=abs(avg_mP3-(-2))<0.5;
SM_mask36=avg_mP3<=-2.5;
P_mask11=abs(PrP1_new-2)<0.5;
P_mask12=abs(PrP1_new-1)<0.5;
P_mask13=abs(PrP1_new-0)<0.5;
P_mask14=abs(PrP1_new-(-1))<0.5;
P_mask15=abs(PrP1_new-(-2))<0.5;
P_mask16=PrP1_new<=-2.5;
P_mask21=abs(PrP2_new-2)<0.5;
P_mask22=abs(PrP2_new-1)<0.5;
P_mask23=abs(PrP2_new-0)<0.5;
P_mask24=abs(PrP2_new-(-1))<0.5;
P_mask25=abs(PrP2_new-(-2))<0.5;
P_mask26=PrP2_new<=-2.5;
P_mask31=abs(PrP3_new-2)<0.5;
P_mask32=abs(PrP3_new-1)<0.5;
P_mask33=abs(PrP3_new-0)<0.5;
P_mask34=abs(PrP3_new-(-1))<0.5;
P_mask35=abs(PrP3_new-(-2))<0.5;
P_mask36=PrP3_new<=-2.5;
E_mask11=abs(ETP1_new-2)<0.5;
E_mask12=abs(ETP1_new-1)<0.5;
E_mask13=abs(ETP1_new-0)<0.5;
E_mask14=abs(ETP1_new-(-1))<0.5;
E_mask15=abs(ETP1_new-(-2))<0.5;
E_mask16=ETP1_new<=-2.5;
E_mask21=abs(ETP2_new-2)<0.5;
E_mask22=abs(ETP2_new-1)<0.5;
E_mask23=abs(ETP2_new-0)<0.5;
E_mask24=abs(ETP2_new-(-1))<0.5;
E_mask25=abs(ETP2_new-(-2))<0.5;
E_mask26=ETP2_new<=-2.5;
E_mask31=abs(ETP3_new-2)<0.5;
E_mask32=abs(ETP3_new-1)<0.5;
E_mask33=abs(ETP3_new-0)<0.5;
E_mask34=abs(ETP3_new-(-1))<0.5;
E_mask35=abs(ETP3_new-(-2))<0.5;
E_mask36=ETP3_new<=-2.5;
PE_mask11=abs(EpP1_new-2)<0.5;
PE_mask12=abs(EpP1_new-1)<0.5;
PE_mask13=abs(EpP1_new-0)<0.5;
PE_mask14=abs(EpP1_new-(-1))<0.5;
PE_mask15=abs(EpP1_new-(-2))<0.5;
PE_mask16=EpP1_new<=-2.5;
PE_mask21=abs(EpP2_new-2)<0.5;
PE_mask22=abs(EpP2_new-1)<0.5;
PE_mask23=abs(EpP2_new-0)<0.5;
PE_mask24=abs(EpP2_new-(-1))<0.5;
PE_mask25=abs(EpP2_new-(-2))<0.5;
PE_mask26=EpP2_new<=-2.5;
PE_mask31=abs(EpP3_new-2)<0.5;
PE_mask32=abs(EpP3_new-1)<0.5;
PE_mask33=abs(EpP3_new-0)<0.5;
PE_mask34=abs(EpP3_new-(-1))<0.5;
PE_mask35=abs(EpP3_new-(-2))<0.5;
PE_mask36=EpP3_new<=-2.5;
% Global map of SSM_kw, Pr_kw, ET_kw, and PE_kw over different time scales (Figure 5)
detalgx=lonSMAP;
detalgy=latSMAP;
[LON,LAT]=meshgrid(detalgx,detalgy);
TightPlot.ColumeNumber=4;
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
var_list={avg_mP1,avg_mP2,avg_mP3,PrP1_new,PrP2_new,PrP3_new,ETP1_new,ETP2_new,ETP3_new,EpP1_new,EpP2_new,EpP3_new};
map=surface(1,12);
for i=1:12
    axes(p(i));
    map(i)=pcolor(detalgx,detalgy,var_list{i});
end
axes(p(1))
set(map(1),'alphadata',~isnan(avg_mP1))
shading interp
colorbar
hold on
SM_h11=stipple(LON,LAT,SM_mask11,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
SM_h12=stipple(LON,LAT,SM_mask12,'density',500,'color','b','marker','.','markersize',4);
SM_h13=stipple(LON,LAT,SM_mask13,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
SM_h14=stipple(LON,LAT,SM_mask14,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
SM_h15=stipple(LON,LAT,SM_mask15,'density',500,'color','r','marker','.','markersize',4);
SM_h16=stipple(LON,LAT,SM_mask16,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(a)','FontSize',10.5)
ylabel('SSM_{kw}','FontSize',10.5,'FontWeight','bold')
title('1/30<f<1/7 day^-1','FontSize',10.5,'FontWeight','bold')
axes(p(2))
set(map(2),'alphadata',~isnan(avg_mP2))
shading interp
colorbar
hold on
SM_h21=stipple(LON,LAT,SM_mask21,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
SM_h22=stipple(LON,LAT,SM_mask22,'density',500,'color','b','marker','.','markersize',4);
SM_h23=stipple(LON,LAT,SM_mask23,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
SM_h24=stipple(LON,LAT,SM_mask24,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
SM_h25=stipple(LON,LAT,SM_mask25,'density',500,'color','r','marker','.','markersize',4);
SM_h26=stipple(LON,LAT,SM_mask26,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(b)','FontSize',10.5)
title('1/90<f<1/30 day^-1','FontSize',10.5,'FontWeight','bold')
axes(p(3))
set(map(3),'alphadata',~isnan(avg_mP3))
shading interp
colorbar
hold on
SM_h31=stipple(LON,LAT,SM_mask31,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
SM_h32=stipple(LON,LAT,SM_mask32,'density',500,'color','b','marker','.','markersize',4);
SM_h33=stipple(LON,LAT,SM_mask33,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
SM_h34=stipple(LON,LAT,SM_mask34,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
SM_h35=stipple(LON,LAT,SM_mask35,'density',500,'color','r','marker','.','markersize',4);
SM_h36=stipple(LON,LAT,SM_mask36,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(c)','FontSize',10.5)
title('1/365<f<1/90 day^-1','FontSize',10.5,'FontWeight','bold')
axes(p(4))
set(map(4),'alphadata',~isnan(PrP1_new))
shading interp
colorbar
hold on
P_h11=stipple(LON,LAT,P_mask11,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
P_h12=stipple(LON,LAT,P_mask12,'density',500,'color','b','marker','.','markersize',4);
P_h13=stipple(LON,LAT,P_mask13,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
P_h14=stipple(LON,LAT,P_mask14,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
P_h15=stipple(LON,LAT,P_mask15,'density',500,'color','r','marker','.','markersize',4);
P_h16=stipple(LON,LAT,P_mask16,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(d)','FontSize',10.5)
ylabel('Pr_{kw}','FontSize',10.5,'FontWeight','bold')
axes(p(5))
set(map(5),'alphadata',~isnan(PrP2_new))
shading interp
colorbar
hold on
P_h21=stipple(LON,LAT,P_mask21,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
P_h22=stipple(LON,LAT,P_mask22,'density',500,'color','b','marker','.','markersize',4);
P_h23=stipple(LON,LAT,P_mask23,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
P_h24=stipple(LON,LAT,P_mask24,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
P_h25=stipple(LON,LAT,P_mask25,'density',500,'color','r','marker','.','markersize',4);
P_h26=stipple(LON,LAT,P_mask26,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(e)','FontSize',10.5)
axes(p(6))
set(map(6),'alphadata',~isnan(PrP3_new))
shading interp
colorbar
hold on
P_h31=stipple(LON,LAT,P_mask31,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
P_h32=stipple(LON,LAT,P_mask32,'density',500,'color','b','marker','.','markersize',4);
P_h33=stipple(LON,LAT,P_mask33,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
P_h34=stipple(LON,LAT,P_mask34,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
P_h35=stipple(LON,LAT,P_mask35,'density',500,'color','r','marker','.','markersize',4);
P_h36=stipple(LON,LAT,P_mask36,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(f)','FontSize',10.5)
axes(p(7))
set(map(7),'alphadata',~isnan(ETP1_new))
shading interp
colorbar
hold on
E_h11=stipple(LON,LAT,E_mask11,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
E_h12=stipple(LON,LAT,E_mask12,'density',500,'color','b','marker','.','markersize',4);
E_h13=stipple(LON,LAT,E_mask13,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
E_h14=stipple(LON,LAT,E_mask14,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
E_h15=stipple(LON,LAT,E_mask15,'density',500,'color','r','marker','.','markersize',4);
E_h16=stipple(LON,LAT,E_mask16,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(g)','FontSize',10.5)
ylabel('ET_{kw}','FontSize',10.5,'FontWeight','bold')
axes(p(8))
set(map(8),'alphadata',~isnan(ETP2_new))
shading interp
colorbar
hold on
E_h21=stipple(LON,LAT,E_mask21,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
E_h22=stipple(LON,LAT,E_mask22,'density',500,'color','b','marker','.','markersize',4);
E_h23=stipple(LON,LAT,E_mask23,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
E_h24=stipple(LON,LAT,E_mask24,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
E_h25=stipple(LON,LAT,E_mask25,'density',500,'color','r','marker','.','markersize',4);
E_h26=stipple(LON,LAT,E_mask26,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(h)','FontSize',10.5)
axes(p(9))
set(map(9),'alphadata',~isnan(ETP3_new))
shading interp
colorbar
hold on
E_h31=stipple(LON,LAT,E_mask31,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
E_h32=stipple(LON,LAT,E_mask32,'density',500,'color','b','marker','.','markersize',4);
E_h33=stipple(LON,LAT,E_mask33,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
E_h34=stipple(LON,LAT,E_mask34,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
E_h35=stipple(LON,LAT,E_mask35,'density',500,'color','r','marker','.','markersize',4);
E_h36=stipple(LON,LAT,E_mask36,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'XTickLabel','')
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(i)','FontSize',10.5)
axes(p(10))
set(map(10),'alphadata',~isnan(EpP1_new))
shading interp
colorbar
hold on
PE_h11=stipple(LON,LAT,PE_mask11,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
PE_h12=stipple(LON,LAT,PE_mask12,'density',500,'color','b','marker','.','markersize',4);
PE_h13=stipple(LON,LAT,PE_mask13,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
PE_h14=stipple(LON,LAT,PE_mask14,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
PE_h15=stipple(LON,LAT,PE_mask15,'density',500,'color','r','marker','.','markersize',4);
PE_h16=stipple(LON,LAT,PE_mask16,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
xlabel('(j)','FontSize',10.5)
ylabel('PE_{kw}','FontSize',10.5,'FontWeight','bold')
axes(p(11))
set(map(11),'alphadata',~isnan(EpP2_new))
shading interp
colorbar
hold on
PE_h21=stipple(LON,LAT,PE_mask21,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
PE_h22=stipple(LON,LAT,PE_mask22,'density',500,'color','b','marker','.','markersize',4);
PE_h23=stipple(LON,LAT,PE_mask23,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
PE_h24=stipple(LON,LAT,PE_mask24,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
PE_h25=stipple(LON,LAT,PE_mask25,'density',500,'color','r','marker','.','markersize',4);
PE_h26=stipple(LON,LAT,PE_mask26,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(k)','FontSize',10.5)
axes(p(12))
set(map(12),'alphadata',~isnan(EpP3_new))
shading interp
colorbar
hold on
PE_h31=stipple(LON,LAT,PE_mask31,'density',500,'color',[0.93333 0.5098 0.93333],'marker','.','markersize',4);
PE_h32=stipple(LON,LAT,PE_mask32,'density',500,'color','b','marker','.','markersize',4);
PE_h33=stipple(LON,LAT,PE_mask33,'density',500,'color',[1 0.98039 0.94118],'marker','.','markersize',4);
PE_h34=stipple(LON,LAT,PE_mask34,'density',500,'color',[1 0.75294 0.79608],'marker','.','markersize',4);
PE_h35=stipple(LON,LAT,PE_mask35,'density',500,'color','r','marker','.','markersize',4);
PE_h36=stipple(LON,LAT,PE_mask36,'density',500,'color','k','marker','.','markersize',4);
hold off
set(gca,'XTick',[-120,-60,0,60,120])
set(gca,'YTick',[-60,-30,0,30,60])
set(gca,'YTickLabel','')
xlabel('(l)','FontSize',10.5)
axes('position',[0.81,0.14,0.15,0.76])
axis off
h=legend([SM_h31,SM_h32,SM_h33,SM_h34,SM_h35,SM_h36],'Violet (-2)','Blue (-1)','White (0)','Pink (1)','Red (2)','Black (>2)');
title(h,'Color of Noise (\beta)','FontSize',10.5,'FontWeight','bold')