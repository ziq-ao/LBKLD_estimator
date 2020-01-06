function [U]=u_abc(theta,x0,d)
if min(d)<0||max(d)>50
    U=0;
    return
end
d=floor(d./0.1)+1;
x0=x0(:,d);
x0=zscore(x0);
N=size(x0,1);
MdlKDT = KDTreeSearcher(x0);
[IdxKDT,~] = knnsearch(MdlKDT,x0,'K',100,'Distance','euclidean');
for i=1:N
    u(i)=1/det(cov(theta(IdxKDT(i,2:100),:)));
end
U=mean(u);
end