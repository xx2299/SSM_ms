% Read GLEAM ET data
cd('E:\Obv_2021\GLEAM\nc_files')
EData_2015=ncread('E_2015_GLEAM_v3.5a.nc','E');
GLEAM_A_2015=read_GLEAM(EData_2015);
GLEAM_A_2015=GLEAM_A_2015(91:365,:);
EData_2016=ncread('E_2016_GLEAM_v3.5a.nc','E');
GLEAM_A_2016=read_GLEAM(EData_2016);
EData_2017=ncread('E_2017_GLEAM_v3.5a.nc','E');
GLEAM_A_2017=read_GLEAM(EData_2017);
EData_2018=ncread('E_2018_GLEAM_v3.5a.nc','E');
GLEAM_A_2018=read_GLEAM(EData_2018);
EData_2019=ncread('E_2019_GLEAM_v3.5a.nc','E');
GLEAM_A_2019=read_GLEAM(EData_2019);
EData_2020=ncread('E_2020_GLEAM_v3.5a.nc','E');
GLEAM_A_2020=read_GLEAM(EData_2020);
% Calculate ET_n of GLEAM 
[A2015_1,A2015_2,A2015_3,A2015_4,A2015_5,A2015_6,A2015_7,A2015_8]=split_EA(GLEAM_A_2015);
[A2016_1,A2016_2,A2016_3,A2016_4,A2016_5,A2016_6,A2016_7,A2016_8]=split_EA(GLEAM_A_2016);
[A2017_1,A2017_2,A2017_3,A2017_4,A2017_5,A2017_6,A2017_7,A2017_8]=split_EA(GLEAM_A_2017);
[A2018_1,A2018_2,A2018_3,A2018_4,A2018_5,A2018_6,A2018_7,A2018_8]=split_EA(GLEAM_A_2018);
[A2019_1,A2019_2,A2019_3,A2019_4,A2019_5,A2019_6,A2019_7,A2019_8]=split_EA(GLEAM_A_2019);
[A2020_1,A2020_2,A2020_3,A2020_4,A2020_5,A2020_6,A2020_7,A2020_8]=split_EA(GLEAM_A_2020);
Ayy1=FFT_EA(A2015_1,A2016_1,A2017_1,A2018_1,A2019_1,A2020_1);
Ayy2=FFT_EA(A2015_2,A2016_2,A2017_2,A2018_2,A2019_2,A2020_2);
Ayy3=FFT_EA(A2015_3,A2016_3,A2017_3,A2018_3,A2019_3,A2020_3);
Ayy4=FFT_EA(A2015_4,A2016_4,A2017_4,A2018_4,A2019_4,A2020_4);
Ayy5=FFT_EA(A2015_5,A2016_5,A2017_5,A2018_5,A2019_5,A2020_5);
Ayy6=FFT_EA(A2015_6,A2016_6,A2017_6,A2018_6,A2019_6,A2020_6);
Ayy7=FFT_EA(A2015_7,A2016_7,A2017_7,A2018_7,A2019_7,A2020_7);
Ayy8=FFT_EA(A2015_8,A2016_8,A2017_8,A2018_8,A2019_8,A2020_8);
GLEAM_Ayy=[Ayy1,Ayy2,Ayy3,Ayy4,Ayy5,Ayy6,Ayy7,Ayy8];
N=2102;
GLEAM_Ayy=GLEAM_Ayy/(N/2);
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.0003);
b=find(abs(x-1/30)<=0.0003);
c=find(abs(x-1/90)<=0.0003);
d=find(abs(x-1/365)<=0.0003);
ybar1=nansum(GLEAM_Ayy(b:a,:));
YBAR1=reshape(ybar1,[1440,720]);
GLEAM_Fybar1=YBAR1.';
ybar2=nansum(GLEAM_Ayy(c:b,:));
YBAR2=reshape(ybar2,[1440,720]);
GLEAM_Fybar2=YBAR2.';
ybar3=nansum(GLEAM_Ayy(d:c,:));
YBAR3=reshape(ybar3,[1440,720]);
GLEAM_Fybar3=YBAR3.';
% GLEAM's ET_n with the original spatial resolution
GLEAM_F1=GLEAM_Fybar1./(GLEAM_Fybar1+GLEAM_Fybar2+GLEAM_Fybar3);
GLEAM_F2=GLEAM_Fybar2./(GLEAM_Fybar1+GLEAM_Fybar2+GLEAM_Fybar3);
GLEAM_F3=GLEAM_Fybar3./(GLEAM_Fybar1+GLEAM_Fybar2+GLEAM_Fybar3);
% Change the spatial resolution of the GLEAM's ET_n to the same as SMAP
GLEAM_f1=ybar1./(ybar1+ybar2+ybar3);
GLEAM_f2=ybar2./(ybar1+ybar2+ybar3);
GLEAM_f3=ybar3./(ybar1+ybar2+ybar3);
GLEAM_new_f1=GLEAM_SMAP_resolution(SMAP1,GLEAM_f1,latGLEAM,lonGLEAM);
GLEAM_new_f2=GLEAM_SMAP_resolution(SMAP2,GLEAM_f2,latGLEAM,lonGLEAM);
GLEAM_new_f3=GLEAM_SMAP_resolution(SMAP3,GLEAM_f3,latGLEAM,lonGLEAM);
% Change model's SSM_n has same surface coverage as SMAP
ETF1_new=knn_mean(SMF_template,GLEAM_new_f1,1);
ETF2_new=knn_mean(SMF_template,GLEAM_new_f2,1);
ETF3_new=knn_mean(SMF_template,GLEAM_new_f3,1);

