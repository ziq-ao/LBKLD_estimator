function [u]=Copy_of_u_lb_prior_half_partition(x0,x1,x2,d,n_myes,Nmax)
if min(d)<0||max(d)>50
    u=0;
    return
end
d=floor(d./0.1)+1;
[m,~]=size(x0);
n=length(d);
x0=x0(:,d)+rand(m,n)-0.5;
x1=x1(:,d)+rand(m,n)-0.5;
x2=x2(:,d)+rand(m,n)-0.5;
h1=ksgest(x0,1,n_myes);
N=length(x0);
idx=ones(1,N);
for i=2:Nmax
    idx1 = kmeans(zscore(x0),i,'MaxIter',200,'Distance','cityblock');
    for j=1:i
        w(j)=sum(idx1==j)/N;
    end
    if min(w)>0.1&&i<Nmax
        idx = idx1;
    else
        Nmax=i-1;
        break
    end
end
for i=1:Nmax
    h2(i)=sum(idx==i)/N*(ksgest((x1(idx==i,:)-x2(idx==i,:)),1,n_myes));
end
u=h1-sum(h2)+length(d)*log(2^0.5);


%     plot(x0(idx==1,1),x0(idx==1,2),'.b')
%     hold on
%     plot(x0(idx==2,1),x0(idx==2,2),'.r')
%     hold on
%         plot(x0(idx==3,1),x0(idx==3,2),'.y')
%     hold on
%         plot(x0(idx==4,1),x0(idx==4,2),'.g')
%     hold on
%         plot(x0(idx==5,1),x0(idx==5,2),'.k')
%     hold on
% %     
%     for i=1:Nmax
%         figure
%         plotmatrix(x1(idx==i,:)-x2(idx==i,:))
%     end
% 
%     figure
%         plot(x1(idx==1,1)-x2(idx==1,1),x1(idx==1,2)-x2(idx==1,2),'.b')
%     figure
%     plot(x1(idx==2,1)-x2(idx==2,1),x1(idx==2,2)-x2(idx==2,2),'.r')
%     figure
%         plot(x1(idx==3,1)-x2(idx==3,1),x1(idx==3,2)-x2(idx==3,2),'.y')
%     figure
%         plot(x1(idx==4,1)-x2(idx==4,1),x1(idx==4,2)-x2(idx==4,2),'.g')
%     figure
%         plot(x1(idx==5,1)-x2(idx==5,1),x1(idx==5,2)-x2(idx==5,2),'.k')
%    
