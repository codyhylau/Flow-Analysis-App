t = xlsread('RE.xlsx');
re = t(:,1);
c = t(:,2);
cut1 = 2; % C
cut2 = 1.1; % C
cut3 = 5e5; % Re
options = optimset('MaxfunEvals',1500,'MaxIter',1500);
f = @(b,x) b(1).*x.^b(2)+b(3); 
hold on

re0 = re(c>=cut1);
c0 = c(c>=cut1);
p0 = polyfit(re0,c0,2);
plot(re0,polyval(p0,re0),'xc')

re1 = re(c<cut1 & c>=cut2);
c1 = c(c<cut1 & c>=cut2);      
B1 = fminsearch(@(b) norm(c1 - f(b,re1)), [22.36, -0.28, 0.5],options);
plot(re1,f(B1,re1),'xr')

re2 = re(c<cut2 & re<=cut3);
c2 = c(c<cut2 & re<=cut3);   
B2 = fminsearch(@(b) norm(c2 - f(b,re2)), [30, -0.5, 0.5],options);
plot(re2, f(B2,re2), 'xg')

re3 = re(re>cut3);
c3 = c(re>cut3);
p3 = polyfit(re3,c3,3);
plot(re3,polyval(p3,re3),'xm')

plot(re, c, 'b')
xlabel('Re')
ylabel('CF')

