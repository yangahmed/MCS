clear
close all 

%Simulation
%Time steps
T=2000;
%Number of individuals.
N=30;

%Simulate 1000 times for p=0.001 or q=0.01 and plot the results
numreps=100;
p=0.001;
q=0.1;
r=0.001;

[x,R,S,B]=runRSB3(p,q,r,N,T);

M(T) = struct('cdata',[],'colormap',[]);
mymap = [1 0 0
         0 1 0
         0 0 1];
for i=1:T
    imagesc(x(:,:,i));
    caxis([0 2]);
    colormap default
    M(i)=getframe(gcf);
end
movie(M);
    

% for rep=1:numreps
%     [x,R,S,B]=runRSB3(p,q,r,N,T);
%     allR(:,rep)=R;
%     allS(:,rep)=S;
%     allB(:,rep)=B;
% end
% 
% figure(101)
% hold off
% pr=plot([1:T],mean(allR'),'k')
% set(pr,'LineWidth',2)
% hold on
% pr=plot([1:T],mean(allS'),'g')
% set(pr,'LineWidth',2)
% pr=plot([1:T],mean(allB'),'b')
% set(pr,'LineWidth',2)
% xlabel('Time steps: t')
% ylabel('Number of individuals')
% legend('Resting' , 'Sharer' ,'Bored')
% 
% 
% figure(1)
% imagesc(x(:,:,T));
% colormap default
% axis equal