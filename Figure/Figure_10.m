% % H_{SEP_n} and H_{EEP_n} for models and the observation as a function of mean SSM for observation over different time scales
% Mean value of H_SEP_n and H_EEP_n within significance test
mhpdif1_p_pct=mhpdif1_positive_pct;
mhpdif1_n_pct=mhpdif1_negative_pct;
mhpdif2_p_pct=mhpdif2_positive_pct;
mhpdif2_n_pct=mhpdif2_negative_pct;
mhpdif3_p_pct=mhpdif3_positive_pct;
mhpdif3_n_pct=mhpdif3_negative_pct;
[SEPR1_100,SEPR2_100,SEPR3_100,SEPR1_80,SEPR2_80,SEPR3_80]=sig_tran(SEPR1,SEPR2,SEPR3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
SEPR1_100_num=nanmean(SEPR1_100(:));
SEPR2_100_num=nanmean(SEPR2_100(:));
SEPR3_100_num=nanmean(SEPR3_100(:));
SEPR1_80_num=nanmean(SEPR1_80(:));
SEPR2_80_num=nanmean(SEPR2_80(:));
SEPR3_80_num=nanmean(SEPR3_80(:));
hhpdif1_p_pct=hhpdif1_positive_pct;
hhpdif1_n_pct=hhpdif1_negative_pct;
hhpdif2_p_pct=hhpdif2_positive_pct;
hhpdif2_n_pct=hhpdif2_negative_pct;
hhpdif3_p_pct=hhpdif3_positive_pct;
hhpdif3_n_pct=hhpdif3_negative_pct;
[EEPR1_100,EEPR2_100,EEPR3_100,EEPR1_80,EEPR2_80,EEPR3_80]=sig_tran(EEPR1,EEPR2,EEPR3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
EEPR1_100_num=nanmean(EEPR1_100(:));
EEPR2_100_num=nanmean(EEPR2_100(:));
EEPR3_100_num=nanmean(EEPR3_100(:));
EEPR1_80_num=nanmean(EEPR1_80(:));
EEPR2_80_num=nanmean(EEPR2_80(:));
EEPR3_80_num=nanmean(EEPR3_80(:));
% Remove regions with SSM less than 0.1
avg_mhpdif1(SMAP_mean_SM<0.1)=nan;
avg_mhpdif2(SMAP_mean_SM<0.1)=nan;
avg_mhpdif3(SMAP_mean_SM<0.1)=nan;
avg_hhpdif1(SMAP_mean_SM<0.1)=nan;
avg_hhpdif2(SMAP_mean_SM<0.1)=nan;
avg_hhpdif3(SMAP_mean_SM<0.1)=nan;
SMAP_mean_SM(SMAP_mean_SM<0.1)=nan;
% Significance test
mhpdif1_p_pct=mhpdif1_positive_pct;
mhpdif1_n_pct=mhpdif1_negative_pct;
mhpdif2_p_pct=mhpdif2_positive_pct;
mhpdif2_n_pct=mhpdif2_negative_pct;
mhpdif3_p_pct=mhpdif3_positive_pct;
mhpdif3_n_pct=mhpdif3_negative_pct;
[avg_mhpdif1_100,avg_mhpdif2_100,avg_mhpdif3_100,avg_mhpdif1_80,avg_mhpdif2_80,avg_mhpdif3_80]=sig_tran(avg_mhpdif1,avg_mhpdif2,avg_mhpdif3,mhpdif1_p_pct,mhpdif1_n_pct,mhpdif2_p_pct,mhpdif2_n_pct,mhpdif3_p_pct,mhpdif3_n_pct);
hhpdif1_p_pct=hhpdif1_positive_pct;
hhpdif1_n_pct=hhpdif1_negative_pct;
hhpdif2_p_pct=hhpdif2_positive_pct;
hhpdif2_n_pct=hhpdif2_negative_pct;
hhpdif3_p_pct=hhpdif3_positive_pct;
hhpdif3_n_pct=hhpdif3_negative_pct;
[avg_hhpdif1_100,avg_hhpdif2_100,avg_hhpdif3_100,avg_hhpdif1_80,avg_hhpdif2_80,avg_hhpdif3_80]=sig_tran(avg_hhpdif1,avg_hhpdif2,avg_hhpdif3,hhpdif1_p_pct,hhpdif1_n_pct,hhpdif2_p_pct,hhpdif2_n_pct,hhpdif3_p_pct,hhpdif3_n_pct);
% Renormalize mean SSM to [0,1] (original mean SSM - [0.1,0.997])
Flattened_mean_SM=SMAP_mean_SM(:)';
MappedF_mean_SM=mapminmax(Flattened_mean_SM,0,1);
Mapped_mean_SM=reshape(MappedF_mean_SM,size(SMAP_mean_SM));
% Calculate H_{SEP_n} and H_{EEP_n} diff and CV in each bin
[avg_mhpdif1_bin_Avg,avg_mhpdif1_bin_Std]=bin_value(avg_mhpdif1_80,Mapped_mean_SM);
[avg_mhpdif2_bin_Avg,avg_mhpdif2_bin_Std]=bin_value(avg_mhpdif2_80,Mapped_mean_SM);
[avg_mhpdif3_bin_Avg,avg_mhpdif3_bin_Std]=bin_value(avg_mhpdif3_80,Mapped_mean_SM);
[avg_hhpdif1_bin_Avg,avg_hhpdif1_bin_Std]=bin_value(avg_hhpdif1_80,Mapped_mean_SM);
[avg_hhpdif2_bin_Avg,avg_hhpdif2_bin_Std]=bin_value(avg_hhpdif2_80,Mapped_mean_SM);
[avg_hhpdif3_bin_Avg,avg_hhpdif3_bin_Std]=bin_value(avg_hhpdif3_80,Mapped_mean_SM);
% Plot the diagram (Figure 10)
x=[0.025,0.075,0.125,0.175,0.225,0.275,0.325,0.375,0.425,0.475,0.525,0.575,0.625,0.675,0.725,0.775,0.825,0.875,0.925,0.975];
plot1=subplot(2,3,1);
shadedErrorBar(x,avg_mhpdif1_bin_Avg,avg_mhpdif1_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-1.2,-0.6,0,0.6,1.2])
set(gca,'FontSize',12)
xlabel('(a)','FontSize',15)
ylabel('H_{SEP_n} diff mean','FontSize',15,'FontWeight','bold')
title('1/30<f<1/7 day^{-1}','FontSize',15,'FontWeight','bold')
plot2=subplot(2,3,2);
shadedErrorBar(x,avg_mhpdif2_bin_Avg,avg_mhpdif2_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-1.2,-0.6,0,0.6,1.2])
set(gca,'FontSize',12)
xlabel('(b)','FontSize',15)
title('1/90<f<1/30 day^{-1}','FontSize',15,'FontWeight','bold')
plot3=subplot(2,3,3);
shadedErrorBar(x,avg_mhpdif3_bin_Avg,avg_mhpdif3_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-1.2,-0.6,0,0.6,1.2])
set(gca,'FontSize',12)
xlabel('(c)','FontSize',15)
title('1/365<f<1/90 day^{-1}','FontSize',15,'FontWeight','bold')
plot4=subplot(2,3,4);
shadedErrorBar(x,avg_hhpdif1_bin_Avg,avg_hhpdif1_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-0.3,-0.15,0,0.15,0.3])
set(gca,'FontSize',12)
xlabel('(d)','FontSize',15)
ylabel('H_{EEP_n} diff mean','FontSize',15,'FontWeight','bold')
plot5=subplot(2,3,5);
shadedErrorBar(x,avg_hhpdif2_bin_Avg,avg_hhpdif2_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-0.3,-0.15,0,0.15,0.3])
set(gca,'FontSize',12)
xlabel('(e)','FontSize',15)
plot6=subplot(2,3,6);
shadedErrorBar(x,avg_hhpdif3_bin_Avg,avg_hhpdif3_bin_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-0.3,-0.15,0,0.15,0.3])
set(gca,'FontSize',12)
xlabel('(f)','FontSize',15)
hAxis=axes('visible','off');
text1=text('Interpreter','latex','String','$\bf{(\overline{SSM_n})}$','Position',[0.62 -0.114],'FontSize',15);
text2=text(0.32,-0.112,'Normalized observational mean SSM','FontSize',15,'FontWeight','bold');
axis([plot1 plot2 plot3],[0 1 -1.2 1.2])
axis([plot4 plot5 plot6],[0 1 -0.3 0.3])

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