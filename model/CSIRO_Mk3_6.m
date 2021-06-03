% % SSM_n of CSIRO_Mk3.6 (mrsos)
% Get SSM_n over different time scales
N=56940;
Fs=1;
CSIRO_Mk_mrsosA1(29200,18432)=0;
count=1;
for q=1:96
    for p=1:192
        C=mrsosData1234(p,q,:);
        CSIRO_Mk_mrsosA1(:,count)=C(:);
        count=count+1;
    end
end
CSIRO_Mk_mrsosA1(CSIRO_Mk_mrsosA1==3.395080566406250e-04)=nan;
CSIRO_Mk_mrsosA1=single(CSIRO_Mk_mrsosA1);
[row,col] = size(CSIRO_Mk_mrsosA1);
dA1(row,col)=0;
for i=1:col
    dA1(:,i)=detrend(CSIRO_Mk_mrsosA1(:,i));
end
dA1=single(dA1);
CSIRO_Mk_mrsosA2(27740,18432)=0;
for q=1:96
    for p=1:192
        C=mrsosData5678(p,q,:);
        CSIRO_Mk_mrsosA2(:,count)=C(:);
        count=count+1;
    end
end
CSIRO_Mk_mrsosA2(CSIRO_Mk_mrsosA2==3.395080566406250e-04)=nan;
CSIRO_Mk_mrsosA2=single(CSIRO_Mk_mrsosA2);
[row,col] = size(CSIRO_Mk_mrsosA2);
dA2(row,col)=0;
for i=1:col
    dA2(:,i)=detrend(CSIRO_Mk_mrsosA2(:,i));
