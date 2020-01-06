function [theta1,yy]=spsa(n,initial,loss,a,c,A,alpha,gamma)
theta=initial;
theta1=[theta];
p=length(theta);
yy=[];
for k=1:n
    ak=a/(k+A)^alpha;
    ck=c/k^gamma;
    delta=2*round(rand(p,1))-1;
    thetaplus=theta+ck*delta;
    thetaminus=theta-ck*delta;
    yplus=loss(thetaplus);
    yminus=loss(thetaminus);
    yy=[yy,(yplus+yminus)/2];
    ghat=(yplus-yminus)./(2*ck*delta);
    theta=theta-ak*ghat;
    signal=((theta>1))+((theta<0));
    theta=theta+ak*ghat.*signal;
    theta1=[theta1,theta];
end


