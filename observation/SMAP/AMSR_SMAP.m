% Read the AMSR data within SMAP temporal coverage
datadir='E:\NNsm_nc\SMAP\';
filelist=dir([datadir,'*.nc']);
k=length(filelist);
for m=1:k
    filename=[datadir,filelist(m).name];
    AMSR{m}=ncread(filename,'sm');
    disp(m)
end
AMSR_A=[];
for i=1:k
    eval(['AMSR_A',num2str(i),'=','AMSR{1,i}',';']);
    eval(['AMSR_A',num2str(i),'=','single(AMSR_A',num2str(i),')',';']);
    eval(['AMSR_A',num2str(i),'=','reshape(AMSR_A',num2str(i),',[1,391384])',';']);
    eval(['AMSR_A=[AMSR_A;AMSR_A',num2str(i),'];']);
    eval(['clear AMSR_A',num2str(i)],';');
end
AMSR_A(AMSR_A<0)=nan;
AMSR_A(AMSR_A<0.02 | AMSR_A>0.5)=nan;
% Combine the AMSR data with SMAP
C_AMSR=C(1:1736,:);
temp_num=391384/2;
C_AMSR_1=C_AMSR(:,1:temp_num);
AMSR_A_1=AMSR_A(:,1:temp_num);
C_AMSR_1=AMSR_fill(AMSR_A_1,C_AMSR_1);
C_AMSR_2=C_AMSR(:,(temp_num+1):(temp_num*2));
AMSR_A_2=AMSR_A(:,(temp_num+1):(temp_num*2));
C_AMSR_2=AMSR_fill(AMSR_A_2,C_AMSR_2);
C_AMSR_fill=[C_AMSR_1,C_AMSR_2];
C_nAMSR=C(1737:2102,:);
C_AMSR_tot=[C_AMSR_fill;C_nAMSR];
% Read all AMSR data
datadir='E:\NNsm_nc\all\';
filelist=dir([datadir,'*.nc']);
for m=1001:2000
    filename=[datadir,filelist(m).name];
    AMSR{m}=ncread(filename,'sm');
    disp(m)
end
AMSR_2000_A=[];
for i=1001:2000
    eval(['AMSR_2000_A',num2str(i),'=','AMSR{1,i}',';']);
    eval(['AMSR_2000_A',num2str(i),'=','single(AMSR_2000_A',num2str(i),')',';']);
    eval(['AMSR_2000_A',num2str(i),'=','reshape(AMSR_2000_A',num2str(i),',[1,391384])',';']);
    eval(['AMSR_2000_A=[AMSR_2000_A;AMSR_2000_A',num2str(i),'];']);
    disp(i)
end
datadir='E:\NNsm_nc\all\';
filelist=dir([datadir,'*.nc']);
for m=2001:3000
    filename=[datadir,filelist(m).name];
    AMSR{m}=ncread(filename,'sm');
    disp(m)
end
AMSR_3000_A=[];
for i=2001:3000
    eval(['AMSR_3000_A',num2str(i),'=','AMSR{1,i}',';']);
    eval(['AMSR_3000_A',num2str(i),'=','single(AMSR_3000_A',num2str(i),')',';']);
    eval(['AMSR_3000_A',num2str(i),'=','reshape(AMSR_3000_A',num2str(i),',[1,391384])',';']);
    eval(['AMSR_3000_A=[AMSR_3000_A;AMSR_3000_A',num2str(i),'];']);
    disp(i)
end
datadir='E:\NNsm_nc\all\';
filelist=dir([datadir,'*.nc']);
for m=3001:4000
    filename=[datadir,filelist(m).name];
    AMSR{m}=ncread(filename,'sm');
    disp(m)
end
AMSR_4000_A=[];
for i=3001:4000
    eval(['AMSR_4000_A',num2str(i),'=','AMSR{1,i}',';']);
    eval(['AMSR_4000_A',num2str(i),'=','single(AMSR_4000_A',num2str(i),')',';']);
    eval(['AMSR_4000_A',num2str(i),'=','reshape(AMSR_4000_A',num2str(i),',[1,391384])',';']);
    eval(['AMSR_4000_A=[AMSR_4000_A;AMSR_4000_A',num2str(i),'];']);
    disp(i)
end
datadir='E:\NNsm_nc\all\';
filelist=dir([datadir,'*.nc']);
for m=4001:5000
    filename=[datadir,filelist(m).name];
    AMSR{m}=ncread(filename,'sm');
    disp(m)
end
AMSR_5000_A=[];
for i=4001:5000
    eval(['AMSR_5000_A',num2str(i),'=','AMSR{1,i}',';']);
    eval(['AMSR_5000_A',num2str(i),'=','single(AMSR_5000_A',num2str(i),')',';']);
    eval(['AMSR_5000_A',num2str(i),'=','reshape(AMSR_5000_A',num2str(i),',[1,391384])',';']);
    eval(['AMSR_5000_A=[AMSR_5000_A;AMSR_5000_A',num2str(i),'];']);
    disp(i)
