function [N,out]=Ricker(N0,logr,sigma,phi)
N(1)=N0;
y(1)=poissrnd(phi*N0);
for i=2:100
    N(i)=exp(logr+log(N(i-1))-N(i-1)+sigma*randn);
    y(i)=poissrnd(phi*N(i));
end
out=y(1:50);