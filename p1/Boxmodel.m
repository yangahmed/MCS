%Time of run.
T=100;

%Number of particles
N=50;

%Simulation of Ehrenfest model
%x is number in box x
%Runs the simulation R times
R=5;
for j=1:R
    
    %Initial conditions
    x(1)=round(rand);
    for t=1:T-1
        if rand<x(t)/N 
            %Leave
            x(t+1)=x(t)-1;
        else
            x(t+1)=x(t)+1;
        end
    end
    figure(1)
    plot([1:T],x,'b')
    hold on
    ylabel('Particles in Box X')
    xlabel('Time')
    xr(j)=x(end);
end
baseFormat(gcf,gca)

figure(2)
hist(xr,[0:1:50])
ylabel('Frequency Count')
xlabel('Number of Particles')
axis([0 50 0 R/2])
hold on
plot([0:1:50],binopdf([0:1:N],N,0.5)*R,'r')
baseFormat(gcf,gca)



% %Mean-field approximation
xm(1)=1;
for t=1:T-1
        xm(t+1)=xm(t)+1-2*xm(t)/N;
end
figure(1)
plot([1:T],xm,'r')
ylabel('Particles in Box X')
xlabel('Time')
baseFormat(gcf,gca)



