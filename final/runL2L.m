clc;
clear;

n = 5;

numreps = 10;
i = 1
pp = [0.001:0.01:1];
for p=pp
    for t = 1:numreps
        L(t) = l2l(p,n);
    end
    finalL(i) = mean(L); 
    i = i+1
end

figure('Renderer', 'painters', 'Position',[10 10 900 600]);
plot(pp,finalL,'o','color','k');
set(findall(gcf,'-property','FontSize'),'FontSize',14)

set(gca,'xscale','log')
xticks([10^-4 10^-3 10^-2 10^-1 10^0])
xticklabels({'0.0001','0.001','0.01','0.1','1'})
axis([0.00009 1 0 1.01])