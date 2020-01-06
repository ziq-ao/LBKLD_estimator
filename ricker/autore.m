function c=autore(y)
X=[y(1:49).^0.3;y(1:49).^0.6]';
mdl = fitlm(X,y(2:50).^0.3,'Intercept',false);
c= mdl.Coefficients.Estimate;