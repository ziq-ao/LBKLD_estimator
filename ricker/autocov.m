function [c]=autocov(y,k)
n=length(y);
m=mean(y);
c=(y(1:n-k)-m)*(y(k+1:n)-m)'/(n-k);