% Calculate ET_kw of GLEAM 
[A2015_1,A2015_2,A2015_3,A2015_4]=P_split_EA(GLEAM_A_2015);
[A2016_1,A2016_2,A2016_3,A2016_4]=P_split_EA(GLEAM_A_2016);
[A2017_1,A2017_2,A2017_3,A2017_4]=P_split_EA(GLEAM_A_2017);
[A2018_1,A2018_2,A2018_3,A2018_4]=P_split_EA(GLEAM_A_2018);
[A2019_1,A2019_2,A2019_3,A2019_4]=P_split_EA(GLEAM_A_2019);
[A2020_1,A2020_2,A2020_3,A2020_4]=P_split_EA(GLEAM_A_2020);
GLEAM_A_1=[A2015_1;A2016_1;A2017_1;A2018_1;A2019_1;A2020_1];
GLEAM_A_2=[A2015_2;A2016_2;A2017_2;A2018_2;A2019_2;A2020_2];
GLEAM_A_3=[A2015_3;A2016_3;A2017_3;A2018_3;A2019_3;A2020_3];
GLEAM_A_4=[A2015_4;A2016_4;A2017_4;A2018_4;A2019_4;A2020_4];
N=2102;
Fs=1;
[ETp1_1,ETp2_1,ETp3_1]=GLEAM_P(GLEAM_A_1,N,Fs);
[ETp1_2,ETp2_2,ETp3_2]=GLEAM_P(GLEAM_A_2,N,Fs);
[ETp1_3,ETp2_3,ETp3_3]=GLEAM_P(GLEAM_A_3,N,Fs);
[ETp1_4,ETp2_4,ETp3_4]=GLEAM_P(GLEAM_A_4,N,Fs);
ETp1=[ETp1_1,ETp1_2,ETp1_3,ETp1_4];
ETp2=[ETp2_1,ETp2_2,ETp2_3,ETp2_4];
ETp3=[ETp3_1,ETp3_2,ETp3_3,ETp3_4];
ETP1=GLEAM_P_cont(ETp1);
ETP2=GLEAM_P_cont(ETp2);
ETP3=GLEAM_P_cont(ETp3);
% Change the spatial resolution of the GLEAM's ET_n to the same as SMAP
GLEAM_new_p1=GLEAM_SMAP_resolution(SMAP1,ETp1,latGLEAM,lonGLEAM);
GLEAM_new_p2=GLEAM_SMAP_resolution(SMAP2,ETp2,latGLEAM,lonGLEAM);
GLEAM_new_p3=GLEAM_SMAP_resolution(SMAP3,ETp3,latGLEAM,lonGLEAM);
% Change model's SSM_n has same surface coverage as SMAP
ETP1_new=knn_mean(SMF_template,GLEAM_new_p1,1);
ETP2_new=knn_mean(SMF_template,GLEAM_new_p2,1);
ETP3_new=knn_mean(SMF_template,GLEAM_new_p3,1);

