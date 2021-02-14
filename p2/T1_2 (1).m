clf;
clear all
timesteps=10000;
N=100;
a=ones(1,N);
p=0.3;
Sp=1-04;
run=100;
m=3
turn=1;
F_a=zeros(1,10100);
%Extended=N;
sum=100;
for r=1:100
    sum=100;
    for i=1:timesteps
       j=1;
       probB=rand(1,1);
       if probB>p
            rVector= randperm(numel(a));
            index = rVector(1:m);
            for g=1:m
                a(index(g))=a(index(g))+1;
            end
       else 
            index=randi(sum);
            index1=index/sum;
            add=0;
           while(add<index1)
                add=add+a(j)/sum;
                j=j+1;
           end
            a(j-1)=a(j-1)+1;
       end 
       sum=sum+1;
       if(numel(a)<10100)
           a = [a 1];
       end
    end    
    %sum=0;
    turn
    turn=turn+1;
    F_a(r,:)=a(1,:);
    a(1,:)=ones(numel(a),1);
end
%% matrix to row vector
F_a=reshape(F_a,1,[]);

range=[1:1:timesteps];
h=histogram(F_a,range);

% % % %%Neuman Method
 Iterations=numel(h.Values);
 xmin=min(F_a);
 sum=0;
 for i=1:Iterations
    sum=sum+log(F_a(i)/xmin); 
 end
 alpha=1+Iterations/sum;
 difflog = [];
 for i=1:numel(h.Values)
     if h.Values(i)~=0
         difflog = [difflog log(h.Values(i))-(-alpha)*log(i)];
     end
 end
 x = [1:1:numel(h.Values)];
 c = exp(mean(difflog(1:20)));
 y = c*x.^(-alpha);
 
 figure(2)
 bn = 10;
 %x = [0:1:bn];
 bins = zeros(1, bn);
     for i = 1:bn
         bins(i) = 2^i;
     end
 h = hist(F_a,bins);
 loglog(bins, h );
 hold on
 grid on;
 title(num2str(bn));
 loglog(x,y,'Color','r');
 
% % %% Figure of histogram
%  
% % 
%    %h=histogram(F_a);
%    %loglog(h.Values)
% %   histogram(h)
% %  
%  figure(3);
% %  loglog(h.Values)
% %  grid on;
% %  hold on
%   loglog(x,y,'Color','r');