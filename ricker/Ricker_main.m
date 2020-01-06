clear

load ricker_mdl_data

% % or
% % Generate summary statistics
% for i=1:10000
%     logr=3+2*rand;
%     sigma=0.6*rand;
%     phi=5+10*rand;
%     theta(i,:)=[logr sigma phi];
%     [N,y]=Ricker(1,logr,sigma,phi);
%     s1(i)=sum(y==0)+rand-0.5;
%     s2(i)=mean(y+rand(1,50)-0.5);
%     s3(i)=autocov(y,0);
%     s4(i)=autocov(y,1);
%     s5(i)=autocov(y,2);
%     s6(i)=autocov(y,3);
%     s7(i)=autocov(y,4);
%     s8(i)=autocov(y,5);
%     s9(:,i)=cubic(y);
%     s10(:,i)=autore(y);
%     
%     [N,y]=Ricker(1,logr,sigma,phi);
%     s11(i)=sum(y==0);
%     s12(i)=mean(y+rand(1,50)-0.5);
%     s13(i)=autocov(y,0);
%     s14(i)=autocov(y,1);
%     s15(i)=autocov(y,2);
%     s16(i)=autocov(y,3);
%     s17(i)=autocov(y,4);
%     s18(i)=autocov(y,5);
%     s19(:,i)=cubic(y);
%     s110(:,i)=autore(y);
%     
%     [N,y]=Ricker(1,logr,sigma,phi);
%     s21(i)=sum(y==0)+rand-0.5;
%     s22(i)=mean(y+rand(1,50)-0.5);
%     s23(i)=autocov(y,0);
%     s24(i)=autocov(y,1);
%     s25(i)=autocov(y,2);
%     s26(i)=autocov(y,3);
%     s27(i)=autocov(y,4);
%     s28(i)=autocov(y,5);
%     s29(:,i)=cubic(y);
%     s210(:,i)=autore(y);
% end
% sx=[s1;s2;s3;s4;s5;s6;s7;s8;s9;s10]';
% sx1=[s11;s12;s13;s14;s15;s16;s17;s18;s19;s110]';
% sx2=[s21;s22;s23;s24;s25;s26;s27;s28;s29;s210]';

% Computer LB-KLD with prior partition
u_ricker_lbkld=zeros(13);
for j=1:13
    for i=1:13
        if i>j
            u_ricker_lbkld(i,j)=lbkld(sx,sx1,sx2,[j i],5);
        else
            u_ricker_lbkld(i,j)=nan;
        end
    end
end
figure(1)
h1=heatmap(u_ricker_lbkld,'Colormap',parula,'MissingDataColor','w','ColorbarVisible','off');
xlabel('d_1')
ylabel('d_2')

% Computer D-posterior utility
u_ricker_abc=zeros(13);
for j=1:13
    for i=1:13
        if i>j
            u_ricker_abc(i,j)=u_abc(theta,sx,[j,i]);
        else
            u_ricker_abc(i,j)=nan;
        end
        
    end
end
figure(2)
h2=heatmap(u_ricker_abc,'Colormap',parula,'MissingDataColor','w','ColorbarVisible','off');
xlabel('d_1')
ylabel('d_2')


