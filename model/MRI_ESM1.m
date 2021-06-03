% % SSM_n of MRI_ESM1 (mrsos)
% Get SSM_n over different time scales
N=20454;
Fs=1;
MRI_ESM1_mrsosA1(10957,51200)=0;
count=1;
for q=1:160
    for p=1:320
        C=mrsosData123(p,q,:);
        MRI_ESM1_mrsosA1(:,count)=C(:);
        count=count+1;
    end
end
MRI_ESM1_mrsosA1(MRI_ESM1_mrsosA1==0)=nan;
MRI_ESM1_mrsosA1=single(MRI_ESM1_mrsosA1);
[row,col] = size(MRI_ESM1_mrsosA1);
dA1(row,col)=0;
for i=1:col
    dA1(:,i)=detrend(MRI_ESM1_mrsosA1(:,i));
end
dA1=single(dA1);
MRI_ESM1_mrsosA2(9497,51200)=0;
for q=1:160
    for p=1:320
        C=mrsosData456(p,q,:);
        MRI_ESM1_mrsosA2(:,count)=C(:);
        count=count+1;
    end
end
MRI_ESM1_mrsosA2(MRI_ESM1_mrsosA2==0)=nan;
MRI_ESM1_mrsosA2=single(MRI_ESM1_mrsosA2);
[row,col] = size(MRI_ESM1_mrsosA2);
dA2(row,col)=0;
for i=1:col
    dA2(:,i)=detrend(MRI_ESM1_mrsosA2(:,i));
