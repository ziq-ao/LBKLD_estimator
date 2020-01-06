function h=ksgest(y,k,n)
[N,dim]=size(y);
n=min(n,N);
[~,y,latent] = pca(y);
y=y/sqrt(diag(latent));
% A=diag(sqrt(latent));
y=y(randperm(N),:);
MdlKDT = KDTreeSearcher(y);
[IdxKDT,~] = knnsearch(MdlKDT,y,'K',k+1,'Distance','chebychev');
for j=1:n
    r(j,:)=abs(y(j,:)-y(IdxKDT(j,k+1),:));
    hh(j)=log(prod(2*r(j,:)*sqrt(diag(latent))));
end
h=-psi(k)+psi(N)+(dim-1)+mean(hh);