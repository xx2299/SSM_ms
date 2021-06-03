% Change the spatial resolution of sand content to the same as SMAP
sand_avg=(sand1rf+sand2rf)/2;
[v1,v2]=size(sand_avg);
sand_avg_temp=imresize(sand_avg,[v1/2,v2/2],'bilinear');
[w1,w2]=size(sand_avg_temp);
sand_londata=imresize(sand_lonData,[v2/2,1],'bilinear');
sand_latdata=imresize(sand_latData,[v1/2,1],'bilinear');
lon=sand_londata.';
count=1;
for i=1:w1
    sand_lat(count:count+w2-1,1)=sand_latdata(i,1);
    sand_lon(count:count+w2-1,1)=lon;
    count=count+w2;
end
sand_lat=single(sand_lat);
sand_avg_used=sand_avg_temp.';
sand_f=reshape(sand_avg_used,[w1*w2,1]);
sand_content=[sand_lat,sand_lon,sand_f];
[m1,n1]=size(sand_content);
[m2,n2]=size(SMAP1);
dif(m1,1)=0;
sand_new(m2,1)=0;
for j=1:m2
    count=1;
    for i=1:m1
        dif(count,1)=abs(sand_content(i,1)-SMAP1(j,1))+abs(sand_content(i,2)-SMAP1(j,2));
        count=count+1;
    end
    [~,idx]=min(dif);
    sand_new(j,1)=sand_content(idx,3);
    disp(j)
