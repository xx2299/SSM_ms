% % SSM_n of GFDL_ESM2M (mrsos)
% Get SSM_n over different time scales
N=52925;
Fs=1;
GFDL_ESM2M_mrsosA(52925,12960)=0;
count=1;
for q=1:90
    for p=1:144
        C=mrsosData(p,q,:);
        GFDL_ESM2M_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
GFDL_ESM2M_mrsosA(GFDL_ESM2M_mrsosA==0)=nan;
GFDL_ESM2M_mrsosA=single(GFDL_ESM2M_mrsosA);
[row,col] = size(GFDL_ESM2M_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(GFDL_ESM2M_mrsosA(:,i));
end
dA=single(dA);
A1=dA(:,1:3240);
Y1=fft(A1);
Y1=Y1(1:26463,:);
Ayy1=abs(Y1).^2;
A2=dA(:,3241:6480);
Y2=fft(A2);
Y2=Y2(1:26463,:);
Ayy2=abs(Y2).^2;
A3=dA(:,6481:9720);
Y3=fft(A3);
Y3=Y3(1:26463,:);
Ayy3=abs(Y3).^2;
A4=dA(:,9721:12960);
Y4=fft(A4);
Y4=Y4(1:26463,:);
Ayy4=abs(Y4).^2;
GFDL_ESM2M_mrsosAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
GFDL_ESM2M_mrsosAyy=GFDL_ESM2M_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:(N+1)/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
GFDL_ESM2M_ybar1=sum(GFDL_ESM2M_mrsosAyy(b:a,:));
YBAR1=reshape(GFDL_ESM2M_ybar1,[144,90]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
GFDL_ESM2M_ybar2=sum(GFDL_ESM2M_mrsosAyy(c:b,:));
YBAR2=reshape(GFDL_ESM2M_ybar2,[144,90]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
GFDL_ESM2M_ybar3=sum(GFDL_ESM2M_mrsosAyy(d:c,:));
YBAR3=reshape(GFDL_ESM2M_ybar3,[144,90]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
GFDL_ESM2M_mrsosf1=GFDL_ESM2M_ybar1./(GFDL_ESM2M_ybar1+GFDL_ESM2M_ybar2+GFDL_ESM2M_ybar3);
GFDL_ESM2M_mrsosf2=GFDL_ESM2M_ybar2./(GFDL_ESM2M_ybar1+GFDL_ESM2M_ybar2+GFDL_ESM2M_ybar3);
GFDL_ESM2M_mrsosf3=GFDL_ESM2M_ybar3./(GFDL_ESM2M_ybar1+GFDL_ESM2M_ybar2+GFDL_ESM2M_ybar3);
% Model's SSM_n with the original spatial resolution
GFDL_ESM2M_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
GFDL_ESM2M_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
GFDL_ESM2M_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
GFDL_ESM2M_new_mrsosf1=SMAP_resolution(SMAP1,GFDL_ESM2M_mrsosf1,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_mrsosf2=SMAP_resolution(SMAP2,GFDL_ESM2M_mrsosf2,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_mrsosf3=SMAP_resolution(SMAP3,GFDL_ESM2M_mrsosf3,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
% Change model's SSM_n has same surface coverage as SMAP
GFDL_ESM2M_new_mF1=knn_mean(SMF_template,GFDL_ESM2M_new_mrsosf1,1);
GFDL_ESM2M_new_mF2=knn_mean(SMF_template,GFDL_ESM2M_new_mrsosf2,1);
GFDL_ESM2M_new_mF3=knn_mean(SMF_template,GFDL_ESM2M_new_mrsosf3,1);

% % ET_n of GFDL_ESM2M (hfls)
% Get ET_n over different time scales
N=52925;
Fs=1;
GFDL_ESM2M_hflsA(52925,12960)=0;
count=1;
for q=1:90
    for p=1:144
        C=hflsData(p,q,:);
        GFDL_ESM2M_hflsA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
GFDL_ESM2M_hflsA=single(GFDL_ESM2M_hflsA);
[row,col] = size(GFDL_ESM2M_hflsA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(GFDL_ESM2M_hflsA(:,i));
end
dA=single(dA);
A1=dA(:,1:3240);
Y1=fft(A1);
Y1=Y1(1:26463,:);
Ayy1=abs(Y1).^2;
A2=dA(:,3241:6480);
Y2=fft(A2);
Y2=Y2(1:26463,:);
Ayy2=abs(Y2).^2;
A3=dA(:,6481:9720);
Y3=fft(A3);
Y3=Y3(1:26463,:);
Ayy3=abs(Y3).^2;
A4=dA(:,9721:12960);
Y4=fft(A4);
Y4=Y4(1:26463,:);
Ayy4=abs(Y4).^2;
GFDL_ESM2M_hflsAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
GFDL_ESM2M_hflsAyy=GFDL_ESM2M_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:(N+1)/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
GFDL_ESM2M_ybar1=sum(GFDL_ESM2M_hflsAyy(b:a,:));
YBAR1=reshape(GFDL_ESM2M_ybar1,[144,90]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
GFDL_ESM2M_ybar2=sum(GFDL_ESM2M_hflsAyy(c:b,:));
YBAR2=reshape(GFDL_ESM2M_ybar2,[144,90]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
GFDL_ESM2M_ybar3=sum(GFDL_ESM2M_hflsAyy(d:c,:));
YBAR3=reshape(GFDL_ESM2M_ybar3,[144,90]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
GFDL_ESM2M_hflsf1=GFDL_ESM2M_ybar1./(GFDL_ESM2M_ybar1+GFDL_ESM2M_ybar2+GFDL_ESM2M_ybar3);
GFDL_ESM2M_hflsf2=GFDL_ESM2M_ybar2./(GFDL_ESM2M_ybar1+GFDL_ESM2M_ybar2+GFDL_ESM2M_ybar3);
GFDL_ESM2M_hflsf3=GFDL_ESM2M_ybar3./(GFDL_ESM2M_ybar1+GFDL_ESM2M_ybar2+GFDL_ESM2M_ybar3);
% Model's ET_n with the original spatial resolution
GFDL_ESM2M_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
GFDL_ESM2M_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
GFDL_ESM2M_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
GFDL_ESM2M_new_hflsf1=SMAP_resolution(SMAP1,GFDL_ESM2M_hflsf1,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_hflsf2=SMAP_resolution(SMAP2,GFDL_ESM2M_hflsf2,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_hflsf3=SMAP_resolution(SMAP3,GFDL_ESM2M_hflsf3,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
% Change model's ET_n has same surface coverage as SMAP
GFDL_ESM2M_new_hF1=knn_mean(SMF_template,GFDL_ESM2M_new_hflsf1,1);
GFDL_ESM2M_new_hF2=knn_mean(SMF_template,GFDL_ESM2M_new_hflsf2,1);
GFDL_ESM2M_new_hF3=knn_mean(SMF_template,GFDL_ESM2M_new_hflsf3,1);

% % P_n of GFDL_ESM2M (pr)
% Get P_n over different time scales
N=52925;
Fs=1;
GFDL_ESM2M_prA(52925,12960)=0;
count=1;
for q=1:90
    for p=1:144
        C=prData(p,q,:);
        GFDL_ESM2M_prA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
GFDL_ESM2M_prA=single(GFDL_ESM2M_prA);
[row,col] = size(GFDL_ESM2M_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(GFDL_ESM2M_prA(:,i));
end
dA=single(dA);
A1=dA(:,1:3240);
Y1=fft(A1);
Y1=Y1(1:26463,:);
Ayy1=abs(Y1).^2;
A2=dA(:,3241:6480);
Y2=fft(A2);
Y2=Y2(1:26463,:);
Ayy2=abs(Y2).^2;
A3=dA(:,6481:9720);
Y3=fft(A3);
Y3=Y3(1:26463,:);
Ayy3=abs(Y3).^2;
A4=dA(:,9721:12960);
Y4=fft(A4);
Y4=Y4(1:26463,:);
Ayy4=abs(Y4).^2;
GFDL_ESM2M_prAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
GFDL_ESM2M_prAyy=GFDL_ESM2M_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:(N+1)/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
GFDL_ESM2M_ybar1=sum(GFDL_ESM2M_prAyy(b:a,:));
YBAR1=reshape(GFDL_ESM2M_ybar1,[144,90]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
GFDL_ESM2M_ybar2=sum(GFDL_ESM2M_prAyy(c:b,:));
YBAR2=reshape(GFDL_ESM2M_ybar2,[144,90]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
GFDL_ESM2M_ybar3=sum(GFDL_ESM2M_prAyy(d:c,:));
YBAR3=reshape(GFDL_ESM2M_ybar3,[144,90]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
GFDL_ESM2M_prf1=GFDL_ESM2M_ybar1./(GFDL_ESM2M_ybar1+GFDL_ESM2M_ybar2+GFDL_ESM2M_ybar3);
GFDL_ESM2M_prf2=GFDL_ESM2M_ybar2./(GFDL_ESM2M_ybar1+GFDL_ESM2M_ybar2+GFDL_ESM2M_ybar3);
GFDL_ESM2M_prf3=GFDL_ESM2M_ybar3./(GFDL_ESM2M_ybar1+GFDL_ESM2M_ybar2+GFDL_ESM2M_ybar3);
% Model's Pr_n with the original spatial resolution
GFDL_ESM2M_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
GFDL_ESM2M_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
GFDL_ESM2M_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
GFDL_ESM2M_new_prf1=SMAP_resolution(SMAP1,GFDL_ESM2M_prf1,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_prf2=SMAP_resolution(SMAP2,GFDL_ESM2M_prf2,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_prf3=SMAP_resolution(SMAP3,GFDL_ESM2M_prf3,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
% Change model's ET_n has same surface coverage as SMAP
GFDL_ESM2M_new_pF1=knn_mean(SMF_template,GFDL_ESM2M_new_prf1,1);
GFDL_ESM2M_new_pF2=knn_mean(SMF_template,GFDL_ESM2M_new_prf2,1);
GFDL_ESM2M_new_pF3=knn_mean(SMF_template,GFDL_ESM2M_new_prf3,1);

% % % Spectral slope of GFDL_ESM2M (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=52925;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
% % SSM_kw of GFDL_ESM2M (mrsos)
% Get SSM_kw over different time scales
[GFDL_ESM2M_mrsosp1,GFDL_ESM2M_mrsosP1]=spectral_slope(GFDL_ESM2M_mrsosA,GFDL_ESM2M_latData,GFDL_ESM2M_lonData,b,a,N,Fs);
[GFDL_ESM2M_mrsosp2,GFDL_ESM2M_mrsosP2]=spectral_slope(GFDL_ESM2M_mrsosA,GFDL_ESM2M_latData,GFDL_ESM2M_lonData,c,b,N,Fs);
[GFDL_ESM2M_mrsosp3,GFDL_ESM2M_mrsosP3]=spectral_slope(GFDL_ESM2M_mrsosA,GFDL_ESM2M_latData,GFDL_ESM2M_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
GFDL_ESM2M_new_mrsosp1=SMAP_resolution(SMAP1,GFDL_ESM2M_mrsosp1,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_mrsosp2=SMAP_resolution(SMAP2,GFDL_ESM2M_mrsosp2,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_mrsosp3=SMAP_resolution(SMAP3,GFDL_ESM2M_mrsosp3,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
GFDL_ESM2M_new_mP1=knn_mean(SMF_template,GFDL_ESM2M_new_mrsosp1,1);
GFDL_ESM2M_new_mP2=knn_mean(SMF_template,GFDL_ESM2M_new_mrsosp2,1);
GFDL_ESM2M_new_mP3=knn_mean(SMF_template,GFDL_ESM2M_new_mrsosp3,1);
% % ET_kw of GFDL_ESM2M (hfls)
% Get ET_kw over different time scales
[GFDL_ESM2M_hflsp1,GFDL_ESM2M_hflsP1]=spectral_slope(GFDL_ESM2M_hflsA,GFDL_ESM2M_latData,GFDL_ESM2M_lonData,b,a,N,Fs);
[GFDL_ESM2M_hflsp2,GFDL_ESM2M_hflsP2]=spectral_slope(GFDL_ESM2M_hflsA,GFDL_ESM2M_latData,GFDL_ESM2M_lonData,c,b,N,Fs);
[GFDL_ESM2M_hflsp3,GFDL_ESM2M_hflsP3]=spectral_slope(GFDL_ESM2M_hflsA,GFDL_ESM2M_latData,GFDL_ESM2M_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
GFDL_ESM2M_new_hflsp1=SMAP_resolution(SMAP1,GFDL_ESM2M_hflsp1,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_hflsp2=SMAP_resolution(SMAP2,GFDL_ESM2M_hflsp2,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_hflsp3=SMAP_resolution(SMAP3,GFDL_ESM2M_hflsp3,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
% Change model's ET_kw has same surface coverage as SMAP
GFDL_ESM2M_new_hP1=knn_mean(SMF_template,GFDL_ESM2M_new_hflsp1,1);
GFDL_ESM2M_new_hP2=knn_mean(SMF_template,GFDL_ESM2M_new_hflsp2,1);
GFDL_ESM2M_new_hP3=knn_mean(SMF_template,GFDL_ESM2M_new_hflsp3,1);
% % Pr_kw of GFDL_ESM2M (pr)
% GPr Pr_kw over different time scales
[GFDL_ESM2M_prp1,GFDL_ESM2M_prP1]=spectral_slope(GFDL_ESM2M_prA,GFDL_ESM2M_latData,GFDL_ESM2M_lonData,b,a,N,Fs);
[GFDL_ESM2M_prp2,GFDL_ESM2M_prP2]=spectral_slope(GFDL_ESM2M_prA,GFDL_ESM2M_latData,GFDL_ESM2M_lonData,c,b,N,Fs);
[GFDL_ESM2M_prp3,GFDL_ESM2M_prP3]=spectral_slope(GFDL_ESM2M_prA,GFDL_ESM2M_latData,GFDL_ESM2M_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
GFDL_ESM2M_new_prp1=SMAP_resolution(SMAP1,GFDL_ESM2M_prp1,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_prp2=SMAP_resolution(SMAP2,GFDL_ESM2M_prp2,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
GFDL_ESM2M_new_prp3=SMAP_resolution(SMAP3,GFDL_ESM2M_prp3,GFDL_ESM2M_latData,GFDL_ESM2M_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
GFDL_ESM2M_new_pP1=knn_mean(SMF_template,GFDL_ESM2M_new_prp1,1);
GFDL_ESM2M_new_pP2=knn_mean(SMF_template,GFDL_ESM2M_new_prp2,1);
GFDL_ESM2M_new_pP3=knn_mean(SMF_template,GFDL_ESM2M_new_prp3,1);