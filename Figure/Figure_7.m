% % SSM_n for models and the observation as a function of mean SSM for observation over different time scales
% Normalize CV of models across three frequency ranges
ncv_mF1=cv_mF1./(cv_mF1+cv_mF2+cv_mF3);
ncv_mF2=cv_mF2./(cv_mF1+cv_mF2+cv_mF3);
ncv_mF3=cv_mF3./(cv_mF1+cv_mF2+cv_mF3);
% Remove regions with SSM less than 0.1
avg_mdif1(SMAP_mean_SM<0.1)=nan;
avg_mdif2(SMAP_mean_SM<0.1)=nan;
avg_mdif3(SMAP_mean_SM<0.1)=nan;
ncv_mF1(SMAP_mean_SM<0.1)=nan;
ncv_mF2(SMAP_mean_SM<0.1)=nan;
ncv_mF3(SMAP_mean_SM<0.1)=nan;
SMAP_mean_SM(SMAP_mean_SM<0.1)=nan;
% Significance test
mdif1_p_pct=mdif1_positive_pct;
mdif1_n_pct=mdif1_negative_pct;
mdif2_p_pct=mdif2_positive_pct;
mdif2_n_pct=mdif2_negative_pct;
mdif3_p_pct=mdif3_positive_pct;
mdif3_n_pct=mdif3_negative_pct;
[avg_mdif1_100,avg_mdif2_100,avg_mdif3_100,avg_mdif1_80,avg_mdif2_80,avg_mdif3_80]=sig_tran(avg_mdif1,avg_mdif2,avg_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
% Renormalize mean SSM to [0,1] (original mean SSM - [0.1,0.997])
Flattened_mean_SM=SMAP_mean_SM(:)';
MappedF_mean_SM=mapminmax(Flattened_mean_SM,0,1);
Mapped_mean_SM=reshape(MappedF_mean_SM,size(SMAP_mean_SM));
% Calculate SSM_n diff and CV in each bin
[avg_mdif1_bin_Avg,avg_mdif1_bin_Std]=bin_value(avg_mdif1_80,Mapped_mean_SM);
[avg_mdif2_bin_Avg,avg_mdif2_bin_Std]=bin_value(avg_mdif2_80,Mapped_mean_SM);
[avg_mdif3_bin_Avg,avg_mdif3_bin_Std]=bin_value(avg_mdif3_80,Mapped_mean_SM);
[ncv_mF1_bin_Avg,ncv_mF1_bin_Std]=bin_value(ncv_mF1,Mapped_mean_SM);
[ncv_mF2_bin_Avg,ncv_mF2_bin_Std]=bin_value(ncv_mF2,Mapped_mean_SM);
[ncv_mF3_bin_Avg,ncv_mF3_bin_Std]=bin_value(ncv_mF3,Mapped_mean_SM);
% Plot the diagram (Figure 7)
x=[0.025,0.075,0.125,0.175,0.225,0.275,0.325,0.375,0.425,0.475,0.525,0.575,0.625,0.675,0.725,0.775,0.825,0.875,0.925,0.975];
plot1=subplot(2,3,1);
shadedErrorBar(x,avg_mdif1_bin_Avg,avg_mdif1_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-0.8,-0.4,0,0.4,0.8])
set(gca,'FontSize',12)
xlabel('(a)','FontSize',15)
ylabel('SSM_n diff mean','FontSize',15,'FontWeight','bold')
title('1/30<f<1/7 day^{-1}','FontSize',15,'FontWeight','bold')
plot2=subplot(2,3,2);
shadedErrorBar(x,avg_mdif2_bin_Avg,avg_mdif2_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-0.8,-0.4,0,0.4,0.8])
set(gca,'FontSize',12)
xlabel('(b)','FontSize',15)
title('1/90<f<1/30 day^{-1}','FontSize',15,'FontWeight','bold')
plot3=subplot(2,3,3);
shadedErrorBar(x,avg_mdif3_bin_Avg,avg_mdif3_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-0.8,-0.4,0,0.4,0.8])
set(gca,'FontSize',12)
xlabel('(c)','FontSize',15)
title('1/365<f<1/90 day^{-1}','FontSize',15,'FontWeight','bold')
plot4=subplot(2,3,4);
shadedErrorBar(x,ncv_mF1_bin_Avg,ncv_mF1_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'FontSize',12)
xlabel('(d)','FontSize',15)
ylabel('SSM_n CV','FontSize',15,'FontWeight','bold')
plot5=subplot(2,3,5);
shadedErrorBar(x,ncv_mF2_bin_Avg,ncv_mF2_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'FontSize',12)
xlabel('(e)','FontSize',15)
plot6=subplot(2,3,6);
shadedErrorBar(x,ncv_mF3_bin_Avg,ncv_mF3_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'FontSize',12)
xlabel('(f)','FontSize',15)
hAxis=axes('visible','off');
text1=text('Interpreter','latex','String','$\bf{(\overline{SSM_n})}$','Position',[0.62 -0.114],'FontSize',15);
text2=text(0.32,-0.112,'Normalized observational mean SSM','FontSize',15,'FontWeight','bold');
axis([plot1 plot2 plot3],[0 1 -0.8 0.8])
axis([plot4 plot5 plot6],[0 1 0 1])

