function [out]=aphid(N0,C0,dt,d,theta)
N(1)=N0;
C(1)=C0;
i=1;
d(d<0)=0;
d(d>49)=49;
for t=0:dt:max(d)
    id=rand;
    if id<theta(1)*N(i)*dt
        N(i+1)=N(i)+1;
        C(i+1)=C(i)+1;
    else if id<theta(1)*N(i)*dt+theta(2)*N(i)*C(i)*dt
            N(i+1)=N(i)-1;
            C(i+1)=C(i);
            
        else
            N(i+1)=N(i);
            C(i+1)=C(i);
        end
    end
i=i+1;
end
% x=0:dt:max(d)+dt;
% vq1 = interp1(x,y,d);
% out=vq1;
out=N(floor(d./dt)+1);