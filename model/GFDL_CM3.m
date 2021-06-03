% % SSM_n of GFDL_CM3 (mrsos)
% Get SSM_n over different time scales
N=53290;
Fs=1;
GFDL_CM3_mrsosA(53290,12960)=0;
count=1;
for q=1:90
    for p=1:144
        C=mrsosData(p,q,:);
        GFDL_CM3_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
GFDL_CM3_mrsosA(GFDL_CM3_mrsosA==0)=nan;
GFDL_CM3_mrsosA=single(GFDL_CM3_mrsosA);
[row,col] = size(GFDL_CM3_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(GFDL_CM3_mrsosA(:,i));
end
dA=single(dA);
A1=dA(:,1:3240);
Y1=fft(A1);
Y1=Y1(1:26645,:);
Ayy1=abs(Y1).^2;
A2=dA(:,3241:6480);
Y2=fft(A2);
Y2=Y2(1:26645,:);
Ayy2=abs(Y2).^2;
A3=dA(:,6481:9720);
Y3=fft(A3);
Y3=Y3(1:26645,:);
Ayy3=abs(Y3).^2;
A4=dA(:,9721:12960);
Y4=fft(A4);
Y4=Y4(1:26645,:);
Ayy4=abs(Y4).^2;
GFDL_CM3_mrsosAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
GFDL_CM3_mrsosAyy=GFDL_CM3_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
GFDL_CM3_ybar1=sum(GFDL_CM3_mrsosAyy(b:a,:));
YBAR1=reshape(GFDL_CM3_ybar1,[144,90]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
GFDL_CM3_ybar2=sum(GFDL_CM3_mrsosAyy(c:b,:));
YBAR2=reshape(GFDL_CM3_ybar2,[144,90]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
GFDL_CM3_ybar3=sum(GFDL_CM3_mrsosAyy(d:c,:));
YBAR3=reshape(GFDL_CM3_ybar3,[144,90]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
GFDL_CM3_mrsosf1=GFDL_CM3_ybar1./(GFDL_CM3_ybar1+GFDL_CM3_ybar2+GFDL_CM3_ybar3);
GFDL_CM3_mrsosf2=GFDL_CM3_ybar2./(GFDL_CM3_ybar1+GFDL_CM3_ybar2+GFDL_CM3_ybar3);
GFDL_CM3_mrsosf3=GFDL_CM3_ybar3./(GFDL_CM3_ybar1+GFDL_CM3_ybar2+GFDL_CM3_ybar3);
% Model's SSM_n with the original spatial resolution
GFDL_CM3_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
GFDL_CM3_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
GFDL_CM3_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
GFDL_CM3_new_mrsosf1=SMAP_resolution(SMAP1,GFDL_CM3_mrsosf1,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_mrsosf2=SMAP_resolution(SMAP2,GFDL_CM3_mrsosf2,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_mrsosf3=SMAP_resolution(SMAP3,GFDL_CM3_mrsosf3,GFDL_CM3_latData,GFDL_CM3_lonData);
% Change model's SSM_n has same surface coverage as SMAP
GFDL_CM3_new_mF1=knn_mean(SMF_template,GFDL_CM3_new_mrsosf1,1);
GFDL_CM3_new_mF2=knn_mean(SMF_template,GFDL_CM3_new_mrsosf2,1);
GFDL_CM3_new_mF3=knn_mean(SMF_template,GFDL_CM3_new_mrsosf3,1);

% % ET_n of GFDL_CM3 (hfls)
% Get ET_n over different time scales
N=53290;
Fs=1;
GFDL_CM3_hflsA(53290,12960)=0;
count=1;
for q=1:90
    for p=1:144
        C=hflsData(p,q,:);
        GFDL_CM3_hflsA(:,count)=C(:);
        count=count+1;
    end
end
GFDL_CM3_hflsA=single(GFDL_CM3_hflsA);
[row,col] = size(GFDL_CM3_hflsA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(GFDL_CM3_hflsA(:,i));
end
dA=single(dA);
A1=dA(:,1:3240);
Y1=fft(A1);
Y1=Y1(1:26645,:);
Ayy1=abs(Y1).^2;
A2=dA(:,3241:6480);
Y2=fft(A2);
Y2=Y2(1:26645,:);
Ayy2=abs(Y2).^2;
A3=dA(:,6481:9720);
Y3=fft(A3);
Y3=Y3(1:26645,:);
Ayy3=abs(Y3).^2;
A4=dA(:,9721:12960);
Y4=fft(A4);
Y4=Y4(1:26645,:);
Ayy4=abs(Y4).^2;
GFDL_CM3_hflsAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
GFDL_CM3_hflsAyy=GFDL_CM3_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
GFDL_CM3_ybar1=sum(GFDL_CM3_hflsAyy(b:a,:));
YBAR1=reshape(GFDL_CM3_ybar1,[144,90]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
GFDL_CM3_ybar2=sum(GFDL_CM3_hflsAyy(c:b,:));
YBAR2=reshape(GFDL_CM3_ybar2,[144,90]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
GFDL_CM3_ybar3=sum(GFDL_CM3_hflsAyy(d:c,:));
YBAR3=reshape(GFDL_CM3_ybar3,[144,90]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
GFDL_CM3_hflsf1=GFDL_CM3_ybar1./(GFDL_CM3_ybar1+GFDL_CM3_ybar2+GFDL_CM3_ybar3);
GFDL_CM3_hflsf2=GFDL_CM3_ybar2./(GFDL_CM3_ybar1+GFDL_CM3_ybar2+GFDL_CM3_ybar3);
GFDL_CM3_hflsf3=GFDL_CM3_ybar3./(GFDL_CM3_ybar1+GFDL_CM3_ybar2+GFDL_CM3_ybar3);
% Model's ET_n with the original spatial resolution
GFDL_CM3_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
GFDL_CM3_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
GFDL_CM3_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
GFDL_CM3_new_hflsf1=SMAP_resolution(SMAP1,GFDL_CM3_hflsf1,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_hflsf2=SMAP_resolution(SMAP2,GFDL_CM3_hflsf2,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_hflsf3=SMAP_resolution(SMAP3,GFDL_CM3_hflsf3,GFDL_CM3_latData,GFDL_CM3_lonData);
% Change model's ET_n has same surface coverage as SMAP
GFDL_CM3_new_hF1=knn_mean(SMF_template,GFDL_CM3_new_hflsf1,1);
GFDL_CM3_new_hF2=knn_mean(SMF_template,GFDL_CM3_new_hflsf2,1);
GFDL_CM3_new_hF3=knn_mean(SMF_template,GFDL_CM3_new_hflsf3,1);

% % P_n of GFDL_CM3 (pr)
% Get P_n over different time scales
N=53290;
Fs=1;
GFDL_CM3_prA(53290,12960)=0;
count=1;
for q=1:90
    for p=1:144
        C=prData(p,q,:);
        GFDL_CM3_prA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
GFDL_CM3_prA=single(GFDL_CM3_prA);
[row,col] = size(GFDL_CM3_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(GFDL_CM3_prA(:,i));
end
dA=single(dA);
A1=dA(:,1:3240);
Y1=fft(A1);
Y1=Y1(1:26645,:);
Ayy1=abs(Y1).^2;
A2=dA(:,3241:6480);
Y2=fft(A2);
Y2=Y2(1:26645,:);
Ayy2=abs(Y2).^2;
A3=dA(:,6481:9720);
Y3=fft(A3);
Y3=Y3(1:26645,:);
Ayy3=abs(Y3).^2;
A4=dA(:,9721:12960);
Y4=fft(A4);
Y4=Y4(1:26645,:);
Ayy4=abs(Y4).^2;
GFDL_CM3_prAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
GFDL_CM3_prAyy=GFDL_CM3_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
GFDL_CM3_ybar1=sum(GFDL_CM3_prAyy(b:a,:));
YBAR1=reshape(GFDL_CM3_ybar1,[144,90]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
GFDL_CM3_ybar2=sum(GFDL_CM3_prAyy(c:b,:));
YBAR2=reshape(GFDL_CM3_ybar2,[144,90]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
GFDL_CM3_ybar3=sum(GFDL_CM3_prAyy(d:c,:));
YBAR3=reshape(GFDL_CM3_ybar3,[144,90]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
GFDL_CM3_prf1=GFDL_CM3_ybar1./(GFDL_CM3_ybar1+GFDL_CM3_ybar2+GFDL_CM3_ybar3);
GFDL_CM3_prf2=GFDL_CM3_ybar2./(GFDL_CM3_ybar1+GFDL_CM3_ybar2+GFDL_CM3_ybar3);
GFDL_CM3_prf3=GFDL_CM3_ybar3./(GFDL_CM3_ybar1+GFDL_CM3_ybar2+GFDL_CM3_ybar3);
% Model's Pr_n with the original spatial resolution
GFDL_CM3_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
GFDL_CM3_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
GFDL_CM3_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
GFDL_CM3_new_prf1=SMAP_resolution(SMAP1,GFDL_CM3_prf1,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_prf2=SMAP_resolution(SMAP2,GFDL_CM3_prf2,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_prf3=SMAP_resolution(SMAP3,GFDL_CM3_prf3,GFDL_CM3_latData,GFDL_CM3_lonData);
% Change model's ET_n has same surface coverage as SMAP
GFDL_CM3_new_pF1=knn_mean(SMF_template,GFDL_CM3_new_prf1,1);
GFDL_CM3_new_pF2=knn_mean(SMF_template,GFDL_CM3_new_prf2,1);
GFDL_CM3_new_pF3=knn_mean(SMF_template,GFDL_CM3_new_prf3,1);

% % % Spectral slope of GFDL_CM3 (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=53290;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
% % SSM_kw of GFDL_CM3 (mrsos)
% Get SSM_kw over different time scales
[GFDL_CM3_mrsosp1,GFDL_CM3_mrsosP1]=spectral_slope(GFDL_CM3_mrsosA,GFDL_CM3_latData,GFDL_CM3_lonData,b,a,N,Fs);
[GFDL_CM3_mrsosp2,GFDL_CM3_mrsosP2]=spectral_slope(GFDL_CM3_mrsosA,GFDL_CM3_latData,GFDL_CM3_lonData,c,b,N,Fs);
[GFDL_CM3_mrsosp3,GFDL_CM3_mrsosP3]=spectral_slope(GFDL_CM3_mrsosA,GFDL_CM3_latData,GFDL_CM3_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
GFDL_CM3_new_mrsosp1=SMAP_resolution(SMAP1,GFDL_CM3_mrsosp1,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_mrsosp2=SMAP_resolution(SMAP2,GFDL_CM3_mrsosp2,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_mrsosp3=SMAP_resolution(SMAP3,GFDL_CM3_mrsosp3,GFDL_CM3_latData,GFDL_CM3_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
GFDL_CM3_new_mP1=knn_mean(SMF_template,GFDL_CM3_new_mrsosp1,1);
GFDL_CM3_new_mP2=knn_mean(SMF_template,GFDL_CM3_new_mrsosp2,1);
GFDL_CM3_new_mP3=knn_mean(SMF_template,GFDL_CM3_new_mrsosp3,1);
% % ET_kw of GFDL_CM3 (hfls)
% Get ET_kw over different time scales
[GFDL_CM3_hflsp1,GFDL_CM3_hflsP1]=spectral_slope(GFDL_CM3_hflsA,GFDL_CM3_latData,GFDL_CM3_lonData,b,a,N,Fs);
[GFDL_CM3_hflsp2,GFDL_CM3_hflsP2]=spectral_slope(GFDL_CM3_hflsA,GFDL_CM3_latData,GFDL_CM3_lonData,c,b,N,Fs);
[GFDL_CM3_hflsp3,GFDL_CM3_hflsP3]=spectral_slope(GFDL_CM3_hflsA,GFDL_CM3_latData,GFDL_CM3_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
GFDL_CM3_new_hflsp1=SMAP_resolution(SMAP1,GFDL_CM3_hflsp1,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_hflsp2=SMAP_resolution(SMAP2,GFDL_CM3_hflsp2,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_hflsp3=SMAP_resolution(SMAP3,GFDL_CM3_hflsp3,GFDL_CM3_latData,GFDL_CM3_lonData);
% Change model's ET_kw has same surface coverage as SMAP
GFDL_CM3_new_hP1=knn_mean(SMF_template,GFDL_CM3_new_hflsp1,1);
GFDL_CM3_new_hP2=knn_mean(SMF_template,GFDL_CM3_new_hflsp2,1);
GFDL_CM3_new_hP3=knn_mean(SMF_template,GFDL_CM3_new_hflsp3,1);
% % Pr_kw of GFDL_CM3 (pr)
% GPr Pr_kw over different time scales
[GFDL_CM3_prp1,GFDL_CM3_prP1]=spectral_slope(GFDL_CM3_prA,GFDL_CM3_latData,GFDL_CM3_lonData,b,a,N,Fs);
[GFDL_CM3_prp2,GFDL_CM3_prP2]=spectral_slope(GFDL_CM3_prA,GFDL_CM3_latData,GFDL_CM3_lonData,c,b,N,Fs);
[GFDL_CM3_prp3,GFDL_CM3_prP3]=spectral_slope(GFDL_CM3_prA,GFDL_CM3_latData,GFDL_CM3_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
GFDL_CM3_new_prp1=SMAP_resolution(SMAP1,GFDL_CM3_prp1,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_prp2=SMAP_resolution(SMAP2,GFDL_CM3_prp2,GFDL_CM3_latData,GFDL_CM3_lonData);
GFDL_CM3_new_prp3=SMAP_resolution(SMAP3,GFDL_CM3_prp3,GFDL_CM3_latData,GFDL_CM3_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
GFDL_CM3_new_pP1=knn_mean(SMF_template,GFDL_CM3_new_prp1,1);
GFDL_CM3_new_pP2=knn_mean(SMF_template,GFDL_CM3_new_prp2,1);
GFDL_CM3_new_pP3=knn_mean(SMF_template,GFDL_CM3_new_prp3,1);