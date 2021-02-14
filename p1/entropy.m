clear;
close all;

T=1100;

p=0.5;
b=10;
n=1000;

e=zeros(1,50);

bvals=[1:1:50];
count=0;

for b=bvals
    count=count+1
    pop=runPopulation(b,p,n,T);
    data=pop(101:T);
    e(count) = ent(data);
end

plot(bvals,e);
