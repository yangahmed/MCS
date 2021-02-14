clear;
clc;

n = 100;
T = 10000;

p = 1;
m = 5;

sites = runDistribution(p,m,n,T);


range = [1:1:sites];

figure(1);
% subplot(1,2,1)
h = histogram(sites, range);
title(['p=',num2str(p),' m=',num2str(m)])
bn = 10;
bins = zeros(1,bn);
for i = 1:bn
    bins(i) = 2^i;
end

figure(2);
% subplot(1,2,2)
loglog(h.Values);
title(['p=',num2str(p),' m=',num2str(m)])
hold on