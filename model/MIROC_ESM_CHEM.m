% % SSM_n of MIROC_ESM_CHEM (mrsos)
% Get SSM_n over different time scales
N=20454;
Fs=1;
MIROC_ESM_CHEM_mrsosA(20454,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=mrsosData(p,q,:);
        MIROC_ESM_CHEM_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
MIROC_ESM_CHEM_mrsosA=single(MIROC_ESM_CHEM_mrsosA);
[row,col] = size(MIROC_ESM_CHEM_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(MIROC_ESM_CHEM_mrsosA(:,i));
end
dA=single(dA);
Y=fft(dA);
MIROC_ESM_CHEM_mrsosAyy=abs(Y).^2;
MIROC_ESM_CHEM_mrsosAyy=MIROC_ESM_CHEM_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
MIROC_ESM_CHEM_ybar1=sum(MIROC_ESM_CHEM_mrsosAyy(b:a,:));
YBAR1=reshape(MIROC_ESM_CHEM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
MIROC_ESM_CHEM_ybar2=sum(MIROC_ESM_CHEM_mrsosAyy(c:b,:));
YBAR2=reshape(MIROC_ESM_CHEM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
MIROC_ESM_CHEM_ybar3=sum(MIROC_ESM_CHEM_mrsosAyy(d:c,:));
YBAR3=reshape(MIROC_ESM_CHEM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
MIROC_ESM_CHEM_mrsosf1=MIROC_ESM_CHEM_ybar1./(MIROC_ESM_CHEM_ybar1+MIROC_ESM_CHEM_ybar2+MIROC_ESM_CHEM_ybar3);
MIROC_ESM_CHEM_mrsosf2=MIROC_ESM_CHEM_ybar2./(MIROC_ESM_CHEM_ybar1+MIROC_ESM_CHEM_ybar2+MIROC_ESM_CHEM_ybar3);
MIROC_ESM_CHEM_mrsosf3=MIROC_ESM_CHEM_ybar3./(MIROC_ESM_CHEM_ybar1+MIROC_ESM_CHEM_ybar2+MIROC_ESM_CHEM_ybar3);
% Model's SSM_n with the original spatial resolution
MIROC_ESM_CHEM_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_CHEM_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_CHEM_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
MIROC_ESM_CHEM_new_mrsosf1=SMAP_resolution(SMAP1,MIROC_ESM_CHEM_mrsosf1,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_mrsosf2=SMAP_resolution(SMAP2,MIROC_ESM_CHEM_mrsosf2,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_mrsosf3=SMAP_resolution(SMAP3,MIROC_ESM_CHEM_mrsosf3,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
% Change model's SSM_n has same surface coverage as SMAP
MIROC_ESM_CHEM_new_mF1=knn_mean(SMF_template,MIROC_ESM_CHEM_new_mrsosf1,1);
MIROC_ESM_CHEM_new_mF2=knn_mean(SMF_template,MIROC_ESM_CHEM_new_mrsosf2,1);
MIROC_ESM_CHEM_new_mF3=knn_mean(SMF_template,MIROC_ESM_CHEM_new_mrsosf3,1);

% % ET_n of MIROC_ESM_CHEM (hfls)
% Get ET_n over different time scales
N=20454;
Fs=1;
MIROC_ESM_CHEM_hflsA(20454,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=hflsData(p,q,:);
        MIROC_ESM_CHEM_hflsA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
MIROC_ESM_CHEM_hflsA=single(MIROC_ESM_CHEM_hflsA);
[row,col] = size(MIROC_ESM_CHEM_hflsA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(MIROC_ESM_CHEM_hflsA(:,i));
end
dA=single(dA);
Y=fft(dA);
MIROC_ESM_CHEM_hflsAyy=abs(Y).^2;
MIROC_ESM_CHEM_hflsAyy=MIROC_ESM_CHEM_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
MIROC_ESM_CHEM_ybar1=sum(MIROC_ESM_CHEM_hflsAyy(b:a,:));
YBAR1=reshape(MIROC_ESM_CHEM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
MIROC_ESM_CHEM_ybar2=sum(MIROC_ESM_CHEM_hflsAyy(c:b,:));
YBAR2=reshape(MIROC_ESM_CHEM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
MIROC_ESM_CHEM_ybar3=sum(MIROC_ESM_CHEM_hflsAyy(d:c,:));
YBAR3=reshape(MIROC_ESM_CHEM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
MIROC_ESM_CHEM_hflsf1=MIROC_ESM_CHEM_ybar1./(MIROC_ESM_CHEM_ybar1+MIROC_ESM_CHEM_ybar2+MIROC_ESM_CHEM_ybar3);
MIROC_ESM_CHEM_hflsf2=MIROC_ESM_CHEM_ybar2./(MIROC_ESM_CHEM_ybar1+MIROC_ESM_CHEM_ybar2+MIROC_ESM_CHEM_ybar3);
MIROC_ESM_CHEM_hflsf3=MIROC_ESM_CHEM_ybar3./(MIROC_ESM_CHEM_ybar1+MIROC_ESM_CHEM_ybar2+MIROC_ESM_CHEM_ybar3);
% Model's ET_n with the original spatial resolution
MIROC_ESM_CHEM_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_CHEM_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_CHEM_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
MIROC_ESM_CHEM_new_hflsf1=SMAP_resolution(SMAP1,MIROC_ESM_CHEM_hflsf1,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_hflsf2=SMAP_resolution(SMAP2,MIROC_ESM_CHEM_hflsf2,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_hflsf3=SMAP_resolution(SMAP3,MIROC_ESM_CHEM_hflsf3,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
% Change model's ET_n has same surface coverage as SMAP
MIROC_ESM_CHEM_new_hF1=knn_mean(SMF_template,MIROC_ESM_CHEM_new_hflsf1,1);
MIROC_ESM_CHEM_new_hF2=knn_mean(SMF_template,MIROC_ESM_CHEM_new_hflsf2,1);
MIROC_ESM_CHEM_new_hF3=knn_mean(SMF_template,MIROC_ESM_CHEM_new_hflsf3,1);

% % P_n of MIROC_ESM_CHEM (pr)
% Get P_n over different time scales
N=56978;
Fs=1;
MIROC_ESM_CHEM_prA(56978,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=prData(p,q,:);
        MIROC_ESM_CHEM_prA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
MIROC_ESM_CHEM_prA=single(MIROC_ESM_CHEM_prA);
[row,col] = size(MIROC_ESM_CHEM_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(MIROC_ESM_CHEM_prA(:,i));
end
dA=single(dA);
Y=fft(dA);
MIROC_ESM_CHEM_prAyy=abs(Y).^2;
MIROC_ESM_CHEM_prAyy=MIROC_ESM_CHEM_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
MIROC_ESM_CHEM_ybar1=sum(MIROC_ESM_CHEM_prAyy(b:a,:));
YBAR1=reshape(MIROC_ESM_CHEM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
MIROC_ESM_CHEM_ybar2=sum(MIROC_ESM_CHEM_prAyy(c:b,:));
YBAR2=reshape(MIROC_ESM_CHEM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
MIROC_ESM_CHEM_ybar3=sum(MIROC_ESM_CHEM_prAyy(d:c,:));
YBAR3=reshape(MIROC_ESM_CHEM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
MIROC_ESM_CHEM_prf1=MIROC_ESM_CHEM_ybar1./(MIROC_ESM_CHEM_ybar1+MIROC_ESM_CHEM_ybar2+MIROC_ESM_CHEM_ybar3);
MIROC_ESM_CHEM_prf2=MIROC_ESM_CHEM_ybar2./(MIROC_ESM_CHEM_ybar1+MIROC_ESM_CHEM_ybar2+MIROC_ESM_CHEM_ybar3);
MIROC_ESM_CHEM_prf3=MIROC_ESM_CHEM_ybar3./(MIROC_ESM_CHEM_ybar1+MIROC_ESM_CHEM_ybar2+MIROC_ESM_CHEM_ybar3);
% Model's Pr_n with the original spatial resolution
MIROC_ESM_CHEM_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_CHEM_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
MIROC_ESM_CHEM_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
MIROC_ESM_CHEM_new_prf1=SMAP_resolution(SMAP1,MIROC_ESM_CHEM_prf1,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_prf2=SMAP_resolution(SMAP2,MIROC_ESM_CHEM_prf2,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_prf3=SMAP_resolution(SMAP3,MIROC_ESM_CHEM_prf3,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
% Change model's ET_n has same surface coverage as SMAP
MIROC_ESM_CHEM_new_pF1=knn_mean(SMF_template,MIROC_ESM_CHEM_new_prf1,1);
MIROC_ESM_CHEM_new_pF2=knn_mean(SMF_template,MIROC_ESM_CHEM_new_prf2,1);
MIROC_ESM_CHEM_new_pF3=knn_mean(SMF_template,MIROC_ESM_CHEM_new_prf3,1);

% % % Spectral slope of MIROC_ESM_CHEM (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=20454;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
% % SSM_kw of MIROC_ESM_CHEM (mrsos)
% Get SSM_kw over different time scales
[MIROC_ESM_CHEM_mrsosp1,MIROC_ESM_CHEM_mrsosP1]=spectral_slope(MIROC_ESM_CHEM_mrsosA,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData,b,a,N,Fs);
[MIROC_ESM_CHEM_mrsosp2,MIROC_ESM_CHEM_mrsosP2]=spectral_slope(MIROC_ESM_CHEM_mrsosA,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData,c,b,N,Fs);
[MIROC_ESM_CHEM_mrsosp3,MIROC_ESM_CHEM_mrsosP3]=spectral_slope(MIROC_ESM_CHEM_mrsosA,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
MIROC_ESM_CHEM_new_mrsosp1=SMAP_resolution(SMAP1,MIROC_ESM_CHEM_mrsosp1,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_mrsosp2=SMAP_resolution(SMAP2,MIROC_ESM_CHEM_mrsosp2,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_mrsosp3=SMAP_resolution(SMAP3,MIROC_ESM_CHEM_mrsosp3,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
MIROC_ESM_CHEM_new_mP1=knn_mean(SMF_template,MIROC_ESM_CHEM_new_mrsosp1,1);
MIROC_ESM_CHEM_new_mP2=knn_mean(SMF_template,MIROC_ESM_CHEM_new_mrsosp2,1);
MIROC_ESM_CHEM_new_mP3=knn_mean(SMF_template,MIROC_ESM_CHEM_new_mrsosp3,1);
% % ET_kw of MIROC_ESM_CHEM (hfls)
% Get ET_kw over different time scales
[MIROC_ESM_CHEM_hflsp1,MIROC_ESM_CHEM_hflsP1]=spectral_slope(MIROC_ESM_CHEM_hflsA,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData,b,a,N,Fs);
[MIROC_ESM_CHEM_hflsp2,MIROC_ESM_CHEM_hflsP2]=spectral_slope(MIROC_ESM_CHEM_hflsA,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData,c,b,N,Fs);
[MIROC_ESM_CHEM_hflsp3,MIROC_ESM_CHEM_hflsP3]=spectral_slope(MIROC_ESM_CHEM_hflsA,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
MIROC_ESM_CHEM_new_hflsp1=SMAP_resolution(SMAP1,MIROC_ESM_CHEM_hflsp1,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_hflsp2=SMAP_resolution(SMAP2,MIROC_ESM_CHEM_hflsp2,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_hflsp3=SMAP_resolution(SMAP3,MIROC_ESM_CHEM_hflsp3,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
% Change model's ET_kw has same surface coverage as SMAP
MIROC_ESM_CHEM_new_hP1=knn_mean(SMF_template,MIROC_ESM_CHEM_new_hflsp1,1);
MIROC_ESM_CHEM_new_hP2=knn_mean(SMF_template,MIROC_ESM_CHEM_new_hflsp2,1);
MIROC_ESM_CHEM_new_hP3=knn_mean(SMF_template,MIROC_ESM_CHEM_new_hflsp3,1);
% % Pr_kw of MIROC_ESM_CHEM (pr)
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
[MIROC_ESM_CHEM_prp1,MIROC_ESM_CHEM_prP1]=spectral_slope(MIROC_ESM_CHEM_prA,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData,b,a,N,Fs);
[MIROC_ESM_CHEM_prp2,MIROC_ESM_CHEM_prP2]=spectral_slope(MIROC_ESM_CHEM_prA,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData,c,b,N,Fs);
[MIROC_ESM_CHEM_prp3,MIROC_ESM_CHEM_prP3]=spectral_slope(MIROC_ESM_CHEM_prA,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
MIROC_ESM_CHEM_new_prp1=SMAP_resolution(SMAP1,MIROC_ESM_CHEM_prp1,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_prp2=SMAP_resolution(SMAP2,MIROC_ESM_CHEM_prp2,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
MIROC_ESM_CHEM_new_prp3=SMAP_resolution(SMAP3,MIROC_ESM_CHEM_prp3,MIROC_ESM_CHEM_latData,MIROC_ESM_CHEM_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
MIROC_ESM_CHEM_new_pP1=knn_mean(SMF_template,MIROC_ESM_CHEM_new_prp1,1);
MIROC_ESM_CHEM_new_pP2=knn_mean(SMF_template,MIROC_ESM_CHEM_new_prp2,1);
MIROC_ESM_CHEM_new_pP3=knn_mean(SMF_template,MIROC_ESM_CHEM_new_prp3,1);