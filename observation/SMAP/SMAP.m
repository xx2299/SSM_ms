% Read the SMAP data
cd('E:\Obv_2021\SMAP\h5_Files\SMAP_L3')
latitude=h5read('SMAP_L3_SM_P_20150401_R17000_002.h5','/Soil_Moisture_Retrieval_Data_AM/latitude');
longitude=h5read('SMAP_L3_SM_P_20150401_R17000_002.h5','/Soil_Moisture_Retrieval_Data_AM/longitude');
lon=longitude(:,1);
lonSMAP_new=lon.';
[~,n]=size(latitude);
lat(1,n)=0;
count=1;
for i=1:n
    latidx=find(latitude(:,i)~=-9999);
    idx=latidx(1);
    lat(1,count)=latitude(idx,i);
    count=count+1;
end
latSMAP_new=lat.';
datadir='E:\Obv_2021\SMAP\h5_Files\SMAP_L3\';
filelist=dir([datadir,'*.h5']);
k=length(filelist);
for m=1:k
    filename=[datadir,filelist(m).name];
    SM_AM{m}=h5read(filename,'/Soil_Moisture_Retrieval_Data_AM/soil_moisture');
    SM_PM{m}=h5read(filename,'/Soil_Moisture_Retrieval_Data_PM/soil_moisture_pm');
    disp(m)
end
% Compact SMAP data
A=[];
for i=1:k
    eval(['A',num2str(i),'=','SM_AM{1,i}',';']);
    eval(['A',num2str(i),'=','reshape(A',num2str(i),',[1,391384])',';']);
    eval(['A=[A;A',num2str(i),'];']);
end
A(A<0)=nan;
B=[];
for i=1:k
    eval(['B',num2str(i),'=','SM_PM{1,i}']);
    eval(['B',num2str(i),'=','reshape(B',num2str(i),',[1,391384])']);
    eval(['B=[B;B',num2str(i),'];']);
end
B(B<0)=nan;
% Data preprocessing (validation and padding)
A(A<0.02 | A>0.5)=nan;
B(B<0.02 | B>0.5)=nan;
pad1=single(NaN(1,391384));
pad2=single(NaN(34,391384));
A_padding=[A(1:42,:);pad1;A(43:258,:);pad1;A(259:394,:);pad1;A(395:542,:);pad1;A(543:1356,:);pad1;A(1357:1536,:);pad2;A(1537:2063,:)];
B_padding=[B(1:42,:);pad1;B(43:258,:);pad1;B(259:394,:);pad1;B(395:542,:);pad1;B(543:1356,:);pad1;B(1357:1536,:);pad2;B(1537:2063,:)];
[m,n]=size(A_padding);
C1(1051,n)=0;
count=1;
for day=1:1051
    C1(count,:)=nanmean([A_padding(day,:);B_padding(day,:)]);
    count=count+1;
    disp(day)
end
C1=single(C1);
C2(1051,n)=0;
count=1;
for day=1052:2102
    C2(count,:)=nanmean([A_padding(day,:);B_padding(day,:)]);
    count=count+1;
    disp(day)
