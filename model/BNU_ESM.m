% % SSM_n of BNU_ESM (mrsos)
% Get SSM_n over different time scales
N=20440;
Fs=1;
BNU_ESM_mrsosA(20440,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=mrsosData(p,q,:);
        BNU_ESM_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
BNU_ESM_mrsosA=single(BNU_ESM_mrsosA);
[row,col] = size(BNU_ESM_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(BNU_ESM_mrsosA(:,i));
end
dA=single(dA);
Y=fft(dA);
BNU_ESM_mrsosAyy=abs(Y).^2;
BNU_ESM_mrsosAyy=BNU_ESM_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00002);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00002);
BNU_ESM_ybar1=sum(BNU_ESM_mrsosAyy(b:a,:));
YBAR1=reshape(BNU_ESM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
BNU_ESM_ybar2=sum(BNU_ESM_mrsosAyy(c:b,:));
YBAR2=reshape(BNU_ESM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
BNU_ESM_ybar3=sum(BNU_ESM_mrsosAyy(d:c,:));
YBAR3=reshape(BNU_ESM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
BNU_ESM_mrsosf1=BNU_ESM_ybar1./(BNU_ESM_ybar1+BNU_ESM_ybar2+BNU_ESM_ybar3);
BNU_ESM_mrsosf2=BNU_ESM_ybar2./(BNU_ESM_ybar1+BNU_ESM_ybar2+BNU_ESM_ybar3);
BNU_ESM_mrsosf3=BNU_ESM_ybar3./(BNU_ESM_ybar1+BNU_ESM_ybar2+BNU_ESM_ybar3);
% Model's SSM_n with the original spatial resolution
BNU_ESM_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
BNU_ESM_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
BNU_ESM_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
BNU_ESM_new_mrsosf1=SMAP_resolution(SMAP1,BNU_ESM_mrsosf1,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_mrsosf2=SMAP_resolution(SMAP2,BNU_ESM_mrsosf2,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_mrsosf3=SMAP_resolution(SMAP3,BNU_ESM_mrsosf3,BNU_ESM_latData,BNU_ESM_lonData);
% Change model's SSM_n has same surface coverage as SMAP
BNU_ESM_new_mF1=knn_mean(SMF_template,BNU_ESM_new_mrsosf1,1);
BNU_ESM_new_mF2=knn_mean(SMF_template,BNU_ESM_new_mrsosf2,1);
BNU_ESM_new_mF3=knn_mean(SMF_template,BNU_ESM_new_mrsosf3,1);

% % ET_n of BNU_ESM (hfls)
% Get ET_n over different time scales
N=20440;
Fs=1;
BNU_ESM_hflsA(20440,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=hflsData(p,q,:);
        BNU_ESM_hflsA(:,count)=C(:);
        count=count+1;
    end
end
[row,col] = size(BNU_ESM_hflsA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(BNU_ESM_hflsA(:,i));
end
Y=fft(dA);
BNU_ESM_hflsAyy=abs(Y).^2;
BNU_ESM_hflsAyy=BNU_ESM_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00002);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00002);
BNU_ESM_ybar1=sum(BNU_ESM_hflsAyy(b:a,:));
YBAR1=reshape(BNU_ESM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
BNU_ESM_ybar2=sum(BNU_ESM_hflsAyy(c:b,:));
YBAR2=reshape(BNU_ESM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
BNU_ESM_ybar3=sum(BNU_ESM_hflsAyy(d:c,:));
YBAR3=reshape(BNU_ESM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
BNU_ESM_hflsf1=BNU_ESM_ybar1./(BNU_ESM_ybar1+BNU_ESM_ybar2+BNU_ESM_ybar3);
BNU_ESM_hflsf2=BNU_ESM_ybar2./(BNU_ESM_ybar1+BNU_ESM_ybar2+BNU_ESM_ybar3);
BNU_ESM_hflsf3=BNU_ESM_ybar3./(BNU_ESM_ybar1+BNU_ESM_ybar2+BNU_ESM_ybar3);
% Model's ET_n with the original spatial resolution
BNU_ESM_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
BNU_ESM_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
BNU_ESM_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
BNU_ESM_new_hflsf1=SMAP_resolution(SMAP1,BNU_ESM_hflsf1,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_hflsf2=SMAP_resolution(SMAP2,BNU_ESM_hflsf2,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_hflsf3=SMAP_resolution(SMAP3,BNU_ESM_hflsf3,BNU_ESM_latData,BNU_ESM_lonData);
% Change model's ET_n has same surface coverage as SMAP
BNU_ESM_new_hF1=knn_mean(SMF_template,BNU_ESM_new_hflsf1,1);
BNU_ESM_new_hF2=knn_mean(SMF_template,BNU_ESM_new_hflsf2,1);
BNU_ESM_new_hF3=knn_mean(SMF_template,BNU_ESM_new_hflsf3,1);

% % P_n of BCC-CSM1.1 (pr)
% Get P_n over different time scales
N=20440;
Fs=1;
BNU_ESM_prA(20440,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=prData(p,q,:);
        BNU_ESM_prA(:,count)=C(:);
        count=count+1;
    end
end
[row,col] = size(BNU_ESM_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(BNU_ESM_prA(:,i));
end
BNU_ESM_prA(BNU_ESM_prA==0)=nan;
BNU_ESM_prA=single(BNU_ESM_prA);
AT=BNU_ESM_prA.';
Z=mapminmax(AT,0,1);
BNU_ESM_prA=Z.';
Y=fft(BNU_ESM_prA);
BNU_ESM_prAyy=abs(Y).^2;
BNU_ESM_prAyy=BNU_ESM_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00002);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
BNU_ESM_ybar1=sum(BNU_ESM_prAyy(b:a,:));
YBAR1=reshape(BNU_ESM_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
BNU_ESM_ybar2=sum(BNU_ESM_prAyy(c:b,:));
YBAR2=reshape(BNU_ESM_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
BNU_ESM_ybar3=sum(BNU_ESM_prAyy(d:c,:));
YBAR3=reshape(BNU_ESM_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
BNU_ESM_prf1=BNU_ESM_ybar1./(BNU_ESM_ybar1+BNU_ESM_ybar2+BNU_ESM_ybar3);
BNU_ESM_prf2=BNU_ESM_ybar2./(BNU_ESM_ybar1+BNU_ESM_ybar2+BNU_ESM_ybar3);
BNU_ESM_prf3=BNU_ESM_ybar3./(BNU_ESM_ybar1+BNU_ESM_ybar2+BNU_ESM_ybar3);
% Model's Pr_n with the original spatial resolution
BNU_ESM_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
BNU_ESM_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
BNU_ESM_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's Pr_n to the same as SMAP
BNU_ESM_new_prf1=SMAP_resolution(SMAP1,BNU_ESM_prf1,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_prf2=SMAP_resolution(SMAP2,BNU_ESM_prf2,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_prf3=SMAP_resolution(SMAP3,BNU_ESM_prf3,BNU_ESM_latData,BNU_ESM_lonData);
% Change model's Pr_n has same surface coverage as SMAP
BNU_ESM_new_pF1=knn_mean(SMF_template,BNU_ESM_new_prf1,1);
BNU_ESM_new_pF2=knn_mean(SMF_template,BNU_ESM_new_prf2,1);
BNU_ESM_new_pF3=knn_mean(SMF_template,BNU_ESM_new_prf3,1);

% % % Spectral slope of BNU_ESM (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=20440;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00002);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00002);
% % SSM_kw of BNU_ESM (mrsos)
% Get SSM_kw over different time scales
[BNU_ESM_mrsosp1,BNU_ESM_mrsosP1]=spectral_slope(BNU_ESM_mrsosA,BNU_ESM_latData,BNU_ESM_lonData,b,a,N,Fs);
[BNU_ESM_mrsosp2,BNU_ESM_mrsosP2]=spectral_slope(BNU_ESM_mrsosA,BNU_ESM_latData,BNU_ESM_lonData,c,b,N,Fs);
[BNU_ESM_mrsosp3,BNU_ESM_mrsosP3]=spectral_slope(BNU_ESM_mrsosA,BNU_ESM_latData,BNU_ESM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
BNU_ESM_new_mrsosp1=SMAP_resolution(SMAP1,BNU_ESM_mrsosp1,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_mrsosp2=SMAP_resolution(SMAP2,BNU_ESM_mrsosp2,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_mrsosp3=SMAP_resolution(SMAP3,BNU_ESM_mrsosp3,BNU_ESM_latData,BNU_ESM_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
BNU_ESM_new_mP1=knn_mean(SMF_template,BNU_ESM_new_mrsosp1,1);
BNU_ESM_new_mP2=knn_mean(SMF_template,BNU_ESM_new_mrsosp2,1);
BNU_ESM_new_mP3=knn_mean(SMF_template,BNU_ESM_new_mrsosp3,1);
% % ET_kw of BNU_ESM (hfls)
% Get ET_kw over different time scales
[BNU_ESM_hflsp1,BNU_ESM_hflsP1]=spectral_slope(BNU_ESM_hflsA,BNU_ESM_latData,BNU_ESM_lonData,b,a,N,Fs);
[BNU_ESM_hflsp2,BNU_ESM_hflsP2]=spectral_slope(BNU_ESM_hflsA,BNU_ESM_latData,BNU_ESM_lonData,c,b,N,Fs);
[BNU_ESM_hflsp3,BNU_ESM_hflsP3]=spectral_slope(BNU_ESM_hflsA,BNU_ESM_latData,BNU_ESM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
BNU_ESM_new_hflsp1=SMAP_resolution(SMAP1,BNU_ESM_hflsp1,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_hflsp2=SMAP_resolution(SMAP2,BNU_ESM_hflsp2,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_hflsp3=SMAP_resolution(SMAP3,BNU_ESM_hflsp3,BNU_ESM_latData,BNU_ESM_lonData);
% Change model's ET_kw has same surface coverage as SMAP
BNU_ESM_new_hP1=knn_mean(SMF_template,BNU_ESM_new_hflsp1,1);
BNU_ESM_new_hP2=knn_mean(SMF_template,BNU_ESM_new_hflsp2,1);
BNU_ESM_new_hP3=knn_mean(SMF_template,BNU_ESM_new_hflsp3,1);
% % Pr_kw of BNU_ESM (pr)
% GPr Pr_kw over different time scales
[BNU_ESM_prp1,BNU_ESM_prP1]=spectral_slope(BNU_ESM_prA,BNU_ESM_latData,BNU_ESM_lonData,b,a,N,Fs);
[BNU_ESM_prp2,BNU_ESM_prP2]=spectral_slope(BNU_ESM_prA,BNU_ESM_latData,BNU_ESM_lonData,c,b,N,Fs);
[BNU_ESM_prp3,BNU_ESM_prP3]=spectral_slope(BNU_ESM_prA,BNU_ESM_latData,BNU_ESM_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
BNU_ESM_new_prp1=SMAP_resolution(SMAP1,BNU_ESM_prp1,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_prp2=SMAP_resolution(SMAP2,BNU_ESM_prp2,BNU_ESM_latData,BNU_ESM_lonData);
BNU_ESM_new_prp3=SMAP_resolution(SMAP3,BNU_ESM_prp3,BNU_ESM_latData,BNU_ESM_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
BNU_ESM_new_pP1=knn_mean(SMF_template,BNU_ESM_new_prp1,1);
BNU_ESM_new_pP2=knn_mean(SMF_template,BNU_ESM_new_prp2,1);
BNU_ESM_new_pP3=knn_mean(SMF_template,BNU_ESM_new_prp3,1);