% % Functions
function A=read_GLEAM(Data)
[~,~,t]=size(Data);
A(t,1036800)=0;
count=1;
for q=1:720
    for p=1:1440
        C=Data(q,p,:);
        A(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
A=single(A);
end

function [A1,A2,A3,A4]=P_split_EA(A)
temp_num=1036800/4;
A1=A(:,1:temp_num);
A2=A(:,(temp_num+1):(temp_num*2));
A3=A(:,(temp_num*2+1):(temp_num*3));
A4=A(:,(temp_num*3+1):(temp_num*4));
end

function Ayy=FFT_EA(A1,A2,A3,A4,A5,A6)
A=[A1;A2;A3;A4;A5;A6];
Y=fft(A);
Y=Y(1:1051,:);
Ayy=abs(Y).^2;
end

function [ETp1,ETp2,ETp3]=GLEAM_P(GLEAM_A,N,Fs)
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.0002);
b=find(abs(x-1/30)<=0.0002);
c=find(abs(x-1/90)<=0.0002);
d=find(abs(x-1/365)<=0.0002);
[~,n]=size(GLEAM_A);
ETp1(1,n)=0;
ETp2(1,n)=0;
ETp3(1,n)=0;
count=1;
for i=1:n
    temp=isnan(GLEAM_A(:,i));
    if sum(temp)>=2101
        ETp1(1,count)=nan;
        ETp2(1,count)=nan;
        ETp3(1,count)=nan;
    else
        A=GLEAM_A(:,i);
        var=sum((A-mean(A)).^2)/length(A);
        Y=fft(A);
        Y=Y(1:(N/2),:);
        Ayy=abs(Y).^2;
        Ayy=Ayy/(N/2)/var;
        X=[ones(length(Ayy),1),x'];
        p1=polyfit(log(X(b:a,2)),log(Ayy(b:a)),1);
        ETp1(1,count)=p1(1);
        p2=polyfit(log(X(c:b,2)),log(Ayy(c:b)),1);
        ETp2(1,count)=p2(1);
        p3=polyfit(log(X(d:c,2)),log(Ayy(d:c)),1);
        ETp3(1,count)=p3(1);
    end
    disp(i);
    count=count+1;
end
end

function ETP=GLEAM_P_cont(ETp)
ETp=single(ETp);
ETpp=reshape(ETp,[1440,720]);
P=imrotate(ETpp,-90);
ETP=fliplr(P);
end

function [GLEAM_F]=GLEAM_SMAP_resolution(SMAP_f,GLEAM_f,latData,lonData)
count=1;
for i=1:720
    GLEAM_lat(count:count+1439,1)=latData(i,1);
    GLEAM_lon(count:count+1439,1)=lonData;
    count=count+1440;
end
GLEAM_lat=single(GLEAM_lat);
GLEAM_lon=single(GLEAM_lon);
GLEAM_f_t=GLEAM_f.';
GLEAM=[GLEAM_lat,GLEAM_lon,GLEAM_f_t];
[m1,~]=size(GLEAM);
[m2,~]=size(SMAP_f);
dif(m1,1)=0;
GLEAM_new_f(m2,1)=0;
for j=1:m2
    count=1;
    for i=1:m1
        dif(count,1)=abs(GLEAM(i,1)-SMAP_f(j,1))+abs(GLEAM(i,2)-SMAP_f(j,2));
        count=count+1;
    end
    [~,idx]=min(dif);
    GLEAM_new_f(j,1)=GLEAM(idx,3);
    disp(j)
end
new_f=reshape(GLEAM_new_f,[964,406]);
GLEAM_F=new_f.';
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