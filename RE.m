t = xlsread('RE.xlsx');
re = t(:,1);
c = t(:,2);
figure('units','normalized','outerposition',[0 0 1 1])
hold on

cut1 = 1.8; % C
cut2 = 1.15; % C
cut3 = 4.5e5; % Re

re0 = re(c>=cut1);
c0 = c(c>=cut1);
p0 = polyfit(re0,c0,2);
plot(re0,polyval(p0,re0),'xc')

re1 = re(c<cut1&c>=cut2);
c1 = c(c<cut1&c>=cut2);
p1 = polyfit(re1,c1,5);
plot(re1,polyval(p1,re1),'xr')

re2 = re(c<cut2 & re<=cut3);
c2 = c(c<cut2 & re<=cut3);
p2 = polyfit(re2,c2,5);
plot(re2,polyval(p2,re2),'xg')

re3 = re(re>cut3);
c3 = c(re>cut3);
p3 = polyfit(re3,c3,3);
plot(re3,polyval(p3,re3),'xm')


plot(re,c,'-b')