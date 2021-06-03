function [model_p,model_P]=spectral_slope(model_A,latData,lonData,f_low,f_high,N,Fs)

F=((1:N)-1)*Fs/N;
x=F(1:N/2);
[m1,n1]=size(model_A);
[m2,~]=size(latData);
[n2,~]=size(lonData);
model_p(1,n1)=0;
count=1;
for i=1:n1
    temp1=model_A(:,i);
    temp2=isnan(model_A(:,i));
    if  max(temp1)-min(temp1)==0 || sum(temp2)==N
        model_p(1,count)=nan;
    else
        A=model_A(:,i);
        var=sum((A(:,1)-mean(A)).^2)/length(A);
        Y=fft(A);
        Y=Y(1:(m1/2),:);
        Ayy=abs(Y).^2;
        Ayy=Ayy/(N/2)/var;
        X=[ones(length(Ayy),1),x'];
        p1=polyfit(log(X(f_low:f_high,2)),log(Ayy(f_low:f_high)),1);
        model_p(1,count)=p1(1);
    end
    count=count+1;
    disp(i)
end
mrsosp11=reshape(model_p,[n2,m2]);
p11=rot90(mrsosp11);
P1=p11(:,1:(n2/2));
P2=p11(:,(n2/2+1):n2);
model_P=[P2 P1];

end