% % Functions
function [value_bin_Avg,value_bin_Std]=bin_value(compute_data,bin_data)
% Separate SSM into 20 bins of equal size
dlevels=[0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1];
account=length(dlevels)-1;
idx=cell(1,account);
% Calculate values in each bin
dif_comp=cell(1,account);
dif_slope_avg=cell(1,account);
dif_slope_std=cell(1,account);
for k=1:account
    idx{k}=find(bin_data>=dlevels(k) & bin_data<=dlevels(k+1));
    dif_comp{k}=compute_data(idx{k});
    dif_slope_avg{k}=mean(dif_comp{k},'omitnan');
    dif_slope_std{k}=std(dif_comp{k},'omitnan');
end
value_bin_Avg=cell2mat(dif_slope_avg);
value_bin_Std=cell2mat(dif_slope_std);
end

function [out_f1_100,out_f2_100,out_f3_100,out_f1_80,out_f2_80,out_f3_80]=sig_tran(in_f1,in_f2,in_f3,dif1_p_pct,dif1_n_pct,dif2_p_pct,dif2_n_pct,dif3_p_pct,dif3_n_pct)
% Get logic map of 100% and 80% significant test
log1_100=(dif1_p_pct==1) | (dif1_n_pct==1);
log1_80=((dif1_p_pct>=14/17) & (dif1_p_pct<1)) | ((dif1_n_pct>=14/17) & (dif1_n_pct<1));
log2_100=(dif2_p_pct==1) | (dif2_n_pct==1);
log2_80=((dif2_p_pct>=14/17) & (dif2_p_pct<1)) | ((dif2_n_pct>=14/17) & (dif2_n_pct<1));
log3_100=(dif3_p_pct==1) | (dif3_n_pct==1);
log3_80=((dif3_p_pct>=14/17) & (dif3_p_pct<1)) | ((dif3_n_pct>=14/17) & (dif3_n_pct<1));
% Get actual map of 100% significant test
out_f1_100=in_f1;
out_f2_100=in_f2;
out_f3_100=in_f3;
out_f1_100(log1_100==0)=nan;
out_f2_100(log2_100==0)=nan;
out_f3_100(log3_100==0)=nan;
% Get actual map of 80% significant test
out_f1_80=in_f1;
out_f2_80=in_f2;
out_f3_80=in_f3;
out_f1_80((log1_80+log1_100)==0)=nan;
out_f2_80((log2_80+log2_100)==0)=nan;
out_f3_80((log3_80+log3_100)==0)=nan;
end