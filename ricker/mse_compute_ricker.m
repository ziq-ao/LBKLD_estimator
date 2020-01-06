function [d_mean,d_std]=mse_compute_ricker(d,n,sx1,sx2,theta1)
N=length(sx1);
if N<13
    error('the sample size is smaller than the size of sampling times!')
end
sx1=zscore(sx1(:,d));
sx2=zscore(sx2(:,d));
theta1=(theta1-repmat([3 0 5],N,1))/diag([2 0.6 10]);
MdlKDT = KDTreeSearcher(sx1);
[IdxKDT,~] = knnsearch(MdlKDT,sx2,'K',100,'Distance','euclidean');
for i=1:n
    postmean(i,:)=mean(theta1(IdxKDT(i,2:100),:));
end
for i=1:n
    mse(i,:)=(postmean(i,:)-theta1(i,:)).^2;
end
d_mean=mean(mse);
d_std=std(mse)/sqrt(n);