clear;

n = 100;
T = 15000;

p = 0.05;
m = 8;

sites = runDistribution(p,m,n,T);

numreps = 10;
allsites = [];
for reps=1:numreps
    sites = runDistribution(p,m,n,T);
    allsites = [allsites sites];
end

range = [1:1:max(allsites)];
% 
figure(1);
h = histogram(allsites, range);
title(['p=',num2str(p),' m=',num2str(m)]);
bn = 10;
bins = zeros(1,bn);
for i = 1:bn
    bins(i) = 2^i;
end

figure(2);
loglog(h.Values);
hold on
title(['p=',num2str(p),' m=',num2str(m)])

%fitting line
nn = length(allsites);
xmin = min(allsites);
sumln = 0;
for i = 1:nn
    sumln = sumln + log(allsites(i)/xmin);
end

alpha = 1 + nn/sumln;

allalpha(1,m) = alpha;

allalpha(2,m) = 1 + (m+1)/(m*(1-p))

m = m+1;
difflog = [];
for ii=1:length(h.Values)
    if h.Values(ii)~=0
        difflog = [difflog log(h.Values(ii))-(-alpha)*log(ii)];
    end
end

x = [1:1:length(h.Values)];
c = exp(mean(difflog(1:20)));
y = c*x.^(-alpha);
loglog(x,y,'Color','r');
legend('simulation', 'fitting line')
