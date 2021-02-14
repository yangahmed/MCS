clear;
close all;

T=1000;

p=0.5;
n=1000;

lya=zeros(1,50);

bvals=[1:1:50];
count=0;

for b=bvals
    count=count+1
    a0=runPopulation(b,p,n,100,1);
%     pop=runPopulation(b,p,n,1100);
    pop1=runPopulation(b,p,n,T,a0(end));
    pop2=runPopulation(b,p,n,T,a0(end)+1);
    delta0=1;
    delta=abs(pop2-pop1);
    
    for i=[1:T]
       l(i)=(log(delta(i)/delta0))/i;
    end

%     sum = 0;
%     for i=1:999
%         sum=sum + log(abs(pop(i+101)-pop(i+100))/abs(pop(i+100)-pop(i+99)));
%         l(i)=sum/i;
%     end
    
    lya(count)=l(end);
end

plot(bvals,lya);