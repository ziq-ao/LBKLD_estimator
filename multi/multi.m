function y=multi(theta,d)
miu=betapdf(theta,2,d);
[m,n]=size(miu);
y=miu.*(1+0.05*randn(m,n))+0.05*randn(m,n);