end
C2=single(C2);
C=[C1;C2];
% Fill missing values
movmethod=2;
window=9;
maxlen=80;
order=80;
C1=C_AMSR_tot(:,1:97846);
[~,SMAP_Ayy1]=fill_nan(C1,movmethod,window,maxlen,order);
C2=C_AMSR_tot(:,97847:195692);
[~,SMAP_Ayy2]=fill_nan(C2,movmethod,window,maxlen,order);
C3=C_AMSR_tot(:,195693:293538);
[~,SMAP_Ayy3]=fill_nan(C3,movmethod,window,maxlen,order);
C4=C_AMSR_tot(:,293539:391384);
[~,SMAP_Ayy4]=fill_nan(C4,movmethod,window,maxlen,order);
SMAP_Ayy_mean_9_80_80=[SMAP_Ayy1,SMAP_Ayy2,SMAP_Ayy3,SMAP_Ayy4];
N=2102;
SMAP_Ayy_mean_9_80_80_f_AMSR=SMAP_Ayy_mean_9_80_80/(N/2);
N=2102;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F;
a=find(abs(x-1/7)<=0.0002);
b=find(abs(x-1/30)<=0.0002);
c=find(abs(x-1/90)<=0.0002);
d=find(abs(x-1/365)<=0.0002);
[smf1_mean_3_80_80_AMSR,smf2_mean_3_80_80_AMSR,smf3_mean_3_80_80_AMSR,~,~,~]=SM_F(SMAP_Ayy_mean_3_80_80_f_AMSR,a,b,c,d);
[~,~,~,SMF1_mean_3_80_80,SMF2_mean_3_80_80,SMF3_mean_3_80_80]=SM_F(SMAP_Ayy_mean_3_80_80_f,a,b,c,d);
[~,~,~,SMF1_mean_5_80_80,SMF2_mean_5_80_80,SMF3_mean_5_80_80]=SM_F(SMAP_Ayy_mean_5_80_80_f,a,b,c,d);
[~,~,~,SMF1_mean_7_80_80,SMF2_mean_7_80_80,SMF3_mean_7_80_80]=SM_F(SMAP_Ayy_mean_7_80_80_f,a,b,c,d);
[~,~,~,SMF1_mean_9_80_80,SMF2_mean_9_80_80,SMF3_mean_9_80_80]=SM_F(SMAP_Ayy_mean_9_80_80_f,a,b,c,d);
[SMF1_mean_3_80_80_n,SMF2_mean_3_80_80_n,SMF3_mean_3_80_80_n]=SM_F_meanS(SMF1_mean_3_80_80,SMF2_mean_3_80_80,SMF3_mean_3_80_80,SMAP_mean_SM);
[SMF1_mean_5_80_80_n,SMF2_mean_5_80_80_n,SMF3_mean_5_80_80_n]=SM_F_meanS(SMF1_mean_5_80_80,SMF2_mean_5_80_80,SMF3_mean_5_80_80,SMAP_mean_SM);
[SMF1_mean_7_80_80_n,SMF2_mean_7_80_80_n,SMF3_mean_7_80_80_n]=SM_F_meanS(SMF1_mean_7_80_80,SMF2_mean_7_80_80,SMF3_mean_7_80_80,SMAP_mean_SM);
[SMF1_mean_9_80_80_n,SMF2_mean_9_80_80_n,SMF3_mean_9_80_80_n]=SM_F_meanS(SMF1_mean_9_80_80,SMF2_mean_9_80_80,SMF3_mean_9_80_80,SMAP_mean_SM);
[~,~,~,SMF1_mean_3_80_80_AMSR,SMF2_mean_3_80_80_AMSR,SMF3_mean_3_80_80_AMSR]=SM_F(SMAP_Ayy_mean_3_80_80_f_AMSR,a,b,c,d);
[~,~,~,SMF1_mean_5_80_80_AMSR,SMF2_mean_5_80_80_AMSR,SMF3_mean_5_80_80_AMSR]=SM_F(SMAP_Ayy_mean_5_80_80_f_AMSR,a,b,c,d);
[~,~,~,SMF1_mean_7_80_80_AMSR,SMF2_mean_7_80_80_AMSR,SMF3_mean_7_80_80_AMSR]=SM_F(SMAP_Ayy_mean_7_80_80_f_AMSR,a,b,c,d);
[~,~,~,SMF1_mean_9_80_80_AMSR,SMF2_mean_9_80_80_AMSR,SMF3_mean_9_80_80_AMSR]=SM_F(SMAP_Ayy_mean_9_80_80_f_AMSR,a,b,c,d);
SMF1_mean_3_80_80_AMSR_knn=knn_mean(SMF1_mean_5_80_80,SMF1_mean_3_80_80_AMSR,1);
SMF2_mean_3_80_80_AMSR_knn=knn_mean(SMF2_mean_5_80_80,SMF2_mean_3_80_80_AMSR,1);
SMF3_mean_3_80_80_AMSR_knn=knn_mean(SMF3_mean_5_80_80,SMF3_mean_3_80_80_AMSR,1);
[SMF1_mean_3_80_80_AMSR_n,SMF2_mean_3_80_80_AMSR_n,SMF3_mean_3_80_80_AMSR_n]=SM_F_meanS(SMF1_mean_3_80_80_AMSR_knn,SMF2_mean_3_80_80_AMSR_knn,SMF3_mean_3_80_80_AMSR_knn,SMAP_mean_SM);
SMF1_mean_5_80_80_AMSR_knn=knn_mean(SMF1_mean_5_80_80,SMF1_mean_5_80_80_AMSR,1);
SMF2_mean_5_80_80_AMSR_knn=knn_mean(SMF2_mean_5_80_80,SMF2_mean_5_80_80_AMSR,1);
SMF3_mean_5_80_80_AMSR_knn=knn_mean(SMF3_mean_5_80_80,SMF3_mean_5_80_80_AMSR,1);
[SMF1_mean_5_80_80_AMSR_n,SMF2_mean_5_80_80_AMSR_n,SMF3_mean_5_80_80_AMSR_n]=SM_F_meanS(SMF1_mean_5_80_80_AMSR_knn,SMF2_mean_5_80_80_AMSR_knn,SMF3_mean_5_80_80_AMSR_knn,SMAP_mean_SM);
SMF1_mean_7_80_80_AMSR_knn=knn_mean(SMF1_mean_7_80_80,SMF1_mean_7_80_80_AMSR,1);
SMF2_mean_7_80_80_AMSR_knn=knn_mean(SMF2_mean_7_80_80,SMF2_mean_7_80_80_AMSR,1);
SMF3_mean_7_80_80_AMSR_knn=knn_mean(SMF3_mean_7_80_80,SMF3_mean_7_80_80_AMSR,1);
[SMF1_mean_7_80_80_AMSR_n,SMF2_mean_7_80_80_AMSR_n,SMF3_mean_7_80_80_AMSR_n]=SM_F_meanS(SMF1_mean_7_80_80_AMSR_knn,SMF2_mean_7_80_80_AMSR_knn,SMF3_mean_7_80_80_AMSR_knn,SMAP_mean_SM);
SMF1_mean_9_80_80_AMSR_knn=knn_mean(SMF1_mean_9_80_80,SMF1_mean_9_80_80_AMSR,1);
SMF2_mean_9_80_80_AMSR_knn=knn_mean(SMF2_mean_9_80_80,SMF2_mean_9_80_80_AMSR,1);
SMF3_mean_9_80_80_AMSR_knn=knn_mean(SMF3_mean_9_80_80,SMF3_mean_9_80_80_AMSR,1);
[SMF1_mean_9_80_80_AMSR_n,SMF2_mean_9_80_80_AMSR_n,SMF3_mean_9_80_80_AMSR_n]=SM_F_meanS(SMF1_mean_9_80_80_AMSR_knn,SMF2_mean_9_80_80_AMSR_knn,SMF3_mean_9_80_80_AMSR_knn,SMAP_mean_SM);
% Final results definition
SMF1=SMF1_mean_3_80_80_AMSR_n;
SMF2=SMF2_mean_3_80_80_AMSR_n;
SMF3=SMF3_mean_3_80_80_AMSR_n;
SMF_template=SMF1_mean_5_80_80;
% Mean value of SSM_n within significance test
dif1_p_pct=mdif1_positive_pct;
dif1_n_pct=mdif1_negative_pct;
dif2_p_pct=mdif2_positive_pct;
dif2_n_pct=mdif2_negative_pct;
dif3_p_pct=mdif3_positive_pct;
dif3_n_pct=mdif3_negative_pct;
[SMF1_100,SMF2_100,SMF3_100,SMF1_80,SMF2_80,SMF3_80]=sig_tran(SMF1,SMF2,SMF3,dif1_p_pct,dif1_n_pct,dif2_p_pct,dif2_n_pct,dif3_p_pct,dif3_n_pct);
SMF1_100_num=nanmean(SMF1_100(:));
SMF2_100_num=nanmean(SMF2_100(:));
SMF3_100_num=nanmean(SMF3_100(:));
SMF1_80_num=nanmean(SMF1_80(:));
SMF2_80_num=nanmean(SMF2_80(:));
SMF3_80_num=nanmean(SMF3_80(:));
% Get SSM_kw over different time scales
SMAP_Z_mean_3_80_80=[Z1_mean_3_80_80,Z2_mean_3_80_80,Z3_mean_3_80_80,Z4_mean_3_80_80];
N=2102;
Fs=1;
[SMP1,SMP2,SMP3]=SMAP_P(SMAP_Z_mean_3_80_80,N,Fs);

