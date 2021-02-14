clear;
close all;

T=1000;


%
% Make 'phase transition' plot of susceptibles at the end based on recovery rate
%

%Set up paremater values
evals=[0.1:0.1:6];
numreps=50;
hrange=[0:0.01:1];

histp=zeros(length(evals),length(hrange));
%popall=[];

% Simulate numreps times for each parameter setting
count=0;
for e=evals
    count=count+1

    for rep=1:numreps
        p = Polarisation(e,T);
        allp(count,rep)=p(end);
        
        %popall=[popall ; pop(3*end/4:end)];
    end
    %Take the histogram 
    histp(count,:)=hist(allp(count,:),hrange);
end

%Plot output as a heatmap/phase transition diagram
figure(4)
imagesc(evals,hrange,histp'/numreps,[0 0.3])
hlx=xlabel('e')
set(hlx,'FontSize',14);
hlx=ylabel('Polarisation')
set(hlx,'FontSize',14);
colorbar