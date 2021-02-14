clear
close all 

%Simulation
%Time steps
T=200;
%Number of individuals.
N=100;





%Simulate 100 times for r=0.5 and plot the results
numreps=100;
r=0.5
for rep=1:numreps
    [S,I,R]=runSIR(r,N,T);
    allI(:,rep)=I;
    allS(:,rep)=S;
    allR(:,rep)=R;
end

figure(101)
hold off
pr=plot([1:T],allI(:,8),'k')
set(pr,'LineWidth',2)
hold on
pr=plot([1:T],allR(:,8),'g')
set(pr,'LineWidth',2)
pr=plot([1:T],allS(:,8),'b')
set(pr,'LineWidth',2)
xlabel('Time steps: t')
ylabel('Number of individuals')
legend('Infectious' , 'Recovered' ,'Susceptible')
axis([0 50 0 100])
%baseFormat(gcf,gca)


%Average behaviour model
figure(1)
for rep=1:numreps
    plot([1:T],allI(:,rep),'k')
    hold on
end

pr=plot([1:T],mean(allI'),'r')
set(pr,'LineWidth',2)
hold off
xlabel('Time steps: t')
ylabel('Number of infected individuals: I(t)')
axis([0 50 0 30])
%baseFormat(gcf,gca)


%Mean-field model
Smf(1)=N-1;
Imf(1)=1;
Rmf(1)=0;

figure(10)

for t=1:T-1
    Imf(t+1)=Imf(t) + Imf(t)*Smf(t)/N - r*Imf(t);
    Smf(t+1)=Smf(t) - Imf(t)*Smf(t)/N 
end
pr=plot([1:T],mean(allI'),'r')
set(pr,'LineWidth',2)
hold on
pr=plot([1:T],Imf,'g')
set(pr,'LineWidth',2)
xlabel('Time steps: t')
ylabel('Number of infected individuals: I(t)')
legend('Mean simulation' , 'Mean-field model')
axis([0 50 0 30])
%baseFormat(gcf,gca)
hold on
pr=plot([1:T],Imf,'g')
    


%
% Make 'phase transition' plot of susceptibles at the end based on recovery rate
%

%Set up paremater values
rvals=[0.01:0.01:1]
numreps=100;
hrange=[0:1:N];
histS=zeros(length(rvals),length(hrange));

% Simulate numreps times for each parameter setting
count=0;
for r=rvals
    uall=[];
    count=count+1

    for rep=1:numreps
        [S,I,R]=runSIR(r,N,T);
        finalS(count,rep)=S(end);
    end
    %Take the histogram 
    histS(count,:)=hist(finalS(count,:),hrange);
end


figure(3)
bar(histS(numreps/2,:)/numreps)
hlx=xlabel('Susceptibles after disease has spread: S(1000)')
set(hlx,'FontSize',14);
hlx=ylabel('Frequency of outcome')
set(hlx,'FontSize',14);
%baseFormat(gcf,gca)



%Plot output as a heatmap/phase transition diagram
figure(4)
imagesc(rvals,hrange,histS'/numreps,[0 0.1])
hlx=xlabel('Recovery rate: r')
set(hlx,'FontSize',14);
hlx=ylabel('Susceptibles after disease has spread: S(1000)')
set(hlx,'FontSize',14);
colorbar
%baseFormat(gcf,gca)


