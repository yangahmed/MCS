function x = spatialvoter(p,N,T,pop)
   
%If pop=1 then we just store the population on each time step


%Initial conditions
x=zeros(T,N);
x(1,:)=round(rand(1,N));

for t=1:T-1
    %For each cell
    for i=0:N-1
        %Find your neighbours
        cells=[mod(i-1,N) mod(i+1,N)]+1;
        
        if rand<p
            %Random switch
            x(t+1,i+1)=mod(x(t,i+1)+1,2);
        else
            %If both neighbours the same switch to their color, otherwise
            %stay the same.
                if sum(x(t,cells))==2
                    x(t+1,i+1)=1;
                elseif sum(x(t,cells))==0
                    x(t+1,i+1)=0;
                else
                    x(t+1,i+1)=x(t,i+1);
                end
        end
    end
end

if pop==1
    x=sum(x,2);
end
