clear

% N0=28;
% C0=28;
% mu = [2.46*10^-1,1.34*10^-4];
% sigma = [0.0079^2 5.8*10^-8;5.8*10^-8 0.00002^2];
% R = chol(sigma);
% theta = mu + randn(1,2)*R;
% d=0:0.1:50;
% dt=0.0001;
% n=1e4;
% for i=1:n
%     theta = mu + randn(1,2)*R;
%     z(i,:)=theta;
%     x0(i,:)=aphid(N0,C0,dt,d,theta);
%     x1(i,:)=aphid(N0,C0,dt,d,theta);
%     x2(i,:)=aphid(N0,C0,dt,d,theta);
% end

% or
load aphid_data

loss1=@(d)-lbkld(x0,x1,x2,d*50,5);
loss2=@(d)-u_abc(z,x0,d*50);

n_spsa=1000;
c=0.1;
%superparameters of SPSA
a=0.1;
A=n_spsa/20;
alpha=1;
gamma=1/6;
%Begin SPSA

% We recommend to do many repeated runs to avoid the local optimum

% LB-KLD design for k=3
initial=rand(3,1);
[u_aphid_lbkld_3d,y1_3d]=spsa(n_spsa,initial,loss1,a,c,A,alpha,gamma);
u_aphid_lbkld_3d=u_aphid_lbkld_3d*50;

% LB-KLD design for k=4
initial=rand(4,1);
[u_aphid_lbkld_4d,y1_4d]=spsa(n_spsa,initial,loss1,a,c,A,alpha,gamma);
u_aphid_lbkld_4d=u_aphid_lbkld_4d*50;

a=0.1*10^-14;

% D-posterior design for k=3
initial=rand(3,1);
[u_aphid_abc_3d,y2_3d]=spsa(n_spsa,initial,loss2,a,c,A,alpha,gamma);
u_aphid_abc_3d=u_aphid_abc_3d*50;

% D-posterior design for k=4
initial=rand(4,1);
[u_aphid_abc_4d,y2_4d]=spsa(n_spsa,initial,loss2,a,c,A,alpha,gamma);
u_aphid_abc_4d=u_aphid_abc_4d*50;
