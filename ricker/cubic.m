function [c]=cubic(y)
X=[y(2:50)-y(1:49)]';
tbl = table(X,y(2:50)','VariableNames',{'x','y'});
mdl = fitlm(tbl,'y~x^2+x');
c= mdl.Coefficients.Estimate;
