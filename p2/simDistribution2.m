clc;
clear;

n = 100;
T = 10000;

p = 0.2;
m = 5;

sites = runDistribution2(p,m,n,T);

g = digraph(sites);
[bins,binsize] = conncomp(g, "Type","weak");
cc0 = max(binsize);

%figure(1);
%h = histogram(sum(sites));

%attack type 1
sites1 = sites;
for i=1:100
    d = randi(size(sites1,1));
    sites1(d,:) = [];
    sites1(:,d) = [];
end

g1 = digraph(sites1);
[bins,binsize] = conncomp(g1, "Type","weak");
cc1 = max(binsize);
d1 = cc0 - cc1

%attack type 2
sites2 = sites;
for i=1:100
    sums = sum(sites2);
    d = find(sums == max(sums),1);
    sites2(d,:) = [];
    sites2(:,d) = [];
end

g2 = digraph(sites2);
[bins,binsize] = conncomp(g2, "Type","weak");
cc2 = max(binsize);
d2 = cc0 - cc2
