clear
close all 

%Simulation
%Time steps
T=2000;
%Number of individuals.
N=1000;

%Simulate 1000 times for p=0.001 or q=0.01 and plot the results
numreps=1000;
p=0.001;
q=0.01;
for rep=1:numreps
    [R,S,B]=runRSB(p,q,N,T);
    allR(:,rep)=R;
    allS(:,rep)=S;
    allB(:,rep)=B;
end

figure(101)
hold off
pr=plot([1:T],allR(:,8),'k')
set(pr,'LineWidth',2)
hold on
pr=plot([1:T],allS(:,8),'g')
set(pr,'LineWidth',2)
pr=plot([1:T],allB(:,8),'b')
set(pr,'LineWidth',2)
xlabel('Time steps: t')
ylabel('Number of individuals')
legend('Resting' , 'Sharer' ,'Bored')

%Average behaviour model
figure(1)
for rep=1:numreps
    plot([1:T],allS(:,rep),'k')
    hold on
end

pr=plot([1:T],mean(allS'),'r')
set(pr,'LineWidth',2)
hold off
xlabel('Time steps: t')
ylabel('Number of Sharers: S(t)')


%Mean-field model
Rmf(1)=N-2;
Smf(1)=1;
Bmf(1)=1;

figure(10)

for t=1:T-1
    Rmf(t+1)=Rmf(t) - p*Rmf(t) - q*Smf(t)*Rmf(t)/N;
    Smf(t+1)=Smf(t) + p*Rmf(t) + q*Smf(t)*Rmf(t)/N - q*Smf(t)*Bmf(t)/N;
    Bmf(t+1)=Bmf(t) + q*Smf(t)*Bmf(t)/N;
end
pr=plot([1:T],mean(allS'),'r')
set(pr,'LineWidth',2)
hold on
pr=plot([1:T],Smf,'g')
set(pr,'LineWidth',2)
xlabel('Time steps: t')
ylabel('Number of Sharers: S(t)')
legend('Mean simulation' , 'Mean-field model')
hold on