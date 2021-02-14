clear;
close all;

T=100;

p=0.5;
b=10;
n=1000;

%
% Make 'phase transition' plot of susceptibles at the end based on recovery rate
%

%Set up paremater values
bvals=[1:1:50];
numreps=100;
hrange=[0:50:5*n];

histpop=zeros(length(bvals),length(hrange));
%popall=[];

% Simulate numreps times for each parameter setting
count=0;
for b=bvals
    count=count+1

    for rep=1:numreps
        pop=runPopulation(b,p,n,T);
        finalpop(count,rep)=pop(end);
        
        %popall=[popall ; pop(3*end/4:end)];
    end
    %Take the histogram 
    histpop(count,:)=hist(finalpop(count,:),hrange);
end

%Plot output as a heatmap/phase transition diagram
figure(4)
imagesc(bvals,hrange,histpop'/numreps,[0 0.1])
hlx=xlabel('b')
set(hlx,'FontSize',14);
hlx=ylabel('Population')
set(hlx,'FontSize',14);
colorbar