end
datadir='E:\NNsm_nc\all\';
filelist=dir([datadir,'*.nc']);
for m=5001:6000
    filename=[datadir,filelist(m).name];
    AMSR{m}=ncread(filename,'sm');
    disp(m)
end
AMSR_6000_A=[];
for i=5001:6000
    eval(['AMSR_6000_A',num2str(i),'=','AMSR{1,i}',';']);
    eval(['AMSR_6000_A',num2str(i),'=','single(AMSR_6000_A',num2str(i),')',';']);
    eval(['AMSR_6000_A',num2str(i),'=','reshape(AMSR_6000_A',num2str(i),',[1,391384])',';']);
    eval(['AMSR_6000_A=[AMSR_6000_A;AMSR_6000_A',num2str(i),'];']);
    disp(i)
end
datadir='E:\NNsm_nc\all\';
filelist=dir([datadir,'*.nc']);
for m=6001:6423
    filename=[datadir,filelist(m).name];
    AMSR{m}=ncread(filename,'sm');
    disp(m)
end
AMSR_6423_A=[];
for i=6001:6423
    eval(['AMSR_6423_A',num2str(i),'=','AMSR{1,i}',';']);
    eval(['AMSR_6423_A',num2str(i),'=','single(AMSR_6423_A',num2str(i),')',';']);
    eval(['AMSR_6423_A',num2str(i),'=','reshape(AMSR_6423_A',num2str(i),',[1,391384])',';']);
    eval(['AMSR_6423_A=[AMSR_6423_A;AMSR_6423_A',num2str(i),'];']);
    disp(i)
end
% Fill in missing values for combined data
movmethod=2;
window=9;
maxlen=80;
order=80;
C1=C_AMSR_tot(:,1:97846);
[Z1_mean_9_80_80,SMAP_Ayy1]=fill_nan(C1,movmethod,window,maxlen,order);
C2=C_AMSR_tot(:,97847:195692);
[Z2_mean_9_80_80,SMAP_Ayy2]=fill_nan(C2,movmethod,window,maxlen,order);
C3=C_AMSR_tot(:,195693:293538);
[Z3_mean_9_80_80,SMAP_Ayy3]=fill_nan(C3,movmethod,window,maxlen,order);
C4=C_AMSR_tot(:,293539:391384);
[Z4_mean_9_80_80,SMAP_Ayy4]=fill_nan(C4,movmethod,window,maxlen,order);
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
% Evenly split monthly A to 18 chunks
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\all_A\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
split_num=14;
temp_num=964*406/split_num;
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    for i=1:split_num
        eval(['A',num2str(m),'_',num2str(i),'=','A_temp(:,temp_num*(i-1)+1:temp_num*i)',';']);
        fileDir='E:\Obv_2021\SMAP\data\AMSR\long_test\split_A\';
        filename=strcat(fileDir,'A',num2str(m),'_',num2str(i),'.mat');
        save(filename,['A',num2str(m),'_',num2str(i)])
        eval(['clear ','A',num2str(m),'_',num2str(i),';'])
        disp(i)
    end
    disp(m)
end
% Fill in missing values for entire AMSR data
movmethod=2;
window=9;
maxlen=80;
order=80;
N=2102;
Fs=1;
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_1\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_1=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_1=[A_1;A_temp];
    disp(m)