end
dA2=single(dA2);
A11=dA1(:,1:4608);
A12=dA1(:,4609:9216);
A13=dA1(:,9217:13824);
A14=dA1(:,13825:18432);
A21=dA2(:,1:4608);
A22=dA2(:,4609:9216);
A23=dA2(:,9217:13824);
A24=dA2(:,13825:18432);
A1121=[A11;A21];
Y1=fft(A1121);
Y1=Y1(1:28470,:);
Ayy1=abs(Y1).^2;
A1222=[A12;A22];
Y2=fft(A1222);
Y2=Y2(1:28470,:);
Ayy2=abs(Y2).^2;
A1323=[A13;A23];
Y3=fft(A1323);
Y3=Y3(1:28470,:);
Ayy3=abs(Y3).^2;
A1424=[A14;A24];
Y4=fft(A1424);
Y4=Y4(1:28470,:);
Ayy4=abs(Y4).^2;
CSIRO_Mk_mrsosAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
CSIRO_Mk_mrsosAyy=CSIRO_Mk_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
CSIRO_Mk_ybar1=sum(CSIRO_Mk_mrsosAyy(b:a,:));
YBAR1=reshape(CSIRO_Mk_ybar1,[192,96]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
CSIRO_Mk_ybar2=sum(CSIRO_Mk_mrsosAyy(c:b,:));
YBAR2=reshape(CSIRO_Mk_ybar2,[192,96]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
CSIRO_Mk_ybar3=sum(CSIRO_Mk_mrsosAyy(d:c,:));
YBAR3=reshape(CSIRO_Mk_ybar3,[192,96]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
CSIRO_Mk_mrsosf1=CSIRO_Mk_ybar1./(CSIRO_Mk_ybar1+CSIRO_Mk_ybar2+CSIRO_Mk_ybar3);
CSIRO_Mk_mrsosf2=CSIRO_Mk_ybar2./(CSIRO_Mk_ybar1+CSIRO_Mk_ybar2+CSIRO_Mk_ybar3);
CSIRO_Mk_mrsosf3=CSIRO_Mk_ybar3./(CSIRO_Mk_ybar1+CSIRO_Mk_ybar2+CSIRO_Mk_ybar3);
% Model's SSM_n with the original spatial resolution
CSIRO_Mk_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
CSIRO_Mk_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
CSIRO_Mk_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
CSIRO_Mk_new_mrsosf1=SMAP_resolution(SMAP1,CSIRO_Mk_mrsosf1,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_mrsosf2=SMAP_resolution(SMAP2,CSIRO_Mk_mrsosf2,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_mrsosf3=SMAP_resolution(SMAP3,CSIRO_Mk_mrsosf3,CSIRO_Mk_latData,CSIRO_Mk_lonData);
% Change model's SSM_n has same surface coverage as SMAP
CSIRO_Mk_new_mF1=knn_mean(SMF_template,CSIRO_Mk_new_mrsosf1,1);
CSIRO_Mk_new_mF2=knn_mean(SMF_template,CSIRO_Mk_new_mrsosf2,1);
CSIRO_Mk_new_mF3=knn_mean(SMF_template,CSIRO_Mk_new_mrsosf3,1);

% % ET_n of CSIRO_Mk3.6 (hfls)
% Get ET_n over different time scales
N=56940;
Fs=1;
CSIRO_Mk_hflsA1(29200,18432)=0;
count=1;
for q=1:96
    for p=1:192
        C=hflsData1234(p,q,:);
        CSIRO_Mk_hflsA1(:,count)=C(:);
        count=count+1;
    end
end
CSIRO_Mk_hflsA1=single(CSIRO_Mk_hflsA1);
[row,col] = size(CSIRO_Mk_hflsA1);
dA1(row,col)=0;
for i=1:col
    dA1(:,i)=detrend(CSIRO_Mk_hflsA1(:,i));
end
dA1=single(dA1);
CSIRO_Mk_hflsA2(27740,18432)=0;
for q=1:96
    for p=1:192
        C=hflsData5678(p,q,:);
        CSIRO_Mk_hflsA2(:,count)=C(:);
        count=count+1;
    end
end
CSIRO_Mk_hflsA2=single(CSIRO_Mk_hflsA2);
[row,col] = size(CSIRO_Mk_hflsA2);
dA2(row,col)=0;
for i=1:col
    dA2(:,i)=detrend(CSIRO_Mk_hflsA2(:,i));
end
dA2=single(dA2);
A11=dA1(:,1:4608);
A12=dA1(:,4609:9216);
A13=dA1(:,9217:13824);
A14=dA1(:,13825:18432);
A21=dA2(:,1:4608);
A22=dA2(:,4609:9216);
A23=dA2(:,9217:13824);
A24=dA2(:,13825:18432);
A1121=[A11;A21];
Y1=fft(A1121);
Y1=Y1(1:28470,:);
Ayy1=abs(Y1).^2;
A1222=[A12;A22];
Y2=fft(A1222);
Y2=Y2(1:28470,:);
Ayy2=abs(Y2).^2;
A1323=[A13;A23];
Y3=fft(A1323);
Y3=Y3(1:28470,:);
Ayy3=abs(Y3).^2;
A1424=[A14;A24];
Y4=fft(A1424);
Y4=Y4(1:28470,:);
Ayy4=abs(Y4).^2;
CSIRO_Mk_hflsAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
CSIRO_Mk_hflsAyy=CSIRO_Mk_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
CSIRO_Mk_ybar1=sum(CSIRO_Mk_hflsAyy(b:a,:));
YBAR1=reshape(CSIRO_Mk_ybar1,[192,96]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
CSIRO_Mk_ybar2=sum(CSIRO_Mk_hflsAyy(c:b,:));
YBAR2=reshape(CSIRO_Mk_ybar2,[192,96]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
CSIRO_Mk_ybar3=sum(CSIRO_Mk_hflsAyy(d:c,:));
YBAR3=reshape(CSIRO_Mk_ybar3,[192,96]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
CSIRO_Mk_hflsf1=CSIRO_Mk_ybar1./(CSIRO_Mk_ybar1+CSIRO_Mk_ybar2+CSIRO_Mk_ybar3);
CSIRO_Mk_hflsf2=CSIRO_Mk_ybar2./(CSIRO_Mk_ybar1+CSIRO_Mk_ybar2+CSIRO_Mk_ybar3);
CSIRO_Mk_hflsf3=CSIRO_Mk_ybar3./(CSIRO_Mk_ybar1+CSIRO_Mk_ybar2+CSIRO_Mk_ybar3);
% Model's ET_n with the original spatial resolution
CSIRO_Mk_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
CSIRO_Mk_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
CSIRO_Mk_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
CSIRO_Mk_new_hflsf1=SMAP_resolution(SMAP1,CSIRO_Mk_hflsf1,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_hflsf2=SMAP_resolution(SMAP2,CSIRO_Mk_hflsf2,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_hflsf3=SMAP_resolution(SMAP3,CSIRO_Mk_hflsf3,CSIRO_Mk_latData,CSIRO_Mk_lonData);
% Change model's ET_n has same surface coverage as SMAP
CSIRO_Mk_new_hF1=knn_mean(SMF_template,CSIRO_Mk_new_hflsf1,1);
CSIRO_Mk_new_hF2=knn_mean(SMF_template,CSIRO_Mk_new_hflsf2,1);
CSIRO_Mk_new_hF3=knn_mean(SMF_template,CSIRO_Mk_new_hflsf3,1);

% % P_n of CSIRO_Mk3.6 (pr)
% Get P_n over different time scales
N=56940;
Fs=1;
CSIRO_Mk_prA1(29200,18432)=0;
count=1;
for q=1:96
    for p=1:192
        C=prData1234(p,q,:);
        CSIRO_Mk_prA1(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
CSIRO_Mk_prA1=single(CSIRO_Mk_prA1);
[row,col] = size(CSIRO_Mk_prA1);
dA1(row,col)=0;
for i=1:col
    dA1(:,i)=detrend(CSIRO_Mk_prA1(:,i));
end
dA1=single(dA1);
count=1;
CSIRO_Mk_prA2(27740,18432)=0;
for q=1:96
    for p=1:192
        C=prData5678(p,q,:);
        CSIRO_Mk_prA2(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
CSIRO_Mk_prA2=single(CSIRO_Mk_prA2);
A=[CSIRO_Mk_prA1;CSIRO_Mk_prA2];
[row,col] = size(CSIRO_Mk_prA2);
dA2(row,col)=0;
for i=1:col
    dA2(:,i)=detrend(CSIRO_Mk_prA2(:,i));
end
dA2=single(dA2);
A11=dA1(:,1:4608);
A12=dA1(:,4609:9216);
A13=dA1(:,9217:13824);
A14=dA1(:,13825:18432);
A21=dA2(:,1:4608);
A22=dA2(:,4609:9216);
A23=dA2(:,9217:13824);
A24=dA2(:,13825:18432);
A1121=[A11;A21];
Y1=fft(A1121);
Y1=Y1(1:28470,:);
Ayy1=abs(Y1).^2;
A1222=[A12;A22];
Y2=fft(A1222);
Y2=Y2(1:28470,:);
Ayy2=abs(Y2).^2;
A1323=[A13;A23];
Y3=fft(A1323);
Y3=Y3(1:28470,:);
Ayy3=abs(Y3).^2;
A1424=[A14;A24];
Y4=fft(A1424);
Y4=Y4(1:28470,:);
Ayy4=abs(Y4).^2;
CSIRO_Mk_prAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
CSIRO_Mk_prAyy=CSIRO_Mk_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
CSIRO_Mk_ybar1=sum(CSIRO_Mk_prAyy(b:a,:));
YBAR1=reshape(CSIRO_Mk_ybar1,[192,96]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
CSIRO_Mk_ybar2=sum(CSIRO_Mk_prAyy(c:b,:));
YBAR2=reshape(CSIRO_Mk_ybar2,[192,96]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
CSIRO_Mk_ybar3=sum(CSIRO_Mk_prAyy(d:c,:));
YBAR3=reshape(CSIRO_Mk_ybar3,[192,96]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
CSIRO_Mk_prf1=CSIRO_Mk_ybar1./(CSIRO_Mk_ybar1+CSIRO_Mk_ybar2+CSIRO_Mk_ybar3);
CSIRO_Mk_prf2=CSIRO_Mk_ybar2./(CSIRO_Mk_ybar1+CSIRO_Mk_ybar2+CSIRO_Mk_ybar3);
CSIRO_Mk_prf3=CSIRO_Mk_ybar3./(CSIRO_Mk_ybar1+CSIRO_Mk_ybar2+CSIRO_Mk_ybar3);
% Model's Pr_n with the original spatial resolution
CSIRO_Mk_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
CSIRO_Mk_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
CSIRO_Mk_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's Pr_n to the same as SMAP
CSIRO_Mk_new_prf1=SMAP_resolution(SMAP1,CSIRO_Mk_prf1,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_prf2=SMAP_resolution(SMAP2,CSIRO_Mk_prf2,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_prf3=SMAP_resolution(SMAP3,CSIRO_Mk_prf3,CSIRO_Mk_latData,CSIRO_Mk_lonData);
% Change model's Pr_n has same surface coverage as SMAP
CSIRO_Mk_new_pF1=knn_mean(SMF_template,CSIRO_Mk_new_prf1,1);
CSIRO_Mk_new_pF2=knn_mean(SMF_template,CSIRO_Mk_new_prf2,1);
CSIRO_Mk_new_pF3=knn_mean(SMF_template,CSIRO_Mk_new_prf3,1);

% % % Spectral slope of CSIRO_Mk (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=56940;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
% % SSM_kw of CSIRO_Mk (mrsos)
% Get SSM_kw over different time scales
[CSIRO_Mk_mrsosp1,CSIRO_Mk_mrsosP1]=spectral_slope(CSIRO_Mk_mrsosA,CSIRO_Mk_latData,CSIRO_Mk_lonData,b,a,N,Fs);
[CSIRO_Mk_mrsosp2,CSIRO_Mk_mrsosP2]=spectral_slope(CSIRO_Mk_mrsosA,CSIRO_Mk_latData,CSIRO_Mk_lonData,c,b,N,Fs);
[CSIRO_Mk_mrsosp3,CSIRO_Mk_mrsosP3]=spectral_slope(CSIRO_Mk_mrsosA,CSIRO_Mk_latData,CSIRO_Mk_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
CSIRO_Mk_new_mrsosp1=SMAP_resolution(SMAP1,CSIRO_Mk_mrsosp1,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_mrsosp2=SMAP_resolution(SMAP2,CSIRO_Mk_mrsosp2,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_mrsosp3=SMAP_resolution(SMAP3,CSIRO_Mk_mrsosp3,CSIRO_Mk_latData,CSIRO_Mk_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
CSIRO_Mk_new_mP1=knn_mean(SMF_template,CSIRO_Mk_new_mrsosp1,1);
CSIRO_Mk_new_mP2=knn_mean(SMF_template,CSIRO_Mk_new_mrsosp2,1);
CSIRO_Mk_new_mP3=knn_mean(SMF_template,CSIRO_Mk_new_mrsosp3,1);
% % ET_kw of CSIRO_Mk (hfls)
% Get ET_kw over different time scales
[CSIRO_Mk_hflsp1,CSIRO_Mk_hflsP1]=spectral_slope(CSIRO_Mk_hflsA,CSIRO_Mk_latData,CSIRO_Mk_lonData,b,a,N,Fs);
[CSIRO_Mk_hflsp2,CSIRO_Mk_hflsP2]=spectral_slope(CSIRO_Mk_hflsA,CSIRO_Mk_latData,CSIRO_Mk_lonData,c,b,N,Fs);
[CSIRO_Mk_hflsp3,CSIRO_Mk_hflsP3]=spectral_slope(CSIRO_Mk_hflsA,CSIRO_Mk_latData,CSIRO_Mk_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
CSIRO_Mk_new_hflsp1=SMAP_resolution(SMAP1,CSIRO_Mk_hflsp1,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_hflsp2=SMAP_resolution(SMAP2,CSIRO_Mk_hflsp2,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_hflsp3=SMAP_resolution(SMAP3,CSIRO_Mk_hflsp3,CSIRO_Mk_latData,CSIRO_Mk_lonData);
% Change model's ET_kw has same surface coverage as SMAP
CSIRO_Mk_new_hP1=knn_mean(SMF_template,CSIRO_Mk_new_hflsp1,1);
CSIRO_Mk_new_hP2=knn_mean(SMF_template,CSIRO_Mk_new_hflsp2,1);
CSIRO_Mk_new_hP3=knn_mean(SMF_template,CSIRO_Mk_new_hflsp3,1);
% % Pr_kw of CSIRO_Mk (pr)
% GPr Pr_kw over different time scales
[CSIRO_Mk_prp1,CSIRO_Mk_prP1]=spectral_slope(CSIRO_Mk_prA,CSIRO_Mk_latData,CSIRO_Mk_lonData,b,a,N,Fs);
[CSIRO_Mk_prp2,CSIRO_Mk_prP2]=spectral_slope(CSIRO_Mk_prA,CSIRO_Mk_latData,CSIRO_Mk_lonData,c,b,N,Fs);
[CSIRO_Mk_prp3,CSIRO_Mk_prP3]=spectral_slope(CSIRO_Mk_prA,CSIRO_Mk_latData,CSIRO_Mk_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
CSIRO_Mk_new_prp1=SMAP_resolution(SMAP1,CSIRO_Mk_prp1,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_prp2=SMAP_resolution(SMAP2,CSIRO_Mk_prp2,CSIRO_Mk_latData,CSIRO_Mk_lonData);
CSIRO_Mk_new_prp3=SMAP_resolution(SMAP3,CSIRO_Mk_prp3,CSIRO_Mk_latData,CSIRO_Mk_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
CSIRO_Mk_new_pP1=knn_mean(SMF_template,CSIRO_Mk_new_prp1,1);
CSIRO_Mk_new_pP2=knn_mean(SMF_template,CSIRO_Mk_new_prp2,1);
CSIRO_Mk_new_pP3=knn_mean(SMF_template,CSIRO_Mk_new_prp3,1);