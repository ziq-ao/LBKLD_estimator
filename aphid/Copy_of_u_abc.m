function [u]=Copy_of_u_abc(theta,n,x0,d)
% theta=zscore(theta);
if min(d)<0||max(d)>50
    u=0;
    return
end
d=floor(d./0.1)+1;
rd=randperm(length(x0));
x0=x0(:,d);
% [~,x0,latent] = pca(x0);
x0=zscore(x0);
for i=1:n
    for j=1:length(x0)
        dist(j)=norm((x0(rd(i),:)-x0(j,:)));
    end
    [~,I]=sort(dist);
    u(i)=1/det(cov(theta(I(2:100),:)));
end
