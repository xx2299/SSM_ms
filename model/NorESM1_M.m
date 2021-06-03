% % SSM_n of NorESM1_M (mrsos)
% Get SSM_n over different time scales
N=20440;
Fs=1;
NorESM1_M_mrsosA(20440,13824)=0;
count=1;
for q=1:96
    for p=1:144
        C=mrsosData(p,q,:);
        NorESM1_M_mrsosA(:,count)=C(:);
        count=count+1;
    end
end
NorESM1_M_mrsosA(NorESM1_M_mrsosA==0)=nan;
NorESM1_M_mrsosA=single(NorESM1_M_mrsosA);
[row,col] = size(NorESM1_M_mrsosA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(NorESM1_M_mrsosA(:,i));
end
dA=single(dA);
A1=dA(:,1:4608);
Y1=fft(A1);
Y1=Y1(1:10220,:);
A2=dA(:,4609:9216);
Y2=fft(A2);
Y2=Y2(1:10220,:);
A3=dA(:,9217:13824);
Y3=fft(A3);
Y3=Y3(1:10220,:);
Y=[Y1,Y2,Y3];
NorESM1_M_mrsosAyy=abs(Y).^2;
NorESM1_M_mrsosAyy=NorESM1_M_mrsosAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
NorESM1_M_ybar1=sum(NorESM1_M_mrsosAyy(b:a,:));
YBAR1=reshape(NorESM1_M_ybar1,[144,96]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
NorESM1_M_ybar2=sum(NorESM1_M_mrsosAyy(c:b,:));
YBAR2=reshape(NorESM1_M_ybar2,[144,96]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
NorESM1_M_ybar3=sum(NorESM1_M_mrsosAyy(d:c,:));
YBAR3=reshape(NorESM1_M_ybar3,[144,96]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
NorESM1_M_mrsosf1=NorESM1_M_ybar1./(NorESM1_M_ybar1+NorESM1_M_ybar2+NorESM1_M_ybar3);
NorESM1_M_mrsosf2=NorESM1_M_ybar2./(NorESM1_M_ybar1+NorESM1_M_ybar2+NorESM1_M_ybar3);
NorESM1_M_mrsosf3=NorESM1_M_ybar3./(NorESM1_M_ybar1+NorESM1_M_ybar2+NorESM1_M_ybar3);
% Model's SSM_n with the original spatial resolution
NorESM1_M_mrsosF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
NorESM1_M_mrsosF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
NorESM1_M_mrsosF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's SSM_n to the same as SMAP
NorESM1_M_new_mrsosf1=SMAP_resolution(SMAP1,NorESM1_M_mrsosf1,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_mrsosf2=SMAP_resolution(SMAP2,NorESM1_M_mrsosf2,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_mrsosf3=SMAP_resolution(SMAP3,NorESM1_M_mrsosf3,NorESM1_M_latData,NorESM1_M_lonData);
% Change model's SSM_n has same surface coverage as SMAP
NorESM1_M_new_mF1=knn_mean(SMF_template,NorESM1_M_new_mrsosf1,1);
NorESM1_M_new_mF2=knn_mean(SMF_template,NorESM1_M_new_mrsosf2,1);
NorESM1_M_new_mF3=knn_mean(SMF_template,NorESM1_M_new_mrsosf3,1);

% % ET_n of NorESM1_M (hfls)
% Get ET_n over different time scales
N=20440;
Fs=1;
NorESM1_M_hflsA(20440,13824)=0;
count=1;
for q=1:96
    for p=1:144
        C=hflsData(p,q,:);
        NorESM1_M_hflsA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
NorESM1_M_hflsA=single(NorESM1_M_hflsA);
[row,col] = size(NorESM1_M_hflsA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(NorESM1_M_hflsA(:,i));
end
dA=single(dA);
A1=dA(:,1:4608);
Y1=fft(A1);
Y1=Y1(1:10220,:);
A2=dA(:,4609:9216);
Y2=fft(A2);
Y2=Y2(1:10220,:);
A3=dA(:,9217:13824);
Y3=fft(A3);
Y3=Y3(1:10220,:);
Y=[Y1,Y2,Y3];
NorESM1_M_hflsAyy=abs(Y).^2;
NorESM1_M_hflsAyy=NorESM1_M_hflsAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
NorESM1_M_ybar1=sum(NorESM1_M_hflsAyy(b:a,:));
YBAR1=reshape(NorESM1_M_ybar1,[144,96]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
NorESM1_M_ybar2=sum(NorESM1_M_hflsAyy(c:b,:));
YBAR2=reshape(NorESM1_M_ybar2,[144,96]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
NorESM1_M_ybar3=sum(NorESM1_M_hflsAyy(d:c,:));
YBAR3=reshape(NorESM1_M_ybar3,[144,96]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
NorESM1_M_hflsf1=NorESM1_M_ybar1./(NorESM1_M_ybar1+NorESM1_M_ybar2+NorESM1_M_ybar3);
NorESM1_M_hflsf2=NorESM1_M_ybar2./(NorESM1_M_ybar1+NorESM1_M_ybar2+NorESM1_M_ybar3);
NorESM1_M_hflsf3=NorESM1_M_ybar3./(NorESM1_M_ybar1+NorESM1_M_ybar2+NorESM1_M_ybar3);
% Model's ET_n with the original spatial resolution
NorESM1_M_hflsF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
NorESM1_M_hflsF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
NorESM1_M_hflsF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
NorESM1_M_new_hflsf1=SMAP_resolution(SMAP1,NorESM1_M_hflsf1,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_hflsf2=SMAP_resolution(SMAP2,NorESM1_M_hflsf2,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_hflsf3=SMAP_resolution(SMAP3,NorESM1_M_hflsf3,NorESM1_M_latData,NorESM1_M_lonData);
% Change model's ET_n has same surface coverage as SMAP
NorESM1_M_new_hF1=knn_mean(SMF_template,NorESM1_M_new_hflsf1,1);
NorESM1_M_new_hF2=knn_mean(SMF_template,NorESM1_M_new_hflsf2,1);
NorESM1_M_new_hF3=knn_mean(SMF_template,NorESM1_M_new_hflsf3,1);

% % P_n of NorESM1_M (pr)
% Get P_n over different time scales
N=20440;
Fs=1;
NorESM1_M_prA(20440,13824)=0;
count=1;
for q=1:96
    for p=1:144
        C=prData(p,q,:);
        NorESM1_M_prA(:,count)=C(:);
        count=count+1;
    end
    disp(q)
end
NorESM1_M_prA=single(NorESM1_M_prA);
[row,col] = size(NorESM1_M_prA);
dA(row,col)=0;
for i=1:col
    dA(:,i)=detrend(NorESM1_M_prA(:,i));
end
dA=single(dA);
A1=dA(:,1:4608);
Y1=fft(A1);
Y1=Y1(1:10220,:);
A2=dA(:,4609:9216);
Y2=fft(A2);
Y2=Y2(1:10220,:);
A3=dA(:,9217:13824);
Y3=fft(A3);
Y3=Y3(1:10220,:);
Y=[Y1,Y2,Y3];
NorESM1_M_prAyy=abs(Y).^2;
NorESM1_M_prAyy=NorESM1_M_prAyy/(N/2);
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
NorESM1_M_ybar1=sum(NorESM1_M_prAyy(b:a,:));
YBAR1=reshape(NorESM1_M_ybar1,[144,96]);
Fybar1=YBAR1.';
FYBAR1=flipud(Fybar1);
NorESM1_M_ybar2=sum(NorESM1_M_prAyy(c:b,:));
YBAR2=reshape(NorESM1_M_ybar2,[144,96]);
Fybar2=YBAR2.';
FYBAR2=flipud(Fybar2);
NorESM1_M_ybar3=sum(NorESM1_M_prAyy(d:c,:));
YBAR3=reshape(NorESM1_M_ybar3,[144,96]);
Fybar3=YBAR3.';
FYBAR3=flipud(Fybar3);
NorESM1_M_prf1=NorESM1_M_ybar1./(NorESM1_M_ybar1+NorESM1_M_ybar2+NorESM1_M_ybar3);
NorESM1_M_prf2=NorESM1_M_ybar2./(NorESM1_M_ybar1+NorESM1_M_ybar2+NorESM1_M_ybar3);
NorESM1_M_prf3=NorESM1_M_ybar3./(NorESM1_M_ybar1+NorESM1_M_ybar2+NorESM1_M_ybar3);
% Model's Pr_n with the original spatial resolution
NorESM1_M_prF1=FYBAR1./(FYBAR1+FYBAR2+FYBAR3);
NorESM1_M_prF2=FYBAR2./(FYBAR1+FYBAR2+FYBAR3);
NorESM1_M_prF3=FYBAR3./(FYBAR1+FYBAR2+FYBAR3);
% Change the spatial resolution of the model's ET_n to the same as SMAP
NorESM1_M_new_prf1=SMAP_resolution(SMAP1,NorESM1_M_prf1,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_prf2=SMAP_resolution(SMAP2,NorESM1_M_prf2,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_prf3=SMAP_resolution(SMAP3,NorESM1_M_prf3,NorESM1_M_latData,NorESM1_M_lonData);
% Change model's ET_n has same surface coverage as SMAP
NorESM1_M_new_pF1=knn_mean(SMF_template,NorESM1_M_new_prf1,1);
NorESM1_M_new_pF2=knn_mean(SMF_template,NorESM1_M_new_prf2,1);
NorESM1_M_new_pF3=knn_mean(SMF_template,NorESM1_M_new_prf3,1);

% % % Spectral slope of NorESM1_M (SSM_kw, ET_kw, Pr_kw)
% get the cutoff frequencies
N=20440;
Fs=1;
F=((1:N)-1)*Fs/N;
x=F(1:N/2);
a=find(abs(x-1/7)<=0.00001);
b=find(abs(x-1/30)<=0.00002);
c=find(abs(x-1/90)<=0.00001);
d=find(abs(x-1/365)<=0.00001);
% % SSM_kw of NorESM1_M (mrsos)
% Get SSM_kw over different time scales
[NorESM1_M_mrsosp1,NorESM1_M_mrsosP1]=spectral_slope(NorESM1_M_mrsosA,NorESM1_M_latData,NorESM1_M_lonData,b,a,N,Fs);
[NorESM1_M_mrsosp2,NorESM1_M_mrsosP2]=spectral_slope(NorESM1_M_mrsosA,NorESM1_M_latData,NorESM1_M_lonData,c,b,N,Fs);
[NorESM1_M_mrsosp3,NorESM1_M_mrsosP3]=spectral_slope(NorESM1_M_mrsosA,NorESM1_M_latData,NorESM1_M_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's SSM_kw to the same as SMAP
NorESM1_M_new_mrsosp1=SMAP_resolution(SMAP1,NorESM1_M_mrsosp1,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_mrsosp2=SMAP_resolution(SMAP2,NorESM1_M_mrsosp2,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_mrsosp3=SMAP_resolution(SMAP3,NorESM1_M_mrsosp3,NorESM1_M_latData,NorESM1_M_lonData);
% Change model's SSM_kw has same surface coverage as SMAP
NorESM1_M_new_mP1=knn_mean(SMF_template,NorESM1_M_new_mrsosp1,1);
NorESM1_M_new_mP2=knn_mean(SMF_template,NorESM1_M_new_mrsosp2,1);
NorESM1_M_new_mP3=knn_mean(SMF_template,NorESM1_M_new_mrsosp3,1);
% % ET_kw of NorESM1_M (hfls)
% Get ET_kw over different time scales
[NorESM1_M_hflsp1,NorESM1_M_hflsP1]=spectral_slope(NorESM1_M_hflsA,NorESM1_M_latData,NorESM1_M_lonData,b,a,N,Fs);
[NorESM1_M_hflsp2,NorESM1_M_hflsP2]=spectral_slope(NorESM1_M_hflsA,NorESM1_M_latData,NorESM1_M_lonData,c,b,N,Fs);
[NorESM1_M_hflsp3,NorESM1_M_hflsP3]=spectral_slope(NorESM1_M_hflsA,NorESM1_M_latData,NorESM1_M_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's ET_kw to the same as SMAP
NorESM1_M_new_hflsp1=SMAP_resolution(SMAP1,NorESM1_M_hflsp1,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_hflsp2=SMAP_resolution(SMAP2,NorESM1_M_hflsp2,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_hflsp3=SMAP_resolution(SMAP3,NorESM1_M_hflsp3,NorESM1_M_latData,NorESM1_M_lonData);
% Change model's ET_kw has same surface coverage as SMAP
NorESM1_M_new_hP1=knn_mean(SMF_template,NorESM1_M_new_hflsp1,1);
NorESM1_M_new_hP2=knn_mean(SMF_template,NorESM1_M_new_hflsp2,1);
NorESM1_M_new_hP3=knn_mean(SMF_template,NorESM1_M_new_hflsp3,1);
% % Pr_kw of NorESM1_M (pr)
% GPr Pr_kw over different time scales
[NorESM1_M_prp1,NorESM1_M_prP1]=spectral_slope(NorESM1_M_prA,NorESM1_M_latData,NorESM1_M_lonData,b,a,N,Fs);
[NorESM1_M_prp2,NorESM1_M_prP2]=spectral_slope(NorESM1_M_prA,NorESM1_M_latData,NorESM1_M_lonData,c,b,N,Fs);
[NorESM1_M_prp3,NorESM1_M_prP3]=spectral_slope(NorESM1_M_prA,NorESM1_M_latData,NorESM1_M_lonData,d,c,N,Fs);
% Change the spatial resolution of the model's Pr_kw to the same as SMAP
NorESM1_M_new_prp1=SMAP_resolution(SMAP1,NorESM1_M_prp1,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_prp2=SMAP_resolution(SMAP2,NorESM1_M_prp2,NorESM1_M_latData,NorESM1_M_lonData);
NorESM1_M_new_prp3=SMAP_resolution(SMAP3,NorESM1_M_prp3,NorESM1_M_latData,NorESM1_M_lonData);
% Change model's Pr_kw has same surface coverage as SMAP
NorESM1_M_new_pP1=knn_mean(SMF_template,NorESM1_M_new_prp1,1);
NorESM1_M_new_pP2=knn_mean(SMF_template,NorESM1_M_new_prp2,1);
NorESM1_M_new_pP3=knn_mean(SMF_template,NorESM1_M_new_prp3,1);