function [filled_data,filled_Ayy]=fill_nan(ori_data,movmethod,window,maxlen,order)

[m,n]=size(ori_data);
filled_data(m,n)=0;
count=1;
if movmethod==1
    for i=1:n
        data=fillmissing(ori_data(:,i),'movmedian',window);
        data=double(data);
        filled_data(:,count)=fillgaps(data,maxlen,order);
        count=count+1;
        disp(i);
    end
elseif movmethod==2
        for i=1:n
            data=fillmissing(ori_data(:,i),'movmean',window);
            data=double(data);
            filled_data(:,count)=fillgaps(data,maxlen,order);
            count=count+1;
            disp(i);
        end
else
    print('The movmethod parameter is wrong!')
end
filled_data=single(filled_data);
filled_data(filled_data<0.02)=0.02;
filled_data(filled_data>0.5)=0.5;
Y=fft(filled_data);
filled_Ayy=abs(Y).^2;
filled_Ayy=filled_Ayy(1:1501,:);

end

function [smf1,smf2,smf3,SMF1,SMF2,SMF3]=SM_F(SMAP_Ayy,a,b,c,d)

SMAP_ybar1=nansum(SMAP_Ayy(b:a,:));
YBAR1=reshape(SMAP_ybar1,[964,406]);
Fybar1=YBAR1.';
SMAP_ybar2=nansum(SMAP_Ayy(c:b,:));
YBAR2=reshape(SMAP_ybar2,[964,406]);
Fybar2=YBAR2.';
SMAP_ybar3=nansum(SMAP_Ayy(d:c,:));
YBAR3=reshape(SMAP_ybar3,[964,406]);
Fybar3=YBAR3.';
smf1=SMAP_ybar1./(SMAP_ybar1+SMAP_ybar2+SMAP_ybar3);
smf2=SMAP_ybar2./(SMAP_ybar1+SMAP_ybar2+SMAP_ybar3);
smf3=SMAP_ybar3./(SMAP_ybar1+SMAP_ybar2+SMAP_ybar3);
SMF1=Fybar1./(Fybar1+Fybar2+Fybar3);
SMF2=Fybar2./(Fybar1+Fybar2+Fybar3);
SMF3=Fybar3./(Fybar1+Fybar2+Fybar3);

