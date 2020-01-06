clear

for j=1:100
for i=2:100
    d=i;
    theta=rand(10000,1);
    x0=multi(theta,d);
    x1=multi(theta,d);
    x2=multi(theta,d);
    u_multi_lbkld(j,i)=lbkld(x0,x1,x2,1,5);
    u_multi_lbkld_w(j,i)=lbkld(x0,x1,x2,1,1);
end
end

for i=2:100
    d=i;
    u_true(i)=U_kl(d,100000);
end

figure(1)
plot(2:100,u_true(2:100),'-b','LineWidth',2)
hold on
plot(2:100,mean(u_multi_lbkld_w(:,2:100)),'-.g','LineWidth',2)
plot(2:100,mean(u_multi_lbkld(:,2:100)),'--r','LineWidth',2)
axis([2 100 0 2.5])
xlabel('d')
ylabel('expected utility')
legend('exact','lower bound','lower bound w/ partition')

for j=1:100
ind=linspace(2,100,20);
for i=1:20
    d=ind(i);
    theta=rand(10000,1);
    y=multi(theta,d);
    u_multi_abc(j,i)=u_abc(theta,y,1);
end
end
figure(2)
plot(ind,mean(u_multi_abc),'-b','LineWidth',2)
axis([2 100 0 inf])
xlabel('d')
ylabel('expected utility')


