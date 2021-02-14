%Time steps
%The simulation in the lecture was run for 50,000 time steps (takes a few
%hours to run)
T=500;

%Number of cells.
N=100;

pvals=[0.01:0.01:1]
hrange=[0:1:N];

histu=zeros(length(pvals),length(hrange));
    

count=0;
for p=pvals
    count=count+1

    u=spatialvoter(p,N,T,1);

    histu(count,:)=hist(u(end/2:end),hrange);
    
    
    save simspatial
end


figure(5)
imagesc(pvals,hrange,histu'/(T/2),[0 0.08])
hlx=xlabel('p')
set(hlx,'FontSize',24);
hlx=ylabel('u')
set(hlx,'FontSize',24);
colorbar