end
[ybar1_1,ybar2_1,ybar3_1]=fill_nan_AMSR(A_1,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_2\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_2=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_2=[A_2;A_temp];
    disp(m)
end
[ybar1_2,ybar2_2,ybar3_2]=fill_nan_AMSR(A_2,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_3\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_3=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_3=[A_3;A_temp];
    disp(m)
end
[ybar1_3,ybar2_3,ybar3_3]=fill_nan_AMSR(A_3,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_4\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_4=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_4=[A_4;A_temp];
    disp(m)
end
[ybar1_4,ybar2_4,ybar3_4]=fill_nan_AMSR(A_4,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_5\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_5=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_5=[A_5;A_temp];
    disp(m)
end
[ybar1_5,ybar2_5,ybar3_5]=fill_nan_AMSR(A_5,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_6\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_6=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_6=[A_6;A_temp];
    disp(m)
end
[ybar1_6,ybar2_6,ybar3_6]=fill_nan_AMSR(A_6,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_7\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_7=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_7=[A_7;A_temp];
    disp(m)
end
[ybar1_7,ybar2_7,ybar3_7]=fill_nan_AMSR(A_7,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_8\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_8=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_8=[A_8;A_temp];
    disp(m)
end
[ybar1_8,ybar2_8,ybar3_8]=fill_nan_AMSR(A_8,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_9\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_9=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_9=[A_9;A_temp];
    disp(m)
end
[ybar1_9,ybar2_9,ybar3_9]=fill_nan_AMSR(A_9,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_10\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_10=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_10=[A_10;A_temp];
    disp(m)
end
[ybar1_10,ybar2_10,ybar3_10]=fill_nan_AMSR(A_10,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_11\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_11=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_11=[A_11;A_temp];
    disp(m)
end
[ybar1_11,ybar2_11,ybar3_11]=fill_nan_AMSR(A_11,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_12\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_12=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_12=[A_12;A_temp];
    disp(m)
end
[ybar1_12,ybar2_12,ybar3_12]=fill_nan_AMSR(A_12,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_13\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_13=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_13=[A_13;A_temp];
    disp(m)
end
[ybar1_13,ybar2_13,ybar3_13]=fill_nan_AMSR(A_13,movmethod,window,maxlen,order,N,Fs);
datadir='E:\Obv_2021\SMAP\data\AMSR\long_test\splice_A\A_14\';
filelist=dir([datadir,'*.mat']);
k=length(filelist);
A_14=[];
for m=1:k
    A_temp=cell2mat(struct2cell(load(strcat(datadir,filelist(m).name))));
    A_14=[A_14;A_temp];
    disp(m)
end
[ybar1_14,ybar2_14,ybar3_14]=fill_nan_AMSR(A_14,movmethod,window,maxlen,order,N,Fs);
% Calculate observational SSM_n
mean_9_80_80_ybar1=[ybar1_1,ybar1_2,ybar1_3,ybar1_4,ybar1_5,ybar1_6,ybar1_7,ybar1_8,ybar1_9,ybar1_10,ybar1_11,ybar1_12,ybar1_13,ybar1_14];
mean_9_80_80_ybar2=[ybar2_1,ybar2_2,ybar2_3,ybar2_4,ybar2_5,ybar2_6,ybar2_7,ybar2_8,ybar2_9,ybar2_10,ybar2_11,ybar2_12,ybar2_13,ybar2_14];
mean_9_80_80_ybar3=[ybar3_1,ybar3_2,ybar3_3,ybar3_4,ybar3_5,ybar3_6,ybar3_7,ybar3_8,ybar3_9,ybar3_10,ybar3_11,ybar3_12,ybar3_13,ybar3_14];
[mean_9_80_80_SMF1,mean_9_80_80_SMF2,mean_9_80_80_SMF3]=SM_F_AMSR(mean_9_80_80_ybar1,mean_9_80_80_ybar2,mean_9_80_80_ybar3);
% Change SSM_n has same surface coverage as SMAP
mean_9_80_80_SMF1_knn=knn_mean(SMF_template,mean_9_80_80_SMF1,1);
mean_9_80_80_SMF2_knn=knn_mean(SMF_template,mean_9_80_80_SMF2,1);
mean_9_80_80_SMF3_knn=knn_mean(SMF_template,mean_9_80_80_SMF3,1);
[mean_9_80_80_SMF1_n,mean_9_80_80_SMF2_n,mean_9_80_80_SMF3_n]=SM_F_meanS(mean_9_80_80_SMF1_knn,mean_9_80_80_SMF2_knn,mean_9_80_80_SMF3_knn,SMAP_mean_SM);
nanmean(mean_9_80_80_SMF1_n(:))
nanmean(mean_9_80_80_SMF2_n(:))
nanmean(mean_9_80_80_SMF3_n(:))

function [SMF1,SMF2,SMF3]=SM_F_AMSR(ybar1,ybar2,ybar3)

YBAR1=reshape(ybar1,[964,406]);
Fybar1=YBAR1.';
YBAR2=reshape(ybar2,[964,406]);
Fybar2=YBAR2.';
YBAR3=reshape(ybar3,[964,406]);
Fybar3=YBAR3.';
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

function SMAP_data=AMSR_fill(AMSR_data,SMAP_data)

logic_temp_AMSR=single(~isnan(AMSR_data));
logic_temp_SMAP=single(~isnan(SMAP_data));
diff_temp=logic_temp_AMSR-logic_temp_SMAP;
SMAP_data(diff_temp==1)=AMSR_data(diff_temp==1);

end

function [ybar1,ybar2,ybar3]=fill_nan_AMSR(ori_data,movmethod,window,maxlen,order,N,Fs)

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
clear filled_data
filled_Ayy=abs(Y).^2;
clear Y
filled_Ayy=filled_Ayy(1:1501,:);
Ayy=filled_Ayy/(N/2);
F=((1:N)-1)*Fs/N;
a=find(abs(F-1/7)<=0.0002);
b=find(abs(F-1/30)<=0.0002);
c=find(abs(F-1/90)<=0.0002);
d=find(abs(F-1/365)<=0.0002);
ybar1=nansum(Ayy(b:a,:));
ybar2=nansum(Ayy(c:b,:));
ybar3=nansum(Ayy(d:c,:));

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