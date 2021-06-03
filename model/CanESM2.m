% % SSM_n of CanESM2 (mrsos)
% Get SSM_n over different time scales
N=56940;
Fs=1;
CanESM2_mrsosA(56940,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=mrsosData(p,q,:);
        CanESM2_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
CanESM2_mrsosA=single(CanESM2_mrsosA);
[row,col] = size(CanESM2_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(CanESM2_mrsosA(:,i));
end
dA=single(dA);
A1=dA(:,1:2048);
Y1=fft(A1);
Y1=Y1(1:28470,:);
Ayy1=abs(Y1).^2;
A2=dA(:,2049:4096);
Y2=fft(A2);
Y2=Y2(1:28470,:);
Ayy2=abs(Y2).^2;
A3=dA(:,4097:6144);
Y3=fft(A3);
Y3=Y3(1:28470,:);
Ayy3=abs(Y3).^2;
A4=dA(:,6145:8192);
Y4=fft(A4);
Y4=Y4(1:28470,:);
Ayy4=abs(Y4).^2;
CanESM2_mrsosAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
CanESM2_mrsosAyy=CanESM2_mrsosAyy/(N/2);
CanESM2_mrsosAyy(Ayy==0)=nan;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
CanESM2_ybar1=sum(CanESM2_mrsosAyy(b:a,:));
YBAR1=reshape(CanESM2_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
CanESM2_ybar2=sum(CanESM2_mrsosAyy(c:b,:));
YBAR2=reshape(CanESM2_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
CanESM2_ybar3=sum(CanESM2_mrsosAyy(d:c,:));
YBAR3=reshape(CanESM2_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
CanESM2_mrsosf1=CanESM2_ybar1./(CanESM2_ybar1+CanESM2_ybar2+CanESM2_ybar3);
CanESM2_mrsosf2=CanESM2_ybar2./(CanESM2_ybar1+CanESM2_ybar2+CanESM2_ybar3);
CanESM2_mrsosf3=CanESM2_ybar3./(CanESM2_ybar1+CanESM2_ybar2+CanESM2_ybar3);
% Model's SSM_n with the original spatial resolution
CanESM2_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
CanESM2_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
CanESM2_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
CanESM2_new_mrsosf1=SMAP_resolution(SMAP1,CanESM2_mrsosf1,CanESM2_latData,CanESM2_lonData);
CanESM2_new_mrsosf2=SMAP_resolution(SMAP2,CanESM2_mrsosf2,CanESM2_latData,CanESM2_lonData);
CanESM2_new_mrsosf3=SMAP_resolution(SMAP3,CanESM2_mrsosf3,CanESM2_latData,CanESM2_lonData);
% Change model's SSM_n has same surface coverage as SMAP
CanESM2_new_mF1=knn_mean(SMF_template,CanESM2_new_mrsosf1,1);
CanESM2_new_mF2=knn_mean(SMF_template,CanESM2_new_mrsosf2,1);
CanESM2_new_mF3=knn_mean(SMF_template,CanESM2_new_mrsosf3,1);

% % ET_n of CanESM2 (hfls)
% Get ET_n over different time scales
N=56940;
Fs=1;
CanESM2_hflsA(56940,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=hflsData(p,q,:);
        CanESM2_hflsA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
CanESM2_hflsA=single(CanESM2_hflsA);
[row,col] = size(CanESM2_hflsA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(CanESM2_hflsA(:,i));
end
dA=single(dA);
A1=dA(:,1:2048);
Y1=fft(A1);
Y1=Y1(1:28470,:);
Ayy1=abs(Y1).^2;
A2=dA(:,2049:4096);
Y2=fft(A2);
Y2=Y2(1:28470,:);
Ayy2=abs(Y2).^2;
A3=dA(:,4097:6144);
Y3=fft(A3);
Y3=Y3(1:28470,:);
Ayy3=abs(Y3).^2;
A4=dA(:,6145:8192);
Y4=fft(A4);
Y4=Y4(1:28470,:);
Ayy4=abs(Y4).^2;
CanESM2_hflsAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
CanESM2_hflsAyy=CanESM2_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
CanESM2_ybar1=sum(CanESM2_hflsAyy(b:a,:));
YBAR1=reshape(CanESM2_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
CanESM2_ybar2=sum(CanESM2_hflsAyy(c:b,:));
YBAR2=reshape(CanESM2_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
CanESM2_ybar3=sum(CanESM2_hflsAyy(d:c,:));
YBAR3=reshape(CanESM2_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
CanESM2_hflsf1=CanESM2_ybar1./(CanESM2_ybar1+CanESM2_ybar2+CanESM2_ybar3);
CanESM2_hflsf2=CanESM2_ybar2./(CanESM2_ybar1+CanESM2_ybar2+CanESM2_ybar3);
CanESM2_hflsf3=CanESM2_ybar3./(CanESM2_ybar1+CanESM2_ybar2+CanESM2_ybar3);
% Model's ET_n with the original spatial resolution
CanESM2_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
CanESM2_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
CanESM2_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
CanESM2_new_hflsf1=SMAP_resolution(SMAP1,CanESM2_hflsf1,CanESM2_latData,CanESM2_lonData);
CanESM2_new_hflsf2=SMAP_resolution(SMAP2,CanESM2_hflsf2,CanESM2_latData,CanESM2_lonData);
CanESM2_new_hflsf3=SMAP_resolution(SMAP3,CanESM2_hflsf3,CanESM2_latData,CanESM2_lonData);
% Change model's ET_n has same surface coverage as SMAP
CanESM2_new_hF1=knn_mean(SMF_template,CanESM2_new_hflsf1,1);
CanESM2_new_hF2=knn_mean(SMF_template,CanESM2_new_hflsf2,1);
CanESM2_new_hF3=knn_mean(SMF_template,CanESM2_new_hflsf3,1);

% % P_n of CanESM2 (pr)
% Get P_n over different time scales
N=56940;
Fs=1;
CanESM2_prA(56940,8192)=0;
count=1;
for q=1:64
    for p=1:128
        C=prData(p,q,:);
        CanESM2_prA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
CanESM2_prA=single(CanESM2_prA);
[row,col] = size(CanESM2_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(CanESM2_prA(:,i));
end
dA=single(dA);
A1=dA(:,1:2048);
Y1=fft(A1);
Y1=Y1(1:28470,:);
Ayy1=abs(Y1).^2;
A2=dA(:,2049:4096);
Y2=fft(A2);
Y2=Y2(1:28470,:);
Ayy2=abs(Y2).^2;
A3=dA(:,4097:6144);
Y3=fft(A3);
Y3=Y3(1:28470,:);
Ayy3=abs(Y3).^2;
A4=dA(:,6145:8192);
Y4=fft(A4);
Y4=Y4(1:28470,:);
Ayy4=abs(Y4).^2;
CanESM2_prAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
CanESM2_prAyy=CanESM2_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
CanESM2_ybar1=sum(CanESM2_prAyy(b:a,:));
YBAR1=reshape(CanESM2_ybar1,[128,64]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
CanESM2_ybar2=sum(CanESM2_prAyy(c:b,:));
YBAR2=reshape(CanESM2_ybar2,[128,64]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
CanESM2_ybar3=sum(CanESM2_prAyy(d:c,:));
YBAR3=reshape(CanESM2_ybar3,[128,64]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
CanESM2_prf1=CanESM2_ybar1./(CanESM2_ybar1+CanESM2_ybar2+CanESM2_ybar3);
CanESM2_prf2=CanESM2_ybar2./(CanESM2_ybar1+CanESM2_ybar2+CanESM2_ybar3);
CanESM2_prf3=CanESM2_ybar3./(CanESM2_ybar1+CanESM2_ybar2+CanESM2_ybar3);
% Model's Pr_n with the original spatial resolution
CanESM2_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
CanESM2_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
CanESM2_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
CanESM2_new_prf1=SMAP_resolution(SMAP1,CanESM2_prf1,CanESM2_latData,CanESM2_lonData);
CanESM2_new_prf2=SMAP_resolution(SMAP2,CanESM2_prf2,CanESM2_latData,CanESM2_lonData);
CanESM2_new_prf3=SMAP_resolution(SMAP3,CanESM2_prf3,CanESM2_latData,CanESM2_lonData);
% Change model's ET_n has same surface coverage as SMAP
CanESM2_new_pF1=knn_mean(SMF_template,CanESM2_new_prf1,1);
CanESM2_new_pF2=knn_mean(SMF_template,CanESM2_new_prf2,1);
CanESM2_new_pF3=knn_mean(SMF_template,CanESM2_new_prf3,1);

% % % Spectral slope of CanESM2 (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=56940;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
% % SSM_kw of CanESM2 (mrsos)
% Get SSM_kw over different time scales
[CanESM2_mrsosp1,CanESM2_mrsosP1]=spectral_slope(CanESM2_mrsosA,CanESM2_latData,CanESM2_lonData,b,a,N,Fs);
[CanESM2_mrsosp2,CanESM2_mrsosP2]=spectral_slope(CanESM2_mrsosA,CanESM2_latData,CanESM2_lonData,c,b,N,Fs);
[CanESM2_mrsosp3,CanESM2_mrsosP3]=spectral_slope(CanESM2_mrsosA,CanESM2_latData,CanESM2_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
CanESM2_new_mrsosp1=SMAP_resolution(SMAP1,CanESM2_mrsosp1,CanESM2_latData,CanESM2_lonData);
CanESM2_new_mrsosp2=SMAP_resolution(SMAP2,CanESM2_mrsosp2,CanESM2_latData,CanESM2_lonData);
CanESM2_new_mrsosp3=SMAP_resolution(SMAP3,CanESM2_mrsosp3,CanESM2_latData,CanESM2_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
CanESM2_new_mP1=knn_mean(SMF_template,CanESM2_new_mrsosp1,1);
CanESM2_new_mP2=knn_mean(SMF_template,CanESM2_new_mrsosp2,1);
CanESM2_new_mP3=knn_mean(SMF_template,CanESM2_new_mrsosp3,1);
% % ET_kw of CanESM2 (hfls)
% Get ET_kw over different time scales
[CanESM2_hflsp1,CanESM2_hflsP1]=spectral_slope(CanESM2_hflsA,CanESM2_latData,CanESM2_lonData,b,a,N,Fs);
[CanESM2_hflsp2,CanESM2_hflsP2]=spectral_slope(CanESM2_hflsA,CanESM2_latData,CanESM2_lonData,c,b,N,Fs);
[CanESM2_hflsp3,CanESM2_hflsP3]=spectral_slope(CanESM2_hflsA,CanESM2_latData,CanESM2_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
CanESM2_new_hflsp1=SMAP_resolution(SMAP1,CanESM2_hflsp1,CanESM2_latData,CanESM2_lonData);
CanESM2_new_hflsp2=SMAP_resolution(SMAP2,CanESM2_hflsp2,CanESM2_latData,CanESM2_lonData);
CanESM2_new_hflsp3=SMAP_resolution(SMAP3,CanESM2_hflsp3,CanESM2_latData,CanESM2_lonData);
% Change model's ET_kw has same surface coverage as SMAP
CanESM2_new_hP1=knn_mean(SMF_template,CanESM2_new_hflsp1,1);
CanESM2_new_hP2=knn_mean(SMF_template,CanESM2_new_hflsp2,1);
CanESM2_new_hP3=knn_mean(SMF_template,CanESM2_new_hflsp3,1);
% % Pr_kw of CanESM2 (pr)
% GPr Pr_kw over different time scales
[CanESM2_prp1,CanESM2_prP1]=spectral_slope(CanESM2_prA,CanESM2_latData,CanESM2_lonData,b,a,N,Fs);
[CanESM2_prp2,CanESM2_prP2]=spectral_slope(CanESM2_prA,CanESM2_latData,CanESM2_lonData,c,b,N,Fs);
[CanESM2_prp3,CanESM2_prP3]=spectral_slope(CanESM2_prA,CanESM2_latData,CanESM2_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
CanESM2_new_prp1=SMAP_resolution(SMAP1,CanESM2_prp1,CanESM2_latData,CanESM2_lonData);
CanESM2_new_prp2=SMAP_resolution(SMAP2,CanESM2_prp2,CanESM2_latData,CanESM2_lonData);
CanESM2_new_prp3=SMAP_resolution(SMAP3,CanESM2_prp3,CanESM2_latData,CanESM2_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
CanESM2_new_pP1=knn_mean(SMF_template,CanESM2_new_prp1,1);
CanESM2_new_pP2=knn_mean(SMF_template,CanESM2_new_prp2,1);
CanESM2_new_pP3=knn_mean(SMF_template,CanESM2_new_prp3,1);