clear
load ricker_mdl_data
n=1000;

% select the design condition here
d=[1,2];
% d=[2 3];

sx11=zscore(sx1(:,d));
sx22=zscore(sx2(:,d));
theta1=theta;
MdlKDT = KDTreeSearcher(sx11);
[IdxKDT,~] = knnsearch(MdlKDT,sx22,'K',100,'Distance','euclidean');
for i=1:n
    postmean(i,:)=mean(theta1(IdxKDT(i,2:100),:));
end
figure
for i=1:3
    subplot(1,3,i)
    plot(theta1(1:n,i),postmean(1:n,i),'.')
    hold on
    switch i
        case 1
            plot(3:0.01:5,3:0.01:5,'LineWidth',2)
            xlabel('logr')
            ylabel('mean of posterior')
        case 2
            plot(0:0.01:0.6,0:0.01:0.6,'LineWidth',2)
            xlabel('\sigma')
        case 3
            plot(5:0.01:15,5:0.01:15,'LineWidth',2)     
            xlabel('\phi')
    end
end
