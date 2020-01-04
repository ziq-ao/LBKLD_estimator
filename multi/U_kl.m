function u=U_kl(d,n)
theta=rand(n,1);
miu=betapdf(theta,2,d);
sigma1=0.05;
sigma2=0.05;
y=miu.*(1+sigma1*randn(n,1))+sigma2*randn(n,1);
sigma=sqrt((miu*sigma1).^2+sigma2^2);
p_out=normpdf(y-miu,0,sigma);

parfor i=1:n
    p_in=ones(n,1);
    p_in=normpdf(y(i)-miu,0,sigma);
    p_in1(i)=mean(p_in);
end

u=mean(log(p_out)-log(p_in1)');
end