clear;
close all;

T=500;


%
% Make 'phase transition' plot of susceptibles at the end based on recovery rate
%

%Set up paremater values
evals=[1:0.2:10];
numreps=20;
hrange=[0:0.01:1];

histp=zeros(length(evals),length(hrange));

% Simulate numreps times for each parameter setting
count=0;
for e=evals
    count=count+1

    for rep=1:numreps
        a = Aggregation(e,T);
        alla(count,rep)=a;
        
        %popall=[popall ; pop(3*end/4:end)];
    end
    %Take the histogram 
    hista(count,:)=hist(alla(count,:),hrange);
end

%Plot output as a heatmap/phase transition diagram
figure(4)
imagesc(evals,hrange,hista'/numreps,[0 0.1])
hlx=xlabel('q')
set(hlx,'FontSize',14);
hlx=ylabel('Aggregation')
set(hlx,'FontSize',14);
colorbar