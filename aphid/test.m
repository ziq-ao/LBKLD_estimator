% x1=[0.1000 0.2000 0.3000 0.4000 0.5000 0.6000 0.7000 0.8000 0.9000 1.0000];
% y1=[2.6610 2.6489 2.6386 2.6299 2.6222 2.6156 2.6097 2.6045 2.5998 2.5956];
% x2=[32 34 36 38 40 42 44 46 48 50];
% y2=[2.5592 2.5628 2.5664 2.5700 2.5735 2.5771 2.5807 2.5842 2.5878 2.5913];
x1=1:50;
y1=u_aphid_lbkld_1d;
x2=1:50;
y2=u_aphid_abc_1d;
hl1 = plot(x1,y1,'-*b');
ax1 = gca;
set(ax1,'XColor','k','YColor','b')
ax2 = axes('Position',get(ax1,'Position'),...           
    'XAxisLocation','bottom',...           
    'YAxisLocation','right',...           
    'Color','none',...           
    'XColor','k','YColor','r');
hl2 = line(x2,y2,'Color','r','Parent',ax2);
hl2.Marker='o';