end
dA2=single(dA2);
A11=dA1(:,1:12800);
A12=dA1(:,12801:25600);
A13=dA1(:,25601:38400);
A14=dA1(:,38401:51200);
A21=dA2(:,1:12800);
A22=dA2(:,12801:25600);
A23=dA2(:,25601:38400);
A24=dA2(:,38401:51200);
A1121=[A11;A21];
Y1=fft(A1121);
Y1=Y1(1:10227,:);
Ayy1=abs(Y1).^2;
A1222=[A12;A22];
Y2=fft(A1222);
Y2=Y2(1:10227,:);
Ayy2=abs(Y2).^2;
A1323=[A13;A23];
Y3=fft(A1323);
Y3=Y3(1:10227,:);
Ayy3=abs(Y3).^2;
A1424=[A14;A24];
Y4=fft(A1424);
Y4=Y4(1:10227,:);
Ayy4=abs(Y4).^2;
MRI_ESM1_mrsosAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
MRI_ESM1_mrsosAyy=MRI_ESM1_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
MRI_ESM1_ybar1=sum(MRI_ESM1_mrsosAyy(b:a,:));
YBAR1=reshape(MRI_ESM1_ybar1,[320,160]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
MRI_ESM1_ybar2=sum(MRI_ESM1_mrsosAyy(c:b,:));
YBAR2=reshape(MRI_ESM1_ybar2,[320,160]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
MRI_ESM1_ybar3=sum(MRI_ESM1_mrsosAyy(d:c,:));
YBAR3=reshape(MRI_ESM1_ybar3,[320,160]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
MRI_ESM1_mrsosf1=MRI_ESM1_ybar1./(MRI_ESM1_ybar1+MRI_ESM1_ybar2+MRI_ESM1_ybar3);
MRI_ESM1_mrsosf2=MRI_ESM1_ybar2./(MRI_ESM1_ybar1+MRI_ESM1_ybar2+MRI_ESM1_ybar3);
MRI_ESM1_mrsosf3=MRI_ESM1_ybar3./(MRI_ESM1_ybar1+MRI_ESM1_ybar2+MRI_ESM1_ybar3);
% Model's SSM_n with the original spatial resolution
MRI_ESM1_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
MRI_ESM1_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
MRI_ESM1_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
MRI_ESM1_new_mrsosf1=SMAP_resolution(SMAP1,MRI_ESM1_mrsosf1,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_mrsosf2=SMAP_resolution(SMAP2,MRI_ESM1_mrsosf2,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_mrsosf3=SMAP_resolution(SMAP3,MRI_ESM1_mrsosf3,MRI_ESM1_latData,MRI_ESM1_lonData);
% Change model's SSM_n has same surface coverage as SMAP
MRI_ESM1_new_mF1=knn_mean(SMF_template,MRI_ESM1_new_mrsosf1,1);
MRI_ESM1_new_mF2=knn_mean(SMF_template,MRI_ESM1_new_mrsosf2,1);
MRI_ESM1_new_mF3=knn_mean(SMF_template,MRI_ESM1_new_mrsosf3,1);

% % ET_n of MRI_ESM1 (hfls)
% Get ET_n over different time scales
N=20454;
Fs=1;
MRI_ESM1_hflsA1(10957,51200)=0;
count=1;
for q=1:160
    for p=1:320
        C=hflsData123(p,q,:);
        MRI_ESM1_hflsA1(:,count)=C(:);
        count=count+1;
    end
end
MRI_ESM1_hflsA1=single(MRI_ESM1_hflsA1);
[row,col] = size(MRI_ESM1_hflsA1);
dA1(row,col)=0;
for i=1:col
    dA1(:,i)=detrend(MRI_ESM1_hflsA1(:,i));
end
dA1=single(dA1);
MRI_ESM1_hflsA2(9497,51200)=0;
for q=1:160
    for p=1:320
        C=hflsData456(p,q,:);
        MRI_ESM1_hflsA2(:,count)=C(:);
        count=count+1;
    end
end
MRI_ESM1_hflsA2=single(MRI_ESM1_hflsA2);
[row,col] = size(MRI_ESM1_hflsA2);
dA2(row,col)=0;
for i=1:col
    dA2(:,i)=detrend(MRI_ESM1_hflsA2(:,i));
end
dA2=single(dA2);
A11=dA1(:,1:12800);
A12=dA1(:,12801:25600);
A13=dA1(:,25601:38400);
A14=dA1(:,38401:51200);
A21=dA2(:,1:12800);
A22=dA2(:,12801:25600);
A23=dA2(:,25601:38400);
A24=dA2(:,38401:51200);
A1121=[A11;A21];
Y1=fft(A1121);
Y1=Y1(1:10227,:);
Ayy1=abs(Y1).^2;
A1222=[A12;A22];
Y2=fft(A1222);
Y2=Y2(1:10227,:);
Ayy2=abs(Y2).^2;
A1323=[A13;A23];
Y3=fft(A1323);
Y3=Y3(1:10227,:);
Ayy3=abs(Y3).^2;
A1424=[A14;A24];
Y4=fft(A1424);
Y4=Y4(1:10227,:);
Ayy4=abs(Y4).^2;
MRI_ESM1_hflsAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
MRI_ESM1_hflsAyy=MRI_ESM1_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
MRI_ESM1_ybar1=sum(MRI_ESM1_hflsAyy(b:a,:));
YBAR1=reshape(MRI_ESM1_ybar1,[320,160]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
MRI_ESM1_ybar2=sum(MRI_ESM1_hflsAyy(c:b,:));
YBAR2=reshape(MRI_ESM1_ybar2,[320,160]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
MRI_ESM1_ybar3=sum(MRI_ESM1_hflsAyy(d:c,:));
YBAR3=reshape(MRI_ESM1_ybar3,[320,160]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
MRI_ESM1_hflsf1=MRI_ESM1_ybar1./(MRI_ESM1_ybar1+MRI_ESM1_ybar2+MRI_ESM1_ybar3);
MRI_ESM1_hflsf2=MRI_ESM1_ybar2./(MRI_ESM1_ybar1+MRI_ESM1_ybar2+MRI_ESM1_ybar3);
MRI_ESM1_hflsf3=MRI_ESM1_ybar3./(MRI_ESM1_ybar1+MRI_ESM1_ybar2+MRI_ESM1_ybar3);
% Model's ET_n with the original spatial resolution
MRI_ESM1_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
MRI_ESM1_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
MRI_ESM1_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
MRI_ESM1_new_hflsf1=SMAP_resolution(SMAP1,MRI_ESM1_hflsf1,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_hflsf2=SMAP_resolution(SMAP2,MRI_ESM1_hflsf2,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_hflsf3=SMAP_resolution(SMAP3,MRI_ESM1_hflsf3,MRI_ESM1_latData,MRI_ESM1_lonData);
% Change model's ET_n has same surface coverage as SMAP
MRI_ESM1_new_hF1=knn_mean(SMF_template,MRI_ESM1_new_hflsf1,1);
MRI_ESM1_new_hF2=knn_mean(SMF_template,MRI_ESM1_new_hflsf2,1);
MRI_ESM1_new_hF3=knn_mean(SMF_template,MRI_ESM1_new_hflsf3,1);

% % P_n of MRI_ESM1 (pr)
% Get P_n over different time scales
N=20089;
Fs=1;
MRI_ESM1_prA1(10958,51200)=0;
count=1;
for q=1:160
    for p=1:320
        C=prData123(p,q,:);
        MRI_ESM1_prA1(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
MRI_ESM1_prA1=single(MRI_ESM1_prA1);
[row,col] = size(MRI_ESM1_prA1);
dA1(row,col)=0;
for i=1:col
    dA1(:,i)=detrend(MRI_ESM1_prA1(:,i));
end
dA1=single(dA1);
MRI_ESM1_prA2(9131,51200)=0;
count=1;
for q=1:160
    for p=1:320
        C=prData456(p,q,:);
        MRI_ESM1_prA2(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
MRI_ESM1_prA2=single(MRI_ESM1_prA2);
A=[MRI_ESM1_prA1;MRI_ESM1_prA2];
[row,col] = size(MRI_ESM1_prA2);
dA2(row,col)=0;
for i=1:col
    dA2(:,i)=detrend(MRI_ESM1_prA2(:,i));
end
dA2=single(dA2);
A11=dA1(:,1:12800);
A12=dA1(:,12801:25600);
A13=dA1(:,25601:38400);
A14=dA1(:,38401:51200);
A21=dA2(:,1:12800);
A22=dA2(:,12801:25600);
A23=dA2(:,25601:38400);
A24=dA2(:,38401:51200);
A1121=[A11;A21];
Y1=fft(A1121);
Y1=Y1(1:10227,:);
Ayy1=abs(Y1).^2;
A1222=[A12;A22];
Y2=fft(A1222);
Y2=Y2(1:10227,:);
Ayy2=abs(Y2).^2;
A1323=[A13;A23];
Y3=fft(A1323);
Y3=Y3(1:10227,:);
Ayy3=abs(Y3).^2;
A1424=[A14;A24];
Y4=fft(A1424);
Y4=Y4(1:10227,:);
Ayy4=abs(Y4).^2;
MRI_ESM1_prAyy=[Ayy1,Ayy2,Ayy3,Ayy4];
MRI_ESM1_prAyy=MRI_ESM1_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
MRI_ESM1_ybar1=sum(MRI_ESM1_prAyy(b:a,:));
YBAR1=reshape(MRI_ESM1_ybar1,[320,160]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
MRI_ESM1_ybar2=sum(MRI_ESM1_prAyy(c:b,:));
YBAR2=reshape(MRI_ESM1_ybar2,[320,160]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
MRI_ESM1_ybar3=sum(MRI_ESM1_prAyy(d:c,:));
YBAR3=reshape(MRI_ESM1_ybar3,[320,160]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
MRI_ESM1_prf1=MRI_ESM1_ybar1./(MRI_ESM1_ybar1+MRI_ESM1_ybar2+MRI_ESM1_ybar3);
MRI_ESM1_prf2=MRI_ESM1_ybar2./(MRI_ESM1_ybar1+MRI_ESM1_ybar2+MRI_ESM1_ybar3);
MRI_ESM1_prf3=MRI_ESM1_ybar3./(MRI_ESM1_ybar1+MRI_ESM1_ybar2+MRI_ESM1_ybar3);
% Model's Pr_n with the original spatial resolution
MRI_ESM1_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
MRI_ESM1_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
MRI_ESM1_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
MRI_ESM1_new_prf1=SMAP_resolution(SMAP1,MRI_ESM1_prf1,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_prf2=SMAP_resolution(SMAP2,MRI_ESM1_prf2,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_prf3=SMAP_resolution(SMAP3,MRI_ESM1_prf3,MRI_ESM1_latData,MRI_ESM1_lonData);
% Change model's ET_n has same surface coverage as SMAP
MRI_ESM1_new_pF1=knn_mean(SMF_template,MRI_ESM1_new_prf1,1);
MRI_ESM1_new_pF2=knn_mean(SMF_template,MRI_ESM1_new_prf2,1);
MRI_ESM1_new_pF3=knn_mean(SMF_template,MRI_ESM1_new_prf3,1);

% % % Spectral slope of MRI_ESM1 (SSM_kw, ET_kw, Pr_kw)
% % SSM_kw of MRI_ESM1 (mrsos)
% get the cutoff frequencies
N=20454;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
% Get SSM_kw over different time scales
[MRI_ESM1_mrsosp1,MRI_ESM1_mrsosP1]=spectral_slope(MRI_ESM1_mrsosA,MRI_ESM1_latData,MRI_ESM1_lonData,b,a,N,Fs);
[MRI_ESM1_mrsosp2,MRI_ESM1_mrsosP2]=spectral_slope(MRI_ESM1_mrsosA,MRI_ESM1_latData,MRI_ESM1_lonData,c,b,N,Fs);
[MRI_ESM1_mrsosp3,MRI_ESM1_mrsosP3]=spectral_slope(MRI_ESM1_mrsosA,MRI_ESM1_latData,MRI_ESM1_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
MRI_ESM1_new_mrsosp1=SMAP_resolution(SMAP1,MRI_ESM1_mrsosp1,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_mrsosp2=SMAP_resolution(SMAP2,MRI_ESM1_mrsosp2,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_mrsosp3=SMAP_resolution(SMAP3,MRI_ESM1_mrsosp3,MRI_ESM1_latData,MRI_ESM1_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
MRI_ESM1_new_mP1=knn_mean(SMF_template,MRI_ESM1_new_mrsosp1,1);
MRI_ESM1_new_mP2=knn_mean(SMF_template,MRI_ESM1_new_mrsosp2,1);
MRI_ESM1_new_mP3=knn_mean(SMF_template,MRI_ESM1_new_mrsosp3,1);
% % ET_kw of MRI_ESM1 (hfls)
% get the cutoff frequencies
N=20454;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00001);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
% Get ET_kw over different time scales
[MRI_ESM1_hflsp1,MRI_ESM1_hflsP1]=spectral_slope(MRI_ESM1_hflsA,MRI_ESM1_latData,MRI_ESM1_lonData,b,a,N,Fs);
[MRI_ESM1_hflsp2,MRI_ESM1_hflsP2]=spectral_slope(MRI_ESM1_hflsA,MRI_ESM1_latData,MRI_ESM1_lonData,c,b,N,Fs);
[MRI_ESM1_hflsp3,MRI_ESM1_hflsP3]=spectral_slope(MRI_ESM1_hflsA,MRI_ESM1_latData,MRI_ESM1_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
MRI_ESM1_new_hflsp1=SMAP_resolution(SMAP1,MRI_ESM1_hflsp1,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_hflsp2=SMAP_resolution(SMAP2,MRI_ESM1_hflsp2,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_hflsp3=SMAP_resolution(SMAP3,MRI_ESM1_hflsp3,MRI_ESM1_latData,MRI_ESM1_lonData);
% Change model's ET_kw has same surface coverage as SMAP
MRI_ESM1_new_hP1=knn_mean(SMF_template,MRI_ESM1_new_hflsp1,1);
MRI_ESM1_new_hP2=knn_mean(SMF_template,MRI_ESM1_new_hflsp2,1);
MRI_ESM1_new_hP3=knn_mean(SMF_template,MRI_ESM1_new_hflsp3,1);
% % Pr_kw of MRI_ESM1 (pr)
% get the cutoff frequencies
N=20089;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00002);
d=find(abs(x-1/365)<=0.00001);
% % GPr Pr_kw over different time scales
[MRI_ESM1_prp1,MRI_ESM1_prP1]=spectral_slope(MRI_ESM1_prA,MRI_ESM1_latData,MRI_ESM1_lonData,b,a,N,Fs);
[MRI_ESM1_prp2,MRI_ESM1_prP2]=spectral_slope(MRI_ESM1_prA,MRI_ESM1_latData,MRI_ESM1_lonData,c,b,N,Fs);
[MRI_ESM1_prp3,MRI_ESM1_prP3]=spectral_slope(MRI_ESM1_prA,MRI_ESM1_latData,MRI_ESM1_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
MRI_ESM1_new_prp1=SMAP_resolution(SMAP1,MRI_ESM1_prp1,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_prp2=SMAP_resolution(SMAP2,MRI_ESM1_prp2,MRI_ESM1_latData,MRI_ESM1_lonData);
MRI_ESM1_new_prp3=SMAP_resolution(SMAP3,MRI_ESM1_prp3,MRI_ESM1_latData,MRI_ESM1_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
MRI_ESM1_new_pP1=knn_mean(SMF_template,MRI_ESM1_new_prp1,1);
MRI_ESM1_new_pP2=knn_mean(SMF_template,MRI_ESM1_new_prp2,1);
MRI_ESM1_new_pP3=knn_mean(SMF_template,MRI_ESM1_new_prp3,1);