end
new=reshape(sand_new,[964,406]);
sand_content_new=new.';
% Change sand content has same surface coverage as SMAP
sand_content_knn=knn_mean(SMF_template,sand_content_new,1);
% Renormalize sand content to [0,1] (original sand content - [0.0102,0.98])
Flattened_mean_sand=sand_content_knn(:)';
MappedF_mean_sand=mapminmax(Flattened_mean_sand,0,1);
Mapped_mean_sand=reshape(MappedF_mean_sand,size(sand_content_knn));
% Remove regions with SSM less than 0.1
Mapped_mean_sand(SMAP_mean_SM<0.1)=nan;
avg_mdif1(SMAP_mean_SM<0.1)=nan;
avg_mdif2(SMAP_mean_SM<0.1)=nan;
avg_mdif3(SMAP_mean_SM<0.1)=nan;
avg_mhpdif1(SMAP_mean_SM<0.1)=nan;
avg_mhpdif2(SMAP_mean_SM<0.1)=nan;
avg_mhpdif3(SMAP_mean_SM<0.1)=nan;
avg_hhpdif1(SMAP_mean_SM<0.1)=nan;
avg_hhpdif2(SMAP_mean_SM<0.1)=nan;
avg_hhpdif3(SMAP_mean_SM<0.1)=nan;
% Significance test
mdif1_p_pct=mdif1_positive_pct;
mdif1_n_pct=mdif1_negative_pct;
mdif2_p_pct=mdif2_positive_pct;
mdif2_n_pct=mdif2_negative_pct;
mdif3_p_pct=mdif3_positive_pct;
mdif3_n_pct=mdif3_negative_pct;
[avg_mdif1_100,avg_mdif2_100,avg_mdif3_100,avg_mdif1_80,avg_mdif2_80,avg_mdif3_80]=sig_tran(avg_mdif1,avg_mdif2,avg_mdif3,mdif1_p_pct,mdif1_n_pct,mdif2_p_pct,mdif2_n_pct,mdif3_p_pct,mdif3_n_pct);
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
% Separate sand content into 20 bins of equal size
x=[0.025,0.075,0.125,0.175,0.225,0.275,0.325,0.375,0.425,0.475,0.525,0.575,0.625,0.675,0.725,0.775,0.825,0.875,0.925,0.975];
% Calculate SSM_n, H_{SEP_n}, and H_{EEP_n} diff and std in each bin
[avg_mdif1_sand_Avg,avg_mdif1_sand_Std]=bin_value(avg_mdif1_80,Mapped_mean_sand);
[avg_mdif2_sand_Avg,avg_mdif2_sand_Std]=bin_value(avg_mdif2_80,Mapped_mean_sand);
[avg_mdif3_sand_Avg,avg_mdif3_sand_Std]=bin_value(avg_mdif3_80,Mapped_mean_sand);
[avg_mhpdif1_sand_Avg,avg_mhpdif1_sand_Std]=bin_value(avg_mhpdif1_80,Mapped_mean_sand);
[avg_mhpdif2_sand_Avg,avg_mhpdif2_sand_Std]=bin_value(avg_mhpdif2_80,Mapped_mean_sand);
[avg_mhpdif3_sand_Avg,avg_mhpdif3_sand_Std]=bin_value(avg_mhpdif3_80,Mapped_mean_sand);
[avg_hhpdif1_sand_Avg,avg_hhpdif1_sand_Std]=bin_value(avg_hhpdif1_80,Mapped_mean_sand);
[avg_hhpdif2_sand_Avg,avg_hhpdif2_sand_Std]=bin_value(avg_hhpdif2_80,Mapped_mean_sand);
[avg_hhpdif3_sand_Avg,avg_hhpdif3_sand_Std]=bin_value(avg_hhpdif3_80,Mapped_mean_sand);
% Plot the diagram (Figure S6)
plot1=subplot(3,3,1);
shadedErrorBar(x,avg_mdif1_sand_Avg,avg_mdif1_sand_Std,'lineprops',{'-ro','MarkerFaceColor','r'});
grid on
set(gca,'YTick',[-1,-0.5,0,0.5,1])
set(gca,'FontSize',12)
xlabel('(a)','FontSize',15)
ylabel('SSM_n diff mean','FontSize',15,'FontWeight','bold')
title('1/30<f<1/7 day^{-1}','FontSize',15,'FontWeight','bold')
plot2=subplot(3,3,2);
shadedErrorBar(x,avg_mdif2_sand_Avg,avg_mdif2_sand_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-1,-0.5,0,0.5,1])
set(gca,'FontSize',12)
xlabel('(b)','FontSize',15)
title('1/90<f<1/30 day^{-1}','FontSize',15,'FontWeight','bold')
plot3=subplot(3,3,3);
shadedErrorBar(x,avg_mdif3_sand_Avg,avg_mdif3_sand_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-1,-0.5,0,0.5,1])
set(gca,'FontSize',12)
xlabel('(c)','FontSize',15)
title('1/365<f<1/90 day^{-1}','FontSize',15,'FontWeight','bold')
plot4=subplot(3,3,4);
shadedErrorBar(x,avg_mhpdif1_sand_Avg,avg_mhpdif1_sand_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'FontSize',12)
xlabel('(d)','FontSize',15)
ylabel('H_{SEP_n} diff mean','FontSize',15,'FontWeight','bold')
plot5=subplot(3,3,5);
shadedErrorBar(x,avg_mhpdif2_sand_Avg,avg_mhpdif2_sand_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'FontSize',12)
xlabel('(e)','FontSize',15)
plot6=subplot(3,3,6);
shadedErrorBar(x,avg_mhpdif3_sand_Avg,avg_mhpdif3_sand_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'FontSize',12)
xlabel('(f)','FontSize',15)
plot7=subplot(3,3,7);
shadedErrorBar(x,avg_hhpdif1_sand_Avg,avg_hhpdif1_sand_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-1,-0.5,0,0.5,1])
set(gca,'FontSize',12)
xlabel('(g)','FontSize',15)
ylabel('H_{EEP_n} diff mean','FontSize',15,'FontWeight','bold')
plot8=subplot(3,3,8);
shadedErrorBar(x,avg_hhpdif2_sand_Avg,avg_hhpdif2_sand_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-1,-0.5,0,0.5,1])
set(gca,'FontSize',12)
xlabel('(h)','FontSize',15)
plot9=subplot(3,3,9);
shadedErrorBar(x,avg_hhpdif3_sand_Avg,avg_hhpdif3_sand_Std,'lineprops',{'-ro','MarkerFaceColor','r'})
grid on
set(gca,'YTick',[-1,-0.5,0,0.5,1])
set(gca,'FontSize',12)
xlabel('(i)','FontSize',15)
axis([plot1 plot2 plot3],[0 1 -1 1])
axis([plot4 plot5 plot6],[0 1 -4 4])
axis([plot7 plot8 plot9],[0 1 -1 1])
hAxis=axes('visible','off');
h=text(0.383,-0.1,'Normalized soil sand content','FontSize',15,'FontWeight','bold');

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