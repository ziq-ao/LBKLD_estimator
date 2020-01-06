clear
N0=28;
C0=28;
mu = [2.46*10^-1,1.34*10^-4];
sigma = [0.0079^2 5.8*10^-8;5.8*10^-8 0.00002^2];
R = chol(sigma);
theta = mu + randn(1,2)*R;
d=1:0.1:50;
dt=0.0001;
n=1e4;
% for i=1:n
%     theta = mu + randn(1,2)*R;
%     z(i,:)=theta;
%     x0(i,:)=aphid(N0,C0,dt,d,theta);
%     x1(i,:)=aphid(N0,C0,dt,d,theta);
%     x2(i,:)=aphid(N0,C0,dt,d,theta);
% end

% or
load aphid_data

u_aphid_lbkld_1d=zeros(1,50);
u_aphid_abc_1d=zeros(1,50);
for i=1:50
    u_aphid_lbkld_1d(i)=lbkld(x0,x1,x2,i,5);
    u_aphid_abc_1d(i)=u_abc(z,x0,i);
end

% plot the expected utility for d=1
figure(1)
xx1=1:50;
yy1=u_aphid_lbkld_1d;
xx2=1:50;
yy2=u_aphid_abc_1d;
hl1 = plot(xx1,yy1,'-*b');
legend('LB-KLD','Location','northwest')
ax1 = gca;
set(ax1,'XColor','k','YColor','b')
ax2 = axes('Position',get(ax1,'Position'),...
    'XAxisLocation','bottom',...
    'YAxisLocation','right',...
    'Color','none',...
    'XColor','k','YColor','r');
hl2 = line(xx2,yy2,'Color','r','Parent',ax2);
hl2.Marker='o';
legend('ABC','Location','northeast')

u_aphid_lbkld_2d=zeros(50);
u_aphid_abc_2d=zeros(50);
for i=1:50
    for j=1:50
        if i>j
            u_aphid_lbkld_2d(i,j)=lbkld(x0,x1,x2,[j,i],5);
            u_aphid_abc_2d(i,j)=u_abc(z,x0,[j,i]);
        else
            u_aphid_lbkld_2d(i,j)=nan;
            u_aphid_abc_2d(i,j)=nan;
        end
    end
end

figure(2)
h1=heatmap(u_aphid_lbkld_2d,'Colormap',parula,'MissingDataColor','w','ColorbarVisible','off');
xlabel('d_1')
ylabel('d_2')

figure(3)
h2=heatmap(u_aphid_abc_2d,'Colormap',parula,'MissingDataColor','w','ColorbarVisible','off');
xlabel('d_1')
ylabel('d_2')




