% % SSM_n of HadGEM2_ES (mrsos)
% Get SSM_n over different time scales
N=20160;
Fs=1;
HadGEM2_ES_mrsosA(20160,27840)=0;
count=1;
for q=1:145
    for p=1:192
        C=mrsosData(p,q,:);
        HadGEM2_ES_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
HadGEM2_ES_mrsosA=single(HadGEM2_ES_mrsosA);
[row,col] = size(HadGEM2_ES_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(HadGEM2_ES_mrsosA(:,i));
end
dA=single(dA);
A1=dA(:,1:6960);
Y1=fft(A1);
Y1=Y1(1:10080,:);
A2=dA(:,6961:13920);
Y2=fft(A2);
Y2=Y2(1:10080,:);
A3=dA(:,13921:20880);
Y3=fft(A3);
Y3=Y3(1:10080,:);
A4=dA(:,20881:27840);
Y4=fft(A4);
Y4=Y4(1:10080,:);
Y=[Y1,Y2,Y3,Y4];
HadGEM2_ES_mrsosAyy=abs(Y).^2;
HadGEM2_ES_mrsosAyy=HadGEM2_ES_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00002);
HadGEM2_ES_ybar1=sum(HadGEM2_ES_mrsosAyy(b:a,:));
YBAR1=reshape(HadGEM2_ES_ybar1,[192,145]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
HadGEM2_ES_ybar2=sum(HadGEM2_ES_mrsosAyy(c:b,:));
YBAR2=reshape(HadGEM2_ES_ybar2,[192,145]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
HadGEM2_ES_ybar3=sum(HadGEM2_ES_mrsosAyy(d:c,:));
YBAR3=reshape(HadGEM2_ES_ybar3,[192,145]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
HadGEM2_ES_mrsosf1=HadGEM2_ES_ybar1./(HadGEM2_ES_ybar1+HadGEM2_ES_ybar2+HadGEM2_ES_ybar3);
HadGEM2_ES_mrsosf2=HadGEM2_ES_ybar2./(HadGEM2_ES_ybar1+HadGEM2_ES_ybar2+HadGEM2_ES_ybar3);
HadGEM2_ES_mrsosf3=HadGEM2_ES_ybar3./(HadGEM2_ES_ybar1+HadGEM2_ES_ybar2+HadGEM2_ES_ybar3);
% Model's SSM_n with the original spatial resolution
HadGEM2_ES_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
HadGEM2_ES_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
HadGEM2_ES_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
HadGEM2_ES_new_mrsosf1=SMAP_resolution(SMAP1,HadGEM2_ES_mrsosf1,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_mrsosf2=SMAP_resolution(SMAP2,HadGEM2_ES_mrsosf2,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_mrsosf3=SMAP_resolution(SMAP3,HadGEM2_ES_mrsosf3,HadGEM2_ES_latData,HadGEM2_ES_lonData);
% Change model's SSM_n has same surface coverage as SMAP
HadGEM2_ES_new_mF1=knn_mean(SMF_template,HadGEM2_ES_new_mrsosf1,1);
HadGEM2_ES_new_mF2=knn_mean(SMF_template,HadGEM2_ES_new_mrsosf2,1);
HadGEM2_ES_new_mF3=knn_mean(SMF_template,HadGEM2_ES_new_mrsosf3,1);

% % ET_n of HadGEM2_ES (hfls)
% Get ET_n over different time scales
N=20160;
Fs=1;
HadGEM2_ES_hflsA(20160,27840)=0;
count=1;
for q=1:145
    for p=1:192
        C=hflsData(p,q,:);
        HadGEM2_ES_hflsA(:,count)=C(:);
        count=count+1;
    end
end
HadGEM2_ES_hflsA=single(HadGEM2_ES_hflsA);
[row,col] = size(HadGEM2_ES_hflsA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(HadGEM2_ES_hflsA(:,i));
end
dA=single(dA);
A1=dA(:,1:6960);
Y1=fft(A1);
Y1=Y1(1:10080,:);
Ayy1=abs(Y1).^2;
A2=dA(:,6961:13920);
Y2=fft(A2);
Y2=Y2(1:10080,:);
Ayy2=abs(Y2).^2;
A3=dA(:,13921:20880);
Y3=fft(A3);
Y3=Y3(1:10080,:);
Ayy3=abs(Y3).^2;
A4=dA(:,20881:27840);
Y4=fft(A4);
Y4=Y4(1:10080,:);
Ayy4=abs(Y4).^2;
HadGEM2_ES_hflsAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
HadGEM2_ES_hflsAyy=HadGEM2_ES_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00002);
HadGEM2_ES_ybar1=sum(HadGEM2_ES_hflsAyy(b:a,:));
YBAR1=reshape(HadGEM2_ES_ybar1,[192,145]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
HadGEM2_ES_ybar2=sum(HadGEM2_ES_hflsAyy(c:b,:));
YBAR2=reshape(HadGEM2_ES_ybar2,[192,145]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
HadGEM2_ES_ybar3=sum(HadGEM2_ES_hflsAyy(d:c,:));
YBAR3=reshape(HadGEM2_ES_ybar3,[192,145]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
HadGEM2_ES_hflsf1=HadGEM2_ES_ybar1./(HadGEM2_ES_ybar1+HadGEM2_ES_ybar2+HadGEM2_ES_ybar3);
HadGEM2_ES_hflsf2=HadGEM2_ES_ybar2./(HadGEM2_ES_ybar1+HadGEM2_ES_ybar2+HadGEM2_ES_ybar3);
HadGEM2_ES_hflsf3=HadGEM2_ES_ybar3./(HadGEM2_ES_ybar1+HadGEM2_ES_ybar2+HadGEM2_ES_ybar3);
% Model's ET_n with the original spatial resolution
HadGEM2_ES_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
HadGEM2_ES_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
HadGEM2_ES_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
HadGEM2_ES_new_hflsf1=SMAP_resolution(SMAP1,HadGEM2_ES_hflsf1,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_hflsf2=SMAP_resolution(SMAP2,HadGEM2_ES_hflsf2,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_hflsf3=SMAP_resolution(SMAP3,HadGEM2_ES_hflsf3,HadGEM2_ES_latData,HadGEM2_ES_lonData);
% Change model's ET_n has same surface coverage as SMAP
HadGEM2_ES_new_hF1=knn_mean(SMF_template,HadGEM2_ES_new_hflsf1,1);
HadGEM2_ES_new_hF2=knn_mean(SMF_template,HadGEM2_ES_new_hflsf2,1);
HadGEM2_ES_new_hF3=knn_mean(SMF_template,HadGEM2_ES_new_hflsf3,1);

% % P_n of HadGEM2_ES (pr)
% Get P_n over different time scales
N=20160;
Fs=1;
HadGEM2_ES_prA(20160,27840)=0;
count=1;
for q=1:145
    for p=1:192
        C=prData(p,q,:);
        HadGEM2_ES_prA(:,count)=C(:);
        count=count+1;
    end
end
HadGEM2_ES_prA=single(HadGEM2_ES_prA);
[row,col] = size(HadGEM2_ES_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(HadGEM2_ES_prA(:,i));
end
dA=single(dA);
A1=dA(:,1:6960);
Y1=fft(A1);
Y1=Y1(1:10080,:);
Ayy1=abs(Y1).^2;
A2=dA(:,6961:13920);
Y2=fft(A2);
Y2=Y2(1:10080,:);
Ayy2=abs(Y2).^2;
A3=dA(:,13921:20880);
Y3=fft(A3);
Y3=Y3(1:10080,:);
Ayy3=abs(Y3).^2;
A4=dA(:,20881:27840);
Y4=fft(A4);
Y4=Y4(1:10080,:);
Ayy4=abs(Y4).^2;
HadGEM2_ES_prAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
HadGEM2_ES_prAyy=HadGEM2_ES_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00002);
HadGEM2_ES_ybar1=sum(HadGEM2_ES_prAyy(b:a,:));
YBAR1=reshape(HadGEM2_ES_ybar1,[192,145]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
HadGEM2_ES_ybar2=sum(HadGEM2_ES_prAyy(c:b,:));
YBAR2=reshape(HadGEM2_ES_ybar2,[192,145]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
HadGEM2_ES_ybar3=sum(HadGEM2_ES_prAyy(d:c,:));
YBAR3=reshape(HadGEM2_ES_ybar3,[192,145]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
HadGEM2_ES_prf1=HadGEM2_ES_ybar1./(HadGEM2_ES_ybar1+HadGEM2_ES_ybar2+HadGEM2_ES_ybar3);
HadGEM2_ES_prf2=HadGEM2_ES_ybar2./(HadGEM2_ES_ybar1+HadGEM2_ES_ybar2+HadGEM2_ES_ybar3);
HadGEM2_ES_prf3=HadGEM2_ES_ybar3./(HadGEM2_ES_ybar1+HadGEM2_ES_ybar2+HadGEM2_ES_ybar3);
% Model's Pr_n with the original spatial resolution
HadGEM2_ES_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
HadGEM2_ES_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
HadGEM2_ES_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
HadGEM2_ES_new_prf1=SMAP_resolution(SMAP1,HadGEM2_ES_prf1,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_prf2=SMAP_resolution(SMAP2,HadGEM2_ES_prf2,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_prf3=SMAP_resolution(SMAP3,HadGEM2_ES_prf3,HadGEM2_ES_latData,HadGEM2_ES_lonData);
% Change model's ET_n has same surface coverage as SMAP
HadGEM2_ES_new_pF1=knn_mean(SMF_template,HadGEM2_ES_new_prf1,1);
HadGEM2_ES_new_pF2=knn_mean(SMF_template,HadGEM2_ES_new_prf2,1);
HadGEM2_ES_new_pF3=knn_mean(SMF_template,HadGEM2_ES_new_prf3,1);

% % % Spectral slope of HadGEM2_ES (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=20160;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00002);
% % SSM_kw of HadGEM2_ES (mrsos)
% Get SSM_kw over different time scales
[HadGEM2_ES_mrsosp1,HadGEM2_ES_mrsosP1]=spectral_slope(HadGEM2_ES_mrsosA,HadGEM2_ES_latData,HadGEM2_ES_lonData,b,a,N,Fs);
[HadGEM2_ES_mrsosp2,HadGEM2_ES_mrsosP2]=spectral_slope(HadGEM2_ES_mrsosA,HadGEM2_ES_latData,HadGEM2_ES_lonData,c,b,N,Fs);
[HadGEM2_ES_mrsosp3,HadGEM2_ES_mrsosP3]=spectral_slope(HadGEM2_ES_mrsosA,HadGEM2_ES_latData,HadGEM2_ES_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
HadGEM2_ES_new_mrsosp1=SMAP_resolution(SMAP1,HadGEM2_ES_mrsosp1,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_mrsosp2=SMAP_resolution(SMAP2,HadGEM2_ES_mrsosp2,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_mrsosp3=SMAP_resolution(SMAP3,HadGEM2_ES_mrsosp3,HadGEM2_ES_latData,HadGEM2_ES_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
HadGEM2_ES_new_mP1=knn_mean(SMF_template,HadGEM2_ES_new_mrsosp1,1);
HadGEM2_ES_new_mP2=knn_mean(SMF_template,HadGEM2_ES_new_mrsosp2,1);
HadGEM2_ES_new_mP3=knn_mean(SMF_template,HadGEM2_ES_new_mrsosp3,1);
% % ET_kw of HadGEM2_ES (hfls)
% Get ET_kw over different time scales
[HadGEM2_ES_hflsp1,HadGEM2_ES_hflsP1]=spectral_slope(HadGEM2_ES_hflsA,HadGEM2_ES_latData,HadGEM2_ES_lonData,b,a,N,Fs);
[HadGEM2_ES_hflsp2,HadGEM2_ES_hflsP2]=spectral_slope(HadGEM2_ES_hflsA,HadGEM2_ES_latData,HadGEM2_ES_lonData,c,b,N,Fs);
[HadGEM2_ES_hflsp3,HadGEM2_ES_hflsP3]=spectral_slope(HadGEM2_ES_hflsA,HadGEM2_ES_latData,HadGEM2_ES_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
HadGEM2_ES_new_hflsp1=SMAP_resolution(SMAP1,HadGEM2_ES_hflsp1,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_hflsp2=SMAP_resolution(SMAP2,HadGEM2_ES_hflsp2,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_hflsp3=SMAP_resolution(SMAP3,HadGEM2_ES_hflsp3,HadGEM2_ES_latData,HadGEM2_ES_lonData);
% Change model's ET_kw has same surface coverage as SMAP
HadGEM2_ES_new_hP1=knn_mean(SMF_template,HadGEM2_ES_new_hflsp1,1);
HadGEM2_ES_new_hP2=knn_mean(SMF_template,HadGEM2_ES_new_hflsp2,1);
HadGEM2_ES_new_hP3=knn_mean(SMF_template,HadGEM2_ES_new_hflsp3,1);
% % Pr_kw of HadGEM2_ES (pr)
% GPr Pr_kw over different time scales
[HadGEM2_ES_prp1,HadGEM2_ES_prP1]=spectral_slope(HadGEM2_ES_prA,HadGEM2_ES_latData,HadGEM2_ES_lonData,b,a,N,Fs);
[HadGEM2_ES_prp2,HadGEM2_ES_prP2]=spectral_slope(HadGEM2_ES_prA,HadGEM2_ES_latData,HadGEM2_ES_lonData,c,b,N,Fs);
[HadGEM2_ES_prp3,HadGEM2_ES_prP3]=spectral_slope(HadGEM2_ES_prA,HadGEM2_ES_latData,HadGEM2_ES_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
HadGEM2_ES_new_prp1=SMAP_resolution(SMAP1,HadGEM2_ES_prp1,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_prp2=SMAP_resolution(SMAP2,HadGEM2_ES_prp2,HadGEM2_ES_latData,HadGEM2_ES_lonData);
HadGEM2_ES_new_prp3=SMAP_resolution(SMAP3,HadGEM2_ES_prp3,HadGEM2_ES_latData,HadGEM2_ES_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
HadGEM2_ES_new_pP1=knn_mean(SMF_template,HadGEM2_ES_new_prp1,1);
HadGEM2_ES_new_pP2=knn_mean(SMF_template,HadGEM2_ES_new_prp2,1);
HadGEM2_ES_new_pP3=knn_mean(SMF_template,HadGEM2_ES_new_prp3,1);