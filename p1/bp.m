clear;
close all;

T=200;
numreps=10;
p=0.5;

n=100;
b=10;

count=0;

for n=[100 1000 5000]
    for b=[10 18 30 40]
        count=count+1
        for rep=1:numreps
            pop=runPopulation(b,p,n,T);
            allpop(:,rep)=pop;
        end

        figure(count)
        pr=plot([1:T],mean(allpop'))
        set(pr,'LineWidth',2)
        xlabel('Time steps: t')
        ylabel('Population')
        title(['n=',num2str(n),' b=',num2str(b)])
        saveas(gcf,[num2str(n),'_',num2str(b),'.jpg'])
    end
end

