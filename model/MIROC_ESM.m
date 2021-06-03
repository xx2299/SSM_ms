% % SSM_n of MIROC_ESM (mrsos)
% Get SSM_n over different time scales
N=20454;
Fs=1;
MIROC_ESM_mrsosA(20454,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=mrsosData(p,q,:);
        MIROC_ESM_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
MIROC_ESM_mrsosA=single(MIROC_ESM_mrsosA);
[row,col] = size(MIROC_ESM_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(MIROC_ESM_mrsosA(:,i));
end
dA=single(dA);
Y=fft(dA);
MIROC_ESM_mrsosAyy=abs(Y).^2;
MIROC_ESM_mrsosAyy=MIROC_ESM_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
MIROC_ESM_ybar1=sum(MIROC_ESM_mrsosAyy(b:a,:));
YBAR1=reshape(MIROC_ESM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
MIROC_ESM_ybar2=sum(MIROC_ESM_mrsosAyy(c:b,:));
YBAR2=reshape(MIROC_ESM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
MIROC_ESM_ybar3=sum(MIROC_ESM_mrsosAyy(d:c,:));
YBAR3=reshape(MIROC_ESM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
MIROC_ESM_mrsosf1=MIROC_ESM_ybar1./(MIROC_ESM_ybar1+MIROC_ESM_ybar2+MIROC_ESM_ybar3);
MIROC_ESM_mrsosf2=MIROC_ESM_ybar2./(MIROC_ESM_ybar1+MIROC_ESM_ybar2+MIROC_ESM_ybar3);
MIROC_ESM_mrsosf3=MIROC_ESM_ybar3./(MIROC_ESM_ybar1+MIROC_ESM_ybar2+MIROC_ESM_ybar3);
% Model's SSM_n with the original spatial resolution
MIROC_ESM_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
MIROC_ESM_new_mrsosf1=SMAP_resolution(SMAP1,MIROC_ESM_mrsosf1,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_mrsosf2=SMAP_resolution(SMAP2,MIROC_ESM_mrsosf2,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_mrsosf3=SMAP_resolution(SMAP3,MIROC_ESM_mrsosf3,MIROC_ESM_latData,MIROC_ESM_lonData);
% Change model's SSM_n has same surface coverage as SMAP
MIROC_ESM_new_mF1=knn_mean(SMF_template,MIROC_ESM_new_mrsosf1,1);
MIROC_ESM_new_mF2=knn_mean(SMF_template,MIROC_ESM_new_mrsosf2,1);
MIROC_ESM_new_mF3=knn_mean(SMF_template,MIROC_ESM_new_mrsosf3,1);

% % ET_n of MIROC_ESM (hfls)
% Get ET_n over different time scales
N=20454;
Fs=1;
MIROC_ESM_hflsfA(20454,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=hflsData(p,q,:);
        MIROC_ESM_hflsfA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
MIROC_ESM_hflsfA=single(MIROC_ESM_hflsfA);
[row,col] = size(MIROC_ESM_hflsfA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(MIROC_ESM_hflsfA(:,i));
end
dA=single(dA);
Y=fft(dA);
MIROC_ESM_hflsAyy=abs(Y).^2;
MIROC_ESM_hflsAyy=MIROC_ESM_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
MIROC_ESM_ybar1=sum(MIROC_ESM_hflsAyy(b:a,:));
YBAR1=reshape(MIROC_ESM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
MIROC_ESM_ybar2=sum(MIROC_ESM_hflsAyy(c:b,:));
YBAR2=reshape(MIROC_ESM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
MIROC_ESM_ybar3=sum(MIROC_ESM_hflsAyy(d:c,:));
YBAR3=reshape(MIROC_ESM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
MIROC_ESM_hflsf1=MIROC_ESM_ybar1./(MIROC_ESM_ybar1+MIROC_ESM_ybar2+MIROC_ESM_ybar3);
MIROC_ESM_hflsf2=MIROC_ESM_ybar2./(MIROC_ESM_ybar1+MIROC_ESM_ybar2+MIROC_ESM_ybar3);
MIROC_ESM_hflsf3=MIROC_ESM_ybar3./(MIROC_ESM_ybar1+MIROC_ESM_ybar2+MIROC_ESM_ybar3);
% Model's ET_n with the original spatial resolution
MIROC_ESM_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
MIROC_ESM_new_hflsf1=SMAP_resolution(SMAP1,MIROC_ESM_hflsf1,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_hflsf2=SMAP_resolution(SMAP2,MIROC_ESM_hflsf2,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_hflsf3=SMAP_resolution(SMAP3,MIROC_ESM_hflsf3,MIROC_ESM_latData,MIROC_ESM_lonData);
% Change model's ET_n has same surface coverage as SMAP
MIROC_ESM_new_hF1=knn_mean(SMF_template,MIROC_ESM_new_hflsf1,1);
MIROC_ESM_new_hF2=knn_mean(SMF_template,MIROC_ESM_new_hflsf2,1);
MIROC_ESM_new_hF3=knn_mean(SMF_template,MIROC_ESM_new_hflsf3,1);

% % P_n of MIROC_ESM (pr)
% Get P_n over different time scales
N=56978;
Fs=1;
MIROC_ESM_prA(56978,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=prData(p,q,:);
        MIROC_ESM_prA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
MIROC_ESM_prA=single(MIROC_ESM_prA);
[row,col] = size(MIROC_ESM_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(MIROC_ESM_prA(:,i));
end
dA=single(dA);
Y=fft(dA);
MIROC_ESM_prAyy=abs(Y).^2;
MIROC_ESM_prAyy=MIROC_ESM_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
MIROC_ESM_ybar1=sum(MIROC_ESM_prAyy(b:a,:));
YBAR1=reshape(MIROC_ESM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
MIROC_ESM_ybar2=sum(MIROC_ESM_prAyy(c:b,:));
YBAR2=reshape(MIROC_ESM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
MIROC_ESM_ybar3=sum(MIROC_ESM_prAyy(d:c,:));
YBAR3=reshape(MIROC_ESM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
MIROC_ESM_prf1=MIROC_ESM_ybar1./(MIROC_ESM_ybar1+MIROC_ESM_ybar2+MIROC_ESM_ybar3);
MIROC_ESM_prf2=MIROC_ESM_ybar2./(MIROC_ESM_ybar1+MIROC_ESM_ybar2+MIROC_ESM_ybar3);
MIROC_ESM_prf3=MIROC_ESM_ybar3./(MIROC_ESM_ybar1+MIROC_ESM_ybar2+MIROC_ESM_ybar3);
% Model's Pr_n with the original spatial resolution
MIROC_ESM_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
MIROC_ESM_new_prf1=SMAP_resolution(SMAP1,MIROC_ESM_prf1,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_prf2=SMAP_resolution(SMAP2,MIROC_ESM_prf2,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_prf3=SMAP_resolution(SMAP3,MIROC_ESM_prf3,MIROC_ESM_latData,MIROC_ESM_lonData);
% Change model's ET_n has same surface coverage as SMAP
MIROC_ESM_new_pF1=knn_mean(SMF_template,MIROC_ESM_new_prf1,1);
MIROC_ESM_new_pF2=knn_mean(SMF_template,MIROC_ESM_new_prf2,1);
MIROC_ESM_new_pF3=knn_mean(SMF_template,MIROC_ESM_new_prf3,1);

% % % Spectral slope of MIROC_ESM (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=20454;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
% % SSM_kw of MIROC_ESM (mrsos)
% Get SSM_kw over different time scales
[MIROC_ESM_mrsosp1,MIROC_ESM_mrsosP1]=spectral_slope(MIROC_ESM_mrsosA,MIROC_ESM_latData,MIROC_ESM_lonData,b,a,N,Fs);
[MIROC_ESM_mrsosp2,MIROC_ESM_mrsosP2]=spectral_slope(MIROC_ESM_mrsosA,MIROC_ESM_latData,MIROC_ESM_lonData,c,b,N,Fs);
[MIROC_ESM_mrsosp3,MIROC_ESM_mrsosP3]=spectral_slope(MIROC_ESM_mrsosA,MIROC_ESM_latData,MIROC_ESM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
MIROC_ESM_new_mrsosp1=SMAP_resolution(SMAP1,MIROC_ESM_mrsosp1,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_mrsosp2=SMAP_resolution(SMAP2,MIROC_ESM_mrsosp2,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_mrsosp3=SMAP_resolution(SMAP3,MIROC_ESM_mrsosp3,MIROC_ESM_latData,MIROC_ESM_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
MIROC_ESM_new_mP1=knn_mean(SMF_template,MIROC_ESM_new_mrsosp1,1);
MIROC_ESM_new_mP2=knn_mean(SMF_template,MIROC_ESM_new_mrsosp2,1);
MIROC_ESM_new_mP3=knn_mean(SMF_template,MIROC_ESM_new_mrsosp3,1);
% % ET_kw of MIROC_ESM (hfls)
% Get ET_kw over different time scales
[MIROC_ESM_hflsp1,MIROC_ESM_hflsP1]=spectral_slope(MIROC_ESM_hflsA,MIROC_ESM_latData,MIROC_ESM_lonData,b,a,N,Fs);
[MIROC_ESM_hflsp2,MIROC_ESM_hflsP2]=spectral_slope(MIROC_ESM_hflsA,MIROC_ESM_latData,MIROC_ESM_lonData,c,b,N,Fs);
[MIROC_ESM_hflsp3,MIROC_ESM_hflsP3]=spectral_slope(MIROC_ESM_hflsA,MIROC_ESM_latData,MIROC_ESM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
MIROC_ESM_new_hflsp1=SMAP_resolution(SMAP1,MIROC_ESM_hflsp1,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_hflsp2=SMAP_resolution(SMAP2,MIROC_ESM_hflsp2,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_hflsp3=SMAP_resolution(SMAP3,MIROC_ESM_hflsp3,MIROC_ESM_latData,MIROC_ESM_lonData);
% Change model's ET_kw has same surface coverage as SMAP
MIROC_ESM_new_hP1=knn_mean(SMF_template,MIROC_ESM_new_hflsp1,1);
MIROC_ESM_new_hP2=knn_mean(SMF_template,MIROC_ESM_new_hflsp2,1);
MIROC_ESM_new_hP3=knn_mean(SMF_template,MIROC_ESM_new_hflsp3,1);
% % Pr_kw of MIROC_ESM (pr)
% get the cutoff frequencies
N=56978;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
% GPr Pr_kw over different time scales
[MIROC_ESM_prp1,MIROC_ESM_prP1]=spectral_slope(MIROC_ESM_prA,MIROC_ESM_latData,MIROC_ESM_lonData,b,a,N,Fs);
[MIROC_ESM_prp2,MIROC_ESM_prP2]=spectral_slope(MIROC_ESM_prA,MIROC_ESM_latData,MIROC_ESM_lonData,c,b,N,Fs);
[MIROC_ESM_prp3,MIROC_ESM_prP3]=spectral_slope(MIROC_ESM_prA,MIROC_ESM_latData,MIROC_ESM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
MIROC_ESM_new_prp1=SMAP_resolution(SMAP1,MIROC_ESM_prp1,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_prp2=SMAP_resolution(SMAP2,MIROC_ESM_prp2,MIROC_ESM_latData,MIROC_ESM_lonData);
MIROC_ESM_new_prp3=SMAP_resolution(SMAP3,MIROC_ESM_prp3,MIROC_ESM_latData,MIROC_ESM_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
MIROC_ESM_new_pP1=knn_mean(SMF_template,MIROC_ESM_new_prp1,1);
MIROC_ESM_new_pP2=knn_mean(SMF_template,MIROC_ESM_new_prp2,1);
MIROC_ESM_new_pP3=knn_mean(SMF_template,MIROC_ESM_new_prp3,1);