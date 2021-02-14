
%Simulation
%Time steps
T=1000;
%Number of individuals.
N=100;


pvals=[0.01:0.01:1]
numreps=100;
hrange=[0:1:N];

histu=zeros(length(pvals),length(hrange));


count=0;
for p=pvals
    uall=[];
    count=count+1

    for rep=1:numreps
        u=runvoter(p,N,T);
        finalu(count,rep)=u(end);
        
        %Store the last half of the simulation
        uall=[uall ; u(end/2:end)];
    end
    %Take the histogram 
    histu(count,:)=hist(uall,hrange);
end


figure(2)
imagesc(pvals,hrange,histu'/(numreps*T/2),[0 0.1])
hlx=xlabel('Propbability of switching: p')
hlx=ylabel('Stay in EU: u')
colorbar
%baseFormat(gcf,gca)


figure(1)
%Plot the results
count=0;
for p=pvals
    count=count+1;
    p
    for rep=1:numreps
        plot(p,finalu(count,rep),'x')
        hold on
    end
end

%Soluton of mean field model
syms xs p f

x1=0.5*ones(1,101);
sx=solve(xs*(1-xs)-p/(1-p));

p=[0:0.01:1];
x2=eval(sx(1));
x3=eval(sx(2));

figure(1)
plot(p,x1*N,'r');
hold on
plot(p,real(x2)*N,'k');
hold on
plot(p,real(x3)*N,'k');
hlx=xlabel('p')
set(hlx,'FontSize',24);
hlx=ylabel('u_*')
set(hlx,'FontSize',24);
%baseFormat(gcf,gca)