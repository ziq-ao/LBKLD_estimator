
for j=1:1000
for i=2:100
    d=i;
    theta=rand(1000,1);
    x0=multi(theta,d);
    x1=multi(theta,d);
    x2=multi(theta,d);
    u_multi_lbkld(j,i)=lbkld(x0,x1,x2,1,5);
    u_multi_lbkld_w(j,i)=lbkld(x0,x1,x2,1,1);
end
end


for j=1:100
ind=linspace(2,100,20);
for i=1:20
    d=ind(i);
    theta=rand(10000,1);
    y=multi(theta,d);
    u_multi_abc(j,i)=u_abc(theta,y,1);
end
end

for i=2:100
    d=i;
    u_true(i)=U_kl(d,100000);
end
