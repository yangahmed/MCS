clear
close all 

%Simulation
%Time steps
T=1000;
%Number of individuals.
N=1000;

p=0.001;
q=0.4;
r=0.1;

%
% Make 'phase transition' plot of susceptibles at the end based on recovery rate
%

%Set up paremater values
pvals=[0.001:0.001:0.1];
numreps=100;
hrange=[0:10:N];
histS=zeros(length(pvals),length(hrange));

% Simulate numreps times for each parameter setting
count=0;
for p=pvals
    Sall=[];
    count=count+1

    for rep=1:numreps
        [R,S,B]=runRSB2(p,q,r,N,T);
        finalS(count,rep)=S(end);
        
        Sall=[Sall ; S(end/2:end)];
    end
    %Take the histogram 
%     histS(count,:)=hist(Sall,hrange);
    histS(count,:)=hist(finalS(count,:),hrange);
end

%Plot output as a heatmap/phase transition diagram
figure(4)
imagesc(pvals,hrange,histS'/numreps,[0 0.1])
hlx=xlabel('r')
set(hlx,'FontSize',14);
hlx=ylabel('Number of Sharers: S(1000)')
set(hlx,'FontSize',14);
colorbar