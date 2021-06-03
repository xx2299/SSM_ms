function [model_new_f]=SMAP_resolution(SMAP_f,model_f,latData,lonData)
[q,~]=size(latData);
[p,~]=size(lonData);
m=lonData(p);
ori_lon=linspace(-m/2,m/2,p);
ori_lon=ori_lon.';
model_lon1=ori_lon(1:p/2,1);
model_lon2=ori_lon((p/2+1):p,1);
model_lon=[model_lon2;model_lon1];
count=1;
for i=1:q
    model_lat_D(count:count+(p-1),1)=latData(i,1);
    model_lon_D(count:count+(p-1),1)=model_lon;
    count=count+p;
end
model_f_T=model_f.';
model_alpha=[model_lat_D,model_lon_D,model_f_T];
[m1,~]=size(model_alpha);
[m2,~]=size(SMAP_f);
dif(m1,1)=0;
model_new_P(m2,1)=0;
for j=1:m2
    count=1;
    for i=1:m1
        dif(count,1)=abs(model_alpha(i,1)-SMAP_f(j,1))+abs(model_alpha(i,2)-SMAP_f(j,2));
        count=count+1;
    end
    [~,idx]=min(dif);
    model_new_P(j,1)=model_alpha(idx,3);
    disp(j)
end
new_P=reshape(model_new_P,[964,406]);
model_new_f=new_P.';
end