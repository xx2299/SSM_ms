% % SSM_n of Institute_for_Numerical_Mathematics (mrsos)
% Get SSM_n over different time scales
N=20440;
Fs=1;
inmcm4_mrsosA(20440,21600)=0;
count=1;
for q=1:120
    for p=1:180
        C=mrsosData(p,q,:);
        inmcm4_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
inmcm4_mrsosA(inmcm4_mrsosA<0)=nan;
inmcm4_mrsosA=single(inmcm4_mrsosA);
[row,col] = size(inmcm4_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(inmcm4_mrsosA(:,i));
end
dA=single(dA);
A1=dA(:,1:5400);
Y1=fft(A1);
Y1=Y1(1:10220,:);
Ayy1=abs(Y1).^2;
A2=dA(:,5401:10800);
Y2=fft(A2);
Y2=Y2(1:10220,:);
Ayy2=abs(Y2).^2;
A3=dA(:,10801:16200);
Y3=fft(A3);
Y3=Y3(1:10220,:);
Ayy3=abs(Y3).^2;
A4=dA(:,16201:21600);
Y4=fft(A4);
Y4=Y4(1:10220,:);
Ayy4=abs(Y4).^2;
inmcm4_mrsosAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
inmcm4_mrsosAyy=inmcm4_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
inmcm4_ybar1=sum(inmcm4_mrsosAyy(b:a,:));
YBAR1=reshape(inmcm4_ybar1,[180,120]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
inmcm4_ybar2=sum(inmcm4_mrsosAyy(c:b,:));
YBAR2=reshape(inmcm4_ybar2,[180,120]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
inmcm4_ybar3=sum(inmcm4_mrsosAyy(d:c,:));
YBAR3=reshape(inmcm4_ybar3,[180,120]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
inmcm4_mrsosf1=inmcm4_ybar1./(inmcm4_ybar1+inmcm4_ybar2+inmcm4_ybar3);
inmcm4_mrsosf2=inmcm4_ybar2./(inmcm4_ybar1+inmcm4_ybar2+inmcm4_ybar3);
inmcm4_mrsosf3=inmcm4_ybar3./(inmcm4_ybar1+inmcm4_ybar2+inmcm4_ybar3);
% Model's SSM_n with the original spatial resolution
inmcm4_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
inmcm4_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
inmcm4_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
inmcm4_new_mrsosf1=SMAP_resolution(SMAP1,inmcm4_mrsosf1,inmcm4_latData,inmcm4_lonData);
inmcm4_new_mrsosf2=SMAP_resolution(SMAP2,inmcm4_mrsosf2,inmcm4_latData,inmcm4_lonData);
inmcm4_new_mrsosf3=SMAP_resolution(SMAP3,inmcm4_mrsosf3,inmcm4_latData,inmcm4_lonData);
% Change model's SSM_n has same surface coverage as SMAP
inmcm4_new_mF1=knn_mean(SMF_template,inmcm4_new_mrsosf1,1);
inmcm4_new_mF2=knn_mean(SMF_template,inmcm4_new_mrsosf2,1);
inmcm4_new_mF3=knn_mean(SMF_template,inmcm4_new_mrsosf3,1);

% % ET_n of Institute_for_Numerical_Mathematics (hfls)
% Get ET_n over different time scales
N=20440;
Fs=1;
inmcm4_hflsA(20440,21600)=0;
count=1;
for q=1:120
    for p=1:180
        C=hflsData(p,q,:);
        inmcm4_hflsA(:,count)=C(:);
        count=count+1;
    end
end
inmcm4_hflsA=single(inmcm4_hflsA);
[row,col] = size(inmcm4_hflsA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(inmcm4_hflsA(:,i));
end
dA=single(dA);
A1=dA(:,1:5400);
Y1=fft(A1);
Y1=Y1(1:10220,:);
Ayy1=abs(Y1).^2;
A2=dA(:,5401:10800);
Y2=fft(A2);
Y2=Y2(1:10220,:);
Ayy2=abs(Y2).^2;
A3=dA(:,10801:16200);
Y3=fft(A3);
Y3=Y3(1:10220,:);
Ayy3=abs(Y3).^2;
A4=dA(:,16201:21600);
Y4=fft(A4);
Y4=Y4(1:10220,:);
Ayy4=abs(Y4).^2;
inmcm4_hflsAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
inmcm4_hflsAyy=inmcm4_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
inmcm4_ybar1=sum(inmcm4_hflsAyy(b:a,:));
YBAR1=reshape(inmcm4_ybar1,[180,120]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
inmcm4_ybar2=sum(inmcm4_hflsAyy(c:b,:));
YBAR2=reshape(inmcm4_ybar2,[180,120]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
inmcm4_ybar3=sum(inmcm4_hflsAyy(d:c,:));
YBAR3=reshape(inmcm4_ybar3,[180,120]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
inmcm4_hflsf1=inmcm4_ybar1./(inmcm4_ybar1+inmcm4_ybar2+inmcm4_ybar3);
inmcm4_hflsf2=inmcm4_ybar2./(inmcm4_ybar1+inmcm4_ybar2+inmcm4_ybar3);
inmcm4_hflsf3=inmcm4_ybar3./(inmcm4_ybar1+inmcm4_ybar2+inmcm4_ybar3);
% Model's ET_n with the original spatial resolution
inmcm4_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
inmcm4_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
inmcm4_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
inmcm4_new_hflsf1=SMAP_resolution(SMAP1,inmcm4_hflsf1,inmcm4_latData,inmcm4_lonData);
inmcm4_new_hflsf2=SMAP_resolution(SMAP2,inmcm4_hflsf2,inmcm4_latData,inmcm4_lonData);
inmcm4_new_hflsf3=SMAP_resolution(SMAP3,inmcm4_hflsf3,inmcm4_latData,inmcm4_lonData);
% Change model's ET_n has same surface coverage as SMAP
inmcm4_new_hF1=knn_mean(SMF_template,inmcm4_new_hflsf1,1);
inmcm4_new_hF2=knn_mean(SMF_template,inmcm4_new_hflsf2,1);
inmcm4_new_hF3=knn_mean(SMF_template,inmcm4_new_hflsf3,1);

% % P_n of Institute_for_Numerical_Mathematics (pr)
% Get P_n over different time scales
N=20440;
Fs=1;
inmcm4_prA(20440,21600)=0;
count=1;
for q=1:120
    for p=1:180
        C=prData(p,q,:);
        inmcm4_prA(:,count)=C(:);
        count=count+1;
    end
end
inmcm4_prA=single(inmcm4_prA);
[row,col] = size(inmcm4_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(inmcm4_prA(:,i));
end
dA=single(dA);
A1=dA(:,1:5400);
Y1=fft(A1);
Y1=Y1(1:10220,:);
Ayy1=abs(Y1).^2;
A2=dA(:,5401:10800);
Y2=fft(A2);
Y2=Y2(1:10220,:);
Ayy2=abs(Y2).^2;
A3=dA(:,10801:16200);
Y3=fft(A3);
Y3=Y3(1:10220,:);
Ayy3=abs(Y3).^2;
A4=dA(:,16201:21600);
Y4=fft(A4);
Y4=Y4(1:10220,:);
Ayy4=abs(Y4).^2;
inmcm4_prAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
inmcm4_prAyy=inmcm4_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
inmcm4_ybar1=sum(inmcm4_prAyy(b:a,:));
YBAR1=reshape(inmcm4_ybar1,[180,120]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
inmcm4_ybar2=sum(inmcm4_prAyy(c:b,:));
YBAR2=reshape(inmcm4_ybar2,[180,120]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
inmcm4_ybar3=sum(inmcm4_prAyy(d:c,:));
YBAR3=reshape(inmcm4_ybar3,[180,120]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
inmcm4_prf1=inmcm4_ybar1./(inmcm4_ybar1+inmcm4_ybar2+inmcm4_ybar3);
inmcm4_prf2=inmcm4_ybar2./(inmcm4_ybar1+inmcm4_ybar2+inmcm4_ybar3);
inmcm4_prf3=inmcm4_ybar3./(inmcm4_ybar1+inmcm4_ybar2+inmcm4_ybar3);
% Model's Pr_n with the original spatial resolution
inmcm4_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
inmcm4_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
inmcm4_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
inmcm4_new_prf1=SMAP_resolution(SMAP1,inmcm4_prf1,inmcm4_latData,inmcm4_lonData);
inmcm4_new_prf2=SMAP_resolution(SMAP2,inmcm4_prf2,inmcm4_latData,inmcm4_lonData);
inmcm4_new_prf3=SMAP_resolution(SMAP3,inmcm4_prf3,inmcm4_latData,inmcm4_lonData);
% Change model's ET_n has same surface coverage as SMAP
inmcm4_new_pF1=knn_mean(SMF_template,inmcm4_new_prf1,1);
inmcm4_new_pF2=knn_mean(SMF_template,inmcm4_new_prf2,1);
inmcm4_new_pF3=knn_mean(SMF_template,inmcm4_new_prf3,1);

% % % Spectral slope of inmcm4 (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=20440;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
% % SSM_kw of inmcm4 (mrsos)
% Get SSM_kw over different time scales
[inmcm4_mrsosp1,inmcm4_mrsosP1]=spectral_slope(inmcm4_mrsosA,inmcm4_latData,inmcm4_lonData,b,a,N,Fs);
[inmcm4_mrsosp2,inmcm4_mrsosP2]=spectral_slope(inmcm4_mrsosA,inmcm4_latData,inmcm4_lonData,c,b,N,Fs);
[inmcm4_mrsosp3,inmcm4_mrsosP3]=spectral_slope(inmcm4_mrsosA,inmcm4_latData,inmcm4_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
inmcm4_new_mrsosp1=SMAP_resolution(SMAP1,inmcm4_mrsosp1,inmcm4_latData,inmcm4_lonData);
inmcm4_new_mrsosp2=SMAP_resolution(SMAP2,inmcm4_mrsosp2,inmcm4_latData,inmcm4_lonData);
inmcm4_new_mrsosp3=SMAP_resolution(SMAP3,inmcm4_mrsosp3,inmcm4_latData,inmcm4_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
inmcm4_new_mP1=knn_mean(SMF_template,inmcm4_new_mrsosp1,1);
inmcm4_new_mP2=knn_mean(SMF_template,inmcm4_new_mrsosp2,1);
inmcm4_new_mP3=knn_mean(SMF_template,inmcm4_new_mrsosp3,1);
% % ET_kw of inmcm4 (hfls)
% Get ET_kw over different time scales
[inmcm4_hflsp1,inmcm4_hflsP1]=spectral_slope(inmcm4_hflsA,inmcm4_latData,inmcm4_lonData,b,a,N,Fs);
[inmcm4_hflsp2,inmcm4_hflsP2]=spectral_slope(inmcm4_hflsA,inmcm4_latData,inmcm4_lonData,c,b,N,Fs);
[inmcm4_hflsp3,inmcm4_hflsP3]=spectral_slope(inmcm4_hflsA,inmcm4_latData,inmcm4_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
inmcm4_new_hflsp1=SMAP_resolution(SMAP1,inmcm4_hflsp1,inmcm4_latData,inmcm4_lonData);
inmcm4_new_hflsp2=SMAP_resolution(SMAP2,inmcm4_hflsp2,inmcm4_latData,inmcm4_lonData);
inmcm4_new_hflsp3=SMAP_resolution(SMAP3,inmcm4_hflsp3,inmcm4_latData,inmcm4_lonData);
% Change model's ET_kw has same surface coverage as SMAP
inmcm4_new_hP1=knn_mean(SMF_template,inmcm4_new_hflsp1,1);
inmcm4_new_hP2=knn_mean(SMF_template,inmcm4_new_hflsp2,1);
inmcm4_new_hP3=knn_mean(SMF_template,inmcm4_new_hflsp3,1);
% % Pr_kw of inmcm4 (pr)
% GPr Pr_kw over different time scales
[inmcm4_prp1,inmcm4_prP1]=spectral_slope(inmcm4_prA,inmcm4_latData,inmcm4_lonData,b,a,N,Fs);
[inmcm4_prp2,inmcm4_prP2]=spectral_slope(inmcm4_prA,inmcm4_latData,inmcm4_lonData,c,b,N,Fs);
[inmcm4_prp3,inmcm4_prP3]=spectral_slope(inmcm4_prA,inmcm4_latData,inmcm4_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
inmcm4_new_prp1=SMAP_resolution(SMAP1,inmcm4_prp1,inmcm4_latData,inmcm4_lonData);
inmcm4_new_prp2=SMAP_resolution(SMAP2,inmcm4_prp2,inmcm4_latData,inmcm4_lonData);
inmcm4_new_prp3=SMAP_resolution(SMAP3,inmcm4_prp3,inmcm4_latData,inmcm4_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
inmcm4_new_pP1=knn_mean(SMF_template,inmcm4_new_prp1,1);
inmcm4_new_pP2=knn_mean(SMF_template,inmcm4_new_prp2,1);
inmcm4_new_pP3=knn_mean(SMF_template,inmcm4_new_prp3,1);