end

function [SMF1_n,SMF2_n,SMF3_n]=SM_F_meanS(SMF1,SMF2,SMF3,meanS)

SMF1(meanS<0.1)=nan;
SMF2(meanS<0.1)=nan;
SMF3(meanS<0.1)=nan;
SMF1_n=SMF1./(SMF1+SMF2+SMF3);
SMF2_n=SMF2./(SMF1+SMF2+SMF3);
SMF3_n=SMF3./(SMF1+SMF2+SMF3);

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

function [SMP1,SMP2,SMP3]=SMAP_P(SMAP_A,N,Fs)

F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.0002);
b=find(abs(x-1/30)<=0.0002);
c=find(abs(x-1/90)<=0.0002);
d=find(abs(x-1/365)<=0.0002);
[~,n]=size(SMAP_A);
SMp1(1,n)=0;
SMp2(1,n)=0;
SMp3(1,n)=0;
count=1;
for i=1:n
    temp=isnan(SMAP_A(:,i));
    if sum(temp)>=2101
        SMp1(1,count)=nan;
        SMp2(1,count)=nan;
        SMp3(1,count)=nan;
    else
        A=SMAP_A(:,i);
        var=sum((A-mean(A)).^2)/length(A);
        Y=fft(A);
        Y=Y(1:(N/2),:);
        Ayy=abs(Y).^2;
        Ayy=Ayy/(N/2)/var;
        X=[ones(length(Ayy),1),x'];
        p1=polyfit(log(X(b:a,2)),log(Ayy(b:a)),1);
        SMp1(1,count)=p1(1);
        p2=polyfit(log(X(c:b,2)),log(Ayy(c:b)),1);
        SMp2(1,count)=p2(1);
        p3=polyfit(log(X(d:c,2)),log(Ayy(d:c)),1);
        SMp3(1,count)=p3(1);
    end
    disp(i);
    count=count+1;
end
SMp1=single(SMp1);
SMp11=reshape(SMp1,[964,406]);
P1=imrotate(SMp11,-90);
SMP1=fliplr(P1);
SMp2=single(SMp2);
SMp22=reshape(SMp2,[964,406]);
P2=imrotate(SMp22,-90);
SMP2=fliplr(P2);
SMp3=single(SMp3);
SMp33=reshape(SMp3,[964,406]);
P3=imrotate(SMp33,-90);
SMP3=fliplr(P3);

end

function [n_mF]=knn_mean(obv_F,n_mF,p_num)
% % logistic difference between model and SMAP (0:same, 1:pixel non-NaN for model but NaN for SMAP(1-0=1), -1:pixel NaN for model but non-NaN for SMAP (0-1=-1))
logic_temp_obv=single(~isnan(obv_F));
logic_temp_modelf=single(~isnan(n_mF));
diff_temp=logic_temp_modelf-logic_temp_obv;
n_mF(diff_temp==1)=nan;   % change non-NaN for model but NaN for SMAP to NaN in model
diff_num=length(find(diff_temp==-1));

while diff_num>0
    % % change NaN for model but non-NaN for SMAP to non-NaN in model (KNN-mean)
    dim=size(obv_F);
    [lat,lon]=find(diff_temp==-1);
    idx=find(diff_temp==-1);
    idx_temp=[lat,lon,idx];
    % % find corresponding index for pixels as non-NaN in SMAP
    p_c_lt=find(lon==1 & lat==1);   % left-top-corner pixel
    p_c_lb=find(lon==1 & lat==dim(1));   % left-bottom-corner pixel
    p_c_rt=find(lon==dim(2) & lat==1);   % right-top-corner pixel
    p_c_rb=find(lon==dim(2) & lat==dim(1));   % right-bottom-corner pixel
    p_t=find((lat==1 & lon~=1 & lon~=dim(2)));   % top line pixels (without corner)
    p_b=find((lat==dim(1) & lon~=1 & lon~=dim(2)));   % bottom line pixels (without corner)
    p_l=find((lon==1 & lat~=1 & lat~=dim(1)));   % left line pixels (without corner)
    p_r=find((lon==dim(2) & lat~=1 & lat~=dim(1)));   % right line pixels (without corner)
    p_o=find((lat~=1 & lat~=dim(1) & lon~=1 & lon~=dim(2)));   % other pixels
    % % change pixels with NaN for model but non-NaN for SMAP to non-NaN in model (four corners)
    n_mF(idx(p_c_lt))=nanmean([n_mF(lat(p_c_lt),lon(p_c_lt)+p_num),n_mF(lat(p_c_lt)+p_num,lon(p_c_lt)),n_mF(lat(p_c_lt)+p_num,lon(p_c_lt)+1)]);
    n_mF(idx(p_c_lb))=nanmean([n_mF(lat(p_c_lb)-p_num,lon(p_c_lb)),n_mF(lat(p_c_lb),lon(p_c_lb)+p_num),n_mF(lat(p_c_lb)-p_num,lon(p_c_lb)+1)]);
    n_mF(idx(p_c_rt))=nanmean([n_mF(lat(p_c_rt),lon(p_c_rt)-p_num),n_mF(lat(p_c_rt)+p_num,lon(p_c_rt)),n_mF(lat(p_c_rt)+p_num,lon(p_c_rt)-1)]);
    n_mF(idx(p_c_rb))=nanmean([n_mF(lat(p_c_rb)-p_num,lon(p_c_rb)),n_mF(lat(p_c_rb),lon(p_c_rb)-p_num),n_mF(lat(p_c_rb)-p_num,lon(p_c_rb)-1)]);
    % % change pixels with NaN for model but non-NaN for SMAP to non-NaN in model (Outermost circle)
    % % n_t, n_b, n_l, n_r: number of pixels in top, bottom, left, right line
    for n_t=1:length(p_t)
        if lon(p_t(n_t))-p_num>=1 && lat(p_t(n_t))+p_num<=dim(1) && lon(p_t(n_t))+p_num<=dim(2)
            n_mF(idx(p_t(n_t)))=nanmean([n_mF(lat(p_t(n_t)),lon(p_t(n_t))-p_num),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))),n_mF(lat(p_t(n_t)),lon(p_t(n_t))+p_num),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))-p_num),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))+p_num)]);
        elseif lon(p_t(n_t))-p_num<1
            n_mF(idx(p_t(n_t)))=nanmean([n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))),n_mF(lat(p_t(n_t)),lon(p_t(n_t))+p_num),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))+p_num)]);
        elseif lat(p_t(n_t))+p_num>dim(1)
            n_mF(idx(p_t(n_t)))=nanmean([n_mF(lat(p_t(n_t)),lon(p_t(n_t))-p_num),n_mF(lat(p_t(n_t)),lon(p_t(n_t))+p_num)]);
        elseif lon(p_t(n_t))+p_num>dim(2)
            n_mF(idx(p_t(n_t)))=nanmean([n_mF(lat(p_t(n_t)),lon(p_t(n_t))-p_num),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))-p_num)]);
        end
    end
    for n_b=1:length(p_b)
        if lat(p_b(n_b))-p_num>=1 && lon(p_b(n_b))-p_num>=1 && lon(p_b(n_b))+p_num<=dim(2)
            n_mF(idx(p_b(n_b)))=nanmean([n_mF(lat(p_b(n_b)),lon(p_b(n_b))-p_num),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))),n_mF(lat(p_b(n_b)),lon(p_b(n_b))+p_num),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))-p_num),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))+p_num)]);
        elseif lat(p_b(n_b))-p_num<1
            n_mF(idx(p_b(n_b)))=nanmean([n_mF(lat(p_b(n_b)),lon(p_b(n_b))-p_num),n_mF(lat(p_b(n_b)),lon(p_b(n_b))+p_num)]);
        elseif lon(p_b(n_b))-p_num<1
            n_mF(idx(p_b(n_b)))=nanmean([n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))),n_mF(lat(p_b(n_b)),lon(p_b(n_b))+p_num),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))+p_num)]);
        elseif lon(p_b(n_b))+p_num>dim(2)
            n_mF(idx(p_b(n_b)))=nanmean([n_mF(lat(p_b(n_b)),lon(p_b(n_b))-p_num),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))-p_num)]);
        end
    end
    for n_l=1:length(p_l)
        if lat(p_l(n_l))-p_num>=1 && lat(p_l(n_l))+p_num<=dim(1) && lon(p_l(n_l))+p_num<=dim(2)
            n_mF(idx(p_l(n_l)))=nanmean([n_mF(lat(p_l(n_l))-p_num,lon(p_l(n_l))),n_mF(lat(p_l(n_l)),lon(p_l(n_l))+p_num),n_mF(lat(p_l(n_l))+p_num,lon(p_l(n_l))),n_mF(lat(p_l(n_l))-p_num,lon(p_l(n_l))+p_num),n_mF(lat(p_l(n_l))+p_num,lon(p_l(n_l))+p_num)]);
        elseif lat(p_l(n_l))-p_num<1
            n_mF(idx(p_l(n_l)))=nanmean([n_mF(lat(p_l(n_l)),lon(p_l(n_l))+p_num),n_mF(lat(p_l(n_l))+p_num,lon(p_l(n_l))),n_mF(lat(p_l(n_l))+p_num,lon(p_l(n_l))+p_num)]);
        elseif lat(p_l(n_l))+p_num>dim(1)
            n_mF(idx(p_l(n_l)))=nanmean([n_mF(lat(p_l(n_l))-p_num,lon(p_l(n_l))),n_mF(lat(p_l(n_l)),lon(p_l(n_l))+p_num),n_mF(lat(p_l(n_l))-p_num,lon(p_l(n_l))+p_num)]);
        elseif lon(p_l(n_l))+p_num>dim(2)
            n_mF(idx(p_l(n_l)))=nanmean([n_mF(lat(p_l(n_l))-p_num,lon(p_l(n_l))),n_mF(lat(p_l(n_l))+p_num,lon(p_l(n_l)))]);
        end
    end
    for n_r=1:length(p_r)
        if lat(p_r(n_r))-p_num>=1 && lon(p_r(n_r))-p_num>=1 && lat(p_r(n_r))+p_num<=dim(1)
            n_mF(idx(p_r(n_r)))=nanmean([n_mF(lat(p_r(n_r))-p_num,lon(p_r(n_r))),n_mF(lat(p_r(n_r)),lon(p_r(n_r))-p_num),n_mF(lat(p_r(n_r))+p_num,lon(p_r(n_r))),n_mF(lat(p_r(n_r))-p_num,lon(p_r(n_r))-p_num),n_mF(lat(p_r(n_r))+p_num,lon(p_r(n_r))-p_num)]);
        elseif lat(p_r(n_r))-p_num<1
            n_mF(idx(p_r(n_r)))=nanmean([n_mF(lat(p_r(n_r)),lon(p_r(n_r))-p_num),n_mF(lat(p_r(n_r))+p_num,lon(p_r(n_r))),n_mF(lat(p_r(n_r))+p_num,lon(p_r(n_r))-p_num)]);
        elseif lon(p_r(n_r))-p_num<1
            n_mF(idx(p_r(n_r)))=nanmean([n_mF(lat(p_r(n_r))-p_num,lon(p_r(n_r))),n_mF(lat(p_r(n_r))+p_num,lon(p_r(n_r)))]);
        elseif lat(p_r(n_r))+p_num>dim(1)
            n_mF(idx(p_r(n_r)))=nanmean([n_mF(lat(p_r(n_r))-p_num,lon(p_r(n_r))),n_mF(lat(p_r(n_r)),lon(p_r(n_r))-p_num),n_mF(lat(p_r(n_r))-p_num,lon(p_r(n_r))-p_num)]);
        end
    end
    % % change pixels with NaN for model but non-NaN for SMAP to non-NaN in model (others in center)
    % % n_o: number of pixels in center (i.e., other pixels)
    for n_o=1:length(p_o)
        if lat(p_o(n_o))-p_num>=1 && lon(p_o(n_o))-p_num>=1 && lat(p_o(n_o))+p_num<=dim(1) && lon(p_o(n_o))+p_num<=dim(2)
            n_mF(idx(p_o(n_o)))=nanmean([n_mF(lat(p_o(n_o)),lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o)),lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))+p_num)]);
        elseif lat(p_o(n_o))-p_num<1
            n_mF(idx(p_o(n_o)))=nanmean([n_mF(lat(p_o(n_o)),lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o)),lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))+p_num)]);
        elseif lon(p_o(n_o))-p_num<1
            n_mF(idx(p_o(n_o)))=nanmean([n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o)),lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))+p_num)]);
        elseif lat(p_o(n_o))+p_num>dim(1)
            n_mF(idx(p_o(n_o)))=nanmean([n_mF(lat(p_o(n_o)),lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o)),lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))+p_num)]);
        elseif lon(p_o(n_o))+p_num>dim(2)
            n_mF(idx(p_o(n_o)))=nanmean([n_mF(lat(p_o(n_o)),lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))-p_num)]);
        end
    end
    % % Reculculate diff_num to check whether equals to 0
    logic_temp_modelf=single(~isnan(n_mF));
    diff_temp=logic_temp_modelf-logic_temp_obv;
    diff_num=length(find(diff_temp==-1));
    disp(['diff_num:',num2str(diff_num)])
    p_num=p_num+1;
    disp(['p_num:',num2str(p_num)])
end
end