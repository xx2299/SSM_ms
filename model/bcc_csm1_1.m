% % SSM_n of BCC-CSM1.1 (mrsos)
% Get SSM_n over different time scales
N=22995;
Fs=1;
BCC_CSM_mrsosA(22995,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=mrsosData(p,q,:);
        BCC_CSM_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
BCC_CSM_mrsosA(BCC_CSM_mrsosA==0)=nan;
BCC_CSM_mrsosA=single(BCC_CSM_mrsosA);
[row,col] = size(BCC_CSM_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(BCC_CSM_mrsosA(:,i));
end
dA=single(dA);
Y=fft(dA);
BCC_CSM_mrsosAyy=abs(Y).^2;
BCC_CSM_mrsosAyy=BCC_CSM_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00002);
b=767;
c=256;
d=find(abs(x-1/365)<=0.00002);
BCC_CSM_ybar1=sum(BCC_CSM_mrsosAyy(b:a,:));
YBAR1=reshape(BCC_CSM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
BCC_CSM_ybar2=sum(BCC_CSM_mrsosAyy(c:b,:));
YBAR2=reshape(BCC_CSM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
BCC_CSM_ybar3=sum(BCC_CSM_mrsosAyy(d:c,:));
YBAR3=reshape(BCC_CSM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
BCC_CSM_mrsosf1=BCC_CSM_ybar1./(BCC_CSM_ybar1+BCC_CSM_ybar2+BCC_CSM_ybar3);
BCC_CSM_mrsosf2=BCC_CSM_ybar2./(BCC_CSM_ybar1+BCC_CSM_ybar2+BCC_CSM_ybar3);
BCC_CSM_mrsosf3=BCC_CSM_ybar3./(BCC_CSM_ybar1+BCC_CSM_ybar2+BCC_CSM_ybar3);
% Model's SSM_n with the original spatial resolution
BCC_CSM_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
BCC_CSM_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
BCC_CSM_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
BCC_CSM_new_mrsosf1=SMAP_resolution(SMAP1,BCC_CSM_mrsosf1,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_mrsosf2=SMAP_resolution(SMAP2,BCC_CSM_mrsosf2,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_mrsosf3=SMAP_resolution(SMAP3,BCC_CSM_mrsosf3,BCC_CSM_latData,BCC_CSM_lonData);
% Change model's SSM_n has same surface coverage as SMAP
BCC_CSM_new_mF1=knn_mean(SMF_template,BCC_CSM_new_mrsosf1,1);
BCC_CSM_new_mF2=knn_mean(SMF_template,BCC_CSM_new_mrsosf2,1);
BCC_CSM_new_mF3=knn_mean(SMF_template,BCC_CSM_new_mrsosf3,1);

% % ET_n of BCC-CSM1.1 (hfls)
% Get ET_n over different time scales
N=22994;
Fs=1;
BCC_CSM_hflsA(22994,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=hflsData(p,q,:);
        BCC_CSM_hflsA(:,count)=C(:);
        count=count+1;
    end
end
BCC_CSM_hflsA=single(BCC_CSM_hflsA);
[row,col] = size(BCC_CSM_hflsA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(BCC_CSM_hflsA(:,i));
end
dA=single(dA);
Y=fft(dA);
BCC_CSM_hflsAyy=abs(Y).^2;
BCC_CSM_hflsAyy=BCC_CSM_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00002);
b=find(abs(x-1/30)<=0.000022);
c=find(abs(x-1/90)<=0.000022);
d=find(abs(x-1/365)<=0.00002);
BCC_CSM_ybar1=sum(BCC_CSM_hflsAyy(b:a,:));
YBAR1=reshape(BCC_CSM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
BCC_CSM_ybar2=sum(BCC_CSM_hflsAyy(c:b,:));
YBAR2=reshape(BCC_CSM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
BCC_CSM_ybar3=sum(BCC_CSM_hflsAyy(d:c,:));
YBAR3=reshape(BCC_CSM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
BCC_CSM_hflsf1=BCC_CSM_ybar1./(BCC_CSM_ybar1+BCC_CSM_ybar2+BCC_CSM_ybar3);
BCC_CSM_hflsf2=BCC_CSM_ybar2./(BCC_CSM_ybar1+BCC_CSM_ybar2+BCC_CSM_ybar3);
BCC_CSM_hflsf3=BCC_CSM_ybar3./(BCC_CSM_ybar1+BCC_CSM_ybar2+BCC_CSM_ybar3);
% Model's ET_n with the original spatial resolution
BCC_CSM_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
BCC_CSM_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
BCC_CSM_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
BCC_CSM_new_hflsf1=SMAP_resolution(SMAP1,BCC_CSM_hflsf1,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_hflsf2=SMAP_resolution(SMAP2,BCC_CSM_hflsf2,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_hflsf3=SMAP_resolution(SMAP3,BCC_CSM_hflsf3,BCC_CSM_latData,BCC_CSM_lonData);
% Change model's ET_n has same surface coverage as SMAP
BCC_CSM_new_hF1=knn_mean(SMF_template,BCC_CSM_new_hflsf1,1);
BCC_CSM_new_hF2=knn_mean(SMF_template,BCC_CSM_new_hflsf2,1);
BCC_CSM_new_hF3=knn_mean(SMF_template,BCC_CSM_new_hflsf3,1);

% % P_n of BCC-CSM1.1 (pr)
% Get P_n over different time scales
N=59494;
Fs=1;
BCC_CSM_prA(59494,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=prData(p,q,:);
        BCC_CSM_prA(:,count)=C(:);
        count=count+1;
    end
end
BCC_CSM_prA=single(BCC_CSM_prA);
[row,col] = size(BCC_CSM_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(BCC_CSM_prA(:,i));
end
dA=single(dA);
Y=fft(dA);
BCC_CSM_prAyy=abs(Y).^2;
BCC_CSM_prAyy=BCC_CSM_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
BCC_CSM_ybar1=sum(BCC_CSM_prAyy(b:a,:));
YBAR1=reshape(BCC_CSM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
BCC_CSM_ybar2=sum(BCC_CSM_prAyy(c:b,:));
YBAR2=reshape(BCC_CSM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
BCC_CSM_ybar3=sum(BCC_CSM_prAyy(d:c,:));
YBAR3=reshape(BCC_CSM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
BCC_CSM_prf1=BCC_CSM_ybar1./(BCC_CSM_ybar1+BCC_CSM_ybar2+BCC_CSM_ybar3);
BCC_CSM_prf2=BCC_CSM_ybar2./(BCC_CSM_ybar1+BCC_CSM_ybar2+BCC_CSM_ybar3);
BCC_CSM_prf3=BCC_CSM_ybar3./(BCC_CSM_ybar1+BCC_CSM_ybar2+BCC_CSM_ybar3);
% Model's Pr_n with the original spatial resolution
BCC_CSM_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
BCC_CSM_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
BCC_CSM_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's Pr_n to the same as SMAP
BCC_CSM_new_prf1=SMAP_resolution(SMAP1,BCC_CSM_prf1,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_prf2=SMAP_resolution(SMAP2,BCC_CSM_prf2,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_prf3=SMAP_resolution(SMAP3,BCC_CSM_prf3,BCC_CSM_latData,BCC_CSM_lonData);
% Change model's Pr_n has same surface coverage as SMAP
BCC_CSM_new_pF1=knn_mean(SMF_template,BCC_CSM_new_prf1,1);
BCC_CSM_new_pF2=knn_mean(SMF_template,BCC_CSM_new_prf2,1);
BCC_CSM_new_pF3=knn_mean(SMF_template,BCC_CSM_new_prf3,1);

% % % Spectral slope of BCC_CSM (SSM_kw, ET_kw, Pr_kw)
% % SSM_kw of BCC_CSM (mrsos)
get the cutoff frequencies
N=22995;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00002);
b=767;
c=256;
d=find(abs(x-1/365)<=0.00002);
Get SSM_kw over different time scales
[BCC_CSM_mrsosp1,BCC_CSM_mrsosP1]=spectral_slope(BCC_CSM_mrsosA,BCC_CSM_latData,BCC_CSM_lonData,b,a,N,Fs);
[BCC_CSM_mrsosp2,BCC_CSM_mrsosP2]=spectral_slope(BCC_CSM_mrsosA,BCC_CSM_latData,BCC_CSM_lonData,c,b,N,Fs);
[BCC_CSM_mrsosp3,BCC_CSM_mrsosP3]=spectral_slope(BCC_CSM_mrsosA,BCC_CSM_latData,BCC_CSM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
BCC_CSM_new_mrsosp1=SMAP_resolution(SMAP1,BCC_CSM_mrsosp1,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_mrsosp2=SMAP_resolution(SMAP2,BCC_CSM_mrsosp2,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_mrsosp3=SMAP_resolution(SMAP3,BCC_CSM_mrsosp3,BCC_CSM_latData,BCC_CSM_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
BCC_CSM_new_mP1=knn_mean(SMF_template,BCC_CSM_new_mrsosp1,1);
BCC_CSM_new_mP2=knn_mean(SMF_template,BCC_CSM_new_mrsosp2,1);
BCC_CSM_new_mP3=knn_mean(SMF_template,BCC_CSM_new_mrsosp3,1);
% % ET_kw of BCC_CSM (hfls)
get the cutoff frequencies
N=22994;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00002);
b=find(abs(x-1/30)<=0.000022);
c=find(abs(x-1/90)<=0.000022);
d=find(abs(x-1/365)<=0.00002);
Get ET_kw over different time scales
[BCC_CSM_hflsp1,BCC_CSM_hflsP1]=spectral_slope(BCC_CSM_hflsA,BCC_CSM_latData,BCC_CSM_lonData,b,a,N,Fs);
[BCC_CSM_hflsp2,BCC_CSM_hflsP2]=spectral_slope(BCC_CSM_hflsA,BCC_CSM_latData,BCC_CSM_lonData,c,b,N,Fs);
[BCC_CSM_hflsp3,BCC_CSM_hflsP3]=spectral_slope(BCC_CSM_hflsA,BCC_CSM_latData,BCC_CSM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
BCC_CSM_new_hflsp1=SMAP_resolution(SMAP1,BCC_CSM_hflsp1,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_hflsp2=SMAP_resolution(SMAP2,BCC_CSM_hflsp2,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_hflsp3=SMAP_resolution(SMAP3,BCC_CSM_hflsp3,BCC_CSM_latData,BCC_CSM_lonData);
% Change model's ET_kw has same surface coverage as SMAP
BCC_CSM_new_hP1=knn_mean(SMF_template,BCC_CSM_new_hflsp1,1);
BCC_CSM_new_hP2=knn_mean(SMF_template,BCC_CSM_new_hflsp2,1);
BCC_CSM_new_hP3=knn_mean(SMF_template,BCC_CSM_new_hflsp3,1);
% % Pr_kw of BCC_CSM (pr)
get the cutoff frequencies
N=59494;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
Get Pr_kw over different time scales
[BCC_CSM_prp1,BCC_CSM_prP1]=spectral_slope(BCC_CSM_prA,BCC_CSM_latData,BCC_CSM_lonData,b,a,N,Fs);
[BCC_CSM_prp2,BCC_CSM_prP2]=spectral_slope(BCC_CSM_prA,BCC_CSM_latData,BCC_CSM_lonData,c,b,N,Fs);
[BCC_CSM_prp3,BCC_CSM_prP3]=spectral_slope(BCC_CSM_prA,BCC_CSM_latData,BCC_CSM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
BCC_CSM_new_prp1=SMAP_resolution(SMAP1,BCC_CSM_prp1,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_prp2=SMAP_resolution(SMAP2,BCC_CSM_prp2,BCC_CSM_latData,BCC_CSM_lonData);
BCC_CSM_new_prp3=SMAP_resolution(SMAP3,BCC_CSM_prp3,BCC_CSM_latData,BCC_CSM_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
BCC_CSM_new_pP1=knn_mean(SMF_template,BCC_CSM_new_prp1,1);
BCC_CSM_new_pP2=knn_mean(SMF_template,BCC_CSM_new_prp2,1);
BCC_CSM_new_pP3=knn_mean(SMF_template,BCC_CSM_new_prp3,1);