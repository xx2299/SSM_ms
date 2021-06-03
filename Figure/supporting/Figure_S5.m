% % Global distribution of soil sand content and clay content
% Read soil sand content for the first two layers from observation (GSDE)
sand_lonData=ncread('SAND5min.nc','lon');
sand_latData=ncread('SAND5min.nc','lat');
sand=ncread('SAND5min.nc','SAND');
sand1=sand(:,:,1);
sand1=single(sand1);
sand1(sand1==-999)=nan;
sand1=sand1/100;
sand1rot=rot90(sand1,3);
sand1rf=fliplr(sand1rot);
sand2=sand(:,:,2);
sand2=single(sand2);
sand2(sand2==-999)=nan;
sand2=sand2/100;
sand2rot=rot90(sand2,3);
sand2rf=fliplr(sand2rot);
% Read clay content of SM for the first two layers from observation (GSDE)
clay_lonData=ncread('CLAY5min.nc','lon');
clay_latData=ncread('CLAY5min.nc','lat');
clay=ncread('CLAY5min.nc','CLAY');
clay1=clay(:,:,1);
clay1=single(clay1);
clay1(clay1==-999)=nan;
clay1=clay1/100;
clay1rot=rot90(clay1,3);
clay1rf=fliplr(clay1rot);
clay2=clay(:,:,2);
clay2=single(clay2);
clay2(clay2==-999)=nan;
clay2=clay2/100;
clay2rot=rot90(clay2,3);
clay2rf=fliplr(clay2rot);
% Global map of sand content and clay content for the first two layers (Figure S5)
detalgx=-180:180;
detalgy=-90:90;
subplot(2,2,1)
map1=imagesc(detalgx,detalgy,sand1rf);
set(map1,'alphadata',~isnan(sand1rf));
colorbar;
caxis([0,1]);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
title('Soil sand content - layer 1 (4.5cm)','FontSize',14,'FontWeight','bold')
subplot(2,2,2)
map2=imagesc(detalgx,detalgy,clay1rf);
set(map2,'alphadata',~isnan(clay1rf));
colorbar;
caxis([0,1]);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
title('Soil clay content - layer 1 (4.5cm)','FontSize',14,'FontWeight','bold')
subplot(2,2,3)
map3=imagesc(detalgx,detalgy,sand2rf);
set(map3,'alphadata',~isnan(sand2rf));
colorbar;
caxis([0,1]);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
title('Soil sand content - layer 2 (9.1cm)','FontSize',14,'FontWeight','bold')
subplot(2,2,4)
map4=imagesc(detalgx,detalgy,clay2rf);
set(map4,'alphadata',~isnan(clay2rf));
colorbar;
caxis([0,1]);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
title('Soil clay content - layer 2 (9.1cm)','FontSize',14,'FontWeight','bold')
axes('position',[0.72,0.11,0.25,0.815])
axis off
colorbar('eastoutside')
caxis([0,1])
hold off