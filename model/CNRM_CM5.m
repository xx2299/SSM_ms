% % SSM_n of CNRM_CM5 (mrsos)
% Get SSM_n over different time scales
N=20454;
Fs=1;
CNRM_CM5_mrsosA(20454,32768)=0;
count=1;
for q=1:128
    for p=1:256
        C=mrsosData(p,q,:);
        CNRM_CM5_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
CNRM_CM5_mrsosA=single(CNRM_CM5_mrsosA);
[row,col] = size(CNRM_CM5_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(CNRM_CM5_mrsosA(:,i));
end
dA=single(dA);
A1=dA(:,1:8192);
Y1=fft(A1);
Y1=Y1(1:10227,:);
Ayy1=abs(Y1).^2;
A2=dA(:,8193:16384);
Y2=fft(A2);
Y2=Y2(1:10227,:);
Ayy2=abs(Y2).^2;
A3=dA(:,16385:24576);
Y3=fft(A3);
Y3=Y3(1:10227,:);
Ayy3=abs(Y3).^2;
A4=dA(:,24577:32768);
Y4=fft(A4);
Y4=Y4(1:10227,:);
Ayy4=abs(Y4).^2;
CNRM_CM5_mrsosAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
CNRM_CM5_mrsosAyy=CNRM_CM5_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
CNRM_CM5_ybar1=sum(CNRM_CM5_mrsosAyy(b:a,:));
YBAR1=reshape(CNRM_CM5_ybar1,[256,128]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
CNRM_CM5_ybar2=sum(CNRM_CM5_mrsosAyy(c:b,:));
YBAR2=reshape(CNRM_CM5_ybar2,[256,128]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
CNRM_CM5_ybar3=sum(CNRM_CM5_mrsosAyy(d:c,:));
YBAR3=reshape(CNRM_CM5_ybar3,[256,128]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
CNRM_CM5_mrsosf1=CNRM_CM5_ybar1./(CNRM_CM5_ybar1+CNRM_CM5_ybar2+CNRM_CM5_ybar3);
CNRM_CM5_mrsosf2=CNRM_CM5_ybar2./(CNRM_CM5_ybar1+CNRM_CM5_ybar2+CNRM_CM5_ybar3);
CNRM_CM5_mrsosf3=CNRM_CM5_ybar3./(CNRM_CM5_ybar1+CNRM_CM5_ybar2+CNRM_CM5_ybar3);
% Model's SSM_n with the original spatial resolution
CNRM_CM5_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
CNRM_CM5_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
CNRM_CM5_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
CNRM_CM5_new_mrsosf1=SMAP_resolution(SMAP1,CNRM_CM5_mrsosf1,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_mrsosf2=SMAP_resolution(SMAP2,CNRM_CM5_mrsosf2,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_mrsosf3=SMAP_resolution(SMAP3,CNRM_CM5_mrsosf3,CNRM_CM5_latData,CNRM_CM5_lonData);
% Change model's SSM_n has same surface coverage as SMAP
CNRM_CM5_new_mF1=knn_mean(SMF_template,CNRM_CM5_new_mrsosf1,1);
CNRM_CM5_new_mF2=knn_mean(SMF_template,CNRM_CM5_new_mrsosf2,1);
CNRM_CM5_new_mF3=knn_mean(SMF_template,CNRM_CM5_new_mrsosf3,1);

% % ET_n of CNRM_CM5 (hfls)
% Get ET_n over different time scales
N=20454;
Fs=1;
CNRM_CM5_hflsA(20454,32768)=0;
count=1;
for q=1:128
    for p=1:256
        C=hflsData(p,q,:);
        CNRM_CM5_hflsA(:,count)=C(:);
        count=count+1;
    end
end
CNRM_CM5_hflsA=single(CNRM_CM5_hflsA);
[row,col] = size(CNRM_CM5_hflsA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(CNRM_CM5_hflsA(:,i));
end
dA=single(dA);
A1=dA(:,1:8192);
Y1=fft(A1);
Y1=Y1(1:10227,:);
Ayy1=abs(Y1).^2;
A2=dA(:,8193:16384);
Y2=fft(A2);
Y2=Y2(1:10227,:);
Ayy2=abs(Y2).^2;
A3=dA(:,16385:24576);
Y3=fft(A3);
Y3=Y3(1:10227,:);
Ayy3=abs(Y3).^2;
A4=dA(:,24577:32768);
Y4=fft(A4);
Y4=Y4(1:10227,:);
Ayy4=abs(Y4).^2;
CNRM_CM5_hflsAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
CNRM_CM5_hflsAyy=CNRM_CM5_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
CNRM_CM5_ybar1=sum(CNRM_CM5_hflsAyy(b:a,:));
YBAR1=reshape(CNRM_CM5_ybar1,[256,128]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
CNRM_CM5_ybar2=sum(CNRM_CM5_hflsAyy(c:b,:));
YBAR2=reshape(CNRM_CM5_ybar2,[256,128]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
CNRM_CM5_ybar3=sum(CNRM_CM5_hflsAyy(d:c,:));
YBAR3=reshape(CNRM_CM5_ybar3,[256,128]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
CNRM_CM5_hflsf1=CNRM_CM5_ybar1./(CNRM_CM5_ybar1+CNRM_CM5_ybar2+CNRM_CM5_ybar3);
CNRM_CM5_hflsf2=CNRM_CM5_ybar2./(CNRM_CM5_ybar1+CNRM_CM5_ybar2+CNRM_CM5_ybar3);
CNRM_CM5_hflsf3=CNRM_CM5_ybar3./(CNRM_CM5_ybar1+CNRM_CM5_ybar2+CNRM_CM5_ybar3);
% Model's ET_n with the original spatial resolution
CNRM_CM5_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
CNRM_CM5_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
CNRM_CM5_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
CNRM_CM5_new_hflsf1=SMAP_resolution(SMAP1,CNRM_CM5_hflsf1,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_hflsf2=SMAP_resolution(SMAP2,CNRM_CM5_hflsf2,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_hflsf3=SMAP_resolution(SMAP3,CNRM_CM5_hflsf3,CNRM_CM5_latData,CNRM_CM5_lonData);
% Change model's ET_n has same surface coverage as SMAP
CNRM_CM5_new_hF1=knn_mean(SMF_template,CNRM_CM5_new_hflsf1,1);
CNRM_CM5_new_hF2=knn_mean(SMF_template,CNRM_CM5_new_hflsf2,1);
CNRM_CM5_new_hF3=knn_mean(SMF_template,CNRM_CM5_new_hflsf3,1);

% % P_n of CNRM_CM5 (pr)
% Get P_n over different time scales
N=20454;
Fs=1;
CNRM_CM5_prA(20454,32768)=0;
count=1;
for q=1:128
    for p=1:256
        C=prData(p,q,:);
        CNRM_CM5_prA(:,count)=C(:);
        count=count+1;
    end
end
CNRM_CM5_prA=single(CNRM_CM5_prA);
[row,col] = size(CNRM_CM5_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(CNRM_CM5_prA(:,i));
end
dA=single(dA);
A1=dA(:,1:8192);
Y1=fft(A1);
Y1=Y1(1:10227,:);
Ayy1=abs(Y1).^2;
A2=dA(:,8193:16384);
Y2=fft(A2);
Y2=Y2(1:10227,:);
Ayy2=abs(Y2).^2;
A3=dA(:,16385:24576);
Y3=fft(A3);
Y3=Y3(1:10227,:);
Ayy3=abs(Y3).^2;
A4=dA(:,24577:32768);
Y4=fft(A4);
Y4=Y4(1:10227,:);
Ayy4=abs(Y4).^2;
CNRM_CM5_prAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
CNRM_CM5_prAyy=CNRM_CM5_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
CNRM_CM5_ybar1=sum(CNRM_CM5_prAyy(b:a,:));
YBAR1=reshape(CNRM_CM5_ybar1,[256,128]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
CNRM_CM5_ybar2=sum(CNRM_CM5_prAyy(c:b,:));
YBAR2=reshape(CNRM_CM5_ybar2,[256,128]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
CNRM_CM5_ybar3=sum(CNRM_CM5_prAyy(d:c,:));
YBAR3=reshape(CNRM_CM5_ybar3,[256,128]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
CNRM_CM5_prf1=CNRM_CM5_ybar1./(CNRM_CM5_ybar1+CNRM_CM5_ybar2+CNRM_CM5_ybar3);
CNRM_CM5_prf2=CNRM_CM5_ybar2./(CNRM_CM5_ybar1+CNRM_CM5_ybar2+CNRM_CM5_ybar3);
CNRM_CM5_prf3=CNRM_CM5_ybar3./(CNRM_CM5_ybar1+CNRM_CM5_ybar2+CNRM_CM5_ybar3);
% Model's Pr_n with the original spatial resolution
CNRM_CM5_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
CNRM_CM5_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
CNRM_CM5_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's Pr_n to the same as SMAP
CNRM_CM5_new_prf1=SMAP_resolution(SMAP1,CNRM_CM5_prf1,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_prf2=SMAP_resolution(SMAP2,CNRM_CM5_prf2,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_prf3=SMAP_resolution(SMAP3,CNRM_CM5_prf3,CNRM_CM5_latData,CNRM_CM5_lonData);
% Change model's Pr_n has same surface coverage as SMAP
CNRM_CM5_new_pF1=knn_mean(SMF_template,CNRM_CM5_new_prf1,1);
CNRM_CM5_new_pF2=knn_mean(SMF_template,CNRM_CM5_new_prf2,1);
CNRM_CM5_new_pF3=knn_mean(SMF_template,CNRM_CM5_new_prf3,1);

% % % Spectral slope of CNRM_CM5 (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=20454;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
% % SSM_kw of CNRM_CM5 (mrsos)
% Get SSM_kw over different time scales
[CNRM_CM5_mrsosp1,CNRM_CM5_mrsosP1]=spectral_slope(CNRM_CM5_mrsosA,CNRM_CM5_latData,CNRM_CM5_lonData,b,a,N,Fs);
[CNRM_CM5_mrsosp2,CNRM_CM5_mrsosP2]=spectral_slope(CNRM_CM5_mrsosA,CNRM_CM5_latData,CNRM_CM5_lonData,c,b,N,Fs);
[CNRM_CM5_mrsosp3,CNRM_CM5_mrsosP3]=spectral_slope(CNRM_CM5_mrsosA,CNRM_CM5_latData,CNRM_CM5_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
CNRM_CM5_new_mrsosp1=SMAP_resolution(SMAP1,CNRM_CM5_mrsosp1,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_mrsosp2=SMAP_resolution(SMAP2,CNRM_CM5_mrsosp2,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_mrsosp3=SMAP_resolution(SMAP3,CNRM_CM5_mrsosp3,CNRM_CM5_latData,CNRM_CM5_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
CNRM_CM5_new_mP1=knn_mean(SMF_template,CNRM_CM5_new_mrsosp1,1);
CNRM_CM5_new_mP2=knn_mean(SMF_template,CNRM_CM5_new_mrsosp2,1);
CNRM_CM5_new_mP3=knn_mean(SMF_template,CNRM_CM5_new_mrsosp3,1);
% % ET_kw of CNRM_CM5 (hfls)
% Get ET_kw over different time scales
[CNRM_CM5_hflsp1,CNRM_CM5_hflsP1]=spectral_slope(CNRM_CM5_hflsA,CNRM_CM5_latData,CNRM_CM5_lonData,b,a,N,Fs);
[CNRM_CM5_hflsp2,CNRM_CM5_hflsP2]=spectral_slope(CNRM_CM5_hflsA,CNRM_CM5_latData,CNRM_CM5_lonData,c,b,N,Fs);
[CNRM_CM5_hflsp3,CNRM_CM5_hflsP3]=spectral_slope(CNRM_CM5_hflsA,CNRM_CM5_latData,CNRM_CM5_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
CNRM_CM5_new_hflsp1=SMAP_resolution(SMAP1,CNRM_CM5_hflsp1,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_hflsp2=SMAP_resolution(SMAP2,CNRM_CM5_hflsp2,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_hflsp3=SMAP_resolution(SMAP3,CNRM_CM5_hflsp3,CNRM_CM5_latData,CNRM_CM5_lonData);
% Change model's ET_kw has same surface coverage as SMAP
CNRM_CM5_new_hP1=knn_mean(SMF_template,CNRM_CM5_new_hflsp1,1);
CNRM_CM5_new_hP2=knn_mean(SMF_template,CNRM_CM5_new_hflsp2,1);
CNRM_CM5_new_hP3=knn_mean(SMF_template,CNRM_CM5_new_hflsp3,1);
% % Pr_kw of CNRM_CM5 (pr)
% GPr Pr_kw over different time scales
[CNRM_CM5_prp1,CNRM_CM5_prP1]=spectral_slope(CNRM_CM5_prA,CNRM_CM5_latData,CNRM_CM5_lonData,b,a,N,Fs);
[CNRM_CM5_prp2,CNRM_CM5_prP2]=spectral_slope(CNRM_CM5_prA,CNRM_CM5_latData,CNRM_CM5_lonData,c,b,N,Fs);
[CNRM_CM5_prp3,CNRM_CM5_prP3]=spectral_slope(CNRM_CM5_prA,CNRM_CM5_latData,CNRM_CM5_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
CNRM_CM5_new_prp1=SMAP_resolution(SMAP1,CNRM_CM5_prp1,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_prp2=SMAP_resolution(SMAP2,CNRM_CM5_prp2,CNRM_CM5_latData,CNRM_CM5_lonData);
CNRM_CM5_new_prp3=SMAP_resolution(SMAP3,CNRM_CM5_prp3,CNRM_CM5_latData,CNRM_CM5_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
CNRM_CM5_new_pP1=knn_mean(SMF_template,CNRM_CM5_new_prp1,1);
CNRM_CM5_new_pP2=knn_mean(SMF_template,CNRM_CM5_new_prp2,1);
CNRM_CM5_new_pP3=knn_mean(SMF_template,CNRM_CM5_new_prp3,1);