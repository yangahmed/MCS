clear
close all 

%Simulation
%Time steps
T=300;
%Number of individuals.
N=100;

%Simulate 1000 times for p=0.001 or q=0.01 and plot the results
numreps=1000;
p=0.001;
q=0.8;
r=0.1;
for rep=1:numreps
    [R,S,B]=runRSB2(p,q,r,N,T);
    allR(:,rep)=R;
    allS(:,rep)=S;
    allB(:,rep)=B;
end

figure(202)
hold off
pr=plot([1:T],allR(:,8),'k')
hold on
pr=plot([1:T],allS(:,8),'g')
pr=plot([1:T],allB(:,8),'b')
xlabel('Time steps: t')
ylabel('Number of individuals')
legend('Resting' , 'Sharer' ,'Bored')
title('Simulation')


%Mean-field model
Rmf(1)=N-2;
Smf(1)=1;
Bmf(1)=1;


for t=1:T-1
    Rmf(t+1)=Rmf(t) - p*Rmf(t) - q*Smf(t)*Rmf(t)/N + r*Bmf(t)*Rmf(t)/N;
    Smf(t+1)=Smf(t) + p*Rmf(t) + q*Smf(t)*Rmf(t)/N - q*Smf(t)*Bmf(t)/N;
    Bmf(t+1)=Bmf(t) + q*Smf(t)*Bmf(t)/N - r*Bmf(t)*Rmf(t)/N;
end

figure(300)
hold off
pr=plot([1:T],Rmf,'k')
set(pr,'LineWidth',2)
hold on
pr=plot([1:T],Smf,'g')
set(pr,'LineWidth',2)
pr=plot([1:T],Bmf,'b')
set(pr,'LineWidth',2)
xlabel('Time steps: t')
ylabel('Number of individuals')
legend('Resting' , 'Sharer' ,'Bored')
title('Mean-field model')


