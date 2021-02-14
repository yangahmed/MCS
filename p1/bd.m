clear;
close all;

T=2000;
numreps=10;
p=0.5;

n=1000;
b=10;

count=0;

for d=[1:1:10]
    for b=[10]
        count=count+1
        for rep=1:numreps
            pop=runPopulation2(b,p,d,n,T);
            allpop(:,rep)=pop;
        end

        figure(count)
        pr=plot([1:T],mean(allpop'))
        xlabel('Time steps: t')
        ylabel('Population')
        title(['d=',num2str(d),' b=',num2str(b)])
%         saveas(gcf,[num2str(d),'_',num2str(b),'.jpg'])
    end
end