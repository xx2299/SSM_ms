% Normalized mean SSM spatiotemporally
meanA=nanmean(C_AMSR_tot);
meanS=(meanA-min(meanA))/(max(meanA)-min(meanA));
meanS_re=reshape(meanS,[964,406]);
mean_SM=meanS_re.';
SMAP_mean_SM=knn_mean(SMF_template,mean_SM,1);
% Renormalize mean SSM to [0,1] (original mean SSM - [0.1,0.997])
Flattened_mean_SM=SMAP_mean_SM(:)';
MappedF_mean_SM=mapminmax(Flattened_mean_SM,0,1);
Mapped_mean_SM=reshape(MappedF_mean_SM,size(SMAP_mean_SM));
% Plot the diagram (Figure S3)
detalgx=lonSMAP;
detalgy=latSMAP;
map=pcolor(detalgx,detalgy,Mapped_mean_SM);
set(map,'alphadata',~isnan(Mapped_mean_SM));
shading interp
colorbar
caxis([0,1])
set(gca,'Ydir','normal')
set(gca,'YTick',[-84,-60,-30,0,30,60,84])
set(gca,'FontSize',14)